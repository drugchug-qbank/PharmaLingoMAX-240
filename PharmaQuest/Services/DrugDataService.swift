import Foundation

struct DrugDataService {
    static let shared = DrugDataService()

    let modules: [DrugModule]
    private let questionBank: [String: [Question]]

    private init() {
        let m1Sub1a = Subsection(
            id: "1a", moduleId: "m1", code: "1a",
            title: "ACE Inhibitors & ARBs",
            description: "Master the -pril and -sartan drug classes",
            iconName: "heart.fill",
            drugs: [
                Drug(id: "d1", genericName: "Lisinopril", brandName: "Zestril/Prinivil", drugClass: "ACE Inhibitor", suffix: "-pril", indications: ["HTN", "HF", "Post-MI", "Diabetic nephropathy"], sideEffects: ["Dry cough", "Hyperkalemia", "Angioedema", "Dizziness"], clinicalPearls: ["Most prescribed ACE inhibitor", "Monitor K+ and SCr"]),
                Drug(id: "d2", genericName: "Enalapril", brandName: "Vasotec", drugClass: "ACE Inhibitor", suffix: "-pril", indications: ["HTN", "HF"], sideEffects: ["Dry cough", "Hyperkalemia", "Angioedema"], clinicalPearls: ["Available as IV (enalaprilat)", "Prodrug - converted to enalaprilat"]),
                Drug(id: "d3", genericName: "Ramipril", brandName: "Altace", drugClass: "ACE Inhibitor", suffix: "-pril", indications: ["HTN", "HF", "CV risk reduction"], sideEffects: ["Dry cough", "Hyperkalemia"], clinicalPearls: ["HOPE trial - CV risk reduction", "Used post-MI"]),
                Drug(id: "d4", genericName: "Benazepril", brandName: "Lotensin", drugClass: "ACE Inhibitor", suffix: "-pril", indications: ["HTN"], sideEffects: ["Dry cough", "Hyperkalemia"], clinicalPearls: ["Often combined with amlodipine (Lotrel)"]),
                Drug(id: "d5", genericName: "Losartan", brandName: "Cozaar", drugClass: "ARB", suffix: "-sartan", indications: ["HTN", "Diabetic nephropathy", "Stroke prevention"], sideEffects: ["Hyperkalemia", "Dizziness"], clinicalPearls: ["Uricosuric effect (lowers uric acid)", "First ARB approved"]),
                Drug(id: "d6", genericName: "Valsartan", brandName: "Diovan", drugClass: "ARB", suffix: "-sartan", indications: ["HTN", "HF", "Post-MI"], sideEffects: ["Hyperkalemia", "Hypotension"], clinicalPearls: ["Component of Entresto (sacubitril/valsartan)", "No prodrug conversion needed"]),
                Drug(id: "d7", genericName: "Irbesartan", brandName: "Avapro", drugClass: "ARB", suffix: "-sartan", indications: ["HTN", "Diabetic nephropathy"], sideEffects: ["Hyperkalemia", "Dizziness"], clinicalPearls: ["Strong evidence for nephroprotection in T2DM"]),
                Drug(id: "d8", genericName: "Olmesartan", brandName: "Benicar", drugClass: "ARB", suffix: "-sartan", indications: ["HTN"], sideEffects: ["Hyperkalemia", "Sprue-like enteropathy"], clinicalPearls: ["Unique side effect: sprue-like enteropathy (diarrhea, weight loss)"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1a_1", title: "ACE Inhibitors: The -pril Family", content: "ACE inhibitors block angiotensin-converting enzyme, reducing angiotensin II production. This decreases blood pressure and reduces cardiac workload.", bulletPoints: ["All end in suffix -pril", "First-line for HTN, HF, diabetic nephropathy", "Unique side effect: dry cough (due to bradykinin accumulation)", "Black Box Warning: Contraindicated in pregnancy"], highlightText: "Remember: -pril = ACE Inhibitor"),
                LearningSlide(id: "ls1a_2", title: "ARBs: The -sartan Family", content: "ARBs block the angiotensin II receptor directly. They provide similar benefits to ACE inhibitors but WITHOUT the dry cough.", bulletPoints: ["All end in suffix -sartan", "Alternative when ACE inhibitor cough occurs", "Also contraindicated in pregnancy", "Do NOT combine ACE + ARB (increased adverse effects)"], highlightText: "Remember: -sartan = ARB"),
                LearningSlide(id: "ls1a_3", title: "Key Monitoring & Pearls", content: "Both ACE inhibitors and ARBs require monitoring of potassium and renal function.", bulletPoints: ["Monitor: serum potassium (risk of hyperkalemia)", "Monitor: serum creatinine / BUN", "Hold if bilateral renal artery stenosis", "Losartan has unique uricosuric effect"], highlightText: "Both classes: Monitor K+ and renal function"),
            ]
        )

        let m1Sub1b = Subsection(
            id: "1b", moduleId: "m1", code: "1b",
            title: "Thiazide & Loop Diuretics",
            description: "Diuretics for HTN and fluid overload",
            iconName: "drop.fill",
            drugs: [
                Drug(id: "d9", genericName: "Hydrochlorothiazide", brandName: "Microzide", drugClass: "Thiazide Diuretic", suffix: "-thiazide", indications: ["HTN", "Edema"], sideEffects: ["Hypokalemia", "Hyperuricemia", "Hypercalcemia", "Hyperglycemia"], clinicalPearls: ["Most commonly used thiazide", "Causes HyperGLUC: Glucose, Lipids, Uric acid, Calcium"]),
                Drug(id: "d10", genericName: "Chlorthalidone", brandName: "Thalitone", drugClass: "Thiazide-like Diuretic", suffix: "", indications: ["HTN"], sideEffects: ["Hypokalemia", "Hyponatremia"], clinicalPearls: ["Longer half-life than HCTZ", "Preferred thiazide per guidelines (ALLHAT trial)"]),
                Drug(id: "d11", genericName: "Furosemide", brandName: "Lasix", drugClass: "Loop Diuretic", suffix: "-semide", indications: ["Edema", "HF", "Acute pulmonary edema"], sideEffects: ["Hypokalemia", "Ototoxicity", "Hypocalcemia", "Dehydration"], clinicalPearls: ["Most potent diuretic class", "Works on Loop of Henle", "IV for acute decompensated HF"]),
                Drug(id: "d12", genericName: "Bumetanide", brandName: "Bumex", drugClass: "Loop Diuretic", suffix: "", indications: ["Edema", "HF"], sideEffects: ["Hypokalemia", "Ototoxicity"], clinicalPearls: ["40x more potent than furosemide mg-for-mg", "1 mg bumetanide ≈ 40 mg furosemide"]),
                Drug(id: "d13", genericName: "Torsemide", brandName: "Demadex", drugClass: "Loop Diuretic", suffix: "", indications: ["Edema", "HF"], sideEffects: ["Hypokalemia", "Ototoxicity"], clinicalPearls: ["Best oral bioavailability of loop diuretics", "Longest acting loop diuretic"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1b_1", title: "Thiazide Diuretics", content: "Thiazides work on the distal convoluted tubule (DCT). They are first-line for hypertension.", bulletPoints: ["Block Na+/Cl- cotransporter in DCT", "First-line for uncomplicated HTN", "Cause HyperGLUC: Glucose↑, Lipids↑, Uric acid↑, Calcium↑", "Cause HypoKalemia and HypoNatremia"], highlightText: "Thiazides: HyperGLUC + HypoK+"),
                LearningSlide(id: "ls1b_2", title: "Loop Diuretics", content: "Loop diuretics are the most potent diuretics. They work on the thick ascending loop of Henle.", bulletPoints: ["Block Na+/K+/2Cl- transporter in loop of Henle", "Used for edema, HF, acute pulmonary edema", "OPPOSITE of thiazides: cause HYPOcalcemia", "Risk of ototoxicity (especially with aminoglycosides)"], highlightText: "Loops LOSE calcium (hypocalcemia)"),
            ]
        )

        let m1Sub1c = Subsection(
            id: "1c", moduleId: "m1", code: "1c",
            title: "Beta Blockers",
            description: "Beta blockers for HTN, HF, and CAD",
            iconName: "bolt.heart.fill",
            drugs: [
                Drug(id: "d14", genericName: "Metoprolol succinate", brandName: "Toprol XL", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "HF (HFrEF)", "Angina"], sideEffects: ["Bradycardia", "Fatigue", "Depression", "Bronchospasm"], clinicalPearls: ["Succinate = extended release for HF", "One of 3 beta blockers proven for HFrEF"]),
                Drug(id: "d15", genericName: "Metoprolol tartrate", brandName: "Lopressor", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "Acute MI", "Rate control"], sideEffects: ["Bradycardia", "Fatigue"], clinicalPearls: ["Tartrate = immediate release, BID dosing", "Used acutely post-MI"]),
                Drug(id: "d16", genericName: "Carvedilol", brandName: "Coreg", drugClass: "Non-selective Beta + Alpha Blocker", suffix: "-olol", indications: ["HF (HFrEF)", "HTN"], sideEffects: ["Bradycardia", "Hypotension", "Dizziness"], clinicalPearls: ["Alpha + Beta blocker (vasodilating)", "One of 3 beta blockers proven for HFrEF", "Take with food to slow absorption"]),
                Drug(id: "d17", genericName: "Atenolol", brandName: "Tenormin", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "Angina"], sideEffects: ["Bradycardia", "Fatigue"], clinicalPearls: ["Renally eliminated", "Less lipophilic (fewer CNS effects)"]),
                Drug(id: "d18", genericName: "Propranolol", brandName: "Inderal", drugClass: "Non-selective Beta Blocker", suffix: "-olol", indications: ["HTN", "Tremor", "Migraine prophylaxis", "Performance anxiety"], sideEffects: ["Bradycardia", "Bronchospasm", "Mask hypoglycemia"], clinicalPearls: ["Non-selective: blocks B1 and B2", "Can mask hypoglycemia symptoms in diabetics", "Avoid in asthma/COPD"]),
                Drug(id: "d19", genericName: "Bisoprolol", brandName: "Zebeta", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "HF (HFrEF)"], sideEffects: ["Bradycardia", "Fatigue"], clinicalPearls: ["Third beta blocker proven for HFrEF (with metoprolol succinate and carvedilol)", "Most beta-1 selective"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1c_1", title: "Beta Blockers: The -olol Family", content: "Beta blockers reduce heart rate, contractility, and blood pressure by blocking beta-adrenergic receptors.", bulletPoints: ["All end in suffix -olol", "Selective (B1 only): metoprolol, atenolol, bisoprolol", "Non-selective (B1+B2): propranolol, carvedilol", "Three proven for HFrEF: metoprolol succinate, carvedilol, bisoprolol"], highlightText: "Remember: -olol = Beta Blocker"),
                LearningSlide(id: "ls1c_2", title: "Selective vs Non-Selective", content: "Beta-1 receptors are in the heart. Beta-2 receptors are in the lungs and vasculature.", bulletPoints: ["B1 selective = safer in asthma/COPD", "Non-selective can cause bronchospasm", "Propranolol can mask hypoglycemia in diabetics", "Carvedilol also blocks alpha receptors (vasodilation)"], highlightText: "B1 = Heart, B2 = Lungs"),
            ]
        )

        let m1Sub1d = Subsection(
            id: "1d", moduleId: "m1", code: "1d",
            title: "MRAs & ARNI",
            description: "Spironolactone, Eplerenone, and Entresto",
            iconName: "staroflife.fill",
            drugs: [
                Drug(id: "d20", genericName: "Spironolactone", brandName: "Aldactone", drugClass: "Mineralocorticoid Receptor Antagonist", suffix: "", indications: ["HF", "Resistant HTN", "Ascites", "Hyperaldosteronism"], sideEffects: ["Hyperkalemia", "Gynecomastia", "Menstrual irregularities"], clinicalPearls: ["Potassium-SPARING diuretic", "Gynecomastia due to anti-androgen effects", "RALES trial: mortality benefit in HFrEF"]),
                Drug(id: "d21", genericName: "Eplerenone", brandName: "Inspra", drugClass: "Mineralocorticoid Receptor Antagonist", suffix: "", indications: ["HF", "HTN"], sideEffects: ["Hyperkalemia"], clinicalPearls: ["More selective than spironolactone", "Less gynecomastia risk", "EPHESUS trial: post-MI HF benefit"]),
                Drug(id: "d22", genericName: "Sacubitril/Valsartan", brandName: "Entresto", drugClass: "ARNI (Neprilysin Inhibitor + ARB)", suffix: "", indications: ["HFrEF"], sideEffects: ["Hypotension", "Hyperkalemia", "Angioedema"], clinicalPearls: ["PARADIGM-HF trial: superior to enalapril for HFrEF", "36-hour washout from ACE inhibitor before starting", "Do NOT combine with ACE inhibitor (angioedema risk)"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1d_1", title: "MRAs: Potassium-Sparing Diuretics", content: "MRAs block aldosterone receptors, leading to sodium excretion while retaining potassium.", bulletPoints: ["Spironolactone and eplerenone", "SPARING = they spare potassium (risk of hyperkalemia)", "Monitor potassium closely", "Spironolactone: gynecomastia (anti-androgen effects)"], highlightText: "MRAs SPARE potassium - watch for hyperkalemia!"),
                LearningSlide(id: "ls1d_2", title: "ARNI: Entresto", content: "Sacubitril/Valsartan (Entresto) combines a neprilysin inhibitor with an ARB for HFrEF.", bulletPoints: ["Sacubitril inhibits neprilysin → increases natriuretic peptides", "Valsartan blocks angiotensin II receptor", "MUST have 36-hour washout from ACE inhibitor", "NEVER combine with ACE inhibitor"], highlightText: "Entresto: 36-hour ACE washout required"),
            ]
        )

        let m1Sub1e = Subsection(
            id: "1e", moduleId: "m1", code: "1e",
            title: "Calcium Channel Blockers",
            description: "Dihydropyridines and Non-dihydropyridines",
            iconName: "waveform.path.ecg",
            drugs: [
                Drug(id: "d23", genericName: "Amlodipine", brandName: "Norvasc", drugClass: "DHP CCB", suffix: "-dipine", indications: ["HTN", "Angina"], sideEffects: ["Peripheral edema", "Flushing", "Headache"], clinicalPearls: ["Most commonly prescribed CCB", "Long half-life, once daily", "Edema is dose-dependent"]),
                Drug(id: "d24", genericName: "Nifedipine", brandName: "Procardia", drugClass: "DHP CCB", suffix: "-dipine", indications: ["HTN", "Angina", "Raynaud's"], sideEffects: ["Peripheral edema", "Flushing", "Reflex tachycardia"], clinicalPearls: ["Extended release preferred (Procardia XL)", "IR formulation can cause dangerous reflex tachycardia"]),
                Drug(id: "d25", genericName: "Diltiazem", brandName: "Cardizem", drugClass: "Non-DHP CCB", suffix: "", indications: ["HTN", "Angina", "Rate control (AFib)"], sideEffects: ["Bradycardia", "Constipation", "Edema"], clinicalPearls: ["Non-DHP: affects heart rate AND blood vessels", "Can be used for rate control in AFib", "Avoid combining with beta blockers (severe bradycardia)"]),
                Drug(id: "d26", genericName: "Verapamil", brandName: "Calan", drugClass: "Non-DHP CCB", suffix: "", indications: ["HTN", "Angina", "SVT", "Rate control"], sideEffects: ["Bradycardia", "Constipation", "Heart block"], clinicalPearls: ["Most cardiac-selective non-DHP CCB", "Significant constipation side effect", "Avoid with beta blockers"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1e_1", title: "CCBs: Two Subclasses", content: "Calcium channel blockers have two important subclasses with very different effects.", bulletPoints: ["DHP (dihydropyridines): end in -dipine, mainly vasodilate", "Non-DHP: diltiazem and verapamil, affect heart rate", "DHPs: cause reflex tachycardia, peripheral edema", "Non-DHPs: cause bradycardia, constipation"], highlightText: "DHP = -dipine = Vessels | Non-DHP = Heart"),
            ]
        )

        let m1Mastery = Subsection(
            id: "1f", moduleId: "m1", code: "1f",
            title: "Mastery: Cardiovascular I",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module1 = DrugModule(
            id: "m1", number: 1,
            title: "Cardiovascular I",
            subtitle: "HTN & HF Workhorses",
            iconName: "heart.fill",
            accentColorHex: "E53935",
            subsections: [m1Sub1a, m1Sub1b, m1Sub1c, m1Sub1d, m1Sub1e, m1Mastery]
        )

        let module2 = DrugModule(
            id: "m2", number: 2,
            title: "Cardiovascular II",
            subtitle: "Lipids & Thrombosis",
            iconName: "drop.triangle.fill",
            accentColorHex: "1565C0",
            subsections: [
                Subsection(id: "2a", moduleId: "m2", code: "2a", title: "Statins", description: "HMG-CoA Reductase Inhibitors", iconName: "chart.line.downtrend.xyaxis", drugs: [], isMasteryQuiz: false, learningSlides: []),
                Subsection(id: "2b", moduleId: "m2", code: "2b", title: "Non-Statin Lipid Agents", description: "Ezetimibe, PCSK9 inhibitors, and more", iconName: "pill.fill", drugs: [], isMasteryQuiz: false, learningSlides: []),
                Subsection(id: "2c", moduleId: "m2", code: "2c", title: "Antiplatelets", description: "Aspirin, Clopidogrel, and more", iconName: "bandage.fill", drugs: [], isMasteryQuiz: false, learningSlides: []),
            ]
        )

        let module3 = DrugModule(
            id: "m3", number: 3,
            title: "Endocrine & Diabetes",
            subtitle: "Insulin, Metformin & More",
            iconName: "syringe.fill",
            accentColorHex: "6A1B9A",
            subsections: [
                Subsection(id: "3a", moduleId: "m3", code: "3a", title: "Insulin Overview", description: "Basal & Bolus insulin types", iconName: "syringe.fill", drugs: [], isMasteryQuiz: false, learningSlides: []),
            ]
        )

        self.modules = [module1, module2, module3]

        var bank: [String: [Question]] = [:]

        bank["1a"] = [
            .trueFalse(id: "q1a_1", subsectionId: "1a", question: "ACE inhibitors end in the suffix -pril.", answer: true, explanation: "All ACE inhibitors end in -pril (e.g., lisinopril, enalapril, ramipril)."),
            .fillBlank(id: "q1a_2", subsectionId: "1a", question: "All ACE inhibitors end in _____.", options: ["-pril", "-sartan", "-olol", "-dipine"], answer: "-pril", explanation: "The -pril suffix identifies ACE inhibitors."),
            .multipleChoice(id: "q1a_3", subsectionId: "1a", question: "Which side effect is unique to ACE inhibitors compared to ARBs?", options: ["Dry cough", "Hyperkalemia", "Dizziness", "Hypotension"], answer: "Dry cough", explanation: "Dry cough is caused by bradykinin accumulation, unique to ACE inhibitors. ARBs don't cause this."),
            .trueFalse(id: "q1a_4", subsectionId: "1a", question: "Losartan is an ACE inhibitor.", answer: false, explanation: "Losartan is an ARB (angiotensin receptor blocker). It ends in -sartan, not -pril."),
            .multipleChoice(id: "q1a_5", subsectionId: "1a", question: "What is the brand name of lisinopril?", options: ["Zestril", "Cozaar", "Diovan", "Norvasc"], answer: "Zestril", explanation: "Lisinopril is sold as Zestril or Prinivil."),
            .fillBlank(id: "q1a_6", subsectionId: "1a", question: "The brand name of losartan is _____.", options: ["Cozaar", "Zestril", "Vasotec", "Altace"], answer: "Cozaar", explanation: "Losartan's brand name is Cozaar."),
            .multipleChoice(id: "q1a_7", subsectionId: "1a", question: "Both ACE inhibitors and ARBs are contraindicated in:", options: ["Pregnancy", "Diabetes", "COPD", "Anemia"], answer: "Pregnancy", explanation: "Both ACE inhibitors and ARBs carry a Black Box Warning for use in pregnancy due to fetal harm."),
            .selectAll(id: "q1a_8", subsectionId: "1a", question: "Select ALL ACE inhibitors:", options: ["Lisinopril", "Losartan", "Enalapril", "Valsartan", "Ramipril"], correctAnswers: ["Lisinopril", "Enalapril", "Ramipril"], explanation: "Lisinopril, enalapril, and ramipril end in -pril (ACE inhibitors). Losartan and valsartan are ARBs."),
            .matching(id: "q1a_9", subsectionId: "1a", question: "Match each generic name to its brand name:", pairs: [MatchingPair(left: "Lisinopril", right: "Zestril"), MatchingPair(left: "Losartan", right: "Cozaar"), MatchingPair(left: "Enalapril", right: "Vasotec"), MatchingPair(left: "Valsartan", right: "Diovan")], explanation: "Key brand-generic pairs for ACE inhibitors and ARBs."),
            .multipleChoice(id: "q1a_10", subsectionId: "1a", question: "A patient on an ACE inhibitor develops a persistent dry cough. The best alternative is:", options: ["An ARB", "A beta blocker", "A thiazide diuretic", "Another ACE inhibitor"], answer: "An ARB", explanation: "ARBs provide similar benefits without the cough. They block the receptor directly rather than inhibiting the enzyme."),
            .trueFalse(id: "q1a_11", subsectionId: "1a", difficulty: .medium, question: "ACE inhibitors and ARBs should be combined for better blood pressure control.", answer: false, explanation: "Combining ACE + ARB increases risk of hyperkalemia, renal failure, and hypotension without added benefit. This is NOT recommended."),
            .multipleChoice(id: "q1a_12", subsectionId: "1a", question: "Which ARB has a unique uricosuric (uric acid-lowering) effect?", options: ["Losartan", "Valsartan", "Irbesartan", "Olmesartan"], answer: "Losartan", explanation: "Losartan uniquely lowers uric acid levels, making it beneficial in patients with gout."),
        ]

        bank["1b"] = [
            .trueFalse(id: "q1b_1", subsectionId: "1b", question: "Thiazide diuretics cause hypokalemia.", answer: true, explanation: "Thiazides increase potassium excretion, leading to hypokalemia. Monitor K+ levels."),
            .fillBlank(id: "q1b_2", subsectionId: "1b", question: "The brand name of furosemide is _____.", options: ["Lasix", "Bumex", "Microzide", "Aldactone"], answer: "Lasix", explanation: "Furosemide is sold as Lasix - the most commonly used loop diuretic."),
            .multipleChoice(id: "q1b_3", subsectionId: "1b", question: "Which diuretic class is the MOST potent?", options: ["Loop diuretics", "Thiazide diuretics", "Potassium-sparing diuretics", "Osmotic diuretics"], answer: "Loop diuretics", explanation: "Loop diuretics (furosemide, bumetanide) are the most potent, working on the loop of Henle."),
            .trueFalse(id: "q1b_4", subsectionId: "1b", question: "Thiazide diuretics cause hypercalcemia.", answer: true, explanation: "Thiazides increase calcium reabsorption, causing hypercalcemia. Remember: Thiazides keep calcium, loops lose calcium."),
            .multipleChoice(id: "q1b_5", subsectionId: "1b", question: "What is the mnemonic for thiazide metabolic effects?", options: ["HyperGLUC", "HypoGLUC", "SALAD", "MUDPILES"], answer: "HyperGLUC", explanation: "HyperGLUC: Glucose↑, Lipids↑, Uric acid↑, Calcium↑ - the metabolic effects of thiazides."),
            .fillBlank(id: "q1b_6", subsectionId: "1b", question: "Loop diuretics work on the thick ascending _____ of Henle.", options: ["Loop", "Tubule", "Duct", "Cortex"], answer: "Loop", explanation: "Loop diuretics get their name from their site of action: the loop of Henle."),
            .selectAll(id: "q1b_7", subsectionId: "1b", question: "Select ALL loop diuretics:", options: ["Furosemide", "HCTZ", "Bumetanide", "Chlorthalidone", "Torsemide"], correctAnswers: ["Furosemide", "Bumetanide", "Torsemide"], explanation: "Furosemide, bumetanide, and torsemide are loop diuretics. HCTZ and chlorthalidone are thiazides."),
            .multipleChoice(id: "q1b_8", subsectionId: "1b", question: "Which loop diuretic has the BEST oral bioavailability?", options: ["Torsemide", "Furosemide", "Bumetanide", "Ethacrynic acid"], answer: "Torsemide", explanation: "Torsemide has ~80% oral bioavailability vs furosemide's variable 10-100%."),
            .trueFalse(id: "q1b_9", subsectionId: "1b", difficulty: .medium, question: "Loop diuretics cause hypercalcemia.", answer: false, explanation: "Loop diuretics cause HYPOcalcemia (they 'lose' calcium). This is opposite to thiazides."),
            .matching(id: "q1b_10", subsectionId: "1b", question: "Match each diuretic to its brand name:", pairs: [MatchingPair(left: "Furosemide", right: "Lasix"), MatchingPair(left: "Bumetanide", right: "Bumex"), MatchingPair(left: "HCTZ", right: "Microzide"), MatchingPair(left: "Torsemide", right: "Demadex")], explanation: "Key brand-generic pairs for diuretics."),
            .multipleChoice(id: "q1b_11", subsectionId: "1b", difficulty: .hard, question: "1 mg of bumetanide is approximately equivalent to how many mg of furosemide?", options: ["40 mg", "20 mg", "80 mg", "10 mg"], answer: "40 mg", explanation: "Bumetanide is 40x more potent than furosemide. 1 mg bumetanide ≈ 40 mg furosemide."),
            .multipleChoice(id: "q1b_12", subsectionId: "1b", question: "Which thiazide is preferred per the ALLHAT trial guidelines?", options: ["Chlorthalidone", "HCTZ", "Indapamide", "Metolazone"], answer: "Chlorthalidone", explanation: "Chlorthalidone has a longer half-life and stronger outcome data from the ALLHAT trial."),
        ]

        bank["1c"] = [
            .fillBlank(id: "q1c_1", subsectionId: "1c", question: "All beta blockers end in _____.", options: ["-olol", "-pril", "-sartan", "-statin"], answer: "-olol", explanation: "The -olol suffix identifies beta blockers."),
            .trueFalse(id: "q1c_2", subsectionId: "1c", question: "Propranolol is a selective beta-1 blocker.", answer: false, explanation: "Propranolol is NON-selective (blocks both B1 and B2). Selective B1 blockers include metoprolol, atenolol, bisoprolol."),
            .multipleChoice(id: "q1c_3", subsectionId: "1c", question: "Which 3 beta blockers are proven to reduce mortality in HFrEF?", options: ["Metoprolol succinate, carvedilol, bisoprolol", "Metoprolol tartrate, atenolol, propranolol", "Atenolol, carvedilol, propranolol", "Propranolol, bisoprolol, nadolol"], answer: "Metoprolol succinate, carvedilol, bisoprolol", explanation: "Only metoprolol succinate (not tartrate), carvedilol, and bisoprolol have mortality benefit data in HFrEF."),
            .trueFalse(id: "q1c_4", subsectionId: "1c", question: "Carvedilol blocks both beta and alpha receptors.", answer: true, explanation: "Carvedilol is unique: it blocks alpha-1 (vasodilation) + beta-1 + beta-2 receptors."),
            .multipleChoice(id: "q1c_5", subsectionId: "1c", question: "Which beta blocker should be avoided in asthma patients?", options: ["Propranolol", "Metoprolol", "Atenolol", "Bisoprolol"], answer: "Propranolol", explanation: "Non-selective beta blockers like propranolol block B2 receptors in the lungs, causing bronchospasm. B1-selective agents are safer."),
            .fillBlank(id: "q1c_6", subsectionId: "1c", question: "The brand name of carvedilol is _____.", options: ["Coreg", "Lopressor", "Tenormin", "Inderal"], answer: "Coreg", explanation: "Carvedilol is sold as Coreg."),
            .selectAll(id: "q1c_7", subsectionId: "1c", question: "Select ALL beta-1 selective blockers:", options: ["Metoprolol", "Propranolol", "Atenolol", "Carvedilol", "Bisoprolol"], correctAnswers: ["Metoprolol", "Atenolol", "Bisoprolol"], explanation: "Metoprolol, atenolol, and bisoprolol are B1-selective. Propranolol and carvedilol are non-selective."),
            .matching(id: "q1c_8", subsectionId: "1c", question: "Match each beta blocker to its brand name:", pairs: [MatchingPair(left: "Metoprolol ER", right: "Toprol XL"), MatchingPair(left: "Carvedilol", right: "Coreg"), MatchingPair(left: "Atenolol", right: "Tenormin"), MatchingPair(left: "Propranolol", right: "Inderal")], explanation: "Key brand-generic pairs for beta blockers."),
            .multipleChoice(id: "q1c_9", subsectionId: "1c", question: "Metoprolol succinate (Toprol XL) differs from metoprolol tartrate (Lopressor) because:", options: ["Succinate is extended-release for HF", "Tartrate is extended-release", "Succinate is non-selective", "They are identical"], answer: "Succinate is extended-release for HF", explanation: "Metoprolol SUCCINATE (Toprol XL) is ER and approved for HFrEF. Tartrate (Lopressor) is IR, dosed BID."),
            .trueFalse(id: "q1c_10", subsectionId: "1c", difficulty: .medium, question: "Propranolol can mask symptoms of hypoglycemia in diabetic patients.", answer: true, explanation: "Non-selective beta blockers can mask tachycardia and tremor symptoms of hypoglycemia. Sweating is NOT masked."),
            .multipleChoice(id: "q1c_11", subsectionId: "1c", question: "Carvedilol should be taken:", options: ["With food", "On an empty stomach", "At bedtime only", "With grapefruit juice"], answer: "With food", explanation: "Carvedilol should be taken with food to slow absorption and reduce risk of orthostatic hypotension."),
        ]

        bank["1d"] = [
            .trueFalse(id: "q1d_1", subsectionId: "1d", question: "Spironolactone is a potassium-sparing diuretic.", answer: true, explanation: "Spironolactone blocks aldosterone, causing sodium excretion while RETAINING potassium."),
            .multipleChoice(id: "q1d_2", subsectionId: "1d", question: "Which side effect is associated with spironolactone but NOT eplerenone?", options: ["Gynecomastia", "Hyperkalemia", "Hypotension", "Headache"], answer: "Gynecomastia", explanation: "Spironolactone has anti-androgen effects causing gynecomastia. Eplerenone is more selective and avoids this."),
            .fillBlank(id: "q1d_3", subsectionId: "1d", question: "Before starting Entresto, a patient must have a ___-hour washout from ACE inhibitors.", options: ["36", "24", "12", "48"], answer: "36", explanation: "A mandatory 36-hour washout from ACE inhibitors is required before starting Entresto to prevent angioedema."),
            .trueFalse(id: "q1d_4", subsectionId: "1d", question: "Entresto can be safely combined with an ACE inhibitor.", answer: false, explanation: "NEVER combine Entresto with ACE inhibitors - this dramatically increases angioedema risk."),
            .multipleChoice(id: "q1d_5", subsectionId: "1d", question: "What landmark trial proved Entresto's superiority over enalapril in HFrEF?", options: ["PARADIGM-HF", "ALLHAT", "HOPE", "RALES"], answer: "PARADIGM-HF", explanation: "PARADIGM-HF showed sacubitril/valsartan (Entresto) was superior to enalapril for reducing death and hospitalization in HFrEF."),
            .fillBlank(id: "q1d_6", subsectionId: "1d", question: "The brand name of spironolactone is _____.", options: ["Aldactone", "Inspra", "Entresto", "Coreg"], answer: "Aldactone", explanation: "Spironolactone is sold as Aldactone."),
            .multipleChoice(id: "q1d_7", subsectionId: "1d", question: "Entresto contains sacubitril combined with:", options: ["Valsartan", "Losartan", "Lisinopril", "Enalapril"], answer: "Valsartan", explanation: "Entresto = sacubitril (neprilysin inhibitor) + valsartan (ARB)."),
            .selectAll(id: "q1d_8", subsectionId: "1d", question: "Select ALL that require potassium monitoring:", options: ["Spironolactone", "Eplerenone", "Entresto", "Amlodipine"], correctAnswers: ["Spironolactone", "Eplerenone", "Entresto"], explanation: "All three can cause hyperkalemia. Amlodipine (CCB) does not significantly affect potassium."),
            .trueFalse(id: "q1d_9", subsectionId: "1d", difficulty: .medium, question: "The RALES trial showed mortality benefit with spironolactone in HFrEF.", answer: true, explanation: "RALES demonstrated a 30% reduction in mortality with spironolactone added to standard HF therapy."),
            .matching(id: "q1d_10", subsectionId: "1d", question: "Match each drug to its landmark trial:", pairs: [MatchingPair(left: "Spironolactone", right: "RALES"), MatchingPair(left: "Eplerenone", right: "EPHESUS"), MatchingPair(left: "Entresto", right: "PARADIGM-HF")], explanation: "Key clinical trials for MRAs and ARNI."),
        ]

        bank["1e"] = [
            .fillBlank(id: "q1e_1", subsectionId: "1e", question: "Dihydropyridine CCBs end in the suffix _____.", options: ["-dipine", "-olol", "-sartan", "-pril"], answer: "-dipine", explanation: "DHP CCBs all end in -dipine (amlodipine, nifedipine, etc.)."),
            .trueFalse(id: "q1e_2", subsectionId: "1e", question: "Verapamil and diltiazem are dihydropyridine CCBs.", answer: false, explanation: "Verapamil and diltiazem are NON-dihydropyridine CCBs. They affect heart rate and contractility."),
            .multipleChoice(id: "q1e_3", subsectionId: "1e", question: "Which CCB is most commonly prescribed for HTN?", options: ["Amlodipine", "Verapamil", "Diltiazem", "Nifedipine"], answer: "Amlodipine", explanation: "Amlodipine (Norvasc) is the most prescribed CCB due to its long half-life and once-daily dosing."),
            .trueFalse(id: "q1e_4", subsectionId: "1e", question: "Non-DHP CCBs should be avoided with beta blockers.", answer: true, explanation: "Combining non-DHP CCBs with beta blockers can cause severe bradycardia and heart block."),
            .multipleChoice(id: "q1e_5", subsectionId: "1e", question: "Which CCB is known for causing significant constipation?", options: ["Verapamil", "Amlodipine", "Nifedipine", "Felodipine"], answer: "Verapamil", explanation: "Verapamil commonly causes constipation. This is a high-yield side effect to remember."),
            .fillBlank(id: "q1e_6", subsectionId: "1e", question: "The brand name of amlodipine is _____.", options: ["Norvasc", "Cardizem", "Calan", "Procardia"], answer: "Norvasc", explanation: "Amlodipine is sold as Norvasc."),
            .selectAll(id: "q1e_7", subsectionId: "1e", question: "Select ALL non-DHP CCBs:", options: ["Diltiazem", "Amlodipine", "Verapamil", "Nifedipine"], correctAnswers: ["Diltiazem", "Verapamil"], explanation: "Diltiazem and verapamil are the two non-DHP CCBs. Amlodipine and nifedipine end in -dipine (DHP)."),
            .matching(id: "q1e_8", subsectionId: "1e", question: "Match each CCB to its brand name:", pairs: [MatchingPair(left: "Amlodipine", right: "Norvasc"), MatchingPair(left: "Diltiazem", right: "Cardizem"), MatchingPair(left: "Verapamil", right: "Calan"), MatchingPair(left: "Nifedipine", right: "Procardia")], explanation: "Key brand-generic pairs for calcium channel blockers."),
            .multipleChoice(id: "q1e_9", subsectionId: "1e", difficulty: .hard, question: "DHP CCBs primarily cause peripheral edema because they:", options: ["Dilate arterioles more than venules", "Increase sodium retention", "Cause heart failure", "Block calcium in kidneys"], answer: "Dilate arterioles more than venules", explanation: "DHPs preferentially dilate arterioles, increasing capillary hydrostatic pressure and causing dependent edema."),
            .multipleChoice(id: "q1e_10", subsectionId: "1e", question: "Which CCB can be used to control heart rate in atrial fibrillation?", options: ["Diltiazem", "Amlodipine", "Nifedipine", "Felodipine"], answer: "Diltiazem", explanation: "Non-DHP CCBs (diltiazem, verapamil) slow AV conduction and can be used for rate control in AFib."),
        ]

        bank["1f"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key != "1f" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        self.questionBank = bank
    }

    func questions(for subsectionId: String) -> [Question] {
        questionBank[subsectionId] ?? []
    }

    func questionsForQuiz(subsectionId: String, completedSubsections: Set<String>, count: Int = 12) -> [Question] {
        var quizQuestions = questions(for: subsectionId).shuffled()

        let reviewSubsections = completedSubsections.filter { $0 != subsectionId }
        if !reviewSubsections.isEmpty {
            let reviewCount = Int.random(in: 2...4)
            var reviewQuestions: [Question] = []
            for reviewId in reviewSubsections.shuffled() {
                let available = questions(for: reviewId).shuffled()
                reviewQuestions.append(contentsOf: available.prefix(2))
            }
            quizQuestions.append(contentsOf: reviewQuestions.shuffled().prefix(reviewCount))
        }

        return Array(quizQuestions.prefix(count)).shuffled()
    }

    func module(for id: String) -> DrugModule? {
        modules.first { $0.id == id }
    }

    func subsection(for id: String) -> Subsection? {
        modules.flatMap(\.subsections).first { $0.id == id }
    }
}
