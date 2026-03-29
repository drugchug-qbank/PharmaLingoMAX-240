import Foundation
import Supabase

@Observable
class DuoQuestService {
    static let shared = DuoQuestService()

    var currentPartnership: DuoPartnerInfo?
    var weeklyQuests: [DuoWeeklyQuest] = []
    var isLoading: Bool = false
    var hasPendingDuoInvite: Bool = false
    var pendingInviteFrom: LeaderboardRecord?
    var pendingPartnershipId: String?

    var dashboard: DuoDashboard = .empty
    var lastInviteError: String?
    var chestClaimedThisWeek: Bool = false

    private let supabase = SupabaseService.shared

    private init() {}

    // MARK: - Dashboard Loading

    func loadDuoData() async {
        isLoading = true
        defer { isLoading = false }

        await fetchDashboard()

        if !dashboard.hasPartner {
            await fetchPartnership()
            if let partner = currentPartnership {
                await fetchWeeklyQuests()
                await checkMysteryChestClaimed()
                buildSyntheticDashboard(from: partner)
            }
            await checkPendingInvites()
        } else {
            syncLegacyFromDashboard()
        }
    }

    private func buildSyntheticDashboard(from partner: DuoPartnerInfo) {
        let userId = supabase.currentUser?.id.uuidString.lowercased() ?? ""
        let syntheticPartnership = DuoDashboardPartnership(
            id: partner.partnershipId,
            userId: userId,
            partnerId: partner.partnerId,
            sharedStreak: partner.sharedStreak,
            bestSharedStreak: partner.sharedStreak,
            sharedDuoStreakSaves: 0,
            duoTimezone: "America/New_York",
            lastBothSafeDate: nil,
            mySafeToday: false,
            partnerSafeToday: false,
            acceptedAt: partner.createdAt,
            createdAt: partner.createdAt
        )
        let syntheticPartner = DuoDashboardPartner(
            id: partner.partnerId,
            username: partner.partnerName,
            avatar: partner.partnerAvatar,
            level: partner.partnerLevel,
            currentStreak: partner.partnerStreak,
            weeklyXP: partner.partnerWeeklyXP
        )
        let emptyProgress = DuoDailyProgress(duoPoints: 0, isSafe: false, xpEarned: 0, questionsAnswered: 0, lessonsCompleted: 0, brandBlitzCompleted: 0, highScore90Count: 0)

        dashboard = DuoDashboard(
            hasPartner: true,
            partnership: syntheticPartnership,
            partner: syntheticPartner,
            myProgress: emptyProgress,
            partnerProgress: emptyProgress,
            dailyMissions: dashboard.dailyMissions,
            weeklyRaids: dashboard.weeklyRaids,
            claimedMilestones: dashboard.claimedMilestones,
            activityFeed: dashboard.activityFeed,
            pendingInvites: dashboard.pendingInvites,
            hoursUntilReset: 24,
            dateKey: "",
            isUser1: true
        )

        Task {
            await generateDailyMissions(partnershipId: partner.partnershipId)
            await generateWeeklyRaids(partnershipId: partner.partnershipId)
        }
    }

