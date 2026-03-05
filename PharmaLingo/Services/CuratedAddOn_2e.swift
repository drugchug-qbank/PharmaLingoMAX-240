// PharmaLingo — Module 2e (Antianginals & Nitrates)
// Curated Add-On Question Pack (45 questions)
// IDs: q2e_add_001 ... q2e_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 2e exists, then append:
//
//    if bank["2e"] == nil { bank["2e"] = [] }
//    bank["2e"]?.append(contentsOf: Self.curatedAddOnQuestions_2e)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are designed to teach while avoiding exact duplicates of the generator templates.
// - relatedDrugIds use the uploaded repo IDs: d63 (Nitrostat), d64 (Tridil), d65 (Imdur), d66 (Isordil), d67 (Ranexa).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_2e: [Question] = [

        .multipleChoice(
            id: "q2e_add_001",
            subsectionId: "2e",
            difficulty: .easy,
            question: "A patient keeps Nitrostat in a pocket because it is the classic sublingual nitrate used for sudden angina symptoms. What is the generic name of Nitrostat?",
            options: ["Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Isosorbide mononitrate", "Isosorbide dinitrate", "Ranolazine"],
            answer: "Nitroglycerin (sublingual)",
            explanation: "Nitrostat is the brand name for sublingual nitroglycerin. Linking the brand to its rescue role helps students separate it from long-acting preventive nitrates.",
            objective: .brandGeneric,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "nitroglycerin", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_002",
            subsectionId: "2e",
            difficulty: .easy,
            question: "Nitroglycerin given under the tongue works within minutes to relieve active angina. Which brand name matches nitroglycerin (sublingual)?",
            options: ["Nitrostat", "Tridil", "Imdur", "Isordil", "Ranexa"],
            answer: "Nitrostat",
            explanation: "Nitrostat is the sublingual brand of nitroglycerin used for rapid relief of angina symptoms. It is not the same as IV nitroglycerin, which is Tridil.",
            objective: .genericBrand,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "nitroglycerin", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_003",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A patient develops chest pressure while walking up stairs and needs a medication intended to relieve symptoms now, not later in the day. Which indication best matches nitroglycerin sublingual tablets?",
            options: ["Acute angina", "Angina prophylaxis", "Chronic stable angina add-on therapy", "Hyperlipidemia", "Atrial fibrillation rate control"],
            answer: "Acute angina",
            explanation: "Sublingual nitroglycerin is the rescue medication in this subsection for acute angina. Long-acting nitrates and ranolazine are used for prevention or chronic control instead.",
            objective: .indication,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "acute angina", "rescue"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_004",
            subsectionId: "2e",
            difficulty: .medium,
            question: "In the learning slides, sublingual nitroglycerin is emphasized as the nitrate that begins working quickly for chest pain relief. What onset pearl best fits Nitrostat?",
            options: ["About 1 to 3 minutes", "About 30 to 60 minutes", "About 6 to 8 hours", "Only after 24 hours of daily use", "Only after a continuous IV infusion"],
            answer: "About 1 to 3 minutes",
            explanation: "The high-yield rescue pearl for Nitrostat is rapid onset, roughly 1 to 3 minutes. That is why it is used for active angina symptoms rather than day-long prevention.",
            objective: .pearl,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "onset", "pearl"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_005",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A student wants the key counseling script for Nitrostat memorized. Which instruction is most appropriate for sublingual nitroglycerin use in an angina episode?",
            options: ["Use up to 3 doses 5 minutes apart, then call 911 if pain persists", "Take 1 tablet every morning for prevention", "Use one tablet at bedtime only", "Repeat every hour until symptoms stop", "Take it with food to improve absorption"],
            answer: "Use up to 3 doses 5 minutes apart, then call 911 if pain persists",
            explanation: "The classic Nitrostat teaching pearl is a maximum of 3 sublingual doses separated by 5 minutes, followed by emergency evaluation if symptoms persist. This reinforces that Nitrostat is rescue therapy, not maintenance therapy.",
            objective: .dosing,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "dosing", "911"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_006",
            subsectionId: "2e",
            difficulty: .hard,
            question: "Nitrates are taught as vasodilators for angina because they release nitric oxide and relax vascular smooth muscle. Which second messenger is most directly increased by nitroglycerin?",
            options: ["cGMP", "cAMP", "IP3", "DAG", "Calmodulin"],
            answer: "cGMP",
            explanation: "Nitroglycerin donates nitric oxide, which increases cGMP in smooth muscle and produces vasodilation. Knowing the NO-cGMP link helps connect nitrates to their hypotension and headache effects.",
            objective: .moa,
            relatedDrugIds: ["d63", "d64", "d65", "d66"],
            tags: ["nitrates", "MOA", "cGMP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_007",
            subsectionId: "2e",
            difficulty: .hard,
            question: "When nitrates relieve angina, a major hemodynamic teaching point is that they venodilate and reduce the amount of blood returning to the heart. Which term best describes this high-yield effect?",
            options: ["Reduced preload", "Increased afterload", "Positive inotropy", "AV nodal blockade", "Platelet inhibition"],
            answer: "Reduced preload",
            explanation: "Nitrates predominantly venodilate, which lowers preload and reduces myocardial oxygen demand. That mechanism explains why they help angina even though they are not antiarrhythmics or antiplatelets.",
            objective: .moa,
            relatedDrugIds: ["d63", "d64", "d65", "d66"],
            tags: ["nitrates", "preload", "MOA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_008",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A patient asks to use Nitrostat for chest discomfort but mentions taking sildenafil earlier the same day. Which concern makes this combination a classic contraindication?",
            options: ["Severe hypotension from combined vasodilation", "Acute hepatotoxicity", "Profound hypoglycemia", "QT shortening", "Warfarin resistance"],
            answer: "Severe hypotension from combined vasodilation",
            explanation: "Nitrates and PDE-5 inhibitors both increase vasodilatory signaling, so combining them can cause dangerous hypotension. This is one of the most important counseling pearls in the entire subsection.",
            objective: .contraindication,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "sildenafil", "contraindication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_009",
            subsectionId: "2e",
            difficulty: .easy,
            question: "A patient says Nitrostat works for chest pain but often causes a throbbing discomfort in the head afterward. Which adverse effect is especially high yield with nitrates?",
            options: ["Headache", "Dry cough", "Constipation", "Bradycardia", "Myalgia"],
            answer: "Headache",
            explanation: "Headache is a classic nitrate adverse effect because vasodilation also affects cerebral vessels. Students should expect this effect and not confuse it with a class-specific issue like ACE-inhibitor cough.",
            objective: .adverseEffect,
            relatedDrugIds: ["d63", "d64", "d65", "d66"],
            tags: ["nitrates", "headache", "adverse effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_010",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Before placing Nitrostat under the tongue, which counseling point best helps prevent a fall caused by one of the drug's expected hemodynamic effects?",
            options: ["Sit or lie down first because the dose can lower blood pressure", "Take it with grapefruit juice", "Use it only after eating a full meal", "Hold the dose if the patient had caffeine", "Take an antacid first"],
            answer: "Sit or lie down first because the dose can lower blood pressure",
            explanation: "Nitroglycerin can cause dizziness and hypotension because it vasodilates quickly. Advising patients to sit down before using a dose is a practical, safety-focused teaching point.",
            objective: .pearl,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "hypotension", "counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_011",
            subsectionId: "2e",
            difficulty: .easy,
            question: "An ICU drip labeled Tridil is being used because IV nitroglycerin can be titrated for selected cardiovascular emergencies. What is the generic name of Tridil?",
            options: ["Nitroglycerin (IV)", "Nitroglycerin (sublingual)", "Isosorbide mononitrate", "Isosorbide dinitrate", "Ranolazine"],
            answer: "Nitroglycerin (IV)",
            explanation: "Tridil is the IV formulation of nitroglycerin. Keeping the route in the generic name helps learners separate hospital infusion use from the home rescue product Nitrostat.",
            objective: .brandGeneric,
            relatedDrugIds: ["d64"],
            tags: ["Tridil", "nitroglycerin IV", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_012",
            subsectionId: "2e",
            difficulty: .easy,
            question: "Nitroglycerin can also be given as a titratable hospital infusion for ACS or acute heart failure. Which brand name matches nitroglycerin (IV)?",
            options: ["Tridil", "Nitrostat", "Imdur", "Isordil", "Ranexa"],
            answer: "Tridil",
            explanation: "Tridil is the IV brand name for nitroglycerin. This brand-generic distinction is high yield because both Tridil and Nitrostat are nitroglycerin but used in very different settings.",
            objective: .genericBrand,
            relatedDrugIds: ["d64"],
            tags: ["Tridil", "nitroglycerin IV", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_013",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A hospitalized patient with ongoing ischemic chest pain and another with acute decompensated heart failure may both receive a monitored nitroglycerin infusion. Which indication pair best matches IV nitroglycerin?",
            options: ["ACS and acute HF", "Stable hypertension and constipation", "Migraine prophylaxis and gout", "Atrial fibrillation and DVT", "COPD and allergic rhinitis"],
            answer: "ACS and acute HF",
            explanation: "IV nitroglycerin is a hospital drug associated with acute coronary syndrome and acute heart failure. That makes it different from long-acting oral nitrates used for outpatient angina prevention.",
            objective: .indication,
            relatedDrugIds: ["d64"],
            tags: ["Tridil", "ACS", "acute HF"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_014",
            subsectionId: "2e",
            difficulty: .hard,
            question: "A pharmacy student is reviewing infusion pearls for Tridil. Which practical administration point is classically associated with IV nitroglycerin?",
            options: ["Use non-PVC tubing", "Give only with food", "Avoid all dairy products", "Check INR every morning", "Store as a frozen premix only"],
            answer: "Use non-PVC tubing",
            explanation: "A classic IV nitroglycerin pearl is to use non-PVC tubing. This helps learners remember that Tridil is a specialized infusion product rather than just Nitrostat in a different box.",
            objective: .pearl,
            relatedDrugIds: ["d64"],
            tags: ["Tridil", "non-PVC tubing", "administration"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_015",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which antianginal in this subsection is most specifically designed for titration as a monitored IV infusion rather than as an oral prevention drug or sublingual rescue tablet?",
            options: ["Nitroglycerin (IV)", "Nitroglycerin (sublingual)", "Isosorbide mononitrate", "Isosorbide dinitrate", "Ranolazine"],
            answer: "Nitroglycerin (IV)",
            explanation: "Nitroglycerin IV is the monitored infusion product in this subsection. The others are used as sublingual rescue, oral prophylaxis, or chronic add-on therapy.",
            objective: .classId,
            relatedDrugIds: ["d64"],
            tags: ["Tridil", "infusion", "setting"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_016",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Because Tridil can cause rapid vasodilation, which bedside parameter deserves especially close monitoring while the infusion is adjusted?",
            options: ["Blood pressure", "TSH", "INR", "A1c", "Serum uric acid"],
            answer: "Blood pressure",
            explanation: "Blood pressure is a key parameter to monitor with IV nitroglycerin because hypotension is a major expected adverse effect. This is a practical difference from drugs that primarily require lab or ECG monitoring.",
            objective: .monitoring,
            relatedDrugIds: ["d64"],
            tags: ["Tridil", "blood pressure", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_017",
            subsectionId: "2e",
            difficulty: .easy,
            question: "A clinic note says the patient takes Imdur daily to prevent angina episodes before they start. What is the generic name of Imdur?",
            options: ["Isosorbide mononitrate", "Isosorbide dinitrate", "Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Ranolazine"],
            answer: "Isosorbide mononitrate",
            explanation: "Imdur is the brand name for isosorbide mononitrate. The prevention role in the stem helps distinguish it from Nitrostat, which is used for acute angina relief.",
            objective: .brandGeneric,
            relatedDrugIds: ["d65"],
            tags: ["Imdur", "isosorbide mononitrate", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_018",
            subsectionId: "2e",
            difficulty: .easy,
            question: "Isosorbide mononitrate is a long-acting nitrate used for angina prevention rather than immediate rescue. Which brand name matches isosorbide mononitrate?",
            options: ["Imdur", "Isordil", "Nitrostat", "Tridil", "Ranexa"],
            answer: "Imdur",
            explanation: "Imdur is the brand name for isosorbide mononitrate. This brand often appears on chronic outpatient medication lists for angina prophylaxis.",
            objective: .genericBrand,
            relatedDrugIds: ["d65"],
            tags: ["Imdur", "isosorbide mononitrate", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_019",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A patient has predictable exertional chest discomfort and wants fewer attacks during the week, not just a rescue plan during an episode. Which indication best fits isosorbide mononitrate?",
            options: ["Angina prophylaxis", "Immediate clot dissolution", "Stroke reversal", "Rate control in AFib", "LDL lowering"],
            answer: "Angina prophylaxis",
            explanation: "Isosorbide mononitrate is a long-acting nitrate used to prevent angina episodes. It is not the go-to product for stopping chest pain that is already happening.",
            objective: .indication,
            relatedDrugIds: ["d65"],
            tags: ["Imdur", "angina prophylaxis", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_020",
            subsectionId: "2e",
            difficulty: .hard,
            question: "A patient using Imdur every day is counseled to allow a period without nitrate exposure. What is the purpose of the classic nitrate-free interval with long-acting nitrates?",
            options: ["To reduce tolerance", "To prevent hypoglycemia", "To increase platelet inhibition", "To boost renal clearance", "To avoid rebound hyperkalemia"],
            answer: "To reduce tolerance",
            explanation: "Long-acting nitrates need a nitrate-free interval to reduce tolerance. Without that break, the antianginal effect can weaken over time even if the patient continues taking the medication.",
            objective: .pearl,
            relatedDrugIds: ["d65", "d66"],
            tags: ["nitrates", "tolerance", "nitrate-free interval"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_021",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A patient tucks an Imdur tablet into a wallet and plans to use it when chest pain suddenly starts on the subway. Why is that strategy inappropriate?",
            options: ["Imdur is a preventive nitrate, not a rapid-rescue medication", "Imdur causes bronchospasm within minutes", "Imdur is only used by IV infusion", "Imdur is a direct factor Xa inhibitor", "Imdur must always be taken with warfarin"],
            answer: "Imdur is a preventive nitrate, not a rapid-rescue medication",
            explanation: "Imdur is used for angina prevention, not immediate relief of acute chest pain. This stem teaches learners to separate chronic prophylaxis from fast-onset rescue therapy.",
            objective: .dosing,
            relatedDrugIds: ["d65"],
            tags: ["Imdur", "not rescue", "counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_022",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which medication from this subsection is best described as a long-acting oral nitrate commonly used for ongoing angina prevention throughout the day?",
            options: ["Isosorbide mononitrate", "Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Ranolazine", "Adenosine"],
            answer: "Isosorbide mononitrate",
            explanation: "Isosorbide mononitrate is the long-acting oral nitrate in this subsection most closely tied to chronic angina prevention. Nitroglycerin SL is rescue, and IV nitroglycerin is an inpatient infusion.",
            objective: .classId,
            relatedDrugIds: ["d65"],
            tags: ["Imdur", "long-acting nitrate", "prevention"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_023",
            subsectionId: "2e",
            difficulty: .easy,
            question: "A heart failure teaching sheet mentions Isordil as one of the oral nitrates students should recognize by brand. What is the generic name of Isordil?",
            options: ["Isosorbide dinitrate", "Isosorbide mononitrate", "Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Ranolazine"],
            answer: "Isosorbide dinitrate",
            explanation: "Isordil is the brand name for isosorbide dinitrate. This pair is high yield because isosorbide dinitrate carries both angina and HFrEF-related teaching pearls.",
            objective: .brandGeneric,
            relatedDrugIds: ["d66"],
            tags: ["Isordil", "isosorbide dinitrate", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_024",
            subsectionId: "2e",
            difficulty: .easy,
            question: "Isosorbide dinitrate is an oral nitrate used in angina prevention and also appears in HFrEF discussions with hydralazine. Which brand name matches isosorbide dinitrate?",
            options: ["Isordil", "Imdur", "Nitrostat", "Tridil", "Ranexa"],
            answer: "Isordil",
            explanation: "Isordil is the brand name for isosorbide dinitrate. Keeping Isordil separate from Imdur helps learners avoid mixing up the two isosorbides.",
            objective: .genericBrand,
            relatedDrugIds: ["d66"],
            tags: ["Isordil", "isosorbide dinitrate", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_025",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which primary indication best matches isosorbide dinitrate when it is used as a chronic oral antianginal?",
            options: ["Angina prophylaxis", "Immediate rescue of active chest pain", "Rapid chemical cardioversion", "Acute DVT treatment", "GERD symptom suppression"],
            answer: "Angina prophylaxis",
            explanation: "Isosorbide dinitrate is used for angina prophylaxis as a chronic nitrate. It is not the same as sublingual nitroglycerin, which is used for rapid relief during an attack.",
            objective: .indication,
            relatedDrugIds: ["d66"],
            tags: ["Isordil", "angina prophylaxis", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_026",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A student is told to remember the nitrate that shows up in the classic hydralazine combination for HFrEF. Which drug from this subsection fits that description?",
            options: ["Isosorbide dinitrate", "Isosorbide mononitrate", "Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Ranolazine"],
            answer: "Isosorbide dinitrate",
            explanation: "Isosorbide dinitrate is the nitrate associated with hydralazine combination therapy in HFrEF. That pearl makes it clinically distinct from isosorbide mononitrate.",
            objective: .pearl,
            relatedDrugIds: ["d66"],
            tags: ["Isordil", "hydralazine", "HFrEF"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_027",
            subsectionId: "2e",
            difficulty: .hard,
            question: "Why do long-acting nitrates such as isosorbide mononitrate or isosorbide dinitrate often require time off drug exposure during the day?",
            options: ["Continuous exposure can lead to tolerance", "They permanently block platelet function", "They cause severe bradycardia if taken twice daily", "They accumulate only in kidney failure", "They must alternate with aspirin to work"],
            answer: "Continuous exposure can lead to tolerance",
            explanation: "Tolerance is the major reason long-acting nitrates need nitrate-free periods. This is one of the most testable counseling points for chronic nitrate therapy.",
            objective: .pearl,
            relatedDrugIds: ["d65", "d66"],
            tags: ["nitrates", "tolerance", "long-acting"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_028",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Nitrostat, Tridil, Imdur, and Isordil all share which drug-class identity despite having different routes and time courses?",
            options: ["Nitrate", "Beta blocker", "Calcium channel blocker", "Direct factor Xa inhibitor", "Statin"],
            answer: "Nitrate",
            explanation: "Nitrostat, Tridil, Imdur, and Isordil are all nitrates. Ranolazine is the outlier in this subsection because it is not a nitrate.",
            objective: .classId,
            relatedDrugIds: ["d63", "d64", "d65", "d66"],
            tags: ["nitrates", "class", "review"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_029",
            subsectionId: "2e",
            difficulty: .easy,
            question: "A patient with chronic stable angina is given Ranexa as an add-on medication when symptoms persist despite other therapy. What is the generic name of Ranexa?",
            options: ["Ranolazine", "Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Isosorbide mononitrate", "Isosorbide dinitrate"],
            answer: "Ranolazine",
            explanation: "Ranexa is the brand name for ranolazine. This pair is important because ranolazine is the non-nitrate antianginal in the subsection.",
            objective: .brandGeneric,
            relatedDrugIds: ["d67"],
            tags: ["Ranexa", "ranolazine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_030",
            subsectionId: "2e",
            difficulty: .easy,
            question: "Ranolazine is the antianginal that works through the late sodium current rather than acting as a nitrate vasodilator. Which brand name matches ranolazine?",
            options: ["Ranexa", "Nitrostat", "Tridil", "Imdur", "Isordil"],
            answer: "Ranexa",
            explanation: "Ranexa is the brand name for ranolazine. Knowing this pair helps students quickly spot the one antianginal in the subsection that is not a nitrate.",
            objective: .genericBrand,
            relatedDrugIds: ["d67"],
            tags: ["Ranexa", "ranolazine", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_031",
            subsectionId: "2e",
            difficulty: .hard,
            question: "Ranolazine improves chronic angina through a mechanism that is different from nitrates and beta blockers. Which mechanism best describes ranolazine?",
            options: ["Inhibits the late sodium current", "Blocks P2Y12 receptors", "Inhibits HMG-CoA reductase", "Activates PPAR-alpha", "Irreversibly blocks COX-1"],
            answer: "Inhibits the late sodium current",
            explanation: "Ranolazine is a late sodium current inhibitor. That mechanism is worth memorizing because it explains why ranolazine can help angina without behaving like a nitrate or rate-lowering drug.",
            objective: .moa,
            relatedDrugIds: ["d67"],
            tags: ["Ranolazine", "late sodium current", "MOA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_032",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A patient already takes standard antianginal therapy but still has chronic stable chest discomfort during exertion. Which indication best matches ranolazine?",
            options: ["Chronic stable angina", "Acute angina rescue", "Acute stroke reversal", "Pulmonary embolism treatment", "Rapid SVT termination"],
            answer: "Chronic stable angina",
            explanation: "Ranolazine is used for chronic stable angina, often as add-on therapy when symptoms remain despite other medications. It is not a rescue drug for immediate chest pain relief.",
            objective: .indication,
            relatedDrugIds: ["d67"],
            tags: ["Ranolazine", "chronic stable angina", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_033",
            subsectionId: "2e",
            difficulty: .hard,
            question: "A patient with stable angina already has a low resting heart rate and borderline low blood pressure, so the team wants an antianginal that usually will not lower either value much further. Which medication best fits that goal?",
            options: ["Ranolazine", "Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Verapamil", "Metoprolol tartrate"],
            answer: "Ranolazine",
            explanation: "A classic pearl for ranolazine is that it does not significantly affect heart rate or blood pressure. That makes it attractive when more rate slowing or vasodilation would be poorly tolerated.",
            objective: .pearl,
            relatedDrugIds: ["d67"],
            tags: ["Ranolazine", "HR/BP neutral", "pearl"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_034",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which adverse effect is especially worth remembering for ranolazine because it raises an ECG-based safety concern rather than just causing nitrate-like vasodilation symptoms?",
            options: ["QT prolongation", "Dry cough", "Gingival hyperplasia", "Blue-green vision changes", "Ototoxicity"],
            answer: "QT prolongation",
            explanation: "QT prolongation is the standout adverse-effect pearl for ranolazine. That differentiates it from nitrates, which more commonly cause headache, flushing, and hypotension.",
            objective: .adverseEffect,
            relatedDrugIds: ["d67"],
            tags: ["Ranolazine", "QT prolongation", "adverse effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_035",
            subsectionId: "2e",
            difficulty: .medium,
            question: "If a patient is started on ranolazine and the clinician wants to watch the problem most specific to that drug, which ECG feature deserves attention?",
            options: ["QT interval", "PR interval only", "P-wave amplitude", "Delta wave presence", "QRS axis only"],
            answer: "QT interval",
            explanation: "Ranolazine is associated with QT prolongation, so the QT interval is the ECG feature to keep in mind. This monitoring point helps distinguish ranolazine from the nitrate products in the same subsection.",
            objective: .monitoring,
            relatedDrugIds: ["d67"],
            tags: ["Ranolazine", "QT", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_036",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A patient says, 'My Nitrostat ran out, so I will just swallow a Ranexa when chest pain suddenly starts.' What is the best reason that substitution is inappropriate?",
            options: ["Ranolazine is for chronic control, not rapid relief of an active angina attack", "Ranolazine is only available as an IV infusion", "Ranolazine must be chewed with aspirin to work", "Ranolazine is a fibrinolytic drug", "Ranolazine is used only for acute heart failure"],
            answer: "Ranolazine is for chronic control, not rapid relief of an active angina attack",
            explanation: "Ranolazine helps chronic stable angina over time; it is not a rescue medication like sublingual nitroglycerin. This distinction is one of the highest-yield takeaways in the subsection.",
            objective: .dosing,
            relatedDrugIds: ["d67", "d63"],
            tags: ["Ranolazine", "not rescue", "Nitrostat comparison"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_037",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which medication in this subsection is the clear 'odd one out' because it is not a nitrate?",
            options: ["Ranolazine", "Nitroglycerin (sublingual)", "Nitroglycerin (IV)", "Isosorbide mononitrate", "Isosorbide dinitrate"],
            answer: "Ranolazine",
            explanation: "Ranolazine is not a nitrate; it is a late sodium current inhibitor. The other four drugs in the subsection are nitrate antianginals.",
            objective: .classId,
            relatedDrugIds: ["d63", "d64", "d65", "d66", "d67"],
            tags: ["Ranolazine", "not nitrate", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_038",
            subsectionId: "2e",
            difficulty: .hard,
            question: "A patient with chronic angina cannot tolerate more beta-blocker titration because the pulse is already 52/min, and the blood pressure is 96/60. Which antianginal from this subsection is most appealing specifically because it usually does not lower heart rate or blood pressure much more?",
            options: ["Ranolazine", "Nitroglycerin (IV)", "Nitroglycerin (sublingual)", "Isosorbide mononitrate", "Verapamil"],
            answer: "Ranolazine",
            explanation: "Ranolazine is often chosen when symptom control is needed but additional heart-rate or blood-pressure lowering would be problematic. That pearl makes it highly testable and clinically memorable.",
            objective: .indication,
            relatedDrugIds: ["d67"],
            tags: ["Ranolazine", "bradycardia", "hypotension"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_039",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Nitrostat and Tridil sound very different on a medication list, but pharmacologically they are two formulations of the same core drug. Which generic medication do they share?",
            options: ["Nitroglycerin", "Ranolazine", "Isosorbide mononitrate", "Isosorbide dinitrate", "Hydralazine"],
            answer: "Nitroglycerin",
            explanation: "Nitrostat and Tridil are both nitroglycerin, but one is sublingual rescue and the other is IV infusion. This comparison helps students organize the subsection by route and use case.",
            objective: .pearl,
            relatedDrugIds: ["d63", "d64"],
            tags: ["Nitrostat", "Tridil", "same generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_040",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which drug from this subsection is most closely associated with a monitored infusion pump in the hospital rather than a tablet taken at home?",
            options: ["Tridil", "Nitrostat", "Imdur", "Isordil", "Ranexa"],
            answer: "Tridil",
            explanation: "Tridil is IV nitroglycerin, so it is the antianginal most associated with monitored inpatient infusion use. The other drugs in the subsection are oral or sublingual outpatient products.",
            objective: .pearl,
            relatedDrugIds: ["d64"],
            tags: ["Tridil", "hospital", "infusion"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_041",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which medication from this subsection is the classic sublingual rescue option for chest pain that is happening right now at home or on the go?",
            options: ["Nitrostat", "Imdur", "Isordil", "Ranexa", "Tridil"],
            answer: "Nitrostat",
            explanation: "Nitrostat is sublingual nitroglycerin and is the classic rescue medication for active angina symptoms. The other options are used for prevention, add-on control, or inpatient infusion.",
            objective: .pearl,
            relatedDrugIds: ["d63"],
            tags: ["Nitrostat", "rescue", "acute use"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_042",
            subsectionId: "2e",
            difficulty: .medium,
            question: "A daily outpatient medication list shows a long-acting nitrate intended to help prevent angina episodes rather than abort them immediately. Which brand name best matches that description?",
            options: ["Imdur", "Nitrostat", "Tridil", "Ranexa", "Adenocard"],
            answer: "Imdur",
            explanation: "Imdur is the brand name for isosorbide mononitrate, a long-acting nitrate used for angina prophylaxis. It should not be confused with Nitrostat, the rapid rescue product.",
            objective: .genericBrand,
            relatedDrugIds: ["d65"],
            tags: ["Imdur", "prevention", "brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_043",
            subsectionId: "2e",
            difficulty: .medium,
            question: "Which oral nitrate in this subsection is the one most strongly tied to the classic hydralazine combination pearl in HFrEF teaching?",
            options: ["Isordil", "Imdur", "Nitrostat", "Tridil", "Ranexa"],
            answer: "Isordil",
            explanation: "Isordil, or isosorbide dinitrate, is the nitrate associated with hydralazine combination therapy in HFrEF. That extra pearl helps differentiate it from Imdur.",
            objective: .genericBrand,
            relatedDrugIds: ["d66"],
            tags: ["Isordil", "HFrEF", "brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_044",
            subsectionId: "2e",
            difficulty: .hard,
            question: "Which medication pair is classically unsafe because the combination can produce profound hypotension?",
            options: ["Nitroglycerin and tadalafil", "Aspirin and clopidogrel", "Rosuvastatin and ezetimibe", "Furosemide and potassium chloride", "Metoprolol and lisinopril"],
            answer: "Nitroglycerin and tadalafil",
            explanation: "Nitrates must not be combined with PDE-5 inhibitors such as tadalafil because the combined vasodilation can cause severe hypotension. This is one of the highest-yield interaction warnings in cardiovascular pharmacology.",
            objective: .interaction,
            relatedDrugIds: ["d63", "d64", "d65", "d66"],
            tags: ["nitrates", "tadalafil", "interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2e_add_045",
            subsectionId: "2e",
            difficulty: .hard,
            question: "A learner is asked to recognize the symptom cluster most characteristic of nitrate vasodilation. Which option best fits that pattern?",
            options: ["Headache, flushing, and hypotension", "Dry cough, hyperkalemia, and angioedema", "Myalgia, dark urine, and elevated CK", "Tinnitus, respiratory alkalosis, and fever", "Bradycardia, constipation, and AV block"],
            answer: "Headache, flushing, and hypotension",
            explanation: "Nitrate vasodilation classically causes headache, flushing, and hypotension. Grouping these effects together helps students identify the whole nitrate profile instead of memorizing isolated side effects.",
            objective: .adverseEffect,
            relatedDrugIds: ["d63", "d64", "d65", "d66"],
            tags: ["nitrates", "headache", "flushing", "hypotension"],
            source: .curated
        )
    ]
}