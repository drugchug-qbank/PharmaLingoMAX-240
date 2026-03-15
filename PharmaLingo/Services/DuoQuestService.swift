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

    private let supabase = SupabaseService.shared

    private init() {}

    func loadDuoData() async {
        isLoading = true
        defer { isLoading = false }

        await fetchPartnership()
        if currentPartnership != nil {
            await fetchWeeklyQuests()
        }
        await checkPendingInvites()
    }

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
        do {
            let resultData = try await supabase.client.rpc("send_duo_invite", params: [
                "p_partner_id": toFriendId
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            return json?["success"] as? Bool ?? false
        } catch {
            print("Failed to send duo invite: \(error)")
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
        guard let partnership = currentPartnership else { return false }
        do {
            let resultData = try await supabase.client.rpc("dissolve_duo", params: [
                "p_partnership_id": partnership.partnershipId
            ]).execute().data
            let json = try JSONSerialization.jsonObject(with: resultData) as? [String: Any]
            let success = json?["success"] as? Bool ?? false
            if success {
                currentPartnership = nil
                weeklyQuests = []
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
                "p_quest_id": questId
            ]).execute().data
            let result = try JSONDecoder().decode(DuoQuestRewardResult.self, from: resultData)
            if result.success {
                await fetchWeeklyQuests()
            }
            return result
        } catch {
            print("Failed to claim duo reward: \(error)")
            return nil
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


}
