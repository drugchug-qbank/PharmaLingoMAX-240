-- ============================================================
-- PharmaLingo Duo Streak System — Full Migration
-- Run this in Supabase SQL Editor
-- ============================================================

-- 1. EVOLVE duo_partnerships table
-- ============================================================
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='best_shared_streak') THEN
    ALTER TABLE duo_partnerships ADD COLUMN best_shared_streak integer DEFAULT 0;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='shared_duo_streak_saves') THEN
    ALTER TABLE duo_partnerships ADD COLUMN shared_duo_streak_saves integer DEFAULT 0;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='duo_timezone') THEN
    ALTER TABLE duo_partnerships ADD COLUMN duo_timezone text DEFAULT 'America/New_York';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='last_both_safe_date') THEN
    ALTER TABLE duo_partnerships ADD COLUMN last_both_safe_date text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='current_day_safe_user1') THEN
    ALTER TABLE duo_partnerships ADD COLUMN current_day_safe_user1 boolean DEFAULT false;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='current_day_safe_user2') THEN
    ALTER TABLE duo_partnerships ADD COLUMN current_day_safe_user2 boolean DEFAULT false;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='current_safe_date_key') THEN
    ALTER TABLE duo_partnerships ADD COLUMN current_safe_date_key text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='accepted_at') THEN
    ALTER TABLE duo_partnerships ADD COLUMN accepted_at timestamptz;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='duo_partnerships' AND column_name='dissolved_at') THEN
    ALTER TABLE duo_partnerships ADD COLUMN dissolved_at timestamptz;
  END IF;
END $$;

-- 2. duo_daily_progress
-- ============================================================
CREATE TABLE IF NOT EXISTS duo_daily_progress (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  partnership_id uuid NOT NULL REFERENCES duo_partnerships(id) ON DELETE CASCADE,
  date_key text NOT NULL,
  user_id uuid NOT NULL,
  duo_points integer DEFAULT 0,
  xp_earned integer DEFAULT 0,
  questions_answered integer DEFAULT 0,
  lessons_completed integer DEFAULT 0,
  brand_blitz_completed integer DEFAULT 0,
  high_score_90_count integer DEFAULT 0,
  perfect_quiz_count integer DEFAULT 0,
  is_safe_for_day boolean DEFAULT false,
  source_events jsonb DEFAULT '[]'::jsonb,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(partnership_id, date_key, user_id)
);

CREATE INDEX IF NOT EXISTS idx_duo_daily_progress_lookup ON duo_daily_progress(partnership_id, date_key, user_id);

-- 3. duo_daily_missions
-- ============================================================
CREATE TABLE IF NOT EXISTS duo_daily_missions (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  partnership_id uuid NOT NULL REFERENCES duo_partnerships(id) ON DELETE CASCADE,
  date_key text NOT NULL,
  mission_index integer NOT NULL DEFAULT 0,
  mission_type text NOT NULL,
  title text NOT NULL,
  description text NOT NULL DEFAULT '',
  difficulty text NOT NULL DEFAULT 'easy',
  target_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  progress_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  completed boolean DEFAULT false,
  claimed boolean DEFAULT false,
  reward_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now(),
  UNIQUE(partnership_id, date_key, mission_index)
);

-- 4. duo_weekly_raids (evolve existing duo_weekly_quests or create new)
-- ============================================================
CREATE TABLE IF NOT EXISTS duo_weekly_raids (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  partnership_id uuid NOT NULL REFERENCES duo_partnerships(id) ON DELETE CASCADE,
  week_key text NOT NULL,
  quest_index integer NOT NULL DEFAULT 0,
  quest_type text NOT NULL,
  title text NOT NULL,
  description text NOT NULL DEFAULT '',
  target_value integer NOT NULL DEFAULT 10,
  user1_progress integer DEFAULT 0,
  user2_progress integer DEFAULT 0,
  reward_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  completed boolean DEFAULT false,
  claimed boolean DEFAULT false,
  claim_key text,
  created_at timestamptz DEFAULT now(),
  UNIQUE(partnership_id, week_key, quest_index)
);

-- 5. duo_milestone_claims
-- ============================================================
CREATE TABLE IF NOT EXISTS duo_milestone_claims (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  partnership_id uuid NOT NULL REFERENCES duo_partnerships(id) ON DELETE CASCADE,
  milestone_key text NOT NULL,
  user_id uuid NOT NULL,
  reward_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  claimed_at timestamptz DEFAULT now(),
  UNIQUE(partnership_id, milestone_key, user_id)
);

