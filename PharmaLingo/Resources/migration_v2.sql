-- =============================================================================
-- PharmaLingo Backend Persistence Migration v2
-- Run this in your Supabase SQL Editor (Dashboard > SQL Editor > New Query)
-- This is ADDITIVE — no existing data is deleted.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Add missing columns to profiles
-- ---------------------------------------------------------------------------
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS avatar_body_color TEXT DEFAULT '';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS avatar_bg_color TEXT DEFAULT '';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS clinical_aura_points INT DEFAULT 0;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS last_active_date TIMESTAMPTZ;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS last_heart_loss_date TIMESTAMPTZ;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS weekly_xp_reset_week INT DEFAULT EXTRACT(WEEK FROM CURRENT_DATE)::INT;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS weekly_xp_reset_year INT DEFAULT EXTRACT(YEAR FROM CURRENT_DATE)::INT;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS monthly_xp_reset_month INT DEFAULT EXTRACT(MONTH FROM CURRENT_DATE)::INT;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS monthly_xp_reset_year INT DEFAULT EXTRACT(YEAR FROM CURRENT_DATE)::INT;

-- Backfill weekly_xp and monthly_xp to 0 for existing rows (they were incorrectly set to total_xp)
-- Only reset if the reset tracking columns show they haven't been managed yet
UPDATE profiles SET weekly_xp = 0, monthly_xp = 0
WHERE weekly_xp_reset_week IS NULL OR weekly_xp = total_xp;

-- ---------------------------------------------------------------------------
-- 2. Create user_mastery table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_mastery (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    question_key TEXT NOT NULL,
    level INT DEFAULT 0,
    total_attempts INT DEFAULT 0,
    correct_attempts INT DEFAULT 0,
    current_streak INT DEFAULT 0,
    last_seen_at TIMESTAMPTZ DEFAULT NOW(),
    next_due_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, question_key)
);

-- ---------------------------------------------------------------------------
-- 3. Create user_daily_state table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_daily_state (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    state_date DATE NOT NULL DEFAULT CURRENT_DATE,
    quest_set_index INT DEFAULT 0,
    daily_quest_progress JSONB DEFAULT '[]'::jsonb,
    brand_blitz_count INT DEFAULT 0,
    quick_practice_count INT DEFAULT 0,
    spaced_review_count INT DEFAULT 0,
    double_xp_next_attempt BOOLEAN DEFAULT FALSE,
    active_boosts JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, state_date)
);

-- ---------------------------------------------------------------------------
-- 4. Create user_inventory table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS user_inventory (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES profiles(id) ON DELETE CASCADE UNIQUE,
    fifty_fifty_count INT DEFAULT 1,
    shield_heart_count INT DEFAULT 1,
    pharma_vision_count INT DEFAULT 1,
    fifty_fifty_enhanced BOOLEAN DEFAULT FALSE,
    shield_heart_enhanced BOOLEAN DEFAULT FALSE,
    pharma_vision_enhanced BOOLEAN DEFAULT FALSE,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ---------------------------------------------------------------------------
-- 5. Create clinical_qotd_answers table
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS clinical_qotd_answers (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    answer_date DATE NOT NULL,
    question_id TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, answer_date)
);

-- ---------------------------------------------------------------------------
-- 6. Create xp_events table (idempotency)
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS xp_events (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    idempotency_key TEXT NOT NULL,
    xp_awarded INT NOT NULL DEFAULT 0,
    coins_awarded INT NOT NULL DEFAULT 0,
    event_type TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, idempotency_key)
);

-- ---------------------------------------------------------------------------
-- 7. Friendship constraints
-- ---------------------------------------------------------------------------
DO $$ BEGIN
    ALTER TABLE friends ADD CONSTRAINT no_self_friend CHECK (user_id != friend_id);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

CREATE UNIQUE INDEX IF NOT EXISTS idx_friends_unique_pair
    ON friends (LEAST(user_id::TEXT, friend_id::TEXT), GREATEST(user_id::TEXT, friend_id::TEXT));

