import Foundation

nonisolated enum Profession: String, CaseIterable, Sendable {
    case pharmacy = "Pharmacy"
    case physicianMD = "Physician MD"
    case physicianDO = "Physician DO"
    case nursing = "Nursing"
    case physicianAssistant = "Physician Assistant"
    case other = "Other"

    var iconName: String {
        switch self {
        case .pharmacy: "cross.case.fill"
        case .physicianMD, .physicianDO: "stethoscope"
        case .nursing: "heart.text.clipboard.fill"
        case .physicianAssistant: "person.badge.stethoscope"
        case .other: "graduationcap.fill"
        }
    }

    var badgeImageName: String {
        switch self {
        case .pharmacy: "ProfessionRX"
        case .physicianMD: "ProfessionMD"
        case .physicianDO: "ProfessionDO"
        case .nursing: "ProfessionRN"
        case .physicianAssistant: "ProfessionPA"
        case .other: "ProfessionOther"
        }
    }

    static func badgeImage(for professionString: String) -> String {
        if let prof = Profession(rawValue: professionString) {
            return prof.badgeImageName
        }
        return "ProfessionOther"
    }
}

nonisolated enum LeagueRank: String, CaseIterable, Sendable {
    case bronze = "Bronze"
    case silver = "Silver"
    case gold = "Gold"
    case platinum = "Platinum"
    case masterDiamond = "Master Diamond"

    var iconName: String {
        switch self {
        case .bronze: "shield.fill"
        case .silver: "shield.lefthalf.filled"
        case .gold: "star.circle.fill"
        case .platinum: "crown.fill"
        case .masterDiamond: "diamond.fill"
        }
    }

    var colorHex: String {
        switch self {
        case .bronze: "CD7F32"
        case .silver: "C0C0C0"
        case .gold: "FFD700"
        case .platinum: "E5E4E2"
        case .masterDiamond: "B9F2FF"
        }
    }
}

nonisolated struct DailyQuest: Identifiable, Sendable {
    let id: String
    let title: String
    let description: String
    let iconName: String
    let target: Int
    var current: Int
    let coinReward: Int

    var isComplete: Bool { current >= target }
    var progress: Double { min(Double(current) / Double(target), 1.0) }
}

nonisolated struct LeaderboardEntry: Identifiable, Sendable {
    let id: String
    let username: String
    let avatarAnimal: String
    let avatarEyes: String
    let avatarMouth: String
    let avatarAccessory: String
    let avatarBodyColor: String
    let avatarBgColor: String
    let xpThisWeek: Int
    let streak: Int
    let rank: Int
}

nonisolated struct FriendEntry: Identifiable, Sendable {
    let id: String
    let username: String
    let avatarAnimal: String
    let xpThisWeek: Int
    let streak: Int
    let level: Int
}

nonisolated struct FriendDetailProfile: Identifiable, Sendable {
    let id: String
    let username: String
    let avatarAnimal: String
    let avatarEyes: String
    let avatarMouth: String
    let avatarAccessory: String
    let avatarBodyColor: String
    let avatarBgColor: String
    let totalXP: Int
    let weeklyXP: Int
    let currentStreak: Int
    let level: Int
    let profession: String
    let school: String
    let questionsAnswered: Int
    let questionsCorrect: Int

    var accuracy: Double {
        guard questionsAnswered > 0 else { return 0 }
        return Double(questionsCorrect) / Double(questionsAnswered)
    }
}

nonisolated enum PracticeMode: Sendable {
    case brandBlitz
    case quickPractice
    case spacedReview
}

nonisolated enum PracticeAccess: Sendable {
    case allowed
    case watchAd
    case locked
}

nonisolated enum BoostType: String, Codable, Sendable {
    case doubleXP
}

nonisolated struct ActiveBoost: Codable, Sendable {
    let type: BoostType
    let expiresAt: Date

    var isActive: Bool { Date() < expiresAt }
}

nonisolated struct DailyXPRecord: Codable, Sendable {
    let date: String
    let xpEarned: Int

    enum CodingKeys: String, CodingKey {
        case date
        case xpEarned = "xp_earned"
    }
}

nonisolated struct PendingFriendInfo: Identifiable, Sendable {
    let requestId: String
    let userId: String
    let username: String
    let avatarAnimal: String
    let avatarEyes: String
    let avatarMouth: String
    let avatarAccessory: String
    let avatarBodyColor: String
    let avatarBgColor: String
    let level: Int
    let profession: String

    var id: String { requestId }
}

