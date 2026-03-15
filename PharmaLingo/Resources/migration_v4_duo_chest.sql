-- =============================================================================
-- PharmaLingo Backend Migration v4 — Duo Mystery Chest Persistence
-- Run this in your Supabase SQL Editor AFTER migration_v3_duo.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Create duo_chest_claims table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS duo_chest_claims (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    partnership_id UUID NOT NULL REFERENCES duo_partnerships(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    week_start DATE NOT NULL,
    reward_type TEXT NOT NULL,
    reward_amount INT DEFAULT 0,
    was_applied BOOLEAN DEFAULT TRUE,
    claimed_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(partnership_id, user_id, week_start)
);

CREATE INDEX IF NOT EXISTS idx_duo_chest_claims_lookup
    ON duo_chest_claims(partnership_id, user_id, week_start);

-- ---------------------------------------------------------------------------
-- 2. RLS
-- ---------------------------------------------------------------------------
ALTER TABLE duo_chest_claims ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own chest claims" ON duo_chest_claims
    FOR SELECT USING (user_id = auth.uid());

CREATE POLICY "Users can insert own chest claims" ON duo_chest_claims
    FOR INSERT WITH CHECK (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- 3. RPC: check_duo_chest_claimed
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION check_duo_chest_claimed(p_partnership_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_week_start DATE;
    v_claimed BOOLEAN;
BEGIN
    v_week_start := date_trunc('week', CURRENT_DATE)::DATE;

    SELECT EXISTS (
        SELECT 1 FROM duo_chest_claims
        WHERE partnership_id = p_partnership_id::UUID
          AND user_id = v_uid
          AND week_start = v_week_start
    ) INTO v_claimed;

    RETURN jsonb_build_object('claimed', v_claimed);
END;
$$;

-- ---------------------------------------------------------------------------
-- 4. RPC: claim_duo_mystery_chest
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION claim_duo_mystery_chest(
    p_partnership_id TEXT,
    p_reward_type TEXT,
    p_reward_amount INT,
    p_was_applied BOOLEAN
)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_week_start DATE;
    v_partnership duo_partnerships%ROWTYPE;
    v_already_claimed BOOLEAN;
BEGIN
    SELECT * INTO v_partnership FROM duo_partnerships
    WHERE id = p_partnership_id::UUID
      AND (user_id = v_uid OR partner_id = v_uid)
      AND status = 'accepted';

    IF NOT FOUND THEN
        RETURN jsonb_build_object('success', false, 'error', 'Partnership not found');
    END IF;

    v_week_start := date_trunc('week', CURRENT_DATE)::DATE;

    SELECT EXISTS (
        SELECT 1 FROM duo_chest_claims
        WHERE partnership_id = p_partnership_id::UUID
          AND user_id = v_uid
          AND week_start = v_week_start
    ) INTO v_already_claimed;

    IF v_already_claimed THEN
        RETURN jsonb_build_object('success', false, 'error', 'Already claimed this week');
    END IF;

    INSERT INTO duo_chest_claims (partnership_id, user_id, week_start, reward_type, reward_amount, was_applied)
    VALUES (p_partnership_id::UUID, v_uid, v_week_start, p_reward_type, p_reward_amount, p_was_applied);

    IF p_was_applied THEN
        IF p_reward_type = 'coins' THEN
            UPDATE profiles SET coins = coins + p_reward_amount WHERE id = v_uid;
        ELSIF p_reward_type = 'maxHearts' THEN
            UPDATE profiles SET hearts = 5 WHERE id = v_uid;
        ELSIF p_reward_type = 'streakSave' THEN
            UPDATE profiles SET streak_saves = LEAST(streak_saves + 1, 3) WHERE id = v_uid;
        END IF;
    END IF;

    RETURN jsonb_build_object('success', true);
END;
$$;