-- 6. duo_activity_feed
-- ============================================================
CREATE TABLE IF NOT EXISTS duo_activity_feed (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  partnership_id uuid NOT NULL REFERENCES duo_partnerships(id) ON DELETE CASCADE,
  actor_user_id uuid,
  event_type text NOT NULL,
  payload jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_duo_feed_partnership ON duo_activity_feed(partnership_id, created_at DESC);

-- 7. referrals
-- ============================================================
CREATE TABLE IF NOT EXISTS referrals (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  referrer_user_id uuid NOT NULL,
  referred_user_id uuid,
  referral_code text NOT NULL UNIQUE,
  status text DEFAULT 'pending',
  starter_pack_claimed boolean DEFAULT false,
  day3_claimed boolean DEFAULT false,
  day7_claimed boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_referrals_code ON referrals(referral_code);
CREATE INDEX IF NOT EXISTS idx_referrals_referrer ON referrals(referrer_user_id);

-- 8. duo_reward_claims (idempotency table)
-- ============================================================
CREATE TABLE IF NOT EXISTS duo_reward_claims (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid NOT NULL,
  claim_key text NOT NULL,
  reward_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
  claimed_at timestamptz DEFAULT now(),
  UNIQUE(user_id, claim_key)
);

-- ============================================================
-- RPC FUNCTIONS
-- ============================================================

-- Helper: get current duo date key with 3AM rollover
CREATE OR REPLACE FUNCTION duo_date_key(tz text DEFAULT 'America/New_York')
RETURNS text
LANGUAGE sql STABLE
AS $$
  SELECT to_char((now() AT TIME ZONE COALESCE(NULLIF(tz,''), 'America/New_York')) - interval '3 hours', 'YYYY-MM-DD');
$$;

-- Helper: get current week key
CREATE OR REPLACE FUNCTION duo_week_key()
RETURNS text
LANGUAGE sql STABLE
AS $$
  SELECT to_char(date_trunc('week', now()), 'IYYY-"W"IW');
$$;

-- ============================================================
-- send_duo_invite (evolve existing)
-- ============================================================
DROP FUNCTION IF EXISTS send_duo_invite(text);
CREATE OR REPLACE FUNCTION send_duo_invite(p_partner_id text)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_partner uuid := p_partner_id::uuid;
  v_existing_active int;
  v_existing_pending int;
  v_new_id uuid;
BEGIN
  IF v_user_id = v_partner THEN
    RETURN jsonb_build_object('success', false, 'error', 'Cannot partner with yourself');
  END IF;

  SELECT count(*) INTO v_existing_active
  FROM duo_partnerships
  WHERE status = 'active'
    AND (user_id = v_user_id OR partner_id = v_user_id OR user_id = v_partner OR partner_id = v_partner);

  IF v_existing_active > 0 THEN
    RETURN jsonb_build_object('success', false, 'error', 'One of you already has an active duo partner');
  END IF;

  SELECT count(*) INTO v_existing_pending
  FROM duo_partnerships
  WHERE status = 'pending'
    AND ((user_id = v_user_id AND partner_id = v_partner) OR (user_id = v_partner AND partner_id = v_user_id));

  IF v_existing_pending > 0 THEN
    RETURN jsonb_build_object('success', false, 'error', 'A pending invite already exists between you two');
  END IF;

  INSERT INTO duo_partnerships (id, user_id, partner_id, status, shared_streak, best_shared_streak, shared_duo_streak_saves, duo_timezone, created_at)
  VALUES (gen_random_uuid(), v_user_id, v_partner, 'pending', 0, 0, 0, 'America/New_York', now())
  RETURNING id INTO v_new_id;

  RETURN jsonb_build_object('success', true, 'partnership_id', v_new_id);
END;
$$;

-- ============================================================
-- accept_duo_invite (evolve existing)
-- ============================================================
DROP FUNCTION IF EXISTS accept_duo_invite(text);
CREATE OR REPLACE FUNCTION accept_duo_invite(p_partnership_id text)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_pid uuid := p_partnership_id::uuid;
  v_row duo_partnerships%ROWTYPE;
  v_existing int;
BEGIN
  SELECT * INTO v_row FROM duo_partnerships WHERE id = v_pid AND partner_id = v_user_id AND status = 'pending';
  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'error', 'Invite not found or already handled');
  END IF;

  SELECT count(*) INTO v_existing FROM duo_partnerships
  WHERE status = 'active' AND (user_id = v_user_id OR partner_id = v_user_id);
  IF v_existing > 0 THEN
    RETURN jsonb_build_object('success', false, 'error', 'You already have an active duo partner');
  END IF;

  UPDATE duo_partnerships SET status = 'active', accepted_at = now() WHERE id = v_pid;

  DELETE FROM duo_partnerships
  WHERE status = 'pending'
    AND id != v_pid
    AND (user_id = v_row.user_id OR partner_id = v_row.user_id OR user_id = v_user_id OR partner_id = v_user_id);

  INSERT INTO duo_activity_feed (partnership_id, actor_user_id, event_type, payload)
  VALUES (v_pid, v_user_id, 'partnership_started', '{}'::jsonb);

  RETURN jsonb_build_object('success', true);
END;
$$;

-- ============================================================
-- decline_duo_invite
-- ============================================================
DROP FUNCTION IF EXISTS decline_duo_invite(text);
CREATE OR REPLACE FUNCTION decline_duo_invite(p_partnership_id text)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_pid uuid := p_partnership_id::uuid;
BEGIN
  UPDATE duo_partnerships SET status = 'declined', dissolved_at = now()
  WHERE id = v_pid AND partner_id = v_user_id AND status = 'pending';

  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'error', 'Invite not found');
  END IF;

  RETURN jsonb_build_object('success', true);
END;
$$;

-- ============================================================
-- dissolve_duo
-- ============================================================
DROP FUNCTION IF EXISTS dissolve_duo(text);
CREATE OR REPLACE FUNCTION dissolve_duo(p_partnership_id text)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_pid uuid := p_partnership_id::uuid;
BEGIN
  UPDATE duo_partnerships SET status = 'dissolved', dissolved_at = now()
  WHERE id = v_pid AND status = 'active'
    AND (user_id = v_user_id OR partner_id = v_user_id);

  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'error', 'Partnership not found');
  END IF;

  INSERT INTO duo_activity_feed (partnership_id, actor_user_id, event_type, payload)
  VALUES (v_pid, v_user_id, 'partnership_dissolved', '{}'::jsonb);

  RETURN jsonb_build_object('success', true);
END;
$$;

