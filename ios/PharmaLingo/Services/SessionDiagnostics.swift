import Foundation

#if DEBUG

nonisolated struct QuestionDiagnostic: Sendable {
    let index: Int
    let questionId: String
    let drugName: String
    let drugId: String
    let objective: QuestionObjective
    let conceptBucket: ConceptBucket
    let difficulty: QuestionDifficulty
    let questionType: QuestionType
    let stage: DrugLearningStage
    let source: QuestionSource
    let isRemediation: Bool
    let isReview: Bool
    let isCapstone: Bool
    let isContrast: Bool
    let confusionGroup: String?
    let contrastPairGroup: String?
    let selectionReason: String
}

nonisolated struct SessionDiagnosticsReport: Sendable {
    let subsectionId: String
    let subsectionTitle: String
    let isMastery: Bool
    let isHardenedModule: Bool
    let totalQuestions: Int
    let focusDrugNames: [String]
    let reviewCount: Int
    let capstoneCount: Int
    let contrastCount: Int
    let remediationCount: Int
    let questionDiagnostics: [QuestionDiagnostic]
    let stageBreakdown: [DrugLearningStage: Int]
    let objectiveBreakdown: [QuestionObjective: Int]
    let difficultyBreakdown: [QuestionDifficulty: Int]
    let typeBreakdown: [QuestionType: Int]
    let sourceBreakdown: [QuestionSource: Int]

    func printSummary() {
        print("╔══════════════════════════════════════════════════════╗")
        print("║         ADAPTIVE SESSION DIAGNOSTICS                ║")
        print("╠══════════════════════════════════════════════════════╣")
        print("║ Subsection: \(subsectionTitle) (\(subsectionId))")
        print("║ Type: \(isMastery ? "Mastery/Boss" : "Lesson")")
        print("║ Hardened: \(isHardenedModule ? "YES" : "no")")
        print("║ Total Questions: \(totalQuestions)")
        print("║ Focus Drugs: \(focusDrugNames.joined(separator: ", "))")
        print("║ Review Qs: \(reviewCount) | Contrast: \(contrastCount) | Capstone: \(capstoneCount) | Remed: \(remediationCount)")
        print("╠══════════════════════════════════════════════════════╣")
        print("║ STAGE BREAKDOWN:")
        for stage in [DrugLearningStage.foundation, .indication, .safety, .practical, .advanced] {
            let count = stageBreakdown[stage] ?? 0
            if count > 0 { print("║   \(stage.label): \(count)") }
        }
        print("╠══════════════════════════════════════════════════════╣")
        print("║ DIFFICULTY BREAKDOWN:")
        for diff in [QuestionDifficulty.easy, .medium, .hard, .expert] {
            let count = difficultyBreakdown[diff] ?? 0
            if count > 0 { print("║   \(diff.label): \(count)") }
        }
        print("╠══════════════════════════════════════════════════════╣")
        print("║ OBJECTIVE BREAKDOWN:")
        for (obj, count) in objectiveBreakdown.sorted(by: { $0.value > $1.value }) {
            print("║   \(obj.rawValue): \(count)")
        }
        print("╠══════════════════════════════════════════════════════╣")
        print("║ TYPE BREAKDOWN:")
        for (type, count) in typeBreakdown.sorted(by: { $0.value > $1.value }) {
            print("║   \(type.rawValue): \(count)")
        }
        print("╠══════════════════════════════════════════════════════╣")
        print("║ SOURCE BREAKDOWN:")
        for (src, count) in sourceBreakdown.sorted(by: { $0.value > $1.value }) {
            print("║   \(src.rawValue): \(count)")
        }
        print("╠══════════════════════════════════════════════════════╣")
        print("║ QUESTION PLAN:")
        for diag in questionDiagnostics {
            var flags: [String] = []
            if diag.isRemediation { flags.append("REMED") }
            if diag.isReview { flags.append("REVIEW") }
            if diag.isCapstone { flags.append("CAPSTONE") }
            if diag.isContrast { flags.append("CONTRAST") }
            let flagStr = flags.isEmpty ? "" : " [\(flags.joined(separator: ","))]"
            print("║  #\(String(format: "%02d", diag.index + 1)) \(diag.drugName) | \(diag.objective.rawValue) | \(diag.difficulty.label) | \(diag.questionType.rawValue) | \(diag.stage.label) | \(diag.source.rawValue)\(flagStr)")
            if let cg = diag.confusionGroup {
                print("║       confusionGroup: \(cg)")
            }
            if let cpg = diag.contrastPairGroup {
                print("║       contrastPair: \(cpg)")
            }
            print("║       → \(diag.selectionReason)")
        }
        print("╚══════════════════════════════════════════════════════╝")
    }
}

