import Foundation

nonisolated enum ConceptBucket: String, Sendable, CaseIterable {
    case classPattern
    case indication
    case sideEffect
    case blackBoxContraindication
    case pearlDifferentiator
    case dosing

    var label: String {
        switch self {
        case .classPattern: "Class Pattern"
        case .indication: "Indications"
        case .sideEffect: "Side Effects"
        case .blackBoxContraindication: "Black Box / Safety"
        case .pearlDifferentiator: "Pearls"
        case .dosing: "Dosing"
        }
    }

    var objectiveMapping: QuestionObjective {
        switch self {
        case .classPattern: .suffixId
        case .indication: .indication
        case .sideEffect: .adverseEffect
        case .blackBoxContraindication: .contraindication
        case .pearlDifferentiator: .pearl
        case .dosing: .dosing
        }
    }
}

struct HighYieldQuestionFactory {
    static let shared = HighYieldQuestionFactory()
    private let dataService = DrugDataService.shared

    struct BucketedQuestions: Sendable {
        var classPattern: [Question] = []
        var indication: [Question] = []
        var sideEffect: [Question] = []
        var blackBoxContraindication: [Question] = []
        var pearlDifferentiator: [Question] = []
        var dosing: [Question] = []

        func all() -> [Question] {
            classPattern + indication + sideEffect + blackBoxContraindication + pearlDifferentiator + dosing
        }

        func forBucket(_ bucket: ConceptBucket) -> [Question] {
            switch bucket {
            case .classPattern: classPattern
            case .indication: indication
            case .sideEffect: sideEffect
            case .blackBoxContraindication: blackBoxContraindication
            case .pearlDifferentiator: pearlDifferentiator
            case .dosing: dosing
            }
        }
    }

