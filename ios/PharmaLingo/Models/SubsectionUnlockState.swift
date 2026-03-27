import Foundation

struct SubsectionUnlockState {
    let subsectionId: String
    let totalDrugs: Int
    let drugsPastFoundation: Int
    let drugsPastIndication: Int
    let drugsPastSafety: Int
    let drugsPractical: Int
    let drugsAdvanced: Int
    let hasDosingUnlocked: Bool
    let hasHarderUnlocked: Bool
    let hasCaseChallengeReady: Bool
    let seenQuestionCount: Int
    let totalEligibleQuestionCount: Int
    let masteryDepth10: Int

    var dosingFraction: String {
        "\(drugsPractical)/\(totalDrugs)"
    }

    var advancedFraction: String {
        "\(drugsAdvanced)/\(totalDrugs)"
    }

    var seenFraction: String {
        "\(seenQuestionCount)/\(totalEligibleQuestionCount)"
    }

    static let empty = SubsectionUnlockState(
        subsectionId: "",
        totalDrugs: 0,
        drugsPastFoundation: 0,
        drugsPastIndication: 0,
        drugsPastSafety: 0,
        drugsPractical: 0,
        drugsAdvanced: 0,
        hasDosingUnlocked: false,
        hasHarderUnlocked: false,
        hasCaseChallengeReady: false,
        seenQuestionCount: 0,
        totalEligibleQuestionCount: 0,
        masteryDepth10: 0
    )
}

nonisolated enum MilestoneType: String, Sendable, CaseIterable {
    case dosingUnlocked = "dosing_unlocked"
    case harderUnlocked = "harder_unlocked"
    case caseChallengeReady = "case_challenge_ready"

    var bannerTitle: String {
        switch self {
        case .dosingUnlocked: "Dosing Questions Unlocked"
        case .harderUnlocked: "Harder Questions Unlocked"
        case .caseChallengeReady: "Case Challenge Ready"
        }
    }

    var bannerIcon: String {
        switch self {
        case .dosingUnlocked: "pills.fill"
        case .harderUnlocked: "flame.fill"
        case .caseChallengeReady: "star.circle.fill"
        }
    }
}
