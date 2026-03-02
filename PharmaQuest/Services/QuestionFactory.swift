import Foundation

struct QuestionFactory {
    static let shared = QuestionFactory()
    private let dataService = DrugDataService.shared

    func generateQuestions(for subsection: Subsection) -> [Question] {
        let drugs = subsection.drugs
        guard !drugs.isEmpty else { return [] }

        var questions: [Question] = []
        let sid = subsection.id

        let moduleDrugs = allDrugsInModule(for: subsection.moduleId)
        let sameClassMap = Dictionary(grouping: moduleDrugs, by: \.drugClass)

        for drug in drugs {
            questions.append(contentsOf: generateGenericToBrand(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateBrandToGeneric(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateClassId(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateSuffixQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateIndicationQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateIndicationVignettes(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateSideEffectQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs, sameClassMap: sameClassMap))
            questions.append(contentsOf: generateAdverseEffectDiscrimination(drug: drug, sid: sid, sameClassMap: sameClassMap))
            questions.append(contentsOf: generateSelectAllIndications(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateSelectAllAdverseEffects(drug: drug, sid: sid, allDrugs: moduleDrugs, sameClassMap: sameClassMap))
            questions.append(contentsOf: generatePearlQuestions(drug: drug, sid: sid))
        }

        questions.append(contentsOf: generateMatchingQuestions(drugs: drugs, sid: sid))

        return questions
    }

    private func allDrugsInModule(for moduleId: String) -> [Drug] {
        guard let module = dataService.module(for: moduleId) else { return [] }
        return module.subsections.flatMap(\.drugs)
    }

    // MARK: - A) Generic -> Brand

    private func generateGenericToBrand(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        var qs: [Question] = []
        let distractors = pickDistractorBrands(excluding: drug, from: allDrugs, count: 3)
        guard distractors.count >= 2 else { return qs }

        let opts = (distractors + [drug.brandName]).shuffledStable(seed: drug.id + "g2b_mc")
        qs.append(.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_g2b_mc",
            subsectionId: sid,
            difficulty: .medium,
            question: "What is the brand name of \(drug.genericName)?",
            options: opts,
            answer: drug.brandName,
            explanation: "\(drug.genericName) is sold under the brand name \(drug.brandName). Key takeaway: Memorize brand-generic pairs for the top drugs in each class.",
            objective: .genericBrand,
            relatedDrugIds: [drug.id],
            tags: [drug.drugClass],
            source: .generated
        ))

        let fillOpts = (distractors.prefix(3) + [drug.brandName]).shuffledStable(seed: drug.id + "g2b_fb")
        qs.append(.fillBlank(
            id: "gen_\(sid)_\(drug.id)_g2b_fb",
            subsectionId: sid,
            difficulty: .easy,
            question: "The brand name of \(drug.genericName) is _____.",
            options: Array(fillOpts),
            answer: drug.brandName,
            explanation: "\(drug.genericName) is marketed as \(drug.brandName). Key takeaway: Knowing both names helps you identify the same drug across prescriptions and references.",
            objective: .genericBrand,
            relatedDrugIds: [drug.id],
            tags: [drug.drugClass],
            source: .generated
        ))

        return qs
    }

    // MARK: - B) Brand -> Generic

    private func generateBrandToGeneric(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        let distractors = pickDistractorGenerics(excluding: drug, from: allDrugs, count: 3)
        guard distractors.count >= 2 else { return [] }

        let opts = (distractors + [drug.genericName]).shuffledStable(seed: drug.id + "b2g")
        return [.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_b2g_mc",
            subsectionId: sid,
            difficulty: .medium,
            question: "What is the generic name for \(drug.brandName)?",
            options: opts,
            answer: drug.genericName,
            explanation: "\(drug.brandName) is the brand name for \(drug.genericName). Key takeaway: Generic names are universal; brand names vary by manufacturer and country.",
            objective: .brandGeneric,
            relatedDrugIds: [drug.id],
            tags: [drug.drugClass],
            source: .generated
        )]
    }

    // MARK: - C) Drug -> Class

    private func generateClassId(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        let otherClasses = Array(Set(allDrugs.map(\.drugClass)).subtracting([drug.drugClass]))
        guard otherClasses.count >= 2 else { return [] }

        let distractors = Array(otherClasses.shuffledStable(seed: drug.id + "cls").prefix(3))
        let opts = (distractors + [drug.drugClass]).shuffledStable(seed: drug.id + "cls_o")

        return [.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_cls_mc",
            subsectionId: sid,
            difficulty: .medium,
            question: "\(drug.genericName) (\(drug.brandName)) belongs to which drug class?",
            options: opts,
            answer: drug.drugClass,
            explanation: "\(drug.genericName) is classified as a \(drug.drugClass). Key takeaway: Drug class determines mechanism, shared side effects, and therapeutic overlap with other class members.",
            objective: .classId,
            relatedDrugIds: [drug.id],
            tags: [drug.drugClass],
            source: .generated
        )]
    }

    // MARK: - D) Suffix Recognition

    private func generateSuffixQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard !drug.suffix.isEmpty else { return [] }
        var qs: [Question] = []

        let otherSuffixes = Array(Set(allDrugs.compactMap { $0.suffix.isEmpty ? nil : $0.suffix }).subtracting([drug.suffix]))
        let commonSuffixes = ["-pril", "-sartan", "-olol", "-statin", "-dipine", "-semide", "-thiazide", "-gliptin", "-flozin", "-prazole", "-tidine", "-setron", "-oxetine", "-azepam"]
        let pool = Array(Set(otherSuffixes + commonSuffixes).subtracting([drug.suffix]))
        let distractors = Array(pool.shuffledStable(seed: drug.id + "sfx").prefix(3))
        guard distractors.count >= 2 else { return qs }

        let opts = (distractors + [drug.suffix]).shuffledStable(seed: drug.id + "sfx_o")
        qs.append(.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_sfx_mc",
            subsectionId: sid,
            difficulty: .easy,
            question: "Which suffix identifies the drug class of \(drug.genericName)?",
            options: opts,
            answer: drug.suffix,
            explanation: "The suffix \(drug.suffix) identifies \(drug.drugClass) drugs like \(drug.genericName). Key takeaway: Suffixes are the fastest way to identify a drug's class on sight.",
            objective: .suffixId,
            relatedDrugIds: [drug.id],
            tags: [drug.drugClass, drug.suffix],
            source: .generated
        ))