    func generateBucketed(for subsection: Subsection) -> BucketedQuestions {
        let drugs = subsection.drugs
        guard !drugs.isEmpty else { return BucketedQuestions() }
        let sid = subsection.id
        let moduleDrugs = allDrugsInModule(for: subsection.moduleId)
        let sameClassMap = Dictionary(grouping: moduleDrugs, by: \.drugClass)

        var result = BucketedQuestions()

        for drug in drugs {
            result.classPattern.append(contentsOf: classPatternQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            result.indication.append(contentsOf: indicationQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            result.sideEffect.append(contentsOf: sideEffectQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs, sameClassMap: sameClassMap))
            result.blackBoxContraindication.append(contentsOf: blackBoxQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            result.pearlDifferentiator.append(contentsOf: pearlQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs, sameClassMap: sameClassMap))
            result.dosing.append(contentsOf: dosingQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
        }

        result.classPattern.append(contentsOf: matchingBrandGenericAllDrugs(drugs: drugs, sid: sid))
        result.classPattern.append(contentsOf: matchingDrugClassQuestions(drugs: drugs, sid: sid))
        result.dosing.append(contentsOf: matchingDrugDoseQuestions(drugs: drugs, sid: sid))
        result.classPattern.append(contentsOf: selectAllClassQuestions(drugs: drugs, sid: sid, allDrugs: moduleDrugs))
        result.blackBoxContraindication.append(contentsOf: selectAllPregnancyQuestions(drugs: drugs, sid: sid))

        return result
    }

    private func allDrugsInModule(for moduleId: String) -> [Drug] {
        guard let module = dataService.module(for: moduleId) else { return [] }
        return module.subsections.flatMap(\.drugs)
    }

    private func filterTrialContent(_ text: String) -> Bool {
        let trialKeywords = ["trial", "study showed", "HOPE", "RALES", "EPHESUS", "PARADIGM", "ALLHAT",
                             "EMPA-REG", "DAPA-HF", "DAPA-CKD", "REDUCE-IT", "LEADER", "ODYSSEY",
                             "A-HeFT", "which trial", "landmark"]
        return !trialKeywords.contains(where: { text.localizedCaseInsensitiveContains($0) })
    }

    // MARK: - Class Pattern Templates

    private func classPatternQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard !drug.suffix.isEmpty else { return [] }
        var qs: [Question] = []
        let commonSuffixes = ["-pril", "-sartan", "-olol", "-statin", "-dipine", "-semide", "-thiazide", "-gliptin", "-flozin", "-prazole", "-tidine", "-setron", "-oxetine", "-azepam", "-xaban", "-glutide", "-gliflozin", "-floxacin", "-cycline"]
        let otherSuffixes = Array(Set(allDrugs.compactMap { $0.suffix.isEmpty ? nil : $0.suffix }).subtracting([drug.suffix]))
        let pool = Array(Set(otherSuffixes + commonSuffixes).subtracting([drug.suffix]))

        let d3 = Array(pool.shuffledStable(seed: drug.id + "hy_sfx1").prefix(3))
        if d3.count >= 2 {
            let opts = (d3 + [drug.suffix]).shuffledStable(seed: drug.id + "hy_sfx1o")
            qs.append(.multipleChoice(
                id: "hy_\(sid)_\(drug.id)_sfx_mc1",
                subsectionId: sid, difficulty: .easy,
                question: "Which suffix identifies \(drug.genericName)'s drug class?",
                options: opts, answer: drug.suffix,
                explanation: "Rule: The suffix \(drug.suffix) = \(drug.drugClass).\nWhy: Suffixes are the fastest way to classify any unfamiliar drug.",
                objective: .suffixId, relatedDrugIds: [drug.id], tags: [drug.drugClass, drug.suffix], source: .generated
            ))
        }

        qs.append(.trueFalse(
            id: "hy_\(sid)_\(drug.id)_sfx_tf1",
            subsectionId: sid, difficulty: .easy,
            question: "\(drug.genericName) (\(drug.brandName)) is a \(drug.drugClass) identified by the suffix \(drug.suffix).",
            answer: true,
            explanation: "Rule: \(drug.suffix) = \(drug.drugClass).\nWhy: All drugs ending in \(drug.suffix) share the same mechanism of action.",
            objective: .suffixId, relatedDrugIds: [drug.id], tags: [drug.suffix], source: .generated
        ))

        let otherClasses = Array(Set(allDrugs.map(\.drugClass)).subtracting([drug.drugClass]))
        if otherClasses.count >= 2 {
            let clsDist = Array(otherClasses.shuffledStable(seed: drug.id + "hy_cls1").prefix(3))
            let clsOpts = (clsDist + [drug.drugClass]).shuffledStable(seed: drug.id + "hy_cls1o")
            qs.append(.multipleChoice(
                id: "hy_\(sid)_\(drug.id)_cls_mc1",
                subsectionId: sid, difficulty: .easy,
                question: "\(drug.genericName) belongs to which drug class?",
                options: clsOpts, answer: drug.drugClass,
                explanation: "Rule: \(drug.genericName) is a \(drug.drugClass) (suffix \(drug.suffix)).\nWhy: Recognizing the class tells you the mechanism, shared side effects, and indications.",
                objective: .classId, relatedDrugIds: [drug.id], tags: [drug.drugClass], source: .generated
            ))
        }

        if !otherClasses.isEmpty {
            let wrongClass = otherClasses.shuffledStable(seed: drug.id + "hy_fctf").first!
            qs.append(.trueFalse(
                id: "hy_\(sid)_\(drug.id)_cls_tf2",
                subsectionId: sid, difficulty: .easy,
                question: "\(drug.genericName) (\(drug.brandName)) is a \(wrongClass).",
                answer: false,
                explanation: "Rule: \(drug.genericName) is a \(drug.drugClass), not a \(wrongClass).\nWhy: The suffix \(drug.suffix) identifies \(drug.drugClass) drugs.",
                objective: .classId, relatedDrugIds: [drug.id], tags: [drug.drugClass], source: .generated
            ))
        }

        let sameClassDrugs = allDrugs.filter { $0.drugClass == drug.drugClass && $0.id != drug.id && !$0.suffix.isEmpty }
        let diffClassDrugs = allDrugs.filter { $0.drugClass != drug.drugClass && !$0.suffix.isEmpty }
        if !diffClassDrugs.isEmpty && !sameClassDrugs.isEmpty {
            let outlier = diffClassDrugs.shuffledStable(seed: drug.id + "hy_outl").first!
            let mates = Array(sameClassDrugs.shuffledStable(seed: drug.id + "hy_outl2").prefix(2))
            let allNames = (mates.map(\.genericName) + [drug.genericName, outlier.genericName]).shuffledStable(seed: drug.id + "hy_outlo")
            if allNames.count >= 4 {
                qs.append(.multipleChoice(
                    id: "hy_\(sid)_\(drug.id)_outlier",
                    subsectionId: sid, difficulty: .medium,
                    question: "Which drug does NOT belong to the \(drug.drugClass) class?",
                    options: allNames, answer: outlier.genericName,
                    explanation: "Rule: \(outlier.genericName) is a \(outlier.drugClass), not a \(drug.drugClass).\nWhy: The other options all share the \(drug.suffix) suffix.",
                    objective: .classId, relatedDrugIds: [drug.id, outlier.id], tags: [drug.drugClass], source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - Indication Templates

    private func indicationQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard let primary = drug.indications.first else { return [] }
        var qs: [Question] = []

        let otherInds = Array(Set(allDrugs.flatMap(\.indications)).subtracting(drug.indications))
        let d3 = Array(otherInds.shuffledStable(seed: drug.id + "hy_ind1").prefix(3))
        if d3.count >= 2 {
            let opts = (d3 + [primary]).shuffledStable(seed: drug.id + "hy_ind1o")
            qs.append(.multipleChoice(
                id: "hy_\(sid)_\(drug.id)_ind_mc1",
                subsectionId: sid, difficulty: .medium,
                question: "What is a primary indication for \(drug.genericName)?",
                options: opts, answer: primary,
                explanation: "Rule: \(drug.genericName) is indicated for \(primary).\nWhy: \(drug.drugClass) drugs are first-line for \(primary).",
                objective: .indication, relatedDrugIds: [drug.id], tags: drug.indications, source: .generated
            ))
        }

        if d3.count >= 2 {
            let fb = (d3.prefix(3) + [primary]).shuffledStable(seed: drug.id + "hy_ind_fb1")
            qs.append(.fillBlank(
                id: "hy_\(sid)_\(drug.id)_ind_fb1",
                subsectionId: sid, difficulty: .medium,
                question: "\(drug.genericName) (\(drug.brandName)) is primarily indicated for _____.",
                options: Array(fb), answer: primary,
                explanation: "Rule: \(drug.genericName) treats \(primary).\nWhy: Know each drug's primary indication for prescribing decisions.",
                objective: .indication, relatedDrugIds: [drug.id], tags: drug.indications, source: .generated
            ))
        }

        if drug.indications.count >= 2 {
            let vignetteMap = indicationVignettes()
            let secondInd = drug.indications[1]
            let stem = vignetteMap[secondInd] ?? "A patient needs treatment for \(secondInd)."
            let wrongDrugs = allDrugs.filter { $0.id != drug.id && !$0.indications.contains(secondInd) }
            let distLabels = Array(wrongDrugs.shuffledStable(seed: drug.id + "hy_vig1").prefix(3).map { "\($0.genericName) (\($0.brandName))" })
            if distLabels.count >= 2 {
                let correctLabel = "\(drug.genericName) (\(drug.brandName))"
                let opts = (distLabels + [correctLabel]).shuffledStable(seed: drug.id + "hy_vig1o")
                qs.append(.multipleChoice(
                    id: "hy_\(sid)_\(drug.id)_vig_mc1",
                    subsectionId: sid, difficulty: .hard,
                    question: "\(stem) Which medication is most appropriate?",
                    options: opts, answer: correctLabel,
                    explanation: "Rule: \(drug.genericName) is indicated for \(secondInd).\nWhy: Match the clinical scenario to the drug's approved indications.",
                    objective: .indication, relatedDrugIds: [drug.id], tags: [secondInd], source: .generated
                ))
            }
        }

        if drug.indications.count >= 2 {
            let wrongInds = Array(otherInds.shuffledStable(seed: drug.id + "hy_saind").prefix(2))
            if !wrongInds.isEmpty {
                let correct = Array(drug.indications.prefix(4))
                let allOpts = (correct + wrongInds).shuffledStable(seed: drug.id + "hy_saindo")
                qs.append(.selectAll(
                    id: "hy_\(sid)_\(drug.id)_sa_ind1",
                    subsectionId: sid, difficulty: .hard,
                    question: "Select ALL approved indications for \(drug.genericName):",
                    options: allOpts, correctAnswers: Set(correct),
                    explanation: "Rule: \(drug.genericName) is indicated for \(drug.indications.joined(separator: ", ")).\nWhy: Drugs often have multiple approved uses — know the full list.",
                    objective: .indication, relatedDrugIds: [drug.id], tags: drug.indications, source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - Side Effect Templates

    private func sideEffectQuestions(drug: Drug, sid: String, allDrugs: [Drug], sameClassMap: [String: [Drug]]) -> [Question] {
        guard let primarySE = drug.sideEffects.first else { return [] }
        var qs: [Question] = []

        let otherSEs = Set(allDrugs.filter { $0.drugClass != drug.drugClass }.flatMap(\.sideEffects)).subtracting(drug.sideEffects)
        let d3 = Array(Array(otherSEs).shuffledStable(seed: drug.id + "hy_se1").prefix(3))
        if d3.count >= 2 {
            let opts = (d3 + [primarySE]).shuffledStable(seed: drug.id + "hy_se1o")
            qs.append(.multipleChoice(
                id: "hy_\(sid)_\(drug.id)_se_mc1",
                subsectionId: sid, difficulty: .medium,
                question: "Which adverse effect is most commonly associated with \(drug.genericName)?",
                options: opts, answer: primarySE,
                explanation: "Rule: \(primarySE) is a hallmark side effect of \(drug.genericName).\nWhy: Recognizing characteristic side effects helps identify the causative drug.",
                objective: .adverseEffect, relatedDrugIds: [drug.id], tags: drug.sideEffects, source: .generated
            ))
        }

        if drug.sideEffects.count >= 2 {
            let secondSE = drug.sideEffects[1]
            let wrongSEs = Array(Array(otherSEs).shuffledStable(seed: drug.id + "hy_se_fb").prefix(3))
            if wrongSEs.count >= 2 {
                let fbOpts = (wrongSEs.prefix(3) + [secondSE]).shuffledStable(seed: drug.id + "hy_se_fbo")
                qs.append(.fillBlank(
                    id: "hy_\(sid)_\(drug.id)_se_fb1",
                    subsectionId: sid, difficulty: .medium,
                    question: "A patient on \(drug.genericName) reports a new symptom. The most likely adverse effect is _____.",
                    options: Array(fbOpts), answer: secondSE,
                    explanation: "Rule: \(drug.genericName) commonly causes \(drug.sideEffects.prefix(3).joined(separator: ", ")).\nWhy: Side effect recognition drives timely drug discontinuation or dose adjustment.",
                    objective: .adverseEffect, relatedDrugIds: [drug.id], tags: drug.sideEffects, source: .generated
                ))
            }
        }

        qs.append(.trueFalse(
            id: "hy_\(sid)_\(drug.id)_se_fc1",
            subsectionId: sid, difficulty: .medium,
            question: "\(drug.genericName) (\(drug.brandName)) is a \(drug.drugClass) that commonly causes \(primarySE).",
            answer: true,
            explanation: "Rule: \(primarySE) is a known side effect of \(drug.genericName).\nWhy: Associating drugs with their characteristic side effects is high-yield.",
            objective: .adverseEffect, relatedDrugIds: [drug.id], tags: drug.sideEffects, source: .generated
        ))

        if drug.sideEffects.count >= 2 {
            let wrongSE = Array(otherSEs).shuffledStable(seed: drug.id + "hy_se_fc2").first
            if let wrong = wrongSE {
                qs.append(.trueFalse(
                    id: "hy_\(sid)_\(drug.id)_se_fc2",
                    subsectionId: sid, difficulty: .medium,
                    question: "\(drug.genericName) (\(drug.brandName)) commonly causes \(wrong).",
                    answer: false,
                    explanation: "Rule: \(drug.genericName) causes \(drug.sideEffects.prefix(3).joined(separator: ", ")), not \(wrong).\nWhy: Distinguishing side effects between drug classes prevents misattribution.",
                    objective: .adverseEffect, relatedDrugIds: [drug.id], tags: drug.sideEffects, source: .generated
                ))
            }
        }

        let classmates = (sameClassMap[drug.drugClass] ?? []).filter { $0.id != drug.id }
        let uniqueSEs = drug.sideEffects.filter { se in
            !classmates.contains(where: { $0.sideEffects.contains(se) })
        }
        if let uniqueSE = uniqueSEs.first, !classmates.isEmpty {
            let classmateSpecific = Set(classmates.flatMap(\.sideEffects)).subtracting(drug.sideEffects)
            let distSE = Array(Array(classmateSpecific).shuffledStable(seed: drug.id + "hy_se_disc").prefix(3))
            if distSE.count >= 2 {
                let opts = (distSE + [uniqueSE]).shuffledStable(seed: drug.id + "hy_se_disco")
                qs.append(.multipleChoice(
                    id: "hy_\(sid)_\(drug.id)_se_disc1",
                    subsectionId: sid, difficulty: .hard,
                    question: "Among \(drug.drugClass) drugs, which side effect is most specific to \(drug.genericName)?",
                    options: opts, answer: uniqueSE,
                    explanation: "Rule: \(uniqueSE) is characteristic of \(drug.genericName), not other \(drug.drugClass) drugs.\nWhy: Within-class discrimination identifies which specific agent to suspect.",
                    objective: .adverseEffect, relatedDrugIds: [drug.id], tags: [drug.drugClass, uniqueSE], source: .generated
                ))
            }
        }

        if drug.sideEffects.count >= 2 {
            let wrongSEPool = Array(otherSEs)
            let wrong = Array(wrongSEPool.shuffledStable(seed: drug.id + "hy_sa_se").prefix(2))
            if !wrong.isEmpty {
                let correct = Array(drug.sideEffects.prefix(4))
                let allOpts = (correct + wrong).shuffledStable(seed: drug.id + "hy_sa_seo")
                qs.append(.selectAll(
                    id: "hy_\(sid)_\(drug.id)_sa_se1",
                    subsectionId: sid, difficulty: .hard,
                    question: "Select ALL recognized adverse effects of \(drug.genericName):",
                    options: allOpts, correctAnswers: Set(correct),
                    explanation: "Rule: \(drug.genericName) can cause \(drug.sideEffects.joined(separator: ", ")).\nWhy: Complete side effect knowledge is essential for patient counseling.",
                    objective: .adverseEffect, relatedDrugIds: [drug.id], tags: drug.sideEffects, source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - Black Box / Contraindication Templates

    private func blackBoxQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        var qs: [Question] = []

        for (idx, bbw) in drug.blackBoxWarnings.enumerated() {
            guard filterTrialContent(bbw) else { continue }

            qs.append(.trueFalse(
                id: "hy_\(sid)_\(drug.id)_bbw_tf\(idx)",
                subsectionId: sid, difficulty: .medium,
                question: "\(drug.genericName) (\(drug.brandName)) carries a Black Box Warning for: \(bbw).",
                answer: true,
                explanation: "Rule: \(drug.genericName) carries a Black Box Warning for this.\nWhy: Black Box Warnings represent the most serious FDA safety concerns.",
                objective: .contraindication, relatedDrugIds: [drug.id], tags: ["black_box"], source: .generated
            ))
        }

        if !drug.majorContraindications.isEmpty {
            let contrasList = drug.majorContraindications
            if contrasList.contains(where: { $0.lowercased().contains("pregnancy") }) {
                qs.append(.trueFalse(
                    id: "hy_\(sid)_\(drug.id)_preg_tf",
                    subsectionId: sid, difficulty: .medium,
                    question: "\(drug.genericName) is safe to use during pregnancy.",
                    answer: false,
                    explanation: "Rule: \(drug.genericName) is contraindicated in pregnancy.\nWhy: \(drug.drugClass) drugs cause fetal toxicity — this is a Black Box Warning.",
                    objective: .contraindication, relatedDrugIds: [drug.id], tags: ["pregnancy", "black_box"], source: .generated
                ))

                let safeDrugs = allDrugs.filter { !$0.majorContraindications.contains(where: { $0.lowercased().contains("pregnancy") }) && $0.id != drug.id }
                if safeDrugs.count >= 3 {
                    let correct = drug.genericName
                    let distractors = Array(safeDrugs.shuffledStable(seed: drug.id + "hy_preg_mc").prefix(3).map(\.genericName))
                    let shuffled = (distractors + [correct]).shuffledStable(seed: drug.id + "hy_preg_mco")

                    qs.append(.multipleChoice(
                        id: "hy_\(sid)_\(drug.id)_preg_mc",
                        subsectionId: sid, difficulty: .medium,
                        question: "Which of these drugs is contraindicated in pregnancy due to fetal toxicity?",
                        options: shuffled, answer: correct,
                        explanation: "Rule: \(drug.genericName) (\(drug.drugClass)) is contraindicated in pregnancy.\nWhy: All \(drug.drugClass) drugs carry a Black Box Warning for fetal toxicity.",
                        objective: .contraindication, relatedDrugIds: [drug.id], tags: ["pregnancy"], source: .generated
                    ))
                }
            }

            if contrasList.count >= 2 {
                let otherContras = Array(Set(allDrugs.flatMap(\.majorContraindications)).subtracting(Set(contrasList)))
                let wrong = Array(otherContras.shuffledStable(seed: drug.id + "hy_sa_contra").prefix(2))
                if !wrong.isEmpty {
                    let correct = Array(contrasList.prefix(4))
                    let allOpts = (correct + wrong).shuffledStable(seed: drug.id + "hy_sa_contrao")
                    qs.append(.selectAll(
                        id: "hy_\(sid)_\(drug.id)_sa_contra",
                        subsectionId: sid, difficulty: .expert,
                        question: "Select ALL major contraindications for \(drug.genericName):",
                        options: allOpts, correctAnswers: Set(correct),
                        explanation: "Rule: \(drug.genericName) is contraindicated in \(contrasList.joined(separator: ", ")).\nWhy: Prescribing despite contraindications can cause serious patient harm.",
                        objective: .contraindication, relatedDrugIds: [drug.id], tags: ["contraindication"], source: .generated
                    ))
                }
            }
        }

        return qs
    }

    // MARK: - Pearl / Differentiator Templates

    private func pearlQuestions(drug: Drug, sid: String, allDrugs: [Drug], sameClassMap: [String: [Drug]]) -> [Question] {
        var qs: [Question] = []

        let filteredPearls = drug.clinicalPearls.filter(filterTrialContent)
        for (idx, pearl) in filteredPearls.enumerated() {
            qs.append(.trueFalse(
                id: "hy_\(sid)_\(drug.id)_pearl_tf\(idx)",
                subsectionId: sid, difficulty: idx == 0 ? .medium : .hard,
                question: "\(drug.genericName) (\(drug.brandName)): \(pearl)",
                answer: true,
                explanation: "Rule: \(pearl)\nWhy: This is a high-yield clinical pearl for \(drug.genericName).",
                objective: .pearl, relatedDrugIds: [drug.id], tags: [drug.drugClass], source: .generated
            ))
        }

        let classmates = (sameClassMap[drug.drugClass] ?? []).filter { $0.id != drug.id }
        if !classmates.isEmpty {
            if let distinctPearl = filteredPearls.first {
                let otherNames = classmates.shuffledStable(seed: drug.id + "hy_diff1").prefix(3).map(\.genericName)
                if otherNames.count >= 2 {
                    let opts = (Array(otherNames) + [drug.genericName]).shuffledStable(seed: drug.id + "hy_diff1o")
                    qs.append(.multipleChoice(
                        id: "hy_\(sid)_\(drug.id)_diff_mc1",
                        subsectionId: sid, difficulty: .hard,
                        question: "Which \(drug.drugClass) drug is distinguished by: \(distinctPearl)?",
                        options: opts, answer: drug.genericName,
                        explanation: "Rule: \(distinctPearl) — this applies to \(drug.genericName).\nWhy: Differentiators within a class guide drug selection for specific patients.",
                        objective: .pearl, relatedDrugIds: [drug.id], tags: [drug.drugClass], source: .generated
                    ))
                }
            }

            if filteredPearls.count >= 2 {
                let wrongPearl = classmates.compactMap { $0.clinicalPearls.first(where: filterTrialContent) }
                    .shuffledStable(seed: drug.id + "hy_pearl_fc").first
                if let wp = wrongPearl {
                    qs.append(.trueFalse(
                        id: "hy_\(sid)_\(drug.id)_pearl_fc1",
                        subsectionId: sid, difficulty: .hard,
                        question: "\(drug.genericName) is distinguished by: \(wp)",
                        answer: false,
                        explanation: "Rule: \(filteredPearls[0]) is the distinguishing pearl for \(drug.genericName), not \(wp).\nWhy: Knowing drug-specific pearls prevents mix-ups within the same class.",
                        objective: .pearl, relatedDrugIds: [drug.id], tags: [drug.drugClass], source: .generated
                    ))
                }
            }
        }

        return qs
    }

    // MARK: - Dosing Templates

    private func dosingQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard !drug.commonDosing.isEmpty else { return [] }
        var qs: [Question] = []

        let startDose = drug.commonDosing.first(where: { $0.context.contains("start") })
        if let sd = startDose {
            let otherDoses = allDrugs.filter { $0.id != drug.id && !$0.commonDosing.isEmpty }
                .compactMap { $0.commonDosing.first(where: { $0.context.contains("start") })?.dose }
            let distractors = Array(Set(otherDoses).subtracting([sd.dose]))
                .shuffledStable(seed: drug.id + "hy_dose1").prefix(3)
            if distractors.count >= 2 {
                let opts = (Array(distractors) + [sd.dose]).shuffledStable(seed: drug.id + "hy_dose1o")
                qs.append(.multipleChoice(
                    id: "hy_\(sid)_\(drug.id)_dose_mc1",
                    subsectionId: sid, difficulty: .medium,
                    question: "What is the typical starting dose of \(drug.genericName) for HTN?",
                    options: opts, answer: sd.dose,
                    explanation: "Rule: \(drug.genericName) starts at \(sd.dose) for HTN.\nWhy: Knowing starting doses prevents under- or over-dosing at initiation.",
                    objective: .dosing, relatedDrugIds: [drug.id], tags: ["dosing", drug.drugClass], source: .generated
                ))

                let fbOpts = (Array(distractors.prefix(3)) + [sd.dose]).shuffledStable(seed: drug.id + "hy_dose_fb1")
                qs.append(.fillBlank(
                    id: "hy_\(sid)_\(drug.id)_dose_fb1",
                    subsectionId: sid, difficulty: .medium,
                    question: "The starting dose of \(drug.genericName) (\(drug.brandName)) for HTN is _____.",
                    options: Array(fbOpts), answer: sd.dose,
                    explanation: "Rule: Start \(drug.genericName) at \(sd.dose) for HTN.\nWhy: Accurate dosing recall is essential for safe prescribing.",
                    objective: .dosing, relatedDrugIds: [drug.id], tags: ["dosing"], source: .generated
                ))
            }
        }

        qs.append(.trueFalse(
            id: "hy_\(sid)_\(drug.id)_dose_fc1",
            subsectionId: sid, difficulty: .medium,
            question: "\(drug.genericName) (\(drug.brandName)): \(drug.commonDosing[0].context) is \(drug.commonDosing[0].dose).",
            answer: true,
            explanation: "Rule: \(drug.genericName) \(drug.commonDosing[0].context) = \(drug.commonDosing[0].dose).\nWhy: Know starting doses for commonly prescribed medications.",
            objective: .dosing, relatedDrugIds: [drug.id], tags: ["dosing"], source: .generated
        ))

        if drug.commonDosing.count >= 2 {
            let wrongDose = allDrugs.filter { $0.id != drug.id && !$0.commonDosing.isEmpty }
                .compactMap { $0.commonDosing.first?.dose }
                .shuffledStable(seed: drug.id + "hy_dose_fc2").first
            if let wd = wrongDose {
                qs.append(.trueFalse(
                    id: "hy_\(sid)_\(drug.id)_dose_fc2",
                    subsectionId: sid, difficulty: .medium,
                    question: "The typical starting dose of \(drug.genericName) for HTN is \(wd).",
                    answer: false,
                    explanation: "Rule: \(drug.genericName) starts at \(drug.commonDosing[0].dose), not \(wd).\nWhy: Confusing doses between drugs is a common prescribing error.",
                    objective: .dosing, relatedDrugIds: [drug.id], tags: ["dosing"], source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - Matching Questions (3 types only)

    private func matchingBrandGenericAllDrugs(drugs: [Drug], sid: String) -> [Question] {
        let eligible = drugs.filter { !$0.brandName.isEmpty }
        guard eligible.count >= 3 else { return [] }
        let pairs = eligible.map { MatchingPair(left: $0.genericName, right: $0.brandName) }
        var qs: [Question] = []
        qs.append(.matching(
            id: "hy_\(sid)_match_bg_all",
            subsectionId: sid, difficulty: .medium,
            question: "Match each generic name to its brand name:",
            pairs: pairs,
            explanation: "Rule: Brand-generic recall is essential for clinical practice.\nWhy: Prescriptions may use either name — you must recognize both.",
            objective: .genericBrand, relatedDrugIds: eligible.map(\.id), tags: ["brand", "generic"], source: .generated
        ))
        let reversePairs = eligible.map { MatchingPair(left: $0.brandName, right: $0.genericName) }
        qs.append(.matching(
            id: "hy_\(sid)_match_gb_all",
            subsectionId: sid, difficulty: .medium,
            question: "Match each brand name to its generic name:",
            pairs: reversePairs,
            explanation: "Rule: Brand-generic recall is essential for clinical practice.\nWhy: Charts and labels may show either name.",
            objective: .brandGeneric, relatedDrugIds: eligible.map(\.id), tags: ["brand", "generic"], source: .generated
        ))
        return qs
    }

    private func matchingDrugClassQuestions(drugs: [Drug], sid: String) -> [Question] {
        let groups = Dictionary(grouping: drugs, by: \.drugClass)
        guard groups.count >= 2 else { return [] }
        let selected = drugs.shuffledStable(seed: sid + "match_cls_all").prefix(min(7, drugs.count))
        let pairs = selected.map { MatchingPair(left: $0.genericName, right: $0.drugClass) }
        guard pairs.count >= 4 else { return [] }
        return [.matching(
            id: "hy_\(sid)_match_cls",
            subsectionId: sid, difficulty: .hard,
            question: "Match each drug to its drug class:",
            pairs: Array(pairs),
            explanation: "Rule: Drugs are grouped by class based on shared mechanism.\nWhy: Class identification predicts side effects and indications.",
            objective: .classId, relatedDrugIds: selected.map(\.id), tags: [], source: .generated
        )]
    }

    private func matchingDrugDoseQuestions(drugs: [Drug], sid: String) -> [Question] {
        let drugsWithDosing = drugs.filter { !$0.commonDosing.isEmpty }
        guard drugsWithDosing.count >= 3 else { return [] }
        var pairs: [MatchingPair] = []
        var usedDoses: Set<String> = []
        for d in drugsWithDosing {
            if let start = d.commonDosing.first(where: { $0.context.contains("start") && !usedDoses.contains($0.dose) }) {
                pairs.append(MatchingPair(left: d.genericName, right: start.dose))
                usedDoses.insert(start.dose)
            }
        }
        guard pairs.count >= 3 else { return [] }
        return [.matching(
            id: "hy_\(sid)_match_dose",
            subsectionId: sid, difficulty: .hard,
            question: "Match each drug to its starting dose for HTN:",
            pairs: pairs,
            explanation: "Rule: Each antihypertensive has a specific starting dose.\nWhy: Dose recall is essential for safe prescribing.",
            objective: .dosing, relatedDrugIds: pairs.compactMap { p in drugsWithDosing.first(where: { $0.genericName == p.left })?.id }, tags: ["dosing"], source: .generated
        )]
    }

    // MARK: - Extra Select-All Questions

    private func selectAllClassQuestions(drugs: [Drug], sid: String, allDrugs: [Drug]) -> [Question] {
        let groups = Dictionary(grouping: drugs, by: \.drugClass)
        var qs: [Question] = []
        for (cls, clsDrugs) in groups where clsDrugs.count >= 2 {
            let correctNames = clsDrugs.map(\.genericName)
            let wrongDrugs = drugs.filter { $0.drugClass != cls }
            let wrongNames = Array(wrongDrugs.map(\.genericName).shuffledStable(seed: sid + cls + "sa_cls").prefix(2))
            guard !wrongNames.isEmpty else { continue }
            let allOpts = (correctNames + wrongNames).shuffledStable(seed: sid + cls + "sa_clso")
            qs.append(.selectAll(
                id: "hy_\(sid)_sa_cls_\(cls.replacingOccurrences(of: " ", with: "_"))",
                subsectionId: sid, difficulty: .medium,
                question: "Select ALL drugs that are \(cls)s:",
                options: allOpts, correctAnswers: Set(correctNames),
                explanation: "Rule: \(correctNames.joined(separator: ", ")) are all \(cls)s.\nWhy: Grouping drugs by class predicts shared effects and indications.",
                objective: .classId, relatedDrugIds: clsDrugs.map(\.id), tags: [cls], source: .generated
            ))
        }
        return qs
    }

    private func selectAllPregnancyQuestions(drugs: [Drug], sid: String) -> [Question] {
        let unsafeDrugs = drugs.filter { $0.majorContraindications.contains(where: { $0.lowercased().contains("pregnancy") }) }
        let safeDrugs = drugs.filter { !$0.majorContraindications.contains(where: { $0.lowercased().contains("pregnancy") }) }
        guard unsafeDrugs.count >= 2 else { return [] }
        let correctNames = unsafeDrugs.prefix(5).map(\.genericName)
        var allOpts = Array(correctNames)
        if !safeDrugs.isEmpty {
            allOpts.append(contentsOf: safeDrugs.prefix(2).map(\.genericName))
        }
        allOpts = allOpts.shuffledStable(seed: sid + "sa_preg")
        return [.selectAll(
            id: "hy_\(sid)_sa_preg",
            subsectionId: sid, difficulty: .hard,
            question: "Select ALL drugs contraindicated in pregnancy:",
            options: allOpts, correctAnswers: Set(correctNames),
            explanation: "Rule: \(correctNames.joined(separator: ", ")) are all contraindicated in pregnancy.\nWhy: Teratogenicity is a critical safety concern.",
            objective: .contraindication, relatedDrugIds: unsafeDrugs.prefix(5).map(\.id), tags: ["pregnancy"], source: .generated
        )]
    }



    // MARK: - Vignette Stems

    private func indicationVignettes() -> [String: String] {
        [
            "HTN": "A 55-year-old with newly diagnosed hypertension needs pharmacotherapy.",
            "HF": "A patient with heart failure and reduced EF requires medication optimization.",
            "HFrEF": "A patient with symptomatic HFrEF (EF 30%) needs guideline-directed therapy.",
            "HF (HFrEF)": "A 62-year-old with HFrEF (EF 25%) is being started on additional therapy.",
            "Edema": "A hospitalized patient has significant lower extremity edema and fluid overload.",
            "Angina": "A patient with exertional chest pain diagnosed as stable angina needs prophylaxis.",
            "Post-MI": "A patient being discharged after MI needs secondary prevention.",
            "AFib": "A 72-year-old with new atrial fibrillation requires stroke prevention.",
            "DVT/PE": "A patient is diagnosed with acute DVT needing anticoagulation.",
            "Hyperlipidemia": "A patient with elevated LDL needs lipid-lowering therapy.",
            "Diabetic nephropathy": "A patient with T2DM and proteinuria needs renal-protective therapy.",
            "T2DM": "A 52-year-old with T2DM and A1c 7.8% needs therapy adjustment.",
            "Depression": "A patient with major depressive disorder needs first-line treatment.",
            "Stroke prevention": "A patient with a history of TIA requires secondary stroke prevention.",
            "Resistant HTN": "A patient's BP remains uncontrolled on three antihypertensives including a diuretic.",
        ]
    }
}