-- ============================================================
-- report_duo_event — main Duo progress reporter
-- ============================================================
DROP FUNCTION IF EXISTS report_duo_event(text, text, integer, integer);
CREATE OR REPLACE FUNCTION report_duo_event(
  p_event_type text,
  p_event_detail text DEFAULT '',
  p_xp_amount integer DEFAULT 0,
  p_question_count integer DEFAULT 0,
  p_score_pct integer DEFAULT 0,
  p_is_brand_blitz boolean DEFAULT false,
  p_is_lesson boolean DEFAULT false,
  p_is_perfect boolean DEFAULT false
)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_partnership duo_partnerships%ROWTYPE;
  v_date_key text;
  v_is_user1 boolean;
  v_progress duo_daily_progress%ROWTYPE;
  v_new_points integer := 0;
  v_was_safe boolean;
  v_partner_safe boolean;
  v_both_safe_now boolean := false;
  v_daily_reward_given boolean := false;
BEGIN
  SELECT * INTO v_partnership FROM duo_partnerships
  WHERE status = 'active'
    AND (user_id = v_user_id OR partner_id = v_user_id)
  LIMIT 1;

  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'error', 'No active duo');
  END IF;

  v_is_user1 := (v_partnership.user_id = v_user_id);
  v_date_key := duo_date_key(v_partnership.duo_timezone);

  IF v_partnership.current_safe_date_key IS DISTINCT FROM v_date_key THEN
    UPDATE duo_partnerships SET
      current_day_safe_user1 = false,
      current_day_safe_user2 = false,
      current_safe_date_key = v_date_key
    WHERE id = v_partnership.id;
    v_partnership.current_day_safe_user1 := false;
    v_partnership.current_day_safe_user2 := false;
  END IF;

  INSERT INTO duo_daily_progress (partnership_id, date_key, user_id, duo_points, xp_earned, questions_answered, lessons_completed, brand_blitz_completed, high_score_90_count, perfect_quiz_count, is_safe_for_day)
  VALUES (v_partnership.id, v_date_key, v_user_id, 0, 0, 0, 0, 0, 0, 0, false)
  ON CONFLICT (partnership_id, date_key, user_id) DO NOTHING;

  SELECT * INTO v_progress FROM duo_daily_progress
  WHERE partnership_id = v_partnership.id AND date_key = v_date_key AND user_id = v_user_id;

  v_was_safe := v_progress.is_safe_for_day;

  UPDATE duo_daily_progress SET
    xp_earned = xp_earned + p_xp_amount,
    questions_answered = questions_answered + p_question_count,
    lessons_completed = lessons_completed + (CASE WHEN p_is_lesson THEN 1 ELSE 0 END),
    brand_blitz_completed = brand_blitz_completed + (CASE WHEN p_is_brand_blitz THEN 1 ELSE 0 END),
    high_score_90_count = high_score_90_count + (CASE WHEN p_score_pct >= 90 THEN 1 ELSE 0 END),
    perfect_quiz_count = perfect_quiz_count + (CASE WHEN p_is_perfect THEN 1 ELSE 0 END),
    updated_at = now()
  WHERE id = v_progress.id;

  SELECT * INTO v_progress FROM duo_daily_progress
  WHERE id = v_progress.id;

  v_new_points := 0;
  IF v_progress.brand_blitz_completed >= 1 THEN v_new_points := v_new_points + 1; END IF;
  IF v_progress.high_score_90_count >= 1 THEN v_new_points := v_new_points + 1; END IF;
  IF v_progress.xp_earned >= 100 THEN v_new_points := v_new_points + 1; END IF;
  IF v_progress.lessons_completed >= 1 AND v_progress.high_score_90_count >= 0 THEN
    IF v_progress.lessons_completed >= 1 THEN v_new_points := v_new_points + 1; END IF;
  END IF;
  IF v_progress.questions_answered >= 20 THEN v_new_points := v_new_points + 1; END IF;

  v_new_points := LEAST(v_new_points, 3);

  UPDATE duo_daily_progress SET
    duo_points = v_new_points,
    is_safe_for_day = (v_new_points >= 1),
    updated_at = now()
  WHERE id = v_progress.id;

  IF v_new_points >= 1 AND NOT v_was_safe THEN
    IF v_is_user1 THEN
      UPDATE duo_partnerships SET current_day_safe_user1 = true WHERE id = v_partnership.id;
      v_partnership.current_day_safe_user1 := true;
    ELSE
      UPDATE duo_partnerships SET current_day_safe_user2 = true WHERE id = v_partnership.id;
      v_partnership.current_day_safe_user2 := true;
    END IF;

    INSERT INTO duo_activity_feed (partnership_id, actor_user_id, event_type, payload)
    VALUES (v_partnership.id, v_user_id, 'user_safe', jsonb_build_object('duo_points', v_new_points));
  END IF;

  v_partner_safe := CASE WHEN v_is_user1 THEN v_partnership.current_day_safe_user2 ELSE v_partnership.current_day_safe_user1 END;
  v_both_safe_now := (v_new_points >= 1) AND v_partner_safe AND (v_partnership.last_both_safe_date IS DISTINCT FROM v_date_key);

  IF v_both_safe_now THEN
    UPDATE duo_partnerships SET
      shared_streak = shared_streak + 1,
      best_shared_streak = GREATEST(best_shared_streak, shared_streak + 1),
      last_both_safe_date = v_date_key
    WHERE id = v_partnership.id;

    INSERT INTO duo_activity_feed (partnership_id, actor_user_id, event_type, payload)
    VALUES (v_partnership.id, NULL, 'both_safe', jsonb_build_object('streak', v_partnership.shared_streak + 1, 'date', v_date_key));

    v_daily_reward_given := true;
  END IF;

  IF p_is_brand_blitz THEN
    UPDATE duo_weekly_raids SET
      user1_progress = user1_progress + (CASE WHEN v_is_user1 THEN 1 ELSE 0 END),
      user2_progress = user2_progress + (CASE WHEN NOT v_is_user1 THEN 1 ELSE 0 END),
      completed = (user1_progress + user2_progress + 1) >= target_value
    WHERE partnership_id = v_partnership.id
      AND week_key = duo_week_key()
      AND quest_type IN ('brand_blitz_rounds', 'mixed_activities')
      AND NOT completed;
  END IF;

  IF p_question_count > 0 THEN
    UPDATE duo_weekly_raids SET
      user1_progress = user1_progress + (CASE WHEN v_is_user1 THEN p_question_count ELSE 0 END),
      user2_progress = user2_progress + (CASE WHEN NOT v_is_user1 THEN p_question_count ELSE 0 END),
      completed = (user1_progress + user2_progress + p_question_count) >= target_value
    WHERE partnership_id = v_partnership.id
      AND week_key = duo_week_key()
      AND quest_type = 'questions_answered'
      AND NOT completed;
  END IF;

  IF p_xp_amount > 0 THEN
    UPDATE duo_weekly_raids SET
      user1_progress = user1_progress + (CASE WHEN v_is_user1 THEN p_xp_amount ELSE 0 END),
      user2_progress = user2_progress + (CASE WHEN NOT v_is_user1 THEN p_xp_amount ELSE 0 END),
      completed = (user1_progress + user2_progress + p_xp_amount) >= target_value
    WHERE partnership_id = v_partnership.id
      AND week_key = duo_week_key()
      AND quest_type = 'xp_earned'
      AND NOT completed;
  END IF;

  IF p_score_pct >= 90 THEN
    UPDATE duo_weekly_raids SET
      user1_progress = user1_progress + (CASE WHEN v_is_user1 THEN 1 ELSE 0 END),
      user2_progress = user2_progress + (CASE WHEN NOT v_is_user1 THEN 1 ELSE 0 END),
      completed = (user1_progress + user2_progress + 1) >= target_value
    WHERE partnership_id = v_partnership.id
      AND week_key = duo_week_key()
      AND quest_type IN ('high_score_quizzes', 'mixed_activities')
      AND NOT completed;
  END IF;

  IF p_is_perfect THEN
    UPDATE duo_weekly_raids SET
      user1_progress = user1_progress + (CASE WHEN v_is_user1 THEN 1 ELSE 0 END),
      user2_progress = user2_progress + (CASE WHEN NOT v_is_user1 THEN 1 ELSE 0 END),
      completed = (user1_progress + user2_progress + 1) >= target_value
    WHERE partnership_id = v_partnership.id
      AND week_key = duo_week_key()
      AND quest_type = 'perfect_quizzes'
      AND NOT completed;
  END IF;

  IF p_is_lesson THEN
    UPDATE duo_weekly_raids SET
      user1_progress = user1_progress + (CASE WHEN v_is_user1 THEN 1 ELSE 0 END),
      user2_progress = user2_progress + (CASE WHEN NOT v_is_user1 THEN 1 ELSE 0 END),
      completed = (user1_progress + user2_progress + 1) >= target_value
    WHERE partnership_id = v_partnership.id
      AND week_key = duo_week_key()
      AND quest_type IN ('lessons_completed', 'mixed_activities')
      AND NOT completed;
  END IF;

  UPDATE duo_daily_missions SET
    progress_payload = jsonb_build_object(
      'xp', v_progress.xp_earned + p_xp_amount,
      'questions', v_progress.questions_answered + p_question_count,
      'lessons', v_progress.lessons_completed + (CASE WHEN p_is_lesson THEN 1 ELSE 0 END),
      'brand_blitz', v_progress.brand_blitz_completed + (CASE WHEN p_is_brand_blitz THEN 1 ELSE 0 END),
      'high_scores', v_progress.high_score_90_count + (CASE WHEN p_score_pct >= 90 THEN 1 ELSE 0 END)
    ),
    completed = true
  WHERE partnership_id = v_partnership.id
    AND date_key = v_date_key
    AND NOT completed
    AND (
      (mission_type = 'brand_blitz' AND p_is_brand_blitz AND v_progress.brand_blitz_completed + 1 >= (target_payload->>'count')::int)
      OR (mission_type = 'high_score' AND p_score_pct >= 90 AND v_progress.high_score_90_count + 1 >= (target_payload->>'count')::int)
      OR (mission_type = 'xp_target' AND v_progress.xp_earned + p_xp_amount >= (target_payload->>'xp')::int)
      OR (mission_type = 'lessons' AND p_is_lesson AND v_progress.lessons_completed + 1 >= (target_payload->>'count')::int)
      OR (mission_type = 'questions' AND v_progress.questions_answered + p_question_count >= (target_payload->>'count')::int)
      OR (mission_type = 'combined_xp' AND v_progress.xp_earned + p_xp_amount >= (target_payload->>'xp')::int)
    );

  RETURN jsonb_build_object(
    'success', true,
    'duo_points', v_new_points,
    'is_safe', v_new_points >= 1,
    'both_safe', v_both_safe_now,
    'daily_reward', v_daily_reward_given
  );
