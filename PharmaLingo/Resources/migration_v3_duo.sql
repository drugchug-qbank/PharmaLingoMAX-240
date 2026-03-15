-- =============================================================================
-- PharmaLingo Backend Migration v3 — Duo Partnerships & Weekly Quests
-- Run this in your Supabase SQL Editor AFTER migration_v2.sql
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Create duo_partnerships table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS duo_partnerships (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    partner_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'accepted', 'dissolved')),
    shared_streak INT DEFAULT 0,
    last_both_active_date DATE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT no_self_duo CHECK (user_id != partner_id)
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_duo_active_pair
    ON duo_partnerships (LEAST(user_id::TEXT, partner_id::TEXT), GREATEST(user_id::TEXT, partner_id::TEXT))
    WHERE status = 'accepted';

CREATE INDEX IF NOT EXISTS idx_duo_user ON duo_partnerships(user_id, status);
CREATE INDEX IF NOT EXISTS idx_duo_partner ON duo_partnerships(partner_id, status);

-- ---------------------------------------------------------------------------
-- 2. Create duo_weekly_quests table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS duo_weekly_quests (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    partnership_id UUID NOT NULL REFERENCES duo_partnerships(id) ON DELETE CASCADE,
    week_start DATE NOT NULL,
    quest_type TEXT NOT NULL,
    target_value INT NOT NULL DEFAULT 40,
    user1_progress INT DEFAULT 0,
    user2_progress INT DEFAULT 0,
    reward_claimed BOOLEAN DEFAULT FALSE,
    reward_type TEXT DEFAULT 'coins',
    reward_amount INT DEFAULT 50,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(partnership_id, week_start, quest_type)
);

CREATE INDEX IF NOT EXISTS idx_duo_quests_partnership ON duo_weekly_quests(partnership_id, week_start);

-- ---------------------------------------------------------------------------
-- 3. RLS
-- ---------------------------------------------------------------------------
ALTER TABLE duo_partnerships ENABLE ROW LEVEL SECURITY;
ALTER TABLE duo_weekly_quests ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own duo partnerships" ON duo_partnerships
    FOR SELECT USING (user_id = auth.uid() OR partner_id = auth.uid());

CREATE POLICY "Users can read own duo quests" ON duo_weekly_quests
    FOR SELECT USING (
        partnership_id IN (
            SELECT id FROM duo_partnerships
            WHERE user_id = auth.uid() OR partner_id = auth.uid()
        )
    );

-- ---------------------------------------------------------------------------
-- 4. Updated_at trigger for duo_partnerships
-- ---------------------------------------------------------------------------
DROP TRIGGER IF EXISTS set_duo_partnerships_updated_at ON duo_partnerships;
CREATE TRIGGER set_duo_partnerships_updated_at
    BEFORE UPDATE ON duo_partnerships
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ---------------------------------------------------------------------------
-- 5. RPC: fetch_duo_partnership
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_duo_partnership()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_result JSONB;
BEGIN
    SELECT to_jsonb(d) INTO v_result
    FROM duo_partnerships d
    WHERE (d.user_id = v_uid OR d.partner_id = v_uid)
      AND d.status = 'accepted'
    LIMIT 1;

    RETURN COALESCE(v_result, '{}'::JSONB);
END;
$$;

-- ---------------------------------------------------------------------------
-- 6. RPC: send_duo_invite
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION send_duo_invite(p_partner_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_partner UUID := p_partner_id::UUID;
    v_existing RECORD;
BEGIN
    IF v_uid = v_partner THEN
        RETURN jsonb_build_object('success', false, 'error', 'Cannot partner with yourself');
    END IF;

    SELECT * INTO v_existing FROM duo_partnerships
    WHERE ((user_id = v_uid OR partner_id = v_uid) AND status IN ('pending', 'accepted'))
    LIMIT 1;

    IF FOUND AND v_existing.status = 'accepted' THEN
        RETURN jsonb_build_object('success', false, 'error', 'You already have a duo partner');
    END IF;

    SELECT * INTO v_existing FROM duo_partnerships
    WHERE ((user_id = v_partner OR partner_id = v_partner) AND status = 'accepted')
    LIMIT 1;

    IF FOUND THEN
        RETURN jsonb_build_object('success', false, 'error', 'This user already has a duo partner');
    END IF;

    DELETE FROM duo_partnerships
    WHERE user_id = v_uid AND status = 'pending';

    INSERT INTO duo_partnerships (user_id, partner_id, status)
    VALUES (v_uid, v_partner, 'pending');

    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 7. RPC: accept_duo_invite
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION accept_duo_invite(p_partnership_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_partnership duo_partnerships%ROWTYPE;
    v_week_start DATE;
BEGIN
    SELECT * INTO v_partnership FROM duo_partnerships
    WHERE id = p_partnership_id::UUID AND partner_id = v_uid AND status = 'pending';

    IF NOT FOUND THEN
        RETURN jsonb_build_object('success', false, 'error', 'Invite not found');
    END IF;

    SELECT * INTO v_partnership FROM duo_partnerships
    WHERE (user_id = v_uid OR partner_id = v_uid) AND status = 'accepted'
    LIMIT 1;

    IF FOUND THEN
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

    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 8. RPC: decline_duo_invite
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION decline_duo_invite(p_partnership_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
BEGIN
    DELETE FROM duo_partnerships
    WHERE id = p_partnership_id::UUID AND partner_id = v_uid AND status = 'pending';

    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 9. RPC: dissolve_duo
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION dissolve_duo(p_partnership_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
BEGIN
    UPDATE duo_partnerships SET status = 'dissolved'
    WHERE id = p_partnership_id::UUID
      AND (user_id = v_uid OR partner_id = v_uid)
      AND status = 'accepted';

    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 10. RPC: fetch_duo_weekly_quests
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_duo_weekly_quests()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid UUID := auth.uid();
    v_partnership_id UUID;
    v_week_start DATE;
    v_result JSONB;
BEGIN
    SELECT id INTO v_partnership_id FROM duo_partnerships
    WHERE (user_id = v_uid OR partner_id = v_uid) AND status = 'accepted'
    LIMIT 1;

    IF v_partnership_id IS NULL THEN
        RETURN '[]'::JSONB;
    END IF;

    v_week_start := date_trunc('week', CURRENT_DATE)::DATE;

    IF NOT EXISTS (
        SELECT 1 FROM duo_weekly_quests
        WHERE partnership_id = v_partnership_id AND week_start = v_week_start
    ) THEN
        INSERT INTO duo_weekly_quests (partnership_id, week_start, quest_type, target_value, reward_type, reward_amount)
        VALUES
            (v_partnership_id, v_week_start, 'questions', 40, 'coins', 50),
            (v_partnership_id, v_week_start, 'streak_days', 5, 'coins', 75),
            (v_partnership_id, v_week_start, 'xp_earned', 500, 'coins', 100)
        ON CONFLICT DO NOTHING;
    END IF;

    SELECT jsonb_agg(to_jsonb(q)) INTO v_result
    FROM duo_weekly_quests q
    WHERE q.partnership_id = v_partnership_id AND q.week_start = v_week_start;

    RETURN COALESCE(v_result, '[]'::JSONB);
END;
$$;

-- ---------------------------------------------------------------------------
-- 11. RPC: report_duo_progress
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
END;
$$;

-- ---------------------------------------------------------------------------
-- 12. RPC: claim_duo_reward
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

    RETURN jsonb_build_object(
        'success', true,
        'coins_awarded', v_reward_amount,
        'bonus_type', v_quest.reward_type
    );
END;
$$;
