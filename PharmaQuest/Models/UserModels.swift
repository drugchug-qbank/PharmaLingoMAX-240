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