END;
$$;

-- ============================================================
-- fetch_duo_dashboard
-- ============================================================
DROP FUNCTION IF EXISTS fetch_duo_dashboard();
CREATE OR REPLACE FUNCTION fetch_duo_dashboard()
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_partnership duo_partnerships%ROWTYPE;
  v_partner_id uuid;
  v_is_user1 boolean;
  v_date_key text;
  v_week_key text;
  v_my_progress duo_daily_progress%ROWTYPE;
  v_partner_progress duo_daily_progress%ROWTYPE;
  v_partner_profile profiles%ROWTYPE;
  v_missions jsonb;
  v_raids jsonb;
  v_milestones jsonb;
  v_feed jsonb;
  v_pending_invites jsonb;
  v_reset_hours numeric;
BEGIN
  SELECT * INTO v_partnership FROM duo_partnerships
  WHERE status = 'active' AND (user_id = v_user_id OR partner_id = v_user_id)
  LIMIT 1;

  SELECT jsonb_agg(jsonb_build_object(
    'id', dp.id,
    'sender_id', dp.user_id,
    'sender_name', p.username,
    'sender_avatar_animal', p.avatar_animal,
    'sender_avatar_eyes', p.avatar_eyes,
    'sender_avatar_mouth', p.avatar_mouth,
    'sender_avatar_accessory', p.avatar_accessory,
    'sender_avatar_body_color', p.avatar_body_color,
    'sender_avatar_bg_color', p.avatar_bg_color,
    'sender_level', p.level
  ))
  INTO v_pending_invites
  FROM duo_partnerships dp
  JOIN profiles p ON p.id = dp.user_id
  WHERE dp.partner_id = v_user_id AND dp.status = 'pending';

  IF NOT FOUND OR v_partnership.id IS NULL THEN
    RETURN jsonb_build_object(
      'has_partner', false,
      'pending_invites', COALESCE(v_pending_invites, '[]'::jsonb)
    );
  END IF;

  v_is_user1 := (v_partnership.user_id = v_user_id);
  v_partner_id := CASE WHEN v_is_user1 THEN v_partnership.partner_id ELSE v_partnership.user_id END;
  v_date_key := duo_date_key(v_partnership.duo_timezone);
  v_week_key := duo_week_key();

  IF v_partnership.current_safe_date_key IS DISTINCT FROM v_date_key THEN
    UPDATE duo_partnerships SET
      current_day_safe_user1 = false,
      current_day_safe_user2 = false,
      current_safe_date_key = v_date_key
    WHERE id = v_partnership.id;
    v_partnership.current_day_safe_user1 := false;
    v_partnership.current_day_safe_user2 := false;
  END IF;

  SELECT * INTO v_partner_profile FROM profiles WHERE id = v_partner_id;

  SELECT * INTO v_my_progress FROM duo_daily_progress
  WHERE partnership_id = v_partnership.id AND date_key = v_date_key AND user_id = v_user_id;

  SELECT * INTO v_partner_progress FROM duo_daily_progress
  WHERE partnership_id = v_partnership.id AND date_key = v_date_key AND user_id = v_partner_id;

  SELECT jsonb_agg(row_to_json(m)::jsonb ORDER BY m.mission_index)
  INTO v_missions
  FROM duo_daily_missions m
  WHERE m.partnership_id = v_partnership.id AND m.date_key = v_date_key;

  SELECT jsonb_agg(row_to_json(r)::jsonb ORDER BY r.quest_index)
  INTO v_raids
  FROM duo_weekly_raids r
  WHERE r.partnership_id = v_partnership.id AND r.week_key = v_week_key;

  SELECT jsonb_agg(jsonb_build_object('milestone_key', mc.milestone_key, 'claimed_at', mc.claimed_at))
  INTO v_milestones
  FROM duo_milestone_claims mc
  WHERE mc.partnership_id = v_partnership.id AND mc.user_id = v_user_id;

  SELECT jsonb_agg(row_to_json(f)::jsonb ORDER BY f.created_at DESC)
  INTO v_feed
  FROM (SELECT * FROM duo_activity_feed WHERE partnership_id = v_partnership.id ORDER BY created_at DESC LIMIT 30) f;

  v_reset_hours := EXTRACT(EPOCH FROM (
    (date_trunc('day', (now() AT TIME ZONE COALESCE(NULLIF(v_partnership.duo_timezone,''), 'America/New_York')) - interval '3 hours') + interval '1 day 3 hours')
    - (now() AT TIME ZONE COALESCE(NULLIF(v_partnership.duo_timezone,''), 'America/New_York'))
  )) / 3600.0;

  RETURN jsonb_build_object(
    'has_partner', true,
    'partnership', jsonb_build_object(
      'id', v_partnership.id,
      'user_id', v_partnership.user_id,
      'partner_id', v_partnership.partner_id,
      'shared_streak', v_partnership.shared_streak,
      'best_shared_streak', v_partnership.best_shared_streak,
      'shared_duo_streak_saves', v_partnership.shared_duo_streak_saves,
      'duo_timezone', v_partnership.duo_timezone,
      'last_both_safe_date', v_partnership.last_both_safe_date,
      'current_day_safe_user1', CASE WHEN v_is_user1 THEN v_partnership.current_day_safe_user1 ELSE v_partnership.current_day_safe_user2 END,
      'current_day_safe_user2', CASE WHEN v_is_user1 THEN v_partnership.current_day_safe_user2 ELSE v_partnership.current_day_safe_user1 END,
      'accepted_at', v_partnership.accepted_at,
      'created_at', v_partnership.created_at
    ),
    'partner', jsonb_build_object(
      'id', v_partner_id,
      'username', v_partner_profile.username,
      'avatar_animal', v_partner_profile.avatar_animal,
      'avatar_eyes', v_partner_profile.avatar_eyes,
      'avatar_mouth', v_partner_profile.avatar_mouth,
      'avatar_accessory', v_partner_profile.avatar_accessory,
      'avatar_body_color', v_partner_profile.avatar_body_color,
      'avatar_bg_color', v_partner_profile.avatar_bg_color,
      'level', v_partner_profile.level,
      'current_streak', v_partner_profile.current_streak,
      'weekly_xp', v_partner_profile.weekly_xp
    ),
    'my_progress', jsonb_build_object(
      'duo_points', COALESCE(v_my_progress.duo_points, 0),
      'is_safe', COALESCE(v_my_progress.is_safe_for_day, false),
      'xp_earned', COALESCE(v_my_progress.xp_earned, 0),
      'questions_answered', COALESCE(v_my_progress.questions_answered, 0),
      'lessons_completed', COALESCE(v_my_progress.lessons_completed, 0),
      'brand_blitz_completed', COALESCE(v_my_progress.brand_blitz_completed, 0),
      'high_score_90_count', COALESCE(v_my_progress.high_score_90_count, 0)
    ),
    'partner_progress', jsonb_build_object(
      'duo_points', COALESCE(v_partner_progress.duo_points, 0),
      'is_safe', COALESCE(v_partner_progress.is_safe_for_day, false),
      'xp_earned', COALESCE(v_partner_progress.xp_earned, 0),
      'questions_answered', COALESCE(v_partner_progress.questions_answered, 0),
      'lessons_completed', COALESCE(v_partner_progress.lessons_completed, 0),
      'brand_blitz_completed', COALESCE(v_partner_progress.brand_blitz_completed, 0),
      'high_score_90_count', COALESCE(v_partner_progress.high_score_90_count, 0)
    ),
    'daily_missions', COALESCE(v_missions, '[]'::jsonb),
    'weekly_raids', COALESCE(v_raids, '[]'::jsonb),
    'claimed_milestones', COALESCE(v_milestones, '[]'::jsonb),
    'activity_feed', COALESCE(v_feed, '[]'::jsonb),
    'pending_invites', COALESCE(v_pending_invites, '[]'::jsonb),
    'hours_until_reset', round(v_reset_hours::numeric, 1),
    'date_key', v_date_key,
    'is_user1', v_is_user1
  );