nonisolated struct RPCResultBase: Codable, Sendable {
    let success: Bool?
    let error: String?

    var isSuccess: Bool { success ?? true }
}

nonisolated struct CQOTDResult: Codable, Sendable {
    let alreadyAnswered: Bool
    let clinicalAuraPoints: Int

    enum CodingKeys: String, CodingKey {
        case alreadyAnswered = "already_answered"
        case clinicalAuraPoints = "clinical_aura_points"
    }
}

nonisolated struct InventoryRecord: Codable, Sendable {
    let fiftyFiftyCount: Int
    let shieldHeartCount: Int
    let pharmaVisionCount: Int
    let fiftyFiftyEnhanced: Bool
    let shieldHeartEnhanced: Bool
    let pharmaVisionEnhanced: Bool

    enum CodingKeys: String, CodingKey {
        case fiftyFiftyCount = "fifty_fifty_count"
        case shieldHeartCount = "shield_heart_count"
        case pharmaVisionCount = "pharma_vision_count"
        case fiftyFiftyEnhanced = "fifty_fifty_enhanced"
        case shieldHeartEnhanced = "shield_heart_enhanced"
        case pharmaVisionEnhanced = "pharma_vision_enhanced"
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        fiftyFiftyCount = (try? c.decode(Int.self, forKey: .fiftyFiftyCount)) ?? 1
        shieldHeartCount = (try? c.decode(Int.self, forKey: .shieldHeartCount)) ?? 1
        pharmaVisionCount = (try? c.decode(Int.self, forKey: .pharmaVisionCount)) ?? 1
        fiftyFiftyEnhanced = (try? c.decode(Bool.self, forKey: .fiftyFiftyEnhanced)) ?? false
        shieldHeartEnhanced = (try? c.decode(Bool.self, forKey: .shieldHeartEnhanced)) ?? false
        pharmaVisionEnhanced = (try? c.decode(Bool.self, forKey: .pharmaVisionEnhanced)) ?? false
    }

    func toInventory() -> PowerUpInventory {
        PowerUpInventory(
            fiftyFiftyCount: fiftyFiftyCount,
            shieldHeartCount: shieldHeartCount,
            pharmaVisionCount: pharmaVisionCount,
            fiftyFiftyEnhanced: fiftyFiftyEnhanced,
            shieldHeartEnhanced: shieldHeartEnhanced,
            pharmaVisionEnhanced: pharmaVisionEnhanced
        )
    }
}

nonisolated struct DailyStateRecord: Codable, Sendable {
    let questSetIndex: Int?
    let dailyQuestProgress: [[String: AnyCodableValue]]?
    let brandBlitzCount: Int?
    let quickPracticeCount: Int?
    let spacedReviewCount: Int?
    let doubleXpNextAttempt: Bool?
    let activeBoosts: [[String: AnyCodableValue]]?

    enum CodingKeys: String, CodingKey {
        case questSetIndex = "quest_set_index"
        case dailyQuestProgress = "daily_quest_progress"
        case brandBlitzCount = "brand_blitz_count"
        case quickPracticeCount = "quick_practice_count"
        case spacedReviewCount = "spaced_review_count"
        case doubleXpNextAttempt = "double_xp_next_attempt"
        case activeBoosts = "active_boosts"
    }
}

nonisolated enum AnyCodableValue: Codable, Sendable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let v = try? container.decode(Bool.self) { self = .bool(v); return }
        if let v = try? container.decode(Int.self) { self = .int(v); return }
        if let v = try? container.decode(Double.self) { self = .double(v); return }
        if let v = try? container.decode(String.self) { self = .string(v); return }
        self = .null
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let v): try container.encode(v)
        case .int(let v): try container.encode(v)
        case .double(let v): try container.encode(v)
        case .bool(let v): try container.encode(v)
        case .null: try container.encodeNil()
        }
    }

    var stringValue: String? {
        if case .string(let v) = self { return v }
        return nil
    }

    var intValue: Int? {
        if case .int(let v) = self { return v }
        return nil
    }

    var doubleValue: Double? {
        if case .double(let v) = self { return v }
        if case .int(let v) = self { return Double(v) }
        return nil
    }
}