-- ---------------------------------------------------------------------------
-- 8. Indexes
-- ---------------------------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_profiles_weekly_xp ON profiles(weekly_xp DESC);
CREATE INDEX IF NOT EXISTS idx_profiles_monthly_xp ON profiles(monthly_xp DESC);
CREATE INDEX IF NOT EXISTS idx_profiles_school ON profiles(school) WHERE school != '';
CREATE INDEX IF NOT EXISTS idx_profiles_username ON profiles(username);
CREATE INDEX IF NOT EXISTS idx_user_mastery_user ON user_mastery(user_id);
CREATE INDEX IF NOT EXISTS idx_user_mastery_due ON user_mastery(user_id, next_due_at);
CREATE INDEX IF NOT EXISTS idx_clinical_qotd_user_date ON clinical_qotd_answers(user_id, answer_date);
CREATE INDEX IF NOT EXISTS idx_xp_events_idem ON xp_events(user_id, idempotency_key);
CREATE INDEX IF NOT EXISTS idx_friends_user ON friends(user_id, status);
CREATE INDEX IF NOT EXISTS idx_friends_friend ON friends(friend_id, status);
CREATE INDEX IF NOT EXISTS idx_user_daily_state_lookup ON user_daily_state(user_id, state_date);

-- ---------------------------------------------------------------------------
-- 9. updated_at triggers
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS set_profiles_updated_at ON profiles;
CREATE TRIGGER set_profiles_updated_at
    BEFORE UPDATE ON profiles
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS set_user_inventory_updated_at ON user_inventory;
CREATE TRIGGER set_user_inventory_updated_at
    BEFORE UPDATE ON user_inventory
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS set_user_mastery_updated_at ON user_mastery;
CREATE TRIGGER set_user_mastery_updated_at
    BEFORE UPDATE ON user_mastery
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ---------------------------------------------------------------------------
-- 10. RPC: ensure_profile
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION ensure_profile(
    p_username TEXT,
    p_profession TEXT
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_profile JSONB;
BEGIN
    INSERT INTO profiles (id, username, profession, school,
        avatar_animal, avatar_eyes, avatar_mouth, avatar_accessory,
        avatar_body_color, avatar_bg_color,
        total_xp, coins, current_streak, streak_saves, hearts, level,
        weekly_xp, monthly_xp,
        completed_subsections, subsection_stars, has_seen_learning,
        questions_answered, questions_correct,
        owned_avatars, owned_eyes, owned_mouths, owned_accessories,
        profession_donations, clinical_aura_points)
    VALUES (v_uid, p_username, p_profession, '',
        'beaver', 'normal', 'smile', 'none', '', '',
        0, 50, 0, 0, 5, 1, 0, 0,
        '[]', '{}', '[]', 0, 0,
        '["beaver","bird","bunny","cat"]',
        '["normal","happy","big"]',
        '["smile","bigSmile","tiny"]',
        '["none"]', 0, 0)
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO user_inventory (user_id) VALUES (v_uid) ON CONFLICT (user_id) DO NOTHING;

    SELECT to_jsonb(p) INTO v_profile FROM profiles p WHERE p.id = v_uid;
    RETURN v_profile;
END;
$$;

-- ---------------------------------------------------------------------------
-- 11. RPC: apply_quiz_completion
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
    v_uid TEXT := auth.uid()::TEXT;
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
        level = (v_row.total_xp / 500) + 1
    WHERE id = v_uid;

    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 12. RPC: apply_heart_loss
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION apply_heart_loss()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    UPDATE profiles SET
        hearts = GREATEST(hearts - 1, 0),
        last_heart_loss_date = CASE
            WHEN last_heart_loss_date IS NULL OR hearts = 5 THEN NOW()
            ELSE last_heart_loss_date
        END
    WHERE id = v_uid AND hearts > 0;

    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 13. RPC: apply_heart_regen
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION apply_heart_regen(p_new_hearts INT, p_new_loss_date TIMESTAMPTZ)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    UPDATE profiles SET
        hearts = LEAST(p_new_hearts, 5),
        last_heart_loss_date = p_new_loss_date
    WHERE id = v_uid;

    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 14. RPC: apply_clinical_qotd
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION apply_clinical_qotd(
    p_question_id TEXT,
    p_is_correct BOOLEAN,
    p_answer_date DATE
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_already BOOLEAN;
    v_points INT;
BEGIN
    SELECT EXISTS(
        SELECT 1 FROM clinical_qotd_answers
        WHERE user_id = v_uid AND answer_date = p_answer_date
    ) INTO v_already;

    IF v_already THEN
        SELECT clinical_aura_points INTO v_points FROM profiles WHERE id = v_uid;
        RETURN jsonb_build_object('already_answered', true, 'clinical_aura_points', v_points);
    END IF;

    INSERT INTO clinical_qotd_answers (user_id, answer_date, question_id, is_correct)
    VALUES (v_uid, p_answer_date, p_question_id, p_is_correct);

    IF p_is_correct THEN
        UPDATE profiles SET clinical_aura_points = clinical_aura_points + 1 WHERE id = v_uid;
    ELSE
        UPDATE profiles SET clinical_aura_points = clinical_aura_points - 1 WHERE id = v_uid;
    END IF;

    SELECT clinical_aura_points INTO v_points FROM profiles WHERE id = v_uid;
    RETURN jsonb_build_object('already_answered', false, 'clinical_aura_points', v_points);
END;
$$;

-- ---------------------------------------------------------------------------
-- 15. RPC: fetch_cqotd_history
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_cqotd_history()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    RETURN COALESCE(
        (SELECT jsonb_object_agg(answer_date::TEXT, is_correct)
         FROM clinical_qotd_answers WHERE user_id = v_uid),
        '{}'::JSONB
    );
END;
$$;

-- ---------------------------------------------------------------------------
-- 16. RPC: purchase_avatar_item
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION purchase_avatar_item(
    p_item_type TEXT,
    p_item_name TEXT,
    p_cost INT
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_coins INT;
    v_owned JSONB;
    v_col TEXT;
BEGIN
    SELECT coins INTO v_coins FROM profiles WHERE id = v_uid FOR UPDATE;

    IF v_coins < p_cost THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not enough coins');
    END IF;

    CASE p_item_type
        WHEN 'avatar' THEN v_col := 'owned_avatars';
        WHEN 'eyes' THEN v_col := 'owned_eyes';
        WHEN 'mouth' THEN v_col := 'owned_mouths';
        WHEN 'accessory' THEN v_col := 'owned_accessories';
        ELSE RETURN jsonb_build_object('success', false, 'error', 'Invalid item type');
    END CASE;

    EXECUTE format('SELECT (%I)::JSONB FROM profiles WHERE id = $1', v_col)
        INTO v_owned USING v_uid;

    IF v_owned @> to_jsonb(p_item_name) THEN
        RETURN jsonb_build_object('success', false, 'error', 'Already owned');
    END IF;

    v_owned := v_owned || to_jsonb(ARRAY[p_item_name]);

    EXECUTE format('UPDATE profiles SET %I = $1::TEXT, coins = coins - $2 WHERE id = $3', v_col)
        USING v_owned, p_cost, v_uid;

    RETURN (SELECT jsonb_build_object('success', true) || to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 17. RPC: save_avatar_selection
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION save_avatar_selection(
    p_animal TEXT,
    p_eyes TEXT,
    p_mouth TEXT,
    p_accessory TEXT,
    p_body_color TEXT,
    p_bg_color TEXT
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    UPDATE profiles SET
        avatar_animal = p_animal,
        avatar_eyes = p_eyes,
        avatar_mouth = p_mouth,
        avatar_accessory = p_accessory,
        avatar_body_color = p_body_color,
        avatar_bg_color = p_bg_color
    WHERE id = v_uid;

    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 18. RPC: complete_onboarding
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION complete_onboarding(
    p_school TEXT,
    p_animal TEXT,
    p_eyes TEXT,
    p_mouth TEXT,
    p_accessory TEXT,
    p_body_color TEXT,
    p_bg_color TEXT
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    UPDATE profiles SET
        school = p_school,
        avatar_animal = p_animal,
        avatar_eyes = p_eyes,
        avatar_mouth = p_mouth,
        avatar_accessory = p_accessory,
        avatar_body_color = p_body_color,
        avatar_bg_color = p_bg_color
    WHERE id = v_uid;

    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 19. RPC: save_profile_info
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION save_profile_info(
    p_username TEXT,
    p_profession TEXT,
    p_school TEXT
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    UPDATE profiles SET
        username = p_username,
        profession = p_profession,
        school = p_school
    WHERE id = v_uid;

    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 20. RPC: purchase_powerup
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION purchase_powerup(
    p_type TEXT,
    p_cost INT,
    p_max_capacity INT
) RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_coins INT;
    v_inv user_inventory%ROWTYPE;
    v_count INT;
    v_col TEXT;
BEGIN
    SELECT coins INTO v_coins FROM profiles WHERE id = v_uid FOR UPDATE;
    IF v_coins < p_cost THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not enough coins');
    END IF;

    SELECT * INTO v_inv FROM user_inventory WHERE user_id = v_uid FOR UPDATE;
    IF NOT FOUND THEN
        INSERT INTO user_inventory (user_id) VALUES (v_uid);
        SELECT * INTO v_inv FROM user_inventory WHERE user_id = v_uid FOR UPDATE;
    END IF;

    CASE p_type
        WHEN 'fiftyFifty' THEN v_count := v_inv.fifty_fifty_count; v_col := 'fifty_fifty_count';
        WHEN 'shieldHeart' THEN v_count := v_inv.shield_heart_count; v_col := 'shield_heart_count';
        WHEN 'pharmaVision' THEN v_count := v_inv.pharma_vision_count; v_col := 'pharma_vision_count';
        ELSE RETURN jsonb_build_object('success', false, 'error', 'Invalid type');
    END CASE;

    IF v_count >= p_max_capacity THEN
        RETURN jsonb_build_object('success', false, 'error', 'At capacity');
    END IF;

    EXECUTE format('UPDATE user_inventory SET %I = %I + 1 WHERE user_id = $1', v_col, v_col) USING v_uid;
    UPDATE profiles SET coins = coins - p_cost WHERE id = v_uid;

    RETURN jsonb_build_object('success', true)
        || (SELECT to_jsonb(i) FROM user_inventory i WHERE i.user_id = v_uid)
        || jsonb_build_object('coins', (SELECT coins FROM profiles WHERE id = v_uid));
END;
$$;

-- ---------------------------------------------------------------------------
-- 21. RPC: consume_powerup
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION consume_powerup(p_type TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_count INT;
    v_col TEXT;
BEGIN
    CASE p_type
        WHEN 'fiftyFifty' THEN v_col := 'fifty_fifty_count';
        WHEN 'shieldHeart' THEN v_col := 'shield_heart_count';
        WHEN 'pharmaVision' THEN v_col := 'pharma_vision_count';
        ELSE RETURN jsonb_build_object('success', false);
    END CASE;

    EXECUTE format('SELECT %I FROM user_inventory WHERE user_id = $1 FOR UPDATE', v_col)
        INTO v_count USING v_uid;

    IF v_count IS NULL OR v_count <= 0 THEN
        RETURN jsonb_build_object('success', false);
    END IF;

    EXECUTE format('UPDATE user_inventory SET %I = %I - 1 WHERE user_id = $1', v_col, v_col) USING v_uid;

    RETURN jsonb_build_object('success', true)
        || (SELECT to_jsonb(i) FROM user_inventory i WHERE i.user_id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 22. RPC: donate_profession
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION donate_profession(p_amount INT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_coins INT;
BEGIN
    SELECT coins INTO v_coins FROM profiles WHERE id = v_uid FOR UPDATE;
    IF v_coins < p_amount THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not enough coins');
    END IF;

    UPDATE profiles SET
        coins = coins - p_amount,
        profession_donations = profession_donations + p_amount
    WHERE id = v_uid;

    RETURN jsonb_build_object('success', true)
        || (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 23. RPC: send_friend_request
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION send_friend_request(p_friend_username TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_target_id TEXT;
    v_existing RECORD;
BEGIN
    SELECT id INTO v_target_id FROM profiles WHERE username = p_friend_username LIMIT 1;
    IF v_target_id IS NULL THEN
        RETURN jsonb_build_object('success', false, 'error', 'User not found');
    END IF;

    IF v_target_id = v_uid THEN
        RETURN jsonb_build_object('success', false, 'error', 'Cannot add yourself');
    END IF;

    SELECT * INTO v_existing FROM friends
    WHERE (user_id = v_uid AND friend_id = v_target_id)
       OR (user_id = v_target_id AND friend_id = v_uid)
    LIMIT 1;

    IF FOUND THEN
        IF v_existing.status = 'accepted' THEN
            RETURN jsonb_build_object('success', false, 'error', 'Already friends');
        END IF;
        RETURN jsonb_build_object('success', false, 'error', 'Request already pending');
    END IF;

    INSERT INTO friends (user_id, friend_id, status)
    VALUES (v_uid, v_target_id, 'pending');

    RETURN jsonb_build_object('success', true, 'friend_id', v_target_id);
END;
$$;

-- ---------------------------------------------------------------------------
-- 24. RPC: accept_friend_request
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION accept_friend_request(p_request_id UUID)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_req RECORD;
BEGIN
    SELECT * INTO v_req FROM friends WHERE id = p_request_id;
    IF NOT FOUND THEN
        RETURN jsonb_build_object('success', false, 'error', 'Request not found');
    END IF;

    IF v_req.friend_id != v_uid THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not authorized');
    END IF;

    UPDATE friends SET status = 'accepted' WHERE id = p_request_id;
    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 25. RPC: remove_friend
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION remove_friend(p_friend_id TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    DELETE FROM friends
    WHERE (user_id = v_uid AND friend_id = p_friend_id)
       OR (user_id = p_friend_id AND friend_id = v_uid);

    RETURN jsonb_build_object('success', true);
END;
$$;

-- ---------------------------------------------------------------------------
-- 26. RPC: save_daily_state
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION save_daily_state(
    p_quest_progress JSONB,
    p_brand_blitz_count INT,
    p_quick_practice_count INT,
    p_spaced_review_count INT,
    p_double_xp BOOLEAN,
    p_active_boosts JSONB,
    p_quest_set_index INT
) RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_today DATE := CURRENT_DATE;
BEGIN
    INSERT INTO user_daily_state (user_id, state_date, quest_set_index, daily_quest_progress,
        brand_blitz_count, quick_practice_count, spaced_review_count,
        double_xp_next_attempt, active_boosts)
    VALUES (v_uid, v_today, p_quest_set_index, p_quest_progress,
        p_brand_blitz_count, p_quick_practice_count, p_spaced_review_count,
        p_double_xp, p_active_boosts)
    ON CONFLICT (user_id, state_date) DO UPDATE SET
        quest_set_index = EXCLUDED.quest_set_index,
        daily_quest_progress = EXCLUDED.daily_quest_progress,
        brand_blitz_count = EXCLUDED.brand_blitz_count,
        quick_practice_count = EXCLUDED.quick_practice_count,
        spaced_review_count = EXCLUDED.spaced_review_count,
        double_xp_next_attempt = EXCLUDED.double_xp_next_attempt,
        active_boosts = EXCLUDED.active_boosts;
END;
$$;

-- ---------------------------------------------------------------------------
-- 27. RPC: fetch_daily_state
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_daily_state()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_today DATE := CURRENT_DATE;
    v_result JSONB;
BEGIN
    SELECT to_jsonb(d) INTO v_result
    FROM user_daily_state d
    WHERE d.user_id = v_uid AND d.state_date = v_today;

    RETURN COALESCE(v_result, '{}'::JSONB);
END;
$$;

-- ---------------------------------------------------------------------------
-- 28. RPC: save_mastery_batch
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION save_mastery_batch(p_records JSONB)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_rec JSONB;
BEGIN
    FOR v_rec IN SELECT * FROM jsonb_array_elements(p_records) LOOP
        INSERT INTO user_mastery (user_id, question_key, level, total_attempts,
            correct_attempts, current_streak, last_seen_at, next_due_at)
        VALUES (
            v_uid,
            v_rec->>'question_key',
            (v_rec->>'level')::INT,
            (v_rec->>'total_attempts')::INT,
            (v_rec->>'correct_attempts')::INT,
            (v_rec->>'current_streak')::INT,
            to_timestamp((v_rec->>'last_seen_at')::DOUBLE PRECISION),
            to_timestamp((v_rec->>'next_due_at')::DOUBLE PRECISION)
        )
        ON CONFLICT (user_id, question_key) DO UPDATE SET
            level = EXCLUDED.level,
            total_attempts = EXCLUDED.total_attempts,
            correct_attempts = EXCLUDED.correct_attempts,
            current_streak = EXCLUDED.current_streak,
            last_seen_at = EXCLUDED.last_seen_at,
            next_due_at = EXCLUDED.next_due_at;
    END LOOP;
END;
$$;

-- ---------------------------------------------------------------------------
-- 29. RPC: fetch_mastery
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_mastery()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    RETURN COALESCE(
        (SELECT jsonb_object_agg(
            m.question_key,
            jsonb_build_object(
                'level', m.level,
                'total_attempts', m.total_attempts,
                'correct_attempts', m.correct_attempts,
                'current_streak', m.current_streak,
                'last_seen_at', EXTRACT(EPOCH FROM m.last_seen_at),
                'next_due_at', EXTRACT(EPOCH FROM m.next_due_at)
            )
        ) FROM user_mastery m WHERE m.user_id = v_uid),
        '{}'::JSONB
    );
END;
$$;

-- ---------------------------------------------------------------------------
-- 30. RPC: fetch_inventory
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fetch_inventory()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_result JSONB;
BEGIN
    SELECT to_jsonb(i) INTO v_result FROM user_inventory i WHERE i.user_id = v_uid;
    IF v_result IS NULL THEN
        INSERT INTO user_inventory (user_id) VALUES (v_uid);
        SELECT to_jsonb(i) INTO v_result FROM user_inventory i WHERE i.user_id = v_uid;
    END IF;
    RETURN v_result;
END;
$$;

-- ---------------------------------------------------------------------------
-- 31. RPC: spend_coins (general purpose coin spend)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION spend_coins(p_amount INT, p_reason TEXT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_coins INT;
BEGIN
    SELECT coins INTO v_coins FROM profiles WHERE id = v_uid FOR UPDATE;
    IF v_coins < p_amount THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not enough coins');
    END IF;

    UPDATE profiles SET coins = coins - p_amount WHERE id = v_uid;

    RETURN jsonb_build_object('success', true, 'coins', v_coins - p_amount);
END;
$$;

-- ---------------------------------------------------------------------------
-- 32. RPC: add_coins (for quest rewards, etc.)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_coins(p_amount INT, p_reason TEXT, p_idempotency_key TEXT DEFAULT NULL)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    IF p_idempotency_key IS NOT NULL THEN
        IF EXISTS(SELECT 1 FROM xp_events WHERE user_id = v_uid AND idempotency_key = p_idempotency_key) THEN
            RETURN jsonb_build_object('success', true, 'coins', (SELECT coins FROM profiles WHERE id = v_uid));
        END IF;
        INSERT INTO xp_events (user_id, idempotency_key, xp_awarded, coins_awarded, event_type)
        VALUES (v_uid, p_idempotency_key, 0, p_amount, p_reason);
    END IF;

    UPDATE profiles SET coins = coins + p_amount WHERE id = v_uid;
    RETURN jsonb_build_object('success', true, 'coins', (SELECT coins FROM profiles WHERE id = v_uid));
END;
$$;

-- ---------------------------------------------------------------------------
-- 33. RPC: refill_hearts
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION refill_hearts(p_cost INT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_coins INT;
BEGIN
    SELECT coins INTO v_coins FROM profiles WHERE id = v_uid FOR UPDATE;
    IF v_coins < p_cost THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not enough coins');
    END IF;

    UPDATE profiles SET
        coins = coins - p_cost,
        hearts = 5,
        last_heart_loss_date = NULL
    WHERE id = v_uid;

    RETURN (SELECT jsonb_build_object('success', true) || to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 34. RPC: add_heart (single heart from ad watch)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_heart()
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
BEGIN
    UPDATE profiles SET hearts = LEAST(hearts + 1, 5) WHERE id = v_uid;
    RETURN (SELECT to_jsonb(p) FROM profiles p WHERE p.id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 35. RPC: enhance_powerup
-- ---------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION enhance_powerup(p_type TEXT, p_cost INT)
RETURNS JSONB
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
    v_uid TEXT := auth.uid()::TEXT;
    v_coins INT;
    v_col TEXT;
    v_already BOOLEAN;
BEGIN
    SELECT coins INTO v_coins FROM profiles WHERE id = v_uid FOR UPDATE;
    IF v_coins < p_cost THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not enough coins');
    END IF;

    CASE p_type
        WHEN 'fiftyFifty' THEN v_col := 'fifty_fifty_enhanced';
        WHEN 'shieldHeart' THEN v_col := 'shield_heart_enhanced';
        WHEN 'pharmaVision' THEN v_col := 'pharma_vision_enhanced';
        ELSE RETURN jsonb_build_object('success', false, 'error', 'Invalid type');
    END CASE;

    EXECUTE format('SELECT %I FROM user_inventory WHERE user_id = $1', v_col)
        INTO v_already USING v_uid;

    IF v_already THEN
        RETURN jsonb_build_object('success', false, 'error', 'Already enhanced');
    END IF;

    EXECUTE format('UPDATE user_inventory SET %I = true WHERE user_id = $1', v_col) USING v_uid;
    UPDATE profiles SET coins = coins - p_cost WHERE id = v_uid;

    RETURN jsonb_build_object('success', true, 'coins', (SELECT coins FROM profiles WHERE id = v_uid))
        || (SELECT to_jsonb(i) FROM user_inventory i WHERE i.user_id = v_uid);
END;
$$;

-- ---------------------------------------------------------------------------
-- 36. Leaderboard views (for efficient querying)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE VIEW weekly_leaderboard AS
SELECT id, username, avatar_animal, avatar_eyes, avatar_mouth, avatar_accessory,
       avatar_body_color, avatar_bg_color, weekly_xp, current_streak, level, profession, school
FROM profiles
ORDER BY weekly_xp DESC;

CREATE OR REPLACE VIEW school_monthly_rankings AS
SELECT school, SUM(monthly_xp) as total_xp, COUNT(*) as member_count
FROM profiles
WHERE school != '' AND school IS NOT NULL
GROUP BY school
ORDER BY total_xp DESC;

CREATE OR REPLACE VIEW profession_rankings AS
SELECT profession, SUM(profession_donations) as total_donations, COUNT(*) as member_count
FROM profiles
WHERE profession != '' AND profession IS NOT NULL AND profession_donations > 0
GROUP BY profession
ORDER BY total_donations DESC;

-- ---------------------------------------------------------------------------
-- 37. RLS Policies (enable RLS on new tables)
-- ---------------------------------------------------------------------------
ALTER TABLE user_mastery ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_daily_state ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_inventory ENABLE ROW LEVEL SECURITY;
ALTER TABLE clinical_qotd_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE xp_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own mastery" ON user_mastery
    FOR SELECT USING (user_id = auth.uid()::TEXT);
CREATE POLICY "Users can read own daily state" ON user_daily_state
    FOR SELECT USING (user_id = auth.uid()::TEXT);
CREATE POLICY "Users can read own inventory" ON user_inventory
    FOR SELECT USING (user_id = auth.uid()::TEXT);
CREATE POLICY "Users can read own qotd answers" ON clinical_qotd_answers
    FOR SELECT USING (user_id = auth.uid()::TEXT);
CREATE POLICY "Users can read own xp events" ON xp_events
    FOR SELECT USING (user_id = auth.uid()::TEXT);

-- Profiles: users can read all (for leaderboard) but only update own non-economy fields
CREATE POLICY "Anyone can read profiles" ON profiles
    FOR SELECT USING (true);

-- NOTE: With RPCs using SECURITY DEFINER, direct INSERT/UPDATE/DELETE on
-- economy columns can be blocked. Only allow profile-info updates directly:
-- (The RPCs handle all economy mutations with row locking.)
