-- =============================================================================
-- PharmaLingo Backend Migration v8 — OSRS-Inspired Exponential Leveling
-- Run this in your Supabase SQL Editor AFTER migration_v7_xp_repeat_limits.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Helper function: compute_level(total_xp)
--    OSRS-inspired formula: xp_between_levels(L) = floor(L + 300 * 2^(L/7))
--    Cumulative XP for level N = sum of xp_between_levels(1..N-1)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION compute_level(p_total_xp INT)
RETURNS INT
LANGUAGE plpgsql IMMUTABLE
AS $$
DECLARE
    v_level INT := 1;
    v_cumulative INT := 0;
    v_next_chunk INT;
BEGIN
    LOOP
        v_next_chunk := FLOOR(v_level + 300.0 * POWER(2.0, v_level::FLOAT / 7.0))::INT;
        IF v_cumulative + v_next_chunk > p_total_xp THEN
            RETURN v_level;
        END IF;
        v_cumulative := v_cumulative + v_next_chunk;
        v_level := v_level + 1;
        IF v_level > 200 THEN
            RETURN v_level;
        END IF;
    END LOOP;
END;
$$;

-- ---------------------------------------------------------------------------
-- 2. Update apply_quiz_completion to use compute_level instead of flat /500
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION apply_quiz_completion(
    p_subsection_id TEXT,
    p_score FLOAT,
    p_correct_count INT,
    p_total_count INT,
    p_xp_earned INT,
    p_coins_earned INT,
    p_idempotency_key TEXT,
    p_mark_learning_seen BOOLEAN DEFAULT FALSE
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_row profiles%ROWTYPE;
    v_completed JSONB;
    v_stars JSONB;
    v_seen JSONB;
    v_cur_star INT;
    v_today DATE := CURRENT_DATE;
    v_last_active DATE;
    v_days_diff INT;
    v_new_streak INT;
    v_new_saves INT;
    v_cur_week INT;
    v_cur_year INT;
    v_cur_month INT;
    v_already_exists BOOLEAN;
BEGIN
    SELECT EXISTS(
        SELECT 1 FROM xp_events WHERE user_id = v_uid AND idempotency_key = p_idempotency_key
    ) INTO v_already_exists;

    IF v_already_exists THEN
        SELECT to_jsonb(p) INTO STRICT v_row FROM profiles p WHERE p.id = v_uid;
        RETURN to_jsonb(v_row);
    END IF;

    SELECT * INTO v_row FROM profiles WHERE id = v_uid FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Profile not found';
    END IF;

    INSERT INTO xp_events (user_id, idempotency_key, xp_awarded, coins_awarded, event_type)
    VALUES (v_uid, p_idempotency_key, p_xp_earned, p_coins_earned, 'quiz_completion');

    v_row.questions_answered := v_row.questions_answered + p_total_count;
    v_row.questions_correct := v_row.questions_correct + p_correct_count;

    v_completed := v_row.completed_subsections::JSONB;
    v_stars := v_row.subsection_stars::JSONB;
    v_seen := v_row.has_seen_learning::JSONB;

    IF p_score >= 0.8 THEN
        IF NOT v_completed @> to_jsonb(p_subsection_id) THEN
            v_completed := v_completed || to_jsonb(ARRAY[p_subsection_id]);
        END IF;
        v_cur_star := COALESCE((v_stars ->> p_subsection_id)::INT, 0);
        IF v_cur_star < 5 THEN
            v_stars := jsonb_set(v_stars, ARRAY[p_subsection_id], to_jsonb(v_cur_star + 1));
        END IF;
    END IF;

    IF p_mark_learning_seen AND NOT v_seen @> to_jsonb(p_subsection_id) THEN
        v_seen := v_seen || to_jsonb(ARRAY[p_subsection_id]);
    END IF;

    v_cur_week := EXTRACT(WEEK FROM v_today)::INT;
    v_cur_year := EXTRACT(YEAR FROM v_today)::INT;
    v_cur_month := EXTRACT(MONTH FROM v_today)::INT;

    IF v_row.weekly_xp_reset_year IS NULL OR v_row.weekly_xp_reset_year < v_cur_year
       OR (v_row.weekly_xp_reset_year = v_cur_year AND v_row.weekly_xp_reset_week < v_cur_week) THEN
        v_row.weekly_xp := 0;
        v_row.weekly_xp_reset_week := v_cur_week;
        v_row.weekly_xp_reset_year := v_cur_year;
    END IF;

    IF v_row.monthly_xp_reset_year IS NULL OR v_row.monthly_xp_reset_year < v_cur_year
       OR (v_row.monthly_xp_reset_year = v_cur_year AND v_row.monthly_xp_reset_month < v_cur_month) THEN
        v_row.monthly_xp := 0;
        v_row.monthly_xp_reset_month := v_cur_month;
        v_row.monthly_xp_reset_year := v_cur_year;
    END IF;

    v_row.total_xp := v_row.total_xp + p_xp_earned;
    v_row.weekly_xp := v_row.weekly_xp + p_xp_earned;
    v_row.monthly_xp := v_row.monthly_xp + p_xp_earned;
    v_row.coins := v_row.coins + p_coins_earned;

    v_last_active := (v_row.last_active_date AT TIME ZONE 'UTC')::DATE;
    v_new_streak := v_row.current_streak;
    v_new_saves := v_row.streak_saves;

    IF v_last_active IS NULL THEN
        v_new_streak := 1;
    ELSE
        v_days_diff := v_today - v_last_active;
        IF v_days_diff = 0 THEN
            IF v_new_streak = 0 THEN v_new_streak := 1; END IF;
        ELSIF v_days_diff = 1 THEN
            v_new_streak := v_new_streak + 1;
        ELSIF v_days_diff = 2 AND v_new_saves > 0 THEN
            v_new_saves := v_new_saves - 1;
            v_new_streak := v_new_streak + 1;
        ELSE
            v_new_streak := 1;
        END IF;
    END IF;

    UPDATE profiles SET
        total_xp = v_row.total_xp,
        weekly_xp = v_row.weekly_xp,
        monthly_xp = v_row.monthly_xp,
        weekly_xp_reset_week = v_row.weekly_xp_reset_week,
        weekly_xp_reset_year = v_row.weekly_xp_reset_year,
        monthly_xp_reset_month = v_row.monthly_xp_reset_month,
        monthly_xp_reset_year = v_row.monthly_xp_reset_year,
        coins = v_row.coins,
        current_streak = v_new_streak,
        streak_saves = v_new_saves,
        questions_answered = v_row.questions_answered,
        questions_correct = v_row.questions_correct,
        completed_subsections = v_completed::TEXT,
        subsection_stars = v_stars::TEXT,
        has_seen_learning = v_seen::TEXT,
        last_active_date = NOW(),
        level = compute_level(v_row.total_xp)
    WHERE id = v_uid;

    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 3. Backfill: recalculate all existing user levels using the new formula
-- ---------------------------------------------------------------------------
UPDATE profiles SET level = compute_level(total_xp);
