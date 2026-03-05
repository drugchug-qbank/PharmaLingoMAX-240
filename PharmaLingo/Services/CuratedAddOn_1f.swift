// PharmaLingo — Mastering Cardiovascular I (Boss Review)
// Curated Add-On Question Pack (45 questions)
// IDs: q1f_add_001 ... q1f_add_045
//
// IMPORTANT SUBSECTION-ID NOTE
// - In the current codebase (PharmaLingoMAX-240-main), "Mastering Cardiovascular I (Boss)" is subsection "1g".
// - In the vNext course outline, this review set is labeled "1f".
// - This file targets a single subsection via `masteringCv1SubsectionId` below so you can switch IDs in one place.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) Patch DrugDataService.init to append these questions AFTER the mastery quiz is auto-built,
//    because the app currently overwrites bank[masteryId] for mastery quizzes.
//
//    In DrugDataService.init(), inside the loop:
//        for sub in mod.subsections where sub.isMasteryQuiz { ... }
//
//    After the line:
//        bank[sub.id] = mastery
//
//    append:
//        if sub.id == Self.masteringCv1SubsectionId { bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_1fMastery) }
//
// 3) If you renamed your mastery subsection to "1f", change masteringCv1SubsectionId below to "1f".
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Designed as review-only across 1a–1e/CCBs (RAAS blockers, diuretics, beta blockers, MRAs/ARNI, CCBs).
// - No clinical-trial questions.
//
// Generated on: 2026-03-05

import Foundation

extension DrugDataService {
    /// Default target for "Mastering Cardiovascular I (Boss)" in the current repo.
    /// Change to "1f" if/when your mastery subsection ID is 1f.
    static let masteringCv1SubsectionId: String = "1g"

