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

    // MARK: - Drug-Centric Adaptive Lesson Session (10–15 questions)

    private func buildLessonSession(
        subsectionId: String,
        completedSubsections: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        guard let subsection = dataService.subsection(for: subsectionId) else { return [] }

        let totalCount = Int.random(in: 10...15)
        let reviewSubIds = completedSubsections.filter { $0 != subsectionId }
        let reviewFraction = reviewSubIds.isEmpty ? 0.0 : Double.random(in: 0.15...0.30)
        let reviewCount = reviewSubIds.isEmpty ? 0 : max(1, min(Int(Double(totalCount) * reviewFraction), 4))
        let focusCount = totalCount - reviewCount

        let focusDrugs = selectFocusDrugs(subsection: subsection, masteryMap: masteryMap)

        let allPool = buildQuestionPool(for: subsection)

        var focusQuestions = buildFocusBursts(
            drugs: focusDrugs,
            pool: allPool,
            subsection: subsection,
            focusCount: focusCount,
            masteryMap: masteryMap
        )

        let reviewQuestions = insertReviewQuestions(
            completedSubsections: completedSubsections,
            currentSubsectionId: subsectionId,
            count: reviewCount,
            masteryMap: masteryMap,
            excludeIds: Set(focusQuestions.map(\.id))
        )

        let positions = calculateReviewPositions(focusCount: focusQuestions.count, reviewCount: reviewQuestions.count)
        for (i, pos) in positions.enumerated() where i < reviewQuestions.count {
            let insertAt = min(pos, focusQuestions.count)
            focusQuestions.insert(reviewQuestions[i], at: insertAt)
        }

        var session = Array(focusQuestions.prefix(totalCount))
        session = smoothVariety(session, masteryMap: masteryMap, subsectionId: subsectionId)
        return session
    }

    // MARK: - Focus Drug Selection (2–4 weakest drugs)

    private func selectFocusDrugs(subsection: Subsection, masteryMap: [String: MasteryRecord]) -> [Drug] {
        let drugs = subsection.drugs
        guard !drugs.isEmpty else { return [] }

        let ranked = drugs.sorted { d1, d2 in
            let s1 = DrugMasteryService.learningStage(for: d1.id, masteryMap: masteryMap)
            let s2 = DrugMasteryService.learningStage(for: d2.id, masteryMap: masteryMap)
            if s1 != s2 { return s1 < s2 }
            let sum1 = DrugMasteryService.computeMastery(for: d1.id, masteryMap: masteryMap)
            let sum2 = DrugMasteryService.computeMastery(for: d2.id, masteryMap: masteryMap)
            return sum1.accuracy < sum2.accuracy
        }

        let count = min(drugs.count, Int.random(in: 2...4))
        return Array(ranked.prefix(count))
    }

    // MARK: - Build Unified Question Pool for Subsection

    private func buildQuestionPool(for subsection: Subsection) -> [Question] {
        let bucketed = hyFactory.generateBucketed(for: subsection)
        let curated = dataService.questions(for: subsection.id)
        let legacy = dataService.allQuestions(for: subsection.id)
        var pool = bucketed.all() + curated + legacy
        pool = Dictionary(grouping: pool, by: \.id).compactMap(\.value.first)
        return pool
    }

    // MARK: - Build Drug Bursts

    private func buildFocusBursts(
        drugs: [Drug],
        pool: [Question],
        subsection: Subsection,
        focusCount: Int,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        var selected: [Question] = []
        var usedIds: Set<String> = []
        let drugIds = Set(drugs.map(\.id))

        let drugPool: [String: [Question]] = {
            var map: [String: [Question]] = [:]
            for drug in drugs {
                map[drug.id] = pool.filter { q in
                    q.relatedDrugIds.contains(drug.id)
                }
            }
            return map
        }()

        for drug in drugs {
            let stage = DrugMasteryService.learningStage(for: drug.id, masteryMap: masteryMap)
            let burst = buildDrugBurst(
                for: drug,
                stage: stage,
                pool: drugPool[drug.id] ?? [],
                usedIds: usedIds
            )
            for q in burst {
                guard selected.count < focusCount else { break }
                selected.append(q)
                usedIds.insert(q.id)
            }
        }

        if selected.count < focusCount {
            for drug in drugs {
                let stage = DrugMasteryService.learningStage(for: drug.id, masteryMap: masteryMap)
                let extra = buildDrugBurst(
                    for: drug,
                    stage: stage,
                    pool: drugPool[drug.id] ?? [],
                    usedIds: usedIds,
                    burstSize: 1
                )
                for q in extra {
                    guard selected.count < focusCount else { break }
                    selected.append(q)
                    usedIds.insert(q.id)
                }
            }
        }

        if selected.count < focusCount {
            let remainingPool = pool.filter { !usedIds.contains($0.id) && drugIds.contains($0.relatedDrugIds.first ?? "") }.shuffled()
            for q in remainingPool {
                guard selected.count < focusCount else { break }
                selected.append(q)
                usedIds.insert(q.id)
            }
        }

        if selected.count < focusCount {
            let anyRemaining = pool.filter { !usedIds.contains($0.id) }.shuffled()
            for q in anyRemaining {
                guard selected.count < focusCount else { break }
                selected.append(q)
                usedIds.insert(q.id)
            }
        }

        return Array(selected.prefix(focusCount))
    }

    private func buildDrugBurst(
        for drug: Drug,
        stage: DrugLearningStage,
        pool: [Question],
        usedIds: Set<String>,
        burstSize: Int = 2
    ) -> [Question] {
        let available = pool.filter { !usedIds.contains($0.id) }
        var burst: [Question] = []
        var burstUsed = usedIds

        let m3RoleBurst = Module3SessionLogic.insulinRoleBurstOrder(for: drug.id, stage: stage, pool: pool, usedIds: usedIds)
        if !m3RoleBurst.isEmpty {
            for q in m3RoleBurst {
                guard burst.count < burstSize else { break }
                guard !burstUsed.contains(q.id) else { continue }
                burst.append(q)
                burstUsed.insert(q.id)
            }
            if burst.count >= burstSize { return burst }
        }

        let m6Burst = Module6SessionLogic.antimicrobialBurstOrder(for: drug.id, stage: stage, pool: pool, usedIds: usedIds)
        if !m6Burst.isEmpty {
            for q in m6Burst {
                guard burst.count < burstSize else { break }
                guard !burstUsed.contains(q.id) else { continue }
                burst.append(q)
                burstUsed.insert(q.id)
            }
            if burst.count >= burstSize { return burst }
        }

        let stageFilter = stageObjectivesAndFormats(for: stage, drug: drug)

        let preferred = available.filter { q in
            stageFilter.objectives.contains(q.objective)
            && stageFilter.allowedTypes.contains(q.type)
            && stageFilter.allowedDifficulties.contains(q.difficulty)
            && !burstUsed.contains(q.id)
        }.shuffled()

        for q in preferred {
            guard burst.count < burstSize else { break }
            burst.append(q)
            burstUsed.insert(q.id)
        }

        if burst.count < burstSize {
            let relaxed = available.filter { q in
                stageFilter.objectives.contains(q.objective)
                && !burstUsed.contains(q.id)
            }.shuffled()
            for q in relaxed {
                guard burst.count < burstSize else { break }
                burst.append(q)
                burstUsed.insert(q.id)
            }
        }

        if burst.count < burstSize {
            let fallback = available.filter { !burstUsed.contains($0.id) }
                .sorted { $0.difficulty.rawValue < $1.difficulty.rawValue }
            for q in fallback {
                guard burst.count < burstSize else { break }
                burst.append(q)
                burstUsed.insert(q.id)
            }
        }

        return burst
    }

    private struct StageFilter {
        let objectives: Set<QuestionObjective>
        let allowedTypes: Set<QuestionType>
        let allowedDifficulties: Set<QuestionDifficulty>
    }

    private func stageObjectivesAndFormats(for stage: DrugLearningStage, drug: Drug) -> StageFilter {
        switch stage {
        case .foundation:
            return StageFilter(
                objectives: [.suffixId, .classId, .genericBrand, .brandGeneric, .moa],
                allowedTypes: [.multipleChoice, .trueFalse, .fillBlank],
                allowedDifficulties: [.easy, .medium]
            )
        case .indication:
            return StageFilter(
                objectives: [.indication, .genericBrand, .brandGeneric],
                allowedTypes: [.multipleChoice, .trueFalse, .fillBlank],
                allowedDifficulties: [.easy, .medium, .hard]
            )
        case .safety:
            return StageFilter(
                objectives: [.adverseEffect, .contraindication, .indication],
                allowedTypes: [.multipleChoice, .trueFalse, .fillBlank],
                allowedDifficulties: [.medium, .hard]
            )
        case .practical:
            let objectives: Set<QuestionObjective> = drug.commonDosing.isEmpty
                ? [.adverseEffect, .contraindication, .monitoring, .interaction]
                : [.dosing, .monitoring, .interaction, .adverseEffect]
            return StageFilter(
                objectives: objectives,
                allowedTypes: [.multipleChoice, .trueFalse, .fillBlank, .matching],
                allowedDifficulties: [.medium, .hard]
            )
        case .advanced:
            return StageFilter(
                objectives: [.pearl, .indication, .adverseEffect, .contraindication, .dosing, .moa, .monitoring, .interaction],
                allowedTypes: [.multipleChoice, .trueFalse, .fillBlank, .matching, .selectAll],
                allowedDifficulties: [.medium, .hard, .expert]
            )
        }
    }

    // MARK: - Insert Review Questions from Completed Subsections

    private func insertReviewQuestions(
        completedSubsections: Set<String>,
        currentSubsectionId: String,
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

        for q in dueItems {
            guard !usedIds.contains(q.id) else { continue }
            selected.append(q)
            usedIds.insert(q.id)
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

    // MARK: - Smooth Variety (Post-Processing)

    private func smoothVariety(_ questions: [Question], masteryMap: [String: MasteryRecord], subsectionId: String = "") -> [Question] {
        var result = questions
        guard result.count > 3 else { return result }

        result = enforceEasyOpener(result)
        result = enforceMaxConsecutiveDrug(result)
        result = enforceStagedFormats(result, masteryMap: masteryMap)
        result = enforceVariety(result)

        if Module3SessionLogic.isModule3Subsection(subsectionId) {
            result = injectModule3ContrastQuestions(result, subsectionId: subsectionId, masteryMap: masteryMap)
        }

        if Module6SessionLogic.isModule6Subsection(subsectionId) {
            result = injectModule6ContrastQuestions(result, subsectionId: subsectionId, masteryMap: masteryMap)
            result = Module6SessionLogic.enforceAntimicrobialVariety(result)
        }

        return result
    }

    private func injectModule6ContrastQuestions(_ questions: [Question], subsectionId: String, masteryMap: [String: MasteryRecord]) -> [Question] {
        var result = questions
        let usedIds = Set(result.map(\.id))
        guard let subsection = dataService.subsection(for: subsectionId) else { return result }
        let pool = buildQuestionPool(for: subsection)
        let contrastQs = Module6SessionLogic.contrastQuestionsForSubsection(subsectionId, pool: pool, usedIds: usedIds, count: 2)

        for q in contrastQs {
            let insertPos = min(result.count, max(4, result.count / 2))
            result.insert(q, at: insertPos)
        }

        return result
    }

    private func injectModule3ContrastQuestions(_ questions: [Question], subsectionId: String, masteryMap: [String: MasteryRecord]) -> [Question] {
        var result = questions
        let usedIds = Set(result.map(\.id))
        guard let subsection = dataService.subsection(for: subsectionId) else { return result }
        let pool = buildQuestionPool(for: subsection)
        let contrastQs = Module3SessionLogic.contrastQuestionsForSubsection(subsectionId, pool: pool, usedIds: usedIds, count: 2)

        for q in contrastQs {
            let insertPos = min(result.count, max(4, result.count / 2))
            result.insert(q, at: insertPos)
        }

        return result
    }

    private func enforceEasyOpener(_ questions: [Question]) -> [Question] {
        var result = questions
        for i in 0..<min(3, result.count) {
            if result[i].difficulty == .hard || result[i].difficulty == .expert || result[i].type == .selectAll {
                if let swapIdx = (3..<result.count).first(where: {
                    (result[$0].difficulty == .easy || result[$0].difficulty == .medium)
                    && result[$0].type != .selectAll
                }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }

    private func enforceMaxConsecutiveDrug(_ questions: [Question]) -> [Question] {
        var result = questions
        guard result.count > 2 else { return result }

        for i in 2..<result.count {
            let drugA = result[i].relatedDrugIds.first ?? ""
            let drugB = result[i-1].relatedDrugIds.first ?? ""
            let drugC = result[i-2].relatedDrugIds.first ?? ""
            if !drugA.isEmpty && drugA == drugB && drugA == drugC {
                if let swapIdx = ((i+1)..<result.count).first(where: {
                    result[$0].relatedDrugIds.first != drugA
                }) {
                    result.swapAt(i, swapIdx)
                }
            }
        }
        return result
    }

    private func enforceStagedFormats(_ questions: [Question], masteryMap: [String: MasteryRecord]) -> [Question] {
        var result = questions
        var foundationSeen: Set<String> = []

        for i in 0..<result.count {
            let q = result[i]
            let drugId = q.relatedDrugIds.first ?? ""

            if !drugId.isEmpty {
                let obj = q.objective
                if obj == .suffixId || obj == .classId || obj == .genericBrand || obj == .brandGeneric || obj == .moa {
                    foundationSeen.insert(drugId)
                }
            }

            if q.type == .matching && !drugId.isEmpty && !foundationSeen.contains(drugId) {
                if let swapIdx = ((i+1)..<result.count).first(where: {
                    result[$0].type != .matching && result[$0].type != .selectAll
                }) {
                    result.swapAt(i, swapIdx)
                    let swapped = result[i]
                    let swappedDrug = swapped.relatedDrugIds.first ?? ""
                    let swappedObj = swapped.objective
                    if swappedObj == .suffixId || swappedObj == .classId || swappedObj == .genericBrand || swappedObj == .brandGeneric || swappedObj == .moa {
                        foundationSeen.insert(swappedDrug)
                    }
                }
            }

            if q.type == .selectAll && !drugId.isEmpty {
                let stage = DrugMasteryService.learningStage(for: drugId, masteryMap: masteryMap)
                if stage < .advanced {
                    if let swapIdx = ((i+1)..<result.count).first(where: {
                        result[$0].type != .selectAll
                    }) {
                        result.swapAt(i, swapIdx)
                    }
                }
            }
        }
        return result
    }

    private func relevantMasteryAverage(for subsection: Subsection, masteryMap: [String: MasteryRecord]) -> Int {
        let drugIds = subsection.drugs.map(\.id)
        let relevant = DrugMasteryService.relevantMasteryRecords(for: drugIds, masteryMap: masteryMap)
        guard !relevant.isEmpty else { return 0 }
        let total = relevant.values.reduce(0) { $0 + $1.level }
        return total / relevant.count
    }

    // MARK: - Mastery (Boss Battle) Session

    private func buildMasterySession(
        subsectionId: String,
        completedSubsections: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> [Question] {
        guard let subsection = dataService.subsection(for: subsectionId),
              let currentModule = dataService.module(for: subsection.moduleId) else { return [] }

        let totalCount = Int.random(in: 12...18)
        let callbackSlots = Int.random(in: max(2, totalCount / 5)...max(3, totalCount * 3 / 10))
        let moduleSlots = totalCount - callbackSlots
        let bossEscalationCount = Int.random(in: 3...4)

        let moduleSubIds = currentModule.subsections.filter { !$0.isMasteryQuiz }.map(\.id)
        var modulePool: [Question] = []
        for subId in moduleSubIds {
            modulePool.append(contentsOf: dataService.allQuestions(for: subId))
            if let sub = dataService.subsection(for: subId) {
                modulePool.append(contentsOf: hyFactory.generateBucketed(for: sub).all())
            }
        }
        modulePool = Dictionary(grouping: modulePool, by: \.id).compactMap(\.value.first)

        var bgMatchingQuestions: [Question] = []
        var usedBGSubsections: Set<String> = []
        for subId in moduleSubIds {
            let bgCandidates = modulePool.filter { q in
                q.type == .matching
                && (q.objective == .genericBrand || q.objective == .brandGeneric)
                && q.subsectionId == subId
                && !usedBGSubsections.contains(subId)
            }
            if let bg = bgCandidates.first {
                bgMatchingQuestions.append(bg)
                usedBGSubsections.insert(subId)
            }
            if bgMatchingQuestions.count >= 2 { break }
        }
        let bgIds = Set(bgMatchingQuestions.map(\.id))

        let nonBGModulePool = modulePool.filter { !bgIds.contains($0.id) }
        let weakFirst = nonBGModulePool.sorted { q1, q2 in
            let m1 = masteryMap[q1.masteryKey]?.level ?? 0
            let m2 = masteryMap[q2.masteryKey]?.level ?? 0
            if m1 != m2 { return m1 < m2 }
            return q1.difficulty.rawValue < q2.difficulty.rawValue
        }

        var selected: [Question] = []
        var usedIds: Set<String> = bgIds
        let coreSlots = moduleSlots - bgMatchingQuestions.count - bossEscalationCount

        for q in weakFirst {
            guard selected.count < coreSlots else { break }
            guard !usedIds.contains(q.id) else { continue }
            guard q.difficulty != .expert else { continue }
            selected.append(q)
            usedIds.insert(q.id)
        }

        let escalationPool = modulePool.filter {
            !usedIds.contains($0.id) && ($0.difficulty == .hard || $0.difficulty == .expert)
        }.shuffled()
        var escalation: [Question] = []
        for q in escalationPool {
            guard escalation.count < bossEscalationCount else { break }
            escalation.append(q)
            usedIds.insert(q.id)
        }
        if escalation.count < bossEscalationCount {
            let fallback = modulePool.filter { !usedIds.contains($0.id) && $0.difficulty == .medium }.shuffled()
            for q in fallback {
                guard escalation.count < bossEscalationCount else { break }
                escalation.append(q)
                usedIds.insert(q.id)
            }
        }

        var callbackQuestions: [Question] = []
        let currentModuleId = currentModule.id
        let earlierModules = dataService.modules.filter { $0.id != currentModuleId }
        let completedNonMasteryIds = completedSubsections.filter { subId in
            !moduleSubIds.contains(subId)
            && earlierModules.contains(where: { mod in mod.subsections.contains(where: { $0.id == subId && !$0.isMasteryQuiz }) })
        }

        if !completedNonMasteryIds.isEmpty {
            var callbackPool: [Question] = []
            for subId in completedNonMasteryIds {
                callbackPool.append(contentsOf: dataService.allQuestions(for: subId))
            }
            callbackPool = callbackPool.filter { !usedIds.contains($0.id) }
            let callbackSorted = callbackPool.sorted { q1, q2 in
                let m1 = masteryMap[q1.masteryKey]?.level ?? 0
                let m2 = masteryMap[q2.masteryKey]?.level ?? 0
                if m1 != m2 { return m1 < m2 }
                let d1 = masteryMap[q1.masteryKey]?.nextDueDate ?? .distantPast
                let d2 = masteryMap[q2.masteryKey]?.nextDueDate ?? .distantPast
                return d1 < d2
            }
            for q in callbackSorted {
                guard callbackQuestions.count < callbackSlots else { break }
                guard !usedIds.contains(q.id) else { continue }
                callbackQuestions.append(q)
                usedIds.insert(q.id)
            }
        }

        selected.shuffle()

        let reviewPositions = calculateReviewPositions(focusCount: selected.count, reviewCount: callbackQuestions.count)
        for (i, pos) in reviewPositions.enumerated() where i < callbackQuestions.count {
            let insertAt = min(pos, selected.count)
            selected.insert(callbackQuestions[i], at: insertAt)
        }

        for bg in bgMatchingQuestions {
            let position = Int.random(in: 0...min(selected.count, max(selected.count / 2, 1)))
            selected.insert(bg, at: position)
        }

        selected.append(contentsOf: escalation)

        selected = Array(selected.prefix(totalCount))

        return enforceVariety(selected)
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

    // MARK: - Remediation Candidate Finder

    func findRemediationCandidate(
        for missedQuestion: Question,
        subsectionId: String,
        excludeIds: Set<String>
    ) -> Question? {
        guard let subsection = dataService.subsection(for: subsectionId) else { return nil }
        let pool = buildQuestionPool(for: subsection)
        let drugId = missedQuestion.relatedDrugIds.first ?? ""
        let bucket = ConceptBucket.bucket(for: missedQuestion.objective)
        let available = pool.filter { !excludeIds.contains($0.id) }

        if let antiConfusion = Module3SessionLogic.findAntiConfusionFollowUp(
            for: missedQuestion,
            subsectionId: subsectionId,
            pool: pool,
            usedIds: excludeIds
        ) {
            return antiConfusion
        }

        if let m6AntiConfusion = Module6SessionLogic.findAntiConfusionFollowUp(
            for: missedQuestion,
            subsectionId: subsectionId,
            pool: pool,
            usedIds: excludeIds
        ) {
            return m6AntiConfusion
        }

        if let match = pickRemediationFromPool(
            available, drugId: drugId, bucket: bucket,
            objective: missedQuestion.objective,
            maxDifficulty: missedQuestion.difficulty
        ) {
            return match
        }

        if let match = pickRemediationFromPool(
            available, drugId: drugId, bucket: bucket,
            objective: nil,
            maxDifficulty: missedQuestion.difficulty
        ) {
            return match
        }

        let foundationObjectives: Set<QuestionObjective> = [.suffixId, .classId, .genericBrand, .brandGeneric, .moa]
        if !drugId.isEmpty {
            let fallback = available.filter { q in
                q.relatedDrugIds.contains(drugId)
                && foundationObjectives.contains(q.objective)
                && q.difficulty.rawValue <= QuestionDifficulty.medium.rawValue
                && q.type != .selectAll && q.type != .matching
            }.shuffled()
            if let f = fallback.first { return f }
        }

        return nil
    }

    private func pickRemediationFromPool(
        _ pool: [Question],
        drugId: String,
        bucket: ConceptBucket,
        objective: QuestionObjective?,
        maxDifficulty: QuestionDifficulty
    ) -> Question? {
        let candidates = pool.filter { q in
            guard !drugId.isEmpty else { return false }
            guard q.relatedDrugIds.contains(drugId) else { return false }
            if let obj = objective {
                guard q.objective == obj else { return false }
            } else {
                guard ConceptBucket.bucket(for: q.objective) == bucket else { return false }
            }
            guard q.difficulty.rawValue <= maxDifficulty.rawValue else { return false }
            guard q.type != .selectAll && q.type != .matching else { return false }
            return true
        }
        return candidates.sorted(by: { $0.difficulty.rawValue < $1.difficulty.rawValue }).first
    }
}
