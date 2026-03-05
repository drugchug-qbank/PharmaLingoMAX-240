import Foundation

nonisolated enum PowerUpType: String, CaseIterable, Sendable {
    case fiftyFifty
    case shieldHeart
    case pharmaVision

    var displayName: String {
        switch self {
        case .fiftyFifty: "50/50"
        case .shieldHeart: "Shield Heart"
        case .pharmaVision: "Pharma Vision"
        }
    }

    var description: String {
        switch self {
        case .fiftyFifty: "Removes about half of the wrong answers on supported question types."
        case .shieldHeart: "Protects you from losing a heart on the current question."
        case .pharmaVision: "Reveals one correct answer by highlighting it in gold."
        }
    }

    var iconName: String {
        switch self {
        case .fiftyFifty: "circle.lefthalf.striped.horizontal"
        case .shieldHeart: "shield.lefthalf.filled.badge.checkmark"
        case .pharmaVision: "eye.fill"
        }
    }

    var streakRequirement: Int {
        switch self {
        case .fiftyFifty: 10
        case .shieldHeart: 20
        case .pharmaVision: 50
        }
    }

    var purchasePrice: Int {
        switch self {
        case .fiftyFifty: 1000
        case .shieldHeart: 2000
        case .pharmaVision: 5000
        }
    }

    var enhancementPrice: Int {
        switch self {
        case .fiftyFifty: 3000
        case .shieldHeart: 5000
        case .pharmaVision: 10000
        }
    }

    func supportsQuestionType(_ type: QuestionType) -> Bool {
        switch self {
        case .fiftyFifty:
            return type == .multipleChoice || type == .trueFalse || type == .selectAll
        case .shieldHeart:
            return true
        case .pharmaVision:
            return type == .multipleChoice || type == .trueFalse || type == .selectAll
        }
    }
}

nonisolated struct PowerUpInventory: Sendable {
    var fiftyFiftyCount: Int
    var shieldHeartCount: Int
    var pharmaVisionCount: Int

    var fiftyFiftyEnhanced: Bool
    var shieldHeartEnhanced: Bool
    var pharmaVisionEnhanced: Bool

    static let defaultInventory = PowerUpInventory(
        fiftyFiftyCount: 1,
        shieldHeartCount: 1,
        pharmaVisionCount: 1,
        fiftyFiftyEnhanced: false,
        shieldHeartEnhanced: false,
        pharmaVisionEnhanced: false
    )

    func count(for type: PowerUpType) -> Int {
        switch type {
        case .fiftyFifty: fiftyFiftyCount
        case .shieldHeart: shieldHeartCount
        case .pharmaVision: pharmaVisionCount
        }
    }

    mutating func setCount(_ value: Int, for type: PowerUpType) {
        switch type {
        case .fiftyFifty: fiftyFiftyCount = value
        case .shieldHeart: shieldHeartCount = value
        case .pharmaVision: pharmaVisionCount = value
        }
    }

    func isEnhanced(_ type: PowerUpType) -> Bool {
        switch type {
        case .fiftyFifty: fiftyFiftyEnhanced
        case .shieldHeart: shieldHeartEnhanced
        case .pharmaVision: pharmaVisionEnhanced
        }
    }

    mutating func setEnhanced(_ type: PowerUpType) {
        switch type {
        case .fiftyFifty: fiftyFiftyEnhanced = true
        case .shieldHeart: shieldHeartEnhanced = true
        case .pharmaVision: pharmaVisionEnhanced = true
        }
    }

    func maxCapacity(for type: PowerUpType, isPro: Bool) -> Int {
        var cap = 1
        if isEnhanced(type) { cap += 1 }
        if isPro { cap += 1 }
        return cap
    }

    func isAtCapacity(for type: PowerUpType, isPro: Bool) -> Bool {
        count(for: type) >= maxCapacity(for: type, isPro: isPro)
    }

    mutating func consume(_ type: PowerUpType) -> Bool {
        let current = count(for: type)
        guard current > 0 else { return false }
        setCount(current - 1, for: type)
        return true
    }

    mutating func add(_ type: PowerUpType, isPro: Bool) -> Bool {
        let current = count(for: type)
        let max = maxCapacity(for: type, isPro: isPro)
        guard current < max else { return false }
        setCount(current + 1, for: type)
        return true
    }

    func toDictionary() -> [String: Any] {
        [
            "fiftyFiftyCount": fiftyFiftyCount,
            "shieldHeartCount": shieldHeartCount,
            "pharmaVisionCount": pharmaVisionCount,
            "fiftyFiftyEnhanced": fiftyFiftyEnhanced,
            "shieldHeartEnhanced": shieldHeartEnhanced,
            "pharmaVisionEnhanced": pharmaVisionEnhanced,
        ]
    }

    static func from(_ dict: [String: Any]) -> PowerUpInventory {
        PowerUpInventory(
            fiftyFiftyCount: dict["fiftyFiftyCount"] as? Int ?? 1,
            shieldHeartCount: dict["shieldHeartCount"] as? Int ?? 1,
            pharmaVisionCount: dict["pharmaVisionCount"] as? Int ?? 1,
            fiftyFiftyEnhanced: dict["fiftyFiftyEnhanced"] as? Bool ?? false,
            shieldHeartEnhanced: dict["shieldHeartEnhanced"] as? Bool ?? false,
            pharmaVisionEnhanced: dict["pharmaVisionEnhanced"] as? Bool ?? false
        )
    }
}

enum PowerUpRewardGenerator {
    nonisolated static func rollForPowerUp() -> PowerUpType? {
        let roll = Int.random(in: 1...100)
        if roll <= 20 {
            return .fiftyFifty
        } else if roll <= 32 {
            return .shieldHeart
        } else if roll <= 36 {
            return .pharmaVision
        }
        return nil
    }
}

nonisolated enum PowerUpOverflowResult: Sendable {
    case added
    case convertedToGold(Int)
    case suggestEnhancement(PowerUpType)
    case suggestPro
    case lost
}

enum PowerUpRewardHandler {
    static func handleReward(type: PowerUpType, inventory: inout PowerUpInventory, isPro: Bool) -> PowerUpOverflowResult {
        if inventory.add(type, isPro: isPro) {
            return .added
        }
        if isPro {
            return .convertedToGold(100)
        }
        if !inventory.isEnhanced(type) {
            return .suggestEnhancement(type)
        }
        if !isPro {
            return .suggestPro
        }
        return .lost
    }
}
