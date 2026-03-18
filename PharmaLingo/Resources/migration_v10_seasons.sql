-- =============================================================================
-- PharmaLingo Backend Migration v10 — Server-Authoritative Seasons
-- Run this in your Supabase SQL Editor AFTER migration_v9_app_events.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Weekly League Tables
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS weekly_league_seasons (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    week_start DATE NOT NULL UNIQUE,
    week_end DATE NOT NULL,
    finalized BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS weekly_league_entries (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    season_id UUID NOT NULL REFERENCES weekly_league_seasons(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    bracket INT DEFAULT 1,
    league_group INT DEFAULT 0,
    final_rank INT,
    final_xp INT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(season_id, user_id)
);

CREATE INDEX IF NOT EXISTS idx_wl_seasons_week ON weekly_league_seasons(week_start);
CREATE INDEX IF NOT EXISTS idx_wl_entries_season ON weekly_league_entries(season_id, bracket, league_group);
CREATE INDEX IF NOT EXISTS idx_wl_entries_user ON weekly_league_entries(user_id, season_id);
CREATE INDEX IF NOT EXISTS idx_xp_events_user_created ON xp_events(user_id, created_at);

-- ---------------------------------------------------------------------------
-- 2. Profession Monthly Tables
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS profession_monthly_seasons (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    month_start DATE NOT NULL UNIQUE,
    month_end DATE NOT NULL,
    finalized BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS profession_monthly_donations (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    season_id UUID NOT NULL REFERENCES profession_monthly_seasons(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    profession TEXT NOT NULL,
    donations INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(season_id, user_id)
);

CREATE INDEX IF NOT EXISTS idx_pm_seasons_month ON profession_monthly_seasons(month_start);
CREATE INDEX IF NOT EXISTS idx_pm_donations_season ON profession_monthly_donations(season_id, profession);
CREATE INDEX IF NOT EXISTS idx_pm_donations_user ON profession_monthly_donations(user_id, season_id);

-- ---------------------------------------------------------------------------
-- 3. RLS
-- ---------------------------------------------------------------------------
ALTER TABLE weekly_league_seasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE weekly_league_entries ENABLE ROW LEVEL SECURITY;
ALTER TABLE profession_monthly_seasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE profession_monthly_donations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read league seasons" ON weekly_league_seasons
    FOR SELECT USING (true);
CREATE POLICY "Anyone can read league entries" ON weekly_league_entries
    FOR SELECT USING (true);
CREATE POLICY "Anyone can read profession seasons" ON profession_monthly_seasons
    FOR SELECT USING (true);
CREATE POLICY "Anyone can read profession monthly donations" ON profession_monthly_donations
    FOR SELECT USING (true);

-- ---------------------------------------------------------------------------
-- 4. finalize_weekly_season(p_season_id)
--    Ranks all leagues, generates app_events, stamps final results.
--    Uses xp_events for accurate XP (immune to lazy weekly_xp reset).
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION finalize_weekly_season(p_season_id UUID)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_season weekly_league_seasons%ROWTYPE;
    v_league RECORD;
    v_entry RECORD;
    v_rank INT;
    v_league_size INT;
BEGIN
    SELECT * INTO v_season FROM weekly_league_seasons
    WHERE id = p_season_id FOR UPDATE;

    IF NOT FOUND OR v_season.finalized THEN RETURN; END IF;

    FOR v_league IN
        SELECT DISTINCT bracket, league_group
        FROM weekly_league_entries WHERE season_id = p_season_id
    LOOP
        SELECT COUNT(*) INTO v_league_size
        FROM weekly_league_entries
        WHERE season_id = p_season_id
          AND bracket = v_league.bracket
          AND league_group = v_league.league_group;

        v_rank := 0;
        FOR v_entry IN
            SELECT e.id AS entry_id, e.user_id,
                   COALESCE(xp.total, 0) AS week_xp
            FROM weekly_league_entries e
            LEFT JOIN LATERAL (
                SELECT SUM(xp_awarded) AS total
                FROM xp_events
                WHERE user_id = e.user_id
                  AND created_at >= v_season.week_start::TIMESTAMPTZ
                  AND created_at < (v_season.week_end + INTERVAL '1 day')::TIMESTAMPTZ
            ) xp ON true
            WHERE e.season_id = p_season_id
              AND e.bracket = v_league.bracket
              AND e.league_group = v_league.league_group
            ORDER BY week_xp DESC, e.user_id ASC
        LOOP
            v_rank := v_rank + 1;

            UPDATE weekly_league_entries
            SET final_rank = v_rank, final_xp = v_entry.week_xp
            WHERE id = v_entry.entry_id;

            INSERT INTO app_events (user_id, event_type, payload)
            VALUES (v_entry.user_id, 'weekly_league_result', jsonb_build_object(
                'final_rank', v_rank,
                'weekly_xp', v_entry.week_xp,
                'league_size', v_league_size,
                'promoted', v_rank <= 10,
                'demoted', v_rank > 20,
                'season_week_start', v_season.week_start::TEXT
            ));

            IF v_rank >= 11 AND v_rank <= 15 THEN
                INSERT INTO app_events (user_id, event_type, payload)
                VALUES (v_entry.user_id, 'promotion_zone_lost', jsonb_build_object(
                    'final_rank', v_rank,
                    'weekly_xp', v_entry.week_xp,
                    'season_week_start', v_season.week_start::TEXT
                ));
            END IF;
        END LOOP;
    END LOOP;

    UPDATE weekly_league_seasons SET finalized = TRUE WHERE id = p_season_id;
END;
$$;

-- ---------------------------------------------------------------------------
-- 5. enroll_weekly_league()
--    Ensures user is in a league for the current week.
--    Lazy-finalizes previous week if needed.
--    Returns current league members with live weekly_xp.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION enroll_weekly_league()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_this_week DATE;
    v_prev_week DATE;
    v_season_id UUID;
    v_prev_season_id UUID;
    v_bracket INT;
    v_league_group INT;
    v_level INT;
    v_cur_week INT;
    v_cur_year INT;
    v_result JSONB;
BEGIN
    v_this_week := date_trunc('week', CURRENT_DATE)::DATE;
    v_prev_week := v_this_week - INTERVAL '7 days';
    v_cur_week := EXTRACT(WEEK FROM CURRENT_DATE)::INT;
    v_cur_year := EXTRACT(YEAR FROM CURRENT_DATE)::INT;

    INSERT INTO weekly_league_seasons (week_start, week_end)
    VALUES (v_this_week, v_this_week + INTERVAL '6 days')
    ON CONFLICT (week_start) DO NOTHING;

    SELECT id INTO v_season_id
    FROM weekly_league_seasons WHERE week_start = v_this_week;

    IF NOT EXISTS (
        SELECT 1 FROM weekly_league_entries
        WHERE season_id = v_season_id AND user_id = v_uid
    ) THEN
        SELECT level INTO v_level FROM profiles WHERE id = v_uid;
        v_bracket := GREATEST(1, COALESCE(v_level, 1) / 3);

        SELECT league_group INTO v_league_group
        FROM weekly_league_entries
        WHERE season_id = v_season_id AND bracket = v_bracket
        GROUP BY league_group
        HAVING COUNT(*) < 30
        ORDER BY league_group
        LIMIT 1;

        IF v_league_group IS NULL THEN
            SELECT COALESCE(MAX(league_group), -1) + 1 INTO v_league_group
            FROM weekly_league_entries
            WHERE season_id = v_season_id AND bracket = v_bracket;
        END IF;

        INSERT INTO weekly_league_entries (season_id, user_id, bracket, league_group)
        VALUES (v_season_id, v_uid, v_bracket, v_league_group)
        ON CONFLICT (season_id, user_id) DO NOTHING;
    END IF;

    SELECT id INTO v_prev_season_id
    FROM weekly_league_seasons
    WHERE week_start = v_prev_week AND finalized = FALSE;

    IF v_prev_season_id IS NOT NULL THEN
        PERFORM finalize_weekly_season(v_prev_season_id);
    END IF;

    SELECT COALESCE(jsonb_agg(to_jsonb(t) ORDER BY t.weekly_xp DESC, t.id ASC), '[]'::JSONB)
    INTO v_result
    FROM (
        SELECT p.id, p.username, p.avatar_animal, p.avatar_eyes, p.avatar_mouth,
               p.avatar_accessory, p.avatar_body_color, p.avatar_bg_color,
               CASE
                   WHEN p.weekly_xp_reset_year = v_cur_year
                    AND p.weekly_xp_reset_week = v_cur_week
                   THEN p.weekly_xp
                   ELSE 0
               END AS weekly_xp,
               p.current_streak, p.level, p.profession, p.school
        FROM weekly_league_entries e
        JOIN profiles p ON p.id = e.user_id
        WHERE e.season_id = v_season_id
          AND e.bracket = (SELECT bracket FROM weekly_league_entries WHERE season_id = v_season_id AND user_id = v_uid LIMIT 1)
          AND e.league_group = (SELECT league_group FROM weekly_league_entries WHERE season_id = v_season_id AND user_id = v_uid LIMIT 1)
    ) t;

    RETURN v_result;
END;
$$;

-- ---------------------------------------------------------------------------
-- 6. finalize_monthly_profession_season(p_season_id)
--    Ranks professions, awards prizes to qualifying users, generates events.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION finalize_monthly_profession_season(p_season_id UUID)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_season profession_monthly_seasons%ROWTYPE;
    v_ranked RECORD;
    v_user RECORD;
    v_prize INT;
    v_prof_rank INT := 0;
BEGIN
    SELECT * INTO v_season FROM profession_monthly_seasons
    WHERE id = p_season_id FOR UPDATE;

    IF NOT FOUND OR v_season.finalized THEN RETURN; END IF;

    FOR v_ranked IN
        SELECT profession, SUM(donations) AS total_donations
        FROM profession_monthly_donations
        WHERE season_id = p_season_id
        GROUP BY profession
        ORDER BY total_donations DESC
    LOOP
        v_prof_rank := v_prof_rank + 1;

        CASE v_prof_rank
            WHEN 1 THEN v_prize := 500;
            WHEN 2 THEN v_prize := 250;
            WHEN 3 THEN v_prize := 100;
            ELSE v_prize := 0;
        END CASE;

        FOR v_user IN
            SELECT user_id, donations
            FROM profession_monthly_donations
            WHERE season_id = p_season_id AND profession = v_ranked.profession
        LOOP
            INSERT INTO app_events (user_id, event_type, payload)
            VALUES (v_user.user_id, 'monthly_profession_result', jsonb_build_object(
                'profession', v_ranked.profession,
                'profession_rank', v_prof_rank,
                'profession_total', v_ranked.total_donations,
                'user_donations', v_user.donations,
                'prize_coins', CASE WHEN v_user.donations >= 100 AND v_prize > 0 THEN v_prize ELSE 0 END,
                'season_month_start', v_season.month_start::TEXT
            ));

            IF v_user.donations >= 100 AND v_prize > 0 THEN
                UPDATE profiles SET coins = coins + v_prize WHERE id = v_user.user_id;
            END IF;
        END LOOP;
    END LOOP;

    UPDATE profession_monthly_seasons SET finalized = TRUE WHERE id = p_season_id;
END;
$$;

-- ---------------------------------------------------------------------------
-- 7. get_monthly_profession_standings()
--    Returns current month's profession donation standings.
--    Lazy-finalizes previous month.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_monthly_profession_standings()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_this_month DATE;
    v_prev_month DATE;
    v_season_id UUID;
    v_prev_season_id UUID;
    v_result JSONB;
BEGIN
    v_this_month := date_trunc('month', CURRENT_DATE)::DATE;
    v_prev_month := (date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::DATE;
    v_prev_month := date_trunc('month', v_prev_month)::DATE;

    INSERT INTO profession_monthly_seasons (month_start, month_end)
    VALUES (v_this_month, (date_trunc('month', CURRENT_DATE) + INTERVAL '1 month - 1 day')::DATE)
    ON CONFLICT (month_start) DO NOTHING;

    SELECT id INTO v_season_id
    FROM profession_monthly_seasons WHERE month_start = v_this_month;

    SELECT id INTO v_prev_season_id
    FROM profession_monthly_seasons
    WHERE month_start = v_prev_month AND finalized = FALSE;

    IF v_prev_season_id IS NOT NULL THEN
        PERFORM finalize_monthly_profession_season(v_prev_season_id);
    END IF;

    SELECT COALESCE(jsonb_agg(to_jsonb(t) ORDER BY t.total_donations DESC), '[]'::JSONB)
    INTO v_result
    FROM (
        SELECT profession, SUM(donations) AS total_donations
        FROM profession_monthly_donations
        WHERE season_id = v_season_id
        GROUP BY profession
    ) t;

    RETURN v_result;
END;
$$;

-- ---------------------------------------------------------------------------
-- 8. Updated donate_profession — also tracks monthly donations
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION donate_profession(p_amount INT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_coins INT;
    v_profession TEXT;
    v_month_start DATE;
    v_pm_season_id UUID;
BEGIN
    SELECT coins, profession INTO v_coins, v_profession
    FROM profiles WHERE id = v_uid FOR UPDATE;

    IF v_coins < p_amount THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not enough coins');
    END IF;

    UPDATE profiles SET
        coins = coins - p_amount,
        profession_donations = profession_donations + p_amount
    WHERE id = v_uid;

    v_month_start := date_trunc('month', CURRENT_DATE)::DATE;

    INSERT INTO profession_monthly_seasons (month_start, month_end)
    VALUES (v_month_start, (date_trunc('month', CURRENT_DATE) + INTERVAL '1 month - 1 day')::DATE)
    ON CONFLICT (month_start) DO NOTHING;

    SELECT id INTO v_pm_season_id
    FROM profession_monthly_seasons WHERE month_start = v_month_start;

    INSERT INTO profession_monthly_donations (season_id, user_id, profession, donations)
    VALUES (v_pm_season_id, v_uid, v_profession, p_amount)
    ON CONFLICT (season_id, user_id) DO UPDATE SET
        donations = profession_monthly_donations.donations + p_amount,
        profession = v_profession;

    RETURN jsonb_build_object('success', true)
        || (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 9. Updated accept_duo_invite — generates duo_started events
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION accept_duo_invite(p_partnership_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_partnership duo_partnerships%ROWTYPE;
    v_week_start DATE;
    v_partner_name TEXT;
    v_user_name TEXT;
BEGIN
    SELECT * INTO v_partnership FROM duo_partnerships
    WHERE id = p_partnership_id::UUID AND partner_id = v_uid AND status = 'pending';

    IF NOT FOUND THEN
        RETURN jsonb_build_object('success', false, 'error', 'Invite not found');
    END IF;

    IF EXISTS (
        SELECT 1 FROM duo_partnerships
        WHERE (user_id = v_uid OR partner_id = v_uid) AND status = 'accepted'
    ) THEN
        RETURN jsonb_build_object('success', false, 'error', 'You already have a duo partner');
    END IF;

    UPDATE duo_partnerships SET status = 'accepted' WHERE id = p_partnership_id::UUID;

    v_week_start := date_trunc('week', CURRENT_DATE)::DATE;

    INSERT INTO duo_weekly_quests (partnership_id, week_start, quest_type, target_value, reward_type, reward_amount)
    VALUES
        (p_partnership_id::UUID, v_week_start, 'questions', 40, 'coins', 50),
        (p_partnership_id::UUID, v_week_start, 'streak_days', 5, 'coins', 75),
        (p_partnership_id::UUID, v_week_start, 'xp_earned', 500, 'coins', 100)
    ON CONFLICT DO NOTHING;

    SELECT username INTO v_partner_name FROM profiles WHERE id = v_partnership.user_id;
    SELECT username INTO v_user_name FROM profiles WHERE id = v_uid;

    INSERT INTO app_events (user_id, event_type, payload)
    VALUES (v_partnership.user_id, 'duo_started', jsonb_build_object(
        'partner_name', v_user_name,
        'partnership_id', p_partnership_id
    ));

    INSERT INTO app_events (user_id, event_type, payload)
    VALUES (v_uid, 'duo_started', jsonb_build_object(
        'partner_name', v_partner_name,
        'partnership_id', p_partnership_id
    ));

    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 10. Updated report_duo_progress — generates deduped duo_progress events
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION report_duo_progress(p_quest_type TEXT, p_amount INT)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_partnership duo_partnerships%ROWTYPE;
    v_week_start DATE;
    v_is_user1 BOOLEAN;
BEGIN
    SELECT * INTO v_partnership FROM duo_partnerships
    WHERE (user_id = v_uid OR partner_id = v_uid) AND status = 'accepted'
    LIMIT 1;

    IF NOT FOUND THEN RETURN; END IF;

    v_week_start := date_trunc('week', CURRENT_DATE)::DATE;
    v_is_user1 := (v_partnership.user_id = v_uid);

    IF v_is_user1 THEN
        UPDATE duo_weekly_quests
        SET user1_progress = user1_progress + p_amount
        WHERE partnership_id = v_partnership.id
          AND week_start = v_week_start
          AND quest_type = p_quest_type;
    ELSE
        UPDATE duo_weekly_quests
        SET user2_progress = user2_progress + p_amount
        WHERE partnership_id = v_partnership.id
          AND week_start = v_week_start
          AND quest_type = p_quest_type;
    END IF;

    IF p_quest_type = 'streak_days' THEN
        DECLARE
            v_partner_active BOOLEAN;
            v_today DATE := CURRENT_DATE;
        BEGIN
            IF v_is_user1 THEN
                SELECT (user2_progress > 0) INTO v_partner_active
                FROM duo_weekly_quests
                WHERE partnership_id = v_partnership.id
                  AND week_start = v_week_start
                  AND quest_type = 'streak_days';
            ELSE
                SELECT (user1_progress > 0) INTO v_partner_active
                FROM duo_weekly_quests
                WHERE partnership_id = v_partnership.id
                  AND week_start = v_week_start
                  AND quest_type = 'streak_days';
            END IF;

            IF v_partner_active AND (v_partnership.last_both_active_date IS NULL OR v_partnership.last_both_active_date < v_today) THEN
                UPDATE duo_partnerships
                SET shared_streak = shared_streak + 1,
                    last_both_active_date = v_today
                WHERE id = v_partnership.id;
            END IF;
        END;
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM app_events
        WHERE user_id = v_uid
          AND event_type = 'duo_progress'
          AND created_at::DATE = CURRENT_DATE
    ) THEN
        INSERT INTO app_events (user_id, event_type, payload)
        VALUES (v_uid, 'duo_progress', jsonb_build_object(
            'quest_type', p_quest_type,
            'amount', p_amount,
            'partnership_id', v_partnership.id::TEXT
        ));
    END IF;
END;
$$;

-- ---------------------------------------------------------------------------
-- 11. Updated claim_duo_reward — generates duo_completed when all done
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION claim_duo_reward(p_quest_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_quest duo_weekly_quests%ROWTYPE;
    v_partnership duo_partnerships%ROWTYPE;
    v_reward_amount INT;
    v_all_claimed BOOLEAN;
    v_partner_id UUID;
BEGIN
    SELECT * INTO v_quest FROM duo_weekly_quests WHERE id = p_quest_id::UUID;
    IF NOT FOUND THEN
        RETURN jsonb_build_object('success', false, 'error', 'Quest not found');
    END IF;

    IF v_quest.reward_claimed THEN
        RETURN jsonb_build_object('success', false, 'error', 'Already claimed');
    END IF;

    IF (v_quest.user1_progress + v_quest.user2_progress) < v_quest.target_value THEN
        RETURN jsonb_build_object('success', false, 'error', 'Quest not complete');
    END IF;

    SELECT * INTO v_partnership FROM duo_partnerships WHERE id = v_quest.partnership_id;
    IF NOT FOUND OR (v_partnership.user_id != v_uid AND v_partnership.partner_id != v_uid) THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not authorized');
    END IF;

    v_reward_amount := v_quest.reward_amount;

    UPDATE profiles SET coins = coins + v_reward_amount WHERE id = v_partnership.user_id;
    UPDATE profiles SET coins = coins + v_reward_amount WHERE id = v_partnership.partner_id;

    UPDATE duo_weekly_quests SET reward_claimed = true WHERE id = p_quest_id::UUID;

    SELECT NOT EXISTS (
        SELECT 1 FROM duo_weekly_quests
        WHERE partnership_id = v_quest.partnership_id
          AND week_start = v_quest.week_start
          AND reward_claimed = FALSE
    ) INTO v_all_claimed;

    IF v_all_claimed THEN
        v_partner_id := CASE WHEN v_partnership.user_id = v_uid
            THEN v_partnership.partner_id ELSE v_partnership.user_id END;

        IF NOT EXISTS (
            SELECT 1 FROM app_events
            WHERE user_id = v_uid
              AND event_type = 'duo_completed'
              AND (payload->>'week_start') = v_quest.week_start::TEXT
        ) THEN
            INSERT INTO app_events (user_id, event_type, payload)
            VALUES (v_uid, 'duo_completed', jsonb_build_object(
                'week_start', v_quest.week_start::TEXT,
                'partnership_id', v_quest.partnership_id::TEXT
            ));

            INSERT INTO app_events (user_id, event_type, payload)
            VALUES (v_partner_id, 'duo_completed', jsonb_build_object(
                'week_start', v_quest.week_start::TEXT,
                'partnership_id', v_quest.partnership_id::TEXT
            ));
        END IF;
    END IF;

    RETURN jsonb_build_object(
        'success', true,
        'coins_awarded', v_reward_amount,
        'bonus_type', v_quest.reward_type
    );
END;
$$;
