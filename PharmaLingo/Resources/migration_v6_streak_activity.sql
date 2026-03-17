-- =============================================================================
-- PharmaLingo Backend Migration v6 — Streak Activity Persistence
-- Run this in your Supabase SQL Editor AFTER migration_v5_daily_chest.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Add activity_dates and streak_save_dates columns to profiles
-- ---------------------------------------------------------------------------
ALTER TABLE profiles
    ADD COLUMN IF NOT EXISTS activity_dates TEXT DEFAULT '[]',
    ADD COLUMN IF NOT EXISTS streak_save_dates TEXT DEFAULT '[]';

-- ---------------------------------------------------------------------------
-- 2. Create streak_activity_log table for detailed event history
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS streak_activity_log (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    activity_date DATE NOT NULL,
    event_type TEXT NOT NULL,
    streak_count INT DEFAULT 0,
    streak_saves_remaining INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, activity_date, event_type)
);

CREATE INDEX IF NOT EXISTS idx_streak_activity_user_date
    ON streak_activity_log(user_id, activity_date DESC);

-- ---------------------------------------------------------------------------
-- 3. RLS
-- ---------------------------------------------------------------------------
ALTER TABLE streak_activity_log ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own streak activity" ON streak_activity_log
    FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Users can insert own streak activity" ON streak_activity_log
    FOR INSERT WITH CHECK (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- 4. RPC: log_streak_activity
--    Records a streak event for a given date
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION log_streak_activity(
    p_activity_date TEXT,
    p_event_type TEXT,
    p_streak_count INT DEFAULT 0,
    p_streak_saves_remaining INT DEFAULT 0
)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
BEGIN
    INSERT INTO streak_activity_log (user_id, activity_date, event_type, streak_count, streak_saves_remaining)
    VALUES (v_uid, p_activity_date::DATE, p_event_type, p_streak_count, p_streak_saves_remaining)
    ON CONFLICT (user_id, activity_date, event_type)
    DO UPDATE SET
        streak_count = EXCLUDED.streak_count,
        streak_saves_remaining = EXCLUDED.streak_saves_remaining,
        created_at = NOW();

    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 5. RPC: fetch_streak_activity
--    Returns all streak activity for the current user
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_streak_activity()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_result JSONB;
BEGIN
    SELECT COALESCE(jsonb_agg(
        jsonb_build_object(
            'date', TO_CHAR(activity_date, 'YYYY-MM-DD'),
            'event_type', event_type,
            'streak_count', streak_count,
            'streak_saves_remaining', streak_saves_remaining
        ) ORDER BY activity_date DESC
    ), '[]'::JSONB)
    INTO v_result
    FROM streak_activity_log
    WHERE user_id = v_uid;

    RETURN v_result;
END;
$$;

-- ---------------------------------------------------------------------------
-- 6. RPC: sync_streak_dates
--    Saves the full activity_dates and streak_save_dates arrays to profiles
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sync_streak_dates(
    p_activity_dates TEXT,
    p_streak_save_dates TEXT
)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
BEGIN
    UPDATE profiles
    SET activity_dates = p_activity_dates,
        streak_save_dates = p_streak_save_dates,
        updated_at = NOW()
    WHERE id = v_uid;

    RETURN jsonb_build_object('success', true);
END;
$$;
