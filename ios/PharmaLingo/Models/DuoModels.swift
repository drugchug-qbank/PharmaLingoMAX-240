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

// MARK: - Duo Streak Dashboard Models

nonisolated struct DuoDailyProgress: Sendable {
    let duoPoints: Int
    let isSafe: Bool
    let xpEarned: Int
    let questionsAnswered: Int
    let lessonsCompleted: Int
    let brandBlitzCompleted: Int
    let highScore90Count: Int
}

nonisolated struct DuoDashboardPartnership: Sendable {
    let id: String
    let userId: String
    let partnerId: String
    let sharedStreak: Int
    let bestSharedStreak: Int
    let sharedDuoStreakSaves: Int
    let duoTimezone: String
    let lastBothSafeDate: String?
    let mySafeToday: Bool
    let partnerSafeToday: Bool
    let acceptedAt: String?
    let createdAt: String?
}

nonisolated struct DuoDashboardPartner: Sendable {
    let id: String
    let username: String
    let avatar: AvatarInfo
    let level: Int
    let currentStreak: Int
    let weeklyXP: Int
}

nonisolated struct DuoDailyMission: Sendable, Identifiable {
    let id: String
    let missionIndex: Int
    let missionType: String
    let title: String
    let description: String
    let difficulty: String
    let targetPayload: [String: Any]
    let progressPayload: [String: Any]
    let completed: Bool
    let claimed: Bool
    let rewardPayload: [String: Any]

    nonisolated var rewardCoins: Int { rewardPayload["coins"] as? Int ?? 0 }
    nonisolated var rewardXP: Int { rewardPayload["xp"] as? Int ?? 0 }

    nonisolated var difficultyIcon: String {
        switch difficulty {
        case "easy": return "star"
        case "medium": return "star.leadinghalf.filled"
        case "hard": return "star.fill"
        default: return "star"
        }
    }
}

nonisolated struct DuoWeeklyRaid: Sendable, Identifiable {
    let id: String
    let questIndex: Int
    let questType: String
    let title: String
    let description: String
    let targetValue: Int
    let user1Progress: Int
    let user2Progress: Int
    let rewardPayload: [String: Any]
    let completed: Bool
    let claimed: Bool

    nonisolated var combinedProgress: Int { user1Progress + user2Progress }
    nonisolated var progressFraction: Double { min(Double(combinedProgress) / Double(max(targetValue, 1)), 1.0) }

    nonisolated var rewardCoins: Int { rewardPayload["coins"] as? Int ?? 0 }

    nonisolated var questIcon: String {
        switch questType {
        case "xp_earned": return "bolt.fill"
        case "brand_blitz_rounds": return "bolt.circle.fill"
        case "questions_answered": return "questionmark.circle.fill"
        case "high_score_quizzes": return "star.fill"
        case "perfect_quizzes": return "star.circle.fill"
        case "lessons_completed": return "book.fill"
        default: return "target"
        }
    }

    nonisolated var questDisplayTitle: String { title }
}

nonisolated struct DuoFeedEvent: Sendable, Identifiable {
    let id: String
    let actorUserId: String?
    let eventType: String
    let payload: [String: Any]
    let createdAt: String

    nonisolated var displayText: String {
        switch eventType {
        case "partnership_started": return "Duo partnership started!"
        case "user_safe": return "completed their Duo goal for today"
        case "both_safe": return "Both safe — Duo streak protected!"
        case "nudge": return "nudged their partner"
        case "milestone_claimed":
            let milestone = (payload["milestone"] as? String) ?? ""
            return "unlocked the \(milestone) milestone!"
        case "partnership_dissolved": return "Duo partnership ended"
        case "brand_blitz_complete": return "crushed a Brand Blitz round"
        case "high_score": return "scored 90%+ on a quiz"
        case "perfect_quiz": return "got a perfect quiz score"
        case "lesson_complete": return "completed a lesson"
        default: return eventType.replacingOccurrences(of: "_", with: " ")
        }
    }

    nonisolated var eventIcon: String {
        switch eventType {
        case "partnership_started": return "person.2.fill"
        case "user_safe": return "checkmark.shield.fill"
        case "both_safe": return "flame.fill"
        case "nudge": return "hand.wave.fill"
        case "milestone_claimed": return "trophy.fill"
        case "partnership_dissolved": return "person.2.slash"
        case "brand_blitz_complete": return "bolt.circle.fill"
        case "high_score": return "star.fill"
        case "perfect_quiz": return "star.circle.fill"
        case "lesson_complete": return "book.fill"
        default: return "bubble.left.fill"
        }
    }
}

nonisolated struct DuoPendingInvite: Sendable, Identifiable {
    let id: String
    let senderId: String
    let senderName: String
    let senderAvatar: AvatarInfo
    let senderLevel: Int
}