struct SessionDiagnosticsBuilder {
    private let dataService = DrugDataService.shared

    func buildReport(
        questions: [Question],
        subsectionId: String,
        isMastery: Bool,
        remediationQuestionIds: Set<String>,
        masteryMap: [String: MasteryRecord]
    ) -> SessionDiagnosticsReport {
        let subsection = dataService.subsection(for: subsectionId)
        let subsectionTitle = subsection?.title ?? subsectionId
        let subsectionDrugs = subsection?.drugs ?? []
        let subsectionDrugIds = Set(subsectionDrugs.map(\.id))
        let hardened = SessionPolishEngine.isHardenedModule(subsectionId)

        var allDrugs = subsectionDrugs
        let otherDrugIds = Set(questions.flatMap(\.relatedDrugIds)).subtracting(subsectionDrugIds)
        for otherId in otherDrugIds {
            if let d = findDrug(id: otherId) { allDrugs.append(d) }
        }
        let drugLookup = Dictionary(allDrugs.map { ($0.id, $0) }, uniquingKeysWith: { a, _ in a })

        let focusDrugs = inferFocusDrugs(subsectionDrugs: subsectionDrugs, masteryMap: masteryMap)
        let focusDrugIds = Set(focusDrugs.map(\.id))

        var questionDiags: [QuestionDiagnostic] = []
        var stageBreakdown: [DrugLearningStage: Int] = [:]
        var objectiveBreakdown: [QuestionObjective: Int] = [:]
        var difficultyBreakdown: [QuestionDifficulty: Int] = [:]
        var typeBreakdown: [QuestionType: Int] = [:]
        var sourceBreakdown: [QuestionSource: Int] = [:]
        var reviewCount = 0
        var capstoneCount = 0
        var contrastCount = 0
        var remediationCount = 0

        for (i, q) in questions.enumerated() {
            let drugId = q.relatedDrugIds.first ?? ""
            let drug = drugLookup[drugId]
            let drugName = drug?.genericName ?? (drugId.isEmpty ? "—" : drugId)
            let stage: DrugLearningStage = drugId.isEmpty ? .foundation : DrugMasteryService.learningStage(for: drugId, masteryMap: masteryMap)
            let bucket = ConceptBucket.bucket(for: q.objective)
            let isRemediation = remediationQuestionIds.contains(q.id)
            let isReview = !isMastery && q.subsectionId != subsectionId
            let isCap = SessionPolishEngine.isCapstoneCandidate(q)
            let isContrast = SessionPolishEngine.isContrastQuestion(q)
            let cg = SessionPolishEngine.primaryConfusionGroup(for: q)
            let cpg = SessionPolishEngine.contrastPairGroup(for: q)

            if isReview { reviewCount += 1 }
            if isCap { capstoneCount += 1 }
            if isContrast { contrastCount += 1 }
            if isRemediation { remediationCount += 1 }

            let reason = selectionReason(
                question: q,
                stage: stage,
                isRemediation: isRemediation,
                isReview: isReview,
                isCapstone: isCap,
                isContrast: isContrast,
                isFocusDrug: focusDrugIds.contains(drugId),
                isMastery: isMastery
            )

            questionDiags.append(QuestionDiagnostic(
                index: i,
                questionId: q.id,
                drugName: drugName,
                drugId: drugId,
                objective: q.objective,
                conceptBucket: bucket,
                difficulty: q.difficulty,
                questionType: q.type,
                stage: stage,
                source: q.source,
                isRemediation: isRemediation,
                isReview: isReview,
                isCapstone: isCap,
                isContrast: isContrast,
                confusionGroup: cg,
                contrastPairGroup: cpg,
                selectionReason: reason
            ))

            stageBreakdown[stage, default: 0] += 1
            objectiveBreakdown[q.objective, default: 0] += 1
            difficultyBreakdown[q.difficulty, default: 0] += 1
            typeBreakdown[q.type, default: 0] += 1
            sourceBreakdown[q.source, default: 0] += 1
        }

        let focusNames = focusDrugs.map(\.genericName)

        return SessionDiagnosticsReport(
            subsectionId: subsectionId,
            subsectionTitle: subsectionTitle,
            isMastery: isMastery,
            isHardenedModule: hardened,
            totalQuestions: questions.count,
            focusDrugNames: focusNames,
            reviewCount: reviewCount,
            capstoneCount: capstoneCount,
            contrastCount: contrastCount,
            remediationCount: remediationCount,
            questionDiagnostics: questionDiags,
            stageBreakdown: stageBreakdown,
            objectiveBreakdown: objectiveBreakdown,
            difficultyBreakdown: difficultyBreakdown,
            typeBreakdown: typeBreakdown,
            sourceBreakdown: sourceBreakdown
        )
    }

