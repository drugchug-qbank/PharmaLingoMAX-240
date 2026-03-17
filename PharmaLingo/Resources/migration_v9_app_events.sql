-- =============================================================================
-- PharmaLingo Backend Migration v9 — App Event Center
-- Run this in your Supabase SQL Editor AFTER migration_v8_osrs_leveling.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. app_events table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS app_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    event_type TEXT NOT NULL,
    payload JSONB NOT NULL DEFAULT '{}',
    seen BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_app_events_user_unseen
    ON app_events(user_id, seen, created_at DESC)
    WHERE seen = FALSE;

ALTER TABLE app_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own events"
    ON app_events FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can update own events"
    ON app_events FOR UPDATE
    USING (auth.uid() = user_id);

-- ---------------------------------------------------------------------------
-- 2. RPC: fetch_unseen_app_events
--    Returns up to 5 unseen events for the current user, newest first.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_unseen_app_events()
RETURNS SETOF app_events
LANGUAGE sql STABLE SECURITY DEFINER
AS $$
    SELECT *
    FROM app_events
    WHERE user_id = auth.uid()
      AND seen = FALSE
    ORDER BY created_at DESC
    LIMIT 5;
$$;

-- ---------------------------------------------------------------------------
-- 3. RPC: dismiss_app_event(p_event_id)
--    Marks a single event as seen.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dismiss_app_event(p_event_id UUID)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
BEGIN
    UPDATE app_events
    SET seen = TRUE
    WHERE id = p_event_id
      AND user_id = auth.uid();
END;
$$;

-- ---------------------------------------------------------------------------
-- 4. RPC: create_app_event(p_user_id, p_event_type, p_payload)
--    Inserts a new event. Called by server-side logic or triggers.
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION create_app_event(
    p_user_id UUID,
    p_event_type TEXT,
    p_payload JSONB DEFAULT '{}'
)
RETURNS UUID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_id UUID;
BEGIN
    INSERT INTO app_events (user_id, event_type, payload)
    VALUES (p_user_id, p_event_type, p_payload)
    RETURNING id INTO v_id;
    RETURN v_id;
END;
$$;