    func fetchDashboard() async {
        do {
            let resultData = try await supabase.client.rpc("fetch_duo_dashboard", params: EmptyParams()).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any] ?? [:]

            let hasPartner = json["has_partner"] as? Bool ?? false

            guard hasPartner,
                  let partnershipDict = json["partnership"] as? [String: Any],
                  let partnerDict = json["partner"] as? [String: Any] else {

                let invites = parsePendingInvites(json["pending_invites"])
                dashboard = DuoDashboard(
                    hasPartner: false, partnership: nil, partner: nil,
                    myProgress: DuoDailyProgress(duoPoints: 0, isSafe: false, xpEarned: 0, questionsAnswered: 0, lessonsCompleted: 0, brandBlitzCompleted: 0, highScore90Count: 0),
                    partnerProgress: DuoDailyProgress(duoPoints: 0, isSafe: false, xpEarned: 0, questionsAnswered: 0, lessonsCompleted: 0, brandBlitzCompleted: 0, highScore90Count: 0),
                    dailyMissions: [], weeklyRaids: [], claimedMilestones: [], activityFeed: [],
                    pendingInvites: invites, hoursUntilReset: 24, dateKey: "", isUser1: true
                )

                if let first = invites.first {
                    hasPendingDuoInvite = true
                    pendingPartnershipId = first.id
                    pendingInviteFrom = LeaderboardRecord(
                        id: first.senderId, username: first.senderName,
                        avatarAnimal: first.senderAvatar.animal, avatarEyes: first.senderAvatar.eyes,
                        avatarMouth: first.senderAvatar.mouth, avatarAccessory: first.senderAvatar.accessory,
                        avatarBodyColor: first.senderAvatar.bodyColor, avatarBgColor: first.senderAvatar.bgColor,
                        weeklyXP: 0, currentStreak: 0, level: first.senderLevel, profession: "", school: ""
                    )
                }
                return
            }

            let pship = parseDashboardPartnership(partnershipDict)
            let partner = parseDashboardPartner(partnerDict)
            let myProg = parseProgress(json["my_progress"] as? [String: Any])
            let partnerProg = parseProgress(json["partner_progress"] as? [String: Any])
            let missions = parseDailyMissions(json["daily_missions"])
            let raids = parseWeeklyRaids(json["weekly_raids"])
            let claimed = parseClaimedMilestones(json["claimed_milestones"])
            let feed = parseFeed(json["activity_feed"])
            let invites = parsePendingInvites(json["pending_invites"])

            dashboard = DuoDashboard(
                hasPartner: true,
                partnership: pship,
                partner: partner,
                myProgress: myProg,
                partnerProgress: partnerProg,
                dailyMissions: missions,
                weeklyRaids: raids,
                claimedMilestones: claimed,
                activityFeed: feed,
                pendingInvites: invites,
                hoursUntilReset: json["hours_until_reset"] as? Double ?? 24,
                dateKey: json["date_key"] as? String ?? "",
                isUser1: json["is_user1"] as? Bool ?? true
            )

            if missions.isEmpty {
                await generateDailyMissions(partnershipId: pship.id)
            }
            if raids.isEmpty {
                await generateWeeklyRaids(partnershipId: pship.id)
            }

            syncLegacyFromDashboard()
        } catch {
            print("Failed to fetch duo dashboard: \(error)")
        }
    }

    private func syncLegacyFromDashboard() {
        guard let p = dashboard.partnership, let partner = dashboard.partner else {
            currentPartnership = nil
            return
        }
        currentPartnership = DuoPartnerInfo(
            partnershipId: p.id,
            partnerId: partner.id,
            partnerName: partner.username,
            partnerAvatar: partner.avatar,
            partnerLevel: partner.level,
            partnerStreak: partner.currentStreak,
            partnerWeeklyXP: partner.weeklyXP,
            sharedStreak: p.sharedStreak,
            createdAt: p.createdAt
        )
        hasPendingDuoInvite = !dashboard.pendingInvites.isEmpty
        if let first = dashboard.pendingInvites.first {
            pendingPartnershipId = first.id
        }
    }

    // MARK: - Generate Content

    func generateDailyMissions(partnershipId: String) async {
        do {
            let resultData = try await supabase.client.rpc("fetch_or_generate_daily_duo_missions", params: ["p_partnership_id": partnershipId]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData)
            if let arr = json as? [[String: Any]] {
                let missions = arr.enumerated().map { parseMission($0.element, index: $0.offset) }
                dashboard = DuoDashboard(
                    hasPartner: dashboard.hasPartner, partnership: dashboard.partnership, partner: dashboard.partner,
                    myProgress: dashboard.myProgress, partnerProgress: dashboard.partnerProgress,
                    dailyMissions: missions, weeklyRaids: dashboard.weeklyRaids,
                    claimedMilestones: dashboard.claimedMilestones, activityFeed: dashboard.activityFeed,
                    pendingInvites: dashboard.pendingInvites, hoursUntilReset: dashboard.hoursUntilReset,
                    dateKey: dashboard.dateKey, isUser1: dashboard.isUser1
                )
            }
        } catch {
            print("Failed to generate daily missions: \(error)")
        }
    }

    func generateWeeklyRaids(partnershipId: String) async {
        do {
            let resultData = try await supabase.client.rpc("fetch_or_generate_weekly_duo_raids", params: ["p_partnership_id": partnershipId]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData)
            if let arr = json as? [[String: Any]] {
                let raids = arr.enumerated().map { parseRaid($0.element, index: $0.offset) }
                dashboard = DuoDashboard(
                    hasPartner: dashboard.hasPartner, partnership: dashboard.partnership, partner: dashboard.partner,
                    myProgress: dashboard.myProgress, partnerProgress: dashboard.partnerProgress,
                    dailyMissions: dashboard.dailyMissions, weeklyRaids: raids,
                    claimedMilestones: dashboard.claimedMilestones, activityFeed: dashboard.activityFeed,
                    pendingInvites: dashboard.pendingInvites, hoursUntilReset: dashboard.hoursUntilReset,
                    dateKey: dashboard.dateKey, isUser1: dashboard.isUser1
                )
            }
        } catch {
            print("Failed to generate weekly raids: \(error)")
        }
    }

    // MARK: - Report Duo Event

    func reportDuoEvent(
        eventType: String,
        xpAmount: Int = 0,
        questionCount: Int = 0,
        scorePct: Int = 0,
        isBrandBlitz: Bool = false,
        isLesson: Bool = false,
        isPerfect: Bool = false
    ) async -> DuoEventResult? {
        guard dashboard.hasPartner || currentPartnership != nil else { return nil }
        do {
            let resultData = try await supabase.client.rpc("report_duo_event", params: [
                "p_event_type": AnyEncodableValue.string(eventType),
                "p_event_detail": AnyEncodableValue.string(""),
                "p_xp_amount": AnyEncodableValue.int(xpAmount),
                "p_question_count": AnyEncodableValue.int(questionCount),
                "p_score_pct": AnyEncodableValue.int(scorePct),
                "p_is_brand_blitz": AnyEncodableValue.bool(isBrandBlitz),
                "p_is_lesson": AnyEncodableValue.bool(isLesson),
                "p_is_perfect": AnyEncodableValue.bool(isPerfect),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any] ?? [:]
            return DuoEventResult(
                success: json["success"] as? Bool ?? false,
                duoPoints: json["duo_points"] as? Int ?? 0,
                isSafe: json["is_safe"] as? Bool ?? false,
                bothSafe: json["both_safe"] as? Bool ?? false,
                dailyReward: json["daily_reward"] as? Bool ?? false
            )
        } catch {
            print("Failed to report duo event: \(error)")
            return nil
        }
    }

    // MARK: - Claim Rewards

    func claimDuoReward(claimType: String, claimId: String) async -> DuoRewardPayload? {
        do {
            let resultData = try await supabase.client.rpc("claim_duo_reward", params: [
                "p_claim_type": AnyEncodableValue.string(claimType),
                "p_claim_id": AnyEncodableValue.string(claimId),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any] ?? [:]
            let success = json["success"] as? Bool ?? false
            guard success else { return nil }
            let rewardDict = json["reward"] as? [String: Any] ?? [:]
            return DuoRewardPayload(from: rewardDict)
        } catch {
            print("Failed to claim duo reward: \(error)")
            return nil
        }
    }

    func claimMilestone(partnershipId: String, milestoneKey: String, rewardPayload: [String: Any]) async -> DuoRewardPayload? {
        do {
            let payloadData = try JSONSerialization.data(withJSONObject: rewardPayload)
            let payloadString = String(data: payloadData, encoding: .utf8) ?? "{}"
            let resultData = try await supabase.client.rpc("claim_duo_milestone", params: [
                "p_partnership_id": AnyEncodableValue.string(partnershipId),
                "p_milestone_key": AnyEncodableValue.string(milestoneKey),
                "p_reward_payload": AnyEncodableValue.string(payloadString),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any] ?? [:]
            let success = json["success"] as? Bool ?? false
            guard success else { return nil }
            return DuoRewardPayload(from: rewardPayload)
        } catch {
            print("Failed to claim milestone: \(error)")
            return nil
        }
    }

    // MARK: - Nudge

    func nudgePartner() async -> Bool {
        guard let pid = dashboard.partnership?.id else { return false }
        do {
            let resultData = try await supabase.client.rpc("nudge_duo_partner", params: [
                "p_partnership_id": pid,
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any] ?? [:]
            return json["success"] as? Bool ?? false
        } catch {
            print("Failed to nudge partner: \(error)")
            return false
        }
    }

    // MARK: - Referral

    func generateReferralCode() async -> String? {
        do {
            let resultData = try await supabase.client.rpc("generate_referral_code", params: EmptyParams()).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any] ?? [:]
            return json["code"] as? String
        } catch {
            print("Failed to generate referral code: \(error)")
            return nil
        }
    }

    // MARK: - Legacy RPC Wrappers (kept for backward compat)

    func fetchPartnership() async {
        guard let userId = supabase.currentUser?.id.uuidString.lowercased() else { return }
        do {
            let resultData = try await supabase.client.rpc("fetch_duo_partnership", params: EmptyParams()).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            guard let json, let partnershipId = json["id"] as? String, !partnershipId.isEmpty else {
                currentPartnership = nil
                return
            }

            let pId = json["partner_id"] as? String ?? ""
            let uId = json["user_id"] as? String ?? ""
            let actualPartnerId = (uId == userId) ? pId : uId

            let partnerProfile: UserProfile = try await supabase.client.from("profiles")
                .select()
                .eq("id", value: actualPartnerId)
                .single()
                .execute()
                .value

            currentPartnership = DuoPartnerInfo(
                partnershipId: partnershipId,
                partnerId: actualPartnerId,
                partnerName: partnerProfile.username,
                partnerAvatar: AvatarInfo(
                    animal: partnerProfile.avatarAnimal,
                    eyes: partnerProfile.avatarEyes,
                    mouth: partnerProfile.avatarMouth,
                    accessory: partnerProfile.avatarAccessory,
                    bodyColor: partnerProfile.avatarBodyColor,
                    bgColor: partnerProfile.avatarBgColor
                ),
                partnerLevel: partnerProfile.level,
                partnerStreak: partnerProfile.currentStreak,
                partnerWeeklyXP: partnerProfile.weeklyXP,
                sharedStreak: json["shared_streak"] as? Int ?? 0,
                createdAt: json["created_at"] as? String
            )
        } catch {
            print("Failed to fetch duo partnership: \(error)")
            currentPartnership = nil
        }
    }

    func fetchWeeklyQuests() async {
        guard currentPartnership != nil else { return }
        do {
            let resultData = try await supabase.client.rpc("fetch_duo_weekly_quests", params: EmptyParams()).execute().data
            let decoder = JSONDecoder()
            weeklyQuests = (try? decoder.decode([DuoWeeklyQuest].self, from: resultData)) ?? []
        } catch {
            print("Failed to fetch duo weekly quests: \(error)")
            weeklyQuests = []
        }
    }

    func sendDuoInvite(toFriendId: String) async -> Bool {
        lastInviteError = nil
        do {
            let resultData = try await supabase.client.rpc("send_duo_invite", params: [
                "p_partner_id": toFriendId
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if !success {
                lastInviteError = json?["error"] as? String
            }
            return success
        } catch {
            print("Failed to send duo invite: \(error)")
            lastInviteError = error.localizedDescription
            return false
        }
    }

    func acceptDuoInvite(partnershipId: String) async -> Bool {
        do {
            let resultData = try await supabase.client.rpc("accept_duo_invite", params: [
                "p_partnership_id": partnershipId
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success {
                await loadDuoData()
            }
            return success
        } catch {
            print("Failed to accept duo invite: \(error)")
            return false
        }
    }

    func declineDuoInvite(partnershipId: String) async -> Bool {
        do {
            let resultData = try await supabase.client.rpc("decline_duo_invite", params: [
                "p_partnership_id": partnershipId
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success {
                hasPendingDuoInvite = false
                pendingInviteFrom = nil
            }
            return success
        } catch {
            print("Failed to decline duo invite: \(error)")
            return false
        }
    }

    func dissolveDuo() async -> Bool {
        let partnershipId = dashboard.partnership?.id ?? currentPartnership?.partnershipId
        guard let partnershipId, !partnershipId.isEmpty else { return false }
        do {
            let resultData = try await supabase.client.rpc("dissolve_duo", params: [
                "p_partnership_id": partnershipId
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success {
                currentPartnership = nil
                weeklyQuests = []
                dashboard = .empty
            }
            return success
        } catch {
            print("Failed to dissolve duo: \(error)")
            return false
        }
    }

    func reportDuoProgress(questType: String, amount: Int) async {
        guard currentPartnership != nil else { return }
        do {
            try await supabase.client.rpc("report_duo_progress", params: [
                "p_quest_type": AnyEncodableValue.string(questType),
                "p_amount": AnyEncodableValue.int(amount),
            ]).execute()
            await fetchWeeklyQuests()
        } catch {
            print("Failed to report duo progress: \(error)")
        }
    }

    func claimDuoReward(questId: String) async -> DuoQuestRewardResult? {
        do {
            let resultData = try await supabase.client.rpc("claim_duo_reward", params: [
                "p_claim_type": AnyEncodableValue.string("weekly_raid"),
                "p_claim_id": AnyEncodableValue.string(questId),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any] ?? [:]
            let success = json["success"] as? Bool ?? false
            if success {
                await fetchWeeklyQuests()
            }
            let reward = json["reward"] as? [String: Any] ?? [:]
            return DuoQuestRewardResult(success: success, coinsAwarded: reward["coins"] as? Int, xpAwarded: reward["xp"] as? Int, bonusType: nil)
        } catch {
            print("Failed to claim duo reward: \(error)")
            return nil
        }
    }

    func checkMysteryChestClaimed() async {
        guard let partnership = currentPartnership else {
            chestClaimedThisWeek = false
            return
        }
        do {
            let resultData = try await supabase.client.rpc("check_duo_chest_claimed", params: [
                "p_partnership_id": partnership.partnershipId
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            chestClaimedThisWeek = json?["claimed"] as? Bool ?? false
        } catch {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-'W'ww"
            let weekKey = formatter.string(from: Date())
            let key = "duo_chest_claimed_\(partnership.partnershipId)_\(weekKey)"
            chestClaimedThisWeek = UserDefaults.standard.bool(forKey: key)
        }
    }

    func claimMysteryChest(rewardType: String, rewardAmount: Int, wasApplied: Bool) async -> Bool {
        guard let partnership = currentPartnership else { return false }
        do {
            let resultData = try await supabase.client.rpc("claim_duo_mystery_chest", params: [
                "p_partnership_id": AnyEncodableValue.string(partnership.partnershipId),
                "p_reward_type": AnyEncodableValue.string(rewardType),
                "p_reward_amount": AnyEncodableValue.int(rewardAmount),
                "p_was_applied": AnyEncodableValue.bool(wasApplied),
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success { chestClaimedThisWeek = true }
            return success
        } catch {
            chestClaimedThisWeek = true
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-'W'ww"
            let weekKey = formatter.string(from: Date())
            let key = "duo_chest_claimed_\(partnership.partnershipId)_\(weekKey)"
            UserDefaults.standard.set(true, forKey: key)
            return true
        }
    }

    func checkPendingInvites() async {
        guard let userId = supabase.currentUser?.id.uuidString.lowercased() else { return }
        do {
            let partnerships: [DuoPartnership] = try await supabase.client.from("duo_partnerships")
                .select()
                .eq("partner_id", value: userId)
                .eq("status", value: "pending")
                .execute()
                .value

            if let invite = partnerships.first {
                hasPendingDuoInvite = true
                pendingPartnershipId = invite.id
                let senderProfile: UserProfile = try await supabase.client.from("profiles")
                    .select()
                    .eq("id", value: invite.userId)
                    .single()
                    .execute()
                    .value
                pendingInviteFrom = LeaderboardRecord(
                    id: senderProfile.id, username: senderProfile.username,
                    avatarAnimal: senderProfile.avatarAnimal, avatarEyes: senderProfile.avatarEyes,
                    avatarMouth: senderProfile.avatarMouth, avatarAccessory: senderProfile.avatarAccessory,
                    avatarBodyColor: senderProfile.avatarBodyColor, avatarBgColor: senderProfile.avatarBgColor,
                    weeklyXP: senderProfile.weeklyXP, currentStreak: senderProfile.currentStreak,
                    level: senderProfile.level, profession: senderProfile.profession, school: senderProfile.school
                )
            } else {
                hasPendingDuoInvite = false
                pendingInviteFrom = nil
                pendingPartnershipId = nil
            }
        } catch {
            print("Failed to check pending duo invites: \(error)")
        }
    }

    // MARK: - Parsing Helpers

    private func parseDashboardPartnership(_ dict: [String: Any]) -> DuoDashboardPartnership {
        DuoDashboardPartnership(
            id: dict["id"] as? String ?? "",
            userId: dict["user_id"] as? String ?? "",
            partnerId: dict["partner_id"] as? String ?? "",
            sharedStreak: dict["shared_streak"] as? Int ?? 0,
            bestSharedStreak: dict["best_shared_streak"] as? Int ?? 0,
            sharedDuoStreakSaves: dict["shared_duo_streak_saves"] as? Int ?? 0,
            duoTimezone: dict["duo_timezone"] as? String ?? "America/New_York",
            lastBothSafeDate: dict["last_both_safe_date"] as? String,
            mySafeToday: dict["current_day_safe_user1"] as? Bool ?? false,
            partnerSafeToday: dict["current_day_safe_user2"] as? Bool ?? false,
            acceptedAt: dict["accepted_at"] as? String,
            createdAt: dict["created_at"] as? String
        )
    }

    private func parseDashboardPartner(_ dict: [String: Any]) -> DuoDashboardPartner {
        DuoDashboardPartner(
            id: dict["id"] as? String ?? "",
            username: dict["username"] as? String ?? "",
            avatar: AvatarInfo(
                animal: dict["avatar_animal"] as? String ?? "beaver",
                eyes: dict["avatar_eyes"] as? String ?? "normal",
                mouth: dict["avatar_mouth"] as? String ?? "smile",
                accessory: dict["avatar_accessory"] as? String ?? "none",
                bodyColor: dict["avatar_body_color"] as? String ?? "",
                bgColor: dict["avatar_bg_color"] as? String ?? ""
            ),
            level: dict["level"] as? Int ?? 1,
            currentStreak: dict["current_streak"] as? Int ?? 0,
            weeklyXP: dict["weekly_xp"] as? Int ?? 0
        )
    }

    private func parseProgress(_ dict: [String: Any]?) -> DuoDailyProgress {
        guard let dict else {
            return DuoDailyProgress(duoPoints: 0, isSafe: false, xpEarned: 0, questionsAnswered: 0, lessonsCompleted: 0, brandBlitzCompleted: 0, highScore90Count: 0)
        }
        return DuoDailyProgress(
            duoPoints: dict["duo_points"] as? Int ?? 0,
            isSafe: dict["is_safe"] as? Bool ?? false,
            xpEarned: dict["xp_earned"] as? Int ?? 0,
            questionsAnswered: dict["questions_answered"] as? Int ?? 0,
            lessonsCompleted: dict["lessons_completed"] as? Int ?? 0,
            brandBlitzCompleted: dict["brand_blitz_completed"] as? Int ?? 0,
            highScore90Count: dict["high_score_90_count"] as? Int ?? 0
        )
    }

    private func parseDailyMissions(_ raw: Any?) -> [DuoDailyMission] {
        guard let arr = raw as? [[String: Any]] else { return [] }
        return arr.enumerated().map { parseMission($0.element, index: $0.offset) }
    }

    private func parseMission(_ dict: [String: Any], index: Int) -> DuoDailyMission {
        DuoDailyMission(
            id: dict["id"] as? String ?? UUID().uuidString,
            missionIndex: dict["mission_index"] as? Int ?? index,
            missionType: dict["mission_type"] as? String ?? "",
            title: dict["title"] as? String ?? "Duo Mission",
            description: dict["description"] as? String ?? "",
            difficulty: dict["difficulty"] as? String ?? "easy",
            targetPayload: dict["target_payload"] as? [String: Any] ?? [:],
            progressPayload: dict["progress_payload"] as? [String: Any] ?? [:],
            completed: dict["completed"] as? Bool ?? false,
            claimed: dict["claimed"] as? Bool ?? false,
            rewardPayload: dict["reward_payload"] as? [String: Any] ?? [:]
        )
    }

    private func parseWeeklyRaids(_ raw: Any?) -> [DuoWeeklyRaid] {
        guard let arr = raw as? [[String: Any]] else { return [] }
        return arr.enumerated().map { parseRaid($0.element, index: $0.offset) }
    }

    private func parseRaid(_ dict: [String: Any], index: Int) -> DuoWeeklyRaid {
        DuoWeeklyRaid(
            id: dict["id"] as? String ?? UUID().uuidString,
            questIndex: dict["quest_index"] as? Int ?? index,
            questType: dict["quest_type"] as? String ?? "",
            title: dict["title"] as? String ?? "Duo Raid",
            description: dict["description"] as? String ?? "",
            targetValue: dict["target_value"] as? Int ?? 10,
            user1Progress: dict["user1_progress"] as? Int ?? 0,
            user2Progress: dict["user2_progress"] as? Int ?? 0,
            rewardPayload: dict["reward_payload"] as? [String: Any] ?? [:],
            completed: dict["completed"] as? Bool ?? false,
            claimed: dict["claimed"] as? Bool ?? false
        )
    }

    private func parseClaimedMilestones(_ raw: Any?) -> Set<String> {
        guard let arr = raw as? [[String: Any]] else { return [] }
        return Set(arr.compactMap { $0["milestone_key"] as? String })
    }

    private func parseFeed(_ raw: Any?) -> [DuoFeedEvent] {
        guard let arr = raw as? [[String: Any]] else { return [] }
        return arr.map { dict in
            DuoFeedEvent(
                id: dict["id"] as? String ?? UUID().uuidString,
                actorUserId: dict["actor_user_id"] as? String,
                eventType: dict["event_type"] as? String ?? "",
                payload: dict["payload"] as? [String: Any] ?? [:],
                createdAt: dict["created_at"] as? String ?? ""
            )
        }
    }

    private func parsePendingInvites(_ raw: Any?) -> [DuoPendingInvite] {
        guard let arr = raw as? [[String: Any]] else { return [] }
        return arr.map { dict in
            DuoPendingInvite(
                id: dict["id"] as? String ?? "",
                senderId: dict["sender_id"] as? String ?? "",
                senderName: dict["sender_name"] as? String ?? "User",
                senderAvatar: AvatarInfo(
                    animal: dict["sender_avatar_animal"] as? String ?? "beaver",
                    eyes: dict["sender_avatar_eyes"] as? String ?? "normal",
                    mouth: dict["sender_avatar_mouth"] as? String ?? "smile",
                    accessory: dict["sender_avatar_accessory"] as? String ?? "none",
                    bodyColor: dict["sender_avatar_body_color"] as? String ?? "",
                    bgColor: dict["sender_avatar_bg_color"] as? String ?? ""
                ),
                senderLevel: dict["sender_level"] as? Int ?? 1
            )
        }
    }
}

extension DuoQuestRewardResult {
    init(success: Bool, coinsAwarded: Int?, xpAwarded: Int?, bonusType: String?) {
        self.success = success
        self.coinsAwarded = coinsAwarded
        self.xpAwarded = xpAwarded
        self.bonusType = bonusType
    }
}
