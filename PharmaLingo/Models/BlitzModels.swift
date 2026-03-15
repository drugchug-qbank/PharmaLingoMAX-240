import Foundation

nonisolated struct BlitzQuestionResult: Sendable {
    let questionIndex: Int
    let isCorrect: Bool
    let timeSpent: TimeInterval
    let comboAtTime: Int
    let speedBonusXP: Int
}

nonisolated struct BlitzRunSummary: Sendable {
    let totalTime: TimeInterval
    let correctCount: Int
    let totalCount: Int
    let bestCombo: Int
    let speedBonusXP: Int
    let comboBonus: Int
    let perfectStreakBonus: Int
    let baseXP: Int
    let baseCoins: Int
    let questionResults: [BlitzQuestionResult]

    var accuracy: Double {
        guard totalCount > 0 else { return 0 }
        return Double(correctCount) / Double(totalCount)
    }

    var averageTime: TimeInterval {
        guard totalCount > 0 else { return 0 }
        return totalTime / Double(totalCount)
    }

    var totalXP: Int {
        baseXP + speedBonusXP + comboBonus + perfectStreakBonus
    }

    var totalCoins: Int {
        baseCoins + (perfectStreakBonus > 0 ? 15 : 0) + (bestCombo >= 5 ? 10 : 0)
    }

    var isPerfect: Bool { correctCount == totalCount }
}

nonisolated struct BlitzLeaderboardEntry: Identifiable, Sendable {
    let id: String
    let username: String
    let score: Int
    let accuracy: Double
    let bestCombo: Int
    let date: Date
}