END;
$$;

-- ============================================================
-- fetch_or_generate_daily_duo_missions
-- ============================================================
CREATE OR REPLACE FUNCTION fetch_or_generate_daily_duo_missions(p_partnership_id text)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_pid uuid := p_partnership_id::uuid;
  v_date_key text;
  v_existing int;
  v_seed int;
  v_missions jsonb;
BEGIN
  SELECT duo_date_key(dp.duo_timezone) INTO v_date_key
  FROM duo_partnerships dp WHERE dp.id = v_pid;

  SELECT count(*) INTO v_existing FROM duo_daily_missions WHERE partnership_id = v_pid AND date_key = v_date_key;

  IF v_existing = 0 THEN
    v_seed := abs(hashtext(v_pid::text || v_date_key)) % 100;

    INSERT INTO duo_daily_missions (partnership_id, date_key, mission_index, mission_type, title, description, difficulty, target_payload, reward_payload)
    VALUES
      (v_pid, v_date_key, 0, 'brand_blitz',
       'Brand Blitz Duo',
       'Both complete 1 Brand Blitz round',
       'easy',
       '{"count": 1, "scope": "each"}'::jsonb,
       '{"coins": 25, "xp": 10}'::jsonb),
      (v_pid, v_date_key, 1,
       CASE WHEN v_seed < 33 THEN 'high_score' WHEN v_seed < 66 THEN 'questions' ELSE 'lessons' END,
       CASE WHEN v_seed < 33 THEN 'Score Masters' WHEN v_seed < 66 THEN 'Question Blitz' ELSE 'Lesson Grind' END,
       CASE WHEN v_seed < 33 THEN 'Both score 90%+ on any quiz' WHEN v_seed < 66 THEN 'Answer 15 questions together' ELSE 'Complete 2 lessons together' END,
       'medium',
       CASE WHEN v_seed < 33 THEN '{"count": 1, "scope": "each"}'::jsonb WHEN v_seed < 66 THEN '{"count": 15, "scope": "combined"}'::jsonb ELSE '{"count": 2, "scope": "combined"}'::jsonb END,
       '{"coins": 50, "xp": 25}'::jsonb),
      (v_pid, v_date_key, 2, 'combined_xp',
       'XP Surge',
       'Earn 200 XP together today',
       'hard',
       '{"xp": 200, "scope": "combined"}'::jsonb,
       '{"coins": 75, "xp": 40, "streak_save": 0}'::jsonb);
  END IF;

  SELECT jsonb_agg(row_to_json(m)::jsonb ORDER BY m.mission_index)
  INTO v_missions
  FROM duo_daily_missions m
  WHERE m.partnership_id = v_pid AND m.date_key = v_date_key;

  RETURN COALESCE(v_missions, '[]'::jsonb);