        qs.append(.trueFalse(
            id: "gen_\(sid)_\(drug.id)_sfx_tf",
            subsectionId: sid,
            difficulty: .easy,
            question: "\(drug.genericName) ends in \(drug.suffix) because it is a \(drug.drugClass).",
            answer: true,
            explanation: "The \(drug.suffix) suffix correctly identifies \(drug.genericName) as a \(drug.drugClass). Key takeaway: Learning suffixes lets you classify unfamiliar drugs you encounter in practice.",
            objective: .suffixId,
            relatedDrugIds: [drug.id],
            tags: [drug.suffix],
            source: .generated
        ))

        return qs
    }

    // MARK: - E) Indication Recognition (basic MC)

    private func generateIndicationQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard let primaryIndication = drug.indications.first else { return [] }

        let otherIndications = Array(Set(allDrugs.flatMap(\.indications)).subtracting(drug.indications))
        let distractors = Array(otherIndications.shuffledStable(seed: drug.id + "ind").prefix(3))
        guard distractors.count >= 2 else { return [] }

        let opts = (distractors + [primaryIndication]).shuffledStable(seed: drug.id + "ind_o")
        return [.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_ind_mc",
            subsectionId: sid,
            difficulty: .medium,
            question: "Which of the following is a primary indication for \(drug.genericName) (\(drug.brandName))?",
            options: opts,
            answer: primaryIndication,
            explanation: "\(drug.genericName) is indicated for \(drug.indications.joined(separator: ", ")). Key takeaway: Knowing a drug's primary indication helps you quickly assess whether a prescription is appropriate.",
            objective: .indication,
            relatedDrugIds: [drug.id],
            tags: drug.indications,
            source: .generated
        )]
    }

    // MARK: - E2) Indication-Based Clinical Vignettes

    private func generateIndicationVignettes(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard !drug.indications.isEmpty else { return [] }
        var qs: [Question] = []

        let vignetteData = buildTightVignette(for: drug, allDrugs: allDrugs)

        if let vignette = vignetteData {
            let correctLabel = "\(drug.genericName) (\(drug.brandName))"
            let opts = (vignette.distractorLabels + [correctLabel]).shuffledStable(seed: drug.id + "vig1_o")

            qs.append(.multipleChoice(
                id: "gen_\(sid)_\(drug.id)_vig_ind",
                subsectionId: sid,
                difficulty: .hard,
                question: vignette.stem,
                options: opts,
                answer: correctLabel,
                explanation: "\(vignette.rationale) Key takeaway: \(vignette.takeaway)",
                objective: .indication,
                relatedDrugIds: [drug.id],
                tags: drug.indications + [drug.drugClass],
                source: .generated
            ))
        }

        if drug.indications.count >= 2 {
            let secondVignette = buildSecondaryVignette(for: drug, allDrugs: allDrugs)
            if let vignette = secondVignette {
                let correctLabel = "\(drug.genericName) (\(drug.brandName))"
                let opts = (vignette.distractorLabels + [correctLabel]).shuffledStable(seed: drug.id + "vig2_o")

                qs.append(.multipleChoice(
                    id: "gen_\(sid)_\(drug.id)_vig_ind2",
                    subsectionId: sid,
                    difficulty: .hard,
                    question: vignette.stem,
                    options: opts,
                    answer: correctLabel,
                    explanation: "\(vignette.rationale) Key takeaway: \(vignette.takeaway)",
                    objective: .indication,
                    relatedDrugIds: [drug.id],
                    tags: [drug.indications[1], drug.drugClass],
                    source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - F) Side Effect Recognition (same-class distractors)

    private func generateSideEffectQuestions(drug: Drug, sid: String, allDrugs: [Drug], sameClassMap: [String: [Drug]]) -> [Question] {
        guard let primarySE = drug.sideEffects.first else { return [] }

        let sameClassSEs = Set((sameClassMap[drug.drugClass] ?? []).filter { $0.id != drug.id }.flatMap(\.sideEffects))
        let otherClassSEs = Set(allDrugs.filter { $0.drugClass != drug.drugClass }.flatMap(\.sideEffects))
        let nonDrugSEs = otherClassSEs.subtracting(drug.sideEffects).subtracting(sameClassSEs)
        let distractors = Array(Array(nonDrugSEs).shuffledStable(seed: drug.id + "se").prefix(3))
        guard distractors.count >= 2 else { return [] }

        let opts = (distractors + [primarySE]).shuffledStable(seed: drug.id + "se_o")
        let sharedNote = sameClassSEs.intersection(drug.sideEffects).isEmpty ? "" : " Note that some side effects like \(sameClassSEs.intersection(drug.sideEffects).prefix(2).joined(separator: " and ")) are shared across the \(drug.drugClass) class."

        return [.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_se_mc",
            subsectionId: sid,
            difficulty: .medium,
            question: "Which adverse effect is most commonly associated with \(drug.genericName) (\(drug.brandName))?",
            options: opts,
            answer: primarySE,
            explanation: "Common adverse effects of \(drug.genericName) include \(drug.sideEffects.joined(separator: ", ")).\(sharedNote) Key takeaway: Recognizing characteristic side effects helps you identify the causative drug when patients report new symptoms.",
            objective: .adverseEffect,
            relatedDrugIds: [drug.id],
            tags: drug.sideEffects,
            source: .generated
        )]
    }

    // MARK: - F2) Adverse Effect Discrimination (same-class distractors)

    private func generateAdverseEffectDiscrimination(drug: Drug, sid: String, sameClassMap: [String: [Drug]]) -> [Question] {
        let classmates = (sameClassMap[drug.drugClass] ?? []).filter { $0.id != drug.id }
        guard !classmates.isEmpty else { return [] }
        var qs: [Question] = []

        let uniqueSEs = drug.sideEffects.filter { se in
            !classmates.contains(where: { $0.sideEffects.contains(se) })
        }

        if let uniqueSE = uniqueSEs.first {
            let classmateSpecificSEs = classmates.flatMap { mate in
                mate.sideEffects.filter { se in !drug.sideEffects.contains(se) }
            }
            let distractorPool = Array(Set(classmateSpecificSEs))
            let distractors = Array(distractorPool.shuffledStable(seed: drug.id + "aed1").prefix(3))
            guard distractors.count >= 2 else { return qs }

            let opts = (distractors + [uniqueSE]).shuffledStable(seed: drug.id + "aed1_o")
            qs.append(.multipleChoice(
                id: "gen_\(sid)_\(drug.id)_aed_unique",
                subsectionId: sid,
                difficulty: .hard,
                question: "Among the \(drug.drugClass) drugs, which adverse effect is more specifically associated with \(drug.genericName) rather than other drugs in this class?",
                options: opts,
                answer: uniqueSE,
                explanation: "While all \(drug.drugClass) drugs share some side effects, \(uniqueSE.lowercased()) is more characteristic of \(drug.genericName). Other \(drug.drugClass) drugs may instead cause \(distractors.prefix(2).joined(separator: " or ")). Key takeaway: Distinguishing drug-specific side effects within a class is crucial for identifying which agent to suspect or switch.",
                objective: .adverseEffect,
                relatedDrugIds: [drug.id],
                tags: [drug.drugClass, uniqueSE],
                source: .generated
            ))
        }

        if drug.sideEffects.count >= 2, let classmate = classmates.first {
            let drugSE = drug.sideEffects[0]
            let classmateSEs = classmate.sideEffects.filter { !drug.sideEffects.contains($0) }
            if let classmateSE = classmateSEs.first {
                qs.append(.trueFalse(
                    id: "gen_\(sid)_\(drug.id)_aed_tf",
                    subsectionId: sid,
                    difficulty: .medium,
                    question: "\(drugSE) is a recognized adverse effect of \(drug.genericName) (\(drug.brandName)), not \(classmate.genericName) (\(classmate.brandName)).",
                    answer: !classmate.sideEffects.contains(drugSE),
                    explanation: "\(drug.genericName) is associated with \(drug.sideEffects.joined(separator: ", ")). \(classmate.genericName) is associated with \(classmate.sideEffects.joined(separator: ", ")). Key takeaway: Even within the same drug class, individual agents can have distinct adverse effect profiles. \(classmateSE) is more specific to \(classmate.genericName).",
                    objective: .adverseEffect,
                    relatedDrugIds: [drug.id, classmate.id],
                    tags: [drug.drugClass],
                    source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - F3) Select All Indications

    private func generateSelectAllIndications(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard drug.indications.count >= 2 else { return [] }
        var qs: [Question] = []

        let otherIndications = Array(Set(allDrugs.flatMap(\.indications)).subtracting(drug.indications))

        let wrongCount = min(drug.indications.count >= 3 ? 2 : 1, otherIndications.count)
        guard wrongCount > 0 else { return qs }
        let wrongOptions = Array(otherIndications.shuffledStable(seed: drug.id + "sa_ind").prefix(wrongCount))

        let correctItems = Array(drug.indications.prefix(4))
        let correctSet = Set(correctItems)
        let allOpts = (correctItems + wrongOptions).shuffledStable(seed: drug.id + "sa_ind_o")

        qs.append(.selectAll(
            id: "gen_\(sid)_\(drug.id)_sa_ind",
            subsectionId: sid,
            difficulty: .hard,
            question: "Select ALL approved indications for \(drug.genericName) (\(drug.brandName)):",
            options: allOpts,
            correctAnswers: correctSet,
            explanation: "\(drug.genericName) is indicated for \(drug.indications.joined(separator: ", ")). The incorrect option(s) — \(wrongOptions.joined(separator: ", ")) — are not approved indications for this drug. Key takeaway: Drugs often have multiple indications; learn the full list to avoid overlooking therapeutic opportunities.",
            objective: .indication,
            relatedDrugIds: [drug.id],
            tags: drug.indications,
            source: .generated
        ))

        if drug.indications.count >= 3 {
            let subsetCorrect = Array(drug.indications.suffix(from: 1).prefix(3))
            let subsetWrong = Array(otherIndications.shuffledStable(seed: drug.id + "sa_ind2").prefix(2))
            guard !subsetWrong.isEmpty else { return qs }
            let subsetOpts = (subsetCorrect + subsetWrong).shuffledStable(seed: drug.id + "sa_ind2_o")

            qs.append(.selectAll(
                id: "gen_\(sid)_\(drug.id)_sa_ind2",
                subsectionId: sid,
                difficulty: .expert,
                question: "A patient is prescribed \(drug.brandName). Select ALL conditions this medication can be used to treat:",
                options: subsetOpts,
                correctAnswers: Set(subsetCorrect),
                explanation: "\(drug.brandName) (\(drug.genericName)) treats: \(drug.indications.joined(separator: ", ")). Key takeaway: When reviewing a medication list, verify each drug addresses at least one of the patient's active diagnoses.",
                objective: .indication,
                relatedDrugIds: [drug.id],
                tags: drug.indications,
                source: .generated
            ))
        }

        return qs
    }

    // MARK: - F4) Select All Adverse Effects

    private func generateSelectAllAdverseEffects(drug: Drug, sid: String, allDrugs: [Drug], sameClassMap: [String: [Drug]]) -> [Question] {
        guard drug.sideEffects.count >= 2 else { return [] }
        var qs: [Question] = []

        let classmateOnlySEs = Set((sameClassMap[drug.drugClass] ?? [])
            .filter { $0.id != drug.id }
            .flatMap(\.sideEffects))
            .subtracting(drug.sideEffects)
        let otherClassSEs = Set(allDrugs.filter { $0.drugClass != drug.drugClass }.flatMap(\.sideEffects))
            .subtracting(drug.sideEffects)

        let wrongPool = Array(classmateOnlySEs) + Array(otherClassSEs)
        let wrongCount = min(2, wrongPool.count)
        guard wrongCount > 0 else { return qs }

        let wrongOptions = Array(wrongPool.shuffledStable(seed: drug.id + "sa_se").prefix(wrongCount))
        let correctItems = Array(drug.sideEffects.prefix(4))
        let allOpts = (correctItems + wrongOptions).shuffledStable(seed: drug.id + "sa_se_o")

        qs.append(.selectAll(
            id: "gen_\(sid)_\(drug.id)_sa_se",
            subsectionId: sid,
            difficulty: .hard,
            question: "Select ALL recognized adverse effects of \(drug.genericName) (\(drug.brandName)):",
            options: allOpts,
            correctAnswers: Set(correctItems),
            explanation: "Adverse effects of \(drug.genericName) include \(drug.sideEffects.joined(separator: ", ")). The incorrect option(s) — \(wrongOptions.joined(separator: ", ")) — are associated with other medications. Key takeaway: Accurate adverse effect knowledge is essential for patient counseling and recognizing drug-related problems.",
            objective: .adverseEffect,
            relatedDrugIds: [drug.id],
            tags: drug.sideEffects,
            source: .generated
        ))

        if drug.sideEffects.count >= 3 {
            let classShared = Set(drug.sideEffects).intersection(classmateOnlySEs.union(Set((sameClassMap[drug.drugClass] ?? []).flatMap(\.sideEffects))))
            if !classShared.isEmpty {
                let classSpecificWrong = Array(Array(otherClassSEs).shuffledStable(seed: drug.id + "sa_se2").prefix(2))
                guard !classSpecificWrong.isEmpty else { return qs }
                let correct = Array(classShared.prefix(3))
                let opts2 = (correct + classSpecificWrong).shuffledStable(seed: drug.id + "sa_se2_o")

                qs.append(.selectAll(
                    id: "gen_\(sid)_\(drug.id)_sa_se_cls",
                    subsectionId: sid,
                    difficulty: .expert,
                    question: "A patient on \(drug.genericName) reports new symptoms. Select ALL that are known adverse effects of this \(drug.drugClass):",
                    options: opts2,
                    correctAnswers: Set(correct),
                    explanation: "\(drug.drugClass) drugs like \(drug.genericName) can cause \(drug.sideEffects.joined(separator: ", ")). Key takeaway: Class-wide adverse effects help you anticipate problems and counsel patients proactively when starting any drug in the class.",
                    objective: .adverseEffect,
                    relatedDrugIds: [drug.id],
                    tags: [drug.drugClass] + drug.sideEffects,
                    source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - H) Clinical Pearl True/False

    private func generatePearlQuestions(drug: Drug, sid: String) -> [Question] {
        var qs: [Question] = []
        for (idx, pearl) in drug.clinicalPearls.enumerated() {
            qs.append(.trueFalse(
                id: "gen_\(sid)_\(drug.id)_pearl_\(idx)",
                subsectionId: sid,
                difficulty: idx == 0 ? .medium : .hard,
                question: "Clinical pearl for \(drug.genericName) (\(drug.brandName)): \(pearl)",
                answer: true,
                explanation: "This is a verified clinical pearl: \(pearl). Key takeaway: Clinical pearls capture high-yield facts that frequently appear in practice and on exams.",
                objective: .pearl,
                relatedDrugIds: [drug.id],
                tags: [drug.drugClass],
                source: .generated
            ))
        }
        return qs
    }

    // MARK: - G) Matching Questions

    private func generateMatchingQuestions(drugs: [Drug], sid: String) -> [Question] {
        guard drugs.count >= 3 else { return [] }
        var qs: [Question] = []

        let brandGenericPairs = drugs.prefix(4).map { MatchingPair(left: $0.genericName, right: $0.brandName) }
        if brandGenericPairs.count >= 3 {
            qs.append(.matching(
                id: "gen_\(sid)_match_bg",
                subsectionId: sid,
                difficulty: .hard,
                question: "Match each generic name to its brand name:",
                pairs: Array(brandGenericPairs),
                explanation: "These are key brand-generic pairs for this subsection. Key takeaway: Fluent recall of brand-generic pairs is foundational for pharmacy practice.",
                objective: .genericBrand,
                relatedDrugIds: drugs.prefix(4).map(\.id),
                tags: [],
                source: .generated
            ))
        }

        let classGroups = Dictionary(grouping: drugs, by: \.drugClass)
        if classGroups.count >= 2 {
            var classPairs: [MatchingPair] = []
            for (cls, clsDrugs) in classGroups {
                if let first = clsDrugs.first {
                    classPairs.append(MatchingPair(left: first.genericName, right: cls))
                }
            }
            if classPairs.count >= 3 {
                qs.append(.matching(
                    id: "gen_\(sid)_match_dc",
                    subsectionId: sid,
                    difficulty: .hard,
                    question: "Match each drug to its drug class:",
                    pairs: Array(classPairs.prefix(4)),
                    explanation: "Understanding drug classifications is essential for pharmacology. Key takeaway: Grouping drugs by class reveals shared mechanisms, indications, and side effect profiles.",
                    objective: .classId,
                    relatedDrugIds: drugs.map(\.id),
                    tags: Array(classGroups.keys),
                    source: .generated
                ))
            }
        }

        if drugs.count >= 4 {
            let lateDrugs = Array(drugs.suffix(from: min(2, drugs.count)))
            let latePairs = lateDrugs.prefix(4).map { MatchingPair(left: $0.genericName, right: $0.brandName) }
            if latePairs.count >= 3 {
                qs.append(.matching(
                    id: "gen_\(sid)_match_bg2",
                    subsectionId: sid,
                    difficulty: .expert,
                    question: "Match these additional generic names to their brand names:",
                    pairs: Array(latePairs),
                    explanation: "Additional brand-generic pairs for this subsection. Key takeaway: Comprehensive brand-generic knowledge across the entire subsection builds exam confidence.",
                    objective: .genericBrand,
                    relatedDrugIds: lateDrugs.prefix(4).map(\.id),
                    tags: [],
                    source: .generated
                ))
            }
        }

        if drugs.count >= 3 {
            let indicationPairs = drugs.prefix(4).compactMap { d -> MatchingPair? in
                guard let ind = d.indications.first else { return nil }
                return MatchingPair(left: d.genericName, right: ind)
            }
            if indicationPairs.count >= 3 {
                qs.append(.matching(
                    id: "gen_\(sid)_match_ind",
                    subsectionId: sid,
                    difficulty: .expert,
                    question: "Match each drug to its primary indication:",
                    pairs: Array(indicationPairs.prefix(4)),
                    explanation: "Linking drugs to their primary indications reinforces clinical decision-making. Key takeaway: Rapid drug-to-indication recall is tested heavily on licensing exams.",
                    objective: .indication,
                    relatedDrugIds: drugs.prefix(4).map(\.id),
                    tags: [],
                    source: .generated
                ))
            }
        }

        return qs
    }

    // MARK: - Vignette Helpers

    private struct VignetteResult {
        let stem: String
        let rationale: String
        let takeaway: String
        let distractorLabels: [String]
    }

    private func buildTightVignette(for drug: Drug, allDrugs: [Drug]) -> VignetteResult? {
        guard let primaryIndication = drug.indications.first else { return nil }

        let sameClassDrugs = allDrugs.filter { $0.drugClass == drug.drugClass && $0.id != drug.id }
        let differentClassDrugs = allDrugs.filter { $0.drugClass != drug.drugClass && $0.id != drug.id }

        var eliminationClues: [String] = []
        var distractorLabels: [String] = []
        var rationale = "\(drug.genericName) (\(drug.brandName)) is a \(drug.drugClass) indicated for \(primaryIndication)."

        let uniqueIndications = drug.indications.filter { ind in
            !sameClassDrugs.contains(where: { $0.indications.contains(ind) })
        }
        let uniqueSEs = drug.sideEffects.filter { se in
            !sameClassDrugs.contains(where: { $0.sideEffects.contains(se) })
        }
        let uniquePearls = drug.clinicalPearls

        if !differentClassDrugs.isEmpty {
            let wrongClassDrug = differentClassDrugs.shuffledStable(seed: drug.id + "vig_wc").first!
            distractorLabels.append("\(wrongClassDrug.genericName) (\(wrongClassDrug.brandName))")

            if !wrongClassDrug.indications.contains(primaryIndication) {
                eliminationClues.append("The patient needs treatment for \(primaryIndication), which rules out \(wrongClassDrug.drugClass) agents like \(wrongClassDrug.genericName).")
            } else {
                eliminationClues.append("\(wrongClassDrug.genericName) is a \(wrongClassDrug.drugClass), a different class than needed here.")
            }
        }

        if sameClassDrugs.count >= 1 {
            let classmate = sameClassDrugs.shuffledStable(seed: drug.id + "vig_cm").first!
            let classmateLabel = "\(classmate.genericName) (\(classmate.brandName))"

            if !distractorLabels.contains(classmateLabel) {
                if let uniqueInd = uniqueIndications.first, !classmate.indications.contains(uniqueInd) {
                    eliminationClues.append("Among \(drug.drugClass) drugs, \(drug.genericName) specifically has evidence for \(uniqueInd), unlike \(classmate.genericName).")
                    distractorLabels.append(classmateLabel)
                } else if let pearl = uniquePearls.first {
                    eliminationClues.append("\(drug.genericName) is distinguished by: \(pearl).")
                    distractorLabels.append(classmateLabel)
                } else {
                    distractorLabels.append(classmateLabel)
                }
            }
        }

        let remaining = (differentClassDrugs + sameClassDrugs)
            .filter { d in !distractorLabels.contains("\(d.genericName) (\(d.brandName))") }
            .shuffledStable(seed: drug.id + "vig_rem")
        for d in remaining {
            if distractorLabels.count >= 3 { break }
            distractorLabels.append("\(d.genericName) (\(d.brandName))")
        }

        guard distractorLabels.count >= 2 else { return nil }

        let vignetteMap = indicationToVignetteStem()
        var stem = vignetteMap[primaryIndication] ?? "A patient presents requiring treatment for \(primaryIndication)."

        var additionalClues: [String] = []

        if let classmateInDistractors = sameClassDrugs.first(where: { d in distractorLabels.contains("\(d.genericName) (\(d.brandName))") }) {
            let classmateUniqueSE = classmateInDistractors.sideEffects.first(where: { !drug.sideEffects.contains($0) })
            let drugUniqueSE = drug.sideEffects.first(where: { !classmateInDistractors.sideEffects.contains($0) })

            if let cuSE = classmateUniqueSE {
                additionalClues.append("The patient has a history of \(cuSE.lowercased()), so certain agents should be avoided.")
                rationale += " \(classmateInDistractors.genericName) is less appropriate because it is associated with \(cuSE.lowercased())."
            } else if let duSE = drugUniqueSE, uniqueIndications.isEmpty {
                additionalClues.append("The patient tolerates \(duSE.lowercased()) well based on prior use.")
            }

            if let uniqueInd = uniqueIndications.first, !classmateInDistractors.indications.contains(uniqueInd) {
                additionalClues.append("The patient also has \(uniqueInd.lowercased()), making a dual-benefit agent preferred.")
                rationale += " \(drug.genericName) covers both \(primaryIndication) and \(uniqueInd), providing dual benefit."
            }
        }

        if let wrongClassDrug = differentClassDrugs.first(where: { d in distractorLabels.contains("\(d.genericName) (\(d.brandName))") }) {
            if !wrongClassDrug.indications.contains(primaryIndication) {
                rationale += " \(wrongClassDrug.genericName) is a \(wrongClassDrug.drugClass) not indicated for \(primaryIndication)."
            }
        }

        if !additionalClues.isEmpty {
            stem += " " + additionalClues.joined(separator: " ")
        }
        stem += " Which of the following medications would be most appropriate?"

        let takeaway: String
        if !uniqueIndications.isEmpty {
            takeaway = "When multiple drugs in the same class are options, look for unique indications or patient-specific factors (comorbidities, side effect history) to narrow the choice."
        } else if !uniqueSEs.isEmpty {
            takeaway = "Patient history of side effects can eliminate otherwise appropriate drugs. Always check tolerability before selecting an agent."
        } else {
            takeaway = "Match the clinical scenario details — indication, comorbidities, and tolerability — to find the best-fit drug."
        }

        return VignetteResult(stem: stem, rationale: rationale, takeaway: takeaway, distractorLabels: Array(distractorLabels.prefix(3)))
    }

    private func buildSecondaryVignette(for drug: Drug, allDrugs: [Drug]) -> VignetteResult? {
        guard drug.indications.count >= 2 else { return nil }
        let secondIndication = drug.indications[1]

        let otherDrugsWithout = allDrugs.filter { $0.id != drug.id && !$0.indications.contains(secondIndication) }
        guard otherDrugsWithout.count >= 2 else { return nil }

        let distractors = Array(otherDrugsWithout.shuffledStable(seed: drug.id + "vig2d").prefix(3))
        let distractorLabels = distractors.map { "\($0.genericName) (\($0.brandName))" }
        guard distractorLabels.count >= 2 else { return nil }

        let vignetteMap = indicationToVignetteStem()
        var stem = vignetteMap[secondIndication] ?? "A patient needs treatment for \(secondIndication)."

        var eliminationNotes: [String] = []
        for d in distractors.prefix(2) {
            if !d.indications.contains(secondIndication) {
                eliminationNotes.append("\(d.genericName) (\(d.drugClass)) is not indicated for \(secondIndication).")
            }
        }

        if drug.indications.contains(drug.indications[0]) && drug.indications[0] != secondIndication {
            stem += " The patient also has \(drug.indications[0].lowercased()), making a single agent that covers both conditions ideal."
        }

        stem += " Which medication is most appropriate?"

        var rationale = "\(drug.genericName) is indicated for \(secondIndication) and also covers \(drug.indications[0])."
        if !eliminationNotes.isEmpty {
            rationale += " " + eliminationNotes.joined(separator: " ")
        }

        return VignetteResult(
            stem: stem,
            rationale: rationale,
            takeaway: "When a patient has multiple conditions, prefer a single agent that addresses more than one — reducing polypharmacy while maximizing therapeutic benefit.",
            distractorLabels: Array(distractorLabels.prefix(3))
        )
    }

    private func indicationToVignetteStem() -> [String: String] {
        [
            "HTN": "A 55-year-old patient with newly diagnosed hypertension needs pharmacologic therapy.",
            "HF": "A patient with heart failure and reduced ejection fraction requires optimization of their medication regimen.",
            "HFrEF": "A patient with symptomatic HFrEF (EF 30%) needs guideline-directed medical therapy.",
            "HF (HFrEF)": "A 62-year-old with heart failure and EF of 25% is being started on additional therapy.",
            "Edema": "A hospitalized patient has significant lower extremity edema and weight gain from fluid retention.",
            "Angina": "A patient with exertional chest pain diagnosed as stable angina needs long-term prophylactic therapy.",
            "Acute angina": "A patient in the ED presents with acute substernal chest pain.",
            "Post-MI": "A patient is being discharged after a myocardial infarction. The team is selecting secondary prevention agents.",
            "AFib": "A 72-year-old with newly diagnosed atrial fibrillation requires anticoagulation for stroke prevention.",
            "DVT/PE": "A patient is diagnosed with acute deep vein thrombosis and needs anticoagulation.",
            "ACS": "A patient presents to the emergency department with an acute coronary syndrome.",
            "Hyperlipidemia": "A patient with elevated LDL cholesterol needs lipid-lowering therapy per current guidelines.",
            "ASCVD prevention": "A 58-year-old with a 10-year ASCVD risk of 15% requires primary prevention therapy.",
            "Hypertriglyceridemia": "A patient's lipid panel reveals severely elevated triglycerides (>500 mg/dL).",
            "Diabetic nephropathy": "A patient with type 2 diabetes and proteinuria needs renal-protective therapy.",
            "CV risk reduction": "A high-risk cardiovascular patient needs additional risk reduction beyond statin therapy.",
            "Stroke prevention": "A patient with a history of TIA requires secondary stroke prevention.",
            "Rate control (AFib)": "A patient with atrial fibrillation has a resting heart rate of 110 bpm and needs rate control.",
            "SVT": "A patient presents with symptomatic supraventricular tachycardia.",
            "Raynaud's": "A patient with Raynaud phenomenon has painful digital vasospasm in cold weather.",
            "Migraine prophylaxis": "A patient with frequent migraines (8 per month) needs prophylactic therapy.",
            "Tremor": "A patient with essential tremor requires pharmacologic management.",
            "Resistant HTN": "A patient's blood pressure remains uncontrolled on three antihypertensive agents including a diuretic.",
            "Ascites": "A patient with cirrhosis and refractory ascites needs diuretic therapy.",
            "Acute pulmonary edema": "A patient presents with acute dyspnea, bilateral crackles, and pulmonary edema on chest X-ray.",
            "Post-stent": "A patient just had a drug-eluting coronary stent placed and needs antiplatelet therapy.",
            "DVT prophylaxis": "A hospitalized patient requires venous thromboembolism prophylaxis after hip replacement surgery.",
            "Mechanical heart valves": "A patient with a mechanical mitral valve replacement requires lifelong anticoagulation.",
            "Familial hypercholesterolemia": "A patient with familial hypercholesterolemia has LDL of 220 despite maximally tolerated statin therapy.",
            "Chronic stable angina": "A patient with chronic stable angina continues to have symptoms despite beta blocker and nitrate therapy.",
            "Angina prophylaxis": "A patient needs daily medication to prevent recurrent angina episodes.",
            "Type 2 Diabetes": "A newly diagnosed type 2 diabetes patient with an A1c of 8.5% needs initial pharmacotherapy.",
            "T2DM": "A 52-year-old with type 2 diabetes and an A1c of 7.8% needs therapy adjustment.",
            "DKA": "A patient presents with diabetic ketoacidosis requiring urgent insulin therapy.",
            "Type 1 Diabetes": "A patient with type 1 diabetes requires basal-bolus insulin therapy.",
            "Hypothyroidism": "A patient is diagnosed with primary hypothyroidism and needs hormone replacement.",
            "Hyperthyroidism": "A patient with Graves' disease needs antithyroid medication.",
            "Osteoporosis": "A postmenopausal woman with a T-score of -3.0 needs osteoporosis treatment.",
            "GERD": "A patient with frequent heartburn and esophagitis diagnosed on endoscopy needs acid suppression therapy.",
            "Peptic ulcer": "A patient is diagnosed with an H. pylori-positive duodenal ulcer.",
            "Nausea/vomiting": "A patient undergoing chemotherapy needs antiemetic prophylaxis.",
            "IBD": "A patient with moderate Crohn's disease needs maintenance therapy.",
            "IBS-C": "A patient with irritable bowel syndrome and predominant constipation needs pharmacotherapy.",
            "Constipation": "A patient with chronic constipation has not responded to lifestyle modifications.",
            "Asthma": "A patient with moderate persistent asthma needs a controller medication.",
            "COPD": "A 68-year-old with COPD and frequent exacerbations needs maintenance inhaler therapy.",
            "Allergic rhinitis": "A patient with seasonal allergic rhinitis needs daily symptom control.",
            "Depression": "A patient is diagnosed with major depressive disorder and needs first-line pharmacotherapy.",
            "Anxiety": "A patient with generalized anxiety disorder requires pharmacologic treatment.",
            "Insomnia": "A patient with chronic insomnia has not responded to sleep hygiene measures.",
            "Bipolar disorder": "A patient with bipolar I disorder needs mood stabilization.",
            "Schizophrenia": "A patient with schizophrenia needs initiation of antipsychotic therapy.",
            "ADHD": "A child diagnosed with ADHD requires first-line pharmacologic treatment.",
            "Seizures": "A patient with newly diagnosed focal epilepsy needs an antiepileptic drug.",
            "Epilepsy": "A patient with generalized tonic-clonic seizures requires long-term seizure prophylaxis.",
            "Neuropathic pain": "A patient with diabetic peripheral neuropathy has burning pain in both feet.",
            "Pain": "A patient with moderate acute pain needs short-term analgesic therapy.",
            "Severe pain": "A patient with severe post-surgical pain needs potent analgesia.",
            "Gout": "A patient presents with an acute gout flare in the first metatarsophalangeal joint.",
            "RA": "A patient with newly diagnosed rheumatoid arthritis needs disease-modifying therapy.",
            "UTI": "A patient presents with dysuria, frequency, and a positive urine culture.",
            "Pneumonia": "A patient is diagnosed with community-acquired pneumonia requiring outpatient antibiotic therapy.",
            "Skin infection": "A patient has a purulent skin abscess with surrounding cellulitis.",
            "MRSA": "A patient has a culture-confirmed MRSA skin infection.",
            "HIV": "A patient newly diagnosed with HIV needs initiation of antiretroviral therapy.",
            "Influenza": "A patient presents within 48 hours of influenza symptom onset.",
            "BPH": "A 65-year-old male with urinary hesitancy and frequency is diagnosed with benign prostatic hyperplasia.",
            "Overactive bladder": "A patient reports urinary urgency and frequency consistent with overactive bladder.",
            "Erectile dysfunction": "A male patient reports difficulty achieving erections.",
            "Glaucoma": "A patient is diagnosed with open-angle glaucoma and needs intraocular pressure reduction.",
            "Acne": "An adolescent patient with moderate inflammatory acne needs pharmacologic treatment.",
            "Psoriasis": "A patient with moderate-to-severe plaque psoriasis needs systemic therapy.",
            "Anemia": "A patient with iron deficiency anemia needs supplementation.",
        ]
    }

    // MARK: - Distractor Helpers

    private func pickDistractorBrands(excluding drug: Drug, from allDrugs: [Drug], count: Int) -> [String] {
        let sameClassFirst = allDrugs.filter { $0.id != drug.id && $0.drugClass == drug.drugClass }
        let others = allDrugs.filter { $0.id != drug.id && $0.drugClass != drug.drugClass }
        let pool = sameClassFirst.shuffledStable(seed: drug.id + "db") + others.shuffledStable(seed: drug.id + "db2")
        return Array(pool.map(\.brandName).prefix(count))
    }

    private func pickDistractorGenerics(excluding drug: Drug, from allDrugs: [Drug], count: Int) -> [String] {
        let sameClassFirst = allDrugs.filter { $0.id != drug.id && $0.drugClass == drug.drugClass }
        let others = allDrugs.filter { $0.id != drug.id && $0.drugClass != drug.drugClass }
        let pool = sameClassFirst.shuffledStable(seed: drug.id + "dg") + others.shuffledStable(seed: drug.id + "dg2")
        return Array(pool.map(\.genericName).prefix(count))
    }
}

extension Array {
    func shuffledStable(seed: String) -> [Element] {
        var rng = SeededRNG(seed: seed)
        return self.shuffled(using: &rng)
    }
}

nonisolated struct SeededRNG: RandomNumberGenerator {
    private var state: UInt64

    init(seed: String) {
        var hash: UInt64 = 5381
        for byte in seed.utf8 {
            hash = hash &* 33 &+ UInt64(byte)
        }
        self.state = hash
    }

    mutating func next() -> UInt64 {
        state = state &* 6364136223846793005 &+ 1442695040888963407
        return state
    }
}
