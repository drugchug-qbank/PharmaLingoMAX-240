import Foundation

struct QuizEngine {
    static let shared = QuizEngine()
    private let dataService = DrugDataService.shared
    private let factory = QuestionFactory.shared

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

    // MARK: - Lesson Session (10-15 focus + 2-4 review)

    private func buildLessonSession(
        subsectionId: String,
        completedSubsections: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        let focusCount = Int.random(in: 12...15)
        let reviewCount = Int.random(in: 2...4)

        let focusQuestions = selectFocusQuestions(
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

        return interleaveQuestions(focus: focusQuestions, review: reviewQuestions, masteryMap: masteryMap)
    }

    // MARK: - Mastery Session (30 questions from all completed subsections in module)

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
        }

        let sorted = allPool.sorted { q1, q2 in
            let m1 = masteryMap[q1.masteryKey]?.level ?? 0
            let m2 = masteryMap[q2.masteryKey]?.level ?? 0
            if m1 != m2 { return m1 < m2 }
            return q1.difficulty.rawValue < q2.difficulty.rawValue
        }

        var selected: [Question] = []
        var usedIds: Set<String> = []

        for q in sorted {
            guard !usedIds.contains(q.id) else { continue }
            selected.append(q)
            usedIds.insert(q.id)
            if selected.count >= 30 { break }
        }

        return orderByAdaptiveDifficulty(selected, masteryMap: masteryMap)
    }

    // MARK: - Focus Question Selection

    private func selectFocusQuestions(
        subsectionId: String,
        count: Int,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        let allPool = dataService.allQuestions(for: subsectionId)
        guard !allPool.isEmpty else { return [] }

        let easy = allPool.filter { $0.difficulty == .easy }.shuffled()
        let medium = allPool.filter { $0.difficulty == .medium }.shuffled()
        let hard = allPool.filter { $0.difficulty == .hard || $0.difficulty == .expert }.shuffled()

        let weakQuestions = allPool.filter { q in
            let record = masteryMap[q.masteryKey]
            return record == nil || (record?.level ?? 0) <= 1
        }.shuffled()

        var selected: [Question] = []
        var usedIds: Set<String> = []

        let easyCount = min(easy.count, max(3, count / 3))
        for q in easy.prefix(easyCount) where !usedIds.contains(q.id) {
            selected.append(q)
            usedIds.insert(q.id)
        }

        for q in weakQuestions where !usedIds.contains(q.id) {
            selected.append(q)
            usedIds.insert(q.id)
            if selected.count >= count / 2 { break }
        }

        for q in medium where !usedIds.contains(q.id) {
            selected.append(q)
            usedIds.insert(q.id)
            if selected.count >= count - 2 { break }
        }

        for q in hard where !usedIds.contains(q.id) {
            selected.append(q)
            usedIds.insert(q.id)
            if selected.count >= count { break }
        }

        if selected.count < count {
            for q in allPool.shuffled() where !usedIds.contains(q.id) {
                selected.append(q)
                usedIds.insert(q.id)
                if selected.count >= count { break }
            }
        }

        return Array(selected.prefix(count))
    }

    // MARK: - Review Question Selection (spaced repetition priority)

    private func selectReviewQuestions(
        currentSubsectionId: String,
        completedSubsections: Set<String>,
        count: Int,
        masteryMap: [String: MasteryRecord],
        excludeIds: Set<String>
    ) -> [Question] {
        let reviewSubIds = completedSubsections.filter { $0 != currentSubsectionId }
        guard !reviewSubIds.isEmpty else { return [] }

        var candidatePool: [Question] = []
        for subId in reviewSubIds {
            candidatePool.append(contentsOf: dataService.allQuestions(for: subId))
        }
        candidatePool = candidatePool.filter { !excludeIds.contains($0.id) }

        let dueItems = candidatePool.filter { q in
            guard let record = masteryMap[q.masteryKey] else { return true }
            return record.isDue
        }.sorted { q1, q2 in
            let r1 = masteryMap[q1.masteryKey]
            let r2 = masteryMap[q2.masteryKey]
            let d1 = r1?.nextDueDate ?? .distantPast
            let d2 = r2?.nextDueDate ?? .distantPast
            return d1 < d2
        }

        var selected: [Question] = []
        var usedIds = excludeIds
        var usedSubsections: Set<String> = []

        for q in dueItems {
            guard !usedIds.contains(q.id) else { continue }
            if usedSubsections.count < count {
                selected.append(q)
                usedIds.insert(q.id)
                usedSubsections.insert(q.subsectionId)
            }
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

    // MARK: - Interleave + Adaptive Ordering

    private func interleaveQuestions(
        focus: [Question],
        review: [Question],
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        var ordered = orderByAdaptiveDifficulty(focus, masteryMap: masteryMap)

        let reviewPositions = calculateReviewPositions(focusCount: ordered.count, reviewCount: review.count)
        for (i, pos) in reviewPositions.enumerated() where i < review.count {
            let insertAt = min(pos, ordered.count)
            ordered.insert(review[i], at: insertAt)
        }

        return enforceTypeVariety(ordered)
    }

    private func calculateReviewPositions(focusCount: Int, reviewCount: Int) -> [Int] {
        guard focusCount > 0, reviewCount > 0 else { return [] }
        let spacing = focusCount / (reviewCount + 1)
        return (1...reviewCount).map { i in
            min(spacing * i + Int.random(in: 0...1), focusCount)
        }
    }

    private func orderByAdaptiveDifficulty(_ questions: [Question], masteryMap: [String: MasteryRecord]) -> [Question] {
        var easy = questions.filter { $0.difficulty == .easy }.shuffled()
        var medium = questions.filter { $0.difficulty == .medium }.shuffled()
        let hard = questions.filter { $0.difficulty == .hard || $0.difficulty == .expert }.shuffled()

        _ = medium.partition { q in
            let level = masteryMap[q.masteryKey]?.level ?? 0
            return level >= 3
        }

        var result: [Question] = []
        let easySlice = min(easy.count, 4)
        result.append(contentsOf: easy.prefix(easySlice))
        easy = Array(easy.dropFirst(easySlice))

        result.append(contentsOf: medium)
        result.append(contentsOf: easy)
        result.append(contentsOf: hard)

        return result
    }

    private func enforceTypeVariety(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 3 else { return result }

        for i in 2..<result.count {
            if result[i].type == result[i-1].type && result[i].type == result[i-2].type {
                if let swapIdx = ((i+1)..<result.count).first(where: { result[$0].type != result[i].type }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }
}
