import Foundation

struct Module10SessionLogic {

    private static let module10SubsectionIds: Set<String> = ["10a", "10b", "10c", "10d", "10e", "10f"]
    private static let reviewOnlySubsections: Set<String> = ["10d", "10f"]

    static func isModule10Subsection(_ subsectionId: String) -> Bool {
        module10SubsectionIds.contains(subsectionId)
    }

    static func isReviewOnly(_ subsectionId: String) -> Bool {
        reviewOnlySubsections.contains(subsectionId)
    }

    // MARK: - Micro-Family-Aware Burst Ordering

    static func microFamilyBurstOrder(for drugId: String, stage: DrugLearningStage, pool: [Question], usedIds: Set<String>) -> [Question] {
        guard Module10ContrastMetadata.isModule10Drug(drugId) else { return [] }
        let tag = Module10ContrastMetadata.tag(for: drugId)
        let siteOfUse = tag?.siteOfUse

        switch stage {
        case .foundation:
            var preferred: [String] = ["micro-family", "site-of-use", "category"]
            if siteOfUse == .ophthalmic { preferred.append("glaucoma") }
            if siteOfUse == .topicalSkin { preferred.append("potency") }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.classId, .suffixId, .brandGeneric, .genericBrand], maxDifficulty: .medium)
        case .indication:
            var preferred: [String] = ["micro-family", "site-of-use", "contrast-pair", "differentiator"]
            if siteOfUse == .ophthalmic || siteOfUse == .topicalSkin || siteOfUse == .topicalNail {
                preferred.insert("site-specific", at: 0)
            }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.indication, .brandGeneric, .genericBrand], maxDifficulty: .hard)
        case .safety:
            var preferred: [String] = ["contrast-pair", "differentiator", "site-of-use"]
            if tag?.microFamily == .topicalSteroid { preferred.insert("potency", at: 0) }
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: preferred, thenObjectives: [.adverseEffect, .contraindication, .interaction], maxDifficulty: .hard)
        case .practical:
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: ["dosing", "monitoring", "site-of-use"], thenObjectives: [.dosing, .monitoring, .interaction], maxDifficulty: .hard)
        case .advanced:
            return prioritizeByTags(pool, drugId: drugId, usedIds: usedIds, preferredTags: ["mini-case", "capstone", "contrast-pair", "differentiator", "cant-miss"], thenObjectives: [.pearl, .indication, .dosing, .mixedReview], maxDifficulty: .expert)
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

    // MARK: - Anti-Confusion: Micro-Family Follow-Up After Missed Question

    static func findAntiConfusionFollowUp(
        for missedQuestion: Question,
        subsectionId: String,
        pool: [Question],
        usedIds: Set<String>
    ) -> Question? {
        guard isModule10Subsection(subsectionId) else { return nil }
        let missedTags = Set(missedQuestion.tags)
        let isRelevantMiss = missedTags.contains("micro-family")
            || missedTags.contains("site-of-use")
            || missedTags.contains("contrast-pair")
            || missedTags.contains("differentiator")
            || missedTags.contains("site-specific")
            || missedTags.contains("category")
            || missedTags.contains("potency")

        guard isRelevantMiss else { return nil }

        let drugId = missedQuestion.relatedDrugIds.first ?? ""
        let available = pool.filter { q in
            !usedIds.contains(q.id)
            && q.id != missedQuestion.id
            && q.difficulty.rawValue <= QuestionDifficulty.medium.rawValue
            && q.type != .selectAll && q.type != .matching
        }

        let sameFamilyIds: Set<String> = Set(Module10ContrastMetadata.drugsInSameMicroFamily(as: drugId))

        let familyFollowUps = available.filter { q in
            let tags = Set(q.tags)
            let relatedToFamily = !sameFamilyIds.isEmpty && !Set(q.relatedDrugIds).isDisjoint(with: sameFamilyIds)
            return relatedToFamily
                && (tags.contains("micro-family") || tags.contains("site-of-use") || tags.contains("category") || tags.contains("contrast-pair"))
        }.sorted { $0.difficulty.rawValue < $1.difficulty.rawValue }

        if let best = familyFollowUps.first { return best }

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
        guard isModule10Subsection(subsectionId) else { return nil }
        let available = pool.filter { !usedIds.contains($0.id) }

        let capstoneCandidates = available.filter { q in
            let tags = Set(q.tags)
            return tags.contains("mini-case") || tags.contains("capstone") || tags.contains("cant-miss")
        }
        if let best = capstoneCandidates.shuffled().first { return best }

        let hardContrast = available.filter { q in
            q.difficulty == .hard
            && (Set(q.tags).contains("contrast-pair") || Set(q.tags).contains("differentiator"))
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
        guard isModule10Subsection(subsectionId) else { return nil }
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
        guard isModule10Subsection(subsectionId) else { return [] }
        let contrastTags: Set<String> = ["contrast-pair", "differentiator", "micro-family", "site-of-use", "site-specific", "category", "potency", "cant-miss"]
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

    // MARK: - Anti-Flood: Prevent 5+ Unrelated Micro-Family Questions in a Row

    static func enforceMicroFamilyVariety(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 4 else { return result }

        for i in 2..<result.count {
            let familyA = familyFor(result[i])
            let familyB = familyFor(result[max(0, i - 1)])
            let familyC = familyFor(result[max(0, i - 2)])

            if let fA = familyA, let fB = familyB, let fC = familyC, fA == fB && fA == fC {
                if let swapIdx = ((i + 1)..<result.count).first(where: { idx in
                    familyFor(result[idx]) != fA
                }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }

    // MARK: - Enforce 2-Question Micro-Family Bursts in 10e

    static func enforceMicroFamilyBursts(_ questions: [Question], subsectionId: String) -> [Question] {
        guard subsectionId == "10e" else { return questions }
        guard questions.count > 3 else { return questions }

        var result: [Question] = []
        var remaining = questions
        var usedIndices: Set<Int> = []

        while !remaining.isEmpty {
            guard let first = remaining.first else { break }
            let firstFamily = familyFor(first)
            result.append(first)
            remaining.removeFirst()

            if let family = firstFamily {
                if let pairIdx = remaining.firstIndex(where: { familyFor($0) == family }) {
                    result.append(remaining[pairIdx])
                    remaining.remove(at: pairIdx)
                }
            }
        }

        _ = usedIndices
        return result
    }

    private static func familyFor(_ question: Question) -> Module10MicroFamily? {
        guard let drugId = question.relatedDrugIds.first else { return nil }
        return Module10ContrastMetadata.microFamily(for: drugId)
    }
}
