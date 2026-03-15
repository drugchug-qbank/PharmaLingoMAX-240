-- =============================================================================
-- PharmaLingo Backend Migration v5 — Daily Mystery Chest Persistence
-- Run this in your Supabase SQL Editor AFTER migration_v4_duo_chest.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Create daily_chest_opens table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS daily_chest_opens (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    open_date DATE NOT NULL,
    open_index INT NOT NULL,
    reward_type TEXT NOT NULL,
    reward_amount INT DEFAULT 0,
    was_applied BOOLEAN DEFAULT TRUE,
    opened_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_daily_chest_user_date
    ON daily_chest_opens(user_id, open_date);

-- ---------------------------------------------------------------------------
-- 2. Daily chest state table (tracks opens used today + xp start)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS daily_chest_state (
    user_id UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
    opens_used INT DEFAULT 0,
    last_open_date DATE,
    xp_at_session_start INT DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ---------------------------------------------------------------------------
-- 3. RLS
-- ---------------------------------------------------------------------------
ALTER TABLE daily_chest_opens ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_chest_state ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own daily chest opens" ON daily_chest_opens
    FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Users can insert own daily chest opens" ON daily_chest_opens
    FOR INSERT WITH CHECK (user_id = auth.uid());

CREATE POLICY "Users can read own daily chest state" ON daily_chest_state
    FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Users can insert own daily chest state" ON daily_chest_state
    FOR INSERT WITH CHECK (user_id = auth.uid());

CREATE POLICY "Users can update own daily chest state" ON daily_chest_state
    FOR UPDATE USING (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- 4. RPC: fetch_daily_chest_state
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_daily_chest_state()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_state daily_chest_state%ROWTYPE;
    v_today DATE := CURRENT_DATE;
BEGIN
    SELECT * INTO v_state FROM daily_chest_state WHERE user_id = v_uid;

    IF NOT FOUND THEN
        INSERT INTO daily_chest_state (user_id, opens_used, last_open_date, xp_at_session_start)
        VALUES (v_uid, 0, NULL, 0)
        ON CONFLICT (user_id) DO NOTHING;

        RETURN jsonb_build_object(
            'opens_used', 0,
            'last_open_date', NULL,
            'xp_at_session_start', 0
        );
    END IF;

    IF v_state.last_open_date IS NULL OR v_state.last_open_date < v_today THEN
        UPDATE daily_chest_state
        SET opens_used = 0, last_open_date = v_today, xp_at_session_start = 0, updated_at = NOW()
        WHERE user_id = v_uid;

        RETURN jsonb_build_object(
            'opens_used', 0,
            'last_open_date', v_today,
            'xp_at_session_start', 0
        );
    END IF;

    RETURN jsonb_build_object(
        'opens_used', v_state.opens_used,
        'last_open_date', v_state.last_open_date,
        'xp_at_session_start', v_state.xp_at_session_start
    );
END;
$$;

-- ---------------------------------------------------------------------------
-- 5. RPC: open_daily_chest
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION open_daily_chest(
    p_reward_type TEXT,
    p_reward_amount INT,
    p_was_applied BOOLEAN
)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_today DATE := CURRENT_DATE;
    v_opens_used INT;
    v_max_opens INT := 4;
BEGIN
    INSERT INTO daily_chest_state (user_id, opens_used, last_open_date, xp_at_session_start)
    VALUES (v_uid, 0, v_today, 0)
    ON CONFLICT (user_id) DO NOTHING;

    SELECT opens_used, last_open_date INTO v_opens_used
    FROM daily_chest_state WHERE user_id = v_uid;

    IF (SELECT last_open_date FROM daily_chest_state WHERE user_id = v_uid) < v_today THEN
        UPDATE daily_chest_state
        SET opens_used = 0, last_open_date = v_today, xp_at_session_start = 0, updated_at = NOW()
        WHERE user_id = v_uid;
        v_opens_used := 0;
    END IF;

    IF v_opens_used >= v_max_opens THEN
        RETURN jsonb_build_object('success', false, 'error', 'Max opens reached today');
    END IF;

    UPDATE daily_chest_state
    SET opens_used = v_opens_used + 1, updated_at = NOW()
    WHERE user_id = v_uid;

    INSERT INTO daily_chest_opens (user_id, open_date, open_index, reward_type, reward_amount, was_applied)
    VALUES (v_uid, v_today, v_opens_used + 1, p_reward_type, p_reward_amount, p_was_applied);

    IF p_was_applied THEN
        IF p_reward_type = 'coins' THEN
            UPDATE profiles SET coins = coins + p_reward_amount WHERE id = v_uid;
        ELSIF p_reward_type = 'maxHearts' THEN
            UPDATE profiles SET hearts = 5 WHERE id = v_uid;
        ELSIF p_reward_type = 'streakSave' THEN
            UPDATE profiles SET streak_saves = LEAST(streak_saves + 1, 3) WHERE id = v_uid;
        END IF;
    END IF;

    RETURN jsonb_build_object(
        'success', true,
        'opens_used', v_opens_used + 1,
        'reward_type', p_reward_type,
        'reward_amount', p_reward_amount,
        'was_applied', p_was_applied
    );
END;
$$;

-- ---------------------------------------------------------------------------
-- 6. RPC: save_daily_chest_xp_start
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION save_daily_chest_xp_start(p_xp INT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_today DATE := CURRENT_DATE;
BEGIN
    INSERT INTO daily_chest_state (user_id, opens_used, last_open_date, xp_at_session_start)
    VALUES (v_uid, 0, v_today, p_xp)
    ON CONFLICT (user_id) DO UPDATE
    SET xp_at_session_start = CASE
            WHEN daily_chest_state.xp_at_session_start = 0 THEN p_xp
            ELSE daily_chest_state.xp_at_session_start
        END,
        last_open_date = v_today,
        updated_at = NOW();

    RETURN jsonb_build_object('success', true);
END;
$$;
