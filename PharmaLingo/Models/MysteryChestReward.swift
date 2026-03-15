import Foundation

nonisolated enum MysteryChestRewardType: String, Sendable {
    case coins
    case powerUpFiftyFifty
    case powerUpShieldHeart
    case powerUpPharmaVision
    case doubleXP
    case maxHearts
    case streakSave

    var displayName: String {
        switch self {
        case .coins: "Coins"
        case .powerUpFiftyFifty: "50/50 Power-Up"
        case .powerUpShieldHeart: "Shield Heart"
        case .powerUpPharmaVision: "Pharma Vision"
        case .doubleXP: "2x XP Boost"
        case .maxHearts: "Full Hearts"
        case .streakSave: "Streak Save"
        }
    }

    var iconName: String {
        switch self {
        case .coins: "bitcoinsign.circle.fill"
        case .powerUpFiftyFifty: "circle.lefthalf.striped.horizontal"
        case .powerUpShieldHeart: "shield.lefthalf.filled"
        case .powerUpPharmaVision: "eye.fill"
        case .doubleXP: "bolt.circle.fill"
        case .maxHearts: "heart.fill"
        case .streakSave: "flame.circle.fill"
        }
    }

    var usesCustomImage: Bool {
        switch self {
        case .powerUpFiftyFifty, .powerUpShieldHeart, .powerUpPharmaVision: true
        default: false
        }
    }

    var customImageName: String? {
        switch self {
        case .powerUpFiftyFifty: "FiftyFifty"
        case .powerUpShieldHeart: "ShieldHeart"
        case .powerUpPharmaVision: "PharmaVision"
        default: nil
        }
    }

    var rarity: MysteryChestRarity {
        switch self {
        case .coins: .common
        case .maxHearts: .common
        case .doubleXP: .common
        case .powerUpFiftyFifty: .uncommon
        case .powerUpShieldHeart: .rare
        case .powerUpPharmaVision: .epic
        case .streakSave: .rare
        }
    }
}

nonisolated enum MysteryChestRarity: String, Sendable {
    case common
    case uncommon
    case rare
    case epic

    var label: String {
        switch self {
        case .common: "Common"
        case .uncommon: "Uncommon"
        case .rare: "Rare"
        case .epic: "Epic"
        }
    }
}

nonisolated struct MysteryChestReward: Sendable {
    let type: MysteryChestRewardType
    let amount: Int
    let wasApplied: Bool

    static func roll() -> MysteryChestReward {
        let roll = Int.random(in: 1...100)

        if roll <= 30 {
            let coinAmount = Int.random(in: 5...25) * 10
            return MysteryChestReward(type: .coins, amount: coinAmount, wasApplied: true)
        } else if roll <= 48 {
            return MysteryChestReward(type: .maxHearts, amount: 0, wasApplied: true)
        } else if roll <= 65 {
            return MysteryChestReward(type: .doubleXP, amount: 0, wasApplied: true)
        } else if roll <= 80 {
            return MysteryChestReward(type: .powerUpFiftyFifty, amount: 1, wasApplied: true)
        } else if roll <= 90 {
            return MysteryChestReward(type: .powerUpShieldHeart, amount: 1, wasApplied: true)
        } else if roll <= 96 {
            return MysteryChestReward(type: .streakSave, amount: 1, wasApplied: true)
        } else {
            return MysteryChestReward(type: .powerUpPharmaVision, amount: 1, wasApplied: true)
        }
    }
}
