-- =============================================================================
-- PharmaLingo Backend Migration v7 — XP Repeat Limits & Completion Bonuses
-- Run this in your Supabase SQL Editor AFTER migration_v6_streak_activity.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Create content_completions table (first-time completion tracking)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS content_completions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    content_key TEXT NOT NULL,
    content_type TEXT NOT NULL,
    completed_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, content_key)
);

CREATE INDEX IF NOT EXISTS idx_content_completions_user
    ON content_completions(user_id, content_key);

-- ---------------------------------------------------------------------------
-- 2. Create daily_content_runs table (per-day per-content run counts)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS daily_content_runs (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    run_date DATE NOT NULL DEFAULT CURRENT_DATE,
    content_key TEXT NOT NULL,
    content_type TEXT NOT NULL,
    run_count INT DEFAULT 1,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, run_date, content_key)
);

CREATE INDEX IF NOT EXISTS idx_daily_content_runs_lookup
    ON daily_content_runs(user_id, run_date, content_key);

-- ---------------------------------------------------------------------------
-- 3. RLS
-- ---------------------------------------------------------------------------
ALTER TABLE content_completions ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_content_runs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own content completions" ON content_completions
    FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Users can read own daily content runs" ON daily_content_runs
    FOR SELECT USING (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- 4. RPC: record_content_completion
--    Atomically records a completed XP-awarding run:
--    - Increments the daily run count for the content_key
--    - Checks/records first-time completion
--    Returns: { run_count_today, is_first_completion }
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION record_content_completion(
    p_content_key TEXT,
    p_content_type TEXT
)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_today DATE := CURRENT_DATE;
    v_run_count INT;
    v_is_first BOOLEAN;
BEGIN
    INSERT INTO daily_content_runs (user_id, run_date, content_key, content_type, run_count)
    VALUES (v_uid, v_today, p_content_key, p_content_type, 1)
    ON CONFLICT (user_id, run_date, content_key) DO UPDATE SET
        run_count = daily_content_runs.run_count + 1;

    SELECT run_count INTO v_run_count
    FROM daily_content_runs
    WHERE user_id = v_uid AND run_date = v_today AND content_key = p_content_key;

    SELECT NOT EXISTS(
        SELECT 1 FROM content_completions
        WHERE user_id = v_uid AND content_key = p_content_key
    ) INTO v_is_first;

    INSERT INTO content_completions (user_id, content_key, content_type)
    VALUES (v_uid, p_content_key, p_content_type)
    ON CONFLICT (user_id, content_key) DO NOTHING;

    RETURN jsonb_build_object(
        'run_count_today', v_run_count,
        'is_first_completion', v_is_first
    );
END;
$$;

-- ---------------------------------------------------------------------------
-- 5. RPC: fetch_daily_run_counts
--    Returns all run counts for the current user for today
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_daily_run_counts()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_today DATE := CURRENT_DATE;
BEGIN
    RETURN COALESCE(
        (SELECT jsonb_object_agg(content_key, run_count)
         FROM daily_content_runs
         WHERE user_id = v_uid AND run_date = v_today),
        '{}'::JSONB
    );
END;
$$;

-- ---------------------------------------------------------------------------
-- 6. RPC: fetch_completed_content_keys
--    Returns all content_keys the user has ever completed
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_completed_content_keys()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
BEGIN
    RETURN COALESCE(
        (SELECT jsonb_agg(content_key)
         FROM content_completions
         WHERE user_id = v_uid),
        '[]'::JSONB
    );
END;
$$;