    static let curatedAddOnQuestions_1fMastery: [Question] = [

        .multipleChoice(
            id: "q1f_add_001",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "You're doing a rapid brand<->generic check across common HTN/HF meds. Which pairing is correctly matched?",
            options: ["Chlorthalidone - Thalitone", "Amlodipine - Cardizem", "Propranolol - Tenormin", "Losartan - Diovan", "Spironolactone - Inspra"],
            answer: "Chlorthalidone - Thalitone",
            explanation: "Chlorthalidone is sold as Thalitone. Cardizem is diltiazem (not amlodipine), Tenormin is atenolol (not propranolol), Diovan is valsartan (not losartan), and Inspra is eplerenone (not spironolactone).",
            objective: .brandGeneric,
            relatedDrugIds: ["d10"],
            tags: ["Mastery", "brand-generic", "Diuretics"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_002",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A patient developed a persistent dry cough on an ACE inhibitor. You want similar blood-pressure and kidney benefits with far less bradykinin-related cough. Which class is the typical switch?",
            options: ["ACE inhibitor (-pril)", "ARB (-sartan)", "Loop diuretic", "DHP calcium channel blocker (-dipine)", "Beta blocker (-olol)"],
            answer: "ARB (-sartan)",
            explanation: "ACE inhibitors increase bradykinin (-> cough/angioedema). ARBs block the angiotensin II receptor without increasing bradykinin, so cough is much less common while RAAS benefits are preserved.",
            objective: .pearl,
            relatedDrugIds: ["d1", "d5"],
            tags: ["Mastery", "RAAS", "ACE vs ARB"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_003",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Among ARBs, one has a high-yield \"extra\" benefit: it can lower uric acid (uricosuric effect), which may help in patients with gout or hyperuricemia. Which ARB is this?",
            options: ["Losartan", "Valsartan", "Irbesartan", "Olmesartan", "Ramipril"],
            answer: "Losartan",
            explanation: "Losartan is the classic ARB with a uricosuric effect (lowers uric acid). This pearl can guide drug choice in hypertensive patients with gout.",
            objective: .pearl,
            relatedDrugIds: ["d5"],
            tags: ["Mastery", "ARB", "gout", "pearl"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_004",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A patient on a -sartan for hypertension develops chronic diarrhea and weight loss with a \"sprue-like enteropathy\" picture. Which ARB is classically associated with this rare adverse effect?",
            options: ["Olmesartan", "Losartan", "Valsartan", "Irbesartan", "Benazepril"],
            answer: "Olmesartan",
            explanation: "Olmesartan is uniquely associated with sprue-like enteropathy (chronic diarrhea, weight loss). Recognizing this association is high-yield for medication-related GI complaints.",
            objective: .adverseEffect,
            relatedDrugIds: ["d8"],
            tags: ["Mastery", "ARB", "GI", "adverse effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_005",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "A medication carries a boxed warning for fetal toxicity and should be avoided in pregnancy because it disrupts the fetal renin-angiotensin system. Which drug below fits that warning?",
            options: ["Valsartan", "Amlodipine", "Metoprolol succinate", "Chlorthalidone", "Diltiazem"],
            answer: "Valsartan",
            explanation: "ACE inhibitors, ARBs (including valsartan), and ARNIs are contraindicated in pregnancy due to fetal renal toxicity (boxed warning).",
            objective: .contraindication,
            relatedDrugIds: ["d6"],
            tags: ["Mastery", "pregnancy", "ARB", "black box"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_006",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "After starting or up-titrating RAAS-blocking therapy (ACEi/ARB/ARNI/MRA), what is the most important lab set to re-check early because it can change quickly?",
            options: ["Serum potassium and serum creatinine", "AST/ALT and bilirubin", "INR and aPTT", "TSH and free T4", "Hemoglobin A1c and fasting lipid panel"],
            answer: "Serum potassium and serum creatinine",
            explanation: "RAAS blockade can raise potassium (hyperkalemia) and worsen renal function (↑ creatinine), especially after initiation or dose changes-so BMP monitoring is high-yield.",
            objective: .monitoring,
            relatedDrugIds: ["d1", "d5", "d20", "d22"],
            tags: ["Mastery", "monitoring", "RAAS", "BMP"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_007",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "ACE inhibitors lower angiotensin II and also increase bradykinin. Which enzyme action is directly blocked by ACE inhibitors like lisinopril?",
            options: ["Conversion of angiotensin I to angiotensin II", "Blockade of the angiotensin II (AT1) receptor", "Inhibition of the Na+/K+/2Cl- cotransporter in the loop of Henle", "Inhibition of the Na+/Cl- cotransporter in the distal convoluted tubule", "Blockade of L-type calcium channels in vascular smooth muscle"],
            answer: "Conversion of angiotensin I to angiotensin II",
            explanation: "ACE inhibitors block ACE, preventing angiotensin I -> angiotensin II conversion and decreasing aldosterone signaling; bradykinin breakdown is also reduced.",
            objective: .moa,
            relatedDrugIds: ["d1"],
            tags: ["Mastery", "ACE inhibitor", "mechanism"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_008",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A rare but dangerous adverse effect linked to increased bradykinin can occur with ACE inhibitors and requires immediate drug discontinuation. Which adverse effect is being described?",
            options: ["Angioedema", "Ototoxicity", "Constipation", "Reflex tachycardia", "Hypercalcemia"],
            answer: "Angioedema",
            explanation: "ACE inhibitors can cause bradykinin-mediated angioedema (lip/tongue swelling). It is uncommon but potentially life-threatening and requires stopping the drug.",
            objective: .adverseEffect,
            relatedDrugIds: ["d1", "d2", "d3", "d4"],
            tags: ["Mastery", "ACE inhibitor", "adverse effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_009",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "One ACE inhibitor in this module is commonly remembered for cardiovascular risk reduction in high-risk patients in addition to treating hypertension. Which drug is it?",
            options: ["Ramipril", "Benazepril", "Enalapril", "Irbesartan", "Amlodipine"],
            answer: "Ramipril",
            explanation: "Ramipril is a classic ACE inhibitor associated with cardiovascular risk reduction in high-risk patients, in addition to standard ACE inhibitor indications like hypertension and heart failure.",
            objective: .pearl,
            relatedDrugIds: ["d3"],
            tags: ["Mastery", "ACE inhibitor", "CV risk reduction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_010",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Lotrel is a fixed-dose combo that pairs a dihydropyridine CCB with an ACE inhibitor for hypertension. Which ACE inhibitor is in Lotrel with amlodipine?",
            options: ["Benazepril", "Lisinopril", "Ramipril", "Losartan", "Valsartan"],
            answer: "Benazepril",
            explanation: "Lotrel = amlodipine + benazepril. Combo pearls help you recognize multi-drug products and avoid duplicate therapy within the same pathway.",
            objective: .pearl,
            relatedDrugIds: ["d4", "d23"],
            tags: ["Mastery", "combo products", "ACE inhibitor", "CCB"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_011",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Thiazide diuretics are first-line for hypertension and work primarily in the distal convoluted tubule. Which transporter do thiazides like hydrochlorothiazide block?",
            options: ["Na+/Cl- cotransporter (DCT)", "Na+/K+/2Cl- cotransporter (TAL)", "Epithelial Na+ channel (collecting duct)", "Na+/H+ exchanger (proximal tubule)", "Aldosterone receptor (collecting duct)"],
            answer: "Na+/Cl- cotransporter (DCT)",
            explanation: "Thiazides block the Na+/Cl- cotransporter in the distal convoluted tubule, increasing sodium excretion and lowering blood pressure.",
            objective: .moa,
            relatedDrugIds: ["d9"],
            tags: ["Mastery", "Thiazide", "mechanism"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_012",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Loop diuretics are the most potent diuretics and act in the thick ascending limb of the loop of Henle. Which transporter is inhibited by furosemide?",
            options: ["Na+/K+/2Cl- cotransporter (TAL)", "Na+/Cl- cotransporter (DCT)", "Carbonic anhydrase (proximal tubule)", "Aldosterone receptor (collecting duct)", "Epithelial Na+ channel (collecting duct)"],
            answer: "Na+/K+/2Cl- cotransporter (TAL)",
            explanation: "Furosemide blocks NKCC2 in the thick ascending limb, producing powerful natriuresis and diuresis.",
            objective: .moa,
            relatedDrugIds: ["d11"],
            tags: ["Mastery", "Loop diuretic", "mechanism"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_013",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A patient with recurrent calcium-containing kidney stones may benefit from a diuretic that increases calcium reabsorption in the distal tubule. Which option below best matches that effect?",
            options: ["Chlorthalidone", "Furosemide", "Bumetanide", "Torsemide", "Spironolactone"],
            answer: "Chlorthalidone",
            explanation: "Thiazide(-like) diuretics increase calcium reabsorption and can reduce urinary calcium-helpful in patients with recurrent calcium stones. Chlorthalidone is a long-acting thiazide-like option.",
            objective: .pearl,
            relatedDrugIds: ["d10"],
            tags: ["Mastery", "Thiazide", "calcium", "pearl"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_014",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Which adverse-effect pattern best matches loop diuretics like furosemide due to disrupted ion handling in the thick ascending limb?",
            options: ["Hypokalemia + hypocalcemia", "Hypokalemia + hypercalcemia", "Hyperkalemia + hyponatremia", "Hypercalcemia + metabolic acidosis", "Hypermagnesemia + hypernatremia"],
            answer: "Hypokalemia + hypocalcemia",
            explanation: "Loop diuretics waste potassium and calcium (and often magnesium). Thiazides do the opposite for calcium (tend toward hypercalcemia).",
            objective: .adverseEffect,
            relatedDrugIds: ["d11"],
            tags: ["Mastery", "Loop diuretic", "electrolytes"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_015",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A classic memory aid for thiazides is \"HyperGLUC\" (glucose, lipids, uric acid, calcium go up). Which thiazide is most associated with this metabolic pattern when used for hypertension?",
            options: ["Hydrochlorothiazide", "Furosemide", "Bumetanide", "Spironolactone", "Amlodipine"],
            answer: "Hydrochlorothiazide",
            explanation: "Hydrochlorothiazide (a thiazide) is classically linked to HyperGLUC: ↑ glucose, ↑ lipids, ↑ uric acid, ↑ calcium, along with hypokalemia and hyponatremia.",
            objective: .adverseEffect,
            relatedDrugIds: ["d9"],
            tags: ["Mastery", "Thiazide", "HyperGLUC"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_016",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "Hydrochlorothiazide and chlorthalidone are both used for hypertension. Which one is longer-acting and often preferred for steadier 24-hour BP control?",
            options: ["Chlorthalidone", "Hydrochlorothiazide", "Furosemide", "Torsemide", "Nifedipine"],
            answer: "Chlorthalidone",
            explanation: "Chlorthalidone has a longer half-life than HCTZ, providing more consistent BP lowering over 24 hours and is often guideline-preferred.",
            objective: .pearl,
            relatedDrugIds: ["d10", "d9"],
            tags: ["Mastery", "Thiazide-like", "half-life"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_017",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .hard,
            question: "You need a loop diuretic that is very potent mg-for-mg (so tiny tablet doses correspond to large furosemide doses). Which loop diuretic is about 40x as potent as furosemide?",
            options: ["Bumetanide", "Torsemide", "Furosemide", "Chlorthalidone", "Hydrochlorothiazide"],
            answer: "Bumetanide",
            explanation: "Bumetanide is ~40x as potent as furosemide on a mg-per-mg basis (classic conversion pearl).",
            objective: .dosing,
            relatedDrugIds: ["d12"],
            tags: ["Mastery", "Loop diuretic", "potency", "dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_018",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Among common loop diuretics, which one is known for the best oral bioavailability and is often favored when gut edema may limit absorption of other loops?",
            options: ["Torsemide", "Furosemide", "Bumetanide", "Chlorthalidone", "Spironolactone"],
            answer: "Torsemide",
            explanation: "Torsemide is the loop diuretic with the best oral bioavailability, which can be helpful when intestinal edema makes oral furosemide less predictable.",
            objective: .pearl,
            relatedDrugIds: ["d13"],
            tags: ["Mastery", "Loop diuretic", "bioavailability"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_019",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "For acute pulmonary edema in decompensated heart failure, clinicians often reach for an IV loop diuretic for rapid decongestion. Which drug below is a classic choice?",
            options: ["Furosemide", "Hydrochlorothiazide", "Chlorthalidone", "Spironolactone", "Amlodipine"],
            answer: "Furosemide",
            explanation: "IV furosemide is a classic first-line loop diuretic for acute pulmonary edema and volume overload in acute decompensated heart failure.",
            objective: .indication,
            relatedDrugIds: ["d11"],
            tags: ["Mastery", "HF", "loop diuretic", "acute"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_020",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "Beta blockers lower blood pressure in part by reducing renin release from the kidney (via beta-1 blockade on juxtaglomerular cells). Which medication below is a beta blocker?",
            options: ["Metoprolol succinate", "Losartan", "Amlodipine", "Furosemide", "Spironolactone"],
            answer: "Metoprolol succinate",
            explanation: "Metoprolol succinate is a beta-1 selective beta blocker. Beta blockers reduce heart rate/contractility and decrease renin release, helping lower blood pressure.",
            objective: .classId,
            relatedDrugIds: ["d14"],
            tags: ["Mastery", "beta blocker", "class ID"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_021",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Metoprolol comes in two common salt forms. Which formulation is extended-release and used as a guideline-directed beta blocker for chronic HFrEF?",
            options: ["Metoprolol succinate (Toprol XL)", "Metoprolol tartrate (Lopressor)", "Propranolol (Inderal)", "Atenolol (Tenormin)", "Diltiazem (Cardizem)"],
            answer: "Metoprolol succinate (Toprol XL)",
            explanation: "Metoprolol succinate is the extended-release formulation with proven mortality benefit in chronic HFrEF (along with carvedilol and bisoprolol).",
            objective: .pearl,
            relatedDrugIds: ["d14", "d15"],
            tags: ["Mastery", "HFrEF", "beta blocker", "formulations"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_022",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A clinician wants the immediate-release form of metoprolol that is often dosed twice daily and used for acute MI or rate control. Which option is that?",
            options: ["Metoprolol tartrate (Lopressor)", "Metoprolol succinate (Toprol XL)", "Bisoprolol (Zebeta)", "Carvedilol (Coreg)", "Verapamil (Calan)"],
            answer: "Metoprolol tartrate (Lopressor)",
            explanation: "Metoprolol tartrate is immediate-release and commonly dosed BID; succinate is extended-release and commonly used for chronic HFrEF.",
            objective: .dosing,
            relatedDrugIds: ["d15"],
            tags: ["Mastery", "beta blocker", "IR vs ER"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_023",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "One beta blocker in this module also blocks alpha-1 receptors, adding peripheral vasodilation (and sometimes more dizziness/orthostasis). Which drug is it?",
            options: ["Carvedilol", "Atenolol", "Bisoprolol", "Metoprolol succinate", "Propranolol"],
            answer: "Carvedilol",
            explanation: "Carvedilol blocks beta receptors and alpha-1 receptors. The alpha-1 blockade can lower peripheral vascular resistance and increase orthostatic symptoms early in therapy.",
            objective: .moa,
            relatedDrugIds: ["d16"],
            tags: ["Mastery", "beta blocker", "alpha blockade"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_024",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Which beta-1 selective blocker is notably renally eliminated, making kidney function more relevant for dosing compared with many other beta blockers?",
            options: ["Atenolol", "Propranolol", "Carvedilol", "Metoprolol succinate", "Diltiazem"],
            answer: "Atenolol",
            explanation: "Atenolol is renally eliminated, so renal function matters for dosing/accumulation. Many other beta blockers are more hepatically metabolized.",
            objective: .pearl,
            relatedDrugIds: ["d17"],
            tags: ["Mastery", "beta blocker", "renal dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_025",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A non-selective beta blocker (blocks both beta-1 and beta-2) is commonly used for essential tremor and migraine prophylaxis, but it can worsen bronchospasm. Which drug fits best?",
            options: ["Propranolol", "Bisoprolol", "Metoprolol succinate", "Atenolol", "Amlodipine"],
            answer: "Propranolol",
            explanation: "Propranolol is a non-selective beta blocker commonly used for tremor and migraine prophylaxis. Because it blocks beta-2 receptors, it can worsen bronchospasm in asthma/COPD.",
            objective: .indication,
            relatedDrugIds: ["d18"],
            tags: ["Mastery", "beta blocker", "migraine", "tremor"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_026",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "When a beta blocker is needed in a patient with reactive airway disease, a more beta-1 selective option is generally preferred. Which drug below is often remembered as the most beta-1 selective in this list?",
            options: ["Bisoprolol", "Propranolol", "Carvedilol", "Amlodipine", "Losartan"],
            answer: "Bisoprolol",
            explanation: "Bisoprolol is highly beta-1 selective (more so than many others), making it a preferred choice when bronchospasm risk is a concern (though no beta blocker is perfectly selective).",
            objective: .pearl,
            relatedDrugIds: ["d19"],
            tags: ["Mastery", "beta blocker", "selectivity"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_027",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "Many beta blockers carry a warning not to stop abruptly because sudden withdrawal can trigger rebound tachycardia and worsening angina. Which drug class does this warning apply to?",
            options: ["Beta blockers", "ACE inhibitors", "Loop diuretics", "Thiazide diuretics", "DHP calcium channel blockers"],
            answer: "Beta blockers",
            explanation: "Abrupt beta-blocker discontinuation can cause upregulated sympathetic activity, leading to rebound tachycardia, hypertension, and ischemia-so taper instead of stopping suddenly.",
            objective: .contraindication,
            relatedDrugIds: ["d14", "d16", "d18"],
            tags: ["Mastery", "beta blocker", "withdrawal warning"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_028",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Spironolactone and eplerenone are MRAs used in HF and resistant hypertension. At the kidney level, what do MRAs primarily block?",
            options: ["Aldosterone receptor in the collecting duct", "Na+/K+/2Cl- cotransporter in the loop of Henle", "Na+/Cl- cotransporter in the DCT", "Angiotensin-converting enzyme", "L-type calcium channels in vascular smooth muscle"],
            answer: "Aldosterone receptor in the collecting duct",
            explanation: "MRAs (mineralocorticoid receptor antagonists) block aldosterone at the collecting duct, reducing sodium reabsorption and potassium excretion (-> potassium-sparing).",
            objective: .moa,
            relatedDrugIds: ["d20", "d21"],
            tags: ["Mastery", "MRA", "mechanism", "potassium"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_029",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "Two MRAs are spironolactone and eplerenone. Which one is more likely to cause gynecomastia because it has anti-androgen effects?",
            options: ["Spironolactone", "Eplerenone", "Furosemide", "Valsartan", "Verapamil"],
            answer: "Spironolactone",
            explanation: "Spironolactone can block androgen receptors and inhibit testosterone synthesis, leading to gynecomastia and sexual side effects. Eplerenone is more selective.",
            objective: .adverseEffect,
            relatedDrugIds: ["d20", "d21"],
            tags: ["Mastery", "MRA", "endocrine side effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_030",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "A patient needs an MRA but previously developed painful gynecomastia on spironolactone. Which alternative MRA is more selective and less likely to cause that endocrine effect?",
            options: ["Eplerenone", "Spironolactone", "Bumetanide", "Losartan", "Diltiazem"],
            answer: "Eplerenone",
            explanation: "Eplerenone is a more selective mineralocorticoid receptor antagonist, so gynecomastia is much less common than with spironolactone.",
            objective: .pearl,
            relatedDrugIds: ["d21"],
            tags: ["Mastery", "MRA", "tolerability"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_031",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .hard,
            question: "Entresto (sacubitril/valsartan) inhibits neprilysin, which normally breaks down BNP. In a patient taking Entresto, which biomarker is preferred for trending heart failure status because it is not directly degraded by neprilysin?",
            options: ["NT-proBNP", "BNP", "Troponin I", "D-dimer", "C-reactive protein (CRP)"],
            answer: "NT-proBNP",
            explanation: "Neprilysin inhibition can raise BNP levels (because BNP is a neprilysin substrate). NT-proBNP is not degraded by neprilysin, so it's preferred for monitoring in patients on sacubitril/valsartan.",
            objective: .pearl,
            relatedDrugIds: ["d22"],
            tags: ["Mastery", "ARNI", "monitoring", "biomarkers"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_032",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A patient on lisinopril is started on spironolactone for HFrEF. Which adverse effect becomes especially important to counsel and monitor for because BOTH drugs can raise potassium?",
            options: ["Hyperkalemia", "Hypokalemia", "Hypocalcemia", "Ototoxicity", "Reflex tachycardia"],
            answer: "Hyperkalemia",
            explanation: "ACE inhibitors and MRAs both reduce aldosterone-mediated potassium excretion, so the combination increases hyperkalemia risk-monitor potassium closely.",
            objective: .interaction,
            relatedDrugIds: ["d1", "d20"],
            tags: ["Mastery", "ACE inhibitor", "MRA", "hyperkalemia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_033",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .hard,
            question: "ACE inhibitors and ARBs can precipitate acute kidney injury in patients with bilateral renal artery stenosis because they dilate the efferent arteriole. Which drug below should raise that specific concern?",
            options: ["Lisinopril", "Amlodipine", "Diltiazem", "Furosemide", "Carvedilol"],
            answer: "Lisinopril",
            explanation: "By dilating the efferent arteriole, ACE inhibitors/ARBs can drop intraglomerular pressure and cause a sharp rise in creatinine in bilateral renal artery stenosis.",
            objective: .contraindication,
            relatedDrugIds: ["d1"],
            tags: ["Mastery", "RAAS", "contraindications", "renal artery stenosis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_034",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "A drug with a \"-dipine\" suffix primarily causes arteriolar vasodilation, which can lead to flushing and peripheral edema. Which medication below fits that dihydropyridine pattern?",
            options: ["Amlodipine", "Diltiazem", "Verapamil", "Metoprolol tartrate", "Losartan"],
            answer: "Amlodipine",
            explanation: "Amlodipine is a dihydropyridine CCB (-dipine) that mainly vasodilates. Peripheral edema is a common dose-limiting effect.",
            objective: .suffixId,
            relatedDrugIds: ["d23"],
            tags: ["Mastery", "CCB", "suffix", "DHP"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_035",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "Among calcium channel blockers, which agent is most associated with reflex tachycardia (especially if immediate-release) due to potent peripheral vasodilation?",
            options: ["Nifedipine", "Verapamil", "Diltiazem", "Carvedilol", "Ramipril"],
            answer: "Nifedipine",
            explanation: "Nifedipine is a potent dihydropyridine vasodilator, which can trigger reflex sympathetic activation and tachycardia-especially with immediate-release formulations.",
            objective: .adverseEffect,
            relatedDrugIds: ["d24"],
            tags: ["Mastery", "CCB", "reflex tachycardia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_036",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "For atrial fibrillation rate control, the calcium channel blockers that slow AV nodal conduction are the non-dihydropyridines. Which medication below is commonly used for rate control?",
            options: ["Diltiazem", "Amlodipine", "Nifedipine", "Losartan", "Furosemide"],
            answer: "Diltiazem",
            explanation: "Diltiazem is a non-dihydropyridine CCB that slows AV nodal conduction, making it useful for AFib rate control (watch for bradycardia and AV block).",
            objective: .indication,
            relatedDrugIds: ["d25"],
            tags: ["Mastery", "CCB", "AFib", "rate control"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_037",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "A patient started on a non-dihydropyridine CCB reports significant constipation and has a longer PR interval on ECG. Which agent most strongly fits this profile?",
            options: ["Verapamil", "Nifedipine", "Amlodipine", "Hydrochlorothiazide", "Atenolol"],
            answer: "Verapamil",
            explanation: "Verapamil is the most cardiac-selective non-DHP CCB and is notorious for constipation. It can slow AV conduction (PR prolongation) and cause bradycardia/heart block.",
            objective: .adverseEffect,
            relatedDrugIds: ["d26"],
            tags: ["Mastery", "CCB", "constipation", "AV block"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_038",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .hard,
            question: "A patient is already taking metoprolol succinate for HFrEF. Adding which medication would most increase the risk of excessive bradycardia/AV block due to additive AV nodal slowing?",
            options: ["Diltiazem", "Amlodipine", "Losartan", "Chlorthalidone", "Furosemide"],
            answer: "Diltiazem",
            explanation: "Non-DHP CCBs (diltiazem/verapamil) slow AV nodal conduction. Combined with a beta blocker, the risk of symptomatic bradycardia or AV block increases.",
            objective: .interaction,
            relatedDrugIds: ["d14", "d25"],
            tags: ["Mastery", "interaction", "beta blocker", "non-DHP CCB"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_039",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .hard,
            question: "The \"triple whammy\" for acute kidney injury is an ACE inhibitor/ARB + a diuretic + an NSAID (e.g., ibuprofen). Which two-drug combination below would complete that high-risk trio if an NSAID is added?",
            options: ["Lisinopril + Hydrochlorothiazide", "Amlodipine + Nifedipine", "Metoprolol succinate + Bisoprolol", "Verapamil + Diltiazem", "Spironolactone + Eplerenone"],
            answer: "Lisinopril + Hydrochlorothiazide",
            explanation: "ACEi/ARB reduces efferent tone, diuretics reduce volume, and NSAIDs constrict afferent flow-together they can sharply reduce GFR and precipitate AKI.",
            objective: .interaction,
            relatedDrugIds: ["d1", "d9"],
            tags: ["Mastery", "interaction", "AKI", "NSAIDs"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_040",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A patient receiving high-dose IV diuresis develops tinnitus and hearing changes. This classic toxicity points most strongly to which drug below?",
            options: ["Furosemide", "Hydrochlorothiazide", "Amlodipine", "Losartan", "Spironolactone"],
            answer: "Furosemide",
            explanation: "Loop diuretics-especially high-dose IV therapy-can cause ototoxicity (tinnitus/hearing loss), particularly when combined with other ototoxic agents.",
            objective: .adverseEffect,
            relatedDrugIds: ["d11"],
            tags: ["Mastery", "Loop diuretic", "ototoxicity"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_041",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "When treating hypertension in a patient with type 2 diabetes and albuminuria, an ARB with strong nephroprotective evidence is often selected. Which drug below best fits that description in this module?",
            options: ["Irbesartan", "Valsartan", "Olmesartan", "Nifedipine", "Atenolol"],
            answer: "Irbesartan",
            explanation: "Irbesartan is an ARB commonly used in diabetic nephropathy; RAAS blockade lowers intraglomerular pressure and helps reduce proteinuria progression.",
            objective: .indication,
            relatedDrugIds: ["d7"],
            tags: ["Mastery", "ARB", "diabetic nephropathy"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_042",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .easy,
            question: "Only one option below is an ACE inhibitor (a \"-pril\") rather than an ARB (\"-sartan\"). Which drug is the ACE inhibitor?",
            options: ["Enalapril", "Losartan", "Valsartan", "Irbesartan", "Olmesartan"],
            answer: "Enalapril",
            explanation: "Enalapril is a -pril ACE inhibitor. Losartan, valsartan, irbesartan, and olmesartan are all -sartan ARBs.",
            objective: .classId,
            relatedDrugIds: ["d2"],
            tags: ["Mastery", "ACE vs ARB", "class ID"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_043",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "ARBs lower blood pressure without increasing bradykinin (so cough is uncommon). What is their primary mechanism of action?",
            options: ["Block angiotensin II (AT1) receptors", "Inhibit ACE to prevent angiotensin I -> angiotensin II conversion", "Block the Na+/Cl- cotransporter in the distal convoluted tubule", "Block the Na+/K+/2Cl- cotransporter in the thick ascending limb", "Block L-type calcium channels in the AV node"],
            answer: "Block angiotensin II (AT1) receptors",
            explanation: "ARBs act downstream of ACE by directly blocking the AT1 receptor, reducing vasoconstriction and aldosterone release without bradykinin buildup.",
            objective: .moa,
            relatedDrugIds: ["d5", "d6", "d7", "d8"],
            tags: ["Mastery", "ARB", "mechanism"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_044",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "For chronic HFrEF, only certain beta blockers have proven mortality benefit. Which option below is one of those guideline-supported choices?",
            options: ["Carvedilol", "Propranolol", "Atenolol", "Metoprolol tartrate", "Verapamil"],
            answer: "Carvedilol",
            explanation: "Carvedilol (along with metoprolol succinate and bisoprolol) is one of the beta blockers with proven mortality benefit in chronic HFrEF.",
            objective: .indication,
            relatedDrugIds: ["d16", "d14", "d19"],
            tags: ["Mastery", "HFrEF", "beta blocker"],
            source: .curated
        ),
        .multipleChoice(
            id: "q1f_add_045",
            subsectionId: Self.masteringCv1SubsectionId,
            difficulty: .medium,
            question: "A patient with chronic HFrEF is being switched from lisinopril to an ARNI. Which therapy requires a mandatory 36-hour ACE-inhibitor washout before starting to reduce angioedema risk?",
            options: ["Sacubitril/Valsartan (Entresto)", "Valsartan (Diovan)", "Spironolactone (Aldactone)", "Furosemide (Lasix)", "Amlodipine (Norvasc)"],
            answer: "Sacubitril/Valsartan (Entresto)",
            explanation: "Starting an ARNI after an ACE inhibitor requires a 36-hour washout to reduce angioedema risk. This is a key safety step when transitioning RAAS therapies in HFrEF.",
            objective: .contraindication,
            relatedDrugIds: ["d22", "d1"],
            tags: ["Mastery", "ARNI", "washout", "angioedema"],
            source: .curated
        ),
    ]
}