    private func inferFocusDrugs(subsectionDrugs: [Drug], masteryMap: [String: MasteryRecord]) -> [Drug] {
        guard !subsectionDrugs.isEmpty else { return [] }
        let ranked = subsectionDrugs.sorted { d1, d2 in
            let s1 = DrugMasteryService.learningStage(for: d1.id, masteryMap: masteryMap)
            let s2 = DrugMasteryService.learningStage(for: d2.id, masteryMap: masteryMap)
            if s1 != s2 { return s1 < s2 }
            let m1 = DrugMasteryService.computeMastery(for: d1.id, masteryMap: masteryMap)
            let m2 = DrugMasteryService.computeMastery(for: d2.id, masteryMap: masteryMap)
            return m1.accuracy < m2.accuracy
        }
        return Array(ranked.prefix(min(ranked.count, 4)))
    }

    private func findDrug(id: String) -> Drug? {
        for mod in dataService.modules {
            for sub in mod.subsections {
                if let drug = sub.drugs.first(where: { $0.id == id }) {
                    return drug
                }
            }
        }
        return nil
    }

    private func selectionReason(
        question: Question,
        stage: DrugLearningStage,
        isRemediation: Bool,
        isReview: Bool,
        isCapstone: Bool,
        isContrast: Bool,
        isFocusDrug: Bool,
        isMastery: Bool
    ) -> String {
        if isRemediation {
            return "Remediation: missed \(question.objective.rawValue) → easier follow-up"
        }
        if isCapstone {
            return "Earned capstone slot (\(question.difficulty.label) \(question.objective.rawValue))"
        }
        if isReview {
            return "Spaced review from \(question.subsectionId)"
        }
        if isMastery {
            return "Mastery/boss review pool (\(question.difficulty.label) \(question.objective.rawValue))"
        }
        if isContrast {
            return "Contrast/differentiator @ \(stage.label) → \(question.objective.rawValue)"
        }
        if isFocusDrug {
            return "Focus drug @ \(stage.label) → \(question.objective.rawValue) (\(question.difficulty.label))"
        }
        return "Subsection pool fill: \(question.objective.rawValue) (\(question.difficulty.label))"
    }
}

#endif
