import Foundation

struct SessionPolishEngine {

    private static let hardenedModulePrefixes: Set<String> = ["3", "6", "7", "10"]

    static func isHardenedModule(_ subsectionId: String) -> Bool {
        for prefix in hardenedModulePrefixes {
            if subsectionId.hasPrefix(prefix) && subsectionId.count > prefix.count {
                let nextChar = subsectionId[subsectionId.index(subsectionId.startIndex, offsetBy: prefix.count)]
                if nextChar.isLetter { return true }
            }
        }
        return false
    }

    // MARK: - Anti-Repetition: Template Window (max 2 same template in 6-question window)

    static func enforceTemplateWindow(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 6 else { return result }

        for i in 2..<result.count {
            let windowStart = max(0, i - 5)
            let windowSlice = result[windowStart..<i]
            let currentType = result[i].type
            let sameTypeCount = windowSlice.filter { $0.type == currentType }.count
            if sameTypeCount >= 2 {
                if let swapIdx = ((i + 1)..<result.count).first(where: { result[$0].type != currentType }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }

    // MARK: - Anti-Repetition: Confusion Group Window (max 2 same group in 5-question window)

    static func enforceConfusionGroupWindow(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 5 else { return result }

        for i in 2..<result.count {
            let windowStart = max(0, i - 4)
            let currentGroup = primaryConfusionGroup(for: result[i])
            guard let cg = currentGroup else { continue }
            let windowSlice = result[windowStart..<i]
            let sameGroupCount = windowSlice.filter { primaryConfusionGroup(for: $0) == cg }.count
            if sameGroupCount >= 2 {
                if let swapIdx = ((i + 1)..<result.count).first(where: { primaryConfusionGroup(for: result[$0]) != cg }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }

    // MARK: - Anti-Repetition: No 3 consecutive same answer format (unless intentional remediation)

    static func enforceAnswerFormatVariety(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 3 else { return result }

        for i in 2..<result.count {
            let isRemedBlock = result[i].tags.contains("remediation") || result[i-1].tags.contains("remediation")
            if !isRemedBlock && result[i].type == result[i-1].type && result[i].type == result[i-2].type {
                if let swapIdx = ((i + 1)..<result.count).first(where: { result[$0].type != result[i].type }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }

    // MARK: - Anti-Repetition: No 3 consecutive same objective

    static func enforceObjectiveVariety(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 3 else { return result }

        for i in 2..<result.count {
            if result[i].objective == result[i-1].objective && result[i].objective == result[i-2].objective {
                if let swapIdx = ((i + 1)..<result.count).first(where: { result[$0].objective != result[i].objective }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }

    // MARK: - Contrast Satisfaction Spacing

    static func enforceContrastSpacing(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 6 else { return result }

        let contrastTags: Set<String> = ["contrast-pair", "contrast-class", "contrast-role", "differentiator", "combo-decomposition", "combo-vs-single", "route-distinction"]
        let foundationTags: Set<String> = ["insulin-role", "family-recognition", "airway-role", "micro-family", "site-of-use", "category"]

        var foundationIndices: [Int] = []
        var contrastIndices: [Int] = []

        for (i, q) in result.enumerated() {
            let tags = Set(q.tags)
            if !tags.isDisjoint(with: foundationTags) {
                foundationIndices.append(i)
            }
            if !tags.isDisjoint(with: contrastTags) {
                contrastIndices.append(i)
            }
        }

        for cIdx in contrastIndices {
            guard cIdx < result.count else { continue }
            let contrastDrugs = Set(result[cIdx].relatedDrugIds)
            let hasFoundationBefore = foundationIndices.contains { fIdx in
                fIdx < cIdx && !Set(result[fIdx].relatedDrugIds).isDisjoint(with: contrastDrugs)
            }
            guard hasFoundationBefore else { continue }

            let nearestFoundation = foundationIndices.filter { fIdx in
                fIdx < cIdx && !Set(result[fIdx].relatedDrugIds).isDisjoint(with: contrastDrugs)
            }.max() ?? 0
            let gap = cIdx - nearestFoundation

            if gap < 2 && cIdx + 1 < result.count {
                let targetPos = min(nearestFoundation + Int.random(in: 2...4), result.count - 1)
                if targetPos > cIdx && targetPos < result.count {
                    let q = result.remove(at: cIdx)
                    let insertAt = min(targetPos, result.count)
                    result.insert(q, at: insertAt)
                }
            }
        }

        return result
    }

    // MARK: - Earned Capstone Slot (build-time)

    static func insertCapstoneSlot(
        _ questions: [Question],
        subsectionId: String,
        masteryMap: [String: MasteryRecord],
        pool: [Question],
        usedIds: Set<String>
    ) -> [Question] {
        guard isHardenedModule(subsectionId) else { return questions }
        guard questions.count >= 8 else { return questions }

        var result = questions
        var allUsed = usedIds.union(Set(questions.map(\.id)))

        let capstoneQ: Question? = {
            if Module3SessionLogic.isModule3Subsection(subsectionId) {
                return Module3SessionLogic.pickCapstoneQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed)
            } else if Module6SessionLogic.isModule6Subsection(subsectionId) {
                return Module6SessionLogic.pickCapstoneQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed)
            } else if Module7SessionLogic.isModule7Subsection(subsectionId) {
                return Module7SessionLogic.pickCapstoneQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed)
            } else if Module10SessionLogic.isModule10Subsection(subsectionId) {
                return Module10SessionLogic.pickCapstoneQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed)
            }
            return nil
        }()

        let confidenceQ: Question? = {
            if Module3SessionLogic.isModule3Subsection(subsectionId) {
                return Module3SessionLogic.pickConfidenceQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed, masteryMap: masteryMap)
            } else if Module6SessionLogic.isModule6Subsection(subsectionId) {
                return Module6SessionLogic.pickConfidenceQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed, masteryMap: masteryMap)
            } else if Module7SessionLogic.isModule7Subsection(subsectionId) {
                return Module7SessionLogic.pickConfidenceQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed, masteryMap: masteryMap)
            } else if Module10SessionLogic.isModule10Subsection(subsectionId) {
                return Module10SessionLogic.pickConfidenceQuestion(subsectionId: subsectionId, pool: pool, usedIds: allUsed, masteryMap: masteryMap)
            }
            return nil
        }()

        if let cq = capstoneQ {
            result.append(cq)
            allUsed.insert(cq.id)
        }

        if let confQ = confidenceQ, !allUsed.contains(confQ.id) {
            result.append(confQ)
        }

        return result
    }

    // MARK: - Full Polish Pass

    static func applySessionPolish(
        _ questions: [Question],
        subsectionId: String,
        masteryMap: [String: MasteryRecord],
        pool: [Question],
        usedIds: Set<String>
    ) -> [Question] {
        guard isHardenedModule(subsectionId) else { return questions }

        var result = questions

        result = insertCapstoneSlot(result, subsectionId: subsectionId, masteryMap: masteryMap, pool: pool, usedIds: usedIds)

        result = enforceTemplateWindow(result)
        result = enforceConfusionGroupWindow(result)
        result = enforceAnswerFormatVariety(result)
        result = enforceObjectiveVariety(result)
        result = enforceContrastSpacing(result)

        return result
    }

    // MARK: - Runtime Capstone Check

    static func shouldUpgradeToCapstone(sessionAccuracy: Double, currentStreak: Int, questionsAnswered: Int, totalQuestions: Int) -> Bool {
        guard questionsAnswered >= totalQuestions - 2 else { return false }
        guard questionsAnswered >= 6 else { return false }
        return sessionAccuracy >= 0.80 || currentStreak >= 5
    }

    static func shouldDowngradeToConfidence(sessionAccuracy: Double, questionsAnswered: Int, totalQuestions: Int) -> Bool {
        guard questionsAnswered >= totalQuestions - 2 else { return false }
        guard questionsAnswered >= 6 else { return false }
        return sessionAccuracy < 0.80
    }

    // MARK: - Runtime Remediation Throttle

    static func shouldThrottleRemediation(
        recentQuestionTypes: [QuestionType],
        recentConfusionGroups: [String?],
        candidateType: QuestionType,
        candidateGroup: String?
    ) -> Bool {
        let recentTypeCount = recentQuestionTypes.suffix(3).filter { $0 == candidateType }.count
        if recentTypeCount >= 2 { return true }

        if let cg = candidateGroup {
            let recentGroupCount = recentConfusionGroups.suffix(4).compactMap({ $0 }).filter { $0 == cg }.count
            if recentGroupCount >= 2 { return true }
        }

        return false
    }

    // MARK: - Confusion Group Lookup

    static func primaryConfusionGroup(for question: Question) -> String? {
        guard let drugId = question.relatedDrugIds.first else { return nil }

        if let role = Module3ContrastMetadata.drugRoles[drugId] {
            return role.confusionGroups.first?.rawValue
        }
        if let role = Module6ContrastMetadata.drugRoles[drugId] {
            return role.confusionGroups.first?.rawValue
        }
        if let role = Module7ContrastMetadata.drugRoles[drugId] {
            return role.confusionGroups.first?.rawValue
        }
        if let tag = Module10ContrastMetadata.tag(for: drugId) {
            return tag.confusionGroups.first?.rawValue
        }
        return nil
    }

    static func contrastPairGroup(for question: Question) -> String? {
        let tags = Set(question.tags)
        let contrastTags: Set<String> = ["contrast-pair", "contrast-class", "contrast-role", "differentiator", "combo-decomposition", "combo-vs-single", "route-distinction"]
        guard !tags.isDisjoint(with: contrastTags) else { return nil }
        return primaryConfusionGroup(for: question)
    }

    static func isCapstoneCandidate(_ question: Question) -> Bool {
        let tags = Set(question.tags)
        return tags.contains("mini-case") || tags.contains("capstone") || tags.contains("cant-miss")
    }

    static func isContrastQuestion(_ question: Question) -> Bool {
        let tags = Set(question.tags)
        let contrastTags: Set<String> = ["contrast-pair", "contrast-class", "contrast-role", "differentiator", "combo-decomposition", "combo-vs-single", "route-distinction"]
        return !tags.isDisjoint(with: contrastTags)
    }

    static func isRemediationCandidate(_ question: Question) -> Bool {
        question.tags.contains("remediation")
    }
}