END;
$$;

-- ============================================================
-- fetch_or_generate_weekly_duo_raids
-- ============================================================
CREATE OR REPLACE FUNCTION fetch_or_generate_weekly_duo_raids(p_partnership_id text)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_pid uuid := p_partnership_id::uuid;
  v_week_key text := duo_week_key();
  v_existing int;
  v_seed int;
  v_raids jsonb;
BEGIN
  SELECT count(*) INTO v_existing FROM duo_weekly_raids WHERE partnership_id = v_pid AND week_key = v_week_key;

  IF v_existing = 0 THEN
    v_seed := abs(hashtext(v_pid::text || v_week_key)) % 50;

    INSERT INTO duo_weekly_raids (partnership_id, week_key, quest_index, quest_type, title, description, target_value, reward_payload)
    VALUES
      (v_pid, v_week_key, 0, 'xp_earned', 'XP Power Duo', 'Earn XP together this week', 500 + (v_seed * 10), '{"coins": 100, "xp": 50}'::jsonb),
      (v_pid, v_week_key, 1, 'brand_blitz_rounds', 'Brand Blitz Masters', 'Complete Brand Blitz rounds together', 5 + (v_seed % 3), '{"coins": 75, "powerup_fifty_fifty": 1}'::jsonb),
      (v_pid, v_week_key, 2, 'questions_answered', 'Question Marathon', 'Answer questions together', 60 + (v_seed * 2), '{"coins": 80, "xp": 30}'::jsonb),
      (v_pid, v_week_key, 3, 'high_score_quizzes', 'Ace It Together', 'Score 90%+ on quizzes', 4 + (v_seed % 2), '{"coins": 120, "streak_save": 1}'::jsonb),
      (v_pid, v_week_key, 4, 'lessons_completed', 'Lesson Leaders', 'Complete lessons together', 6 + (v_seed % 3), '{"coins": 150, "powerup_shield_heart": 1}'::jsonb);
  END IF;

  SELECT jsonb_agg(row_to_json(r)::jsonb ORDER BY r.quest_index)
  INTO v_raids
  FROM duo_weekly_raids r
  WHERE r.partnership_id = v_pid AND r.week_key = v_week_key;

  RETURN COALESCE(v_raids, '[]'::jsonb);
