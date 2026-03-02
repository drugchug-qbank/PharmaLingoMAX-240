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

        for drug in drugs {
            questions.append(contentsOf: generateGenericToBrand(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateBrandToGeneric(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateClassId(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateSuffixQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateIndicationQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generateSideEffectQuestions(drug: drug, sid: sid, allDrugs: moduleDrugs))
            questions.append(contentsOf: generatePearlQuestions(drug: drug, sid: sid))
        }

        questions.append(contentsOf: generateMatchingQuestions(drugs: drugs, sid: sid))

        return questions
    }

    private func allDrugsInModule(for moduleId: String) -> [Drug] {
        guard let module = dataService.module(for: moduleId) else { return [] }
        return module.subsections.flatMap(\.drugs)
    }

    // MARK: - A) Generic -> Brand (multipleChoice + fillBlank)

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
            explanation: "\(drug.genericName) is sold under the brand name \(drug.brandName).",
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
            explanation: "\(drug.genericName) is marketed as \(drug.brandName).",
            objective: .genericBrand,
            relatedDrugIds: [drug.id],
            tags: [drug.drugClass],
            source: .generated
        ))

        return qs
    }

    // MARK: - B) Brand -> Generic (multipleChoice)

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
            explanation: "\(drug.brandName) is the brand name for \(drug.genericName).",
            objective: .brandGeneric,
            relatedDrugIds: [drug.id],
            tags: [drug.drugClass],
            source: .generated
        )]
    }

    // MARK: - C) Drug -> Class (multipleChoice)

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
            explanation: "\(drug.genericName) is classified as a \(drug.drugClass).",
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
            explanation: "The suffix \(drug.suffix) identifies \(drug.drugClass) drugs like \(drug.genericName).",
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
            explanation: "The \(drug.suffix) suffix correctly identifies \(drug.genericName) as a \(drug.drugClass).",
            objective: .suffixId,
            relatedDrugIds: [drug.id],
            tags: [drug.suffix],
            source: .generated
        ))

        return qs
    }

    // MARK: - E) Indication Recognition

    private func generateIndicationQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard let primaryIndication = drug.indications.first else { return [] }
        var qs: [Question] = []

        let otherIndications = Array(Set(allDrugs.flatMap(\.indications)).subtracting(drug.indications))
        let distractors = Array(otherIndications.shuffledStable(seed: drug.id + "ind").prefix(3))
        guard distractors.count >= 2 else { return qs }

        let opts = (distractors + [primaryIndication]).shuffledStable(seed: drug.id + "ind_o")
        qs.append(.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_ind_mc",
            subsectionId: sid,
            difficulty: .medium,
            question: "Which of the following is a primary indication for \(drug.genericName) (\(drug.brandName))?",
            options: opts,
            answer: primaryIndication,
            explanation: "\(drug.genericName) is indicated for \(drug.indications.joined(separator: ", ")).",
            objective: .indication,
            relatedDrugIds: [drug.id],
            tags: drug.indications,
            source: .generated
        ))

        if drug.indications.count >= 3 {
            let correctSet = Set(drug.indications.prefix(3))
            let wrongOptions = Array(otherIndications.shuffledStable(seed: drug.id + "ind_sa").prefix(2))

            guard !wrongOptions.isEmpty else { return qs }
            let allOpts = (Array(correctSet) + wrongOptions).shuffledStable(seed: drug.id + "ind_sa_o")
            qs.append(.selectAll(
                id: "gen_\(sid)_\(drug.id)_ind_sa",
                subsectionId: sid,
                difficulty: .hard,
                question: "Select ALL indications for \(drug.genericName) (\(drug.brandName)):",
                options: allOpts,
                correctAnswers: correctSet,
                explanation: "\(drug.genericName) is indicated for \(drug.indications.joined(separator: ", ")).",
                objective: .indication,
                relatedDrugIds: [drug.id],
                tags: drug.indications,
                source: .generated
            ))
        }

        return qs
    }

    // MARK: - F) Side Effect Recognition

    private func generateSideEffectQuestions(drug: Drug, sid: String, allDrugs: [Drug]) -> [Question] {
        guard let primarySE = drug.sideEffects.first else { return [] }
        var qs: [Question] = []

        let otherSEs = Array(Set(allDrugs.flatMap(\.sideEffects)).subtracting(drug.sideEffects))
        let distractors = Array(otherSEs.shuffledStable(seed: drug.id + "se").prefix(3))
        guard distractors.count >= 2 else { return qs }

        let opts = (distractors + [primarySE]).shuffledStable(seed: drug.id + "se_o")
        qs.append(.multipleChoice(
            id: "gen_\(sid)_\(drug.id)_se_mc",
            subsectionId: sid,
            difficulty: .medium,
            question: "Which side effect is associated with \(drug.genericName) (\(drug.brandName))?",
            options: opts,
            answer: primarySE,
            explanation: "Common side effects of \(drug.genericName) include \(drug.sideEffects.joined(separator: ", ")).",
            objective: .adverseEffect,
            relatedDrugIds: [drug.id],
            tags: drug.sideEffects,
            source: .generated
        ))

        if drug.sideEffects.count >= 3 {
            let correctSet = Set(drug.sideEffects.prefix(3))
            let wrongOpts = Array(otherSEs.shuffledStable(seed: drug.id + "se_sa").prefix(2))

            guard !wrongOpts.isEmpty else { return qs }
            let allOpts = (Array(correctSet) + wrongOpts).shuffledStable(seed: drug.id + "se_sa_o")
            qs.append(.selectAll(
                id: "gen_\(sid)_\(drug.id)_se_sa",
                subsectionId: sid,
                difficulty: .hard,
                question: "Select ALL common side effects of \(drug.genericName) (\(drug.brandName)):",
                options: allOpts,
                correctAnswers: correctSet,
                explanation: "Side effects of \(drug.genericName) include \(drug.sideEffects.joined(separator: ", ")).",
                objective: .adverseEffect,
                relatedDrugIds: [drug.id],
                tags: drug.sideEffects,
                source: .generated
            ))
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
                explanation: "This is a verified clinical pearl: \(pearl)",
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
                explanation: "Key brand-generic pairs for this subsection.",
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
                    explanation: "Understanding drug classifications is essential for pharmacology.",
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
                    explanation: "Additional brand-generic pairs for this subsection.",
                    objective: .genericBrand,
                    relatedDrugIds: lateDrugs.prefix(4).map(\.id),
                    tags: [],
                    source: .generated
                ))
            }
        }

        return qs
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
