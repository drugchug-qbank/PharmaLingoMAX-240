import Foundation

nonisolated enum ConceptBucket: String, Sendable, CaseIterable {
    case classPattern
    case indication
    case sideEffect
    case blackBoxContraindication
    case pearlDifferentiator
    
    var label: String {
        switch self {
        case .classPattern: "Class Pattern"
        case .indication: "Indications"
        case .sideEffect: "Side Effects"
        case .blackBoxContraindication: "Black Box / Safety"
        case .pearlDifferentiator: "Pearls"
        }
    }
    
    var objectiveMapping: QuestionObjective {
        switch self {
        case .classPattern: .suffixId
        case .indication: .indication
        case .sideEffect: .adverseEffect
        case .blackBoxContraindication: .contraindication
        case .pearlDifferentiator: .pearl
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

        func all() -> [Question] {
            classPattern + indication + sideEffect + blackBoxContraindication + pearlDifferentiator
        }

        func forBucket(_ bucket: ConceptBucket) -> [Question] {
            switch bucket {
            case .classPattern: classPattern
            case .indication: indication
            case .sideEffect: sideEffect
            case .blackBoxContraindication: blackBoxContraindication
            case .pearlDifferentiator: pearlDifferentiator
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
        }

        result.indication.append(contentsOf: matchingIndicationQuestions(drugs: drugs, sid: sid))
        result.classPattern.append(contentsOf: matchingClassQuestions(drugs: drugs, sid: sid))

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
            question: "The suffix \(drug.suffix) identifies \(drug.drugClass) drugs.",
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

        if d3.count >= 2 {
            let wrongSuffix = d3[0]
            qs.append(.trueFalse(
                id: "hy_\(sid)_\(drug.id)_sfx_tf2",
                subsectionId: sid, difficulty: .easy,
                question: "\(drug.genericName) ends in \(wrongSuffix) because it is a \(drug.drugClass).",
                answer: false,
                explanation: "Rule: \(drug.genericName) ends in \(drug.suffix), not \(wrongSuffix).\nWhy: \(drug.suffix) identifies \(drug.drugClass) drugs.",
                objective: .suffixId, relatedDrugIds: [drug.id], tags: [drug.suffix], source: .generated
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
                question: "\(drug.genericName) has a Black Box Warning: \(bbw)",
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
                let unsafeDrugs = allDrugs.filter { $0.majorContraindications.contains(where: { $0.lowercased().contains("pregnancy") }) && $0.id != drug.id }
                if !safeDrugs.isEmpty && !unsafeDrugs.isEmpty {
                    let correct = drug.genericName
                    let safeDrug = safeDrugs.shuffledStable(seed: drug.id + "hy_preg_mc").first!
                    let unsafeMate = unsafeDrugs.shuffledStable(seed: drug.id + "hy_preg_mc2").first!
                    let otherDist = allDrugs.filter { $0.id != drug.id && $0.id != safeDrug.id && $0.id != unsafeMate.id }
                        .shuffledStable(seed: drug.id + "hy_preg_mc3").first
                    var opts = [correct, safeDrug.genericName, unsafeMate.genericName]
                    if let extra = otherDist { opts.append(extra.genericName) }
                    let shuffled = opts.shuffledStable(seed: drug.id + "hy_preg_mco")

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

        for (idx, pearl) in drug.clinicalPearls.enumerated() {
            guard filterTrialContent(pearl) else { continue }

            qs.append(.trueFalse(
                id: "hy_\(sid)_\(drug.id)_pearl_tf\(idx)",
                subsectionId: sid, difficulty: idx == 0 ? .medium : .hard,
                question: "\(drug.genericName): \(pearl)",
                answer: true,
                explanation: "Rule: \(pearl)\nWhy: This is a high-yield clinical pearl for \(drug.genericName).",
                objective: .pearl, relatedDrugIds: [drug.id], tags: [drug.drugClass], source: .generated
            ))
        }

        let classmates = (sameClassMap[drug.drugClass] ?? []).filter { $0.id != drug.id }
        if !classmates.isEmpty {
            let filteredPearls = drug.clinicalPearls.filter(filterTrialContent)
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
        }

        return qs
    }

    // MARK: - Matching Questions

    private func matchingIndicationQuestions(drugs: [Drug], sid: String) -> [Question] {
        guard drugs.count >= 3 else { return [] }
        let pairs = drugs.prefix(4).compactMap { d -> MatchingPair? in
            guard let ind = d.indications.first else { return nil }
            return MatchingPair(left: d.genericName, right: ind)
        }
        guard pairs.count >= 3 else { return [] }
        return [.matching(
            id: "hy_\(sid)_match_ind",
            subsectionId: sid, difficulty: .expert,
            question: "Match each drug to its primary indication:",
            pairs: Array(pairs.prefix(4)),
            explanation: "Rule: Each drug has a primary approved indication.\nWhy: Rapid drug-to-indication recall is tested heavily on licensing exams.",
            objective: .indication, relatedDrugIds: drugs.prefix(4).map(\.id), tags: [], source: .generated
        )]
    }

    private func matchingClassQuestions(drugs: [Drug], sid: String) -> [Question] {
        let groups = Dictionary(grouping: drugs, by: \.drugClass)
        guard groups.count >= 2 else { return [] }
        var pairs: [MatchingPair] = []
        for (cls, clsDrugs) in groups {
            if let first = clsDrugs.first {
                pairs.append(MatchingPair(left: first.genericName, right: cls))
            }
        }
        guard pairs.count >= 2 else { return [] }
        return [.matching(
            id: "hy_\(sid)_match_cls",
            subsectionId: sid, difficulty: .hard,
            question: "Match each drug to its drug class:",
            pairs: Array(pairs.prefix(4)),
            explanation: "Rule: Drugs are grouped by class based on shared mechanism.\nWhy: Class identification predicts side effects and indications.",
            objective: .classId, relatedDrugIds: drugs.map(\.id), tags: [], source: .generated
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
