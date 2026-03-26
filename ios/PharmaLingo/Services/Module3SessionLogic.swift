import Foundation

struct Module3SessionLogic {

    private static let module3SubsectionIds: Set<String> = ["3a", "3b", "3c", "3d", "3e", "3f", "3g"]

    static func isModule3Subsection(_ subsectionId: String) -> Bool {
        module3SubsectionIds.contains(subsectionId)
    }

    // MARK: - Insulin Role-Aware Burst Ordering

    static func insulinRoleBurstOrder(for drugId: String, stage: DrugLearningStage, pool: [Question], usedIds: Set<String>) -> [Question] {
        guard Module3ContrastMetadata.insulinRole(for: drugId) != nil else { return [] }
        let available = pool.filter { !usedIds.contains($0.id) && $0.relatedDrugIds.contains(drugId) }

        switch stage {
        case .foundation:
            return prioritizeByTags(available, preferredTags: ["insulin-role", "contrast-role"], thenObjectives: [.classId, .brandGeneric, .genericBrand], maxDifficulty: .medium)
        case .indication:
            return prioritizeByTags(available, preferredTags: ["contrast-role", "basal-vs-bolus"], thenObjectives: [.indication, .brandGeneric], maxDifficulty: .hard)
        case .safety:
            return prioritizeByTags(available, preferredTags: ["contrast-pair", "safety"], thenObjectives: [.adverseEffect, .contraindication], maxDifficulty: .hard)
        case .practical:
            return prioritizeByTags(available, preferredTags: ["timing", "dosing"], thenObjectives: [.dosing, .monitoring], maxDifficulty: .hard)
        case .advanced:
            return prioritizeByTags(available, preferredTags: ["mini-case", "capstone", "contrast-pair"], thenObjectives: [.pearl, .indication, .dosing], maxDifficulty: .expert)
        }
    }

    private static func prioritizeByTags(_ pool: [Question], preferredTags: [String], thenObjectives: [QuestionObjective], maxDifficulty: QuestionDifficulty) -> [Question] {
        let tagSet = Set(preferredTags)
        let objSet = Set(thenObjectives)

        let tagMatches = pool.filter { q in
            q.difficulty.rawValue <= maxDifficulty.rawValue && !q.tags.filter({ tagSet.contains($0) }).isEmpty
        }.shuffled()

        let objMatches = pool.filter { q in
            q.difficulty.rawValue <= maxDifficulty.rawValue && objSet.contains(q.objective) && q.tags.filter({ tagSet.contains($0) }).isEmpty
        }.shuffled()

        return tagMatches + objMatches
    }

    // MARK: - Anti-Confusion: Inject Simpler Follow-Up After Missed Insulin Role Q

    static func findAntiConfusionFollowUp(
        for missedQuestion: Question,
        subsectionId: String,
        pool: [Question],
        usedIds: Set<String>
    ) -> Question? {
        guard subsectionId == "3a" else { return nil }
        let missedTags = Set(missedQuestion.tags)
        guard missedTags.contains("insulin-role") || missedTags.contains("contrast-role") || missedTags.contains("basal-vs-bolus") else { return nil }

        let drugId = missedQuestion.relatedDrugIds.first ?? ""
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && q.id != missedQuestion.id
            && q.difficulty.rawValue <= QuestionDifficulty.medium.rawValue
            && q.type != .selectAll && q.type != .matching
        }

        let roleFollowUps = available.filter { q in
            let tags = Set(q.tags)
            return (tags.contains("insulin-role") || tags.contains("contrast-role"))
                && q.relatedDrugIds.contains(drugId)
        }.sorted { $0.difficulty.rawValue < $1.difficulty.rawValue }

        if let best = roleFollowUps.first { return best }

        let brandFollowUps = available.filter { q in
            q.relatedDrugIds.contains(drugId)
            && (q.objective == .brandGeneric || q.objective == .genericBrand || q.objective == .classId)
        }.sorted { $0.difficulty.rawValue < $1.difficulty.rawValue }

        return brandFollowUps.first
    }

    // MARK: - Earned Capstone Slot

    static func shouldInsertCapstone(sessionAccuracy: Double, currentStreak: Int, questionsAnswered: Int) -> Bool {
        guard questionsAnswered >= 6 else { return false }
        return sessionAccuracy >= 0.80 || currentStreak >= 5
    }

    static func pickCapstoneQuestion(
        subsectionId: String,
        pool: [Question],
        usedIds: Set<String>
    ) -> Question? {
        guard isModule3Subsection(subsectionId) else { return nil }
        let available = pool.filter { !usedIds.contains($0.id) }

        let capstoneCandidates = available.filter { q in
            let tags = Set(q.tags)
            return tags.contains("mini-case") || tags.contains("capstone")
        }
        if let best = capstoneCandidates.shuffled().first { return best }

        let hardContrast = available.filter { q in
            q.difficulty == .hard
            && (Set(q.tags).contains("contrast-pair") || Set(q.tags).contains("contrast-class"))
        }
        return hardContrast.shuffled().first
    }

    // MARK: - Confidence-Building Fallback (when capstone not earned)

    static func pickConfidenceQuestion(
        subsectionId: String,
        pool: [Question],
        usedIds: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> Question? {
        guard isModule3Subsection(subsectionId) else { return nil }
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && (q.difficulty == .easy || q.difficulty == .medium)
            && q.type != .selectAll
        }

        let mastered = available.filter { q in
            guard let record = masteryMap[q.masteryKey] else { return false }
            return record.accuracy >= 0.75 && record.totalAttempts >= 2
        }
        if let best = mastered.shuffled().first { return best }

        return available.sorted { $0.difficulty.rawValue < $1.difficulty.rawValue }.first
    }

    // MARK: - Contrast-Pair Injection for Subsection

    static func contrastQuestionsForSubsection(_ subsectionId: String, pool: [Question], usedIds: Set<String>, count: Int = 2) -> [Question] {
        guard isModule3Subsection(subsectionId) else { return [] }
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && q.subsectionId == subsectionId
            && !Set(q.tags).isDisjoint(with: ["contrast-pair", "contrast-class", "contrast-role"])
        }.shuffled()
        return Array(available.prefix(count))
    }
}
