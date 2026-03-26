import Foundation

struct Module7SessionLogic {

    private static let module7SubsectionIds: Set<String> = ["7a", "7b", "7c", "7d", "7e", "7f"]

    static func isModule7Subsection(_ subsectionId: String) -> Bool {
        module7SubsectionIds.contains(subsectionId)
    }

    // MARK: - Airway Role-Aware Burst Ordering

    static func respiratoryBurstOrder(for drugId: String, stage: DrugLearningStage, pool: [Question], usedIds: Set<String>) -> [Question] {
        guard Module7ContrastMetadata.isModule7Drug(drugId) else { return [] }
        let role = Module7ContrastMetadata.roleTag(for: drugId)
        let isCombo = role?.isComboProduct == true
        let hasRouteDistinction = Module7ContrastMetadata.hasRouteDistinction(drugId)

        switch stage {
        case .foundation:
            var preferred: [String] = ["airway-role", "rescue-vs-controller"]
            if isCombo { preferred.append("combo-decomposition") }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.classId, .suffixId, .brandGeneric, .genericBrand], maxDifficulty: .medium)
        case .indication:
            var preferred: [String] = ["rescue-vs-controller", "contrast-pair", "differentiator"]
            if isCombo { preferred.insert("combo-decomposition", at: 0) }
            if hasRouteDistinction { preferred.insert("route-distinction", at: 0) }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.indication, .brandGeneric, .genericBrand], maxDifficulty: .hard)
        case .safety:
            var preferred: [String] = ["contrast-pair", "differentiator", "laba-monotherapy"]
            if hasRouteDistinction { preferred.insert("route-distinction", at: 0) }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.adverseEffect, .contraindication, .interaction], maxDifficulty: .hard)
        case .practical:
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: ["dosing", "monitoring", "route-distinction"], thenObjectives: [.dosing, .monitoring, .interaction], maxDifficulty: .hard)
        case .advanced:
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: ["mini-case", "capstone", "contrast-pair", "differentiator", "combo-decomposition"], thenObjectives: [.pearl, .indication, .dosing, .mixedReview], maxDifficulty: .expert)
        }
    }

    private static func prioritizeByTags(_ pool: [Question], drugId: String, usedIds: Set<String>, preferredTags: [String], thenObjectives: [QuestionObjective], maxDifficulty: QuestionDifficulty) -> [Question] {
        let available = pool.filter { q in
            !usedIds.contains(q.id) && q.relatedDrugIds.contains(drugId)
        }
        let tagSet = Set(preferredTags)
        let objSet = Set(thenObjectives)

        let tagMatches = available.filter { q in
            q.difficulty.rawValue <= maxDifficulty.rawValue && !q.tags.filter({ tagSet.contains($0) }).isEmpty
        }.shuffled()

        let objMatches = available.filter { q in
            q.difficulty.rawValue <= maxDifficulty.rawValue && objSet.contains(q.objective) && q.tags.filter({ tagSet.contains($0) }).isEmpty
        }.shuffled()

        return tagMatches + objMatches
    }

    // MARK: - Anti-Confusion: Role/Combo Follow-Up After Missed Question

    static func findAntiConfusionFollowUp(
        for missedQuestion: Question,
        subsectionId: String,
        pool: [Question],
        usedIds: Set<String>
    ) -> Question? {
        guard isModule7Subsection(subsectionId) else { return nil }
        let missedTags = Set(missedQuestion.tags)
        let isRoleOrContrastMiss = missedTags.contains("airway-role")
            || missedTags.contains("rescue-vs-controller")
            || missedTags.contains("contrast-pair")
            || missedTags.contains("combo-decomposition")
            || missedTags.contains("route-distinction")
            || missedTags.contains("laba-monotherapy")
            || missedTags.contains("differentiator")

        guard isRoleOrContrastMiss else { return nil }

        let drugId = missedQuestion.relatedDrugIds.first ?? ""
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && q.id != missedQuestion.id
            && q.difficulty.rawValue <= QuestionDifficulty.medium.rawValue
            && q.type != .selectAll && q.type != .matching
        }

        let confusionGroupIds: Set<String> = {
            guard let role = Module7ContrastMetadata.roleTag(for: drugId) else { return Set() }
            var ids: Set<String> = []
            for group in role.confusionGroups {
                ids.formUnion(Module7ContrastMetadata.confusionGroupDrugs(for: group))
            }
            return ids
        }()

        let roleFollowUps = available.filter { q in
            let tags = Set(q.tags)
            let relatedToSameGroup = !confusionGroupIds.isEmpty && !Set(q.relatedDrugIds).isDisjoint(with: confusionGroupIds)
            return relatedToSameGroup
                && (tags.contains("airway-role") || tags.contains("rescue-vs-controller") || tags.contains("combo-decomposition") || tags.contains("contrast-pair"))
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
        guard isModule7Subsection(subsectionId) else { return nil }
        let available = pool.filter { !usedIds.contains($0.id) }

        let capstoneCandidates = available.filter { q in
            let tags = Set(q.tags)
            return tags.contains("mini-case") || tags.contains("capstone")
        }
        if let best = capstoneCandidates.shuffled().first { return best }

        let hardContrast = available.filter { q in
            q.difficulty == .hard
            && (Set(q.tags).contains("contrast-pair") || Set(q.tags).contains("contrast-class") || Set(q.tags).contains("differentiator") || Set(q.tags).contains("combo-decomposition"))
        }
        return hardContrast.shuffled().first
    }

    // MARK: - Confidence-Building Fallback

    static func pickConfidenceQuestion(
        subsectionId: String,
        pool: [Question],
        usedIds: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> Question? {
        guard isModule7Subsection(subsectionId) else { return nil }
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
        guard isModule7Subsection(subsectionId) else { return [] }
        let contrastTags: Set<String> = ["contrast-pair", "contrast-class", "rescue-vs-controller", "differentiator", "combo-decomposition", "route-distinction", "airway-role", "laba-monotherapy"]
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && !Set(q.tags).isDisjoint(with: contrastTags)
        }

        let subsectionSpecific = available.filter { $0.subsectionId == subsectionId }.shuffled()
        let crossSubsection = available.filter { $0.subsectionId != subsectionId }.shuffled()

        var result: [Question] = []
        for q in subsectionSpecific {
            guard result.count < count else { break }
            result.append(q)
        }
        for q in crossSubsection {
            guard result.count < count else { break }
            result.append(q)
        }
        return result
    }

    // MARK: - Anti-Flood: Prevent 5+ Same Airway-Role Questions in a Row

    static func enforceRespiratoryVariety(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 4 else { return result }

        for i in 4..<result.count {
            let roles = (max(0, i - 4)...i).compactMap { idx -> AirwayRole? in
                guard let drugId = result[idx].relatedDrugIds.first else { return nil }
                return Module7ContrastMetadata.roleTag(for: drugId)?.airwayRole
            }
            if roles.count >= 4 {
                let majorityRole = roles.first
                let allSame = roles.allSatisfy { $0 == majorityRole }
                if allSame {
                    if let swapIdx = ((i + 1)..<result.count).first(where: { idx in
                        guard let drugId = result[idx].relatedDrugIds.first else { return true }
                        return Module7ContrastMetadata.roleTag(for: drugId)?.airwayRole != majorityRole
                    }) {
                        result.swapAt(i, swapIdx)
                    }
                }
            }
        }
        return result
    }
}
