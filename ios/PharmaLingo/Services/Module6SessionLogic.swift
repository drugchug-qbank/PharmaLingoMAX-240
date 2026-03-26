import Foundation

struct Module6SessionLogic {

    private static let module6SubsectionIds: Set<String> = ["6a", "6b", "6c", "6d", "6e", "6f"]

    static func isModule6Subsection(_ subsectionId: String) -> Bool {
        module6SubsectionIds.contains(subsectionId)
    }

    // MARK: - Route/Family-Aware Burst Ordering

    static func antimicrobialBurstOrder(for drugId: String, stage: DrugLearningStage, pool: [Question], usedIds: Set<String>) -> [Question] {
        guard Module6ContrastMetadata.isModule6Drug(drugId) else { return [] }
        let role = Module6ContrastMetadata.roleTag(for: drugId)
        let hasRouteDistinction = Module6ContrastMetadata.hasRouteDistinction(drugId)

        switch stage {
        case .foundation:
            var preferred: [String] = ["family-recognition", "contrast-class"]
            if role?.combinationProduct == true { preferred.append("combo-vs-single") }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.classId, .suffixId, .brandGeneric, .genericBrand], maxDifficulty: .medium)
        case .indication:
            var preferred: [String] = ["contrast-pair", "differentiator"]
            if hasRouteDistinction { preferred.insert("route-distinction", at: 0) }
            if role?.combinationProduct == true { preferred.append("combo-vs-single") }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.indication, .brandGeneric, .genericBrand], maxDifficulty: .hard)
        case .safety:
            var preferred: [String] = ["contrast-pair", "differentiator"]
            if hasRouteDistinction { preferred.insert("route-distinction", at: 0) }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.adverseEffect, .contraindication, .interaction], maxDifficulty: .hard)
        case .practical:
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: ["route-distinction", "site-of-use"], thenObjectives: [.dosing, .monitoring, .interaction], maxDifficulty: .hard)
        case .advanced:
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: ["mini-case", "capstone", "contrast-pair", "differentiator"], thenObjectives: [.pearl, .indication, .dosing, .mixedReview], maxDifficulty: .expert)
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

    // MARK: - Anti-Confusion: Route/Family Follow-Up After Missed Question

    static func findAntiConfusionFollowUp(
        for missedQuestion: Question,
        subsectionId: String,
        pool: [Question],
        usedIds: Set<String>
    ) -> Question? {
        guard isModule6Subsection(subsectionId) else { return nil }
        let missedTags = Set(missedQuestion.tags)
        let isRouteOrContrastMiss = missedTags.contains("route-distinction")
            || missedTags.contains("contrast-pair")
            || missedTags.contains("vanco-routes")
            || missedTags.contains("site-of-use")
            || missedTags.contains("family-recognition")
            || missedTags.contains("combo-vs-single")

        guard isRouteOrContrastMiss else { return nil }

        let drugId = missedQuestion.relatedDrugIds.first ?? ""
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && q.id != missedQuestion.id
            && q.difficulty.rawValue <= QuestionDifficulty.medium.rawValue
            && q.type != .selectAll && q.type != .matching
        }

        let confusionGroupIds: Set<String> = {
            guard let role = Module6ContrastMetadata.roleTag(for: drugId) else { return Set() }
            var ids: Set<String> = []
            for group in role.confusionGroups {
                ids.formUnion(Module6ContrastMetadata.confusionGroupDrugs(for: group))
            }
            return ids
        }()

        let routeFollowUps = available.filter { q in
            let tags = Set(q.tags)
            let relatedToSameGroup = !confusionGroupIds.isEmpty && !Set(q.relatedDrugIds).isDisjoint(with: confusionGroupIds)
            return relatedToSameGroup
                && (tags.contains("route-distinction") || tags.contains("contrast-pair") || tags.contains("family-recognition") || tags.contains("combo-vs-single"))
        }.sorted { $0.difficulty.rawValue < $1.difficulty.rawValue }

        if let best = routeFollowUps.first { return best }

        let familyFollowUps = available.filter { q in
            q.relatedDrugIds.contains(drugId)
            && (q.objective == .brandGeneric || q.objective == .genericBrand || q.objective == .classId)
        }.sorted { $0.difficulty.rawValue < $1.difficulty.rawValue }

        return familyFollowUps.first
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
        guard isModule6Subsection(subsectionId) else { return nil }
        let available = pool.filter { !usedIds.contains($0.id) }

        let capstoneCandidates = available.filter { q in
            let tags = Set(q.tags)
            return tags.contains("mini-case") || tags.contains("capstone")
        }
        if let best = capstoneCandidates.shuffled().first { return best }

        let hardContrast = available.filter { q in
            q.difficulty == .hard
            && (Set(q.tags).contains("contrast-pair") || Set(q.tags).contains("contrast-class") || Set(q.tags).contains("differentiator"))
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
        guard isModule6Subsection(subsectionId) else { return nil }
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
        guard isModule6Subsection(subsectionId) else { return [] }
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && !Set(q.tags).isDisjoint(with: ["contrast-pair", "contrast-class", "route-distinction", "differentiator", "site-of-use", "combo-vs-single"])
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

    // MARK: - Anti-Flood: Prevent 5+ Same-Family Questions in a Row

    static func enforceAntimicrobialVariety(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 4 else { return result }

        for i in 4..<result.count {
            let families = (max(0, i - 4)...i).compactMap { idx -> AntimicrobialFamily? in
                guard let drugId = result[idx].relatedDrugIds.first else { return nil }
                return Module6ContrastMetadata.roleTag(for: drugId)?.antimicrobialFamily
            }
            if families.count >= 4 {
                let majorityFamily = families.first
                let allSame = families.allSatisfy { $0 == majorityFamily }
                if allSame {
                    if let swapIdx = ((i + 1)..<result.count).first(where: { idx in
                        guard let drugId = result[idx].relatedDrugIds.first else { return true }
                        return Module6ContrastMetadata.roleTag(for: drugId)?.antimicrobialFamily != majorityFamily
                    }) {
                        result.swapAt(i, swapIdx)
                    }
                }
            }
        }
        return result
    }
}
