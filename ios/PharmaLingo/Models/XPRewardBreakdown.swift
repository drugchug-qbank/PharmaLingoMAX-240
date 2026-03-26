import Foundation

nonisolated struct XPRewardBreakdown: Sendable {
    let baseXP: Int
    let perfectBonusXP: Int
    let firstCompletionBonusXP: Int
    let repeatPenaltyApplied: Bool
    let runCountToday: Int
    let finalAwardedXP: Int
}
