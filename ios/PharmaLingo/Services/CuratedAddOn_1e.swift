// PharmaLingo — Module 1e (Calcium Channel Blockers)
// Curated Add-On Question Pack (40 questions)
// Drugs: Amlodipine (Norvasc), Diltiazem (Cardizem), Nifedipine (Procardia), Verapamil (Calan)
// IDs: q1e_add_001 ... q1e_add_040
//
// IMPORTANT ID NOTE:
// - In the codebase you uploaded, Calcium Channel Blockers are currently Subsection "1f".
// - Your vNext outline labels this content as "1e".
// - This pack defaults to subsectionId "1f" so it plugs into the current app immediately.
// - If/when you rename the subsection in-app to "1e", update `ccbSubsectionId` below to "1e".
//
// Integration (recommended):
// 1) Add this file to your Xcode project (same target as PharmaLingo).
// 2) In DrugDataService.populateCuratedBank(_:), add:
//      if bank[Self.ccbSubsectionId] == nil { bank[Self.ccbSubsectionId] = [] }
//      bank[Self.ccbSubsectionId]?.append(contentsOf: Self.curatedAddOnQuestions_1e)
//
// Notes:
// - All questions are single-best-answer multiple choice (5 options each).
// - Stems are written to avoid exact duplicates of generated templates.
// - Objectives + relatedDrugIds are set to improve spaced-repetition behavior.

import Foundation

