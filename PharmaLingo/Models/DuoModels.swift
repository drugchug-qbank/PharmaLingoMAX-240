import Foundation

nonisolated struct DuoPartnership: Codable, Sendable {
    let id: String
    let userId: String
    let partnerId: String
    let status: String
    let sharedStreak: Int
    let lastBothActiveDate: String?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, status
        case userId = "user_id"
        case partnerId = "partner_id"
        case sharedStreak = "shared_streak"
        case lastBothActiveDate = "last_both_active_date"
        case createdAt = "created_at"
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(String.self, forKey: .id)
        userId = (try? c.decode(String.self, forKey: .userId)) ?? ""
        partnerId = (try? c.decode(String.self, forKey: .partnerId)) ?? ""
        status = (try? c.decode(String.self, forKey: .status)) ?? "pending"
        sharedStreak = (try? c.decode(Int.self, forKey: .sharedStreak)) ?? 0
        lastBothActiveDate = try? c.decode(String.self, forKey: .lastBothActiveDate)
        createdAt = try? c.decode(String.self, forKey: .createdAt)
    }
}

nonisolated struct DuoWeeklyQuest: Codable, Sendable {
    let id: String
    let partnershipId: String
    let weekStart: String
    let questType: String
    let targetValue: Int
    let user1Progress: Int
    let user2Progress: Int
    let rewardClaimed: Bool
    let rewardType: String
    let rewardAmount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case partnershipId = "partnership_id"
        case weekStart = "week_start"
        case questType = "quest_type"
        case targetValue = "target_value"
        case user1Progress = "user1_progress"
        case user2Progress = "user2_progress"
        case rewardClaimed = "reward_claimed"
        case rewardType = "reward_type"
        case rewardAmount = "reward_amount"
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? c.decode(String.self, forKey: .id)) ?? ""
        partnershipId = (try? c.decode(String.self, forKey: .partnershipId)) ?? ""
        weekStart = (try? c.decode(String.self, forKey: .weekStart)) ?? ""
        questType = (try? c.decode(String.self, forKey: .questType)) ?? ""
        targetValue = (try? c.decode(Int.self, forKey: .targetValue)) ?? 40
        user1Progress = (try? c.decode(Int.self, forKey: .user1Progress)) ?? 0
        user2Progress = (try? c.decode(Int.self, forKey: .user2Progress)) ?? 0
        rewardClaimed = (try? c.decode(Bool.self, forKey: .rewardClaimed)) ?? false
        rewardType = (try? c.decode(String.self, forKey: .rewardType)) ?? "coins"
        rewardAmount = (try? c.decode(Int.self, forKey: .rewardAmount)) ?? 50
    }

    var combinedProgress: Int { user1Progress + user2Progress }
    var isComplete: Bool { combinedProgress >= targetValue }
    var progressFraction: Double { min(Double(combinedProgress) / Double(max(targetValue, 1)), 1.0) }

    var questDisplayTitle: String {
        switch questType {
        case "questions": return "Answer \(targetValue) Questions Together"
        case "perfect_quizzes": return "Get \(targetValue) Perfect Quizzes Together"
        case "streak_days": return "Both Active \(targetValue) Days This Week"
        case "xp_earned": return "Earn \(targetValue) XP Together"
        case "lessons": return "Complete \(targetValue) Lessons Together"
        default: return "Complete Duo Quest"
        }
    }

    var questIcon: String {
        switch questType {
        case "questions": return "questionmark.circle.fill"
        case "perfect_quizzes": return "star.fill"
        case "streak_days": return "flame.fill"
        case "xp_earned": return "bolt.fill"
        case "lessons": return "book.fill"
        default: return "target"
        }
    }

    var questColor: String {
        switch questType {
        case "questions": return "funTeal"
        case "perfect_quizzes": return "warningYellow"
        case "streak_days": return "accentOrange"
        case "xp_earned": return "xpPurple"
        case "lessons": return "primaryBlue"
        default: return "primaryBlue"
        }
    }
}

nonisolated struct DuoPartnerInfo: Sendable {
    let partnershipId: String
    let partnerId: String
    let partnerName: String
    let partnerAvatar: AvatarInfo
    let partnerLevel: Int
    let partnerStreak: Int
    let partnerWeeklyXP: Int
    let sharedStreak: Int
    let createdAt: String?
}

nonisolated struct AvatarInfo: Sendable {
    let animal: String
    let eyes: String
    let mouth: String
    let accessory: String
    let bodyColor: String
    let bgColor: String
}

nonisolated struct DuoQuestRewardResult: Codable, Sendable {
    let success: Bool
    let coinsAwarded: Int?
    let xpAwarded: Int?
    let bonusType: String?

    enum CodingKeys: String, CodingKey {
        case success
        case coinsAwarded = "coins_awarded"
        case xpAwarded = "xp_awarded"
        case bonusType = "bonus_type"
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? c.decode(Bool.self, forKey: .success)) ?? false
        coinsAwarded = try? c.decode(Int.self, forKey: .coinsAwarded)
        xpAwarded = try? c.decode(Int.self, forKey: .xpAwarded)
        bonusType = try? c.decode(String.self, forKey: .bonusType)
    }
}
