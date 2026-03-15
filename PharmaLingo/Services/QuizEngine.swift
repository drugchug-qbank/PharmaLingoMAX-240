import Foundation

struct QuizEngine {
    static let shared = QuizEngine()
    private let dataService = DrugDataService.shared
    private let hyFactory = HighYieldQuestionFactory.shared

    func buildSessionQuestions(
        subsectionId: String,
        isMastery: Bool,
        completedSubsections: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        if isMastery {
            return buildMasterySession(subsectionId: subsectionId, completedSubsections: completedSubsections, masteryMap: masteryMap)
        }
        return buildLessonSession(subsectionId: subsectionId, completedSubsections: completedSubsections, masteryMap: masteryMap)
    }

    // MARK: - Lesson Session (TOTAL 10–15 questions including review)

    private func buildLessonSession(
        subsectionId: String,
        completedSubsections: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        let totalCount = Int.random(in: 10...15)
        let reviewSubIds = completedSubsections.filter { $0 != subsectionId }
        let reviewCount = reviewSubIds.isEmpty ? 0 : min(2, totalCount - 6)
        let focusCount = totalCount - reviewCount

        let focusQuestions = selectTeachingArcQuestions(
            subsectionId: subsectionId,
            count: focusCount,
            masteryMap: masteryMap
        )

        let reviewQuestions = selectReviewQuestions(
            currentSubsectionId: subsectionId,
            completedSubsections: completedSubsections,
            count: reviewCount,
            masteryMap: masteryMap,
            excludeIds: Set(focusQuestions.map(\.id))
        )

        var combined = interleaveQuestions(focus: focusQuestions, review: reviewQuestions, masteryMap: masteryMap)

        combined = enforceTypeQuotas(
            combined,
            subsectionId: subsectionId,
            completedSubsections: completedSubsections,
            totalCount: totalCount
        )

        return combined
    }

    // MARK: - Teaching Arc Selection

