import Foundation

struct DrugDataService {
    static let shared = DrugDataService()

    let modules: [DrugModule]
    private let questionBank: [String: [Question]]

    private init() {
        self.modules = [
            Self.buildModule1(), Self.buildModule2(), Self.buildModule3(),
            Self.buildModule4(), Self.buildModule5(), Self.buildModule6(),
            Self.buildModule7(), Self.buildModule8(), Self.buildModule9(),
            Self.buildModule10()
        ]
        var bank: [String: [Question]] = [:]
        Self.populateCuratedBank(&bank)
        for mod in self.modules {
            let nonMasteryIds = Set(mod.subsections.filter { !$0.isMasteryQuiz }.map(\.id))
            for sub in mod.subsections where sub.isMasteryQuiz {
                var mastery: [Question] = []
                for nid in nonMasteryIds {
                    if let qs = bank[nid] {
                        mastery.append(contentsOf: qs.prefix(6))
                    }
                }
                bank[sub.id] = mastery
                if sub.id == Self.masteringCv1SubsectionId {
                    bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_1fMastery)
                }
                if sub.id == Self.masteringCv2SubsectionId {
                    bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_2gMastery)
                }
            }
        }
        self.questionBank = bank
    }

    func questions(for subsectionId: String) -> [Question] {
        questionBank[subsectionId] ?? []
    }

    func allQuestions(for subsectionId: String) -> [Question] {
        let curated = questionBank[subsectionId] ?? []
        guard let subsection = subsection(for: subsectionId) else { return curated }
        let generated = QuestionFactory.shared.generateQuestions(for: subsection)
        let curatedIds = Set(curated.map(\.id))
        let deduped = generated.filter { !curatedIds.contains($0.id) }
        return curated + deduped
    }

    func questionsForQuiz(subsectionId: String, completedSubsections: Set<String>, count: Int = 12) -> [Question] {
        var pool = allQuestions(for: subsectionId)
        if pool.isEmpty { return [] }
        let teachingQuestions = pool.filter { $0.difficulty == .easy }.shuffled()
        let teachingCount = min(teachingQuestions.count, max(3, count / 3))
        var quizQuestions = Array(teachingQuestions.prefix(teachingCount))
        let remaining = pool.filter { q in !quizQuestions.contains(where: { $0.id == q.id }) }.shuffled()
        quizQuestions.append(contentsOf: remaining)
        let reviewSubsections = completedSubsections.filter { $0 != subsectionId }
        if !reviewSubsections.isEmpty {
            let reviewCount = Int.random(in: 2...4)
            var reviewQuestions: [Question] = []
            for reviewId in reviewSubsections.shuffled() {
                let available = allQuestions(for: reviewId).shuffled()
                reviewQuestions.append(contentsOf: available.prefix(2))
            }
            quizQuestions.append(contentsOf: reviewQuestions.shuffled().prefix(reviewCount))
        }
        var result = Array(quizQuestions.prefix(count))
        let firstBatch = Array(result.prefix(teachingCount))
        let restBatch = Array(result.dropFirst(teachingCount)).shuffled()
        result = firstBatch + restBatch
        return result
    }

    func module(for id: String) -> DrugModule? {
        modules.first { $0.id == id }
    }

    func subsection(for id: String) -> Subsection? {
        modules.flatMap(\.subsections).first { $0.id == id }
    }

    func brandBlitzQuestions(completedSubsections: Set<String>, count: Int = 15) -> [Question] {
        var availableDrugs: [Drug] = []
        for module in modules {
            for sub in module.subsections where !sub.isMasteryQuiz {
                if completedSubsections.contains(sub.id) || sub.id == modules[0].subsections[0].id {
                    availableDrugs.append(contentsOf: sub.drugs)
                }
            }
        }
        if availableDrugs.count < 4 {
            availableDrugs = modules.flatMap { $0.subsections.flatMap { $0.drugs } }
        }
        let shuffledDrugs = availableDrugs.shuffled()
        var questions: [Question] = []
        for (idx, drug) in shuffledDrugs.prefix(count * 2).enumerated() {
            let qId = "bb_\(idx)"
            switch idx % 5 {
            case 0:
                let wrong = availableDrugs.filter { $0.id != drug.id }.shuffled().prefix(3).map(\.brandName)
                questions.append(.multipleChoice(id: qId, subsectionId: "brand_blitz", difficulty: .easy, question: "What is the brand name of \(drug.genericName)?", options: ([drug.brandName] + wrong).shuffled(), answer: drug.brandName, explanation: "\(drug.genericName) is sold as \(drug.brandName)."))
            case 1:
                let wrong = availableDrugs.filter { $0.id != drug.id }.shuffled().prefix(3).map(\.genericName)
                questions.append(.multipleChoice(id: qId, subsectionId: "brand_blitz", difficulty: .easy, question: "What is the generic name of \(drug.brandName)?", options: ([drug.genericName] + wrong).shuffled(), answer: drug.genericName, explanation: "\(drug.brandName) is the brand name for \(drug.genericName)."))
            case 2:
                let wrong = availableDrugs.filter { $0.id != drug.id }.shuffled().prefix(3).map(\.brandName)
                questions.append(.fillBlank(id: qId, subsectionId: "brand_blitz", difficulty: .easy, question: "The brand name of \(drug.genericName) is _____.", options: ([drug.brandName] + wrong).shuffled(), answer: drug.brandName, explanation: "\(drug.genericName) is sold as \(drug.brandName)."))
            case 3:
                let correctBrand = drug.brandName.components(separatedBy: "/").first ?? drug.brandName
                if Bool.random() {
                    questions.append(.trueFalse(id: qId, subsectionId: "brand_blitz", difficulty: .easy, question: "The brand name of \(drug.genericName) is \(correctBrand).", answer: true, explanation: "\(drug.genericName) is sold as \(drug.brandName)."))
                } else {
                    let wrongBrand = availableDrugs.filter { $0.id != drug.id }.randomElement()?.brandName.components(separatedBy: "/").first ?? "Unknown"
                    questions.append(.trueFalse(id: qId, subsectionId: "brand_blitz", difficulty: .easy, question: "The brand name of \(drug.genericName) is \(wrongBrand).", answer: false, explanation: "\(drug.genericName) is actually sold as \(drug.brandName), not \(wrongBrand)."))
                }
            default:
                let matchDrugs = shuffledDrugs.filter { $0.id != drug.id }.prefix(3)
                var pairs = [MatchingPair(left: drug.genericName, right: drug.brandName)]
                for d in matchDrugs { pairs.append(MatchingPair(left: d.genericName, right: d.brandName)) }
                questions.append(.matching(id: qId, subsectionId: "brand_blitz", difficulty: .easy, question: "Match each generic name to its brand name:", pairs: pairs, explanation: "Brand-generic matching for key drugs."))
            }
            if questions.count >= count { break }
        }
        return Array(questions.prefix(count)).shuffled()
    }

    static func populateCuratedBank(_ bank: inout [String: [Question]]) {
        bank["1a"] = [
            .fillBlank(id: "q1a_t1", subsectionId: "1a", difficulty: .easy, question: "All ACE inhibitors end in _____.", options: ["-pril", "-sartan", "-olol", "-dipine"], answer: "-pril", explanation: "Rule: The -pril suffix identifies ACE inhibitors.\nWhy: Lisinopril, enalapril, ramipril all end in -pril."),
            .fillBlank(id: "q1a_t2", subsectionId: "1a", difficulty: .easy, question: "All ARBs end in _____.", options: ["-sartan", "-pril", "-olol", "-statin"], answer: "-sartan", explanation: "Rule: The -sartan suffix identifies ARBs.\nWhy: Losartan, valsartan, irbesartan all end in -sartan."),
            .trueFalse(id: "q1a_t3", subsectionId: "1a", difficulty: .easy, question: "Lisinopril (Zestril) is an ACE inhibitor because it ends in -pril.", answer: true, explanation: "Rule: -pril suffix = ACE inhibitor.\nWhy: All ACE inhibitors share the -pril suffix."),
            .multipleChoice(id: "q1a_t5", subsectionId: "1a", difficulty: .easy, question: "The primary indication for both ACE inhibitors and ARBs is:", options: ["Hypertension", "Diabetes", "Asthma", "Depression"], answer: "Hypertension", explanation: "Rule: ACE inhibitors and ARBs are first-line for HTN.\nWhy: They block the RAAS system to lower blood pressure."),
            .fillBlank(id: "q1a_t6", subsectionId: "1a", difficulty: .easy, question: "A patient on lisinopril develops a dry cough. This is caused by _____ accumulation.", options: ["Bradykinin", "Angiotensin", "Aldosterone", "Potassium"], answer: "Bradykinin", explanation: "Rule: ACE inhibitor cough = bradykinin accumulation.\nWhy: ACE breaks down bradykinin; blocking ACE causes buildup."),
            .multipleChoice(id: "q1a_3", subsectionId: "1a", question: "Which side effect is unique to ACE inhibitors compared to ARBs?", options: ["Dry cough", "Hyperkalemia", "Dizziness", "Hypotension"], answer: "Dry cough", explanation: "Rule: Dry cough is unique to ACE inhibitors (not ARBs).\nWhy: Bradykinin accumulation only occurs with ACE inhibition."),
            .multipleChoice(id: "q1a_7", subsectionId: "1a", question: "Both ACE inhibitors and ARBs are contraindicated in:", options: ["Pregnancy", "Diabetes", "COPD", "Anemia"], answer: "Pregnancy", explanation: "Rule: Both ACEi and ARBs carry a Black Box Warning in pregnancy.\nWhy: Fetal toxicity (renal agenesis, oligohydramnios)."),
            .selectAll(id: "q1a_8", subsectionId: "1a", question: "Select ALL ACE inhibitors:", options: ["Lisinopril", "Losartan", "Enalapril", "Valsartan", "Ramipril"], correctAnswers: ["Lisinopril", "Enalapril", "Ramipril"], explanation: "Rule: ACE inhibitors end in -pril.\nWhy: Losartan and valsartan end in -sartan (ARBs)."),
            .matching(id: "q1a_9", subsectionId: "1a", question: "Match each generic name to its brand name:", pairs: [MatchingPair(left: "Lisinopril", right: "Zestril"), MatchingPair(left: "Losartan", right: "Cozaar"), MatchingPair(left: "Enalapril", right: "Vasotec"), MatchingPair(left: "Valsartan", right: "Diovan")], explanation: "Key brand-generic pairs for ACE inhibitors and ARBs."),
            .multipleChoice(id: "q1a_10", subsectionId: "1a", question: "A patient on an ACE inhibitor develops a persistent dry cough. The best alternative is:", options: ["An ARB", "A beta blocker", "A thiazide diuretic", "Another ACE inhibitor"], answer: "An ARB", explanation: "Rule: Switch ACEi → ARB if cough develops.\nWhy: ARBs provide similar RAAS blockade without bradykinin buildup."),
            .multipleChoice(id: "q1a_12", subsectionId: "1a", question: "Which ARB has a unique uricosuric effect?", options: ["Losartan", "Valsartan", "Irbesartan", "Olmesartan"], answer: "Losartan", explanation: "Rule: Losartan uniquely lowers uric acid.\nPearl: Useful in patients with HTN + gout."),
            .multipleChoice(id: "q1a_14", subsectionId: "1a", question: "Olmesartan (Benicar) has a unique side effect called:", options: ["Sprue-like enteropathy", "Dry cough", "Angioedema", "Gingival hyperplasia"], answer: "Sprue-like enteropathy", explanation: "Rule: Olmesartan can cause sprue-like enteropathy.\nWhy: Severe diarrhea and weight loss; resolves on discontinuation."),
        ]
        bank["1b"] = [
            .fillBlank(id: "q1b_t1", subsectionId: "1b", difficulty: .easy, question: "Furosemide (Lasix) belongs to which class of diuretics?", options: ["Loop diuretics", "Thiazide diuretics", "Potassium-sparing diuretics", "Osmotic diuretics"], answer: "Loop diuretics", explanation: "Rule: Furosemide (Lasix) is a loop diuretic.\nWhy: Works on the thick ascending loop of Henle."),
            .multipleChoice(id: "q1b_t3", subsectionId: "1b", difficulty: .easy, question: "Thiazide diuretics cause hyper_____ (elevated levels of glucose, lipids, uric acid, calcium).", options: ["GLUC", "KALE", "SALT", "ACID"], answer: "GLUC", explanation: "Rule: Thiazides cause HyperGLUC.\nWhy: Glucose↑, Lipids↑, Uric acid↑, Calcium↑."),
            .multipleChoice(id: "q1b_13", subsectionId: "1b", question: "Which electrolyte abnormality is common to BOTH thiazide and loop diuretics?", options: ["Hypokalemia", "Hypercalcemia", "Hypermagnesemia", "Hypernatremia"], answer: "Hypokalemia", explanation: "Rule: Both thiazides and loops waste potassium.\nWhy: Increased Na+ delivery to collecting duct drives K+ secretion."),
            .trueFalse(id: "q1b_15", subsectionId: "1b", question: "Thiazides cause hypercalcemia while loop diuretics cause hypocalcemia.", answer: true, explanation: "Rule: Thiazides RETAIN calcium; loops LOSE calcium.\nPearl: Key distinction for board exams."),
            .selectAll(id: "q1b_7", subsectionId: "1b", question: "Select ALL loop diuretics:", options: ["Furosemide", "HCTZ", "Bumetanide", "Chlorthalidone", "Torsemide"], correctAnswers: ["Furosemide", "Bumetanide", "Torsemide"], explanation: "Rule: Furosemide, bumetanide, and torsemide are loop diuretics.\nWhy: HCTZ and chlorthalidone are thiazide(-like) diuretics."),
            .matching(id: "q1b_10", subsectionId: "1b", question: "Match each diuretic to its brand name:", pairs: [MatchingPair(left: "Furosemide", right: "Lasix"), MatchingPair(left: "Bumetanide", right: "Bumex"), MatchingPair(left: "HCTZ", right: "Microzide"), MatchingPair(left: "Torsemide", right: "Demadex")], explanation: "Key diuretic brand-generic pairs."),
            .multipleChoice(id: "q1b_11", subsectionId: "1b", difficulty: .hard, question: "1 mg of bumetanide equals how many mg of furosemide?", options: ["40 mg", "20 mg", "80 mg", "10 mg"], answer: "40 mg", explanation: "Rule: Bumetanide is 40x more potent than furosemide.\nPearl: 1 mg bumetanide ≈ 40 mg furosemide."),
        ]
        bank["1c"] = [
            .fillBlank(id: "q1c_t1", subsectionId: "1c", difficulty: .easy, question: "All beta blockers end in the suffix _____.", options: ["-olol", "-pril", "-sartan", "-dipine"], answer: "-olol", explanation: "Rule: -olol suffix identifies beta blockers.\nWhy: Metoprolol, atenolol, propranolol all end in -olol."),
            .multipleChoice(id: "q1c_t3", subsectionId: "1c", difficulty: .easy, question: "Beta-1 receptors are primarily located in the:", options: ["Heart", "Lungs", "Liver", "Kidneys"], answer: "Heart", explanation: "Rule: B1 = Heart, B2 = Lungs.\nPearl: Selective B1 blockers mainly lower heart rate."),
            .multipleChoice(id: "q1c_3", subsectionId: "1c", question: "Which 3 beta blockers reduce mortality in HFrEF?", options: ["Metoprolol succinate, carvedilol, bisoprolol", "Metoprolol tartrate, atenolol, propranolol", "Atenolol, carvedilol, propranolol", "Propranolol, bisoprolol, nadolol"], answer: "Metoprolol succinate, carvedilol, bisoprolol", explanation: "Rule: Only 3 BBs have HFrEF mortality benefit.\nPearl: Succinate (not tartrate), carvedilol, bisoprolol."),
            .multipleChoice(id: "q1c_5", subsectionId: "1c", question: "Which beta blocker should be avoided in asthma?", options: ["Propranolol", "Metoprolol", "Atenolol", "Bisoprolol"], answer: "Propranolol", explanation: "Rule: Non-selective BBs can cause bronchospasm.\nWhy: Propranolol blocks B2 in lungs → bronchospasm."),
            .selectAll(id: "q1c_7", subsectionId: "1c", question: "Select ALL beta-1 selective blockers:", options: ["Metoprolol", "Propranolol", "Atenolol", "Carvedilol", "Bisoprolol"], correctAnswers: ["Metoprolol", "Atenolol", "Bisoprolol"], explanation: "Rule: Metoprolol, atenolol, bisoprolol are B1-selective.\nWhy: Propranolol is non-selective; carvedilol blocks alpha + beta."),
            .matching(id: "q1c_8", subsectionId: "1c", question: "Match beta blocker to brand name:", pairs: [MatchingPair(left: "Metoprolol ER", right: "Toprol XL"), MatchingPair(left: "Carvedilol", right: "Coreg"), MatchingPair(left: "Atenolol", right: "Tenormin"), MatchingPair(left: "Propranolol", right: "Inderal")], explanation: "Key beta blocker brand-generic pairs."),
        ]
        bank["1d"] = [
            .trueFalse(id: "q1d_1", subsectionId: "1d", question: "Spironolactone is a potassium-sparing diuretic.", answer: true, explanation: "Rule: MRAs spare potassium.\nWhy: They block aldosterone, which normally promotes K+ excretion."),
            .multipleChoice(id: "q1d_2", subsectionId: "1d", question: "Which side effect is associated with spironolactone but NOT eplerenone?", options: ["Gynecomastia", "Hyperkalemia", "Hypotension", "Headache"], answer: "Gynecomastia", explanation: "Rule: Spironolactone causes gynecomastia; eplerenone does not.\nWhy: Spironolactone has anti-androgen effects."),
            .fillBlank(id: "q1d_3", subsectionId: "1d", question: "Before starting Entresto, a patient must have a ___-hour washout from ACE inhibitors.", options: ["36", "24", "12", "48"], answer: "36", explanation: "Rule: 36-hour ACE inhibitor washout before Entresto.\nWhy: Risk of angioedema if combined."),
            .multipleChoice(id: "q1d_5", subsectionId: "1d", question: "Entresto contains sacubitril combined with which ARB?", options: ["Valsartan", "Losartan", "Irbesartan", "Candesartan"], answer: "Valsartan", explanation: "Rule: Entresto = sacubitril/valsartan (ARNI).\nWhy: Combines neprilysin inhibition with ARB."),
            .selectAll(id: "q1d_8", subsectionId: "1d", question: "Select ALL that require potassium monitoring:", options: ["Spironolactone", "Eplerenone", "Entresto", "Amlodipine"], correctAnswers: ["Spironolactone", "Eplerenone", "Entresto"], explanation: "Rule: All three can cause hyperkalemia.\nWhy: RAAS blockade reduces K+ excretion."),
            .matching(id: "q1d_10", subsectionId: "1d", question: "Match each drug to its brand name:", pairs: [MatchingPair(left: "Spironolactone", right: "Aldactone"), MatchingPair(left: "Eplerenone", right: "Inspra"), MatchingPair(left: "Sacubitril/Valsartan", right: "Entresto")], explanation: "Key MRA and ARNI brand-generic pairs."),
        ]
        bank["2a"] = [
            .fillBlank(id: "q2a_t2", subsectionId: "2a", difficulty: .easy, question: "All statins end in _____.", options: ["-statin", "-pril", "-olol", "-sartan"], answer: "-statin", explanation: "Rule: -statin suffix identifies HMG-CoA reductase inhibitors."),
            .multipleChoice(id: "q2a_3", subsectionId: "2a", question: "Which is the most potent statin?", options: ["Rosuvastatin", "Atorvastatin", "Simvastatin", "Pravastatin"], answer: "Rosuvastatin", explanation: "Rule: Rosuvastatin (Crestor) is the most potent statin."),
            .selectAll(id: "q2a_6", subsectionId: "2a", question: "Select ALL high-intensity statin regimens:", options: ["Atorvastatin 40-80mg", "Rosuvastatin 20-40mg", "Simvastatin 20mg", "Pravastatin 40mg"], correctAnswers: ["Atorvastatin 40-80mg", "Rosuvastatin 20-40mg"], explanation: "Rule: High-intensity = atorva 40-80mg or rosuva 20-40mg."),
            .multipleChoice(id: "q2a_7", subsectionId: "2a", question: "What is the most common side effect of statins?", options: ["Myalgia", "Headache", "Nausea", "Cough"], answer: "Myalgia", explanation: "Rule: Myalgia (muscle pain) affects ~10% of statin users."),
            .matching(id: "q2a_9", subsectionId: "2a", question: "Match each statin to its brand name:", pairs: [MatchingPair(left: "Atorvastatin", right: "Lipitor"), MatchingPair(left: "Rosuvastatin", right: "Crestor"), MatchingPair(left: "Simvastatin", right: "Zocor"), MatchingPair(left: "Pravastatin", right: "Pravachol")], explanation: "Key statin brand-generic pairs."),
            .multipleChoice(id: "q2a_10", subsectionId: "2a", question: "Which statin has the fewest drug interactions?", options: ["Pravastatin", "Simvastatin", "Atorvastatin", "Lovastatin"], answer: "Pravastatin", explanation: "Rule: Pravastatin is not metabolized by CYP3A4.\nPearl: Fewer drug interactions than other statins."),
        ]
        bank["1a"]?.append(contentsOf: Self.curatedAddOnQuestions_1a)
        bank["1b"]?.append(contentsOf: Self.curatedAddOnQuestions_1b)
        bank["1c"]?.append(contentsOf: Self.curatedAddOnQuestions_1c)
        bank["1d"]?.append(contentsOf: Self.curatedAddOnQuestions_1d)
        bank["2a"]?.append(contentsOf: Self.curatedAddOnQuestions_2a)
        if bank[Self.ccbSubsectionId] == nil { bank[Self.ccbSubsectionId] = [] }
        bank[Self.ccbSubsectionId]?.append(contentsOf: Self.curatedAddOnQuestions_1e)
        bank["2b"] = [
            .multipleChoice(id: "q2b_1", subsectionId: "2b", question: "Ezetimibe works by:", options: ["Blocking intestinal cholesterol absorption", "Inhibiting HMG-CoA reductase", "Binding bile acids", "Activating LDL receptors"], answer: "Blocking intestinal cholesterol absorption", explanation: "Rule: Ezetimibe blocks the NPC1L1 transporter in the intestine."),
            .trueFalse(id: "q2b_3", subsectionId: "2b", question: "PCSK9 inhibitors are oral medications.", answer: false, explanation: "Rule: PCSK9 inhibitors are subcutaneous injections (monoclonal antibodies)."),
            .multipleChoice(id: "q2b_5", subsectionId: "2b", question: "Which fibrate should be AVOIDED with statins?", options: ["Gemfibrozil", "Fenofibrate", "Both equally", "Neither"], answer: "Gemfibrozil", explanation: "Rule: Gemfibrozil significantly increases myopathy risk with statins.\nPearl: Use fenofibrate if fibrate + statin is needed."),
            .selectAll(id: "q2b_8", subsectionId: "2b", question: "Select ALL PCSK9 inhibitors:", options: ["Evolocumab", "Alirocumab", "Ezetimibe", "Fenofibrate"], correctAnswers: ["Evolocumab", "Alirocumab"], explanation: "Rule: Evolocumab (Repatha) and alirocumab (Praluent) are PCSK9 inhibitors."),
            .matching(id: "q2b_9", subsectionId: "2b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Ezetimibe", right: "Zetia"), MatchingPair(left: "Evolocumab", right: "Repatha"), MatchingPair(left: "Fenofibrate", right: "Tricor"), MatchingPair(left: "Icosapent ethyl", right: "Vascepa")], explanation: "Key non-statin lipid drug brand names."),
        ]
        bank["2b"]?.append(contentsOf: Self.curatedAddOnQuestions_2b)

        if bank["2c"] == nil { bank["2c"] = [] }
        bank["2c"]?.append(contentsOf: Self.curatedAddOnQuestions_2c)

        if bank["2d"] == nil { bank["2d"] = [] }
        bank["2d"]?.append(contentsOf: Self.curatedAddOnQuestions_2d)

        if bank["2e"] == nil { bank["2e"] = [] }
        bank["2e"]?.append(contentsOf: Self.curatedAddOnQuestions_2e)

        if bank["2f"] == nil { bank["2f"] = [] }
        bank["2f"]?.append(contentsOf: Self.curatedAddOnQuestions_2f)

        if bank["3a"] == nil { bank["3a"] = [] }
        bank["3a"]?.append(contentsOf: Self.curatedAddOnQuestions_3a)

        if bank["3b"] == nil { bank["3b"] = [] }
        bank["3b"]?.append(contentsOf: Self.curatedAddOnQuestions_3b)

        if bank["3c"] == nil { bank["3c"] = [] }
        bank["3c"]?.append(contentsOf: Self.curatedAddOnQuestions_3c)
    }
}