nonisolated struct DuoDashboard: Sendable {
    let hasPartner: Bool
    let partnership: DuoDashboardPartnership?
    let partner: DuoDashboardPartner?
    let myProgress: DuoDailyProgress
    let partnerProgress: DuoDailyProgress
    let dailyMissions: [DuoDailyMission]
    let weeklyRaids: [DuoWeeklyRaid]
    let claimedMilestones: Set<String>
    let activityFeed: [DuoFeedEvent]
    let pendingInvites: [DuoPendingInvite]
    let hoursUntilReset: Double
    let dateKey: String
    let isUser1: Bool

    static let empty = DuoDashboard(
        hasPartner: false, partnership: nil, partner: nil,
        myProgress: DuoDailyProgress(duoPoints: 0, isSafe: false, xpEarned: 0, questionsAnswered: 0, lessonsCompleted: 0, brandBlitzCompleted: 0, highScore90Count: 0),
        partnerProgress: DuoDailyProgress(duoPoints: 0, isSafe: false, xpEarned: 0, questionsAnswered: 0, lessonsCompleted: 0, brandBlitzCompleted: 0, highScore90Count: 0),
        dailyMissions: [], weeklyRaids: [], claimedMilestones: [], activityFeed: [],
        pendingInvites: [], hoursUntilReset: 24, dateKey: "", isUser1: true
    )
}

// MARK: - Duo Reward Payload

nonisolated struct DuoRewardPayload: Sendable {
    let coins: Int
    let xp: Int
    let streakSave: Int
    let maxHearts: Int
    let doubleXP: Bool
    let powerupFiftyFifty: Int
    let powerupShieldHeart: Int
    let powerupPharmaVision: Int

    init(from dict: [String: Any]) {
        coins = dict["coins"] as? Int ?? 0
        xp = dict["xp"] as? Int ?? 0
        streakSave = dict["streak_save"] as? Int ?? 0
        maxHearts = dict["max_hearts"] as? Int ?? 0
        doubleXP = dict["double_xp"] as? Bool ?? false
        powerupFiftyFifty = dict["powerup_fifty_fifty"] as? Int ?? 0
        powerupShieldHeart = dict["powerup_shield_heart"] as? Int ?? 0
        powerupPharmaVision = dict["powerup_pharma_vision"] as? Int ?? 0
    }

    var isEmpty: Bool { coins == 0 && xp == 0 && streakSave == 0 && maxHearts == 0 && !doubleXP && powerupFiftyFifty == 0 && powerupShieldHeart == 0 && powerupPharmaVision == 0 }

    var displayItems: [(icon: String, text: String)] {
        var items: [(String, String)] = []
        if coins > 0 { items.append(("bitcoinsign.circle.fill", "+\(coins) coins")) }
        if xp > 0 { items.append(("bolt.fill", "+\(xp) XP")) }
        if streakSave > 0 { items.append(("flame.circle.fill", "+\(streakSave) streak save")) }
        if maxHearts > 0 { items.append(("heart.fill", "Full hearts")) }
        if doubleXP { items.append(("bolt.circle.fill", "2x XP boost")) }
        if powerupFiftyFifty > 0 { items.append(("circle.lefthalf.striped.horizontal", "+\(powerupFiftyFifty) 50/50")) }
        if powerupShieldHeart > 0 { items.append(("shield.lefthalf.filled", "+\(powerupShieldHeart) Shield Heart")) }
        if powerupPharmaVision > 0 { items.append(("eye.fill", "+\(powerupPharmaVision) Pharma Vision")) }
        return items
    }
}

// MARK: - Duo Milestones

nonisolated enum DuoMilestone: String, CaseIterable, Sendable {
    case day3 = "day_3"
    case day7 = "day_7"
    case day14 = "day_14"
    case day30 = "day_30"
    case day60 = "day_60"
    case day100 = "day_100"

    var requiredStreak: Int {
        switch self {
        case .day3: return 3
        case .day7: return 7
        case .day14: return 14
        case .day30: return 30
        case .day60: return 60
        case .day100: return 100
        }
    }

    var displayTitle: String {
        switch self {
        case .day3: return "3-Day Duo Streak"
        case .day7: return "7-Day Duo Streak"
        case .day14: return "14-Day Duo Streak"
        case .day30: return "30-Day Duo Streak"
        case .day60: return "60-Day Duo Streak"
        case .day100: return "100-Day Duo Streak"
        }
    }

    var rewardDescription: String {
        switch self {
        case .day3: return "100 coins"
        case .day7: return "150 XP + choose a reward"
        case .day14: return "250 coins + 1 streak save"
        case .day30: return "500 coins + 2 streak saves"
        case .day60: return "750 coins + power-up bundle"
        case .day100: return "1000 coins + legendary reward"
        }
    }

    var rewardPayloadDict: [String: Any] {
        switch self {
        case .day3: return ["coins": 100]
        case .day7: return ["xp": 150, "coins": 50]
        case .day14: return ["coins": 250, "streak_save": 1]
        case .day30: return ["coins": 500, "streak_save": 2]
        case .day60: return ["coins": 750, "powerup_fifty_fifty": 1, "powerup_shield_heart": 1, "powerup_pharma_vision": 1]
        case .day100: return ["coins": 1000, "streak_save": 2, "xp": 500]
        }
    }

    var icon: String {
        switch self {
        case .day3: return "flame"
        case .day7: return "flame.fill"
        case .day14: return "star.fill"
        case .day30: return "crown.fill"
        case .day60: return "sparkles"
        case .day100: return "trophy.fill"
        }
    }
}

// MARK: - Duo Event Report Result

nonisolated struct DuoEventResult: Sendable {
    let success: Bool
    let duoPoints: Int
    let isSafe: Bool
    let bothSafe: Bool
    let dailyReward: Bool
}


