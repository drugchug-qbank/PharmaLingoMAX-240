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
                LearningSlide(id: "ls1a_1", title: "ACE Inhibitors: The -pril Family", content: "ACE inhibitors block angiotensin-converting enzyme, reducing angiotensin II production.", bulletPoints: ["All end in suffix -pril", "First-line for HTN, HF, diabetic nephropathy", "Unique side effect: dry cough (bradykinin)", "Black Box Warning: Contraindicated in pregnancy"], highlightText: "Remember: -pril = ACE Inhibitor"),
                LearningSlide(id: "ls1a_2", title: "ARBs: The -sartan Family", content: "ARBs block the angiotensin II receptor directly. Similar benefits to ACE inhibitors but WITHOUT the dry cough.", bulletPoints: ["All end in suffix -sartan", "Alternative when ACE inhibitor cough occurs", "Also contraindicated in pregnancy", "Do NOT combine ACE + ARB"], highlightText: "Remember: -sartan = ARB"),
                LearningSlide(id: "ls1a_3", title: "Key Monitoring & Pearls", content: "Both ACE inhibitors and ARBs require monitoring of potassium and renal function.", bulletPoints: ["Monitor: serum potassium (risk of hyperkalemia)", "Monitor: serum creatinine / BUN", "Hold if bilateral renal artery stenosis", "Losartan has unique uricosuric effect"], highlightText: "Both classes: Monitor K+ and renal function"),
            ]
        )

        let m1Sub1b = Subsection(
            id: "1b", moduleId: "m1", code: "1b",
            title: "Thiazide & Loop Diuretics",
            description: "Diuretics for HTN and fluid overload",
            iconName: "drop.fill",
            drugs: [
                Drug(id: "d9", genericName: "Hydrochlorothiazide", brandName: "Microzide", drugClass: "Thiazide Diuretic", suffix: "-thiazide", indications: ["HTN", "Edema"], sideEffects: ["Hypokalemia", "Hyperuricemia", "Hypercalcemia", "Hyperglycemia"], clinicalPearls: ["Most commonly used thiazide", "Causes HyperGLUC"]),
                Drug(id: "d10", genericName: "Chlorthalidone", brandName: "Thalitone", drugClass: "Thiazide-like Diuretic", suffix: "", indications: ["HTN"], sideEffects: ["Hypokalemia", "Hyponatremia"], clinicalPearls: ["Longer half-life than HCTZ", "Preferred per ALLHAT trial"]),
                Drug(id: "d11", genericName: "Furosemide", brandName: "Lasix", drugClass: "Loop Diuretic", suffix: "-semide", indications: ["Edema", "HF", "Acute pulmonary edema"], sideEffects: ["Hypokalemia", "Ototoxicity", "Hypocalcemia", "Dehydration"], clinicalPearls: ["Most potent diuretic class", "IV for acute decompensated HF"]),
                Drug(id: "d12", genericName: "Bumetanide", brandName: "Bumex", drugClass: "Loop Diuretic", suffix: "", indications: ["Edema", "HF"], sideEffects: ["Hypokalemia", "Ototoxicity"], clinicalPearls: ["40x more potent than furosemide mg-for-mg"]),
                Drug(id: "d13", genericName: "Torsemide", brandName: "Demadex", drugClass: "Loop Diuretic", suffix: "", indications: ["Edema", "HF"], sideEffects: ["Hypokalemia", "Ototoxicity"], clinicalPearls: ["Best oral bioavailability of loop diuretics"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1b_1", title: "Thiazide Diuretics", content: "Thiazides work on the distal convoluted tubule (DCT). First-line for hypertension.", bulletPoints: ["Block Na+/Cl- cotransporter in DCT", "Cause HyperGLUC: Glucose, Lipids, Uric acid, Calcium", "Cause HypoKalemia and HypoNatremia"], highlightText: "Thiazides: HyperGLUC + HypoK+"),
                LearningSlide(id: "ls1b_2", title: "Loop Diuretics", content: "Loop diuretics are the most potent diuretics. They work on the thick ascending loop of Henle.", bulletPoints: ["Block Na+/K+/2Cl- transporter in loop of Henle", "OPPOSITE of thiazides: cause HYPOcalcemia", "Risk of ototoxicity (especially with aminoglycosides)"], highlightText: "Loops LOSE calcium (hypocalcemia)"),
            ]
        )

        let m1Sub1c = Subsection(
            id: "1c", moduleId: "m1", code: "1c",
            title: "Beta Blockers",
            description: "Beta blockers for HTN, HF, and CAD",
            iconName: "bolt.heart.fill",
            drugs: [
                Drug(id: "d14", genericName: "Metoprolol succinate", brandName: "Toprol XL", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "HF (HFrEF)", "Angina"], sideEffects: ["Bradycardia", "Fatigue", "Depression"], clinicalPearls: ["Succinate = extended release for HF"]),
                Drug(id: "d15", genericName: "Metoprolol tartrate", brandName: "Lopressor", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "Acute MI", "Rate control"], sideEffects: ["Bradycardia", "Fatigue"], clinicalPearls: ["Tartrate = immediate release, BID dosing"]),
                Drug(id: "d16", genericName: "Carvedilol", brandName: "Coreg", drugClass: "Non-selective Beta + Alpha Blocker", suffix: "-olol", indications: ["HF (HFrEF)", "HTN"], sideEffects: ["Bradycardia", "Hypotension", "Dizziness"], clinicalPearls: ["Alpha + Beta blocker", "Take with food"]),
                Drug(id: "d17", genericName: "Atenolol", brandName: "Tenormin", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "Angina"], sideEffects: ["Bradycardia", "Fatigue"], clinicalPearls: ["Renally eliminated"]),
                Drug(id: "d18", genericName: "Propranolol", brandName: "Inderal", drugClass: "Non-selective Beta Blocker", suffix: "-olol", indications: ["HTN", "Tremor", "Migraine prophylaxis"], sideEffects: ["Bradycardia", "Bronchospasm", "Mask hypoglycemia"], clinicalPearls: ["Non-selective: blocks B1 and B2", "Avoid in asthma/COPD"]),
                Drug(id: "d19", genericName: "Bisoprolol", brandName: "Zebeta", drugClass: "Selective Beta-1 Blocker", suffix: "-olol", indications: ["HTN", "HF (HFrEF)"], sideEffects: ["Bradycardia", "Fatigue"], clinicalPearls: ["Most beta-1 selective"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1c_1", title: "Beta Blockers: The -olol Family", content: "Beta blockers reduce heart rate, contractility, and blood pressure.", bulletPoints: ["All end in suffix -olol", "Selective (B1): metoprolol, atenolol, bisoprolol", "Non-selective (B1+B2): propranolol, carvedilol", "Three proven for HFrEF: metoprolol succinate, carvedilol, bisoprolol"], highlightText: "-olol = Beta Blocker"),
                LearningSlide(id: "ls1c_2", title: "Selective vs Non-Selective", content: "Beta-1 receptors are in the heart. Beta-2 receptors are in the lungs.", bulletPoints: ["B1 selective = safer in asthma/COPD", "Non-selective can cause bronchospasm", "Propranolol can mask hypoglycemia in diabetics"], highlightText: "B1 = Heart, B2 = Lungs"),
            ]
        )

        let m1Sub1d = Subsection(
            id: "1d", moduleId: "m1", code: "1d",
            title: "MRAs & ARNI",
            description: "Spironolactone, Eplerenone, and Entresto",
            iconName: "staroflife.fill",
            drugs: [
                Drug(id: "d20", genericName: "Spironolactone", brandName: "Aldactone", drugClass: "MRA", suffix: "", indications: ["HF", "Resistant HTN", "Ascites"], sideEffects: ["Hyperkalemia", "Gynecomastia"], clinicalPearls: ["Potassium-SPARING diuretic", "RALES trial"]),
                Drug(id: "d21", genericName: "Eplerenone", brandName: "Inspra", drugClass: "MRA", suffix: "", indications: ["HF", "HTN"], sideEffects: ["Hyperkalemia"], clinicalPearls: ["More selective, less gynecomastia", "EPHESUS trial"]),
                Drug(id: "d22", genericName: "Sacubitril/Valsartan", brandName: "Entresto", drugClass: "ARNI", suffix: "", indications: ["HFrEF"], sideEffects: ["Hypotension", "Hyperkalemia", "Angioedema"], clinicalPearls: ["PARADIGM-HF trial", "36-hour ACE washout"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1d_1", title: "MRAs: Potassium-Sparing Diuretics", content: "MRAs block aldosterone receptors.", bulletPoints: ["Spironolactone and eplerenone", "SPARING = they spare potassium", "Spironolactone: gynecomastia (anti-androgen)"], highlightText: "MRAs SPARE potassium!"),
                LearningSlide(id: "ls1d_2", title: "ARNI: Entresto", content: "Sacubitril/Valsartan combines neprilysin inhibitor with ARB.", bulletPoints: ["MUST have 36-hour washout from ACE inhibitor", "NEVER combine with ACE inhibitor"], highlightText: "Entresto: 36-hour ACE washout required"),
            ]
        )

        let m1Sub1e = Subsection(
            id: "1e", moduleId: "m1", code: "1e",
            title: "Calcium Channel Blockers",
            description: "Dihydropyridines and Non-dihydropyridines",
            iconName: "waveform.path.ecg",
            drugs: [
                Drug(id: "d23", genericName: "Amlodipine", brandName: "Norvasc", drugClass: "DHP CCB", suffix: "-dipine", indications: ["HTN", "Angina"], sideEffects: ["Peripheral edema", "Flushing"], clinicalPearls: ["Most commonly prescribed CCB", "Long half-life"]),
                Drug(id: "d24", genericName: "Nifedipine", brandName: "Procardia", drugClass: "DHP CCB", suffix: "-dipine", indications: ["HTN", "Angina", "Raynaud's"], sideEffects: ["Peripheral edema", "Reflex tachycardia"], clinicalPearls: ["Extended release preferred"]),
                Drug(id: "d25", genericName: "Diltiazem", brandName: "Cardizem", drugClass: "Non-DHP CCB", suffix: "", indications: ["HTN", "Angina", "Rate control (AFib)"], sideEffects: ["Bradycardia", "Constipation"], clinicalPearls: ["Avoid combining with beta blockers"]),
                Drug(id: "d26", genericName: "Verapamil", brandName: "Calan", drugClass: "Non-DHP CCB", suffix: "", indications: ["HTN", "Angina", "SVT"], sideEffects: ["Bradycardia", "Constipation", "Heart block"], clinicalPearls: ["Most cardiac-selective non-DHP CCB", "Significant constipation"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls1e_1", title: "CCBs: Two Subclasses", content: "Calcium channel blockers have two important subclasses.", bulletPoints: ["DHP (dihydropyridines): end in -dipine, mainly vasodilate", "Non-DHP: diltiazem and verapamil, affect heart rate", "DHPs: reflex tachycardia, peripheral edema", "Non-DHPs: bradycardia, constipation"], highlightText: "DHP = -dipine = Vessels | Non-DHP = Heart"),
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

        let m2Sub2a = Subsection(
            id: "2a", moduleId: "m2", code: "2a",
            title: "Statins",
            description: "HMG-CoA Reductase Inhibitors",
            iconName: "chart.line.downtrend.xyaxis",
            drugs: [
                Drug(id: "d27", genericName: "Atorvastatin", brandName: "Lipitor", drugClass: "Statin", suffix: "-statin", indications: ["Hyperlipidemia", "ASCVD prevention"], sideEffects: ["Myalgia", "Hepatotoxicity", "Rhabdomyolysis"], clinicalPearls: ["Most prescribed statin", "High-intensity: 40-80mg"]),
                Drug(id: "d28", genericName: "Rosuvastatin", brandName: "Crestor", drugClass: "Statin", suffix: "-statin", indications: ["Hyperlipidemia", "ASCVD prevention"], sideEffects: ["Myalgia", "Hepatotoxicity"], clinicalPearls: ["Most potent statin", "High-intensity: 20-40mg"]),
                Drug(id: "d29", genericName: "Simvastatin", brandName: "Zocor", drugClass: "Statin", suffix: "-statin", indications: ["Hyperlipidemia"], sideEffects: ["Myalgia", "Hepatotoxicity"], clinicalPearls: ["Max dose 40mg (myopathy risk at 80mg)", "Many drug interactions"]),
                Drug(id: "d30", genericName: "Pravastatin", brandName: "Pravachol", drugClass: "Statin", suffix: "-statin", indications: ["Hyperlipidemia"], sideEffects: ["Myalgia"], clinicalPearls: ["Not metabolized by CYP3A4", "Fewer drug interactions"]),
                Drug(id: "d31", genericName: "Lovastatin", brandName: "Mevacor", drugClass: "Statin", suffix: "-statin", indications: ["Hyperlipidemia"], sideEffects: ["Myalgia", "Hepatotoxicity"], clinicalPearls: ["First statin approved", "Take with evening meal"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls2a_1", title: "Statins: The -statin Family", content: "Statins inhibit HMG-CoA reductase, the rate-limiting enzyme in cholesterol synthesis.", bulletPoints: ["All end in suffix -statin", "Cornerstone of ASCVD prevention", "High-intensity: atorvastatin 40-80mg, rosuvastatin 20-40mg", "Moderate-intensity: atorvastatin 10-20mg, rosuvastatin 5-10mg"], highlightText: "-statin = HMG-CoA Reductase Inhibitor"),
                LearningSlide(id: "ls2a_2", title: "Statin Safety & Monitoring", content: "Monitor LFTs at baseline and if symptoms arise. Watch for myopathy.", bulletPoints: ["Myalgia is most common side effect (~10%)", "Rhabdomyolysis is rare but serious (check CK if muscle pain)", "Contraindicated in pregnancy", "Avoid grapefruit with simvastatin/lovastatin/atorvastatin"], highlightText: "Monitor: LFTs + CK if muscle symptoms"),
            ]
        )

        let m2Sub2b = Subsection(
            id: "2b", moduleId: "m2", code: "2b",
            title: "Non-Statin Lipid Agents",
            description: "Ezetimibe, PCSK9 inhibitors, fibrates",
            iconName: "pill.fill",
            drugs: [
                Drug(id: "d32", genericName: "Ezetimibe", brandName: "Zetia", drugClass: "Cholesterol Absorption Inhibitor", suffix: "", indications: ["Hyperlipidemia"], sideEffects: ["Diarrhea", "Arthralgia"], clinicalPearls: ["Blocks intestinal cholesterol absorption", "Often added to statin therapy"]),
                Drug(id: "d33", genericName: "Evolocumab", brandName: "Repatha", drugClass: "PCSK9 Inhibitor", suffix: "", indications: ["Familial hypercholesterolemia", "ASCVD"], sideEffects: ["Injection site reactions", "URI"], clinicalPearls: ["Monoclonal antibody", "Subcutaneous injection q2-4 weeks"]),
                Drug(id: "d34", genericName: "Alirocumab", brandName: "Praluent", drugClass: "PCSK9 Inhibitor", suffix: "", indications: ["Familial hypercholesterolemia", "ASCVD"], sideEffects: ["Injection site reactions"], clinicalPearls: ["ODYSSEY OUTCOMES trial"]),
                Drug(id: "d35", genericName: "Fenofibrate", brandName: "Tricor", drugClass: "Fibrate", suffix: "", indications: ["Hypertriglyceridemia"], sideEffects: ["Myopathy", "Cholelithiasis", "Hepatotoxicity"], clinicalPearls: ["Primarily lowers triglycerides", "Preferred fibrate with statins"]),
                Drug(id: "d36", genericName: "Gemfibrozil", brandName: "Lopid", drugClass: "Fibrate", suffix: "", indications: ["Hypertriglyceridemia"], sideEffects: ["Myopathy", "Cholelithiasis"], clinicalPearls: ["Avoid combining with statins (myopathy risk)", "Use fenofibrate instead if statin needed"]),
                Drug(id: "d37", genericName: "Icosapent ethyl", brandName: "Vascepa", drugClass: "Omega-3 Fatty Acid", suffix: "", indications: ["Hypertriglyceridemia", "ASCVD risk reduction"], sideEffects: ["Arthralgia", "Bleeding risk"], clinicalPearls: ["REDUCE-IT trial", "Pure EPA (not fish oil)"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls2b_1", title: "Beyond Statins", content: "Multiple non-statin agents are available for lipid management.", bulletPoints: ["Ezetimibe: blocks intestinal cholesterol absorption", "PCSK9 inhibitors: monoclonal antibodies, very potent LDL lowering", "Fibrates: primarily lower triglycerides", "Icosapent ethyl (Vascepa): pure EPA, ASCVD benefit"], highlightText: "Add-on therapy when statins alone aren't enough"),
            ]
        )

        let m2Sub2c = Subsection(
            id: "2c", moduleId: "m2", code: "2c",
            title: "Antiplatelets & Anticoagulants",
            description: "Aspirin, Clopidogrel, DOACs, and Warfarin",
            iconName: "bandage.fill",
            drugs: [
                Drug(id: "d38", genericName: "Aspirin", brandName: "Bayer/Ecotrin", drugClass: "Antiplatelet", suffix: "", indications: ["ACS", "Stroke prevention", "Post-stent"], sideEffects: ["GI bleeding", "Tinnitus"], clinicalPearls: ["Irreversible COX inhibitor", "Low dose (81mg) for CV prevention"]),
                Drug(id: "d39", genericName: "Clopidogrel", brandName: "Plavix", drugClass: "P2Y12 Inhibitor", suffix: "", indications: ["ACS", "Post-stent", "Stroke prevention"], sideEffects: ["Bleeding", "TTP (rare)"], clinicalPearls: ["Prodrug - requires CYP2C19 activation", "Avoid with omeprazole (CYP2C19 inhibitor)"]),
                Drug(id: "d40", genericName: "Ticagrelor", brandName: "Brilinta", drugClass: "P2Y12 Inhibitor", suffix: "", indications: ["ACS"], sideEffects: ["Bleeding", "Dyspnea"], clinicalPearls: ["NOT a prodrug - direct acting", "Must use aspirin 81mg only (not 325mg)"]),
                Drug(id: "d41", genericName: "Warfarin", brandName: "Coumadin", drugClass: "Vitamin K Antagonist", suffix: "", indications: ["AFib", "DVT/PE", "Mechanical heart valves"], sideEffects: ["Bleeding", "Skin necrosis", "Teratogenic"], clinicalPearls: ["Monitor INR (goal 2-3 usually)", "Many food/drug interactions (vitamin K)"]),
                Drug(id: "d42", genericName: "Rivaroxaban", brandName: "Xarelto", drugClass: "Direct Xa Inhibitor", suffix: "-xaban", indications: ["AFib", "DVT/PE", "Post-hip/knee surgery"], sideEffects: ["Bleeding"], clinicalPearls: ["Take with evening meal (improves absorption)", "Once daily for AFib"]),
                Drug(id: "d43", genericName: "Apixaban", brandName: "Eliquis", drugClass: "Direct Xa Inhibitor", suffix: "-xaban", indications: ["AFib", "DVT/PE"], sideEffects: ["Bleeding"], clinicalPearls: ["Preferred DOAC per many guidelines", "Twice daily dosing", "Least renal dependence of DOACs"]),
                Drug(id: "d44", genericName: "Enoxaparin", brandName: "Lovenox", drugClass: "Low Molecular Weight Heparin", suffix: "", indications: ["DVT prophylaxis", "ACS", "DVT/PE treatment"], sideEffects: ["Bleeding", "HIT", "Injection site hematoma"], clinicalPearls: ["Subcutaneous injection", "Monitor anti-Xa levels in renal impairment/obesity"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls2c_1", title: "Antiplatelets", content: "Antiplatelets prevent arterial thrombosis by inhibiting platelet aggregation.", bulletPoints: ["Aspirin: irreversible COX inhibitor, 81mg for prevention", "Clopidogrel: P2Y12 inhibitor, prodrug needing CYP2C19", "Ticagrelor: direct-acting P2Y12, must use 81mg aspirin", "DAPT = Dual Antiplatelet Therapy (aspirin + P2Y12)"], highlightText: "Antiplatelets for arterial clots (ACS, stents)"),
                LearningSlide(id: "ls2c_2", title: "Anticoagulants", content: "Anticoagulants prevent venous thromboembolism and stroke in AFib.", bulletPoints: ["Warfarin: vitamin K antagonist, monitor INR", "DOACs (-xaban): rivaroxaban, apixaban - fewer monitoring needs", "Apixaban preferred DOAC per many guidelines", "Enoxaparin: LMWH, SubQ injection"], highlightText: "DOACs replacing warfarin for most indications"),
            ]
        )

        let m2Mastery = Subsection(
            id: "2d", moduleId: "m2", code: "2d",
            title: "Mastery: Cardiovascular II",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module2 = DrugModule(
            id: "m2", number: 2,
            title: "Cardiovascular II",
            subtitle: "Lipids & Thrombosis",
            iconName: "drop.triangle.fill",
            accentColorHex: "1565C0",
            subsections: [m2Sub2a, m2Sub2b, m2Sub2c, m2Mastery]
        )

        let m3Sub3a = Subsection(
            id: "3a", moduleId: "m3", code: "3a",
            title: "Insulin & Metformin",
            description: "Foundation of diabetes management",
            iconName: "syringe.fill",
            drugs: [
                Drug(id: "d45", genericName: "Metformin", brandName: "Glucophage", drugClass: "Biguanide", suffix: "", indications: ["T2DM"], sideEffects: ["GI upset", "Lactic acidosis (rare)", "B12 deficiency"], clinicalPearls: ["First-line for T2DM", "Hold before contrast dye", "Contraindicated if eGFR < 30"]),
                Drug(id: "d46", genericName: "Insulin glargine", brandName: "Lantus", drugClass: "Long-acting Insulin", suffix: "", indications: ["T1DM", "T2DM"], sideEffects: ["Hypoglycemia", "Weight gain"], clinicalPearls: ["Peakless, 24-hour duration", "Cannot be mixed with other insulins"]),
                Drug(id: "d47", genericName: "Insulin lispro", brandName: "Humalog", drugClass: "Rapid-acting Insulin", suffix: "", indications: ["T1DM", "T2DM"], sideEffects: ["Hypoglycemia", "Weight gain"], clinicalPearls: ["Onset 15 min, peak 1-2 hours", "Give within 15 min of meals"]),
                Drug(id: "d48", genericName: "Insulin aspart", brandName: "NovoLog", drugClass: "Rapid-acting Insulin", suffix: "", indications: ["T1DM", "T2DM"], sideEffects: ["Hypoglycemia", "Weight gain"], clinicalPearls: ["Similar to lispro", "Can be used in insulin pumps"]),
                Drug(id: "d49", genericName: "Insulin detemir", brandName: "Levemir", drugClass: "Long-acting Insulin", suffix: "", indications: ["T1DM", "T2DM"], sideEffects: ["Hypoglycemia", "Weight gain"], clinicalPearls: ["May need BID dosing", "Less weight gain than glargine"]),
                Drug(id: "d50", genericName: "Regular insulin", brandName: "Humulin R/Novolin R", drugClass: "Short-acting Insulin", suffix: "", indications: ["T1DM", "T2DM", "DKA", "Hyperkalemia"], sideEffects: ["Hypoglycemia"], clinicalPearls: ["Only insulin for IV use", "Onset 30 min, give 30 min before meals"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls3a_1", title: "Metformin: First-Line for T2DM", content: "Metformin decreases hepatic glucose production and increases insulin sensitivity.", bulletPoints: ["First-line drug for ALL T2DM patients", "Does NOT cause hypoglycemia when used alone", "GI side effects common - titrate slowly", "Hold if eGFR < 30 or before IV contrast"], highlightText: "Metformin = First-line T2DM, NO hypoglycemia risk"),
                LearningSlide(id: "ls3a_2", title: "Insulin Types", content: "Know the onset, peak, and duration of each insulin type.", bulletPoints: ["Rapid-acting (lispro, aspart): onset 15 min, peak 1-2h", "Short-acting (regular): onset 30 min, peak 2-4h", "Long-acting (glargine, detemir): peakless, 24h duration", "Only REGULAR insulin can be given IV"], highlightText: "Rapid = 15 min | Short = 30 min | Long = 24h"),
            ]
        )

        let m3Sub3b = Subsection(
            id: "3b", moduleId: "m3", code: "3b",
            title: "Oral Antidiabetics",
            description: "SGLT2i, GLP-1 RA, DPP-4i, SU",
            iconName: "pill.circle.fill",
            drugs: [
                Drug(id: "d51", genericName: "Empagliflozin", brandName: "Jardiance", drugClass: "SGLT2 Inhibitor", suffix: "-gliflozin", indications: ["T2DM", "HFrEF", "CKD"], sideEffects: ["UTIs", "Genital mycotic infections", "DKA"], clinicalPearls: ["EMPA-REG trial: CV and renal benefits", "Blocks glucose reabsorption in kidney"]),
                Drug(id: "d52", genericName: "Dapagliflozin", brandName: "Farxiga", drugClass: "SGLT2 Inhibitor", suffix: "-gliflozin", indications: ["T2DM", "HF", "CKD"], sideEffects: ["UTIs", "Genital mycotic infections"], clinicalPearls: ["DAPA-HF and DAPA-CKD trials", "Benefits even in non-diabetic HF/CKD"]),
                Drug(id: "d53", genericName: "Semaglutide", brandName: "Ozempic/Wegovy", drugClass: "GLP-1 Receptor Agonist", suffix: "-glutide", indications: ["T2DM", "Obesity"], sideEffects: ["Nausea", "Vomiting", "Pancreatitis risk"], clinicalPearls: ["Weekly injection", "Significant weight loss", "Oral form available (Rybelsus)"]),
                Drug(id: "d54", genericName: "Liraglutide", brandName: "Victoza/Saxenda", drugClass: "GLP-1 Receptor Agonist", suffix: "-glutide", indications: ["T2DM", "Obesity"], sideEffects: ["Nausea", "Pancreatitis risk"], clinicalPearls: ["LEADER trial: CV benefit", "Daily injection"]),
                Drug(id: "d55", genericName: "Sitagliptin", brandName: "Januvia", drugClass: "DPP-4 Inhibitor", suffix: "-gliptin", indications: ["T2DM"], sideEffects: ["Nasopharyngitis", "Headache", "Pancreatitis risk"], clinicalPearls: ["Weight neutral", "Dose adjust for renal impairment"]),
                Drug(id: "d56", genericName: "Glipizide", brandName: "Glucotrol", drugClass: "Sulfonylurea", suffix: "", indications: ["T2DM"], sideEffects: ["Hypoglycemia", "Weight gain"], clinicalPearls: ["Stimulates insulin release from beta cells", "Take 30 min before meals"]),
                Drug(id: "d57", genericName: "Glimepiride", brandName: "Amaryl", drugClass: "Sulfonylurea", suffix: "", indications: ["T2DM"], sideEffects: ["Hypoglycemia", "Weight gain"], clinicalPearls: ["Once daily dosing", "Less hypoglycemia than glyburide"]),
                Drug(id: "d58", genericName: "Pioglitazone", brandName: "Actos", drugClass: "Thiazolidinedione", suffix: "", indications: ["T2DM"], sideEffects: ["Weight gain", "Edema", "HF exacerbation", "Bone fractures"], clinicalPearls: ["Insulin sensitizer (PPARg agonist)", "Contraindicated in NYHA Class III-IV HF"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls3b_1", title: "SGLT2 Inhibitors & GLP-1 RAs", content: "These newer agents have revolutionized T2DM treatment with CV and renal benefits.", bulletPoints: ["SGLT2i (-gliflozin): block glucose reabsorption in kidney", "SGLT2i: CV benefit, renal protection, weight loss", "GLP-1 RA (-glutide): incretin mimetics, promote insulin secretion", "GLP-1 RA: significant weight loss, CV benefit"], highlightText: "SGLT2i and GLP-1 RA: Beyond glucose lowering"),
                LearningSlide(id: "ls3b_2", title: "DPP-4i, SU, and TZDs", content: "Older oral agents still commonly prescribed.", bulletPoints: ["DPP-4 inhibitors (-gliptin): weight neutral, low hypoglycemia", "Sulfonylureas: cheap but cause hypoglycemia + weight gain", "TZDs (pioglitazone): insulin sensitizer, avoid in HF", "Sulfonylureas: take before meals"], highlightText: "SU = hypoglycemia risk | TZD = avoid in HF"),
            ]
        )

        let m3Sub3c = Subsection(
            id: "3c", moduleId: "m3", code: "3c",
            title: "Thyroid Agents",
            description: "Levothyroxine, Methimazole, PTU",
            iconName: "brain.head.profile.fill",
            drugs: [
                Drug(id: "d59", genericName: "Levothyroxine", brandName: "Synthroid", drugClass: "Thyroid Hormone", suffix: "", indications: ["Hypothyroidism", "TSH suppression"], sideEffects: ["Tachycardia", "Tremor", "Weight loss (if overdosed)"], clinicalPearls: ["Take on empty stomach, 30-60 min before food", "Separate from calcium, iron, antacids by 4 hours", "Most prescribed drug in US"]),
                Drug(id: "d60", genericName: "Liothyronine", brandName: "Cytomel", drugClass: "Thyroid Hormone (T3)", suffix: "", indications: ["Hypothyroidism", "Myxedema coma"], sideEffects: ["Tachycardia", "Angina"], clinicalPearls: ["Active T3 form", "Shorter half-life than T4"]),
                Drug(id: "d61", genericName: "Methimazole", brandName: "Tapazole", drugClass: "Thionamide", suffix: "", indications: ["Hyperthyroidism", "Graves' disease"], sideEffects: ["Agranulocytosis", "Hepatotoxicity", "Rash"], clinicalPearls: ["Preferred over PTU (less hepatotoxicity)", "Once daily dosing"]),
                Drug(id: "d62", genericName: "Propylthiouracil (PTU)", brandName: "PTU", drugClass: "Thionamide", suffix: "", indications: ["Hyperthyroidism (1st trimester pregnancy)", "Thyroid storm"], sideEffects: ["Agranulocytosis", "Hepatotoxicity (severe)"], clinicalPearls: ["Preferred in 1st trimester pregnancy", "Also blocks T4 to T3 conversion"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls3c_1", title: "Thyroid Medications", content: "Thyroid disorders are extremely common. Know the key drugs.", bulletPoints: ["Levothyroxine: synthetic T4, first-line for hypothyroidism", "Take on empty stomach, separate from calcium/iron by 4 hours", "Methimazole: first-line for hyperthyroidism", "PTU: preferred in 1st trimester pregnancy and thyroid storm"], highlightText: "Levothyroxine = empty stomach, separate from Ca/Fe"),
            ]
        )

        let m3Mastery = Subsection(
            id: "3d", moduleId: "m3", code: "3d",
            title: "Mastery: Endocrine",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module3 = DrugModule(
            id: "m3", number: 3,
            title: "Endocrine & Diabetes",
            subtitle: "Insulin, Metformin & More",
            iconName: "syringe.fill",
            accentColorHex: "6A1B9A",
            subsections: [m3Sub3a, m3Sub3b, m3Sub3c, m3Mastery]
        )

        let module4 = DrugModule(
            id: "m4", number: 4,
            title: "CNS & Psychiatry",
            subtitle: "Antidepressants, Anxiolytics & More",
            iconName: "brain.fill",
            accentColorHex: "00897B",
            subsections: [
                Subsection(id: "4a", moduleId: "m4", code: "4a", title: "SSRIs & SNRIs", description: "First-line antidepressants", iconName: "brain.fill", drugs: [], isMasteryQuiz: false, learningSlides: []),
                Subsection(id: "4b", moduleId: "m4", code: "4b", title: "Benzodiazepines & Sleep Aids", description: "Anxiolytics and sedative-hypnotics", iconName: "moon.fill", drugs: [], isMasteryQuiz: false, learningSlides: []),
                Subsection(id: "4c", moduleId: "m4", code: "4c", title: "Antipsychotics", description: "Typical and atypical antipsychotics", iconName: "person.fill.questionmark", drugs: [], isMasteryQuiz: false, learningSlides: []),
            ]
        )

        let module5 = DrugModule(
            id: "m5", number: 5,
            title: "Infectious Disease",
            subtitle: "Antibiotics, Antivirals & Antifungals",
            iconName: "microbe.fill",
            accentColorHex: "EF6C00",
            subsections: [
                Subsection(id: "5a", moduleId: "m5", code: "5a", title: "Penicillins & Cephalosporins", description: "Beta-lactam antibiotics", iconName: "pills.fill", drugs: [], isMasteryQuiz: false, learningSlides: []),
                Subsection(id: "5b", moduleId: "m5", code: "5b", title: "Fluoroquinolones & Macrolides", description: "Broad-spectrum antibiotics", iconName: "capsule.fill", drugs: [], isMasteryQuiz: false, learningSlides: []),
            ]
        )

        self.modules = [module1, module2, module3, module4, module5]

        var bank: [String: [Question]] = [:]

        bank["1a"] = [
            .trueFalse(id: "q1a_1", subsectionId: "1a", question: "ACE inhibitors end in the suffix -pril.", answer: true, explanation: "All ACE inhibitors end in -pril (e.g., lisinopril, enalapril, ramipril)."),
            .fillBlank(id: "q1a_2", subsectionId: "1a", question: "All ACE inhibitors end in _____.", options: ["-pril", "-sartan", "-olol", "-dipine"], answer: "-pril", explanation: "The -pril suffix identifies ACE inhibitors."),
            .multipleChoice(id: "q1a_3", subsectionId: "1a", question: "Which side effect is unique to ACE inhibitors compared to ARBs?", options: ["Dry cough", "Hyperkalemia", "Dizziness", "Hypotension"], answer: "Dry cough", explanation: "Dry cough from bradykinin accumulation is unique to ACE inhibitors."),
            .trueFalse(id: "q1a_4", subsectionId: "1a", question: "Losartan is an ACE inhibitor.", answer: false, explanation: "Losartan is an ARB (angiotensin receptor blocker). It ends in -sartan."),
            .multipleChoice(id: "q1a_5", subsectionId: "1a", question: "What is the brand name of lisinopril?", options: ["Zestril", "Cozaar", "Diovan", "Norvasc"], answer: "Zestril", explanation: "Lisinopril is sold as Zestril or Prinivil."),
            .fillBlank(id: "q1a_6", subsectionId: "1a", question: "The brand name of losartan is _____.", options: ["Cozaar", "Zestril", "Vasotec", "Altace"], answer: "Cozaar", explanation: "Losartan's brand name is Cozaar."),
            .multipleChoice(id: "q1a_7", subsectionId: "1a", question: "Both ACE inhibitors and ARBs are contraindicated in:", options: ["Pregnancy", "Diabetes", "COPD", "Anemia"], answer: "Pregnancy", explanation: "Both carry a Black Box Warning for use in pregnancy."),
            .selectAll(id: "q1a_8", subsectionId: "1a", question: "Select ALL ACE inhibitors:", options: ["Lisinopril", "Losartan", "Enalapril", "Valsartan", "Ramipril"], correctAnswers: ["Lisinopril", "Enalapril", "Ramipril"], explanation: "Lisinopril, enalapril, and ramipril end in -pril (ACE inhibitors)."),
            .matching(id: "q1a_9", subsectionId: "1a", question: "Match each generic name to its brand name:", pairs: [MatchingPair(left: "Lisinopril", right: "Zestril"), MatchingPair(left: "Losartan", right: "Cozaar"), MatchingPair(left: "Enalapril", right: "Vasotec"), MatchingPair(left: "Valsartan", right: "Diovan")], explanation: "Key brand-generic pairs for ACE inhibitors and ARBs."),
            .multipleChoice(id: "q1a_10", subsectionId: "1a", question: "A patient on an ACE inhibitor develops a persistent dry cough. The best alternative is:", options: ["An ARB", "A beta blocker", "A thiazide diuretic", "Another ACE inhibitor"], answer: "An ARB", explanation: "ARBs provide similar benefits without the cough."),
            .trueFalse(id: "q1a_11", subsectionId: "1a", difficulty: .medium, question: "ACE inhibitors and ARBs should be combined for better BP control.", answer: false, explanation: "Combining ACE + ARB increases risk of hyperkalemia and renal failure."),
            .multipleChoice(id: "q1a_12", subsectionId: "1a", question: "Which ARB has a unique uricosuric effect?", options: ["Losartan", "Valsartan", "Irbesartan", "Olmesartan"], answer: "Losartan", explanation: "Losartan uniquely lowers uric acid levels."),
        ]

        bank["1b"] = [
            .trueFalse(id: "q1b_1", subsectionId: "1b", question: "Thiazide diuretics cause hypokalemia.", answer: true, explanation: "Thiazides increase potassium excretion."),
            .fillBlank(id: "q1b_2", subsectionId: "1b", question: "The brand name of furosemide is _____.", options: ["Lasix", "Bumex", "Microzide", "Aldactone"], answer: "Lasix", explanation: "Furosemide is Lasix."),
            .multipleChoice(id: "q1b_3", subsectionId: "1b", question: "Which diuretic class is the MOST potent?", options: ["Loop diuretics", "Thiazide diuretics", "Potassium-sparing diuretics", "Osmotic diuretics"], answer: "Loop diuretics", explanation: "Loop diuretics are the most potent."),
            .trueFalse(id: "q1b_4", subsectionId: "1b", question: "Thiazide diuretics cause hypercalcemia.", answer: true, explanation: "Thiazides increase calcium reabsorption."),
            .multipleChoice(id: "q1b_5", subsectionId: "1b", question: "What mnemonic describes thiazide metabolic effects?", options: ["HyperGLUC", "HypoGLUC", "SALAD", "MUDPILES"], answer: "HyperGLUC", explanation: "HyperGLUC: Glucose↑, Lipids↑, Uric acid↑, Calcium↑"),
            .fillBlank(id: "q1b_6", subsectionId: "1b", question: "Loop diuretics work on the thick ascending _____ of Henle.", options: ["Loop", "Tubule", "Duct", "Cortex"], answer: "Loop", explanation: "Loop diuretics get their name from the loop of Henle."),
            .selectAll(id: "q1b_7", subsectionId: "1b", question: "Select ALL loop diuretics:", options: ["Furosemide", "HCTZ", "Bumetanide", "Chlorthalidone", "Torsemide"], correctAnswers: ["Furosemide", "Bumetanide", "Torsemide"], explanation: "Furosemide, bumetanide, and torsemide are loop diuretics."),
            .multipleChoice(id: "q1b_8", subsectionId: "1b", question: "Which loop diuretic has the BEST oral bioavailability?", options: ["Torsemide", "Furosemide", "Bumetanide", "Ethacrynic acid"], answer: "Torsemide", explanation: "Torsemide has ~80% oral bioavailability."),
            .trueFalse(id: "q1b_9", subsectionId: "1b", difficulty: .medium, question: "Loop diuretics cause hypercalcemia.", answer: false, explanation: "Loop diuretics cause HYPOcalcemia."),
            .matching(id: "q1b_10", subsectionId: "1b", question: "Match each diuretic to its brand name:", pairs: [MatchingPair(left: "Furosemide", right: "Lasix"), MatchingPair(left: "Bumetanide", right: "Bumex"), MatchingPair(left: "HCTZ", right: "Microzide"), MatchingPair(left: "Torsemide", right: "Demadex")], explanation: "Key diuretic brand-generic pairs."),
            .multipleChoice(id: "q1b_11", subsectionId: "1b", difficulty: .hard, question: "1 mg of bumetanide equals how many mg of furosemide?", options: ["40 mg", "20 mg", "80 mg", "10 mg"], answer: "40 mg", explanation: "Bumetanide is 40x more potent than furosemide."),
            .multipleChoice(id: "q1b_12", subsectionId: "1b", question: "Which thiazide is preferred per the ALLHAT trial?", options: ["Chlorthalidone", "HCTZ", "Indapamide", "Metolazone"], answer: "Chlorthalidone", explanation: "Chlorthalidone has stronger outcome data from ALLHAT."),
        ]

        bank["1c"] = [
            .fillBlank(id: "q1c_1", subsectionId: "1c", question: "All beta blockers end in _____.", options: ["-olol", "-pril", "-sartan", "-statin"], answer: "-olol", explanation: "The -olol suffix identifies beta blockers."),
            .trueFalse(id: "q1c_2", subsectionId: "1c", question: "Propranolol is a selective beta-1 blocker.", answer: false, explanation: "Propranolol is NON-selective (B1 and B2)."),
            .multipleChoice(id: "q1c_3", subsectionId: "1c", question: "Which 3 beta blockers reduce mortality in HFrEF?", options: ["Metoprolol succinate, carvedilol, bisoprolol", "Metoprolol tartrate, atenolol, propranolol", "Atenolol, carvedilol, propranolol", "Propranolol, bisoprolol, nadolol"], answer: "Metoprolol succinate, carvedilol, bisoprolol", explanation: "Only these three have HFrEF mortality benefit data."),
            .trueFalse(id: "q1c_4", subsectionId: "1c", question: "Carvedilol blocks both beta and alpha receptors.", answer: true, explanation: "Carvedilol blocks alpha-1 + beta-1 + beta-2 receptors."),
            .multipleChoice(id: "q1c_5", subsectionId: "1c", question: "Which beta blocker should be avoided in asthma?", options: ["Propranolol", "Metoprolol", "Atenolol", "Bisoprolol"], answer: "Propranolol", explanation: "Non-selective beta blockers can cause bronchospasm."),
            .fillBlank(id: "q1c_6", subsectionId: "1c", question: "The brand name of carvedilol is _____.", options: ["Coreg", "Lopressor", "Tenormin", "Inderal"], answer: "Coreg", explanation: "Carvedilol is Coreg."),
            .selectAll(id: "q1c_7", subsectionId: "1c", question: "Select ALL beta-1 selective blockers:", options: ["Metoprolol", "Propranolol", "Atenolol", "Carvedilol", "Bisoprolol"], correctAnswers: ["Metoprolol", "Atenolol", "Bisoprolol"], explanation: "Metoprolol, atenolol, and bisoprolol are B1-selective."),
            .matching(id: "q1c_8", subsectionId: "1c", question: "Match beta blocker to brand name:", pairs: [MatchingPair(left: "Metoprolol ER", right: "Toprol XL"), MatchingPair(left: "Carvedilol", right: "Coreg"), MatchingPair(left: "Atenolol", right: "Tenormin"), MatchingPair(left: "Propranolol", right: "Inderal")], explanation: "Key beta blocker brand-generic pairs."),
            .multipleChoice(id: "q1c_9", subsectionId: "1c", question: "Metoprolol succinate differs from tartrate because:", options: ["Succinate is extended-release for HF", "Tartrate is extended-release", "Succinate is non-selective", "They are identical"], answer: "Succinate is extended-release for HF", explanation: "Succinate (Toprol XL) is ER and approved for HFrEF."),
            .trueFalse(id: "q1c_10", subsectionId: "1c", difficulty: .medium, question: "Propranolol can mask hypoglycemia symptoms.", answer: true, explanation: "Non-selective beta blockers mask tachycardia and tremor of hypoglycemia."),
            .multipleChoice(id: "q1c_11", subsectionId: "1c", question: "Carvedilol should be taken:", options: ["With food", "On an empty stomach", "At bedtime only", "With grapefruit juice"], answer: "With food", explanation: "Take with food to slow absorption and reduce orthostatic hypotension."),
        ]

        bank["1d"] = [
            .trueFalse(id: "q1d_1", subsectionId: "1d", question: "Spironolactone is a potassium-sparing diuretic.", answer: true, explanation: "Spironolactone blocks aldosterone, retaining potassium."),
            .multipleChoice(id: "q1d_2", subsectionId: "1d", question: "Which side effect is associated with spironolactone but NOT eplerenone?", options: ["Gynecomastia", "Hyperkalemia", "Hypotension", "Headache"], answer: "Gynecomastia", explanation: "Spironolactone has anti-androgen effects causing gynecomastia."),
            .fillBlank(id: "q1d_3", subsectionId: "1d", question: "Before starting Entresto, a patient must have a ___-hour washout from ACE inhibitors.", options: ["36", "24", "12", "48"], answer: "36", explanation: "36-hour washout from ACE inhibitors before Entresto."),
            .trueFalse(id: "q1d_4", subsectionId: "1d", question: "Entresto can be safely combined with an ACE inhibitor.", answer: false, explanation: "NEVER combine Entresto with ACE inhibitors."),
            .multipleChoice(id: "q1d_5", subsectionId: "1d", question: "What trial proved Entresto's superiority over enalapril in HFrEF?", options: ["PARADIGM-HF", "ALLHAT", "HOPE", "RALES"], answer: "PARADIGM-HF", explanation: "PARADIGM-HF showed Entresto was superior to enalapril."),
            .fillBlank(id: "q1d_6", subsectionId: "1d", question: "The brand name of spironolactone is _____.", options: ["Aldactone", "Inspra", "Entresto", "Coreg"], answer: "Aldactone", explanation: "Spironolactone is Aldactone."),
            .multipleChoice(id: "q1d_7", subsectionId: "1d", question: "Entresto contains sacubitril combined with:", options: ["Valsartan", "Losartan", "Lisinopril", "Enalapril"], answer: "Valsartan", explanation: "Entresto = sacubitril + valsartan."),
            .selectAll(id: "q1d_8", subsectionId: "1d", question: "Select ALL that require potassium monitoring:", options: ["Spironolactone", "Eplerenone", "Entresto", "Amlodipine"], correctAnswers: ["Spironolactone", "Eplerenone", "Entresto"], explanation: "All three can cause hyperkalemia."),
            .trueFalse(id: "q1d_9", subsectionId: "1d", difficulty: .medium, question: "The RALES trial showed mortality benefit with spironolactone in HFrEF.", answer: true, explanation: "RALES demonstrated 30% mortality reduction."),
            .matching(id: "q1d_10", subsectionId: "1d", question: "Match each drug to its landmark trial:", pairs: [MatchingPair(left: "Spironolactone", right: "RALES"), MatchingPair(left: "Eplerenone", right: "EPHESUS"), MatchingPair(left: "Entresto", right: "PARADIGM-HF")], explanation: "Key clinical trials for MRAs and ARNI."),
        ]

        bank["1e"] = [
            .fillBlank(id: "q1e_1", subsectionId: "1e", question: "Dihydropyridine CCBs end in _____.", options: ["-dipine", "-olol", "-sartan", "-pril"], answer: "-dipine", explanation: "DHP CCBs all end in -dipine."),
            .trueFalse(id: "q1e_2", subsectionId: "1e", question: "Verapamil and diltiazem are dihydropyridine CCBs.", answer: false, explanation: "They are NON-dihydropyridine CCBs."),
            .multipleChoice(id: "q1e_3", subsectionId: "1e", question: "Which CCB is most commonly prescribed for HTN?", options: ["Amlodipine", "Verapamil", "Diltiazem", "Nifedipine"], answer: "Amlodipine", explanation: "Amlodipine (Norvasc) is the most prescribed CCB."),
            .trueFalse(id: "q1e_4", subsectionId: "1e", question: "Non-DHP CCBs should be avoided with beta blockers.", answer: true, explanation: "Combining can cause severe bradycardia and heart block."),
            .multipleChoice(id: "q1e_5", subsectionId: "1e", question: "Which CCB is known for significant constipation?", options: ["Verapamil", "Amlodipine", "Nifedipine", "Felodipine"], answer: "Verapamil", explanation: "Verapamil commonly causes constipation."),
            .fillBlank(id: "q1e_6", subsectionId: "1e", question: "The brand name of amlodipine is _____.", options: ["Norvasc", "Cardizem", "Calan", "Procardia"], answer: "Norvasc", explanation: "Amlodipine is Norvasc."),
            .selectAll(id: "q1e_7", subsectionId: "1e", question: "Select ALL non-DHP CCBs:", options: ["Diltiazem", "Amlodipine", "Verapamil", "Nifedipine"], correctAnswers: ["Diltiazem", "Verapamil"], explanation: "Diltiazem and verapamil are non-DHP CCBs."),
            .matching(id: "q1e_8", subsectionId: "1e", question: "Match each CCB to its brand name:", pairs: [MatchingPair(left: "Amlodipine", right: "Norvasc"), MatchingPair(left: "Diltiazem", right: "Cardizem"), MatchingPair(left: "Verapamil", right: "Calan"), MatchingPair(left: "Nifedipine", right: "Procardia")], explanation: "Key CCB brand-generic pairs."),
            .multipleChoice(id: "q1e_9", subsectionId: "1e", difficulty: .hard, question: "DHP CCBs cause peripheral edema because they:", options: ["Dilate arterioles more than venules", "Increase sodium retention", "Cause heart failure", "Block calcium in kidneys"], answer: "Dilate arterioles more than venules", explanation: "Preferential arteriolar dilation increases capillary hydrostatic pressure."),
            .multipleChoice(id: "q1e_10", subsectionId: "1e", question: "Which CCB can control heart rate in AFib?", options: ["Diltiazem", "Amlodipine", "Nifedipine", "Felodipine"], answer: "Diltiazem", explanation: "Non-DHP CCBs slow AV conduction for rate control."),
        ]

        bank["1f"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("1") && key != "1f" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["2a"] = [
            .fillBlank(id: "q2a_1", subsectionId: "2a", question: "All statins end in _____.", options: ["-statin", "-pril", "-olol", "-sartan"], answer: "-statin", explanation: "The -statin suffix identifies HMG-CoA reductase inhibitors."),
            .trueFalse(id: "q2a_2", subsectionId: "2a", question: "Atorvastatin is the most prescribed statin.", answer: true, explanation: "Atorvastatin (Lipitor) is the most widely prescribed statin."),
            .multipleChoice(id: "q2a_3", subsectionId: "2a", question: "Which is the most potent statin?", options: ["Rosuvastatin", "Atorvastatin", "Simvastatin", "Pravastatin"], answer: "Rosuvastatin", explanation: "Rosuvastatin (Crestor) is the most potent statin."),
            .multipleChoice(id: "q2a_4", subsectionId: "2a", question: "The brand name of atorvastatin is:", options: ["Lipitor", "Crestor", "Zocor", "Pravachol"], answer: "Lipitor", explanation: "Atorvastatin is sold as Lipitor."),
            .trueFalse(id: "q2a_5", subsectionId: "2a", question: "Statins are safe to use during pregnancy.", answer: false, explanation: "Statins are contraindicated in pregnancy."),
            .selectAll(id: "q2a_6", subsectionId: "2a", question: "Select ALL high-intensity statin regimens:", options: ["Atorvastatin 40-80mg", "Rosuvastatin 20-40mg", "Simvastatin 20mg", "Pravastatin 40mg"], correctAnswers: ["Atorvastatin 40-80mg", "Rosuvastatin 20-40mg"], explanation: "High-intensity = atorva 40-80mg or rosuva 20-40mg."),
            .multipleChoice(id: "q2a_7", subsectionId: "2a", question: "What is the most common side effect of statins?", options: ["Myalgia", "Headache", "Nausea", "Cough"], answer: "Myalgia", explanation: "Myalgia (muscle pain) affects ~10% of statin users."),
            .fillBlank(id: "q2a_8", subsectionId: "2a", question: "Simvastatin max dose is ___mg due to myopathy risk.", options: ["40", "20", "80", "10"], answer: "40", explanation: "Simvastatin 80mg is restricted due to high myopathy risk."),
            .matching(id: "q2a_9", subsectionId: "2a", question: "Match each statin to its brand name:", pairs: [MatchingPair(left: "Atorvastatin", right: "Lipitor"), MatchingPair(left: "Rosuvastatin", right: "Crestor"), MatchingPair(left: "Simvastatin", right: "Zocor"), MatchingPair(left: "Pravastatin", right: "Pravachol")], explanation: "Key statin brand-generic pairs."),
            .multipleChoice(id: "q2a_10", subsectionId: "2a", question: "Which statin has the fewest drug interactions?", options: ["Pravastatin", "Simvastatin", "Atorvastatin", "Lovastatin"], answer: "Pravastatin", explanation: "Pravastatin is not metabolized by CYP3A4."),
            .trueFalse(id: "q2a_11", subsectionId: "2a", difficulty: .medium, question: "Rhabdomyolysis is a common side effect of statins.", answer: false, explanation: "Rhabdomyolysis is rare but serious. Myalgia is common."),
        ]

        bank["2b"] = [
            .multipleChoice(id: "q2b_1", subsectionId: "2b", question: "Ezetimibe works by:", options: ["Blocking intestinal cholesterol absorption", "Inhibiting HMG-CoA reductase", "Binding bile acids", "Activating LDL receptors"], answer: "Blocking intestinal cholesterol absorption", explanation: "Ezetimibe blocks the NPC1L1 transporter in the intestine."),
            .fillBlank(id: "q2b_2", subsectionId: "2b", question: "The brand name of ezetimibe is _____.", options: ["Zetia", "Repatha", "Tricor", "Vascepa"], answer: "Zetia", explanation: "Ezetimibe is sold as Zetia."),
            .trueFalse(id: "q2b_3", subsectionId: "2b", question: "PCSK9 inhibitors are oral medications.", answer: false, explanation: "PCSK9 inhibitors are subcutaneous injections (monoclonal antibodies)."),
            .multipleChoice(id: "q2b_4", subsectionId: "2b", question: "Fibrates primarily lower:", options: ["Triglycerides", "LDL", "Total cholesterol", "Lp(a)"], answer: "Triglycerides", explanation: "Fibrates primarily target triglycerides."),
            .multipleChoice(id: "q2b_5", subsectionId: "2b", question: "Which fibrate should be AVOIDED with statins?", options: ["Gemfibrozil", "Fenofibrate", "Both equally", "Neither"], answer: "Gemfibrozil", explanation: "Gemfibrozil significantly increases myopathy risk with statins."),
            .trueFalse(id: "q2b_6", subsectionId: "2b", question: "Icosapent ethyl (Vascepa) is just regular fish oil.", answer: false, explanation: "Vascepa is purified EPA, not standard fish oil."),
            .multipleChoice(id: "q2b_7", subsectionId: "2b", question: "The landmark trial for icosapent ethyl was:", options: ["REDUCE-IT", "PARADIGM-HF", "ALLHAT", "HOPE"], answer: "REDUCE-IT", explanation: "REDUCE-IT showed CV benefit with icosapent ethyl."),
            .selectAll(id: "q2b_8", subsectionId: "2b", question: "Select ALL PCSK9 inhibitors:", options: ["Evolocumab", "Alirocumab", "Ezetimibe", "Fenofibrate"], correctAnswers: ["Evolocumab", "Alirocumab"], explanation: "Evolocumab (Repatha) and alirocumab (Praluent) are PCSK9 inhibitors."),
            .matching(id: "q2b_9", subsectionId: "2b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Ezetimibe", right: "Zetia"), MatchingPair(left: "Evolocumab", right: "Repatha"), MatchingPair(left: "Fenofibrate", right: "Tricor"), MatchingPair(left: "Icosapent ethyl", right: "Vascepa")], explanation: "Key non-statin lipid drug brand names."),
        ]

        bank["2c"] = [
            .trueFalse(id: "q2c_1", subsectionId: "2c", question: "Aspirin irreversibly inhibits COX.", answer: true, explanation: "Aspirin is an irreversible COX inhibitor."),
            .multipleChoice(id: "q2c_2", subsectionId: "2c", question: "Clopidogrel should be avoided with which PPI?", options: ["Omeprazole", "Pantoprazole", "Esomeprazole", "Rabeprazole"], answer: "Omeprazole", explanation: "Omeprazole inhibits CYP2C19, reducing clopidogrel activation."),
            .fillBlank(id: "q2c_3", subsectionId: "2c", question: "The brand name of clopidogrel is _____.", options: ["Plavix", "Brilinta", "Coumadin", "Eliquis"], answer: "Plavix", explanation: "Clopidogrel is sold as Plavix."),
            .multipleChoice(id: "q2c_4", subsectionId: "2c", question: "Which DOAC is preferred per many guidelines for AFib?", options: ["Apixaban", "Rivaroxaban", "Dabigatran", "Edoxaban"], answer: "Apixaban", explanation: "Apixaban (Eliquis) is often preferred due to safety profile."),
            .trueFalse(id: "q2c_5", subsectionId: "2c", question: "Warfarin requires INR monitoring.", answer: true, explanation: "Warfarin requires regular INR monitoring (goal usually 2-3)."),
            .selectAll(id: "q2c_6", subsectionId: "2c", question: "Select ALL direct Xa inhibitors:", options: ["Rivaroxaban", "Apixaban", "Warfarin", "Clopidogrel"], correctAnswers: ["Rivaroxaban", "Apixaban"], explanation: "Rivaroxaban and apixaban are direct factor Xa inhibitors."),
            .multipleChoice(id: "q2c_7", subsectionId: "2c", question: "Ticagrelor requires aspirin dose of:", options: ["81 mg only", "325 mg only", "Any dose", "No aspirin needed"], answer: "81 mg only", explanation: "Ticagrelor must be used with aspirin 81mg (not 325mg)."),
            .fillBlank(id: "q2c_8", subsectionId: "2c", question: "The brand name of apixaban is _____.", options: ["Eliquis", "Xarelto", "Coumadin", "Plavix"], answer: "Eliquis", explanation: "Apixaban is sold as Eliquis."),
            .matching(id: "q2c_9", subsectionId: "2c", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Warfarin", right: "Coumadin"), MatchingPair(left: "Rivaroxaban", right: "Xarelto"), MatchingPair(left: "Apixaban", right: "Eliquis"), MatchingPair(left: "Clopidogrel", right: "Plavix")], explanation: "Key anticoagulant/antiplatelet brand names."),
            .trueFalse(id: "q2c_10", subsectionId: "2c", difficulty: .medium, question: "DOACs require routine INR monitoring like warfarin.", answer: false, explanation: "DOACs do NOT require routine lab monitoring."),
        ]

        bank["2d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("2") && key != "2d" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["3a"] = [
            .trueFalse(id: "q3a_1", subsectionId: "3a", question: "Metformin is first-line therapy for T2DM.", answer: true, explanation: "Metformin is recommended first-line for all T2DM patients."),
            .multipleChoice(id: "q3a_2", subsectionId: "3a", question: "Metformin should be held if eGFR is below:", options: ["30", "45", "60", "15"], answer: "30", explanation: "Contraindicated if eGFR < 30 due to lactic acidosis risk."),
            .fillBlank(id: "q3a_3", subsectionId: "3a", question: "The brand name of metformin is _____.", options: ["Glucophage", "Januvia", "Amaryl", "Actos"], answer: "Glucophage", explanation: "Metformin is sold as Glucophage."),
            .trueFalse(id: "q3a_4", subsectionId: "3a", question: "Metformin commonly causes hypoglycemia when used alone.", answer: false, explanation: "Metformin does NOT cause hypoglycemia when used as monotherapy."),
            .multipleChoice(id: "q3a_5", subsectionId: "3a", question: "Which insulin is the ONLY one that can be given IV?", options: ["Regular insulin", "Glargine", "Lispro", "Detemir"], answer: "Regular insulin", explanation: "Only regular (short-acting) insulin can be given intravenously."),
            .multipleChoice(id: "q3a_6", subsectionId: "3a", question: "Insulin glargine (Lantus) is classified as:", options: ["Long-acting", "Rapid-acting", "Short-acting", "Intermediate-acting"], answer: "Long-acting", explanation: "Glargine is a long-acting, peakless insulin with 24-hour duration."),
            .fillBlank(id: "q3a_7", subsectionId: "3a", question: "Rapid-acting insulins should be given within ___ minutes of meals.", options: ["15", "30", "45", "60"], answer: "15", explanation: "Rapid-acting (lispro, aspart) onset is 15 minutes."),
            .selectAll(id: "q3a_8", subsectionId: "3a", question: "Select ALL rapid-acting insulins:", options: ["Lispro", "Aspart", "Glargine", "Regular", "Detemir"], correctAnswers: ["Lispro", "Aspart"], explanation: "Lispro (Humalog) and aspart (NovoLog) are rapid-acting."),
            .matching(id: "q3a_9", subsectionId: "3a", question: "Match insulin to brand name:", pairs: [MatchingPair(left: "Glargine", right: "Lantus"), MatchingPair(left: "Lispro", right: "Humalog"), MatchingPair(left: "Aspart", right: "NovoLog"), MatchingPair(left: "Detemir", right: "Levemir")], explanation: "Key insulin brand-generic pairs."),
            .trueFalse(id: "q3a_10", subsectionId: "3a", difficulty: .medium, question: "Insulin glargine can be mixed with other insulins in the same syringe.", answer: false, explanation: "Glargine cannot be mixed with other insulins."),
            .multipleChoice(id: "q3a_11", subsectionId: "3a", question: "Metformin should be separated from which procedure?", options: ["IV contrast dye", "X-ray", "Ultrasound", "MRI without contrast"], answer: "IV contrast dye", explanation: "Hold metformin before IV contrast to prevent lactic acidosis."),
        ]

        bank["3b"] = [
            .fillBlank(id: "q3b_1", subsectionId: "3b", question: "SGLT2 inhibitors end in _____.", options: ["-gliflozin", "-gliptin", "-glutide", "-statin"], answer: "-gliflozin", explanation: "The -gliflozin suffix identifies SGLT2 inhibitors."),
            .multipleChoice(id: "q3b_2", subsectionId: "3b", question: "The brand name of empagliflozin is:", options: ["Jardiance", "Farxiga", "Invokana", "Januvia"], answer: "Jardiance", explanation: "Empagliflozin is sold as Jardiance."),
            .trueFalse(id: "q3b_3", subsectionId: "3b", question: "SGLT2 inhibitors have shown cardiovascular and renal benefits.", answer: true, explanation: "SGLT2i have proven CV and renal benefits in major trials."),
            .multipleChoice(id: "q3b_4", subsectionId: "3b", question: "GLP-1 receptor agonists end in:", options: ["-glutide", "-gliflozin", "-gliptin", "-pril"], answer: "-glutide", explanation: "GLP-1 RAs end in -glutide (semaglutide, liraglutide)."),
            .multipleChoice(id: "q3b_5", subsectionId: "3b", question: "Which drug is available as both injection AND oral form?", options: ["Semaglutide", "Liraglutide", "Empagliflozin", "Sitagliptin"], answer: "Semaglutide", explanation: "Semaglutide: Ozempic (injection), Rybelsus (oral)."),
            .trueFalse(id: "q3b_6", subsectionId: "3b", question: "Sulfonylureas can cause hypoglycemia.", answer: true, explanation: "Sulfonylureas stimulate insulin release and can cause hypoglycemia."),
            .selectAll(id: "q3b_7", subsectionId: "3b", question: "Select ALL SGLT2 inhibitors:", options: ["Empagliflozin", "Dapagliflozin", "Sitagliptin", "Semaglutide"], correctAnswers: ["Empagliflozin", "Dapagliflozin"], explanation: "Empagliflozin and dapagliflozin are SGLT2 inhibitors."),
            .multipleChoice(id: "q3b_8", subsectionId: "3b", question: "Pioglitazone is contraindicated in:", options: ["NYHA Class III-IV HF", "Asthma", "Pregnancy only", "Renal failure"], answer: "NYHA Class III-IV HF", explanation: "TZDs can worsen heart failure by causing fluid retention."),
            .fillBlank(id: "q3b_9", subsectionId: "3b", question: "The brand name of semaglutide injection is _____.", options: ["Ozempic", "Victoza", "Trulicity", "Byetta"], answer: "Ozempic", explanation: "Semaglutide injection is Ozempic (Wegovy for obesity)."),
            .matching(id: "q3b_10", subsectionId: "3b", question: "Match drug to class:", pairs: [MatchingPair(left: "Empagliflozin", right: "SGLT2 Inhibitor"), MatchingPair(left: "Semaglutide", right: "GLP-1 RA"), MatchingPair(left: "Sitagliptin", right: "DPP-4 Inhibitor"), MatchingPair(left: "Glipizide", right: "Sulfonylurea")], explanation: "Key oral antidiabetic drug classes."),
        ]

        bank["3c"] = [
            .trueFalse(id: "q3c_1", subsectionId: "3c", question: "Levothyroxine should be taken on an empty stomach.", answer: true, explanation: "Take 30-60 minutes before food for optimal absorption."),
            .multipleChoice(id: "q3c_2", subsectionId: "3c", question: "The brand name of levothyroxine is:", options: ["Synthroid", "Tapazole", "Cytomel", "PTU"], answer: "Synthroid", explanation: "Levothyroxine is sold as Synthroid."),
            .fillBlank(id: "q3c_3", subsectionId: "3c", question: "Levothyroxine should be separated from calcium/iron by ___ hours.", options: ["4", "2", "1", "6"], answer: "4", explanation: "Calcium, iron, and antacids reduce levothyroxine absorption."),
            .multipleChoice(id: "q3c_4", subsectionId: "3c", question: "First-line treatment for hyperthyroidism is:", options: ["Methimazole", "PTU", "Levothyroxine", "Radioactive iodine"], answer: "Methimazole", explanation: "Methimazole is preferred over PTU (less hepatotoxicity)."),
            .trueFalse(id: "q3c_5", subsectionId: "3c", question: "PTU is preferred over methimazole in the 1st trimester of pregnancy.", answer: true, explanation: "PTU is preferred in 1st trimester; methimazole can cause birth defects."),
            .multipleChoice(id: "q3c_6", subsectionId: "3c", question: "A serious side effect of both methimazole and PTU is:", options: ["Agranulocytosis", "Hypoglycemia", "Peripheral edema", "Dry cough"], answer: "Agranulocytosis", explanation: "Agranulocytosis is a rare but serious risk with thionamides."),
            .selectAll(id: "q3c_7", subsectionId: "3c", question: "Select ALL drugs used for HYPOthyroidism:", options: ["Levothyroxine", "Liothyronine", "Methimazole", "PTU"], correctAnswers: ["Levothyroxine", "Liothyronine"], explanation: "Levothyroxine (T4) and liothyronine (T3) treat hypothyroidism."),
            .matching(id: "q3c_8", subsectionId: "3c", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Levothyroxine", right: "Synthroid"), MatchingPair(left: "Liothyronine", right: "Cytomel"), MatchingPair(left: "Methimazole", right: "Tapazole")], explanation: "Key thyroid drug brand-generic pairs."),
        ]

        bank["3d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("3") && key != "3d" {
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