    private func selectTeachingArcQuestions(
        subsectionId: String,
        count: Int,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        guard let subsection = dataService.subsection(for: subsectionId) else { return [] }

        var bucketed = hyFactory.generateBucketed(for: subsection)
        let curatedPool = dataService.questions(for: subsectionId).shuffled()
        for cq in curatedPool {
            switch cq.objective {
            case .suffixId, .classId, .genericBrand, .brandGeneric:
                bucketed.classPattern.append(cq)
            case .indication:
                bucketed.indication.append(cq)
            case .adverseEffect:
                bucketed.sideEffect.append(cq)
            case .contraindication:
                bucketed.blackBoxContraindication.append(cq)
            case .pearl, .moa:
                bucketed.pearlDifferentiator.append(cq)
            case .dosing:
                bucketed.dosing.append(cq)
            default:
                bucketed.pearlDifferentiator.append(cq)
            }
        }
        let legacyPool = dataService.allQuestions(for: subsectionId)

        let avgMastery = averageMastery(for: subsectionId, masteryMap: masteryMap)

        let warmupTarget = Int.random(in: 1...2)
        let coreUseTarget = Int.random(in: 2...3)
        let safetyTarget = Int.random(in: 2...min(4, max(2, count - warmupTarget - coreUseTarget - 2)))
        let dosingTarget = 1
        let diffTarget = Int.random(in: 1...2)
        let challengeTarget = avgMastery >= 3 ? 1 : 0

        var selected: [Question] = []
        var usedIds: Set<String> = []

        func pickFrom(_ pool: [Question], target: Int, preferDifficulty: [QuestionDifficulty]? = nil) {
            guard target > 0 else { return }
            var candidates = pool.filter { !usedIds.contains($0.id) }
            if let prefs = preferDifficulty {
                let preferred = candidates.filter { prefs.contains($0.difficulty) }
                let rest = candidates.filter { !prefs.contains($0.difficulty) }
                candidates = preferred.shuffled() + rest.shuffled()
            } else {
                candidates = candidates.shuffled()
            }
            var picked = 0
            for q in candidates {
                guard picked < target else { break }
                guard selected.count < count else { return }
                guard !usedIds.contains(q.id) else { continue }
                selected.append(q)
                usedIds.insert(q.id)
                picked += 1
            }
        }

        let diffForMastery = difficultyPreference(avgMastery: avgMastery)

        pickFrom(bucketed.classPattern, target: warmupTarget, preferDifficulty: [.easy])
        if selected.count < warmupTarget {
            let legacySuffix = legacyPool.filter { $0.objective == .suffixId || $0.objective == .classId }
            pickFrom(legacySuffix, target: warmupTarget - selected.count, preferDifficulty: [.easy])
        }

        let coreStart = selected.count
        pickFrom(bucketed.indication, target: coreUseTarget, preferDifficulty: diffForMastery)
        let coreGot = selected.count - coreStart
        if coreGot < coreUseTarget {
            let legacyInd = legacyPool.filter { $0.objective == .indication }
            pickFrom(legacyInd, target: coreUseTarget - coreGot, preferDifficulty: diffForMastery)
        }

        let safetyStart = selected.count
        pickFrom(bucketed.sideEffect, target: (safetyTarget + 1) / 2, preferDifficulty: diffForMastery)
        pickFrom(bucketed.blackBoxContraindication, target: safetyTarget - (selected.count - safetyStart), preferDifficulty: diffForMastery)
        let safetyGot = selected.count - safetyStart
        if safetyGot < safetyTarget {
            let legacySafety = legacyPool.filter { $0.objective == .adverseEffect || $0.objective == .contraindication }
            pickFrom(legacySafety, target: safetyTarget - safetyGot, preferDifficulty: diffForMastery)
        }

        let dosingStart = selected.count
        pickFrom(bucketed.dosing, target: dosingTarget, preferDifficulty: diffForMastery)
        let dosingGot = selected.count - dosingStart
        if dosingGot < dosingTarget {
            let legacyDosing = legacyPool.filter { $0.objective == .dosing }
            pickFrom(legacyDosing, target: dosingTarget - dosingGot, preferDifficulty: diffForMastery)
        }

        let diffStart = selected.count
        pickFrom(bucketed.pearlDifferentiator, target: diffTarget, preferDifficulty: [.hard, .medium])
        let diffGot = selected.count - diffStart
        if diffGot < diffTarget {
            let legacyPearl = legacyPool.filter { $0.objective == .pearl }
            pickFrom(legacyPearl, target: diffTarget - diffGot)
        }

        if challengeTarget > 0 {
            let challengePool = (bucketed.all() + legacyPool).filter {
                ($0.difficulty == .expert || $0.difficulty == .hard) &&
                ($0.type == .selectAll || $0.type == .matching) &&
                !usedIds.contains($0.id)
            }
            pickFrom(challengePool, target: challengeTarget, preferDifficulty: [.expert, .hard])
        }

        if selected.count < count {
            let remaining = (bucketed.all() + legacyPool).filter { !usedIds.contains($0.id) }
            pickFrom(remaining, target: count - selected.count, preferDifficulty: diffForMastery)
        }

        selected = Array(selected.prefix(count))

        selected = addWeakConceptReinforcement(selected, subsectionId: subsectionId, masteryMap: masteryMap, bucketed: bucketed, legacyPool: legacyPool, maxCount: count)

        return selected
    }

    // MARK: - Enforce Matching/SelectAll Quotas