extension DrugDataService {
    static let ccbSubsectionId: String = "1f"
    static let curatedAddOnQuestions_1e: [Question] = [

        .multipleChoice(
            id: "q1e_add_001",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Amlodipine is a dihydropyridine calcium channel blocker (DHP CCB) commonly used for hypertension and chronic stable angina. What is the brand name for amlodipine?",
            options: ["Norvasc", "Cardizem", "Procardia", "Calan", "Zestril"],
            answer: "Norvasc",
            explanation: "Amlodipine is marketed as Norvasc. As a DHP CCB, it primarily causes arterial vasodilation—great for BP control but can cause peripheral edema.",
            objective: .genericBrand,
            relatedDrugIds: ["d23"],
            tags: ["CCB", "DHP", "Amlodipine", "brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_002",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Norvasc is a calcium channel blocker used to lower blood pressure by relaxing arterial smooth muscle. Norvasc contains which generic medication?",
            options: ["Amlodipine", "Nifedipine", "Diltiazem", "Verapamil", "Benazepril"],
            answer: "Amlodipine",
            explanation: "Norvasc is the brand name for amlodipine. Amlodipine is a DHP CCB that mainly works on blood vessels (vasodilation) rather than the AV node.",
            objective: .brandGeneric,
            relatedDrugIds: ["d23"],
            tags: ["CCB", "DHP", "Norvasc", "generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_003",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Nifedipine is a dihydropyridine calcium channel blocker often used for hypertension and vasospastic conditions (like Raynaud’s). What is the brand name for nifedipine in this course?",
            options: ["Procardia", "Norvasc", "Cardizem", "Calan", "Diovan"],
            answer: "Procardia",
            explanation: "Nifedipine is marketed as Procardia. As a DHP CCB, nifedipine can cause vasodilation-related effects like flushing, headache, and reflex tachycardia (especially short-acting forms).",
            objective: .genericBrand,
            relatedDrugIds: ["d24"],
            tags: ["CCB", "DHP", "Nifedipine", "brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_004",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Procardia is a calcium channel blocker that primarily dilates arterioles and is used for hypertension and angina. Procardia contains which generic medication?",
            options: ["Nifedipine", "Amlodipine", "Diltiazem", "Verapamil", "Torsemide"],
            answer: "Nifedipine",
            explanation: "Procardia is the brand name for nifedipine. Nifedipine is a DHP CCB (ends in -dipine) that acts mainly on vascular smooth muscle.",
            objective: .brandGeneric,
            relatedDrugIds: ["d24"],
            tags: ["CCB", "DHP", "Procardia", "generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_005",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Diltiazem is a non‑dihydropyridine calcium channel blocker (non‑DHP CCB) used for hypertension, angina, and AV‑nodal rate control (e.g., atrial fibrillation). What is the brand name for diltiazem in this course?",
            options: ["Cardizem", "Calan", "Norvasc", "Procardia", "Lopressor"],
            answer: "Cardizem",
            explanation: "Diltiazem is marketed as Cardizem. Non‑DHP CCBs act on the heart (slow AV node conduction), so monitor for bradycardia and heart block.",
            objective: .genericBrand,
            relatedDrugIds: ["d25"],
            tags: ["CCB", "non-DHP", "Diltiazem", "brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_006",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Cardizem is a calcium channel blocker commonly used to slow AV‑node conduction for rate control in atrial fibrillation. Cardizem contains which generic medication?",
            options: ["Diltiazem", "Verapamil", "Amlodipine", "Nifedipine", "Metoprolol tartrate"],
            answer: "Diltiazem",
            explanation: "Cardizem is the brand name for diltiazem. Diltiazem is a non‑DHP CCB that lowers heart rate and can prolong the PR interval.",
            objective: .brandGeneric,
            relatedDrugIds: ["d25"],
            tags: ["CCB", "non-DHP", "Cardizem", "generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_007",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Verapamil is a non‑dihydropyridine calcium channel blocker used for hypertension, angina, and supraventricular tachyarrhythmias (AV‑nodal blockade). What is the brand name for verapamil in this course?",
            options: ["Calan", "Cardizem", "Norvasc", "Procardia", "Tenormin"],
            answer: "Calan",
            explanation: "Verapamil is marketed as Calan. Verapamil is the most “cardiac‑selective” CCB and is high‑yield for constipation, bradycardia, and AV block.",
            objective: .genericBrand,
            relatedDrugIds: ["d26"],
            tags: ["CCB", "non-DHP", "Verapamil", "brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_008",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Calan is a calcium channel blocker that slows AV‑node conduction and can be used for supraventricular tachycardias. Calan contains which generic medication?",
            options: ["Verapamil", "Diltiazem", "Nifedipine", "Amlodipine", "Enalapril"],
            answer: "Verapamil",
            explanation: "Calan is the brand name for verapamil. Compared with DHP CCBs, verapamil has stronger effects on heart rate and AV‑node conduction.",
            objective: .brandGeneric,
            relatedDrugIds: ["d26"],
            tags: ["CCB", "non-DHP", "Calan", "generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_009",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "You see an unfamiliar antihypertensive ending in “-dipine.” That suffix strongly suggests which drug class?",
            options: ["Dihydropyridine calcium channel blocker", "ACE inhibitor", "ARB", "Beta blocker", "Loop diuretic"],
            answer: "Dihydropyridine calcium channel blocker",
            explanation: "Rule of thumb: “-dipine” = dihydropyridine CCB (DHP). DHP CCBs mainly dilate arterioles, lowering blood pressure and treating angina, but may cause peripheral edema and flushing.",
            objective: .suffixId,
            relatedDrugIds: ["d23", "d24"],
            tags: ["suffix", "-dipine", "CCB"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_010",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "All calcium channel blockers share a core mechanism at the cellular level. What do CCBs directly block?",
            options: ["L‑type voltage‑gated calcium channels", "Angiotensin‑converting enzyme (ACE)", "Na+/K+/2Cl− cotransporter (NKCC2)", "Beta‑1 adrenergic receptors", "HMG‑CoA reductase"],
            answer: "L‑type voltage‑gated calcium channels",
            explanation: "CCBs inhibit L‑type calcium channels. Less calcium entry means less smooth‑muscle contraction (vasodilation) and—especially for non‑DHPs—slower AV‑node conduction and reduced contractility.",
            objective: .moa,
            relatedDrugIds: ["d23", "d24", "d25", "d26"],
            tags: ["CCB", "MOA", "L-type Ca channels"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_011",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "Which calcium channel blocker in this subsection is most commonly used for **rate control** in atrial fibrillation because it slows AV‑node conduction?",
            options: ["Diltiazem", "Amlodipine", "Nifedipine", "Hydrochlorothiazide", "Losartan"],
            answer: "Diltiazem",
            explanation: "Diltiazem (Cardizem) is a non‑DHP CCB. Non‑DHPs (diltiazem, verapamil) slow AV‑node conduction → useful for AFib rate control, but watch for bradycardia/heart block.",
            objective: .indication,
            relatedDrugIds: ["d25"],
            tags: ["AFib", "rate control", "non-DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_012",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "A patient is already taking metoprolol for heart rate control. Which additional medication choice would most increase the risk of **excessive bradycardia/AV block** due to additive AV‑nodal suppression?",
            options: ["Verapamil", "Amlodipine", "Nifedipine", "Chlorthalidone", "Losartan"],
            answer: "Verapamil",
            explanation: "Verapamil is a non‑DHP CCB that slows AV‑node conduction. Combining a non‑DHP (verapamil/diltiazem) with a beta blocker can cause marked bradycardia, hypotension, and AV block.",
            objective: .interaction,
            relatedDrugIds: ["d26"],
            tags: ["interaction", "beta blocker", "AV block", "non-DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_013",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "A patient starts a DHP calcium channel blocker for hypertension and returns with new **bilateral ankle swelling** but otherwise stable vitals. Which medication is most likely responsible?",
            options: ["Amlodipine", "Diltiazem", "Verapamil", "Metoprolol succinate", "Enalapril"],
            answer: "Amlodipine",
            explanation: "Peripheral edema is a classic DHP CCB effect (amlodipine, nifedipine). It reflects arteriolar dilation increasing capillary hydrostatic pressure—not kidney failure—so edema can occur even with normal renal function.",
            objective: .adverseEffect,
            relatedDrugIds: ["d23"],
            tags: ["DHP", "peripheral edema", "Amlodipine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_014",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "DHP CCB–related peripheral edema is **not** primarily due to sodium retention. What is the best explanation for why drugs like amlodipine cause ankle edema?",
            options: ["Preferential arteriolar dilation increases capillary hydrostatic pressure", "Venous dilation causes pooling and reduced preload", "Direct kidney tubular toxicity causes protein loss", "Immune‑mediated vasculitis increases permeability", "Aldosterone blockade causes fluid shift"],
            answer: "Preferential arteriolar dilation increases capillary hydrostatic pressure",
            explanation: "DHP CCBs dilate arterioles more than venules. That mismatch raises capillary hydrostatic pressure and pushes fluid into interstitial tissue → ankle edema. (This is why ACEi/ARBs can help by balancing dilation.)",
            objective: .moa,
            relatedDrugIds: ["d23", "d24"],
            tags: ["DHP", "edema mechanism", "vascular"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_015",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "Which dihydropyridine CCB is especially associated with **reflex tachycardia**, particularly with short‑acting formulations, due to potent arteriolar vasodilation?",
            options: ["Nifedipine", "Verapamil", "Diltiazem", "Bisoprolol", "Ramipril"],
            answer: "Nifedipine",
            explanation: "Nifedipine is a DHP CCB with strong vasodilatory effects. Rapid drops in BP can trigger reflex sympathetic activation → tachycardia. Extended‑release forms reduce this problem.",
            objective: .adverseEffect,
            relatedDrugIds: ["d24"],
            tags: ["Nifedipine", "reflex tachycardia", "DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_016",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "Constipation is a high‑yield adverse effect for one non‑DHP calcium channel blocker more than the others. Which drug is most notorious for constipation?",
            options: ["Verapamil", "Diltiazem", "Amlodipine", "Nifedipine", "Torsemide"],
            answer: "Verapamil",
            explanation: "Verapamil (Calan) is high‑yield for constipation due to smooth muscle relaxation in the GI tract, in addition to bradycardia and AV block.",
            objective: .adverseEffect,
            relatedDrugIds: ["d26"],
            tags: ["Verapamil", "constipation", "non-DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_017",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "A patient develops gingival hyperplasia after starting an antihypertensive that relaxes vascular smooth muscle by blocking calcium channels. Which drug in this subsection is most associated with gingival hyperplasia?",
            options: ["Nifedipine", "Diltiazem", "Verapamil", "Losartan", "Spironolactone"],
            answer: "Nifedipine",
            explanation: "Gingival hyperplasia is a classic association with some DHP CCBs—especially nifedipine. (Also seen with phenytoin and cyclosporine.)",
            objective: .adverseEffect,
            relatedDrugIds: ["d24"],
            tags: ["Nifedipine", "gingival hyperplasia", "DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_018",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "A patient with **symptomatic HFrEF (reduced ejection fraction)** needs blood pressure control. Which calcium channel blocker should generally be avoided because of its negative inotropic effects on the heart?",
            options: ["Verapamil", "Amlodipine", "Nifedipine ER", "Losartan", "Chlorthalidone"],
            answer: "Verapamil",
            explanation: "Non‑DHP CCBs (verapamil, diltiazem) decrease contractility and can worsen systolic heart failure. DHP agents like amlodipine are generally safer for BP in HFrEF if a CCB is needed.",
            objective: .contraindication,
            relatedDrugIds: ["d26", "d25"],
            tags: ["HFrEF", "negative inotropy", "non-DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_019",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "Which pairing correctly matches a CCB subclass with its **most characteristic physiologic effect**?",
            options: ["DHP CCBs → primarily vasodilation of arterioles", "DHP CCBs → strong AV‑node blockade", "Non‑DHP CCBs → reflex tachycardia as the hallmark", "Non‑DHP CCBs → profound hyperkalemia risk", "All CCBs → cough from bradykinin accumulation"],
            answer: "DHP CCBs → primarily vasodilation of arterioles",
            explanation: "DHP CCBs (e.g., amlodipine, nifedipine) mainly act on vascular smooth muscle → vasodilation. Non‑DHPs (diltiazem, verapamil) act more on the heart → AV‑node slowing and negative inotropy.",
            objective: .classId,
            relatedDrugIds: ["d23", "d24", "d25", "d26"],
            tags: ["DHP vs non-DHP", "class pattern"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_020",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "A patient with Raynaud’s phenomenon has episodic finger blanching triggered by cold. Which medication in this subsection is commonly used to reduce vasospasm?",
            options: ["Nifedipine", "Verapamil", "Diltiazem", "Atenolol", "Enalapril"],
            answer: "Nifedipine",
            explanation: "Nifedipine is a DHP CCB that relaxes peripheral arterioles and is commonly used for Raynaud’s phenomenon to reduce vasospasm and improve blood flow.",
            objective: .indication,
            relatedDrugIds: ["d24"],
            tags: ["Raynaud", "vasospasm", "DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_021",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "A 72‑year‑old with atrial fibrillation and rapid ventricular response needs an AV‑nodal blocker, but they also have mild reactive airway disease and want to avoid a beta blocker. Which medication is the best fit from this subsection?",
            options: ["Diltiazem", "Amlodipine", "Nifedipine", "Losartan", "Furosemide"],
            answer: "Diltiazem",
            explanation: "For AFib rate control, a non‑DHP CCB (diltiazem or verapamil) can be used. Diltiazem is a common choice when beta blockers are undesirable (e.g., bronchospasm risk).",
            objective: .indication,
            relatedDrugIds: ["d25"],
            tags: ["AFib", "rate control", "asthma/COPD"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_022",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "Non‑dihydropyridine CCBs are often described as “cardiac” CCBs. Which target best explains their clinical effect in slowing heart rate?",
            options: ["AV node (decreased conduction velocity)", "Collecting duct (decreased aldosterone)", "Proximal tubule (increased diuresis)", "Platelet P2Y12 receptor", "Angiotensin II receptor"],
            answer: "AV node (decreased conduction velocity)",
            explanation: "Diltiazem and verapamil slow AV‑node conduction and can increase the PR interval. That’s why they’re used for supraventricular arrhythmias and AFib rate control.",
            objective: .moa,
            relatedDrugIds: ["d25", "d26"],
            tags: ["non-DHP", "AV node", "MOA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_023",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "Two drugs in this subsection are **non‑dihydropyridine** calcium channel blockers (non‑DHP). Which option is a non‑DHP CCB?",
            options: ["Verapamil", "Amlodipine", "Nifedipine", "Hydrochlorothiazide", "Ramipril"],
            answer: "Verapamil",
            explanation: "Non‑DHP CCBs are verapamil and diltiazem. Unlike “-dipines,” they have prominent cardiac effects (slower HR/AV conduction).",
            objective: .classId,
            relatedDrugIds: ["d26", "d25"],
            tags: ["non-DHP", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_024",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "A patient has hypertension and stable angina but has a baseline heart rate of 48 bpm (bradycardia). Which CCB is most appropriate if you want BP/antianginal benefit **without significantly slowing the AV node**?",
            options: ["Amlodipine", "Diltiazem", "Verapamil", "Metoprolol", "Propranolol"],
            answer: "Amlodipine",
            explanation: "DHP CCBs like amlodipine primarily vasodilate and do not strongly slow the AV node. Non‑DHP CCBs (diltiazem/verapamil) can worsen bradycardia and AV block.",
            objective: .indication,
            relatedDrugIds: ["d23"],
            tags: ["bradycardia", "DHP", "HTN", "angina"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_025",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "A patient with recurrent paroxysmal supraventricular tachycardia (PSVT) is prescribed an oral medication to slow AV‑node conduction. Which drug in this subsection is a classic AV‑nodal blocker for SVT?",
            options: ["Verapamil", "Amlodipine", "Nifedipine", "Chlorthalidone", "Valsartan"],
            answer: "Verapamil",
            explanation: "Verapamil is a non‑DHP CCB used for SVT/AV‑nodal blockade. It slows conduction through the AV node and reduces heart rate.",
            objective: .indication,
            relatedDrugIds: ["d26"],
            tags: ["SVT", "AV nodal blocker", "Verapamil"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_026",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "Many calcium channel blockers are metabolized by CYP3A4. Which counseling point helps reduce the risk of unexpectedly high CCB levels and hypotension?",
            options: ["Avoid grapefruit juice", "Avoid taking with milk", "Avoid high‑protein meals", "Avoid calcium‑rich foods", "Avoid all NSAIDs"],
            answer: "Avoid grapefruit juice",
            explanation: "Grapefruit juice can inhibit intestinal CYP3A4 and raise concentrations of certain CCBs, increasing hypotension or dizziness risk. A practical counseling pearl is to avoid grapefruit products unless specifically cleared.",
            objective: .interaction,
            relatedDrugIds: ["d23", "d24", "d25", "d26"],
            tags: ["interaction", "CYP3A4", "grapefruit"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_027",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "When starting a **non‑DHP** calcium channel blocker, which monitoring focus is most important because of its effect on cardiac conduction?",
            options: ["Heart rate and PR interval", "INR and bleeding risk", "Serum potassium and QT interval", "TSH and free T4", "Absolute neutrophil count"],
            answer: "Heart rate and PR interval",
            explanation: "Non‑DHP CCBs slow AV‑node conduction and can cause bradycardia or AV block. Monitoring heart rate and EKG (PR interval) is high yield, especially in patients on other nodal blockers.",
            objective: .monitoring,
            relatedDrugIds: ["d25", "d26"],
            tags: ["monitoring", "PR interval", "bradycardia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_028",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "Which pre‑existing condition is a strong reason to **avoid** starting diltiazem without specialist input because the drug can worsen conduction problems?",
            options: ["Second‑ or third‑degree AV block", "Migraine headaches", "Hyperlipidemia", "Chronic kidney stones", "Seasonal allergies"],
            answer: "Second‑ or third‑degree AV block",
            explanation: "Diltiazem (non‑DHP) slows AV‑node conduction. In patients with significant AV block (without a pacemaker), it can precipitate severe bradycardia or complete heart block.",
            objective: .contraindication,
            relatedDrugIds: ["d25"],
            tags: ["diltiazem", "AV block", "contraindication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_029",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "A patient with hypertension also has asthma and experiences bronchospasm with non‑selective beta blockers. Which drug from this subsection can lower blood pressure **without** beta blockade?",
            options: ["Amlodipine", "Propranolol", "Carvedilol", "Metoprolol tartrate", "Bisoprolol"],
            answer: "Amlodipine",
            explanation: "Amlodipine is a CCB and does not block beta receptors, making it a common BP option when beta blockers are not tolerated due to bronchospasm concerns.",
            objective: .indication,
            relatedDrugIds: ["d23"],
            tags: ["HTN", "asthma", "CCB"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_030",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "CCBs lower blood pressure largely by reducing systemic vascular resistance. Which physiologic change best captures how DHP CCBs achieve this?",
            options: ["Arteriolar smooth‑muscle relaxation → decreased afterload", "Increased venous return → increased preload", "Increased aldosterone secretion → natriuresis", "Increased cardiac contractility → higher stroke volume", "Direct renin inhibition"],
            answer: "Arteriolar smooth‑muscle relaxation → decreased afterload",
            explanation: "DHP CCBs relax arteriolar smooth muscle, lowering systemic vascular resistance (afterload) and blood pressure. That’s why flushing, headache, and edema (vasodilation effects) are common.",
            objective: .moa,
            relatedDrugIds: ["d23", "d24"],
            tags: ["DHP", "afterload", "BP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_031",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "A patient on amlodipine has persistent ankle edema but normal cardiac and renal evaluation. Which adjustment is most likely to help CCB‑related edema while still controlling BP?",
            options: ["Add or optimize an ACE inhibitor/ARB", "Increase the amlodipine dose", "Add a loop diuretic as the first fix", "Switch to verapamil for the same BP effect", "Stop all antihypertensives"],
            answer: "Add or optimize an ACE inhibitor/ARB",
            explanation: "CCB edema is due to arteriolar dilation. Adding an ACEi/ARB can balance arteriolar/venous tone and reduce edema; simply adding a diuretic often helps less than expected if the edema is purely vasodilatory.",
            objective: .pearl,
            relatedDrugIds: ["d23"],
            tags: ["CCB edema", "ACEi/ARB", "pearl"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_032",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "Cardizem is commonly selected for atrial fibrillation rate control. Which clinical goal does Cardizem most directly achieve?",
            options: ["Slow AV‑node conduction to reduce ventricular rate", "Increase cardiac contractility to raise ejection fraction", "Block angiotensin II receptors to lower aldosterone", "Promote diuresis by blocking NKCC2", "Inhibit platelet aggregation via COX‑1"],
            answer: "Slow AV‑node conduction to reduce ventricular rate",
            explanation: "Cardizem (diltiazem) is a non‑DHP CCB that slows AV‑node conduction and decreases heart rate, making it useful for AFib with rapid ventricular response.",
            objective: .moa,
            relatedDrugIds: ["d25"],
            tags: ["Cardizem", "AFib", "AV node"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_033",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "A patient experiences dizziness and flushing shortly after starting nifedipine due to vasodilation. Which subclass of calcium channel blockers best describes nifedipine?",
            options: ["Dihydropyridine CCB", "Non‑dihydropyridine CCB", "ACE inhibitor", "ARB", "Beta blocker"],
            answer: "Dihydropyridine CCB",
            explanation: "Nifedipine is a DHP CCB (ends in -dipine). DHPs primarily vasodilate and are commonly used for HTN, angina, and vasospastic disorders.",
            objective: .classId,
            relatedDrugIds: ["d24"],
            tags: ["Nifedipine", "DHP", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_034",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "If you know Procardia is nifedipine, what suffix should you expect to see in nifedipine’s generic name?",
            options: ["-dipine", "-pril", "-sartan", "-olol", "-semide"],
            answer: "-dipine",
            explanation: "Procardia is nifedipine, a dihydropyridine CCB. The “-dipine” suffix is a fast identifier for this subclass.",
            objective: .suffixId,
            relatedDrugIds: ["d24"],
            tags: ["suffix", "-dipine", "Procardia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_035",
            subsectionId: ccbSubsectionId,
            difficulty: .easy,
            question: "A medication list includes Calan and Cardizem. Both are calcium channel blockers, but they are NOT “-dipines.” What subclass do Calan and Cardizem belong to?",
            options: ["Non‑dihydropyridine CCBs", "Dihydropyridine CCBs", "Loop diuretics", "ACE inhibitors", "Statins"],
            answer: "Non‑dihydropyridine CCBs",
            explanation: "Calan (verapamil) and Cardizem (diltiazem) are non‑DHP CCBs. They have stronger cardiac effects (AV‑node slowing) than DHP “-dipine” agents.",
            objective: .classId,
            relatedDrugIds: ["d26", "d25"],
            tags: ["non-DHP", "Calan", "Cardizem"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_036",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "Which calcium channel blocker is often remembered as the most “cardiac‑selective” non‑DHP and is high‑yield for **constipation + bradycardia**?",
            options: ["Verapamil", "Diltiazem", "Amlodipine", "Nifedipine", "Chlorthalidone"],
            answer: "Verapamil",
            explanation: "Verapamil is the most cardiac‑selective CCB in this list, strongly affecting AV‑node conduction. It’s a classic cause of constipation, bradycardia, and heart block.",
            objective: .pearl,
            relatedDrugIds: ["d26"],
            tags: ["Verapamil", "cardiac selective", "constipation"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_037",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "Non‑DHP calcium channel blockers can prolong a specific interval on the EKG due to slowed AV‑node conduction. Which EKG change is most expected with verapamil or diltiazem?",
            options: ["PR interval prolongation", "QT interval prolongation", "ST segment elevation", "Shortened QRS duration", "Peaked T waves from hyperkalemia"],
            answer: "PR interval prolongation",
            explanation: "Verapamil and diltiazem slow AV‑node conduction → PR interval prolongation. This is why they can cause AV block, especially with other nodal blockers.",
            objective: .moa,
            relatedDrugIds: ["d26", "d25"],
            tags: ["EKG", "PR prolongation", "non-DHP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_038",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "A patient with stable angina needs an antianginal that can **lower heart rate and contractility** (reducing myocardial oxygen demand). Which option best fits from this subsection?",
            options: ["Diltiazem", "Amlodipine", "Nifedipine", "Hydrochlorothiazide", "Valsartan"],
            answer: "Diltiazem",
            explanation: "Non‑DHP CCBs (diltiazem/verapamil) decrease heart rate and contractility, helping angina by lowering oxygen demand. DHPs mainly vasodilate and can cause reflex tachycardia in some cases.",
            objective: .indication,
            relatedDrugIds: ["d25"],
            tags: ["angina", "non-DHP", "HR reduction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_039",
            subsectionId: ccbSubsectionId,
            difficulty: .medium,
            question: "A patient on verapamil reports lightheadedness and a slow pulse. Which adverse effect best explains this complaint?",
            options: ["Bradycardia from AV‑node suppression", "Dry cough from bradykinin buildup", "Hypocalcemia from renal calcium wasting", "Ototoxicity from hair‑cell injury", "Myalgia from HMG‑CoA reductase inhibition"],
            answer: "Bradycardia from AV‑node suppression",
            explanation: "Verapamil is a non‑DHP CCB that slows AV‑node conduction and can cause bradycardia/heart block—especially with other nodal blockers.",
            objective: .adverseEffect,
            relatedDrugIds: ["d26"],
            tags: ["Verapamil", "bradycardia", "AV node"],
            source: .curated
        ),

        .multipleChoice(
            id: "q1e_add_040",
            subsectionId: ccbSubsectionId,
            difficulty: .hard,
            question: "A patient has hypertension and chronic stable angina and wants a medication that primarily **dilates coronary and peripheral arteries** without major AV‑node slowing. Which medication best matches that goal?",
            options: ["Amlodipine", "Verapamil", "Diltiazem", "Metoprolol succinate", "Spironolactone"],
            answer: "Amlodipine",
            explanation: "Amlodipine is a DHP CCB that primarily vasodilates (including coronary arteries) and lowers BP, making it useful in HTN + angina without strong AV‑node suppression.",
            objective: .indication,
            relatedDrugIds: ["d23"],
            tags: ["HTN", "angina", "DHP"],
            source: .curated
        ),

    ]
}