END;
$$;

-- ============================================================
-- claim_duo_reward (unified, idempotent)
-- ============================================================
DROP FUNCTION IF EXISTS claim_duo_reward(text);
CREATE OR REPLACE FUNCTION claim_duo_reward(
  p_claim_type text,
  p_claim_id text,
  p_claim_key text DEFAULT NULL
)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_ck text;
  v_reward jsonb;
  v_existing int;
BEGIN
  v_ck := COALESCE(p_claim_key, p_claim_type || ':' || p_claim_id || ':' || v_user_id::text);

  SELECT count(*) INTO v_existing FROM duo_reward_claims WHERE user_id = v_user_id AND claim_key = v_ck;
  IF v_existing > 0 THEN
    RETURN jsonb_build_object('success', false, 'error', 'Already claimed', 'duplicate', true);
  END IF;

  IF p_claim_type = 'weekly_raid' THEN
    SELECT reward_payload INTO v_reward FROM duo_weekly_raids WHERE id = p_claim_id::uuid AND completed = true;
    IF NOT FOUND THEN
      RETURN jsonb_build_object('success', false, 'error', 'Raid not found or not complete');
    END IF;
    UPDATE duo_weekly_raids SET claimed = true WHERE id = p_claim_id::uuid;

  ELSIF p_claim_type = 'daily_mission' THEN
    SELECT reward_payload INTO v_reward FROM duo_daily_missions WHERE id = p_claim_id::uuid AND completed = true;
    IF NOT FOUND THEN
      RETURN jsonb_build_object('success', false, 'error', 'Mission not found or not complete');
    END IF;
    UPDATE duo_daily_missions SET claimed = true WHERE id = p_claim_id::uuid;

  ELSIF p_claim_type = 'milestone' THEN
    v_reward := p_claim_id::jsonb;

  ELSE
    RETURN jsonb_build_object('success', false, 'error', 'Unknown claim type');
  END IF;

  INSERT INTO duo_reward_claims (user_id, claim_key, reward_payload) VALUES (v_user_id, v_ck, COALESCE(v_reward, '{}'::jsonb));

  IF v_reward IS NOT NULL THEN
    UPDATE profiles SET
      coins = coins + COALESCE((v_reward->>'coins')::int, 0),
      total_xp = total_xp + COALESCE((v_reward->>'xp')::int, 0),
      weekly_xp = weekly_xp + COALESCE((v_reward->>'xp')::int, 0),
      streak_saves = streak_saves + COALESCE((v_reward->>'streak_save')::int, 0),
      hearts = LEAST(5, hearts + COALESCE((v_reward->>'max_hearts')::int, 0))
    WHERE id = v_user_id;
  END IF;

  RETURN jsonb_build_object('success', true, 'reward', COALESCE(v_reward, '{}'::jsonb));
END;
$$;

-- ============================================================
-- claim_duo_milestone
-- ============================================================
CREATE OR REPLACE FUNCTION claim_duo_milestone(
  p_partnership_id text,
  p_milestone_key text,
  p_reward_payload jsonb
)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_pid uuid := p_partnership_id::uuid;
  v_existing int;
BEGIN
  SELECT count(*) INTO v_existing FROM duo_milestone_claims
  WHERE partnership_id = v_pid AND milestone_key = p_milestone_key AND user_id = v_user_id;

  IF v_existing > 0 THEN
    RETURN jsonb_build_object('success', false, 'error', 'Already claimed', 'duplicate', true);
  END IF;

  INSERT INTO duo_milestone_claims (partnership_id, milestone_key, user_id, reward_payload)
  VALUES (v_pid, p_milestone_key, v_user_id, p_reward_payload);

  UPDATE profiles SET
    coins = coins + COALESCE((p_reward_payload->>'coins')::int, 0),
    total_xp = total_xp + COALESCE((p_reward_payload->>'xp')::int, 0),
    weekly_xp = weekly_xp + COALESCE((p_reward_payload->>'xp')::int, 0),
    streak_saves = streak_saves + COALESCE((p_reward_payload->>'streak_save')::int, 0)
  WHERE id = v_user_id;

  INSERT INTO duo_activity_feed (partnership_id, actor_user_id, event_type, payload)
  VALUES (v_pid, v_user_id, 'milestone_claimed', jsonb_build_object('milestone', p_milestone_key));

  RETURN jsonb_build_object('success', true, 'reward', p_reward_payload);