    private func enforceTypeQuotas(
        _ questions: [Question],
        subsectionId: String,
        completedSubsections: Set<String>,
        totalCount: Int
    ) -> [Question] {
        var result = questions
        let matchingTarget = Int.random(in: 1...3)
        let selectAllTarget = Int.random(in: 1...3)

        var usedIds = Set(result.map(\.id))

        let hasBrandGenericMatching = result.contains { q in
            q.type == .matching
            && (q.objective == .genericBrand || q.objective == .brandGeneric)
            && q.subsectionId == subsectionId
        }

        if !hasBrandGenericMatching {
            var bgCandidate: Question?
            if let sub = dataService.subsection(for: subsectionId) {
                let bucketed = hyFactory.generateBucketed(for: sub)
                bgCandidate = bucketed.classPattern.first { q in
                    q.type == .matching
                    && (q.objective == .genericBrand || q.objective == .brandGeneric)
                    && !usedIds.contains(q.id)
                }
            }
            if bgCandidate == nil {
                bgCandidate = dataService.allQuestions(for: subsectionId).first { q in
                    q.type == .matching
                    && (q.objective == .genericBrand || q.objective == .brandGeneric)
                    && !usedIds.contains(q.id)
                }
            }
            if let bg = bgCandidate {
                let swapOutIdx = result.lastIndex(where: {
                    $0.type != .matching && $0.type != .selectAll
                })
                if let idx = swapOutIdx, result.count >= totalCount {
                    result[idx] = bg
                } else if result.count < totalCount {
                    result.append(bg)
                }
                usedIds.insert(bg.id)
            }
        }

        let currentMatching = result.filter { $0.type == .matching }.count
        let currentSelectAll = result.filter { $0.type == .selectAll }.count

        var extraPool: [Question] = []
        if currentMatching < matchingTarget || currentSelectAll < selectAllTarget {
            if let sub = dataService.subsection(for: subsectionId) {
                let bucketed = hyFactory.generateBucketed(for: sub)
                extraPool.append(contentsOf: bucketed.all().filter { !usedIds.contains($0.id) })
            }
            let legacy = dataService.allQuestions(for: subsectionId).filter { !usedIds.contains($0.id) }
            extraPool.append(contentsOf: legacy)

            for compId in completedSubsections where compId != subsectionId {
                if let compSub = dataService.subsection(for: compId) {
                    let compBucketed = hyFactory.generateBucketed(for: compSub)
                    extraPool.append(contentsOf: compBucketed.all().filter { !usedIds.contains($0.id) })
                }
            }
        }

        var usedExtraIds = usedIds

        func swapInType(_ targetType: QuestionType, needed: Int) {
            guard needed > 0 else { return }
            let available = extraPool.filter { $0.type == targetType && !usedExtraIds.contains($0.id) }.shuffled()
            var added = 0
            for q in available {
                guard added < needed else { break }
                let swapOutIdx = result.lastIndex(where: {
                    $0.type != .matching && $0.type != .selectAll
                })
                if let idx = swapOutIdx, result.count >= totalCount {
                    result[idx] = q
                } else if result.count < totalCount {
                    result.append(q)
                } else {
                    break
                }
                usedExtraIds.insert(q.id)
                added += 1
            }
        }

        let matchingNeeded = max(0, matchingTarget - currentMatching)
        let selectAllNeeded = max(0, selectAllTarget - currentSelectAll)

        swapInType(.matching, needed: matchingNeeded)
        swapInType(.selectAll, needed: selectAllNeeded)

        result = Array(result.prefix(totalCount))

        return enforceVariety(result)
    }

    private func addWeakConceptReinforcement(
        _ questions: [Question],
        subsectionId: String,
        masteryMap: [String: MasteryRecord],
        bucketed: HighYieldQuestionFactory.BucketedQuestions,
        legacyPool: [Question],
        maxCount: Int
    ) -> [Question] {
        var result = questions
        let usedIds = Set(result.map(\.id))

        let wrongKeys = result.compactMap { q -> String? in
            let record = masteryMap[q.masteryKey]
            if let r = record, r.level <= 1, r.totalAttempts > 0 { return q.masteryKey }
            return nil
        }

        guard !wrongKeys.isEmpty, result.count < maxCount else { return result }

        let weakKeySet = Set(wrongKeys)
        let reinforcementPool = (bucketed.all() + legacyPool).filter { q in
            !usedIds.contains(q.id) && weakKeySet.contains(q.masteryKey)
        }

        for q in reinforcementPool.shuffled().prefix(maxCount - result.count) {
            let alreadyHasType = result.contains(where: { $0.masteryKey == q.masteryKey && $0.type == q.type })
            if !alreadyHasType {
                result.append(q)
            }
        }

        return Array(result.prefix(maxCount))
    }

    private func averageMastery(for subsectionId: String, masteryMap: [String: MasteryRecord]) -> Int {
        let relevantKeys = masteryMap.filter { $0.key.contains(subsectionId) || $0.value.totalAttempts > 0 }
        guard !relevantKeys.isEmpty else { return 0 }
        let total = relevantKeys.values.reduce(0) { $0 + $1.level }
        return total / relevantKeys.count
    }

    private func difficultyPreference(avgMastery: Int) -> [QuestionDifficulty] {
        switch avgMastery {
        case 0...1: return [.easy, .medium]
        case 2: return [.medium, .easy]
        case 3: return [.medium, .hard]
        default: return [.hard, .expert]
        }
    }

    // MARK: - Mastery Session

