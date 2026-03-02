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

        let m2Sub2d = Subsection(
            id: "2d", moduleId: "m2", code: "2d",
            title: "Antianginals & Nitrates",
            description: "Nitroglycerin, Isosorbide, Ranolazine",
            iconName: "heart.text.square.fill",
            drugs: [
                Drug(id: "d63", genericName: "Nitroglycerin (sublingual)", brandName: "Nitrostat", drugClass: "Nitrate", suffix: "", indications: ["Acute angina", "Angina prophylaxis"], sideEffects: ["Headache", "Hypotension", "Reflex tachycardia", "Flushing"], clinicalPearls: ["Sublingual: onset 1-3 minutes", "Max 3 doses 5 min apart, then call 911", "Store in original glass container", "Contraindicated with PDE-5 inhibitors (sildenafil)"]),
                Drug(id: "d64", genericName: "Nitroglycerin (IV)", brandName: "Tridil", drugClass: "Nitrate", suffix: "", indications: ["ACS", "Acute HF", "Hypertensive emergency"], sideEffects: ["Hypotension", "Headache"], clinicalPearls: ["Use non-PVC tubing", "Titrate to chest pain relief"]),
                Drug(id: "d65", genericName: "Isosorbide mononitrate", brandName: "Imdur", drugClass: "Nitrate", suffix: "", indications: ["Angina prophylaxis"], sideEffects: ["Headache", "Hypotension", "Dizziness"], clinicalPearls: ["Extended-release for chronic angina", "Requires nitrate-free interval (10-12 hours)"]),
                Drug(id: "d66", genericName: "Isosorbide dinitrate", brandName: "Isordil", drugClass: "Nitrate", suffix: "", indications: ["Angina prophylaxis", "HFrEF (with hydralazine)"], sideEffects: ["Headache", "Hypotension"], clinicalPearls: ["Combined with hydralazine (BiDil) for HFrEF in Black patients", "A-HeFT trial"]),
                Drug(id: "d67", genericName: "Ranolazine", brandName: "Ranexa", drugClass: "Late Sodium Current Inhibitor", suffix: "", indications: ["Chronic stable angina"], sideEffects: ["Dizziness", "Nausea", "Constipation", "QT prolongation"], clinicalPearls: ["Add-on therapy when other agents insufficient", "Does NOT affect HR or BP", "Avoid with strong CYP3A4 inhibitors"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls2d_1", title: "Nitrates: Vasodilators for Angina", content: "Nitrates release nitric oxide (NO), causing venous and arterial dilation.", bulletPoints: ["Sublingual NTG: acute angina relief in 1-3 minutes", "Max 3 SL doses, 5 min apart - then call 911", "NEVER combine with PDE-5 inhibitors (sildenafil, tadalafil)", "Long-acting nitrates need a 10-12 hour nitrate-free interval"], highlightText: "Nitrates + PDE-5 inhibitors = SEVERE hypotension"),
                LearningSlide(id: "ls2d_2", title: "Ranolazine & Special Combinations", content: "Ranolazine is unique - it treats angina without affecting heart rate or blood pressure.", bulletPoints: ["Inhibits late sodium current in cardiac cells", "Add-on for refractory chronic stable angina", "BiDil (isosorbide dinitrate + hydralazine) for HFrEF", "A-HeFT trial showed benefit in Black patients with HF"], highlightText: "Ranolazine: angina relief without HR/BP changes"),
            ]
        )

        let m2Sub2e = Subsection(
            id: "2e", moduleId: "m2", code: "2e",
            title: "Antiarrhythmics",
            description: "Amiodarone, Digoxin, Adenosine & More",
            iconName: "waveform.path.ecg.rectangle.fill",
            drugs: [
                Drug(id: "d68", genericName: "Amiodarone", brandName: "Cordarone/Pacerone", drugClass: "Class III Antiarrhythmic", suffix: "", indications: ["AFib", "VTach", "VFib", "ACLS"], sideEffects: ["Pulmonary toxicity", "Thyroid dysfunction", "Hepatotoxicity", "Corneal deposits", "Blue-gray skin", "QT prolongation"], clinicalPearls: ["Most effective antiarrhythmic but most toxic", "Extremely long half-life (40-55 days)", "Monitor TFTs, LFTs, PFTs, eye exams", "Interacts with warfarin, digoxin, statins"]),
                Drug(id: "d69", genericName: "Dronedarone", brandName: "Multaq", drugClass: "Class III Antiarrhythmic", suffix: "", indications: ["AFib (rate/rhythm control)"], sideEffects: ["GI upset", "Bradycardia", "QT prolongation"], clinicalPearls: ["Structurally similar to amiodarone, fewer side effects", "Contraindicated in permanent AFib and NYHA IV HF"]),
                Drug(id: "d70", genericName: "Sotalol", brandName: "Betapace", drugClass: "Class III Antiarrhythmic + Beta Blocker", suffix: "-olol", indications: ["AFib", "VTach"], sideEffects: ["Bradycardia", "QT prolongation", "Torsades de Pointes"], clinicalPearls: ["Unique: both beta blocker AND class III", "Must initiate in hospital (QT monitoring)", "Renally eliminated"]),
                Drug(id: "d71", genericName: "Flecainide", brandName: "Tambocor", drugClass: "Class IC Antiarrhythmic", suffix: "", indications: ["AFib", "SVT"], sideEffects: ["Proarrhythmic", "Dizziness", "Visual disturbances"], clinicalPearls: ["Avoid in structural heart disease or CAD", "Use with AV nodal blocker (beta blocker)"]),
                Drug(id: "d72", genericName: "Digoxin", brandName: "Lanoxin", drugClass: "Cardiac Glycoside", suffix: "", indications: ["HFrEF", "AFib (rate control)"], sideEffects: ["Nausea", "Visual changes (yellow-green halos)", "Arrhythmias", "Hyperkalemia in toxicity"], clinicalPearls: ["Narrow therapeutic index (0.5-2 ng/mL)", "Toxicity increased by hypokalemia", "Renal elimination", "Antidote: Digibind (digoxin immune Fab)"]),
                Drug(id: "d73", genericName: "Adenosine", brandName: "Adenocard", drugClass: "Endogenous Nucleoside", suffix: "", indications: ["SVT (acute conversion)"], sideEffects: ["Flushing", "Chest tightness", "Transient asystole", "Bronchospasm"], clinicalPearls: ["Half-life < 10 seconds", "Rapid IV push with flush", "Avoid in WPW with AFib", "Caffeine/theophylline reduce effect"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls2e_1", title: "Amiodarone: The Kitchen Sink", content: "Amiodarone is the most effective antiarrhythmic but comes with significant toxicity.", bulletPoints: ["Blocks Na+, K+, Ca2+ channels AND beta receptors", "Half-life 40-55 days (takes weeks to reach steady state)", "Pulmonary toxicity: get baseline PFTs", "Thyroid: can cause hypo- OR hyperthyroidism (contains iodine)"], highlightText: "Amiodarone: monitor Thyroid, Liver, Lungs, Eyes"),
                LearningSlide(id: "ls2e_2", title: "Digoxin & Adenosine", content: "Special antiarrhythmics with unique mechanisms.", bulletPoints: ["Digoxin: narrow therapeutic index, 0.5-2 ng/mL", "Digoxin toxicity INCREASED by hypokalemia", "Adenosine: ultra-short acting (< 10 sec half-life)", "Adenosine: first-line for acute SVT conversion"], highlightText: "Digoxin: low K+ = toxicity risk | Adenosine: rapid IV push"),
            ]
        )

        let m2Mastery = Subsection(
            id: "2f", moduleId: "m2", code: "2f",
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
            subtitle: "Lipids, Thrombosis & Rhythm",
            iconName: "drop.triangle.fill",
            accentColorHex: "1565C0",
            subsections: [m2Sub2a, m2Sub2b, m2Sub2c, m2Sub2d, m2Sub2e, m2Mastery]
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

        let m4Sub4a = Subsection(
            id: "4a", moduleId: "m4", code: "4a",
            title: "SSRIs & SNRIs",
            description: "First-line antidepressants",
            iconName: "brain.fill",
            drugs: [
                Drug(id: "d74", genericName: "Sertraline", brandName: "Zoloft", drugClass: "SSRI", suffix: "", indications: ["MDD", "OCD", "PTSD", "Panic disorder", "Social anxiety"], sideEffects: ["Nausea", "Diarrhea", "Sexual dysfunction", "Insomnia"], clinicalPearls: ["Most prescribed antidepressant", "Preferred SSRI in cardiac patients"]),
                Drug(id: "d75", genericName: "Fluoxetine", brandName: "Prozac", drugClass: "SSRI", suffix: "", indications: ["MDD", "OCD", "Bulimia", "Panic disorder"], sideEffects: ["Nausea", "Insomnia", "Sexual dysfunction", "Anxiety"], clinicalPearls: ["Longest half-life SSRI (2-6 days)", "Active metabolite norfluoxetine", "Strong CYP2D6 inhibitor"]),
                Drug(id: "d76", genericName: "Escitalopram", brandName: "Lexapro", drugClass: "SSRI", suffix: "", indications: ["MDD", "GAD"], sideEffects: ["Nausea", "Sexual dysfunction", "QT prolongation at high doses"], clinicalPearls: ["S-enantiomer of citalopram", "Fewest drug interactions among SSRIs", "Max 20mg (QT risk)"]),
                Drug(id: "d77", genericName: "Paroxetine", brandName: "Paxil", drugClass: "SSRI", suffix: "", indications: ["MDD", "GAD", "OCD", "PTSD"], sideEffects: ["Weight gain", "Sedation", "Sexual dysfunction", "Anticholinergic effects"], clinicalPearls: ["Most anticholinergic SSRI", "Worst withdrawal syndrome", "Avoid in pregnancy (category D)"]),
                Drug(id: "d78", genericName: "Venlafaxine", brandName: "Effexor XR", drugClass: "SNRI", suffix: "", indications: ["MDD", "GAD", "Panic disorder", "Neuropathic pain"], sideEffects: ["Nausea", "Hypertension", "Sexual dysfunction", "Withdrawal syndrome"], clinicalPearls: ["Monitor blood pressure", "Acts like SSRI at low doses, SNRI at higher doses"]),
                Drug(id: "d79", genericName: "Duloxetine", brandName: "Cymbalta", drugClass: "SNRI", suffix: "", indications: ["MDD", "GAD", "Neuropathic pain", "Fibromyalgia", "Chronic musculoskeletal pain"], sideEffects: ["Nausea", "Dizziness", "Hepatotoxicity"], clinicalPearls: ["Avoid if hepatic impairment or heavy alcohol use", "Also used for stress urinary incontinence"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls4a_1", title: "SSRIs: First-Line for Depression", content: "SSRIs selectively block serotonin reuptake, increasing serotonin in the synaptic cleft.", bulletPoints: ["First-line for MDD, anxiety disorders, OCD, PTSD", "Takes 4-6 weeks for full therapeutic effect", "Common side effects: GI upset, sexual dysfunction, insomnia", "Risk of serotonin syndrome if combined with MAOIs"], highlightText: "SSRIs: 4-6 weeks for full effect"),
                LearningSlide(id: "ls4a_2", title: "SNRIs: Dual Action", content: "SNRIs block reuptake of both serotonin AND norepinephrine.", bulletPoints: ["Venlafaxine: monitor BP (dose-dependent HTN)", "Duloxetine: also treats neuropathic pain and fibromyalgia", "Both have significant withdrawal if stopped abruptly", "Taper slowly when discontinuing"], highlightText: "SNRIs = Serotonin + Norepinephrine"),
            ]
        )

        let m4Sub4b = Subsection(
            id: "4b", moduleId: "m4", code: "4b",
            title: "Benzodiazepines & Sleep Aids",
            description: "Anxiolytics and sedative-hypnotics",
            iconName: "moon.fill",
            drugs: [
                Drug(id: "d80", genericName: "Alprazolam", brandName: "Xanax", drugClass: "Benzodiazepine", suffix: "-lam/-pam", indications: ["Panic disorder", "GAD"], sideEffects: ["Sedation", "Dependence", "Respiratory depression"], clinicalPearls: ["High abuse potential", "Short-acting, rapid onset", "Schedule IV controlled substance"]),
                Drug(id: "d81", genericName: "Lorazepam", brandName: "Ativan", drugClass: "Benzodiazepine", suffix: "-lam/-pam", indications: ["Anxiety", "Status epilepticus", "Alcohol withdrawal"], sideEffects: ["Sedation", "Dependence", "Amnesia"], clinicalPearls: ["LOT drugs: Lorazepam, Oxazepam, Temazepam - no active metabolites", "Preferred in liver disease", "IV for status epilepticus"]),
                Drug(id: "d82", genericName: "Diazepam", brandName: "Valium", drugClass: "Benzodiazepine", suffix: "-lam/-pam", indications: ["Anxiety", "Muscle spasm", "Seizures", "Alcohol withdrawal"], sideEffects: ["Sedation", "Dependence", "Long half-life accumulation"], clinicalPearls: ["Very long-acting (active metabolites)", "Rectal gel available for seizures"]),
                Drug(id: "d83", genericName: "Midazolam", brandName: "Versed", drugClass: "Benzodiazepine", suffix: "-lam/-pam", indications: ["Procedural sedation", "Status epilepticus"], sideEffects: ["Respiratory depression", "Amnesia"], clinicalPearls: ["Ultra-short acting", "Used for procedural sedation", "Intranasal for seizures"]),
                Drug(id: "d84", genericName: "Zolpidem", brandName: "Ambien", drugClass: "Non-benzodiazepine hypnotic", suffix: "", indications: ["Insomnia"], sideEffects: ["Somnambulism", "Complex sleep behaviors", "Amnesia"], clinicalPearls: ["Z-drug: binds GABA-A selectively", "Short-term use only", "Lower dose for women (FDA)"]),
                Drug(id: "d85", genericName: "Suvorexant", brandName: "Belsomra", drugClass: "Orexin Receptor Antagonist", suffix: "", indications: ["Insomnia"], sideEffects: ["Daytime somnolence", "Sleep paralysis"], clinicalPearls: ["Blocks orexin (wakefulness neuropeptide)", "Novel mechanism"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls4b_1", title: "Benzodiazepines: GABA Enhancers", content: "Benzodiazepines enhance GABA-A receptor activity, producing sedation and anxiolysis.", bulletPoints: ["All contain -lam or -pam in their names", "Schedule IV controlled substances", "Reversal agent: FLUMAZENIL", "LOT drugs (Lorazepam, Oxazepam, Temazepam) preferred in liver disease"], highlightText: "Benzo reversal = Flumazenil"),
                LearningSlide(id: "ls4b_2", title: "Sleep Aids Beyond Benzos", content: "Non-benzodiazepine options for insomnia have different mechanisms.", bulletPoints: ["Zolpidem (Ambien): Z-drug, GABA-A selective", "Suvorexant (Belsomra): orexin receptor antagonist", "Trazodone: antidepressant used off-label for sleep", "Avoid long-term benzodiazepine use for insomnia"], highlightText: "Z-drugs for sleep, NOT long-term benzos"),
            ]
        )

        let m4Sub4c = Subsection(
            id: "4c", moduleId: "m4", code: "4c",
            title: "Antipsychotics",
            description: "Typical and atypical antipsychotics",
            iconName: "person.fill.questionmark",
            drugs: [
                Drug(id: "d86", genericName: "Quetiapine", brandName: "Seroquel", drugClass: "Atypical Antipsychotic", suffix: "", indications: ["Schizophrenia", "Bipolar disorder", "MDD (adjunct)", "Insomnia (off-label)"], sideEffects: ["Sedation", "Weight gain", "Metabolic syndrome", "Orthostatic hypotension"], clinicalPearls: ["Most sedating atypical", "Low doses used off-label for insomnia", "Monitor metabolic parameters"]),
                Drug(id: "d87", genericName: "Risperidone", brandName: "Risperdal", drugClass: "Atypical Antipsychotic", suffix: "", indications: ["Schizophrenia", "Bipolar mania", "Irritability in autism"], sideEffects: ["EPS", "Hyperprolactinemia", "Weight gain"], clinicalPearls: ["Most likely atypical to cause EPS", "Long-acting injectable available (Risperdal Consta)"]),
                Drug(id: "d88", genericName: "Aripiprazole", brandName: "Abilify", drugClass: "Atypical Antipsychotic", suffix: "", indications: ["Schizophrenia", "Bipolar disorder", "MDD (adjunct)", "Tourette's"], sideEffects: ["Akathisia", "Insomnia", "Nausea"], clinicalPearls: ["Partial D2 agonist (unique mechanism)", "Weight-neutral", "Most activating atypical"]),
                Drug(id: "d89", genericName: "Olanzapine", brandName: "Zyprexa", drugClass: "Atypical Antipsychotic", suffix: "", indications: ["Schizophrenia", "Bipolar disorder"], sideEffects: ["Significant weight gain", "Metabolic syndrome", "Sedation", "Diabetes risk"], clinicalPearls: ["Highest metabolic risk of all atypicals", "IM form for acute agitation"]),
                Drug(id: "d90", genericName: "Clozapine", brandName: "Clozaril", drugClass: "Atypical Antipsychotic", suffix: "", indications: ["Treatment-resistant schizophrenia"], sideEffects: ["Agranulocytosis", "Seizures", "Myocarditis", "Metabolic syndrome", "Sedation"], clinicalPearls: ["Gold standard for treatment-resistant schizophrenia", "Requires REMS: mandatory ANC monitoring", "Only antipsychotic proven to reduce suicidality"]),
                Drug(id: "d91", genericName: "Haloperidol", brandName: "Haldol", drugClass: "Typical Antipsychotic", suffix: "", indications: ["Schizophrenia", "Acute psychosis", "Tourette's"], sideEffects: ["EPS", "Tardive dyskinesia", "NMS", "QT prolongation"], clinicalPearls: ["High-potency typical", "High EPS risk", "IM/IV for acute agitation"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls4c_1", title: "Typical vs Atypical Antipsychotics", content: "Antipsychotics block dopamine D2 receptors. Atypicals also block serotonin 5-HT2A.", bulletPoints: ["Typical (1st gen): haloperidol - high EPS risk", "Atypical (2nd gen): risperidone, quetiapine, olanzapine, aripiprazole", "Atypicals: less EPS but more metabolic side effects", "NMS: neuroleptic malignant syndrome (fever, rigidity, AMS) - medical emergency"], highlightText: "Typical = EPS | Atypical = Metabolic"),
                LearningSlide(id: "ls4c_2", title: "Clozapine: The Gold Standard", content: "Clozapine is reserved for treatment-resistant schizophrenia.", bulletPoints: ["ONLY antipsychotic for treatment-resistant schizophrenia", "Requires REMS: weekly then biweekly ANC monitoring", "Risk of agranulocytosis (1-2%)", "Only antipsychotic proven to reduce suicidality"], highlightText: "Clozapine: REMS required, monitor ANC"),
            ]
        )

        let m4Sub4d = Subsection(
            id: "4d", moduleId: "m4", code: "4d",
            title: "Seizure & Mood Stabilizers",
            description: "Antiepileptics and lithium",
            iconName: "bolt.fill",
            drugs: [
                Drug(id: "d92", genericName: "Lithium", brandName: "Lithobid", drugClass: "Mood Stabilizer", suffix: "", indications: ["Bipolar disorder"], sideEffects: ["Tremor", "Polyuria", "Hypothyroidism", "Nephrogenic DI", "Teratogenic (Ebstein anomaly)"], clinicalPearls: ["Narrow therapeutic index: 0.6-1.2 mEq/L", "Monitor levels, renal function, thyroid", "Avoid NSAIDs, ACE inhibitors, thiazides (increase levels)"]),
                Drug(id: "d93", genericName: "Valproic acid", brandName: "Depakote", drugClass: "Anticonvulsant / Mood Stabilizer", suffix: "", indications: ["Seizures", "Bipolar disorder", "Migraine prophylaxis"], sideEffects: ["Hepatotoxicity", "Pancreatitis", "Thrombocytopenia", "Weight gain", "Teratogenic (neural tube defects)"], clinicalPearls: ["Black box: hepatotoxicity, pancreatitis, teratogenicity", "Monitor LFTs and CBC"]),
                Drug(id: "d94", genericName: "Lamotrigine", brandName: "Lamictal", drugClass: "Anticonvulsant / Mood Stabilizer", suffix: "", indications: ["Seizures", "Bipolar depression"], sideEffects: ["SJS/TEN", "Rash", "Dizziness", "Headache"], clinicalPearls: ["MUST titrate slowly to prevent SJS/TEN", "Preferred for bipolar depression", "Valproate increases lamotrigine levels"]),
                Drug(id: "d95", genericName: "Levetiracetam", brandName: "Keppra", drugClass: "Anticonvulsant", suffix: "", indications: ["Partial seizures", "Generalized seizures"], sideEffects: ["Behavioral changes", "Irritability", "Somnolence"], clinicalPearls: ["Few drug interactions", "Renally eliminated", "Can cause 'Keppra rage'"]),
                Drug(id: "d96", genericName: "Carbamazepine", brandName: "Tegretol", drugClass: "Anticonvulsant", suffix: "", indications: ["Seizures", "Trigeminal neuralgia", "Bipolar disorder"], sideEffects: ["SJS/TEN", "Aplastic anemia", "Hyponatremia (SIADH)", "Hepatotoxicity"], clinicalPearls: ["Strong CYP3A4 inducer (many drug interactions)", "HLA-B*1502 testing in Asian patients (SJS risk)", "Autoinduction: doses need to increase over time"]),
                Drug(id: "d97", genericName: "Phenytoin", brandName: "Dilantin", drugClass: "Anticonvulsant", suffix: "", indications: ["Seizures", "Status epilepticus"], sideEffects: ["Gingival hyperplasia", "Hirsutism", "Ataxia", "Nystagmus", "Osteoporosis"], clinicalPearls: ["Zero-order kinetics (small dose changes = big level changes)", "Monitor free levels if low albumin", "Many drug interactions"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls4d_1", title: "Mood Stabilizers", content: "Lithium and certain anticonvulsants are mainstays of bipolar disorder treatment.", bulletPoints: ["Lithium: narrow index 0.6-1.2, monitor levels/renal/thyroid", "Valproic acid: monitor LFTs, teratogenic", "Lamotrigine: titrate slowly (SJS risk), preferred for bipolar depression", "Avoid lithium with NSAIDs, ACE inhibitors, thiazides"], highlightText: "Lithium: 0.6-1.2 mEq/L, avoid NSAIDs"),
                LearningSlide(id: "ls4d_2", title: "Key Anticonvulsants", content: "Know the unique side effects and monitoring for each anticonvulsant.", bulletPoints: ["Phenytoin: zero-order kinetics, gingival hyperplasia", "Carbamazepine: CYP inducer, HLA-B*1502 testing", "Levetiracetam: few interactions but behavioral side effects", "Lamotrigine: SJS/TEN risk with rapid titration"], highlightText: "Phenytoin = zero-order | Carbamazepine = CYP inducer"),
            ]
        )

        let m4Mastery = Subsection(
            id: "4e", moduleId: "m4", code: "4e",
            title: "Mastery: CNS & Psychiatry",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module4 = DrugModule(
            id: "m4", number: 4,
            title: "CNS & Psychiatry",
            subtitle: "Antidepressants, Anxiolytics & More",
            iconName: "brain.fill",
            accentColorHex: "00897B",
            subsections: [m4Sub4a, m4Sub4b, m4Sub4c, m4Sub4d, m4Mastery]
        )

        let m5Sub5a = Subsection(
            id: "5a", moduleId: "m5", code: "5a",
            title: "Penicillins & Cephalosporins",
            description: "Beta-lactam antibiotics",
            iconName: "pills.fill",
            drugs: [
                Drug(id: "d98", genericName: "Amoxicillin", brandName: "Amoxil", drugClass: "Aminopenicillin", suffix: "-cillin", indications: ["Otitis media", "Sinusitis", "Strep pharyngitis", "H. pylori"], sideEffects: ["Diarrhea", "Rash", "Allergic reactions"], clinicalPearls: ["Most commonly prescribed antibiotic in children", "Part of H. pylori triple therapy"]),
                Drug(id: "d99", genericName: "Amoxicillin/Clavulanate", brandName: "Augmentin", drugClass: "Aminopenicillin + Beta-lactamase inhibitor", suffix: "", indications: ["Sinusitis", "Otitis media", "UTI", "Bite wounds"], sideEffects: ["Diarrhea", "Nausea", "Rash"], clinicalPearls: ["Clavulanate inhibits beta-lactamase", "Broader spectrum than amoxicillin alone"]),
                Drug(id: "d100", genericName: "Piperacillin/Tazobactam", brandName: "Zosyn", drugClass: "Extended-spectrum penicillin", suffix: "", indications: ["Nosocomial infections", "Intra-abdominal infections", "Febrile neutropenia"], sideEffects: ["Diarrhea", "Thrombocytopenia"], clinicalPearls: ["IV only, broad-spectrum", "Covers Pseudomonas", "Often called 'pip-tazo'"]),
                Drug(id: "d101", genericName: "Cephalexin", brandName: "Keflex", drugClass: "1st-gen Cephalosporin", suffix: "ceph-/cef-", indications: ["Skin infections", "UTI", "Strep pharyngitis"], sideEffects: ["Diarrhea", "Nausea"], clinicalPearls: ["1st-gen: best gram-positive coverage", "Oral, well-tolerated"]),
                Drug(id: "d102", genericName: "Ceftriaxone", brandName: "Rocephin", drugClass: "3rd-gen Cephalosporin", suffix: "ceph-/cef-", indications: ["Meningitis", "Pneumonia", "Gonorrhea", "Lyme disease"], sideEffects: ["Diarrhea", "Biliary sludging"], clinicalPearls: ["IM/IV, once daily dosing", "Do NOT mix with calcium-containing IV fluids in neonates", "Empiric for meningitis"]),
                Drug(id: "d103", genericName: "Cefepime", brandName: "Maxipime", drugClass: "4th-gen Cephalosporin", suffix: "ceph-/cef-", indications: ["Febrile neutropenia", "Nosocomial pneumonia", "Pseudomonal infections"], sideEffects: ["Neurotoxicity", "Diarrhea"], clinicalPearls: ["4th-gen: covers Pseudomonas", "Dose adjust for renal impairment", "Can cause neurotoxicity (seizures) in renal failure"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls5a_1", title: "Penicillins: Beta-Lactam Backbone", content: "Penicillins kill bacteria by inhibiting cell wall synthesis (PBP binding).", bulletPoints: ["Natural penicillins: Pen G, Pen VK (narrow spectrum)", "Aminopenicillins: amoxicillin, ampicillin (broader)", "Beta-lactamase inhibitors: clavulanate, tazobactam, sulbactam", "Cross-reactivity with cephalosporins ~1-2%"], highlightText: "All beta-lactams inhibit cell wall synthesis"),
                LearningSlide(id: "ls5a_2", title: "Cephalosporin Generations", content: "Each generation trades gram-positive for gram-negative coverage.", bulletPoints: ["1st gen (cephalexin): best gram-positive", "2nd gen (cefuroxime): more gram-negative", "3rd gen (ceftriaxone): broad gram-negative, crosses BBB", "4th gen (cefepime): covers Pseudomonas"], highlightText: "Higher generation = more gram-negative coverage"),
            ]
        )

        let m5Sub5b = Subsection(
            id: "5b", moduleId: "m5", code: "5b",
            title: "Fluoroquinolones & Macrolides",
            description: "Broad-spectrum antibiotics",
            iconName: "capsule.fill",
            drugs: [
                Drug(id: "d104", genericName: "Ciprofloxacin", brandName: "Cipro", drugClass: "Fluoroquinolone", suffix: "-floxacin", indications: ["UTI", "Anthrax", "Pseudomonal infections", "Traveler's diarrhea"], sideEffects: ["Tendon rupture", "QT prolongation", "CNS effects", "Aortic dissection risk"], clinicalPearls: ["Black box: tendinitis/tendon rupture", "Avoid in children", "Chelates with divalent cations (Ca, Mg, Fe)"]),
                Drug(id: "d105", genericName: "Levofloxacin", brandName: "Levaquin", drugClass: "Fluoroquinolone", suffix: "-floxacin", indications: ["CAP", "UTI", "Sinusitis"], sideEffects: ["Tendon rupture", "QT prolongation", "C. diff"], clinicalPearls: ["Respiratory fluoroquinolone", "Better pneumococcal coverage than cipro"]),
                Drug(id: "d106", genericName: "Azithromycin", brandName: "Zithromax/Z-Pack", drugClass: "Macrolide", suffix: "-mycin/-thromycin", indications: ["CAP", "Strep pharyngitis", "Chlamydia", "MAC prophylaxis"], sideEffects: ["GI upset", "QT prolongation", "Hepatotoxicity"], clinicalPearls: ["Z-Pack: 5-day course", "Long tissue half-life", "CYP3A4 inhibitor (weak)"]),
                Drug(id: "d107", genericName: "Clarithromycin", brandName: "Biaxin", drugClass: "Macrolide", suffix: "-mycin/-thromycin", indications: ["CAP", "H. pylori", "MAC"], sideEffects: ["Metallic taste", "GI upset", "QT prolongation"], clinicalPearls: ["Strong CYP3A4 inhibitor", "Part of H. pylori regimens"]),
                Drug(id: "d108", genericName: "Doxycycline", brandName: "Vibramycin", drugClass: "Tetracycline", suffix: "-cycline", indications: ["Acne", "Lyme disease", "MRSA skin infections", "Chlamydia", "Malaria prophylaxis"], sideEffects: ["Photosensitivity", "GI upset", "Esophageal ulceration", "Tooth discoloration in children"], clinicalPearls: ["Take with full glass of water, sit upright", "Avoid in children < 8 and pregnancy", "Chelates with divalent cations"]),
                Drug(id: "d109", genericName: "Trimethoprim/Sulfamethoxazole", brandName: "Bactrim", drugClass: "Sulfonamide combination", suffix: "", indications: ["UTI", "MRSA skin infections", "PJP prophylaxis"], sideEffects: ["Hyperkalemia", "Rash", "SJS/TEN", "Bone marrow suppression"], clinicalPearls: ["TMP/SMX = Bactrim", "Sulfa allergy common", "Monitor K+ and renal function"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls5b_1", title: "Fluoroquinolones: The -floxacin Family", content: "Fluoroquinolones inhibit DNA gyrase and topoisomerase IV.", bulletPoints: ["All end in -floxacin", "Black box: tendinitis/rupture, especially with steroids", "Avoid in children (cartilage damage)", "Chelate with divalent cations (separate by 2 hours)"], highlightText: "-floxacin = Fluoroquinolone, Black Box: tendons"),
                LearningSlide(id: "ls5b_2", title: "Macrolides & Other Key Antibiotics", content: "Macrolides inhibit protein synthesis by binding the 50S ribosomal subunit.", bulletPoints: ["Azithromycin: Z-Pack, long tissue half-life", "Doxycycline: versatile tetracycline, photosensitivity", "TMP/SMX (Bactrim): first-line for UTIs and MRSA skin", "All macrolides can prolong QT interval"], highlightText: "Macrolides = 50S | QT prolongation risk"),
            ]
        )

        let m5Sub5c = Subsection(
            id: "5c", moduleId: "m5", code: "5c",
            title: "Vancomycin & Anti-MRSA",
            description: "Glycopeptides and resistant gram-positive coverage",
            iconName: "shield.fill",
            drugs: [
                Drug(id: "d110", genericName: "Vancomycin (IV)", brandName: "Vancocin", drugClass: "Glycopeptide", suffix: "", indications: ["MRSA", "Serious gram-positive infections", "Endocarditis"], sideEffects: ["Nephrotoxicity", "Red man syndrome", "Ototoxicity", "Thrombocytopenia"], clinicalPearls: ["Monitor trough levels (AUC/MIC preferred)", "Red man syndrome: slow infusion rate", "IV for systemic; oral for C. diff"]),
                Drug(id: "d111", genericName: "Vancomycin (oral)", brandName: "Vancocin", drugClass: "Glycopeptide", suffix: "", indications: ["C. difficile colitis"], sideEffects: ["Nausea", "Abdominal pain"], clinicalPearls: ["Oral vancomycin stays in GI tract", "NOT absorbed systemically", "First-line for C. diff"]),
                Drug(id: "d112", genericName: "Linezolid", brandName: "Zyvox", drugClass: "Oxazolidinone", suffix: "", indications: ["VRE", "MRSA pneumonia"], sideEffects: ["Thrombocytopenia", "Serotonin syndrome", "Lactic acidosis", "Peripheral neuropathy"], clinicalPearls: ["Weak MAO inhibitor: risk of serotonin syndrome with SSRIs", "Monitor CBC weekly", "Limit course to 14 days when possible"]),
                Drug(id: "d113", genericName: "Daptomycin", brandName: "Cubicin", drugClass: "Lipopeptide", suffix: "", indications: ["MRSA bacteremia", "Endocarditis", "Skin infections"], sideEffects: ["CPK elevation", "Myopathy", "Eosinophilic pneumonia"], clinicalPearls: ["Inactivated by surfactant: do NOT use for pneumonia", "Monitor CPK weekly"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls5c_1", title: "Vancomycin: IV vs Oral", content: "Vancomycin is a glycopeptide antibiotic critical for resistant gram-positive infections.", bulletPoints: ["IV vancomycin: MRSA, bacteremia, endocarditis", "Oral vancomycin: C. difficile only (not absorbed)", "Red man syndrome: histamine release, slow the infusion", "Monitor AUC/MIC or trough levels for IV"], highlightText: "IV vanco = MRSA | Oral vanco = C. diff"),
                LearningSlide(id: "ls5c_2", title: "Linezolid & Daptomycin", content: "Reserved agents for resistant gram-positive organisms.", bulletPoints: ["Linezolid: covers VRE, weak MAO inhibitor", "Daptomycin: NEVER use for pneumonia (inactivated by surfactant)", "Monitor CPK with daptomycin, CBC with linezolid"], highlightText: "Daptomycin: NO pneumonia | Linezolid: serotonin risk"),
            ]
        )

        let m5Mastery = Subsection(
            id: "5d", moduleId: "m5", code: "5d",
            title: "Mastery: Infectious Disease",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module5 = DrugModule(
            id: "m5", number: 5,
            title: "Infectious Disease",
            subtitle: "Antibiotics, Antivirals & Antifungals",
            iconName: "microbe.fill",
            accentColorHex: "EF6C00",
            subsections: [m5Sub5a, m5Sub5b, m5Sub5c, m5Mastery]
        )

        let m6Sub6a = Subsection(
            id: "6a", moduleId: "m6", code: "6a",
            title: "Inhaled Corticosteroids & LABAs",
            description: "Foundation of asthma and COPD maintenance",
            iconName: "lungs.fill",
            drugs: [
                Drug(id: "d114", genericName: "Fluticasone (inhaled)", brandName: "Flovent HFA", drugClass: "Inhaled Corticosteroid", suffix: "", indications: ["Asthma", "COPD"], sideEffects: ["Oral thrush", "Dysphonia", "Adrenal suppression (high dose)"], clinicalPearls: ["Rinse mouth after use to prevent thrush", "Maintenance only - NOT for acute rescue"]),
                Drug(id: "d115", genericName: "Budesonide (inhaled)", brandName: "Pulmicort", drugClass: "Inhaled Corticosteroid", suffix: "", indications: ["Asthma", "Croup"], sideEffects: ["Oral thrush", "Hoarseness"], clinicalPearls: ["Nebulizer form for young children", "Also available as Pulmicort Flexhaler"]),
                Drug(id: "d116", genericName: "Fluticasone/Salmeterol", brandName: "Advair", drugClass: "ICS/LABA Combination", suffix: "", indications: ["Asthma", "COPD"], sideEffects: ["Oral thrush", "Tachycardia", "Tremor"], clinicalPearls: ["Diskus or HFA formulations", "LABA should NEVER be used alone in asthma"]),
                Drug(id: "d117", genericName: "Budesonide/Formoterol", brandName: "Symbicort", drugClass: "ICS/LABA Combination", suffix: "", indications: ["Asthma", "COPD"], sideEffects: ["Oral thrush", "Headache", "Tremor"], clinicalPearls: ["Can be used as both maintenance AND reliever (SMART therapy)", "Formoterol has rapid onset unlike salmeterol"]),
                Drug(id: "d118", genericName: "Salmeterol", brandName: "Serevent", drugClass: "LABA", suffix: "", indications: ["Asthma (with ICS)", "COPD"], sideEffects: ["Tachycardia", "Tremor", "Headache"], clinicalPearls: ["Black box: increased asthma-related death if used without ICS", "Twice daily, slow onset"]),
                Drug(id: "d119", genericName: "Mometasone/Formoterol", brandName: "Dulera", drugClass: "ICS/LABA Combination", suffix: "", indications: ["Asthma"], sideEffects: ["Oral thrush", "Headache"], clinicalPearls: ["MDI formulation", "Alternative ICS/LABA option"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls6a_1", title: "Inhaled Corticosteroids (ICS)", content: "ICS are the cornerstone of persistent asthma maintenance therapy.", bulletPoints: ["Reduce airway inflammation and hyperresponsiveness", "NOT for acute rescue - maintenance only", "Rinse mouth after each use to prevent oral thrush", "Fluticasone (Flovent) and budesonide (Pulmicort) are most common"], highlightText: "ICS = Maintenance, NOT rescue. Rinse mouth!"),
                LearningSlide(id: "ls6a_2", title: "LABAs & Combination Inhalers", content: "LABAs provide long-acting bronchodilation but must ALWAYS be paired with ICS in asthma.", bulletPoints: ["Black Box Warning: LABAs alone increase asthma death risk", "Advair = fluticasone + salmeterol", "Symbicort = budesonide + formoterol (SMART therapy)", "Formoterol has rapid onset; salmeterol is slower"], highlightText: "LABA alone in asthma = Black Box Warning"),
            ]
        )

        let m6Sub6b = Subsection(
            id: "6b", moduleId: "m6", code: "6b",
            title: "SABAs, Anticholinergics & Rescue",
            description: "Quick-relief and COPD maintenance agents",
            iconName: "wind",
            drugs: [
                Drug(id: "d120", genericName: "Albuterol", brandName: "ProAir/Ventolin", drugClass: "SABA", suffix: "", indications: ["Acute bronchospasm", "Asthma rescue", "Exercise-induced bronchospasm"], sideEffects: ["Tachycardia", "Tremor", "Hypokalemia"], clinicalPearls: ["First-line rescue inhaler", "Beta-2 agonist", "Onset 5-15 minutes"]),
                Drug(id: "d121", genericName: "Levalbuterol", brandName: "Xopenex", drugClass: "SABA", suffix: "", indications: ["Acute bronchospasm"], sideEffects: ["Tachycardia", "Tremor"], clinicalPearls: ["R-enantiomer of albuterol", "May cause fewer cardiac side effects", "More expensive than albuterol"]),
                Drug(id: "d122", genericName: "Ipratropium", brandName: "Atrovent", drugClass: "Short-acting Anticholinergic", suffix: "", indications: ["COPD", "Acute bronchospasm (with albuterol)"], sideEffects: ["Dry mouth", "Urinary retention", "Blurred vision"], clinicalPearls: ["Often combined with albuterol in nebulizer (DuoNeb)", "Blocks muscarinic receptors in airways"]),
                Drug(id: "d123", genericName: "Tiotropium", brandName: "Spiriva", drugClass: "LAMA", suffix: "", indications: ["COPD", "Asthma (add-on)"], sideEffects: ["Dry mouth", "Urinary retention", "Constipation"], clinicalPearls: ["Once daily, long-acting anticholinergic", "Cornerstone of COPD maintenance", "HandiHaler or Respimat devices"]),
                Drug(id: "d124", genericName: "Umeclidinium/Vilanterol", brandName: "Anoro Ellipta", drugClass: "LAMA/LABA Combination", suffix: "", indications: ["COPD"], sideEffects: ["Dry mouth", "Headache", "Tachycardia"], clinicalPearls: ["Dual bronchodilator for COPD", "Once daily Ellipta device"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls6b_1", title: "SABAs: The Rescue Inhalers", content: "Short-acting beta-2 agonists provide rapid bronchodilation for acute symptoms.", bulletPoints: ["Albuterol (ProAir/Ventolin): first-line rescue", "Onset 5-15 minutes, duration 4-6 hours", "Side effects: tachycardia, tremor, hypokalemia", "Using rescue inhaler >2 days/week = uncontrolled asthma"], highlightText: "Albuterol = #1 rescue inhaler"),
                LearningSlide(id: "ls6b_2", title: "Anticholinergics in Airways", content: "Anticholinergics block muscarinic receptors to reduce bronchospasm and secretions.", bulletPoints: ["Ipratropium (Atrovent): short-acting, often with albuterol", "Tiotropium (Spiriva): long-acting, once daily for COPD", "Key side effect: dry mouth", "LAMA + LABA combos (Anoro) for COPD dual bronchodilation"], highlightText: "Tiotropium = COPD maintenance cornerstone"),
            ]
        )

        let m6Sub6c = Subsection(
            id: "6c", moduleId: "m6", code: "6c",
            title: "Montelukast & Specialty Agents",
            description: "Leukotriene modifiers, biologics, and more",
            iconName: "allergens.fill",
            drugs: [
                Drug(id: "d125", genericName: "Montelukast", brandName: "Singulair", drugClass: "Leukotriene Receptor Antagonist", suffix: "", indications: ["Asthma", "Allergic rhinitis", "Exercise-induced bronchospasm"], sideEffects: ["Headache", "Neuropsychiatric events (Black Box)"], clinicalPearls: ["Black Box: suicidal ideation, depression, behavioral changes", "Oral, taken at bedtime", "Alternative to ICS for mild persistent asthma"]),
                Drug(id: "d126", genericName: "Omalizumab", brandName: "Xolair", drugClass: "Anti-IgE Monoclonal Antibody", suffix: "", indications: ["Moderate-severe allergic asthma", "Chronic urticaria"], sideEffects: ["Anaphylaxis", "Injection site reactions"], clinicalPearls: ["Binds free IgE", "SubQ injection q2-4 weeks", "Black Box: anaphylaxis risk - observe 2 hours after first doses"]),
                Drug(id: "d127", genericName: "Dupilumab", brandName: "Dupixent", drugClass: "Anti-IL-4/IL-13 Monoclonal Antibody", suffix: "", indications: ["Moderate-severe asthma", "Atopic dermatitis", "Nasal polyps"], sideEffects: ["Injection site reactions", "Conjunctivitis", "Eosinophilia"], clinicalPearls: ["Blocks IL-4 and IL-13 signaling", "SubQ injection q2 weeks", "Also used for eczema and nasal polyps"]),
                Drug(id: "d128", genericName: "Roflumilast", brandName: "Daliresp", drugClass: "PDE-4 Inhibitor", suffix: "", indications: ["Severe COPD (reduce exacerbations)"], sideEffects: ["Diarrhea", "Weight loss", "Nausea", "Psychiatric symptoms"], clinicalPearls: ["Oral PDE-4 inhibitor", "Add-on for COPD with chronic bronchitis phenotype", "NOT a bronchodilator"]),
                Drug(id: "d129", genericName: "Theophylline", brandName: "Theo-24", drugClass: "Methylxanthine", suffix: "", indications: ["Asthma", "COPD"], sideEffects: ["Tachycardia", "Seizures", "Nausea", "Arrhythmias"], clinicalPearls: ["Narrow therapeutic index: 5-15 mcg/mL", "Many drug/food interactions", "Rarely used now due to toxicity"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls6c_1", title: "Montelukast & Leukotrienes", content: "Leukotriene modifiers block inflammatory mediators in asthma.", bulletPoints: ["Montelukast (Singulair): oral, taken at bedtime", "Black Box: neuropsychiatric events (suicidality, behavior changes)", "Alternative to low-dose ICS for mild persistent asthma", "Also helps allergic rhinitis and exercise-induced bronchospasm"], highlightText: "Montelukast Black Box: neuropsychiatric events"),
                LearningSlide(id: "ls6c_2", title: "Biologics for Severe Asthma", content: "Monoclonal antibodies target specific immune pathways for severe asthma.", bulletPoints: ["Omalizumab (Xolair): anti-IgE, anaphylaxis risk", "Dupilumab (Dupixent): anti-IL-4/IL-13, also for eczema", "Roflumilast: PDE-4 inhibitor for severe COPD", "Theophylline: rarely used, narrow therapeutic index"], highlightText: "Biologics for SEVERE, uncontrolled asthma"),
            ]
        )

        let m6Mastery = Subsection(
            id: "6d", moduleId: "m6", code: "6d",
            title: "Mastery: Respiratory",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module6 = DrugModule(
            id: "m6", number: 6,
            title: "Respiratory",
            subtitle: "Asthma, COPD & Airways",
            iconName: "lungs.fill",
            accentColorHex: "0288D1",
            subsections: [m6Sub6a, m6Sub6b, m6Sub6c, m6Mastery]
        )

        let m7Sub7a = Subsection(
            id: "7a", moduleId: "m7", code: "7a",
            title: "PPIs & H2 Blockers",
            description: "Acid suppression therapy",
            iconName: "flame.fill",
            drugs: [
                Drug(id: "d130", genericName: "Omeprazole", brandName: "Prilosec", drugClass: "Proton Pump Inhibitor", suffix: "-prazole", indications: ["GERD", "Peptic ulcer", "H. pylori", "Zollinger-Ellison"], sideEffects: ["C. diff risk", "Hypomagnesemia", "Bone fractures", "B12 deficiency"], clinicalPearls: ["Take 30-60 min before first meal", "Most commonly used PPI", "Inhibits CYP2C19 (avoid with clopidogrel)"]),
                Drug(id: "d131", genericName: "Esomeprazole", brandName: "Nexium", drugClass: "Proton Pump Inhibitor", suffix: "-prazole", indications: ["GERD", "Erosive esophagitis"], sideEffects: ["C. diff risk", "Hypomagnesemia"], clinicalPearls: ["S-enantiomer of omeprazole", "IV formulation available"]),
                Drug(id: "d132", genericName: "Pantoprazole", brandName: "Protonix", drugClass: "Proton Pump Inhibitor", suffix: "-prazole", indications: ["GERD", "Erosive esophagitis", "ICU stress ulcer prophylaxis"], sideEffects: ["C. diff risk", "Hypomagnesemia"], clinicalPearls: ["Preferred PPI with clopidogrel (less CYP2C19 interaction)", "IV available for hospital use"]),
                Drug(id: "d133", genericName: "Lansoprazole", brandName: "Prevacid", drugClass: "Proton Pump Inhibitor", suffix: "-prazole", indications: ["GERD", "Peptic ulcer"], sideEffects: ["C. diff risk", "Headache"], clinicalPearls: ["Orally disintegrating tablet available", "Part of some H. pylori regimens"]),
                Drug(id: "d134", genericName: "Famotidine", brandName: "Pepcid", drugClass: "H2 Receptor Antagonist", suffix: "-tidine", indications: ["GERD", "Peptic ulcer", "Heartburn"], sideEffects: ["Headache", "Dizziness", "Constipation"], clinicalPearls: ["Most commonly used H2 blocker", "Less potent than PPIs", "Can be used PRN for heartburn"]),
                Drug(id: "d135", genericName: "Sucralfate", brandName: "Carafate", drugClass: "Mucosal Protectant", suffix: "", indications: ["Duodenal ulcer", "Stress ulcer prophylaxis"], sideEffects: ["Constipation", "Drug interactions (chelation)"], clinicalPearls: ["Forms protective barrier over ulcer", "Take on empty stomach", "Separate from other drugs by 2 hours"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls7a_1", title: "PPIs: The -prazole Family", content: "PPIs irreversibly block the H+/K+ ATPase proton pump in parietal cells.", bulletPoints: ["All end in -prazole", "Most potent acid suppression available", "Take 30-60 min BEFORE first meal of the day", "Long-term risks: C. diff, fractures, hypomagnesemia, B12 deficiency"], highlightText: "-prazole = PPI. Take BEFORE meals!"),
                LearningSlide(id: "ls7a_2", title: "H2 Blockers & Mucosal Agents", content: "H2 blockers and mucosal protectants offer alternative acid management.", bulletPoints: ["H2 blockers end in -tidine (famotidine, ranitidine)", "Less potent than PPIs but faster onset", "Sucralfate: coats ulcer, take on empty stomach", "Omeprazole + clopidogrel = avoid (CYP2C19 interaction)"], highlightText: "H2 = -tidine | PPI = -prazole"),
            ]
        )

        let m7Sub7b = Subsection(
            id: "7b", moduleId: "m7", code: "7b",
            title: "Antiemetics",
            description: "Ondansetron, Promethazine, and more",
            iconName: "stomach.fill",
            drugs: [
                Drug(id: "d136", genericName: "Ondansetron", brandName: "Zofran", drugClass: "5-HT3 Antagonist", suffix: "-setron", indications: ["Chemotherapy-induced N/V", "Post-op N/V", "Gastroenteritis"], sideEffects: ["Headache", "Constipation", "QT prolongation"], clinicalPearls: ["First-line for most nausea/vomiting", "Available as ODT (orally disintegrating tablet)", "IV and oral formulations"]),
                Drug(id: "d137", genericName: "Promethazine", brandName: "Phenergan", drugClass: "Phenothiazine Antiemetic", suffix: "", indications: ["Nausea", "Motion sickness", "Allergies"], sideEffects: ["Sedation", "EPS", "Tissue necrosis (IV)", "Respiratory depression"], clinicalPearls: ["Black Box: avoid in children < 2 (respiratory depression)", "IV can cause tissue necrosis - use deep IM or oral", "Highly sedating"]),
                Drug(id: "d138", genericName: "Metoclopramide", brandName: "Reglan", drugClass: "Dopamine Antagonist / Prokinetic", suffix: "", indications: ["Gastroparesis", "GERD", "Nausea"], sideEffects: ["EPS", "Tardive dyskinesia", "Drowsiness"], clinicalPearls: ["Black Box: tardive dyskinesia with long-term use", "Prokinetic agent (increases GI motility)", "Limit use to 12 weeks"]),
                Drug(id: "d139", genericName: "Scopolamine", brandName: "Transderm Scop", drugClass: "Anticholinergic", suffix: "", indications: ["Motion sickness", "Post-op N/V"], sideEffects: ["Dry mouth", "Drowsiness", "Blurred vision", "Urinary retention"], clinicalPearls: ["Transdermal patch behind the ear", "Apply 4 hours before travel", "Wash hands after handling patch"]),
                Drug(id: "d140", genericName: "Aprepitant", brandName: "Emend", drugClass: "NK1 Receptor Antagonist", suffix: "", indications: ["Highly emetogenic chemotherapy"], sideEffects: ["Fatigue", "Hiccups", "Diarrhea"], clinicalPearls: ["Added to 5-HT3 + dexamethasone for high emetic risk", "CYP3A4 substrate and inhibitor"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls7b_1", title: "Ondansetron: First-Line Antiemetic", content: "5-HT3 antagonists are the most commonly used antiemetics.", bulletPoints: ["Ondansetron (Zofran): first-line for most N/V", "Available as ODT, IV, and oral", "Risk of QT prolongation at high doses", "-setron suffix identifies 5-HT3 blockers"], highlightText: "Ondansetron = #1 antiemetic"),
                LearningSlide(id: "ls7b_2", title: "Other Antiemetic Classes", content: "Different mechanisms target different causes of nausea.", bulletPoints: ["Metoclopramide: prokinetic, Black Box for tardive dyskinesia", "Scopolamine: anticholinergic patch for motion sickness", "Aprepitant: NK1 antagonist for chemo-induced N/V", "Promethazine: sedating, avoid in children < 2"], highlightText: "Match antiemetic to the CAUSE of nausea"),
            ]
        )

        let m7Sub7c = Subsection(
            id: "7c", moduleId: "m7", code: "7c",
            title: "Laxatives & IBD Agents",
            description: "Constipation, IBS, and inflammatory bowel disease",
            iconName: "cross.vial.fill",
            drugs: [
                Drug(id: "d141", genericName: "Polyethylene glycol", brandName: "MiraLAX", drugClass: "Osmotic Laxative", suffix: "", indications: ["Constipation", "Bowel prep"], sideEffects: ["Bloating", "Diarrhea", "Nausea"], clinicalPearls: ["First-line for chronic constipation", "OTC, well-tolerated", "Mix with any clear liquid"]),
                Drug(id: "d142", genericName: "Docusate sodium", brandName: "Colace", drugClass: "Stool Softener", suffix: "", indications: ["Constipation prevention"], sideEffects: ["Mild cramping"], clinicalPearls: ["Surfactant - softens stool", "Often used post-surgery or with opioids", "Efficacy debated"]),
                Drug(id: "d143", genericName: "Bisacodyl", brandName: "Dulcolax", drugClass: "Stimulant Laxative", suffix: "", indications: ["Acute constipation", "Bowel prep"], sideEffects: ["Cramping", "Diarrhea", "Electrolyte imbalance"], clinicalPearls: ["Stimulates colonic motility", "Available as oral and suppository", "Avoid long-term use"]),
                Drug(id: "d144", genericName: "Mesalamine", brandName: "Asacol/Lialda", drugClass: "5-ASA", suffix: "", indications: ["Ulcerative colitis", "Crohn's disease (mild)"], sideEffects: ["Headache", "Nausea", "Nephrotoxicity (rare)"], clinicalPearls: ["First-line for mild-moderate UC", "Topical anti-inflammatory in GI tract", "Multiple oral and rectal formulations"]),
                Drug(id: "d145", genericName: "Infliximab", brandName: "Remicade", drugClass: "Anti-TNF Monoclonal Antibody", suffix: "", indications: ["Crohn's disease", "Ulcerative colitis", "Rheumatoid arthritis", "Psoriasis"], sideEffects: ["Infection risk", "Infusion reactions", "Reactivation of TB", "Lymphoma risk"], clinicalPearls: ["Screen for TB before starting", "IV infusion q6-8 weeks after loading", "Anti-TNF-alpha biologic"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls7c_1", title: "Laxatives by Mechanism", content: "Different laxative classes work through distinct mechanisms.", bulletPoints: ["Osmotic (MiraLAX): draws water into colon, first-line", "Stool softener (Colace): surfactant, prevention", "Stimulant (Dulcolax): increases colonic motility", "Bulk-forming (psyllium/Metamucil): fiber supplement"], highlightText: "MiraLAX = first-line for chronic constipation"),
                LearningSlide(id: "ls7c_2", title: "IBD Treatments", content: "Inflammatory bowel disease requires targeted anti-inflammatory therapy.", bulletPoints: ["Mesalamine (5-ASA): first-line for mild-moderate UC", "Infliximab (Remicade): anti-TNF for moderate-severe IBD", "Screen for TB before anti-TNF therapy", "Step-up approach: 5-ASA → steroids → biologics"], highlightText: "Anti-TNF: always screen for TB first"),
            ]
        )

        let m7Mastery = Subsection(
            id: "7d", moduleId: "m7", code: "7d",
            title: "Mastery: Gastrointestinal",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module7 = DrugModule(
            id: "m7", number: 7,
            title: "Gastrointestinal",
            subtitle: "Acid, Nausea & IBD",
            iconName: "stomach.fill",
            accentColorHex: "7B1FA2",
            subsections: [m7Sub7a, m7Sub7b, m7Sub7c, m7Mastery]
        )

        let m8Sub8a = Subsection(
            id: "8a", moduleId: "m8", code: "8a",
            title: "Opioid Analgesics",
            description: "Morphine, oxycodone, fentanyl, and more",
            iconName: "cross.case.fill",
            drugs: [
                Drug(id: "d146", genericName: "Morphine", brandName: "MS Contin", drugClass: "Opioid Agonist", suffix: "", indications: ["Severe pain", "Acute MI pain", "Palliative care"], sideEffects: ["Respiratory depression", "Constipation", "Nausea", "Sedation", "Pruritus"], clinicalPearls: ["Gold standard opioid", "Accumulates in renal impairment (active metabolite M6G)", "Histamine release can cause itching/hypotension"]),
                Drug(id: "d147", genericName: "Oxycodone", brandName: "OxyContin/Roxicodone", drugClass: "Opioid Agonist", suffix: "", indications: ["Moderate-severe pain"], sideEffects: ["Respiratory depression", "Constipation", "Nausea"], clinicalPearls: ["OxyContin = extended-release (q12h)", "Percocet = oxycodone + acetaminophen", "High abuse potential"]),
                Drug(id: "d148", genericName: "Hydrocodone/Acetaminophen", brandName: "Norco/Vicodin", drugClass: "Opioid Combination", suffix: "", indications: ["Moderate pain"], sideEffects: ["Respiratory depression", "Constipation", "Hepatotoxicity (APAP)"], clinicalPearls: ["Most prescribed opioid in US", "Watch APAP cumulative dose (max 4g/day)", "Schedule II"]),
                Drug(id: "d149", genericName: "Fentanyl", brandName: "Duragesic (patch)", drugClass: "Opioid Agonist", suffix: "", indications: ["Severe chronic pain", "Anesthesia", "Breakthrough cancer pain"], sideEffects: ["Respiratory depression", "Bradycardia", "Chest wall rigidity (IV)"], clinicalPearls: ["80-100x more potent than morphine", "Transdermal patch: 72-hour duration", "CYP3A4 substrate"]),
                Drug(id: "d150", genericName: "Tramadol", brandName: "Ultram", drugClass: "Weak Opioid + SNRI", suffix: "", indications: ["Moderate pain"], sideEffects: ["Seizures", "Serotonin syndrome", "Nausea", "Constipation"], clinicalPearls: ["Dual mechanism: weak mu-agonist + SNRI", "Lowers seizure threshold", "Risk of serotonin syndrome with SSRIs/SNRIs"]),
                Drug(id: "d151", genericName: "Naloxone", brandName: "Narcan", drugClass: "Opioid Antagonist", suffix: "", indications: ["Opioid overdose reversal"], sideEffects: ["Acute withdrawal symptoms", "Tachycardia", "Hypertension"], clinicalPearls: ["Intranasal or IV/IM", "Short duration - may need repeat doses", "Available OTC as nasal spray"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls8a_1", title: "Opioid Pharmacology", content: "Opioids bind mu receptors to produce analgesia, euphoria, and respiratory depression.", bulletPoints: ["All opioids cause: respiratory depression, constipation, sedation", "Morphine: gold standard, avoid in renal failure", "Fentanyl: 80-100x more potent than morphine", "Tramadol: weak opioid + SNRI, seizure risk"], highlightText: "ALL opioids: respiratory depression + constipation"),
                LearningSlide(id: "ls8a_2", title: "Naloxone: The Reversal Agent", content: "Naloxone (Narcan) is a competitive opioid antagonist that reverses overdose.", bulletPoints: ["Narcan: intranasal spray now OTC", "Short half-life: may need repeated doses", "Can precipitate acute withdrawal in dependent patients", "Opioid overdose triad: pinpoint pupils, respiratory depression, CNS depression"], highlightText: "Naloxone reverses opioid overdose - may need repeat doses"),
            ]
        )

        let m8Sub8b = Subsection(
            id: "8b", moduleId: "m8", code: "8b",
            title: "NSAIDs & Acetaminophen",
            description: "Non-opioid analgesics and anti-inflammatories",
            iconName: "pill.fill",
            drugs: [
                Drug(id: "d152", genericName: "Ibuprofen", brandName: "Advil/Motrin", drugClass: "NSAID", suffix: "", indications: ["Pain", "Fever", "Inflammation", "Dysmenorrhea"], sideEffects: ["GI bleeding", "Renal impairment", "CV risk", "Platelet inhibition"], clinicalPearls: ["Non-selective COX inhibitor", "Take with food", "Avoid in CKD, HF, and 3rd trimester pregnancy"]),
                Drug(id: "d153", genericName: "Naproxen", brandName: "Aleve/Naprosyn", drugClass: "NSAID", suffix: "", indications: ["Pain", "Inflammation", "Gout"], sideEffects: ["GI bleeding", "Renal impairment", "CV risk"], clinicalPearls: ["Longer duration than ibuprofen (q12h)", "Lowest CV risk among NSAIDs", "OTC and prescription strengths"]),
                Drug(id: "d154", genericName: "Celecoxib", brandName: "Celebrex", drugClass: "COX-2 Selective NSAID", suffix: "-coxib", indications: ["Osteoarthritis", "Rheumatoid arthritis", "Pain"], sideEffects: ["CV risk", "GI effects (less than non-selective)", "Sulfonamide allergy"], clinicalPearls: ["Selective COX-2 inhibitor: less GI bleeding", "Still carries CV risk", "Avoid if sulfa allergy"]),
                Drug(id: "d155", genericName: "Acetaminophen", brandName: "Tylenol", drugClass: "Non-opioid Analgesic", suffix: "", indications: ["Pain", "Fever"], sideEffects: ["Hepatotoxicity (overdose)", "Rare: SJS/TEN"], clinicalPearls: ["Max 4g/day (2g/day if liver disease)", "Antidote for overdose: N-acetylcysteine (NAC)", "No anti-inflammatory effect", "Safe in pregnancy"]),
                Drug(id: "d156", genericName: "Ketorolac", brandName: "Toradol", drugClass: "NSAID", suffix: "", indications: ["Moderate-severe acute pain", "Post-operative pain"], sideEffects: ["GI bleeding", "Renal impairment", "Platelet dysfunction"], clinicalPearls: ["IV/IM NSAID for acute pain", "Limit to 5 days maximum", "Very potent analgesic"]),
                Drug(id: "d157", genericName: "Colchicine", brandName: "Colcrys", drugClass: "Anti-inflammatory (gout)", suffix: "", indications: ["Acute gout", "Gout prophylaxis", "Pericarditis"], sideEffects: ["Diarrhea", "Nausea", "Bone marrow suppression"], clinicalPearls: ["First-line for acute gout flares", "GI side effects dose-limiting", "Also used for pericarditis"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls8b_1", title: "NSAIDs: COX Inhibitors", content: "NSAIDs inhibit cyclooxygenase enzymes, reducing prostaglandin synthesis.", bulletPoints: ["Non-selective (ibuprofen, naproxen): block COX-1 and COX-2", "COX-2 selective (celecoxib): less GI bleeding", "All NSAIDs: GI risk, renal risk, CV risk", "Ketorolac (Toradol): IV NSAID, max 5 days"], highlightText: "NSAIDs: GI + Renal + CV risk. Take with food."),
                LearningSlide(id: "ls8b_2", title: "Acetaminophen & Gout Agents", content: "Acetaminophen is a first-line analgesic/antipyretic without anti-inflammatory properties.", bulletPoints: ["Max 4g/day (2g if liver disease)", "Overdose antidote: N-acetylcysteine (NAC)", "Colchicine: first-line for acute gout flares", "Allopurinol/febuxostat: urate-lowering for chronic gout"], highlightText: "APAP overdose = NAC antidote | Max 4g/day"),
            ]
        )

        let m8Sub8c = Subsection(
            id: "8c", moduleId: "m8", code: "8c",
            title: "Muscle Relaxants & Neuropathic Pain",
            description: "Cyclobenzaprine, gabapentin, pregabalin",
            iconName: "figure.walk",
            drugs: [
                Drug(id: "d158", genericName: "Cyclobenzaprine", brandName: "Flexeril", drugClass: "Muscle Relaxant", suffix: "", indications: ["Acute musculoskeletal pain"], sideEffects: ["Sedation", "Dry mouth", "Dizziness", "Anticholinergic effects"], clinicalPearls: ["Structurally similar to TCAs", "Short-term use only (2-3 weeks)", "Avoid in elderly (anticholinergic)"]),
                Drug(id: "d159", genericName: "Methocarbamol", brandName: "Robaxin", drugClass: "Muscle Relaxant", suffix: "", indications: ["Acute musculoskeletal pain"], sideEffects: ["Sedation", "Dizziness", "Brown/green urine"], clinicalPearls: ["Less sedating than cyclobenzaprine", "Can cause discolored urine (harmless)", "IV formulation available"]),
                Drug(id: "d160", genericName: "Baclofen", brandName: "Lioresal", drugClass: "GABA-B Agonist", suffix: "", indications: ["Spasticity (MS, spinal cord injury)"], sideEffects: ["Sedation", "Weakness", "Withdrawal seizures"], clinicalPearls: ["GABA-B receptor agonist", "Do NOT stop abruptly (withdrawal seizures)", "Intrathecal pump for severe spasticity"]),
                Drug(id: "d161", genericName: "Gabapentin", brandName: "Neurontin", drugClass: "Gabapentinoid", suffix: "", indications: ["Neuropathic pain", "Postherpetic neuralgia", "Seizures"], sideEffects: ["Sedation", "Dizziness", "Peripheral edema", "Weight gain"], clinicalPearls: ["Dose adjust for renal impairment", "Abuse potential recognized", "Does NOT interact with most drugs"]),
                Drug(id: "d162", genericName: "Pregabalin", brandName: "Lyrica", drugClass: "Gabapentinoid", suffix: "", indications: ["Neuropathic pain", "Fibromyalgia", "Seizures"], sideEffects: ["Sedation", "Dizziness", "Weight gain", "Peripheral edema"], clinicalPearls: ["Schedule V controlled substance", "More predictable absorption than gabapentin", "FDA-approved for fibromyalgia"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls8c_1", title: "Muscle Relaxants", content: "Skeletal muscle relaxants are used short-term for acute musculoskeletal conditions.", bulletPoints: ["Cyclobenzaprine (Flexeril): most prescribed, anticholinergic", "Methocarbamol (Robaxin): less sedating alternative", "Baclofen: GABA-B agonist for spasticity (MS, spinal cord)", "Never stop baclofen abruptly: seizure risk"], highlightText: "Muscle relaxants: short-term use. Baclofen: no abrupt stop"),
                LearningSlide(id: "ls8c_2", title: "Gabapentinoids for Nerve Pain", content: "Gabapentin and pregabalin are first-line agents for neuropathic pain.", bulletPoints: ["Gabapentin (Neurontin): dose adjust for renal function", "Pregabalin (Lyrica): Schedule V, fibromyalgia approved", "Both: sedation, dizziness, weight gain, edema", "Also used as anticonvulsants"], highlightText: "Gabapentinoids: first-line for neuropathic pain"),
            ]
        )

        let m8Mastery = Subsection(
            id: "8d", moduleId: "m8", code: "8d",
            title: "Mastery: Pain & Analgesia",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module8 = DrugModule(
            id: "m8", number: 8,
            title: "Pain & Analgesia",
            subtitle: "Opioids, NSAIDs & Nerve Pain",
            iconName: "cross.case.fill",
            accentColorHex: "C62828",
            subsections: [m8Sub8a, m8Sub8b, m8Sub8c, m8Mastery]
        )

        let m9Sub9a = Subsection(
            id: "9a", moduleId: "m9", code: "9a",
            title: "Corticosteroids & DMARDs",
            description: "Prednisone, methotrexate, and biologics",
            iconName: "figure.walk",
            drugs: [
                Drug(id: "d163", genericName: "Prednisone", brandName: "Deltasone", drugClass: "Corticosteroid", suffix: "", indications: ["Inflammatory conditions", "Autoimmune diseases", "Asthma exacerbations", "Transplant rejection"], sideEffects: ["Hyperglycemia", "Osteoporosis", "Adrenal suppression", "Cushing syndrome", "Immunosuppression"], clinicalPearls: ["Taper slowly if used >2 weeks", "Take in the morning to mimic cortisol cycle", "Monitor blood glucose"]),
                Drug(id: "d164", genericName: "Methylprednisolone", brandName: "Medrol/Solu-Medrol", drugClass: "Corticosteroid", suffix: "", indications: ["Acute inflammation", "MS exacerbations", "Transplant rejection"], sideEffects: ["Hyperglycemia", "Insomnia", "GI upset"], clinicalPearls: ["IV (Solu-Medrol) for acute flares", "Medrol Dosepak for short courses"]),
                Drug(id: "d165", genericName: "Dexamethasone", brandName: "Decadron", drugClass: "Corticosteroid", suffix: "", indications: ["Cerebral edema", "Croup", "Chemotherapy N/V", "COVID-19"], sideEffects: ["Hyperglycemia", "Insomnia", "Immunosuppression"], clinicalPearls: ["Most potent corticosteroid", "Long half-life (36-72 hours)", "No mineralocorticoid activity"]),
                Drug(id: "d166", genericName: "Hydrocortisone", brandName: "Cortef/Solu-Cortef", drugClass: "Corticosteroid", suffix: "", indications: ["Adrenal insufficiency", "Inflammatory conditions"], sideEffects: ["Fluid retention", "Hyperglycemia"], clinicalPearls: ["Physiologic replacement for adrenal insufficiency", "Most mineralocorticoid activity of corticosteroids"]),
                Drug(id: "d167", genericName: "Methotrexate", brandName: "Trexall/Rheumatrex", drugClass: "DMARD / Antimetabolite", suffix: "", indications: ["Rheumatoid arthritis", "Psoriasis", "Ectopic pregnancy", "Cancer"], sideEffects: ["Hepatotoxicity", "Bone marrow suppression", "Mucositis", "Pulmonary fibrosis", "Teratogenic"], clinicalPearls: ["Take folic acid to reduce side effects", "Weekly dosing for RA (NOT daily)", "Monitor CBC, LFTs, renal function"]),
                Drug(id: "d168", genericName: "Hydroxychloroquine", brandName: "Plaquenil", drugClass: "DMARD", suffix: "", indications: ["RA", "SLE", "Malaria"], sideEffects: ["Retinal toxicity", "GI upset", "QT prolongation"], clinicalPearls: ["Annual eye exams required (retinal toxicity)", "One of few drugs safe in pregnancy for SLE"]),
                Drug(id: "d169", genericName: "Adalimumab", brandName: "Humira", drugClass: "Anti-TNF Biologic", suffix: "", indications: ["RA", "Psoriasis", "Crohn's", "UC"], sideEffects: ["Infection risk", "Injection site reactions", "TB reactivation"], clinicalPearls: ["Most prescribed biologic worldwide", "Screen for TB before starting", "SubQ injection q2 weeks"]),
                Drug(id: "d170", genericName: "Etanercept", brandName: "Enbrel", drugClass: "Anti-TNF Biologic", suffix: "", indications: ["RA", "Psoriasis", "Ankylosing spondylitis"], sideEffects: ["Infection risk", "Injection site reactions"], clinicalPearls: ["TNF receptor fusion protein", "SubQ injection weekly", "Screen for TB"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls9a_1", title: "Corticosteroids: Anti-inflammatory Powerhouses", content: "Corticosteroids suppress inflammation and immune function but have significant side effects.", bulletPoints: ["Taper slowly if used >2 weeks (adrenal suppression)", "Side effects: hyperglycemia, osteoporosis, Cushing's", "Potency: dexamethasone > methylprednisolone > prednisone > hydrocortisone", "Take in the morning to mimic natural cortisol"], highlightText: "Corticosteroids: TAPER if >2 weeks. Monitor glucose."),
                LearningSlide(id: "ls9a_2", title: "DMARDs & Biologics for Autoimmune Disease", content: "Disease-modifying agents target the underlying immune process.", bulletPoints: ["Methotrexate: anchor drug for RA, give folic acid, weekly dosing", "Hydroxychloroquine: annual eye exams for retinal toxicity", "Anti-TNF biologics (adalimumab, etanercept): screen for TB", "All DMARDs/biologics increase infection risk"], highlightText: "MTX = weekly + folic acid | Anti-TNF = screen TB"),
            ]
        )

        let m9Sub9b = Subsection(
            id: "9b", moduleId: "m9", code: "9b",
            title: "Osteoporosis & Gout Agents",
            description: "Bisphosphonates, denosumab, allopurinol",
            iconName: "figure.stand",
            drugs: [
                Drug(id: "d171", genericName: "Alendronate", brandName: "Fosamax", drugClass: "Bisphosphonate", suffix: "-dronate", indications: ["Osteoporosis", "Paget's disease"], sideEffects: ["Esophageal irritation", "Jaw osteonecrosis", "Atypical femur fractures"], clinicalPearls: ["Take in AM with full glass of water", "Stay upright 30 min after taking", "Weekly dosing available"]),
                Drug(id: "d172", genericName: "Risedronate", brandName: "Actonel", drugClass: "Bisphosphonate", suffix: "-dronate", indications: ["Osteoporosis"], sideEffects: ["Esophageal irritation", "Musculoskeletal pain"], clinicalPearls: ["Weekly or monthly dosing", "Same administration rules as alendronate"]),
                Drug(id: "d173", genericName: "Zoledronic acid", brandName: "Reclast", drugClass: "Bisphosphonate (IV)", suffix: "-dronate", indications: ["Osteoporosis", "Paget's disease", "Bone metastases"], sideEffects: ["Flu-like symptoms", "Renal impairment", "Jaw osteonecrosis"], clinicalPearls: ["IV once yearly for osteoporosis", "Check renal function before infusion", "Hydrate well before and after"]),
                Drug(id: "d174", genericName: "Denosumab", brandName: "Prolia", drugClass: "RANK-L Inhibitor", suffix: "", indications: ["Osteoporosis", "Bone metastases (Xgeva)"], sideEffects: ["Hypocalcemia", "Jaw osteonecrosis", "Atypical fractures"], clinicalPearls: ["SubQ injection q6 months", "MUST not delay doses (rebound fractures)", "Check calcium and vitamin D levels"]),
                Drug(id: "d175", genericName: "Teriparatide", brandName: "Forteo", drugClass: "PTH Analog", suffix: "", indications: ["Severe osteoporosis"], sideEffects: ["Hypercalcemia", "Orthostatic hypotension", "Leg cramps"], clinicalPearls: ["Anabolic (builds bone)", "Max 2 years of use", "Black Box: osteosarcoma in rats"]),
                Drug(id: "d176", genericName: "Allopurinol", brandName: "Zyloprim", drugClass: "Xanthine Oxidase Inhibitor", suffix: "", indications: ["Chronic gout", "Hyperuricemia", "Tumor lysis syndrome prophylaxis"], sideEffects: ["Rash", "SJS/TEN", "Hepatotoxicity"], clinicalPearls: ["Start low, go slow", "HLA-B*5801 testing in high-risk populations", "Do NOT start during acute gout flare"]),
                Drug(id: "d177", genericName: "Febuxostat", brandName: "Uloric", drugClass: "Xanthine Oxidase Inhibitor", suffix: "", indications: ["Chronic gout"], sideEffects: ["CV events", "Hepatotoxicity", "Rash"], clinicalPearls: ["Alternative to allopurinol", "Black Box: increased CV death risk", "No renal dose adjustment needed"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls9b_1", title: "Bisphosphonates: Bone Protection", content: "Bisphosphonates inhibit osteoclasts, reducing bone resorption.", bulletPoints: ["All end in -dronate (alendronate, risedronate, zoledronic acid)", "Oral: take AM, upright 30 min, full glass of water", "Rare but serious: jaw osteonecrosis, atypical femur fractures", "Zoledronic acid (Reclast): IV once yearly"], highlightText: "-dronate = Bisphosphonate. Upright 30 min!"),
                LearningSlide(id: "ls9b_2", title: "Beyond Bisphosphonates & Gout Management", content: "Alternative osteoporosis and gout agents.", bulletPoints: ["Denosumab (Prolia): RANK-L inhibitor, SubQ q6 months", "Teriparatide (Forteo): anabolic agent, max 2 years", "Allopurinol: first-line urate-lowering, start low go slow", "Never start allopurinol during acute gout flare"], highlightText: "Allopurinol: NOT during acute flare | HLA-B*5801 testing"),
            ]
        )

        let m9Sub9c = Subsection(
            id: "9c", moduleId: "m9", code: "9c",
            title: "Immunosuppressants",
            description: "Transplant and autoimmune agents",
            iconName: "shield.lefthalf.filled",
            drugs: [
                Drug(id: "d178", genericName: "Tacrolimus", brandName: "Prograf", drugClass: "Calcineurin Inhibitor", suffix: "", indications: ["Transplant rejection prophylaxis", "Atopic dermatitis (topical)"], sideEffects: ["Nephrotoxicity", "Hyperglycemia", "Tremor", "Hypertension", "Hyperkalemia"], clinicalPearls: ["Narrow therapeutic index", "Monitor trough levels", "Metabolized by CYP3A4"]),
                Drug(id: "d179", genericName: "Cyclosporine", brandName: "Neoral/Sandimmune", drugClass: "Calcineurin Inhibitor", suffix: "", indications: ["Transplant rejection", "RA", "Psoriasis"], sideEffects: ["Nephrotoxicity", "Hypertension", "Gingival hyperplasia", "Hirsutism"], clinicalPearls: ["Neoral and Sandimmune are NOT interchangeable", "Monitor trough levels", "Avoid grapefruit (CYP3A4)"]),
                Drug(id: "d180", genericName: "Mycophenolate mofetil", brandName: "CellCept", drugClass: "Antimetabolite", suffix: "", indications: ["Transplant rejection prophylaxis", "Lupus nephritis"], sideEffects: ["GI upset", "Bone marrow suppression", "Teratogenic"], clinicalPearls: ["REMS: pregnancy prevention required", "Monitor CBC regularly", "Part of most transplant regimens"]),
                Drug(id: "d181", genericName: "Azathioprine", brandName: "Imuran", drugClass: "Antimetabolite", suffix: "", indications: ["Transplant rejection", "RA", "IBD", "SLE"], sideEffects: ["Bone marrow suppression", "Hepatotoxicity", "GI upset", "Infection risk"], clinicalPearls: ["Check TPMT before starting (toxicity risk)", "Avoid allopurinol (increases toxicity)", "Monitor CBC and LFTs"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls9c_1", title: "Calcineurin Inhibitors", content: "Tacrolimus and cyclosporine are cornerstones of transplant immunosuppression.", bulletPoints: ["Both cause nephrotoxicity (dose-limiting)", "Tacrolimus: more potent, causes diabetes", "Cyclosporine: gingival hyperplasia, hirsutism", "Both: monitor trough levels, CYP3A4 interactions"], highlightText: "Calcineurin inhibitors: nephrotoxicity + monitor levels"),
                LearningSlide(id: "ls9c_2", title: "Antimetabolites in Transplant", content: "Mycophenolate and azathioprine prevent organ rejection.", bulletPoints: ["Mycophenolate (CellCept): first-line, teratogenic (REMS)", "Azathioprine (Imuran): check TPMT before starting", "Azathioprine + allopurinol = dangerous interaction", "Both: monitor CBC for bone marrow suppression"], highlightText: "CellCept: REMS | Imuran: check TPMT, avoid allopurinol"),
            ]
        )

        let m9Mastery = Subsection(
            id: "9d", moduleId: "m9", code: "9d",
            title: "Mastery: Immune & Bone",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module9 = DrugModule(
            id: "m9", number: 9,
            title: "Immune & Bone",
            subtitle: "Steroids, DMARDs & Osteoporosis",
            iconName: "figure.walk",
            accentColorHex: "00ACC1",
            subsections: [m9Sub9a, m9Sub9b, m9Sub9c, m9Mastery]
        )

        let m10Sub10a = Subsection(
            id: "10a", moduleId: "m10", code: "10a",
            title: "Contraceptives & HRT",
            description: "Oral contraceptives, IUDs, and hormone therapy",
            iconName: "heart.circle.fill",
            drugs: [
                Drug(id: "d182", genericName: "Ethinyl estradiol/Norgestimate", brandName: "Ortho Tri-Cyclen", drugClass: "Combined Oral Contraceptive", suffix: "", indications: ["Contraception", "Acne"], sideEffects: ["VTE risk", "Headache", "Nausea", "Breast tenderness"], clinicalPearls: ["Estrogen + progestin combination", "Increased VTE risk (especially with smoking)", "Contraindicated if >35 and smoking"]),
                Drug(id: "d183", genericName: "Norethindrone", brandName: "Micronor/Camila", drugClass: "Progestin-Only Pill", suffix: "", indications: ["Contraception"], sideEffects: ["Irregular bleeding", "Headache"], clinicalPearls: ["Mini-pill: take at same time daily", "Safe in breastfeeding", "No estrogen-related VTE risk"]),
                Drug(id: "d184", genericName: "Medroxyprogesterone (depot)", brandName: "Depo-Provera", drugClass: "Injectable Progestin", suffix: "", indications: ["Contraception", "Endometriosis"], sideEffects: ["Weight gain", "Bone density loss", "Irregular bleeding"], clinicalPearls: ["IM injection every 3 months", "Black Box: bone density loss with long-term use", "Return to fertility may be delayed"]),
                Drug(id: "d185", genericName: "Levonorgestrel IUD", brandName: "Mirena", drugClass: "Intrauterine Progestin", suffix: "", indications: ["Contraception", "Heavy menstrual bleeding"], sideEffects: ["Irregular bleeding", "Headache", "Ovarian cysts"], clinicalPearls: ["Effective 5-8 years depending on type", "Reduces menstrual bleeding", "Most effective reversible contraception"]),
                Drug(id: "d186", genericName: "Conjugated estrogens", brandName: "Premarin", drugClass: "Estrogen", suffix: "", indications: ["Menopausal vasomotor symptoms", "Osteoporosis prevention", "Vaginal atrophy"], sideEffects: ["VTE risk", "Breast cancer risk", "Endometrial cancer (without progestin)"], clinicalPearls: ["Must add progestin if patient has uterus", "Lowest effective dose for shortest duration", "WHI trial changed HRT practice"]),
                Drug(id: "d187", genericName: "Raloxifene", brandName: "Evista", drugClass: "SERM", suffix: "", indications: ["Osteoporosis prevention", "Breast cancer risk reduction"], sideEffects: ["VTE risk", "Hot flashes", "Leg cramps"], clinicalPearls: ["Estrogen agonist on bone, antagonist on breast/uterus", "Does NOT treat hot flashes (may worsen)", "Reduces breast cancer risk"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls10a_1", title: "Hormonal Contraception", content: "Contraceptives vary by hormone content, route, and duration.", bulletPoints: ["Combined (estrogen + progestin): highest efficacy pills but VTE risk", "Progestin-only: safe in breastfeeding and smokers >35", "Depo-Provera: q3 month injection, bone density loss", "Mirena IUD: most effective reversible contraception"], highlightText: "COC: no smoking >35 | IUD: most effective reversible"),
                LearningSlide(id: "ls10a_2", title: "HRT & SERMs", content: "Hormone replacement for menopause and osteoporosis.", bulletPoints: ["Conjugated estrogens (Premarin): must add progestin if uterus present", "Lowest dose, shortest duration principle", "Raloxifene (Evista): SERM, bone agonist, breast antagonist", "Raloxifene does NOT help hot flashes"], highlightText: "HRT: add progestin if uterus | SERM: bone + breast"),
            ]
        )

        let m10Sub10b = Subsection(
            id: "10b", moduleId: "m10", code: "10b",
            title: "Prostate & Urologic Agents",
            description: "BPH, overactive bladder, and ED",
            iconName: "cross.fill",
            drugs: [
                Drug(id: "d188", genericName: "Tamsulosin", brandName: "Flomax", drugClass: "Alpha-1 Blocker", suffix: "-osin", indications: ["BPH"], sideEffects: ["Orthostatic hypotension", "Dizziness", "Retrograde ejaculation", "Intraoperative floppy iris"], clinicalPearls: ["Most prescribed BPH medication", "Selective alpha-1A blocker", "Take 30 min after same meal daily"]),
                Drug(id: "d189", genericName: "Finasteride", brandName: "Proscar/Propecia", drugClass: "5-Alpha Reductase Inhibitor", suffix: "-steride", indications: ["BPH", "Male pattern baldness"], sideEffects: ["Sexual dysfunction", "Decreased PSA", "Teratogenic"], clinicalPearls: ["Reduces prostate size over 6-12 months", "Lowers PSA by ~50% (double PSA for screening)", "Women should not handle crushed tablets"]),
                Drug(id: "d190", genericName: "Dutasteride", brandName: "Avodart", drugClass: "5-Alpha Reductase Inhibitor", suffix: "-steride", indications: ["BPH"], sideEffects: ["Sexual dysfunction", "Decreased PSA"], clinicalPearls: ["Inhibits both type 1 and type 2 5-alpha reductase", "Longer half-life than finasteride", "Combination with tamsulosin (Jalyn)"]),
                Drug(id: "d191", genericName: "Oxybutynin", brandName: "Ditropan", drugClass: "Anticholinergic", suffix: "", indications: ["Overactive bladder", "Urinary urgency/frequency"], sideEffects: ["Dry mouth", "Constipation", "Blurred vision", "Cognitive impairment in elderly"], clinicalPearls: ["Avoid in elderly (anticholinergic burden)", "Topical/transdermal forms have fewer side effects", "Extended-release preferred"]),
                Drug(id: "d192", genericName: "Mirabegron", brandName: "Myrbetriq", drugClass: "Beta-3 Agonist", suffix: "", indications: ["Overactive bladder"], sideEffects: ["Hypertension", "UTI", "Headache"], clinicalPearls: ["Alternative to anticholinergics for OAB", "No anticholinergic side effects", "Monitor blood pressure"]),
                Drug(id: "d193", genericName: "Sildenafil", brandName: "Viagra", drugClass: "PDE-5 Inhibitor", suffix: "-afil", indications: ["Erectile dysfunction", "Pulmonary arterial hypertension (Revatio)"], sideEffects: ["Headache", "Flushing", "Visual changes", "Hypotension"], clinicalPearls: ["NEVER combine with nitrates (severe hypotension)", "Also treats PAH as Revatio", "Onset 30-60 min, take on empty stomach"]),
                Drug(id: "d194", genericName: "Tadalafil", brandName: "Cialis", drugClass: "PDE-5 Inhibitor", suffix: "-afil", indications: ["Erectile dysfunction", "BPH", "PAH"], sideEffects: ["Headache", "Back pain", "Flushing"], clinicalPearls: ["Longest acting PDE-5 inhibitor (36 hours)", "Daily low-dose option for BPH", "NEVER combine with nitrates"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls10b_1", title: "BPH Medications", content: "Two main drug classes treat benign prostatic hyperplasia.", bulletPoints: ["Alpha-1 blockers (-osin): tamsulosin, relax smooth muscle", "5-alpha reductase inhibitors (-steride): shrink prostate over months", "Combination therapy (Jalyn): dutasteride + tamsulosin", "Alpha blockers work fast; 5-ARIs take 6-12 months"], highlightText: "-osin = fast relief | -steride = shrinks prostate"),
                LearningSlide(id: "ls10b_2", title: "OAB & Erectile Dysfunction", content: "Overactive bladder and ED have effective pharmacologic treatments.", bulletPoints: ["Oxybutynin: anticholinergic, avoid in elderly", "Mirabegron: beta-3 agonist alternative, no anticholinergic effects", "PDE-5 inhibitors (-afil): NEVER with nitrates", "Tadalafil: also treats BPH, longest acting"], highlightText: "PDE-5 + Nitrates = CONTRAINDICATED"),
            ]
        )

        let m10Sub10c = Subsection(
            id: "10c", moduleId: "m10", code: "10c",
            title: "Vitamins, Antidotes & Misc",
            description: "Essential supplements and emergency agents",
            iconName: "leaf.fill",
            drugs: [
                Drug(id: "d195", genericName: "Vitamin D (cholecalciferol)", brandName: "D3", drugClass: "Vitamin", suffix: "", indications: ["Vitamin D deficiency", "Osteoporosis prevention"], sideEffects: ["Hypercalcemia (toxic doses)"], clinicalPearls: ["D3 preferred over D2", "Often given with calcium for bone health", "Goal 25-OH vitamin D >30 ng/mL"]),
                Drug(id: "d196", genericName: "Iron (ferrous sulfate)", brandName: "Feosol", drugClass: "Iron Supplement", suffix: "", indications: ["Iron deficiency anemia"], sideEffects: ["Constipation", "Dark stools", "GI upset"], clinicalPearls: ["Take on empty stomach with vitamin C", "Separate from levothyroxine, antacids, and tetracyclines", "Liquid can stain teeth"]),
                Drug(id: "d197", genericName: "Potassium chloride", brandName: "K-Dur/Klor-Con", drugClass: "Electrolyte", suffix: "", indications: ["Hypokalemia"], sideEffects: ["GI irritation", "Hyperkalemia"], clinicalPearls: ["Take with food and full glass of water", "Monitor K+ levels", "Wax-matrix tablets reduce GI irritation"]),
                Drug(id: "d198", genericName: "Epinephrine", brandName: "EpiPen", drugClass: "Sympathomimetic", suffix: "", indications: ["Anaphylaxis", "Cardiac arrest", "Severe asthma"], sideEffects: ["Tachycardia", "Hypertension", "Tremor", "Anxiety"], clinicalPearls: ["First-line for anaphylaxis - IM thigh", "Autoinjector for patient self-administration", "ACLS: 1 mg IV q3-5 min for cardiac arrest"]),
                Drug(id: "d199", genericName: "Atropine", brandName: "AtroPen", drugClass: "Anticholinergic", suffix: "", indications: ["Symptomatic bradycardia", "Organophosphate poisoning"], sideEffects: ["Tachycardia", "Dry mouth", "Urinary retention", "Mydriasis"], clinicalPearls: ["ACLS: first-line for symptomatic bradycardia", "Pre-op to reduce secretions", "Antidote for organophosphate/nerve agent poisoning"]),
                Drug(id: "d200", genericName: "Flumazenil", brandName: "Romazicon", drugClass: "Benzodiazepine Antagonist", suffix: "", indications: ["Benzodiazepine overdose reversal"], sideEffects: ["Seizures", "Nausea", "Agitation"], clinicalPearls: ["Can precipitate seizures in benzo-dependent patients", "Short half-life: may need repeat doses", "Use cautiously if co-ingestion suspected"]),
            ],
            isMasteryQuiz: false,
            learningSlides: [
                LearningSlide(id: "ls10c_1", title: "Essential Supplements", content: "Common vitamin and mineral supplements with important counseling points.", bulletPoints: ["Vitamin D3: goal >30 ng/mL, pair with calcium for bone health", "Iron: take on empty stomach + vitamin C, causes constipation", "Potassium: take with food, monitor levels", "Separate iron from levothyroxine and antacids"], highlightText: "Iron + Vitamin C = better absorption"),
                LearningSlide(id: "ls10c_2", title: "Emergency Antidotes & Agents", content: "Know the key reversal agents and emergency drugs.", bulletPoints: ["Epinephrine: #1 for anaphylaxis, IM in thigh", "Atropine: symptomatic bradycardia, organophosphate poisoning", "Flumazenil: benzo reversal (seizure risk in dependent patients)", "Naloxone: opioid reversal (covered in Module 8)"], highlightText: "Epi = anaphylaxis | Atropine = bradycardia"),
            ]
        )

        let m10Mastery = Subsection(
            id: "10d", moduleId: "m10", code: "10d",
            title: "Mastery: Reproductive & Misc",
            description: "30-question comprehensive review",
            iconName: "trophy.fill",
            drugs: [],
            isMasteryQuiz: true,
            learningSlides: []
        )

        let module10 = DrugModule(
            id: "m10", number: 10,
            title: "Reproductive & Misc",
            subtitle: "Hormones, Urology & Antidotes",
            iconName: "leaf.fill",
            accentColorHex: "AD1457",
            subsections: [m10Sub10a, m10Sub10b, m10Sub10c, m10Mastery]
        )

        self.modules = [module1, module2, module3, module4, module5, module6, module7, module8, module9, module10]

        var bank: [String: [Question]] = [:]

        bank["1a"] = [
            .fillBlank(id: "q1a_t1", subsectionId: "1a", difficulty: .easy, question: "All ACE inhibitors end in _____.", options: ["-pril", "-sartan", "-olol", "-dipine"], answer: "-pril", explanation: "The -pril suffix identifies ACE inhibitors (lisinopril, enalapril, ramipril)."),
            .fillBlank(id: "q1a_t2", subsectionId: "1a", difficulty: .easy, question: "All ARBs end in _____.", options: ["-sartan", "-pril", "-olol", "-statin"], answer: "-sartan", explanation: "The -sartan suffix identifies ARBs (losartan, valsartan, irbesartan)."),
            .trueFalse(id: "q1a_t3", subsectionId: "1a", difficulty: .easy, question: "Lisinopril (Zestril) is an ACE inhibitor because it ends in -pril.", answer: true, explanation: "The -pril suffix always indicates an ACE inhibitor."),
            .trueFalse(id: "q1a_t4", subsectionId: "1a", difficulty: .easy, question: "Losartan (Cozaar) is an ARB because it ends in -sartan.", answer: true, explanation: "The -sartan suffix always indicates an ARB."),
            .multipleChoice(id: "q1a_t5", subsectionId: "1a", difficulty: .easy, question: "The primary indication for both ACE inhibitors and ARBs is:", options: ["Hypertension", "Diabetes", "Asthma", "Depression"], answer: "Hypertension", explanation: "Both ACE inhibitors and ARBs are first-line agents for hypertension (HTN)."),
            .fillBlank(id: "q1a_t6", subsectionId: "1a", difficulty: .easy, question: "A patient on lisinopril develops a dry cough. This is caused by _____ accumulation.", options: ["Bradykinin", "Angiotensin", "Aldosterone", "Potassium"], answer: "Bradykinin", explanation: "ACE inhibitors cause bradykinin accumulation, which triggers the dry cough."),
            .multipleChoice(id: "q1a_13", subsectionId: "1a", question: "Which ACE inhibitor is available as an IV formulation (enalaprilat)?", options: ["Enalapril", "Lisinopril", "Ramipril", "Benazepril"], answer: "Enalapril", explanation: "Enalapril (Vasotec) is a prodrug; its IV form is enalaprilat."),
            .multipleChoice(id: "q1a_14", subsectionId: "1a", question: "Olmesartan (Benicar) has a unique side effect called:", options: ["Sprue-like enteropathy", "Dry cough", "Angioedema", "Gingival hyperplasia"], answer: "Sprue-like enteropathy", explanation: "Olmesartan can cause sprue-like enteropathy (severe diarrhea, weight loss)."),
            .fillBlank(id: "q1a_15", subsectionId: "1a", question: "The brand name of valsartan is _____.", options: ["Diovan", "Cozaar", "Avapro", "Benicar"], answer: "Diovan", explanation: "Valsartan is sold as Diovan."),
            .multipleChoice(id: "q1a_16", subsectionId: "1a", question: "Ramipril (Altace) showed cardiovascular risk reduction in which patients?", options: ["High CV risk patients", "Pregnant women", "Children under 5", "Patients with asthma"], answer: "High CV risk patients", explanation: "Ramipril showed CV risk reduction in high-risk patients."),
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
            .fillBlank(id: "q1b_t1", subsectionId: "1b", difficulty: .easy, question: "Furosemide (Lasix) belongs to which class of diuretics?", options: ["Loop diuretics", "Thiazide diuretics", "Potassium-sparing diuretics", "Osmotic diuretics"], answer: "Loop diuretics", explanation: "Furosemide (Lasix) is the most commonly used loop diuretic."),
            .trueFalse(id: "q1b_t2", subsectionId: "1b", difficulty: .easy, question: "Hydrochlorothiazide (Microzide) is a thiazide diuretic used for hypertension.", answer: true, explanation: "HCTZ is the most commonly used thiazide diuretic for HTN."),
            .multipleChoice(id: "q1b_t3", subsectionId: "1b", difficulty: .easy, question: "Thiazide diuretics cause hyper_____ (elevated levels of glucose, lipids, uric acid, calcium).", options: ["GLUC", "KALE", "SALT", "ACID"], answer: "GLUC", explanation: "Remember HyperGLUC: Glucose↑, Lipids↑, Uric acid↑, Calcium↑."),
            .trueFalse(id: "q1b_t4", subsectionId: "1b", difficulty: .easy, question: "Loop diuretics like furosemide (Lasix) are more potent than thiazide diuretics.", answer: true, explanation: "Loop diuretics are the most potent diuretic class available."),
            .multipleChoice(id: "q1b_13", subsectionId: "1b", question: "Which electrolyte abnormality is common to BOTH thiazide and loop diuretics?", options: ["Hypokalemia", "Hypercalcemia", "Hypermagnesemia", "Hypernatremia"], answer: "Hypokalemia", explanation: "Both classes waste potassium, causing hypokalemia."),
            .fillBlank(id: "q1b_14", subsectionId: "1b", question: "The brand name of bumetanide is _____.", options: ["Bumex", "Lasix", "Demadex", "Microzide"], answer: "Bumex", explanation: "Bumetanide is sold as Bumex."),
            .trueFalse(id: "q1b_15", subsectionId: "1b", question: "Thiazides cause hypercalcemia while loop diuretics cause hypocalcemia.", answer: true, explanation: "This is a key distinction: thiazides retain calcium while loops waste calcium."),
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
            .fillBlank(id: "q1c_t1", subsectionId: "1c", difficulty: .easy, question: "All beta blockers end in the suffix _____.", options: ["-olol", "-pril", "-sartan", "-dipine"], answer: "-olol", explanation: "The -olol suffix identifies beta blockers (metoprolol, atenolol, propranolol)."),
            .trueFalse(id: "q1c_t2", subsectionId: "1c", difficulty: .easy, question: "Metoprolol succinate (Toprol XL) is a beta blocker used for heart failure.", answer: true, explanation: "Metoprolol succinate is one of three beta blockers proven to reduce mortality in HFrEF."),
            .multipleChoice(id: "q1c_t3", subsectionId: "1c", difficulty: .easy, question: "Beta-1 receptors are primarily located in the:", options: ["Heart", "Lungs", "Liver", "Kidneys"], answer: "Heart", explanation: "B1 = Heart, B2 = Lungs. Selective beta-1 blockers mainly affect heart rate."),
            .trueFalse(id: "q1c_t4", subsectionId: "1c", difficulty: .easy, question: "Carvedilol (Coreg) blocks both alpha and beta receptors.", answer: true, explanation: "Carvedilol is unique because it blocks alpha-1, beta-1, and beta-2 receptors."),
            .multipleChoice(id: "q1c_12", subsectionId: "1c", question: "Which beta blocker is the most beta-1 selective?", options: ["Bisoprolol", "Propranolol", "Carvedilol", "Labetalol"], answer: "Bisoprolol", explanation: "Bisoprolol (Zebeta) is the most beta-1 selective beta blocker."),
            .fillBlank(id: "q1c_13", subsectionId: "1c", question: "The brand name of atenolol is _____.", options: ["Tenormin", "Coreg", "Inderal", "Zebeta"], answer: "Tenormin", explanation: "Atenolol is sold as Tenormin."),
            .fillBlank(id: "q1c_14", subsectionId: "1c", question: "The brand name of propranolol is _____.", options: ["Inderal", "Toprol XL", "Coreg", "Tenormin"], answer: "Inderal", explanation: "Propranolol is sold as Inderal."),
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
            .multipleChoice(id: "q1d_5", subsectionId: "1d", question: "Entresto contains sacubitril combined with which ARB?", options: ["Valsartan", "Losartan", "Irbesartan", "Candesartan"], answer: "Valsartan", explanation: "Entresto = sacubitril/valsartan (ARNI)."),
            .fillBlank(id: "q1d_6", subsectionId: "1d", question: "The brand name of spironolactone is _____.", options: ["Aldactone", "Inspra", "Entresto", "Coreg"], answer: "Aldactone", explanation: "Spironolactone is Aldactone."),
            .multipleChoice(id: "q1d_7", subsectionId: "1d", question: "Entresto contains sacubitril combined with:", options: ["Valsartan", "Losartan", "Lisinopril", "Enalapril"], answer: "Valsartan", explanation: "Entresto = sacubitril + valsartan."),
            .selectAll(id: "q1d_8", subsectionId: "1d", question: "Select ALL that require potassium monitoring:", options: ["Spironolactone", "Eplerenone", "Entresto", "Amlodipine"], correctAnswers: ["Spironolactone", "Eplerenone", "Entresto"], explanation: "All three can cause hyperkalemia."),
            .fillBlank(id: "q1d_9", subsectionId: "1d", question: "The brand name of eplerenone is _____.", options: ["Inspra", "Aldactone", "Entresto", "Coreg"], answer: "Inspra", explanation: "Eplerenone is sold as Inspra."),
            .matching(id: "q1d_10", subsectionId: "1d", question: "Match each drug to its brand name:", pairs: [MatchingPair(left: "Spironolactone", right: "Aldactone"), MatchingPair(left: "Eplerenone", right: "Inspra"), MatchingPair(left: "Sacubitril/Valsartan", right: "Entresto")], explanation: "Key MRA and ARNI brand-generic pairs."),
            .multipleChoice(id: "q1d_11", subsectionId: "1d", difficulty: .easy, question: "MRAs like spironolactone are called potassium-_____ diuretics.", options: ["Sparing", "Wasting", "Neutral", "Blocking"], answer: "Sparing", explanation: "MRAs spare potassium (retain it) unlike thiazides and loop diuretics."),
            .trueFalse(id: "q1d_12", subsectionId: "1d", difficulty: .easy, question: "Eplerenone causes less gynecomastia than spironolactone.", answer: true, explanation: "Eplerenone is more selective for the mineralocorticoid receptor, causing fewer anti-androgen effects."),
        ]

        bank["1e"] = [
            .trueFalse(id: "q1e_t1", subsectionId: "1e", difficulty: .easy, question: "Amlodipine (Norvasc) is the most commonly prescribed calcium channel blocker.", answer: true, explanation: "Amlodipine is the most prescribed CCB for hypertension."),
            .multipleChoice(id: "q1e_t2", subsectionId: "1e", difficulty: .easy, question: "There are two types of CCBs: dihydropyridines (DHPs) end in -dipine, and non-DHPs which are:", options: ["Diltiazem and Verapamil", "Amlodipine and Nifedipine", "Metoprolol and Atenolol", "Lisinopril and Enalapril"], answer: "Diltiazem and Verapamil", explanation: "The two non-DHP CCBs are diltiazem (Cardizem) and verapamil (Calan)."),
            .fillBlank(id: "q1e_t3", subsectionId: "1e", difficulty: .easy, question: "DHP calcium channel blockers all end in _____.", options: ["-dipine", "-olol", "-pril", "-sartan"], answer: "-dipine", explanation: "DHP CCBs end in -dipine: amlodipine, nifedipine, felodipine."),
            .multipleChoice(id: "q1e_11", subsectionId: "1e", question: "Which CCB is used for Raynaud's phenomenon?", options: ["Nifedipine", "Verapamil", "Diltiazem", "Atenolol"], answer: "Nifedipine", explanation: "Nifedipine (Procardia) is used for Raynaud's due to its vasodilatory effects."),
            .fillBlank(id: "q1e_12", subsectionId: "1e", question: "The brand name of diltiazem is _____.", options: ["Cardizem", "Norvasc", "Calan", "Procardia"], answer: "Cardizem", explanation: "Diltiazem is sold as Cardizem."),
            .fillBlank(id: "q1e_13", subsectionId: "1e", question: "The brand name of verapamil is _____.", options: ["Calan", "Cardizem", "Norvasc", "Procardia"], answer: "Calan", explanation: "Verapamil is sold as Calan."),
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
            .trueFalse(id: "q2a_t1", subsectionId: "2a", difficulty: .easy, question: "Atorvastatin (Lipitor) is the most prescribed statin in the world.", answer: true, explanation: "Atorvastatin (Lipitor) is the most widely prescribed statin."),
            .fillBlank(id: "q2a_t2", subsectionId: "2a", difficulty: .easy, question: "All statins end in _____.", options: ["-statin", "-pril", "-olol", "-sartan"], answer: "-statin", explanation: "The -statin suffix identifies HMG-CoA reductase inhibitors."),
            .multipleChoice(id: "q2a_t3", subsectionId: "2a", difficulty: .easy, question: "Statins work by inhibiting which enzyme?", options: ["HMG-CoA reductase", "ACE", "COX-2", "PDE-5"], answer: "HMG-CoA reductase", explanation: "Statins inhibit HMG-CoA reductase, the rate-limiting enzyme in cholesterol synthesis."),
            .multipleChoice(id: "q2a_t4", subsectionId: "2a", difficulty: .easy, question: "The brand name of rosuvastatin is:", options: ["Crestor", "Lipitor", "Zocor", "Pravachol"], answer: "Crestor", explanation: "Rosuvastatin is sold as Crestor."),
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
            .multipleChoice(id: "q2b_7", subsectionId: "2b", question: "Icosapent ethyl (Vascepa) primarily provides which benefit beyond lowering triglycerides?", options: ["Cardiovascular risk reduction", "Weight loss", "Blood pressure lowering", "Blood glucose control"], answer: "Cardiovascular risk reduction", explanation: "Vascepa (pure EPA) has proven ASCVD risk reduction benefits."),
            .selectAll(id: "q2b_8", subsectionId: "2b", question: "Select ALL PCSK9 inhibitors:", options: ["Evolocumab", "Alirocumab", "Ezetimibe", "Fenofibrate"], correctAnswers: ["Evolocumab", "Alirocumab"], explanation: "Evolocumab (Repatha) and alirocumab (Praluent) are PCSK9 inhibitors."),
            .matching(id: "q2b_9", subsectionId: "2b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Ezetimibe", right: "Zetia"), MatchingPair(left: "Evolocumab", right: "Repatha"), MatchingPair(left: "Fenofibrate", right: "Tricor"), MatchingPair(left: "Icosapent ethyl", right: "Vascepa")], explanation: "Key non-statin lipid drug brand names."),
        ]

        bank["2c"] = [
            .trueFalse(id: "q2c_t1", subsectionId: "2c", difficulty: .easy, question: "Aspirin is an antiplatelet drug that irreversibly inhibits COX.", answer: true, explanation: "Aspirin irreversibly inhibits COX, preventing platelet aggregation."),
            .multipleChoice(id: "q2c_t2", subsectionId: "2c", difficulty: .easy, question: "Warfarin (Coumadin) is a blood thinner that requires monitoring of:", options: ["INR", "Blood glucose", "Potassium", "Hemoglobin"], answer: "INR", explanation: "Warfarin requires regular INR monitoring (goal usually 2-3)."),
            .fillBlank(id: "q2c_t3", subsectionId: "2c", difficulty: .easy, question: "DOACs (direct oral anticoagulants) like rivaroxaban and apixaban end in _____.", options: ["-xaban", "-pril", "-olol", "-statin"], answer: "-xaban", explanation: "The -xaban suffix identifies direct factor Xa inhibitors."),
            .trueFalse(id: "q2c_t4", subsectionId: "2c", difficulty: .easy, question: "Apixaban (Eliquis) is often the preferred DOAC per many guidelines.", answer: true, explanation: "Apixaban has a favorable safety profile and is often preferred."),
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

        bank["2d"] = [
            .trueFalse(id: "q2d_1", subsectionId: "2d", question: "Sublingual nitroglycerin has an onset of 1-3 minutes.", answer: true, explanation: "SL NTG provides rapid angina relief in 1-3 minutes."),
            .multipleChoice(id: "q2d_2", subsectionId: "2d", question: "Maximum sublingual NTG doses before calling 911:", options: ["3 doses", "2 doses", "5 doses", "1 dose"], answer: "3 doses", explanation: "Max 3 SL doses, 5 minutes apart, then call 911."),
            .fillBlank(id: "q2d_3", subsectionId: "2d", question: "Nitrates are contraindicated with _____ inhibitors.", options: ["PDE-5", "ACE", "DPP-4", "PCSK9"], answer: "PDE-5", explanation: "Combining nitrates with PDE-5 inhibitors (sildenafil) causes severe hypotension."),
            .multipleChoice(id: "q2d_4", subsectionId: "2d", question: "Which antianginal does NOT affect heart rate or blood pressure?", options: ["Ranolazine", "Metoprolol", "Diltiazem", "Nitroglycerin"], answer: "Ranolazine", explanation: "Ranolazine inhibits late sodium current without HR/BP effects."),
            .trueFalse(id: "q2d_5", subsectionId: "2d", question: "Long-acting nitrates require a nitrate-free interval.", answer: true, explanation: "A 10-12 hour nitrate-free interval prevents tolerance."),
            .multipleChoice(id: "q2d_6", subsectionId: "2d", question: "The brand name of nitroglycerin sublingual is:", options: ["Nitrostat", "Imdur", "Ranexa", "Isordil"], answer: "Nitrostat", explanation: "Sublingual nitroglycerin is sold as Nitrostat."),
            .fillBlank(id: "q2d_7", subsectionId: "2d", question: "The brand name of ranolazine is _____.", options: ["Ranexa", "Nitrostat", "Imdur", "Cordarone"], answer: "Ranexa", explanation: "Ranolazine is sold as Ranexa."),
            .selectAll(id: "q2d_8", subsectionId: "2d", question: "Select ALL nitrate medications:", options: ["Nitroglycerin", "Isosorbide mononitrate", "Ranolazine", "Isosorbide dinitrate"], correctAnswers: ["Nitroglycerin", "Isosorbide mononitrate", "Isosorbide dinitrate"], explanation: "Ranolazine is NOT a nitrate."),
            .matching(id: "q2d_9", subsectionId: "2d", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Nitroglycerin SL", right: "Nitrostat"), MatchingPair(left: "Isosorbide mononitrate", right: "Imdur"), MatchingPair(left: "Ranolazine", right: "Ranexa"), MatchingPair(left: "Isosorbide dinitrate", right: "Isordil")], explanation: "Key antianginal brand-generic pairs."),
            .multipleChoice(id: "q2d_10", subsectionId: "2d", difficulty: .medium, question: "BiDil (isosorbide dinitrate + hydralazine) is indicated for HFrEF in which population?", options: ["Black patients", "All patients equally", "Asian patients", "Pediatric patients"], answer: "Black patients", explanation: "BiDil showed particular benefit in Black patients with HFrEF."),
            .trueFalse(id: "q2d_11", subsectionId: "2d", difficulty: .medium, question: "Nitroglycerin tablets should be stored in a plastic container.", answer: false, explanation: "Store in original glass container; NTG is adsorbed by plastic."),
        ]

        bank["2e"] = [
            .trueFalse(id: "q2e_1", subsectionId: "2e", question: "Amiodarone is the most effective antiarrhythmic.", answer: true, explanation: "Amiodarone is the most effective but also the most toxic antiarrhythmic."),
            .multipleChoice(id: "q2e_2", subsectionId: "2e", question: "Amiodarone's half-life is approximately:", options: ["40-55 days", "4-6 hours", "24 hours", "7 days"], answer: "40-55 days", explanation: "Amiodarone has an extremely long half-life of 40-55 days."),
            .fillBlank(id: "q2e_3", subsectionId: "2e", question: "Digoxin therapeutic range is 0.5-___ ng/mL.", options: ["2", "5", "10", "1"], answer: "2", explanation: "Digoxin has a narrow therapeutic index: 0.5-2 ng/mL."),
            .multipleChoice(id: "q2e_4", subsectionId: "2e", question: "Digoxin toxicity is INCREASED by:", options: ["Hypokalemia", "Hyperkalemia", "Hyponatremia", "Hypercalcemia"], answer: "Hypokalemia", explanation: "Low potassium increases digoxin binding to Na+/K+ ATPase."),
            .trueFalse(id: "q2e_5", subsectionId: "2e", question: "Adenosine has a half-life of less than 10 seconds.", answer: true, explanation: "Adenosine is ultra-short acting with < 10 second half-life."),
            .multipleChoice(id: "q2e_6", subsectionId: "2e", question: "First-line for acute SVT conversion is:", options: ["Adenosine", "Amiodarone", "Digoxin", "Flecainide"], answer: "Adenosine", explanation: "Adenosine is first-line for acute SVT (rapid IV push)."),
            .fillBlank(id: "q2e_7", subsectionId: "2e", question: "The brand name of amiodarone is _____.", options: ["Cordarone", "Multaq", "Betapace", "Lanoxin"], answer: "Cordarone", explanation: "Amiodarone is sold as Cordarone or Pacerone."),
            .selectAll(id: "q2e_8", subsectionId: "2e", question: "Select ALL organs that need monitoring with amiodarone:", options: ["Thyroid", "Liver", "Lungs", "Kidneys"], correctAnswers: ["Thyroid", "Liver", "Lungs"], explanation: "Monitor TFTs, LFTs, PFTs, and eye exams with amiodarone."),
            .matching(id: "q2e_9", subsectionId: "2e", question: "Match antiarrhythmic to brand name:", pairs: [MatchingPair(left: "Amiodarone", right: "Cordarone"), MatchingPair(left: "Digoxin", right: "Lanoxin"), MatchingPair(left: "Sotalol", right: "Betapace"), MatchingPair(left: "Dronedarone", right: "Multaq")], explanation: "Key antiarrhythmic brand-generic pairs."),
            .multipleChoice(id: "q2e_10", subsectionId: "2e", question: "Which drug is both a beta blocker AND Class III antiarrhythmic?", options: ["Sotalol", "Amiodarone", "Flecainide", "Propranolol"], answer: "Sotalol", explanation: "Sotalol uniquely has both beta-blocking and Class III properties."),
            .trueFalse(id: "q2e_11", subsectionId: "2e", difficulty: .medium, question: "Flecainide is safe to use in patients with structural heart disease.", answer: false, explanation: "Flecainide is contraindicated in structural heart disease and CAD."),
            .multipleChoice(id: "q2e_12", subsectionId: "2e", question: "The antidote for digoxin toxicity is:", options: ["Digibind (digoxin immune Fab)", "Flumazenil", "Naloxone", "Protamine"], answer: "Digibind (digoxin immune Fab)", explanation: "Digoxin immune Fab fragments bind and neutralize digoxin."),
        ]

        bank["2f"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("2") && key != "2f" {
                mastery.append(contentsOf: questions.prefix(5))
            }
            return mastery
        }()

        bank["3a"] = [
            .trueFalse(id: "q3a_t1", subsectionId: "3a", difficulty: .easy, question: "Metformin (Glucophage) is the first-line drug for type 2 diabetes.", answer: true, explanation: "Metformin is recommended as first-line for all T2DM patients."),
            .multipleChoice(id: "q3a_t2", subsectionId: "3a", difficulty: .easy, question: "Which type of insulin has the fastest onset (15 minutes)?", options: ["Rapid-acting (lispro, aspart)", "Long-acting (glargine)", "Short-acting (regular)", "Intermediate (NPH)"], answer: "Rapid-acting (lispro, aspart)", explanation: "Rapid-acting insulins like lispro (Humalog) and aspart (NovoLog) have 15-minute onset."),
            .fillBlank(id: "q3a_t3", subsectionId: "3a", difficulty: .easy, question: "Insulin glargine (Lantus) is a _____-acting insulin with 24-hour duration.", options: ["Long", "Rapid", "Short", "Intermediate"], answer: "Long", explanation: "Glargine is a long-acting, peakless insulin lasting 24 hours."),
            .trueFalse(id: "q3a_t4", subsectionId: "3a", difficulty: .easy, question: "Metformin does NOT cause hypoglycemia when used alone.", answer: true, explanation: "Unlike sulfonylureas, metformin does not stimulate insulin release directly."),
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
            .fillBlank(id: "q3b_t1", subsectionId: "3b", difficulty: .easy, question: "SGLT2 inhibitors like empagliflozin (Jardiance) end in _____.", options: ["-gliflozin", "-gliptin", "-glutide", "-pril"], answer: "-gliflozin", explanation: "The -gliflozin suffix identifies SGLT2 inhibitors."),
            .trueFalse(id: "q3b_t2", subsectionId: "3b", difficulty: .easy, question: "GLP-1 receptor agonists like semaglutide (Ozempic) end in -glutide.", answer: true, explanation: "The -glutide suffix identifies GLP-1 receptor agonists."),
            .multipleChoice(id: "q3b_t3", subsectionId: "3b", difficulty: .easy, question: "DPP-4 inhibitors like sitagliptin (Januvia) end in:", options: ["-gliptin", "-gliflozin", "-glutide", "-glimepiride"], answer: "-gliptin", explanation: "The -gliptin suffix identifies DPP-4 inhibitors."),
            .trueFalse(id: "q3b_t4", subsectionId: "3b", difficulty: .easy, question: "Sulfonylureas like glipizide (Glucotrol) can cause hypoglycemia and weight gain.", answer: true, explanation: "Sulfonylureas stimulate insulin release, which can cause low blood sugar and weight gain."),
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

        bank["4a"] = [
            .trueFalse(id: "q4a_t1", subsectionId: "4a", difficulty: .easy, question: "SSRIs like sertraline (Zoloft) are first-line for depression.", answer: true, explanation: "SSRIs are the first-line treatment for major depressive disorder."),
            .multipleChoice(id: "q4a_t2", subsectionId: "4a", difficulty: .easy, question: "How long do SSRIs take to reach full therapeutic effect?", options: ["4-6 weeks", "1-2 days", "24 hours", "6 months"], answer: "4-6 weeks", explanation: "All antidepressants require 4-6 weeks for full efficacy."),
            .fillBlank(id: "q4a_t3", subsectionId: "4a", difficulty: .easy, question: "SNRIs block reuptake of both serotonin AND _____.", options: ["Norepinephrine", "Dopamine", "GABA", "Acetylcholine"], answer: "Norepinephrine", explanation: "SNRIs (venlafaxine, duloxetine) inhibit reuptake of serotonin and norepinephrine."),
            .trueFalse(id: "q4a_t4", subsectionId: "4a", difficulty: .easy, question: "Fluoxetine (Prozac) has the longest half-life of all SSRIs.", answer: true, explanation: "Fluoxetine has a half-life of 2-6 days plus an active metabolite."),
            .trueFalse(id: "q4a_1", subsectionId: "4a", question: "SSRIs take 4-6 weeks for full therapeutic effect.", answer: true, explanation: "Antidepressants require 4-6 weeks for full efficacy."),
            .fillBlank(id: "q4a_2", subsectionId: "4a", question: "The brand name of sertraline is _____.", options: ["Zoloft", "Prozac", "Lexapro", "Paxil"], answer: "Zoloft", explanation: "Sertraline is sold as Zoloft."),
            .multipleChoice(id: "q4a_3", subsectionId: "4a", question: "Which SSRI has the longest half-life?", options: ["Fluoxetine", "Sertraline", "Paroxetine", "Escitalopram"], answer: "Fluoxetine", explanation: "Fluoxetine has a half-life of 2-6 days (plus active metabolite)."),
            .multipleChoice(id: "q4a_4", subsectionId: "4a", question: "Which SSRI has the fewest drug interactions?", options: ["Escitalopram", "Fluoxetine", "Paroxetine", "Sertraline"], answer: "Escitalopram", explanation: "Escitalopram (Lexapro) has the fewest CYP interactions."),
            .trueFalse(id: "q4a_5", subsectionId: "4a", question: "Paroxetine is safe to use during pregnancy.", answer: false, explanation: "Paroxetine is category D; avoid in pregnancy."),
            .multipleChoice(id: "q4a_6", subsectionId: "4a", question: "Venlafaxine requires monitoring of:", options: ["Blood pressure", "Blood glucose", "INR", "Potassium"], answer: "Blood pressure", explanation: "Venlafaxine can cause dose-dependent hypertension."),
            .fillBlank(id: "q4a_7", subsectionId: "4a", question: "The brand name of duloxetine is _____.", options: ["Cymbalta", "Effexor", "Zoloft", "Lexapro"], answer: "Cymbalta", explanation: "Duloxetine is sold as Cymbalta."),
            .selectAll(id: "q4a_8", subsectionId: "4a", question: "Select ALL SSRIs:", options: ["Sertraline", "Venlafaxine", "Escitalopram", "Duloxetine", "Fluoxetine"], correctAnswers: ["Sertraline", "Escitalopram", "Fluoxetine"], explanation: "Venlafaxine and duloxetine are SNRIs, not SSRIs."),
            .matching(id: "q4a_9", subsectionId: "4a", question: "Match antidepressant to brand name:", pairs: [MatchingPair(left: "Sertraline", right: "Zoloft"), MatchingPair(left: "Fluoxetine", right: "Prozac"), MatchingPair(left: "Escitalopram", right: "Lexapro"), MatchingPair(left: "Duloxetine", right: "Cymbalta")], explanation: "Key antidepressant brand-generic pairs."),
            .multipleChoice(id: "q4a_10", subsectionId: "4a", question: "Which SNRI is also used for neuropathic pain and fibromyalgia?", options: ["Duloxetine", "Venlafaxine", "Sertraline", "Fluoxetine"], answer: "Duloxetine", explanation: "Duloxetine (Cymbalta) is FDA-approved for neuropathic pain and fibromyalgia."),
            .trueFalse(id: "q4a_11", subsectionId: "4a", difficulty: .medium, question: "Combining SSRIs with MAOIs can cause serotonin syndrome.", answer: true, explanation: "Serotonin syndrome is a life-threatening reaction from excess serotonin."),
            .multipleChoice(id: "q4a_12", subsectionId: "4a", difficulty: .hard, question: "Which SSRI is the strongest CYP2D6 inhibitor?", options: ["Fluoxetine", "Sertraline", "Escitalopram", "Citalopram"], answer: "Fluoxetine", explanation: "Fluoxetine (and paroxetine) are strong CYP2D6 inhibitors."),
        ]

        bank["4b"] = [
            .trueFalse(id: "q4b_1", subsectionId: "4b", question: "Benzodiazepines are Schedule IV controlled substances.", answer: true, explanation: "All benzodiazepines are Schedule IV."),
            .fillBlank(id: "q4b_2", subsectionId: "4b", question: "The reversal agent for benzodiazepines is _____.", options: ["Flumazenil", "Naloxone", "Digibind", "Protamine"], answer: "Flumazenil", explanation: "Flumazenil reverses benzodiazepine effects."),
            .multipleChoice(id: "q4b_3", subsectionId: "4b", question: "Which benzodiazepines are preferred in liver disease (LOT drugs)?", options: ["Lorazepam, Oxazepam, Temazepam", "Alprazolam, Diazepam, Clonazepam", "Midazolam, Triazolam, Alprazolam", "Diazepam, Lorazepam, Midazolam"], answer: "Lorazepam, Oxazepam, Temazepam", explanation: "LOT drugs have no active metabolites; preferred in hepatic impairment."),
            .multipleChoice(id: "q4b_4", subsectionId: "4b", question: "The brand name of alprazolam is:", options: ["Xanax", "Ativan", "Valium", "Klonopin"], answer: "Xanax", explanation: "Alprazolam is sold as Xanax."),
            .trueFalse(id: "q4b_5", subsectionId: "4b", question: "Zolpidem (Ambien) is a benzodiazepine.", answer: false, explanation: "Zolpidem is a non-benzodiazepine hypnotic (Z-drug)."),
            .multipleChoice(id: "q4b_6", subsectionId: "4b", question: "Which benzodiazepine is first-line IV for status epilepticus?", options: ["Lorazepam", "Alprazolam", "Diazepam", "Clonazepam"], answer: "Lorazepam", explanation: "IV lorazepam is first-line for status epilepticus."),
            .fillBlank(id: "q4b_7", subsectionId: "4b", question: "The brand name of zolpidem is _____.", options: ["Ambien", "Xanax", "Ativan", "Belsomra"], answer: "Ambien", explanation: "Zolpidem is sold as Ambien."),
            .selectAll(id: "q4b_8", subsectionId: "4b", question: "Select ALL benzodiazepines:", options: ["Alprazolam", "Zolpidem", "Lorazepam", "Suvorexant", "Diazepam"], correctAnswers: ["Alprazolam", "Lorazepam", "Diazepam"], explanation: "Zolpidem and suvorexant are not benzodiazepines."),
            .matching(id: "q4b_9", subsectionId: "4b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Alprazolam", right: "Xanax"), MatchingPair(left: "Lorazepam", right: "Ativan"), MatchingPair(left: "Diazepam", right: "Valium"), MatchingPair(left: "Zolpidem", right: "Ambien")], explanation: "Key anxiolytic/hypnotic brand names."),
            .multipleChoice(id: "q4b_10", subsectionId: "4b", difficulty: .medium, question: "Diazepam has a very long duration because:", options: ["It has active metabolites", "It has no metabolism", "It is renally eliminated", "It binds irreversibly"], answer: "It has active metabolites", explanation: "Diazepam's active metabolites prolong its effects significantly."),
            .trueFalse(id: "q4b_11", subsectionId: "4b", question: "FDA recommends lower zolpidem doses for women.", answer: true, explanation: "Women metabolize zolpidem more slowly; FDA lowered recommended dose."),
        ]

        bank["4c"] = [
            .trueFalse(id: "q4c_1", subsectionId: "4c", question: "Atypical antipsychotics have higher metabolic side effects than typicals.", answer: true, explanation: "Atypicals cause more weight gain, diabetes risk, and dyslipidemia."),
            .multipleChoice(id: "q4c_2", subsectionId: "4c", question: "Which atypical antipsychotic has the HIGHEST metabolic risk?", options: ["Olanzapine", "Aripiprazole", "Risperidone", "Quetiapine"], answer: "Olanzapine", explanation: "Olanzapine (Zyprexa) has the highest weight gain and metabolic risk."),
            .fillBlank(id: "q4c_3", subsectionId: "4c", question: "The brand name of quetiapine is _____.", options: ["Seroquel", "Zyprexa", "Risperdal", "Abilify"], answer: "Seroquel", explanation: "Quetiapine is sold as Seroquel."),
            .multipleChoice(id: "q4c_4", subsectionId: "4c", question: "Clozapine requires REMS monitoring of:", options: ["ANC (absolute neutrophil count)", "INR", "Blood glucose only", "Liver enzymes only"], answer: "ANC (absolute neutrophil count)", explanation: "Clozapine can cause agranulocytosis; mandatory ANC monitoring."),
            .trueFalse(id: "q4c_5", subsectionId: "4c", question: "Aripiprazole is a partial D2 agonist.", answer: true, explanation: "Aripiprazole has a unique mechanism as a partial dopamine D2 agonist."),
            .multipleChoice(id: "q4c_6", subsectionId: "4c", question: "NMS (neuroleptic malignant syndrome) presents with:", options: ["Fever, rigidity, altered mental status", "Rash, joint pain, headache", "Cough, dyspnea, chest pain", "Nausea, diarrhea, abdominal pain"], answer: "Fever, rigidity, altered mental status", explanation: "NMS is a medical emergency with high fever, lead-pipe rigidity, and AMS."),
            .fillBlank(id: "q4c_7", subsectionId: "4c", question: "The brand name of haloperidol is _____.", options: ["Haldol", "Seroquel", "Clozaril", "Abilify"], answer: "Haldol", explanation: "Haloperidol is sold as Haldol."),
            .selectAll(id: "q4c_8", subsectionId: "4c", question: "Select ALL atypical antipsychotics:", options: ["Quetiapine", "Haloperidol", "Aripiprazole", "Olanzapine", "Chlorpromazine"], correctAnswers: ["Quetiapine", "Aripiprazole", "Olanzapine"], explanation: "Haloperidol and chlorpromazine are typical (1st generation)."),
            .matching(id: "q4c_9", subsectionId: "4c", question: "Match antipsychotic to brand name:", pairs: [MatchingPair(left: "Quetiapine", right: "Seroquel"), MatchingPair(left: "Risperidone", right: "Risperdal"), MatchingPair(left: "Aripiprazole", right: "Abilify"), MatchingPair(left: "Clozapine", right: "Clozaril")], explanation: "Key antipsychotic brand-generic pairs."),
            .multipleChoice(id: "q4c_10", subsectionId: "4c", difficulty: .hard, question: "Which is the ONLY antipsychotic for treatment-resistant schizophrenia?", options: ["Clozapine", "Olanzapine", "Risperidone", "Haloperidol"], answer: "Clozapine", explanation: "Clozapine is the gold standard for treatment-resistant schizophrenia."),
            .multipleChoice(id: "q4c_11", subsectionId: "4c", question: "Which atypical is MOST likely to cause EPS?", options: ["Risperidone", "Quetiapine", "Olanzapine", "Aripiprazole"], answer: "Risperidone", explanation: "Risperidone has the highest EPS risk among atypicals."),
        ]

        bank["4d"] = [
            .trueFalse(id: "q4d_1", subsectionId: "4d", question: "Lithium has a narrow therapeutic index.", answer: true, explanation: "Lithium therapeutic range is 0.6-1.2 mEq/L."),
            .fillBlank(id: "q4d_2", subsectionId: "4d", question: "Lithium therapeutic range is 0.6-___ mEq/L.", options: ["1.2", "2.0", "0.8", "1.5"], answer: "1.2", explanation: "Lithium levels above 1.5 are associated with toxicity."),
            .multipleChoice(id: "q4d_3", subsectionId: "4d", question: "Which drug class INCREASES lithium levels?", options: ["NSAIDs", "Acetaminophen", "Penicillins", "Statins"], answer: "NSAIDs", explanation: "NSAIDs decrease renal lithium clearance, increasing levels."),
            .multipleChoice(id: "q4d_4", subsectionId: "4d", question: "Lamotrigine must be titrated slowly to prevent:", options: ["SJS/TEN", "Hepatotoxicity", "Agranulocytosis", "Renal failure"], answer: "SJS/TEN", explanation: "Rapid lamotrigine titration increases risk of Stevens-Johnson syndrome."),
            .trueFalse(id: "q4d_5", subsectionId: "4d", question: "Valproic acid is safe to use during pregnancy.", answer: false, explanation: "Valproic acid causes neural tube defects; contraindicated in pregnancy."),
            .fillBlank(id: "q4d_6", subsectionId: "4d", question: "The brand name of lamotrigine is _____.", options: ["Lamictal", "Keppra", "Tegretol", "Dilantin"], answer: "Lamictal", explanation: "Lamotrigine is sold as Lamictal."),
            .multipleChoice(id: "q4d_7", subsectionId: "4d", question: "Phenytoin exhibits which type of kinetics?", options: ["Zero-order", "First-order", "Second-order", "Mixed-order"], answer: "Zero-order", explanation: "Phenytoin has saturable metabolism; small dose changes cause large level changes."),
            .selectAll(id: "q4d_8", subsectionId: "4d", question: "Select ALL mood stabilizers used in bipolar disorder:", options: ["Lithium", "Valproic acid", "Lamotrigine", "Levetiracetam"], correctAnswers: ["Lithium", "Valproic acid", "Lamotrigine"], explanation: "Levetiracetam is an anticonvulsant but not a mood stabilizer."),
            .matching(id: "q4d_9", subsectionId: "4d", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Lithium", right: "Lithobid"), MatchingPair(left: "Valproic acid", right: "Depakote"), MatchingPair(left: "Levetiracetam", right: "Keppra"), MatchingPair(left: "Phenytoin", right: "Dilantin")], explanation: "Key anticonvulsant/mood stabilizer brand names."),
            .multipleChoice(id: "q4d_10", subsectionId: "4d", question: "A unique side effect of phenytoin is:", options: ["Gingival hyperplasia", "Gynecomastia", "Dry cough", "Photosensitivity"], answer: "Gingival hyperplasia", explanation: "Phenytoin causes gum overgrowth (gingival hyperplasia)."),
            .trueFalse(id: "q4d_11", subsectionId: "4d", difficulty: .medium, question: "Carbamazepine is a strong CYP3A4 inducer.", answer: true, explanation: "Carbamazepine induces its own metabolism and many other drugs."),
        ]

        bank["4e"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("4") && key != "4e" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["5a"] = [
            .trueFalse(id: "q5a_t1", subsectionId: "5a", difficulty: .easy, question: "Amoxicillin (Amoxil) is the most commonly prescribed antibiotic in children.", answer: true, explanation: "Amoxicillin is the most prescribed antibiotic for pediatric infections."),
            .multipleChoice(id: "q5a_t2", subsectionId: "5a", difficulty: .easy, question: "All beta-lactam antibiotics (penicillins, cephalosporins) work by:", options: ["Inhibiting cell wall synthesis", "Inhibiting protein synthesis", "Inhibiting DNA replication", "Inhibiting folate synthesis"], answer: "Inhibiting cell wall synthesis", explanation: "Beta-lactams bind PBPs and prevent bacterial cell wall formation."),
            .fillBlank(id: "q5a_t3", subsectionId: "5a", difficulty: .easy, question: "Augmentin is the brand name for amoxicillin combined with _____.", options: ["Clavulanate", "Tazobactam", "Sulbactam", "Metronidazole"], answer: "Clavulanate", explanation: "Augmentin = amoxicillin + clavulanate (a beta-lactamase inhibitor)."),
            .trueFalse(id: "q5a_t4", subsectionId: "5a", difficulty: .easy, question: "Ceftriaxone (Rocephin) is a 3rd-generation cephalosporin used for meningitis.", answer: true, explanation: "Ceftriaxone crosses the blood-brain barrier and is empiric for meningitis."),
            .trueFalse(id: "q5a_1", subsectionId: "5a", question: "All beta-lactam antibiotics inhibit cell wall synthesis.", answer: true, explanation: "Beta-lactams bind PBPs and inhibit peptidoglycan cross-linking."),
            .fillBlank(id: "q5a_2", subsectionId: "5a", question: "The brand name of amoxicillin/clavulanate is _____.", options: ["Augmentin", "Amoxil", "Zosyn", "Keflex"], answer: "Augmentin", explanation: "Amoxicillin/clavulanate is sold as Augmentin."),
            .multipleChoice(id: "q5a_3", subsectionId: "5a", question: "Clavulanate in Augmentin serves to:", options: ["Inhibit beta-lactamase", "Increase absorption", "Reduce side effects", "Broaden spectrum to viruses"], answer: "Inhibit beta-lactamase", explanation: "Clavulanate inhibits beta-lactamase enzymes that destroy penicillins."),
            .multipleChoice(id: "q5a_4", subsectionId: "5a", question: "Which cephalosporin generation covers Pseudomonas?", options: ["4th generation", "1st generation", "2nd generation", "3rd generation (most)"], answer: "4th generation", explanation: "Cefepime (4th gen) has reliable Pseudomonal coverage."),
            .trueFalse(id: "q5a_5", subsectionId: "5a", question: "Cross-reactivity between penicillins and cephalosporins is about 50%.", answer: false, explanation: "Cross-reactivity is approximately 1-2%."),
            .fillBlank(id: "q5a_6", subsectionId: "5a", question: "The brand name of ceftriaxone is _____.", options: ["Rocephin", "Keflex", "Maxipime", "Zosyn"], answer: "Rocephin", explanation: "Ceftriaxone is sold as Rocephin."),
            .multipleChoice(id: "q5a_7", subsectionId: "5a", question: "Which antibiotic is empiric for meningitis?", options: ["Ceftriaxone", "Cephalexin", "Amoxicillin", "Cefepime"], answer: "Ceftriaxone", explanation: "Ceftriaxone crosses the BBB and covers common meningitis pathogens."),
            .selectAll(id: "q5a_8", subsectionId: "5a", question: "Select ALL 3rd or 4th generation cephalosporins:", options: ["Ceftriaxone", "Cefepime", "Cephalexin", "Amoxicillin"], correctAnswers: ["Ceftriaxone", "Cefepime"], explanation: "Cephalexin is 1st gen; amoxicillin is a penicillin."),
            .matching(id: "q5a_9", subsectionId: "5a", question: "Match antibiotic to brand name:", pairs: [MatchingPair(left: "Amoxicillin", right: "Amoxil"), MatchingPair(left: "Augmentin", right: "Amox/Clav"), MatchingPair(left: "Cephalexin", right: "Keflex"), MatchingPair(left: "Ceftriaxone", right: "Rocephin")], explanation: "Key beta-lactam brand-generic pairs."),
            .multipleChoice(id: "q5a_10", subsectionId: "5a", question: "Piperacillin/tazobactam (Zosyn) is notable because:", options: ["It covers Pseudomonas", "It is oral only", "It is 1st generation", "It cannot be given with aminoglycosides"], answer: "It covers Pseudomonas", explanation: "Zosyn is a broad-spectrum IV antibiotic covering Pseudomonas."),
            .trueFalse(id: "q5a_11", subsectionId: "5a", difficulty: .medium, question: "1st generation cephalosporins have the best gram-positive coverage.", answer: true, explanation: "As generation increases, gram-positive coverage decreases."),
        ]

        bank["5b"] = [
            .fillBlank(id: "q5b_t1", subsectionId: "5b", difficulty: .easy, question: "All fluoroquinolones end in _____.", options: ["-floxacin", "-mycin", "-cillin", "-cycline"], answer: "-floxacin", explanation: "The -floxacin suffix identifies fluoroquinolones (ciprofloxacin, levofloxacin)."),
            .trueFalse(id: "q5b_t2", subsectionId: "5b", difficulty: .easy, question: "Azithromycin (Zithromax/Z-Pack) is a macrolide antibiotic.", answer: true, explanation: "Azithromycin is one of the most commonly prescribed macrolides."),
            .multipleChoice(id: "q5b_t3", subsectionId: "5b", difficulty: .easy, question: "Doxycycline (Vibramycin) belongs to which antibiotic class?", options: ["Tetracycline", "Macrolide", "Fluoroquinolone", "Penicillin"], answer: "Tetracycline", explanation: "Doxycycline is a tetracycline antibiotic ending in -cycline."),
            .trueFalse(id: "q5b_t4", subsectionId: "5b", difficulty: .easy, question: "TMP/SMX (Bactrim) is first-line for uncomplicated UTIs.", answer: true, explanation: "Trimethoprim/sulfamethoxazole (Bactrim) is a go-to for simple UTIs."),
            .fillBlank(id: "q5b_1", subsectionId: "5b", question: "All fluoroquinolones end in _____.", options: ["-floxacin", "-mycin", "-cillin", "-cycline"], answer: "-floxacin", explanation: "The -floxacin suffix identifies fluoroquinolones."),
            .trueFalse(id: "q5b_2", subsectionId: "5b", question: "Fluoroquinolones have a black box warning for tendon rupture.", answer: true, explanation: "FDA black box warning for tendinitis and tendon rupture."),
            .multipleChoice(id: "q5b_3", subsectionId: "5b", question: "The brand name of azithromycin is:", options: ["Zithromax", "Biaxin", "Cipro", "Levaquin"], answer: "Zithromax", explanation: "Azithromycin is sold as Zithromax (Z-Pack)."),
            .multipleChoice(id: "q5b_4", subsectionId: "5b", question: "Doxycycline should be avoided in children under age:", options: ["8", "12", "5", "18"], answer: "8", explanation: "Tetracyclines cause permanent tooth discoloration in children < 8."),
            .trueFalse(id: "q5b_5", subsectionId: "5b", question: "Fluoroquinolones should be taken with calcium or iron supplements.", answer: false, explanation: "Fluoroquinolones chelate with divalent cations; separate by 2 hours."),
            .multipleChoice(id: "q5b_6", subsectionId: "5b", question: "TMP/SMX (Bactrim) is first-line for:", options: ["Uncomplicated UTI", "Meningitis", "Endocarditis", "Pneumonia in healthy adults"], answer: "Uncomplicated UTI", explanation: "TMP/SMX is a first-line agent for uncomplicated UTIs."),
            .fillBlank(id: "q5b_7", subsectionId: "5b", question: "The brand name of ciprofloxacin is _____.", options: ["Cipro", "Levaquin", "Zithromax", "Bactrim"], answer: "Cipro", explanation: "Ciprofloxacin is sold as Cipro."),
            .selectAll(id: "q5b_8", subsectionId: "5b", question: "Select ALL macrolide antibiotics:", options: ["Azithromycin", "Clarithromycin", "Ciprofloxacin", "Doxycycline"], correctAnswers: ["Azithromycin", "Clarithromycin"], explanation: "Ciprofloxacin is a fluoroquinolone; doxycycline is a tetracycline."),
            .matching(id: "q5b_9", subsectionId: "5b", question: "Match antibiotic to brand name:", pairs: [MatchingPair(left: "Ciprofloxacin", right: "Cipro"), MatchingPair(left: "Azithromycin", right: "Zithromax"), MatchingPair(left: "Doxycycline", right: "Vibramycin"), MatchingPair(left: "TMP/SMX", right: "Bactrim")], explanation: "Key antibiotic brand-generic pairs."),
            .multipleChoice(id: "q5b_10", subsectionId: "5b", difficulty: .medium, question: "Doxycycline is unique among tetracyclines because:", options: ["It can be used in renal impairment", "It has no photosensitivity", "It is safe in pregnancy", "It has no GI side effects"], answer: "It can be used in renal impairment", explanation: "Doxycycline is eliminated by non-renal routes."),
            .trueFalse(id: "q5b_11", subsectionId: "5b", question: "Macrolides can prolong the QT interval.", answer: true, explanation: "All macrolides carry a risk of QT prolongation."),
        ]

        bank["5c"] = [
            .trueFalse(id: "q5c_1", subsectionId: "5c", question: "Oral vancomycin is absorbed systemically.", answer: false, explanation: "Oral vancomycin stays in the GI tract; used only for C. diff."),
            .multipleChoice(id: "q5c_2", subsectionId: "5c", question: "Red man syndrome from vancomycin is managed by:", options: ["Slowing the infusion rate", "Stopping vancomycin permanently", "Adding epinephrine", "Switching to oral"], answer: "Slowing the infusion rate", explanation: "Red man syndrome is a histamine reaction; slow the infusion."),
            .fillBlank(id: "q5c_3", subsectionId: "5c", question: "The brand name of linezolid is _____.", options: ["Zyvox", "Cubicin", "Vancocin", "Invanz"], answer: "Zyvox", explanation: "Linezolid is sold as Zyvox."),
            .multipleChoice(id: "q5c_4", subsectionId: "5c", question: "Daptomycin should NOT be used for:", options: ["Pneumonia", "Bacteremia", "Endocarditis", "Skin infections"], answer: "Pneumonia", explanation: "Daptomycin is inactivated by pulmonary surfactant."),
            .trueFalse(id: "q5c_5", subsectionId: "5c", question: "Linezolid is a weak MAO inhibitor.", answer: true, explanation: "Linezolid inhibits MAO, risking serotonin syndrome with SSRIs."),
            .multipleChoice(id: "q5c_6", subsectionId: "5c", question: "First-line treatment for C. difficile is:", options: ["Oral vancomycin", "IV vancomycin", "Metronidazole", "Linezolid"], answer: "Oral vancomycin", explanation: "Oral vancomycin or fidaxomicin is first-line for C. diff."),
            .selectAll(id: "q5c_7", subsectionId: "5c", question: "Select ALL drugs that cover MRSA:", options: ["Vancomycin IV", "Linezolid", "Daptomycin", "Amoxicillin"], correctAnswers: ["Vancomycin IV", "Linezolid", "Daptomycin"], explanation: "Amoxicillin does not cover MRSA."),
            .matching(id: "q5c_8", subsectionId: "5c", question: "Match drug to monitoring parameter:", pairs: [MatchingPair(left: "Vancomycin IV", right: "Trough/AUC"), MatchingPair(left: "Linezolid", right: "CBC weekly"), MatchingPair(left: "Daptomycin", right: "CPK weekly")], explanation: "Key monitoring for anti-MRSA agents."),
            .multipleChoice(id: "q5c_9", subsectionId: "5c", difficulty: .hard, question: "Which drug covers VRE (vancomycin-resistant enterococcus)?", options: ["Linezolid", "Vancomycin", "Ceftriaxone", "Daptomycin (skin only)"], answer: "Linezolid", explanation: "Linezolid is a key agent for VRE infections."),
            .trueFalse(id: "q5c_10", subsectionId: "5c", question: "IV vancomycin should be monitored with AUC/MIC or trough levels.", answer: true, explanation: "AUC/MIC-guided dosing is now preferred for IV vancomycin."),
        ]

        bank["5d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("5") && key != "5d" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["6a"] = [
            .trueFalse(id: "q6a_t1", subsectionId: "6a", difficulty: .easy, question: "Inhaled corticosteroids (ICS) like fluticasone (Flovent) are used for asthma maintenance, NOT rescue.", answer: true, explanation: "ICS reduce airway inflammation for long-term control. They are not rescue inhalers."),
            .multipleChoice(id: "q6a_t2", subsectionId: "6a", difficulty: .easy, question: "Why should you rinse your mouth after using an inhaled corticosteroid?", options: ["To prevent oral thrush (candidiasis)", "To improve drug absorption", "To reduce cough", "To prevent tooth decay"], answer: "To prevent oral thrush (candidiasis)", explanation: "ICS deposits can cause fungal infections in the mouth."),
            .fillBlank(id: "q6a_t3", subsectionId: "6a", difficulty: .easy, question: "Advair contains fluticasone (ICS) combined with salmeterol, which is a _____.", options: ["LABA", "SABA", "LAMA", "ICS"], answer: "LABA", explanation: "Advair = ICS (fluticasone) + LABA (salmeterol). LABAs should never be used alone in asthma."),
            .trueFalse(id: "q6a_1", subsectionId: "6a", question: "Inhaled corticosteroids are used as rescue inhalers for acute asthma.", answer: false, explanation: "ICS are maintenance only. SABAs (albuterol) are for rescue."),
            .fillBlank(id: "q6a_2", subsectionId: "6a", question: "The brand name of fluticasone/salmeterol is _____.", options: ["Advair", "Symbicort", "Flovent", "Serevent"], answer: "Advair", explanation: "Fluticasone/salmeterol is sold as Advair."),
            .multipleChoice(id: "q6a_3", subsectionId: "6a", question: "Why must you rinse your mouth after using an ICS?", options: ["To prevent oral thrush", "To improve absorption", "To prevent tooth decay", "To reduce cough"], answer: "To prevent oral thrush", explanation: "ICS deposits in the mouth can cause candidiasis (thrush)."),
            .trueFalse(id: "q6a_4", subsectionId: "6a", question: "LABAs can safely be used alone in asthma.", answer: false, explanation: "Black Box Warning: LABAs alone increase asthma-related death. Always use with ICS."),
            .multipleChoice(id: "q6a_5", subsectionId: "6a", question: "Which ICS/LABA can be used as SMART therapy (maintenance + reliever)?", options: ["Symbicort", "Advair", "Dulera", "Flovent"], answer: "Symbicort", explanation: "Budesonide/formoterol (Symbicort) can be used as both maintenance and rescue."),
            .fillBlank(id: "q6a_6", subsectionId: "6a", question: "The brand name of budesonide inhaler is _____.", options: ["Pulmicort", "Flovent", "Serevent", "Advair"], answer: "Pulmicort", explanation: "Inhaled budesonide is sold as Pulmicort."),
            .selectAll(id: "q6a_7", subsectionId: "6a", question: "Select ALL ICS/LABA combinations:", options: ["Advair", "Symbicort", "Flovent", "Spiriva", "Dulera"], correctAnswers: ["Advair", "Symbicort", "Dulera"], explanation: "Flovent is ICS only; Spiriva is a LAMA."),
            .matching(id: "q6a_8", subsectionId: "6a", question: "Match inhaler to brand name:", pairs: [MatchingPair(left: "Fluticasone/Salmeterol", right: "Advair"), MatchingPair(left: "Budesonide/Formoterol", right: "Symbicort"), MatchingPair(left: "Fluticasone alone", right: "Flovent"), MatchingPair(left: "Budesonide alone", right: "Pulmicort")], explanation: "Key respiratory inhaler brand names."),
            .multipleChoice(id: "q6a_9", subsectionId: "6a", question: "What is the key difference between salmeterol and formoterol?", options: ["Formoterol has rapid onset", "Salmeterol is short-acting", "Formoterol is an ICS", "Salmeterol works faster"], answer: "Formoterol has rapid onset", explanation: "Formoterol has a rapid onset allowing rescue use; salmeterol has slow onset."),
            .trueFalse(id: "q6a_10", subsectionId: "6a", difficulty: .medium, question: "Salmeterol has a Black Box Warning when used without an ICS in asthma.", answer: true, explanation: "LABAs without ICS increase the risk of asthma-related death."),
        ]

        bank["6b"] = [
            .trueFalse(id: "q6b_t1", subsectionId: "6b", difficulty: .easy, question: "Albuterol (ProAir/Ventolin) is the #1 rescue inhaler for acute asthma.", answer: true, explanation: "Albuterol is a SABA (short-acting beta-2 agonist) used for quick relief."),
            .multipleChoice(id: "q6b_t2", subsectionId: "6b", difficulty: .easy, question: "Tiotropium (Spiriva) is a long-acting anticholinergic used mainly for:", options: ["COPD maintenance", "Acute asthma rescue", "Pneumonia treatment", "Cough suppression"], answer: "COPD maintenance", explanation: "Tiotropium (Spiriva) is a LAMA, a cornerstone of COPD maintenance therapy."),
            .multipleChoice(id: "q6b_1", subsectionId: "6b", question: "The first-line rescue inhaler for acute bronchospasm is:", options: ["Albuterol", "Tiotropium", "Fluticasone", "Montelukast"], answer: "Albuterol", explanation: "Albuterol (ProAir/Ventolin) is the #1 rescue inhaler."),
            .fillBlank(id: "q6b_2", subsectionId: "6b", question: "The brand name of tiotropium is _____.", options: ["Spiriva", "Atrovent", "ProAir", "Advair"], answer: "Spiriva", explanation: "Tiotropium is sold as Spiriva."),
            .trueFalse(id: "q6b_3", subsectionId: "6b", question: "Albuterol is a beta-2 agonist.", answer: true, explanation: "Albuterol selectively stimulates beta-2 receptors in the lungs."),
            .multipleChoice(id: "q6b_4", subsectionId: "6b", question: "Using a rescue inhaler more than 2 days/week suggests:", options: ["Uncontrolled asthma", "Normal asthma management", "The patient is cured", "Need for less medication"], answer: "Uncontrolled asthma", explanation: "Frequent SABA use indicates need to step up maintenance therapy."),
            .trueFalse(id: "q6b_5", subsectionId: "6b", question: "Ipratropium (Atrovent) is a long-acting anticholinergic.", answer: false, explanation: "Ipratropium is SHORT-acting. Tiotropium (Spiriva) is long-acting."),
            .multipleChoice(id: "q6b_6", subsectionId: "6b", question: "The main side effect of anticholinergic inhalers is:", options: ["Dry mouth", "Tachycardia", "Tremor", "Oral thrush"], answer: "Dry mouth", explanation: "Anticholinergics reduce secretions causing dry mouth."),
            .selectAll(id: "q6b_7", subsectionId: "6b", question: "Select ALL short-acting bronchodilators:", options: ["Albuterol", "Ipratropium", "Tiotropium", "Salmeterol"], correctAnswers: ["Albuterol", "Ipratropium"], explanation: "Tiotropium is a LAMA; salmeterol is a LABA."),
            .matching(id: "q6b_8", subsectionId: "6b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Albuterol", right: "ProAir/Ventolin"), MatchingPair(left: "Ipratropium", right: "Atrovent"), MatchingPair(left: "Tiotropium", right: "Spiriva")], explanation: "Key bronchodilator brand names."),
            .fillBlank(id: "q6b_9", subsectionId: "6b", question: "DuoNeb combines albuterol with _____.", options: ["Ipratropium", "Tiotropium", "Fluticasone", "Montelukast"], answer: "Ipratropium", explanation: "DuoNeb is albuterol + ipratropium for acute bronchospasm."),
            .multipleChoice(id: "q6b_10", subsectionId: "6b", question: "Albuterol can cause which electrolyte abnormality?", options: ["Hypokalemia", "Hyperkalemia", "Hyponatremia", "Hypercalcemia"], answer: "Hypokalemia", explanation: "Beta-2 agonists drive potassium into cells, lowering serum K+."),
        ]

        bank["6c"] = [
            .trueFalse(id: "q6c_1", subsectionId: "6c", question: "Montelukast (Singulair) has a Black Box Warning for neuropsychiatric events.", answer: true, explanation: "FDA added a Black Box for suicidal ideation, depression, and behavioral changes."),
            .fillBlank(id: "q6c_2", subsectionId: "6c", question: "The brand name of montelukast is _____.", options: ["Singulair", "Xolair", "Dupixent", "Daliresp"], answer: "Singulair", explanation: "Montelukast is sold as Singulair."),
            .multipleChoice(id: "q6c_3", subsectionId: "6c", question: "Omalizumab (Xolair) works by:", options: ["Binding free IgE", "Blocking leukotrienes", "Inhibiting PDE-4", "Blocking histamine"], answer: "Binding free IgE", explanation: "Omalizumab is an anti-IgE monoclonal antibody."),
            .multipleChoice(id: "q6c_4", subsectionId: "6c", question: "Theophylline's therapeutic range is:", options: ["5-15 mcg/mL", "0.5-2 ng/mL", "10-20 mcg/mL", "0.6-1.2 mEq/L"], answer: "5-15 mcg/mL", explanation: "Theophylline has a narrow therapeutic index of 5-15 mcg/mL."),
            .trueFalse(id: "q6c_5", subsectionId: "6c", question: "Roflumilast is a bronchodilator.", answer: false, explanation: "Roflumilast is a PDE-4 inhibitor that reduces inflammation; it is NOT a bronchodilator."),
            .multipleChoice(id: "q6c_6", subsectionId: "6c", question: "Dupilumab (Dupixent) blocks which interleukins?", options: ["IL-4 and IL-13", "IL-1 and IL-6", "IL-2 and IL-12", "IL-5 only"], answer: "IL-4 and IL-13", explanation: "Dupilumab targets IL-4 and IL-13 signaling in type 2 inflammation."),
            .selectAll(id: "q6c_7", subsectionId: "6c", question: "Select ALL biologic agents for severe asthma:", options: ["Omalizumab", "Dupilumab", "Montelukast", "Albuterol"], correctAnswers: ["Omalizumab", "Dupilumab"], explanation: "Montelukast is oral; albuterol is a SABA. Biologics are injectable."),
            .matching(id: "q6c_8", subsectionId: "6c", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Montelukast", right: "Singulair"), MatchingPair(left: "Omalizumab", right: "Xolair"), MatchingPair(left: "Dupilumab", right: "Dupixent"), MatchingPair(left: "Roflumilast", right: "Daliresp")], explanation: "Key specialty respiratory drug brand names."),
            .multipleChoice(id: "q6c_9", subsectionId: "6c", difficulty: .hard, question: "Which agent requires a 2-hour observation after first doses due to anaphylaxis risk?", options: ["Omalizumab", "Montelukast", "Theophylline", "Roflumilast"], answer: "Omalizumab", explanation: "Omalizumab carries a Black Box for anaphylaxis; observe patients."),
        ]

        bank["6d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("6") && key != "6d" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["7a"] = [
            .fillBlank(id: "q7a_t1", subsectionId: "7a", difficulty: .easy, question: "All PPIs (proton pump inhibitors) end in _____.", options: ["-prazole", "-tidine", "-setron", "-pril"], answer: "-prazole", explanation: "The -prazole suffix identifies PPIs (omeprazole, pantoprazole, esomeprazole)."),
            .trueFalse(id: "q7a_t2", subsectionId: "7a", difficulty: .easy, question: "PPIs like omeprazole (Prilosec) should be taken 30-60 minutes BEFORE meals.", answer: true, explanation: "PPIs need acid to activate; take before eating for best effect."),
            .multipleChoice(id: "q7a_t3", subsectionId: "7a", difficulty: .easy, question: "H2 blockers like famotidine (Pepcid) end in:", options: ["-tidine", "-prazole", "-setron", "-olol"], answer: "-tidine", explanation: "The -tidine suffix identifies H2 receptor antagonists."),
            .fillBlank(id: "q7a_1", subsectionId: "7a", question: "All PPIs end in _____.", options: ["-prazole", "-tidine", "-setron", "-pril"], answer: "-prazole", explanation: "The -prazole suffix identifies proton pump inhibitors."),
            .trueFalse(id: "q7a_2", subsectionId: "7a", question: "PPIs should be taken 30-60 minutes before the first meal.", answer: true, explanation: "PPIs need an acidic environment to activate; take before eating."),
            .multipleChoice(id: "q7a_3", subsectionId: "7a", question: "Which PPI should be avoided with clopidogrel?", options: ["Omeprazole", "Pantoprazole", "Lansoprazole", "Rabeprazole"], answer: "Omeprazole", explanation: "Omeprazole inhibits CYP2C19, reducing clopidogrel activation."),
            .multipleChoice(id: "q7a_4", subsectionId: "7a", question: "The brand name of omeprazole is:", options: ["Prilosec", "Nexium", "Protonix", "Prevacid"], answer: "Prilosec", explanation: "Omeprazole is sold as Prilosec."),
            .trueFalse(id: "q7a_5", subsectionId: "7a", question: "Long-term PPI use can increase C. difficile risk.", answer: true, explanation: "Reduced stomach acid allows C. diff overgrowth."),
            .selectAll(id: "q7a_6", subsectionId: "7a", question: "Select ALL long-term risks of PPI use:", options: ["C. diff", "Bone fractures", "Hypomagnesemia", "Hyperkalemia"], correctAnswers: ["C. diff", "Bone fractures", "Hypomagnesemia"], explanation: "PPIs do not cause hyperkalemia."),
            .fillBlank(id: "q7a_7", subsectionId: "7a", question: "H2 blockers end in _____.", options: ["-tidine", "-prazole", "-setron", "-olol"], answer: "-tidine", explanation: "The -tidine suffix identifies H2 receptor antagonists."),
            .multipleChoice(id: "q7a_8", subsectionId: "7a", question: "The brand name of famotidine is:", options: ["Pepcid", "Prilosec", "Carafate", "Nexium"], answer: "Pepcid", explanation: "Famotidine is sold as Pepcid."),
            .matching(id: "q7a_9", subsectionId: "7a", question: "Match PPI to brand name:", pairs: [MatchingPair(left: "Omeprazole", right: "Prilosec"), MatchingPair(left: "Esomeprazole", right: "Nexium"), MatchingPair(left: "Pantoprazole", right: "Protonix"), MatchingPair(left: "Lansoprazole", right: "Prevacid")], explanation: "Key PPI brand-generic pairs."),
            .multipleChoice(id: "q7a_10", subsectionId: "7a", question: "Which PPI is preferred with clopidogrel?", options: ["Pantoprazole", "Omeprazole", "Esomeprazole", "Lansoprazole"], answer: "Pantoprazole", explanation: "Pantoprazole has less CYP2C19 interaction than omeprazole."),
            .trueFalse(id: "q7a_11", subsectionId: "7a", difficulty: .medium, question: "Sucralfate should be taken with food for best effect.", answer: false, explanation: "Sucralfate should be taken on an empty stomach to coat the ulcer."),
        ]

        bank["7b"] = [
            .multipleChoice(id: "q7b_1", subsectionId: "7b", question: "First-line antiemetic for most nausea/vomiting is:", options: ["Ondansetron", "Promethazine", "Metoclopramide", "Scopolamine"], answer: "Ondansetron", explanation: "Ondansetron (Zofran) is first-line for most N/V."),
            .fillBlank(id: "q7b_2", subsectionId: "7b", question: "The brand name of ondansetron is _____.", options: ["Zofran", "Phenergan", "Reglan", "Emend"], answer: "Zofran", explanation: "Ondansetron is sold as Zofran."),
            .trueFalse(id: "q7b_3", subsectionId: "7b", question: "Metoclopramide has a Black Box Warning for tardive dyskinesia.", answer: true, explanation: "Long-term use can cause irreversible tardive dyskinesia."),
            .multipleChoice(id: "q7b_4", subsectionId: "7b", question: "Scopolamine patch is best for:", options: ["Motion sickness", "Chemotherapy N/V", "Morning sickness", "Gastroparesis"], answer: "Motion sickness", explanation: "Transdermal scopolamine is first-line for motion sickness."),
            .trueFalse(id: "q7b_5", subsectionId: "7b", question: "Promethazine is safe in children under 2 years old.", answer: false, explanation: "Black Box: avoid in children < 2 due to respiratory depression risk."),
            .multipleChoice(id: "q7b_6", subsectionId: "7b", question: "Aprepitant (Emend) is primarily used for:", options: ["Highly emetogenic chemotherapy", "Motion sickness", "Morning sickness", "Gastroparesis"], answer: "Highly emetogenic chemotherapy", explanation: "NK1 antagonists are added for high emetic risk chemotherapy."),
            .fillBlank(id: "q7b_7", subsectionId: "7b", question: "The brand name of metoclopramide is _____.", options: ["Reglan", "Zofran", "Phenergan", "Emend"], answer: "Reglan", explanation: "Metoclopramide is sold as Reglan."),
            .selectAll(id: "q7b_8", subsectionId: "7b", question: "Select ALL 5-HT3 antagonist side effects:", options: ["Headache", "Constipation", "QT prolongation", "Tardive dyskinesia"], correctAnswers: ["Headache", "Constipation", "QT prolongation"], explanation: "Tardive dyskinesia is associated with metoclopramide, not ondansetron."),
            .matching(id: "q7b_9", subsectionId: "7b", question: "Match antiemetic to brand name:", pairs: [MatchingPair(left: "Ondansetron", right: "Zofran"), MatchingPair(left: "Promethazine", right: "Phenergan"), MatchingPair(left: "Metoclopramide", right: "Reglan"), MatchingPair(left: "Aprepitant", right: "Emend")], explanation: "Key antiemetic brand-generic pairs."),
            .multipleChoice(id: "q7b_10", subsectionId: "7b", difficulty: .medium, question: "Metoclopramide should be limited to how many weeks of use?", options: ["12 weeks", "4 weeks", "24 weeks", "No limit"], answer: "12 weeks", explanation: "Limit to 12 weeks due to tardive dyskinesia risk."),
        ]

        bank["7c"] = [
            .multipleChoice(id: "q7c_1", subsectionId: "7c", question: "First-line treatment for chronic constipation is:", options: ["Polyethylene glycol (MiraLAX)", "Bisacodyl", "Docusate", "Senna"], answer: "Polyethylene glycol (MiraLAX)", explanation: "PEG (MiraLAX) is first-line osmotic laxative for chronic constipation."),
            .fillBlank(id: "q7c_2", subsectionId: "7c", question: "The brand name of docusate sodium is _____.", options: ["Colace", "MiraLAX", "Dulcolax", "Senokot"], answer: "Colace", explanation: "Docusate sodium is sold as Colace."),
            .trueFalse(id: "q7c_3", subsectionId: "7c", question: "Mesalamine is first-line for mild-moderate ulcerative colitis.", answer: true, explanation: "5-ASA agents like mesalamine are first-line for mild-moderate UC."),
            .multipleChoice(id: "q7c_4", subsectionId: "7c", question: "Before starting infliximab, you must screen for:", options: ["Tuberculosis", "Diabetes", "Hypothyroidism", "Anemia"], answer: "Tuberculosis", explanation: "Anti-TNF agents can reactivate latent TB; mandatory screening."),
            .trueFalse(id: "q7c_5", subsectionId: "7c", question: "Bisacodyl (Dulcolax) is safe for long-term daily use.", answer: false, explanation: "Stimulant laxatives should be used short-term to avoid dependence."),
            .multipleChoice(id: "q7c_6", subsectionId: "7c", question: "The brand name of mesalamine is:", options: ["Asacol/Lialda", "Remicade", "Colace", "MiraLAX"], answer: "Asacol/Lialda", explanation: "Mesalamine has multiple formulations including Asacol and Lialda."),
            .selectAll(id: "q7c_7", subsectionId: "7c", question: "Select ALL osmotic laxatives:", options: ["Polyethylene glycol", "Lactulose", "Bisacodyl", "Docusate"], correctAnswers: ["Polyethylene glycol", "Lactulose"], explanation: "Bisacodyl is stimulant; docusate is a stool softener."),
            .matching(id: "q7c_8", subsectionId: "7c", question: "Match drug to brand name:", pairs: [MatchingPair(left: "PEG", right: "MiraLAX"), MatchingPair(left: "Docusate", right: "Colace"), MatchingPair(left: "Bisacodyl", right: "Dulcolax"), MatchingPair(left: "Infliximab", right: "Remicade")], explanation: "Key GI drug brand names."),
            .multipleChoice(id: "q7c_9", subsectionId: "7c", difficulty: .hard, question: "The IBD treatment step-up approach is:", options: ["5-ASA → steroids → biologics", "Biologics → steroids → 5-ASA", "Steroids → surgery → 5-ASA", "5-ASA → biologics → steroids"], answer: "5-ASA → steroids → biologics", explanation: "Treatment escalates from mild to severe disease."),
        ]

        bank["7d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("7") && key != "7d" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["8a"] = [
            .trueFalse(id: "q8a_t1", subsectionId: "8a", difficulty: .easy, question: "All opioids cause constipation and respiratory depression.", answer: true, explanation: "These are universal opioid side effects. Tolerance does NOT develop to constipation."),
            .multipleChoice(id: "q8a_t2", subsectionId: "8a", difficulty: .easy, question: "The antidote for opioid overdose is:", options: ["Naloxone (Narcan)", "Flumazenil", "Atropine", "Epinephrine"], answer: "Naloxone (Narcan)", explanation: "Naloxone (Narcan) is a competitive opioid antagonist that reverses overdose."),
            .fillBlank(id: "q8a_t3", subsectionId: "8a", difficulty: .easy, question: "Fentanyl is approximately _____ times more potent than morphine.", options: ["80-100", "10", "5", "1000"], answer: "80-100", explanation: "Fentanyl is 80-100x more potent than morphine."),
            .trueFalse(id: "q8a_1", subsectionId: "8a", question: "All opioids cause constipation.", answer: true, explanation: "Constipation is a universal side effect of opioids (no tolerance develops)."),
            .multipleChoice(id: "q8a_2", subsectionId: "8a", question: "Fentanyl is approximately how much more potent than morphine?", options: ["80-100x", "10x", "5x", "500x"], answer: "80-100x", explanation: "Fentanyl is 80-100 times more potent than morphine."),
            .fillBlank(id: "q8a_3", subsectionId: "8a", question: "The opioid reversal agent is _____.", options: ["Naloxone", "Flumazenil", "Naltrexone", "Buprenorphine"], answer: "Naloxone", explanation: "Naloxone (Narcan) reverses opioid overdose."),
            .multipleChoice(id: "q8a_4", subsectionId: "8a", question: "Morphine should be avoided in which condition?", options: ["Renal failure", "Headache", "Mild pain", "Dental pain"], answer: "Renal failure", explanation: "Morphine's active metabolite (M6G) accumulates in renal failure."),
            .trueFalse(id: "q8a_5", subsectionId: "8a", question: "Tramadol can cause serotonin syndrome when combined with SSRIs.", answer: true, explanation: "Tramadol has SNRI activity and can cause serotonin syndrome with serotonergic drugs."),
            .multipleChoice(id: "q8a_6", subsectionId: "8a", question: "The brand name of naloxone nasal spray is:", options: ["Narcan", "Vivitrol", "Suboxone", "Ultram"], answer: "Narcan", explanation: "Naloxone nasal spray is sold as Narcan (now OTC)."),
            .fillBlank(id: "q8a_7", subsectionId: "8a", question: "The brand name of the fentanyl transdermal patch is _____.", options: ["Duragesic", "OxyContin", "MS Contin", "Norco"], answer: "Duragesic", explanation: "Fentanyl patch is sold as Duragesic."),
            .selectAll(id: "q8a_8", subsectionId: "8a", question: "Select ALL signs of opioid overdose:", options: ["Pinpoint pupils", "Respiratory depression", "CNS depression", "Dilated pupils"], correctAnswers: ["Pinpoint pupils", "Respiratory depression", "CNS depression"], explanation: "Opioid overdose triad: miosis, respiratory depression, CNS depression."),
            .matching(id: "q8a_9", subsectionId: "8a", question: "Match opioid to brand name:", pairs: [MatchingPair(left: "Morphine ER", right: "MS Contin"), MatchingPair(left: "Oxycodone ER", right: "OxyContin"), MatchingPair(left: "Fentanyl patch", right: "Duragesic"), MatchingPair(left: "Tramadol", right: "Ultram")], explanation: "Key opioid brand-generic pairs."),
            .multipleChoice(id: "q8a_10", subsectionId: "8a", question: "Why might naloxone need repeated doses?", options: ["Its half-life is shorter than most opioids", "It only works once", "It is poorly absorbed", "Opioids have no half-life"], answer: "Its half-life is shorter than most opioids", explanation: "Naloxone's short duration means opioid effects can return."),
            .trueFalse(id: "q8a_11", subsectionId: "8a", difficulty: .medium, question: "Tramadol lowers the seizure threshold.", answer: true, explanation: "Tramadol increases seizure risk, especially at high doses."),
            .multipleChoice(id: "q8a_12", subsectionId: "8a", question: "Hydrocodone/acetaminophen is sold as:", options: ["Norco", "Percocet", "OxyContin", "Ultram"], answer: "Norco", explanation: "Norco and Vicodin contain hydrocodone/acetaminophen."),
        ]

        bank["8b"] = [
            .trueFalse(id: "q8b_1", subsectionId: "8b", question: "NSAIDs have anti-inflammatory properties but acetaminophen does not.", answer: true, explanation: "Acetaminophen is an analgesic/antipyretic only; no anti-inflammatory effect."),
            .multipleChoice(id: "q8b_2", subsectionId: "8b", question: "Maximum daily dose of acetaminophen for healthy adults is:", options: ["4 grams", "2 grams", "6 grams", "8 grams"], answer: "4 grams", explanation: "Max 4g/day; reduce to 2g/day with liver disease."),
            .fillBlank(id: "q8b_3", subsectionId: "8b", question: "The antidote for acetaminophen overdose is _____.", options: ["N-acetylcysteine", "Naloxone", "Flumazenil", "Activated charcoal"], answer: "N-acetylcysteine", explanation: "NAC (N-acetylcysteine) replenishes glutathione to prevent hepatotoxicity."),
            .multipleChoice(id: "q8b_4", subsectionId: "8b", question: "Which NSAID has the lowest cardiovascular risk?", options: ["Naproxen", "Celecoxib", "Ibuprofen", "Diclofenac"], answer: "Naproxen", explanation: "Naproxen has the lowest CV risk among commonly used NSAIDs."),
            .trueFalse(id: "q8b_5", subsectionId: "8b", question: "Celecoxib is a COX-2 selective NSAID with less GI bleeding risk.", answer: true, explanation: "COX-2 selectivity reduces GI prostaglandin inhibition."),
            .multipleChoice(id: "q8b_6", subsectionId: "8b", question: "Ketorolac (Toradol) should be limited to:", options: ["5 days", "14 days", "30 days", "No limit"], answer: "5 days", explanation: "Ketorolac is limited to 5 days due to high GI and renal risk."),
            .fillBlank(id: "q8b_7", subsectionId: "8b", question: "The brand name of celecoxib is _____.", options: ["Celebrex", "Advil", "Aleve", "Toradol"], answer: "Celebrex", explanation: "Celecoxib is sold as Celebrex."),
            .selectAll(id: "q8b_8", subsectionId: "8b", question: "Select ALL risks of NSAID use:", options: ["GI bleeding", "Renal impairment", "Cardiovascular events", "Hepatotoxicity"], correctAnswers: ["GI bleeding", "Renal impairment", "Cardiovascular events"], explanation: "Hepatotoxicity is primarily an acetaminophen concern."),
            .matching(id: "q8b_9", subsectionId: "8b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Ibuprofen", right: "Advil/Motrin"), MatchingPair(left: "Naproxen", right: "Aleve"), MatchingPair(left: "Celecoxib", right: "Celebrex"), MatchingPair(left: "Colchicine", right: "Colcrys")], explanation: "Key analgesic/anti-inflammatory brand names."),
            .multipleChoice(id: "q8b_10", subsectionId: "8b", question: "Colchicine is first-line for:", options: ["Acute gout flares", "Osteoarthritis", "Rheumatoid arthritis", "Back pain"], answer: "Acute gout flares", explanation: "Colchicine is first-line for acute gout; also used for pericarditis."),
            .trueFalse(id: "q8b_11", subsectionId: "8b", difficulty: .medium, question: "Acetaminophen is safe during pregnancy.", answer: true, explanation: "Acetaminophen is considered the safest analgesic in pregnancy."),
        ]

        bank["8c"] = [
            .multipleChoice(id: "q8c_1", subsectionId: "8c", question: "The brand name of cyclobenzaprine is:", options: ["Flexeril", "Robaxin", "Lioresal", "Neurontin"], answer: "Flexeril", explanation: "Cyclobenzaprine is sold as Flexeril."),
            .trueFalse(id: "q8c_2", subsectionId: "8c", question: "Baclofen can be stopped abruptly without risk.", answer: false, explanation: "Abrupt baclofen discontinuation can cause withdrawal seizures."),
            .multipleChoice(id: "q8c_3", subsectionId: "8c", question: "Gabapentin is first-line for:", options: ["Neuropathic pain", "Acute surgical pain", "Migraine headache", "Muscle spasm"], answer: "Neuropathic pain", explanation: "Gabapentinoids are first-line agents for neuropathic pain."),
            .fillBlank(id: "q8c_4", subsectionId: "8c", question: "The brand name of pregabalin is _____.", options: ["Lyrica", "Neurontin", "Flexeril", "Robaxin"], answer: "Lyrica", explanation: "Pregabalin is sold as Lyrica."),
            .trueFalse(id: "q8c_5", subsectionId: "8c", question: "Pregabalin is a Schedule V controlled substance.", answer: true, explanation: "Pregabalin has recognized abuse potential and is Schedule V."),
            .multipleChoice(id: "q8c_6", subsectionId: "8c", question: "Which muscle relaxant is preferred for spasticity in MS?", options: ["Baclofen", "Cyclobenzaprine", "Methocarbamol", "Carisoprodol"], answer: "Baclofen", explanation: "Baclofen (GABA-B agonist) is preferred for spasticity from MS or spinal cord injury."),
            .fillBlank(id: "q8c_7", subsectionId: "8c", question: "The brand name of gabapentin is _____.", options: ["Neurontin", "Lyrica", "Flexeril", "Lioresal"], answer: "Neurontin", explanation: "Gabapentin is sold as Neurontin."),
            .selectAll(id: "q8c_8", subsectionId: "8c", question: "Select ALL gabapentinoid side effects:", options: ["Sedation", "Dizziness", "Weight gain", "Dry cough"], correctAnswers: ["Sedation", "Dizziness", "Weight gain"], explanation: "Dry cough is an ACE inhibitor side effect, not gabapentinoid."),
            .matching(id: "q8c_9", subsectionId: "8c", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Cyclobenzaprine", right: "Flexeril"), MatchingPair(left: "Baclofen", right: "Lioresal"), MatchingPair(left: "Gabapentin", right: "Neurontin"), MatchingPair(left: "Pregabalin", right: "Lyrica")], explanation: "Key muscle relaxant and neuropathic pain drug brand names."),
            .multipleChoice(id: "q8c_10", subsectionId: "8c", difficulty: .medium, question: "Cyclobenzaprine should be avoided in elderly patients because:", options: ["Anticholinergic effects", "Renal toxicity", "QT prolongation", "Hepatotoxicity"], answer: "Anticholinergic effects", explanation: "Cyclobenzaprine is structurally similar to TCAs with anticholinergic burden."),
        ]

        bank["8d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("8") && key != "8d" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["9a"] = [
            .trueFalse(id: "q9a_t1", subsectionId: "9a", difficulty: .easy, question: "Prednisone is a corticosteroid that must be tapered slowly if used for more than 2 weeks.", answer: true, explanation: "Abrupt discontinuation after prolonged use can cause adrenal crisis."),
            .multipleChoice(id: "q9a_t2", subsectionId: "9a", difficulty: .easy, question: "Methotrexate (Trexall) for rheumatoid arthritis is given:", options: ["Once weekly", "Once daily", "Twice daily", "Once monthly"], answer: "Once weekly", explanation: "MTX for RA is WEEKLY dosing. Daily dosing is a dangerous medication error."),
            .fillBlank(id: "q9a_t3", subsectionId: "9a", difficulty: .easy, question: "Folic acid is given with methotrexate to reduce _____.", options: ["Side effects", "Absorption", "Potency", "Cost"], answer: "Side effects", explanation: "Folic acid supplementation reduces MTX-related mucositis and cytopenias."),
            .trueFalse(id: "q9a_1", subsectionId: "9a", question: "Corticosteroids should be tapered if used for more than 2 weeks.", answer: true, explanation: "Abrupt discontinuation after prolonged use can cause adrenal crisis."),
            .multipleChoice(id: "q9a_2", subsectionId: "9a", question: "Which corticosteroid is the most potent?", options: ["Dexamethasone", "Prednisone", "Hydrocortisone", "Methylprednisolone"], answer: "Dexamethasone", explanation: "Dexamethasone is the most potent corticosteroid with the longest half-life."),
            .fillBlank(id: "q9a_3", subsectionId: "9a", question: "The brand name of prednisone is _____.", options: ["Deltasone", "Medrol", "Decadron", "Cortef"], answer: "Deltasone", explanation: "Prednisone is sold as Deltasone."),
            .multipleChoice(id: "q9a_4", subsectionId: "9a", question: "Methotrexate for RA is dosed:", options: ["Weekly", "Daily", "Twice daily", "Monthly"], answer: "Weekly", explanation: "MTX for RA is given WEEKLY. Daily dosing is a dangerous error."),
            .trueFalse(id: "q9a_5", subsectionId: "9a", question: "Folic acid is given with methotrexate to reduce side effects.", answer: true, explanation: "Folic acid supplementation reduces MTX-related mucositis and cytopenias."),
            .multipleChoice(id: "q9a_6", subsectionId: "9a", question: "Hydroxychloroquine requires monitoring of:", options: ["Eyes (retinal toxicity)", "Kidneys", "Liver only", "Blood glucose"], answer: "Eyes (retinal toxicity)", explanation: "Annual eye exams are required to screen for retinal toxicity."),
            .fillBlank(id: "q9a_7", subsectionId: "9a", question: "The brand name of adalimumab is _____.", options: ["Humira", "Enbrel", "Remicade", "Plaquenil"], answer: "Humira", explanation: "Adalimumab is sold as Humira."),
            .selectAll(id: "q9a_8", subsectionId: "9a", question: "Select ALL anti-TNF biologics:", options: ["Adalimumab", "Etanercept", "Infliximab", "Methotrexate"], correctAnswers: ["Adalimumab", "Etanercept", "Infliximab"], explanation: "Methotrexate is a DMARD, not a biologic anti-TNF agent."),
            .matching(id: "q9a_9", subsectionId: "9a", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Prednisone", right: "Deltasone"), MatchingPair(left: "Methotrexate", right: "Trexall"), MatchingPair(left: "Adalimumab", right: "Humira"), MatchingPair(left: "Hydroxychloroquine", right: "Plaquenil")], explanation: "Key immunology drug brand-generic pairs."),
            .multipleChoice(id: "q9a_10", subsectionId: "9a", question: "Before starting anti-TNF therapy, you must screen for:", options: ["Tuberculosis", "Diabetes", "Hypothyroidism", "Anemia"], answer: "Tuberculosis", explanation: "Anti-TNF agents can reactivate latent TB."),
            .trueFalse(id: "q9a_11", subsectionId: "9a", difficulty: .medium, question: "Dexamethasone has significant mineralocorticoid activity.", answer: false, explanation: "Dexamethasone has virtually no mineralocorticoid activity."),
        ]

        bank["9b"] = [
            .fillBlank(id: "q9b_1", subsectionId: "9b", question: "Bisphosphonates end in _____.", options: ["-dronate", "-statin", "-pril", "-olol"], answer: "-dronate", explanation: "The -dronate suffix identifies bisphosphonates."),
            .trueFalse(id: "q9b_2", subsectionId: "9b", question: "Patients must stay upright for 30 minutes after taking oral bisphosphonates.", answer: true, explanation: "This prevents esophageal irritation and ulceration."),
            .multipleChoice(id: "q9b_3", subsectionId: "9b", question: "The brand name of alendronate is:", options: ["Fosamax", "Actonel", "Reclast", "Prolia"], answer: "Fosamax", explanation: "Alendronate is sold as Fosamax."),
            .multipleChoice(id: "q9b_4", subsectionId: "9b", question: "Denosumab (Prolia) is administered:", options: ["SubQ every 6 months", "Oral daily", "IV yearly", "IM monthly"], answer: "SubQ every 6 months", explanation: "Prolia is a subcutaneous injection given every 6 months."),
            .trueFalse(id: "q9b_5", subsectionId: "9b", question: "Allopurinol should be started during an acute gout flare.", answer: false, explanation: "Starting allopurinol during acute gout can worsen the flare."),
            .multipleChoice(id: "q9b_6", subsectionId: "9b", question: "Which genetic test should be done before starting allopurinol in high-risk populations?", options: ["HLA-B*5801", "CYP2C19", "TPMT", "HLA-B*1502"], answer: "HLA-B*5801", explanation: "HLA-B*5801 testing reduces risk of severe hypersensitivity reactions."),
            .fillBlank(id: "q9b_7", subsectionId: "9b", question: "The brand name of allopurinol is _____.", options: ["Zyloprim", "Uloric", "Colcrys", "Fosamax"], answer: "Zyloprim", explanation: "Allopurinol is sold as Zyloprim."),
            .selectAll(id: "q9b_8", subsectionId: "9b", question: "Select ALL bisphosphonates:", options: ["Alendronate", "Risedronate", "Zoledronic acid", "Denosumab"], correctAnswers: ["Alendronate", "Risedronate", "Zoledronic acid"], explanation: "Denosumab is a RANK-L inhibitor, not a bisphosphonate."),
            .matching(id: "q9b_9", subsectionId: "9b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Alendronate", right: "Fosamax"), MatchingPair(left: "Denosumab", right: "Prolia"), MatchingPair(left: "Allopurinol", right: "Zyloprim"), MatchingPair(left: "Teriparatide", right: "Forteo")], explanation: "Key bone and gout drug brand names."),
            .multipleChoice(id: "q9b_10", subsectionId: "9b", difficulty: .hard, question: "Teriparatide (Forteo) is limited to how many years of use?", options: ["2 years", "5 years", "10 years", "No limit"], answer: "2 years", explanation: "Teriparatide is limited to 2 years due to osteosarcoma risk in animal studies."),
        ]

        bank["9c"] = [
            .trueFalse(id: "q9c_1", subsectionId: "9c", question: "Both tacrolimus and cyclosporine can cause nephrotoxicity.", answer: true, explanation: "Nephrotoxicity is the dose-limiting side effect of both calcineurin inhibitors."),
            .multipleChoice(id: "q9c_2", subsectionId: "9c", question: "The brand name of tacrolimus is:", options: ["Prograf", "Neoral", "CellCept", "Imuran"], answer: "Prograf", explanation: "Tacrolimus is sold as Prograf."),
            .fillBlank(id: "q9c_3", subsectionId: "9c", question: "The brand name of mycophenolate mofetil is _____.", options: ["CellCept", "Prograf", "Imuran", "Neoral"], answer: "CellCept", explanation: "Mycophenolate mofetil is sold as CellCept."),
            .multipleChoice(id: "q9c_4", subsectionId: "9c", question: "Before starting azathioprine, you should check:", options: ["TPMT levels", "CYP2C19", "HLA-B*5801", "INR"], answer: "TPMT levels", explanation: "Low TPMT activity increases risk of severe myelosuppression."),
            .trueFalse(id: "q9c_5", subsectionId: "9c", question: "Azathioprine can be safely combined with allopurinol.", answer: false, explanation: "Allopurinol inhibits azathioprine metabolism, causing dangerous toxicity."),
            .multipleChoice(id: "q9c_6", subsectionId: "9c", question: "Cyclosporine uniquely causes:", options: ["Gingival hyperplasia and hirsutism", "Diabetes", "Pulmonary fibrosis", "Retinal toxicity"], answer: "Gingival hyperplasia and hirsutism", explanation: "Gingival hyperplasia and hirsutism are distinctive cyclosporine side effects."),
            .selectAll(id: "q9c_7", subsectionId: "9c", question: "Select ALL calcineurin inhibitors:", options: ["Tacrolimus", "Cyclosporine", "Mycophenolate", "Azathioprine"], correctAnswers: ["Tacrolimus", "Cyclosporine"], explanation: "Mycophenolate and azathioprine are antimetabolites."),
            .matching(id: "q9c_8", subsectionId: "9c", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Tacrolimus", right: "Prograf"), MatchingPair(left: "Cyclosporine", right: "Neoral"), MatchingPair(left: "Mycophenolate", right: "CellCept"), MatchingPair(left: "Azathioprine", right: "Imuran")], explanation: "Key immunosuppressant brand-generic pairs."),
            .fillBlank(id: "q9c_9", subsectionId: "9c", question: "The brand name of azathioprine is _____.", options: ["Imuran", "CellCept", "Prograf", "Neoral"], answer: "Imuran", explanation: "Azathioprine is sold as Imuran."),
            .trueFalse(id: "q9c_10", subsectionId: "9c", difficulty: .medium, question: "Mycophenolate (CellCept) has a REMS for pregnancy prevention.", answer: true, explanation: "CellCept is teratogenic and requires a REMS program."),
        ]

        bank["9d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("9") && key != "9d" {
                mastery.append(contentsOf: questions.prefix(6))
            }
            return mastery
        }()

        bank["10a"] = [
            .trueFalse(id: "q10a_t1", subsectionId: "10a", difficulty: .easy, question: "Combined oral contraceptives contain estrogen and progestin.", answer: true, explanation: "COCs combine estrogen (ethinyl estradiol) with a progestin for contraception."),
            .multipleChoice(id: "q10a_t2", subsectionId: "10a", difficulty: .easy, question: "The Mirena IUD releases which hormone?", options: ["Levonorgestrel (progestin)", "Estrogen", "Testosterone", "Progesterone only"], answer: "Levonorgestrel (progestin)", explanation: "Mirena is a levonorgestrel-releasing IUD, the most effective reversible contraception."),
            .trueFalse(id: "q10a_1", subsectionId: "10a", question: "Combined oral contraceptives are contraindicated in women >35 who smoke.", answer: true, explanation: "Estrogen increases VTE risk, compounded by smoking and age >35."),
            .multipleChoice(id: "q10a_2", subsectionId: "10a", question: "Which contraceptive is the most effective reversible method?", options: ["IUD (Mirena)", "Oral pill", "Depo-Provera", "Condom"], answer: "IUD (Mirena)", explanation: "IUDs have the highest efficacy among reversible contraceptives."),
            .fillBlank(id: "q10a_3", subsectionId: "10a", question: "The brand name of levonorgestrel IUD is _____.", options: ["Mirena", "Depo-Provera", "Ortho Tri-Cyclen", "Evista"], answer: "Mirena", explanation: "The levonorgestrel IUD is sold as Mirena."),
            .multipleChoice(id: "q10a_4", subsectionId: "10a", question: "When prescribing estrogen HRT to a woman with a uterus, you must also give:", options: ["Progestin", "Testosterone", "Thyroid hormone", "Vitamin D"], answer: "Progestin", explanation: "Unopposed estrogen increases endometrial cancer risk; progestin protects."),
            .trueFalse(id: "q10a_5", subsectionId: "10a", question: "Raloxifene (Evista) helps treat hot flashes.", answer: false, explanation: "Raloxifene may actually worsen hot flashes. It's used for osteoporosis/breast cancer risk."),
            .multipleChoice(id: "q10a_6", subsectionId: "10a", question: "Depo-Provera is given:", options: ["IM every 3 months", "Daily oral", "Weekly injection", "Yearly implant"], answer: "IM every 3 months", explanation: "Depo-Provera is an IM injection given every 3 months."),
            .selectAll(id: "q10a_7", subsectionId: "10a", question: "Select ALL risks of combined oral contraceptives:", options: ["VTE", "Stroke", "Breast cancer", "Osteoporosis"], correctAnswers: ["VTE", "Stroke", "Breast cancer"], explanation: "COCs do not cause osteoporosis; they may be protective."),
            .matching(id: "q10a_8", subsectionId: "10a", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Conjugated estrogens", right: "Premarin"), MatchingPair(left: "Raloxifene", right: "Evista"), MatchingPair(left: "Levonorgestrel IUD", right: "Mirena"), MatchingPair(left: "Depot medroxyprogesterone", right: "Depo-Provera")], explanation: "Key reproductive drug brand names."),
            .fillBlank(id: "q10a_9", subsectionId: "10a", question: "The brand name of raloxifene is _____.", options: ["Evista", "Premarin", "Mirena", "Fosamax"], answer: "Evista", explanation: "Raloxifene is sold as Evista."),
            .multipleChoice(id: "q10a_10", subsectionId: "10a", difficulty: .medium, question: "Which progestin-only method is safe during breastfeeding?", options: ["Norethindrone (Micronor)", "Ortho Tri-Cyclen", "Premarin", "Raloxifene"], answer: "Norethindrone (Micronor)", explanation: "Progestin-only pills are safe during breastfeeding."),
        ]

        bank["10b"] = [
            .fillBlank(id: "q10b_t1", subsectionId: "10b", difficulty: .easy, question: "Alpha-1 blockers for BPH like tamsulosin (Flomax) end in _____.", options: ["-osin", "-olol", "-pril", "-statin"], answer: "-osin", explanation: "The -osin suffix identifies alpha-1 blockers used for BPH."),
            .trueFalse(id: "q10b_t2", subsectionId: "10b", difficulty: .easy, question: "PDE-5 inhibitors like sildenafil (Viagra) should NEVER be combined with nitrates.", answer: true, explanation: "Combining PDE-5 inhibitors with nitrates causes severe, life-threatening hypotension."),
            .multipleChoice(id: "q10b_t3", subsectionId: "10b", difficulty: .easy, question: "5-alpha reductase inhibitors like finasteride (Proscar) end in:", options: ["-steride", "-osin", "-afil", "-olol"], answer: "-steride", explanation: "The -steride suffix identifies 5-alpha reductase inhibitors."),
            .fillBlank(id: "q10b_1", subsectionId: "10b", question: "Alpha-1 blockers for BPH end in _____.", options: ["-osin", "-olol", "-pril", "-statin"], answer: "-osin", explanation: "Alpha-1 blockers like tamsulosin end in -osin."),
            .multipleChoice(id: "q10b_2", subsectionId: "10b", question: "The brand name of tamsulosin is:", options: ["Flomax", "Proscar", "Avodart", "Ditropan"], answer: "Flomax", explanation: "Tamsulosin is sold as Flomax."),
            .trueFalse(id: "q10b_3", subsectionId: "10b", question: "PDE-5 inhibitors can be safely combined with nitrates.", answer: false, explanation: "NEVER combine PDE-5 inhibitors with nitrates - causes severe hypotension."),
            .multipleChoice(id: "q10b_4", subsectionId: "10b", question: "5-alpha reductase inhibitors take how long to work?", options: ["6-12 months", "1-2 days", "1-2 weeks", "24 hours"], answer: "6-12 months", explanation: "5-ARIs shrink the prostate gradually over 6-12 months."),
            .multipleChoice(id: "q10b_5", subsectionId: "10b", question: "The brand name of sildenafil is:", options: ["Viagra", "Cialis", "Flomax", "Myrbetriq"], answer: "Viagra", explanation: "Sildenafil is sold as Viagra."),
            .trueFalse(id: "q10b_6", subsectionId: "10b", question: "Oxybutynin should be avoided in elderly patients due to anticholinergic effects.", answer: true, explanation: "Anticholinergic burden in elderly causes confusion and falls."),
            .multipleChoice(id: "q10b_7", subsectionId: "10b", question: "Mirabegron (Myrbetriq) works as a:", options: ["Beta-3 agonist", "Alpha-1 blocker", "Anticholinergic", "PDE-5 inhibitor"], answer: "Beta-3 agonist", explanation: "Mirabegron is a beta-3 adrenergic agonist for overactive bladder."),
            .fillBlank(id: "q10b_8", subsectionId: "10b", question: "The brand name of finasteride is _____.", options: ["Proscar", "Flomax", "Avodart", "Viagra"], answer: "Proscar", explanation: "Finasteride is sold as Proscar (BPH) or Propecia (hair loss)."),
            .selectAll(id: "q10b_9", subsectionId: "10b", question: "Select ALL PDE-5 inhibitors:", options: ["Sildenafil", "Tadalafil", "Tamsulosin", "Finasteride"], correctAnswers: ["Sildenafil", "Tadalafil"], explanation: "Tamsulosin is an alpha blocker; finasteride is a 5-ARI."),
            .matching(id: "q10b_10", subsectionId: "10b", question: "Match drug to brand name:", pairs: [MatchingPair(left: "Tamsulosin", right: "Flomax"), MatchingPair(left: "Finasteride", right: "Proscar"), MatchingPair(left: "Sildenafil", right: "Viagra"), MatchingPair(left: "Tadalafil", right: "Cialis")], explanation: "Key urology drug brand names."),
            .multipleChoice(id: "q10b_11", subsectionId: "10b", difficulty: .medium, question: "Which PDE-5 inhibitor has the longest duration of action?", options: ["Tadalafil", "Sildenafil", "Vardenafil", "Avanafil"], answer: "Tadalafil", explanation: "Tadalafil (Cialis) lasts up to 36 hours."),
        ]

        bank["10c"] = [
            .multipleChoice(id: "q10c_1", subsectionId: "10c", question: "The first-line treatment for anaphylaxis is:", options: ["Epinephrine IM", "Diphenhydramine IV", "Methylprednisolone IV", "Albuterol nebulizer"], answer: "Epinephrine IM", explanation: "Epinephrine IM in the thigh is always first-line for anaphylaxis."),
            .fillBlank(id: "q10c_2", subsectionId: "10c", question: "The brand name of the epinephrine autoinjector is _____.", options: ["EpiPen", "AtroPen", "Narcan", "Romazicon"], answer: "EpiPen", explanation: "Epinephrine autoinjector is sold as EpiPen."),
            .trueFalse(id: "q10c_3", subsectionId: "10c", question: "Iron supplements should be taken with vitamin C to enhance absorption.", answer: true, explanation: "Vitamin C converts ferric iron to ferrous form, improving absorption."),
            .multipleChoice(id: "q10c_4", subsectionId: "10c", question: "Atropine is first-line for:", options: ["Symptomatic bradycardia", "Tachycardia", "Hypertension", "Seizures"], answer: "Symptomatic bradycardia", explanation: "Atropine is first-line per ACLS for symptomatic bradycardia."),
            .trueFalse(id: "q10c_5", subsectionId: "10c", question: "Flumazenil can precipitate seizures in benzodiazepine-dependent patients.", answer: true, explanation: "Rapid benzo reversal in dependent patients can trigger seizures."),
            .multipleChoice(id: "q10c_6", subsectionId: "10c", question: "Iron supplements commonly cause:", options: ["Constipation and dark stools", "Diarrhea and light stools", "Hyperkalemia", "Hypercalcemia"], answer: "Constipation and dark stools", explanation: "Iron is notorious for causing constipation and black/dark stools."),
            .fillBlank(id: "q10c_7", subsectionId: "10c", question: "The brand name of flumazenil is _____.", options: ["Romazicon", "Narcan", "EpiPen", "AtroPen"], answer: "Romazicon", explanation: "Flumazenil is sold as Romazicon."),
            .selectAll(id: "q10c_8", subsectionId: "10c", question: "Select ALL emergency reversal agents:", options: ["Naloxone", "Flumazenil", "Epinephrine", "Metformin"], correctAnswers: ["Naloxone", "Flumazenil"], explanation: "Naloxone reverses opioids; flumazenil reverses benzos. Epinephrine treats anaphylaxis but isn't a reversal agent."),
            .matching(id: "q10c_9", subsectionId: "10c", question: "Match antidote to poisoning:", pairs: [MatchingPair(left: "Naloxone", right: "Opioid overdose"), MatchingPair(left: "Flumazenil", right: "Benzo overdose"), MatchingPair(left: "N-acetylcysteine", right: "APAP overdose"), MatchingPair(left: "Atropine", right: "Organophosphate")], explanation: "Key antidote-poisoning pairs."),
            .multipleChoice(id: "q10c_9b", subsectionId: "10c", question: "Vitamin D goal level is:", options: [">30 ng/mL", ">10 ng/mL", ">50 ng/mL", ">100 ng/mL"], answer: ">30 ng/mL", explanation: "Target 25-OH vitamin D level is >30 ng/mL."),
        ]

        bank["10d"] = {
            var mastery: [Question] = []
            for (key, questions) in bank where key.hasPrefix("10") && key != "10d" {
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
        let allQuestions = questions(for: subsectionId)
        let teachingQuestions = allQuestions.filter { $0.difficulty == .easy }.shuffled()
        let mediumQuestions = allQuestions.filter { $0.difficulty == .medium }.shuffled()
        let hardQuestions = allQuestions.filter { $0.difficulty == .hard || $0.difficulty == .expert }.shuffled()

        let teachingCount = min(teachingQuestions.count, max(3, count / 3))
        var quizQuestions = Array(teachingQuestions.prefix(teachingCount))
        let remaining = allQuestions.filter { q in !quizQuestions.contains(where: { $0.id == q.id }) }.shuffled()
        quizQuestions.append(contentsOf: remaining)

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
            let questionType = idx % 5
            switch questionType {
            case 0:
                let wrongOptions = availableDrugs.filter { $0.id != drug.id }.shuffled().prefix(3).map { $0.brandName }
                let allOptions = ([drug.brandName] + wrongOptions).shuffled()
                questions.append(.multipleChoice(
                    id: qId, subsectionId: "brand_blitz", difficulty: .easy,
                    question: "What is the brand name of \(drug.genericName)?",
                    options: allOptions, answer: drug.brandName,
                    explanation: "\(drug.genericName) is sold as \(drug.brandName)."
                ))
            case 1:
                let wrongOptions = availableDrugs.filter { $0.id != drug.id }.shuffled().prefix(3).map { $0.genericName }
                let allOptions = ([drug.genericName] + wrongOptions).shuffled()
                questions.append(.multipleChoice(
                    id: qId, subsectionId: "brand_blitz", difficulty: .easy,
                    question: "What is the generic name of \(drug.brandName)?",
                    options: allOptions, answer: drug.genericName,
                    explanation: "\(drug.brandName) is the brand name for \(drug.genericName)."
                ))
            case 2:
                let wrongOptions = availableDrugs.filter { $0.id != drug.id }.shuffled().prefix(3).map { $0.brandName }
                let allOptions = ([drug.brandName] + wrongOptions).shuffled()
                questions.append(.fillBlank(
                    id: qId, subsectionId: "brand_blitz", difficulty: .easy,
                    question: "The brand name of \(drug.genericName) is _____.",
                    options: allOptions, answer: drug.brandName,
                    explanation: "\(drug.genericName) is sold as \(drug.brandName)."
                ))
            case 3:
                let correctBrand = drug.brandName.components(separatedBy: "/").first ?? drug.brandName
                let isTrue = Bool.random()
                if isTrue {
                    questions.append(.trueFalse(
                        id: qId, subsectionId: "brand_blitz", difficulty: .easy,
                        question: "The brand name of \(drug.genericName) is \(correctBrand).",
                        answer: true,
                        explanation: "Correct! \(drug.genericName) is sold as \(drug.brandName)."
                    ))
                } else {
                    let wrongDrug = availableDrugs.filter { $0.id != drug.id }.randomElement()
                    let wrongBrand = wrongDrug?.brandName.components(separatedBy: "/").first ?? "Unknown"
                    questions.append(.trueFalse(
                        id: qId, subsectionId: "brand_blitz", difficulty: .easy,
                        question: "The brand name of \(drug.genericName) is \(wrongBrand).",
                        answer: false,
                        explanation: "\(drug.genericName) is actually sold as \(drug.brandName), not \(wrongBrand)."
                    ))
                }
            default:
                let matchDrugs = shuffledDrugs.filter { $0.id != drug.id }.prefix(3)
                var pairs = [MatchingPair(left: drug.genericName, right: drug.brandName)]
                for d in matchDrugs {
                    pairs.append(MatchingPair(left: d.genericName, right: d.brandName))
                }
                questions.append(.matching(
                    id: qId, subsectionId: "brand_blitz", difficulty: .easy,
                    question: "Match each generic name to its brand name:",
                    pairs: pairs,
                    explanation: "Brand-generic matching for key drugs."
                ))
            }
            if questions.count >= count { break }
        }
        return Array(questions.prefix(count)).shuffled()
    }
}