END;
$$;

-- ============================================================
-- nudge_partner
-- ============================================================
CREATE OR REPLACE FUNCTION nudge_duo_partner(p_partnership_id text)
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_pid uuid := p_partnership_id::uuid;
  v_date_key text;
  v_existing int;
BEGIN
  SELECT duo_date_key(dp.duo_timezone) INTO v_date_key
  FROM duo_partnerships dp WHERE dp.id = v_pid AND status = 'active';

  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'error', 'Partnership not found');
  END IF;

  SELECT count(*) INTO v_existing FROM duo_activity_feed
  WHERE partnership_id = v_pid AND actor_user_id = v_user_id AND event_type = 'nudge'
    AND created_at > (now() - interval '24 hours');

  IF v_existing > 0 THEN
    RETURN jsonb_build_object('success', false, 'error', 'Already nudged today');
  END IF;

  INSERT INTO duo_activity_feed (partnership_id, actor_user_id, event_type, payload)
  VALUES (v_pid, v_user_id, 'nudge', jsonb_build_object('date', v_date_key));

  RETURN jsonb_build_object('success', true);
END;
$$;

-- ============================================================
-- generate_referral_code
-- ============================================================
CREATE OR REPLACE FUNCTION generate_referral_code()
RETURNS jsonb
LANGUAGE plpgsql SECURITY DEFINER
AS $$
DECLARE
  v_user_id uuid := auth.uid();
  v_code text;
  v_existing text;
BEGIN
  SELECT referral_code INTO v_existing FROM referrals WHERE referrer_user_id = v_user_id LIMIT 1;
  IF v_existing IS NOT NULL THEN
    RETURN jsonb_build_object('success', true, 'code', v_existing);
  END IF;

  v_code := 'PL-' || upper(substr(md5(v_user_id::text || now()::text), 1, 8));

  INSERT INTO referrals (referrer_user_id, referral_code, status) VALUES (v_user_id, v_code, 'pending');

  RETURN jsonb_build_object('success', true, 'code', v_code);
END;
$$;

-- ============================================================
-- RLS Policies
-- ============================================================
ALTER TABLE duo_daily_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE duo_daily_missions ENABLE ROW LEVEL SECURITY;
ALTER TABLE duo_weekly_raids ENABLE ROW LEVEL SECURITY;
ALTER TABLE duo_milestone_claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE duo_activity_feed ENABLE ROW LEVEL SECURITY;
ALTER TABLE duo_reward_claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE referrals ENABLE ROW LEVEL SECURITY;

-- Fix: cast auth.uid() to text since duo_partnerships.user_id/partner_id are text columns
DO $ BEGIN
  DROP POLICY IF EXISTS duo_daily_progress_user_access ON duo_daily_progress;
  CREATE POLICY duo_daily_progress_user_access ON duo_daily_progress FOR ALL
  USING (partnership_id IN (SELECT id FROM duo_partnerships WHERE user_id = auth.uid()::text OR partner_id = auth.uid()::text));

  DROP POLICY IF EXISTS duo_daily_missions_user_access ON duo_daily_missions;
  CREATE POLICY duo_daily_missions_user_access ON duo_daily_missions FOR ALL
  USING (partnership_id IN (SELECT id FROM duo_partnerships WHERE user_id = auth.uid()::text OR partner_id = auth.uid()::text));

  DROP POLICY IF EXISTS duo_weekly_raids_user_access ON duo_weekly_raids;
  CREATE POLICY duo_weekly_raids_user_access ON duo_weekly_raids FOR ALL
  USING (partnership_id IN (SELECT id FROM duo_partnerships WHERE user_id = auth.uid()::text OR partner_id = auth.uid()::text));

  DROP POLICY IF EXISTS duo_milestone_claims_user_access ON duo_milestone_claims;
  CREATE POLICY duo_milestone_claims_user_access ON duo_milestone_claims FOR ALL
  USING (partnership_id IN (SELECT id FROM duo_partnerships WHERE user_id = auth.uid()::text OR partner_id = auth.uid()::text));

  DROP POLICY IF EXISTS duo_activity_feed_user_access ON duo_activity_feed;
  CREATE POLICY duo_activity_feed_user_access ON duo_activity_feed FOR ALL
  USING (partnership_id IN (SELECT id FROM duo_partnerships WHERE user_id = auth.uid()::text OR partner_id = auth.uid()::text));

  DROP POLICY IF EXISTS duo_reward_claims_user_access ON duo_reward_claims;
  CREATE POLICY duo_reward_claims_user_access ON duo_reward_claims FOR ALL
  USING (user_id = auth.uid());

  DROP POLICY IF EXISTS referrals_user_access ON referrals;
  CREATE POLICY referrals_user_access ON referrals FOR ALL
  USING (referrer_user_id = auth.uid() OR referred_user_id = auth.uid());
END $;

-- Keep backward compat: ensure old RPCs still work for existing weekly quests
-- The fetch_duo_partnership and fetch_duo_weekly_quests RPCs remain unchanged
-- as they're used by the existing DuoQuestService until fully migrated