    private func buildMasterySession(
        subsectionId: String,
        completedSubsections: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        guard let subsection = dataService.subsection(for: subsectionId),
              let module = dataService.module(for: subsection.moduleId) else { return [] }

        let moduleSubIds = module.subsections.filter { !$0.isMasteryQuiz }.map(\.id)
        var allPool: [Question] = []
        for subId in moduleSubIds {
            allPool.append(contentsOf: dataService.allQuestions(for: subId))
            if let sub = dataService.subsection(for: subId) {
                allPool.append(contentsOf: hyFactory.generateBucketed(for: sub).all())
            }
        }

        let uniquePool = Dictionary(grouping: allPool, by: \.id).compactMap(\.value.first)

        var bgMatchingQuestions: [Question] = []
        var usedBGSubsections: Set<String> = []
        for subId in moduleSubIds {
            let bgCandidates = uniquePool.filter { q in
                q.type == .matching
                && (q.objective == .genericBrand || q.objective == .brandGeneric)
                && q.subsectionId == subId
                && !usedBGSubsections.contains(subId)
            }
            if let bg = bgCandidates.first {
                bgMatchingQuestions.append(bg)
                usedBGSubsections.insert(subId)
            }
            if bgMatchingQuestions.count >= 5 { break }
        }

        let bgIds = Set(bgMatchingQuestions.map(\.id))

        let nonBGPool = uniquePool.filter { !bgIds.contains($0.id) }
        let sorted = nonBGPool.sorted { q1, q2 in
            let m1 = masteryMap[q1.masteryKey]?.level ?? 0
            let m2 = masteryMap[q2.masteryKey]?.level ?? 0
            if m1 != m2 { return m1 < m2 }
            return q1.difficulty.rawValue < q2.difficulty.rawValue
        }

        let maxTotal = 30
        let remainingSlots = maxTotal - bgMatchingQuestions.count

        var selected: [Question] = []
        var usedIds: Set<String> = bgIds

        var addedCount = 0
        for q in sorted {
            guard !usedIds.contains(q.id) else { continue }
            selected.append(q)
            usedIds.insert(q.id)
            addedCount += 1
            if addedCount >= remainingSlots { break }
        }

        selected.shuffle()

        for bg in bgMatchingQuestions {
            let position = Int.random(in: 0...selected.count)
            selected.insert(bg, at: position)
        }

        return enforceVariety(selected)
    }

    // MARK: - Review Question Selection

    private func selectReviewQuestions(
        currentSubsectionId: String,
        completedSubsections: Set<String>,
        count: Int,
        masteryMap: [String: MasteryRecord],
        excludeIds: Set<String>
    ) -> [Question] {
        let reviewSubIds = completedSubsections.filter { $0 != currentSubsectionId }
        guard !reviewSubIds.isEmpty, count > 0 else { return [] }

        var candidatePool: [Question] = []
        for subId in reviewSubIds {
            candidatePool.append(contentsOf: dataService.allQuestions(for: subId))
        }
        candidatePool = candidatePool.filter { !excludeIds.contains($0.id) }

        let dueItems = candidatePool.filter { q in
            guard let record = masteryMap[q.masteryKey] else { return true }
            return record.isDue
        }.sorted { q1, q2 in
            let d1 = masteryMap[q1.masteryKey]?.nextDueDate ?? .distantPast
            let d2 = masteryMap[q2.masteryKey]?.nextDueDate ?? .distantPast
            return d1 < d2
        }

        var selected: [Question] = []
        var usedIds = excludeIds
        var usedSubsections: Set<String> = []

        for q in dueItems {
            guard !usedIds.contains(q.id) else { continue }
            selected.append(q)
            usedIds.insert(q.id)
            usedSubsections.insert(q.subsectionId)
            if selected.count >= count { break }
        }

        if selected.count < count {
            for q in candidatePool.shuffled() where !usedIds.contains(q.id) {
                selected.append(q)
                usedIds.insert(q.id)
                if selected.count >= count { break }
            }
        }

        return Array(selected.prefix(count))
    }

    // MARK: - Interleave + Enforce Variety

    private func interleaveQuestions(
        focus: [Question],
        review: [Question],
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        var ordered = focus

        let positions = calculateReviewPositions(focusCount: ordered.count, reviewCount: review.count)
        for (i, pos) in positions.enumerated() where i < review.count {
            let insertAt = min(pos, ordered.count)
            ordered.insert(review[i], at: insertAt)
        }

        return enforceVariety(ordered)
    }

    private func calculateReviewPositions(focusCount: Int, reviewCount: Int) -> [Int] {
        guard focusCount > 0, reviewCount > 0 else { return [] }
        let spacing = focusCount / (reviewCount + 1)
        return (1...reviewCount).map { i in
            min(spacing * i + Int.random(in: 0...1), focusCount)
        }
    }

    private func enforceVariety(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 3 else { return result }

        for i in 2..<result.count {
            if result[i].type == result[i-1].type && result[i].type == result[i-2].type {
                if let swapIdx = ((i+1)..<result.count).first(where: { result[$0].type != result[i].type }) {
                    result.swapAt(i, swapIdx)
                }
            }
            if result[i].objective == result[i-1].objective && result[i].objective == result[i-2].objective {
                if let swapIdx = ((i+1)..<result.count).first(where: { result[$0].objective != result[i].objective }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }
}
