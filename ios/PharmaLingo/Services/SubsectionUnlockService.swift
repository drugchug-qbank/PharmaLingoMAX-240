import Foundation

struct SubsectionUnlockService {

    static func computeUnlockState(
        for subsection: Subsection,
        masteryMap: [String: MasteryRecord],
        seenQuestionIds: Set<String>,
        totalEligibleCount: Int
    ) -> SubsectionUnlockState {
        let drugs = subsection.drugs
        guard !drugs.isEmpty else { return .empty }

        var pastFoundation = 0
        var pastIndication = 0
        var pastSafety = 0
        var practical = 0
        var advanced = 0
        var stageValues: [Int] = []

        for drug in drugs {
            let stage = DrugMasteryService.learningStage(for: drug.id, masteryMap: masteryMap)
            stageValues.append(stage.rawValue)
            if stage >= .indication { pastFoundation += 1 }
            if stage >= .safety { pastIndication += 1 }
            if stage >= .practical { pastSafety += 1 }
            if stage >= .practical { practical += 1 }
            if stage >= .advanced { advanced += 1 }
        }

        let totalDrugs = drugs.count
        let dosingThreshold = max(1, totalDrugs / 3)
        let harderThreshold = max(1, totalDrugs / 2)

        let hasDosingUnlocked = practical >= dosingThreshold
        let hasHarderUnlocked = advanced >= harderThreshold

        let avgStage: Double = stageValues.isEmpty ? 0 : Double(stageValues.reduce(0, +)) / Double(stageValues.count)
        let maxStageValue = Double(DrugLearningStage.advanced.rawValue)
        let depth10 = min(10, Int((avgStage / maxStageValue) * 10.0))

        let hasCaseChallengeReady = hasHarderUnlocked && depth10 >= 7

        return SubsectionUnlockState(
            subsectionId: subsection.id,
            totalDrugs: totalDrugs,
            drugsPastFoundation: pastFoundation,
            drugsPastIndication: pastIndication,
            drugsPastSafety: pastSafety,
            drugsPractical: practical,
            drugsAdvanced: advanced,
            hasDosingUnlocked: hasDosingUnlocked,
            hasHarderUnlocked: hasHarderUnlocked,
            hasCaseChallengeReady: hasCaseChallengeReady,
            seenQuestionCount: seenQuestionIds.count,
            totalEligibleQuestionCount: totalEligibleCount,
            masteryDepth10: depth10
        )
    }

    static func newMilestones(
        previous: SubsectionUnlockState?,
        current: SubsectionUnlockState,
        alreadyShown: Set<String>
    ) -> [MilestoneType] {
        var milestones: [MilestoneType] = []
        let key = current.subsectionId

        if current.hasDosingUnlocked && !(previous?.hasDosingUnlocked ?? false) {
            let flag = "\(key)_\(MilestoneType.dosingUnlocked.rawValue)"
            if !alreadyShown.contains(flag) { milestones.append(.dosingUnlocked) }
        }
        if current.hasHarderUnlocked && !(previous?.hasHarderUnlocked ?? false) {
            let flag = "\(key)_\(MilestoneType.harderUnlocked.rawValue)"
            if !alreadyShown.contains(flag) { milestones.append(.harderUnlocked) }
        }
        if current.hasCaseChallengeReady && !(previous?.hasCaseChallengeReady ?? false) {
            let flag = "\(key)_\(MilestoneType.caseChallengeReady.rawValue)"
            if !alreadyShown.contains(flag) { milestones.append(.caseChallengeReady) }
        }
        return milestones
    }
}
