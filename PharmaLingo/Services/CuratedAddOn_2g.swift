// PharmaLingo — Mastering Cardiovascular II
// Curated Add-On Question Pack (45 questions)
// IDs: q2g_add_001 ... q2g_add_045
//
// IMPORTANT INTEGRATION NOTE
// - Module 2g is a review-only mastery subsection.
// - Integrate this the same way as the Module 1 mastery pack:
//   append these questions AFTER the app auto-builds the mastery pool in DrugDataService.init().
// - This preserves the mixed-review behavior from your repo instead of overwriting it.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) Patch DrugDataService.init() inside the mastery loop.
//    After:
//        bank[sub.id] = mastery
//
//    append:
//        if sub.id == Self.masteringCv2SubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_2gMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 2a-2f with a few cross-module references back to Module 1.
// - No clinical-trial questions.
//
// Generated on: 2026-03-06

import Foundation

extension DrugDataService {
    static let masteringCv2SubsectionId: String = "2g"

    static let curatedAddOnQuestions_2gMastery: [Question] = [

        .multipleChoice(
            id: "q2g_add_001",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient taking clarithromycin and several other CYP3A4-metabolized drugs still needs a statin for LDL lowering. Which statin from Module 2 is classically favored when minimizing CYP3A4 interactions matters most?",
            options: ["Pravastatin", "Simvastatin", "Lovastatin", "Atorvastatin", "Gemfibrozil"],
            answer: "Pravastatin",
            explanation: "Pravastatin is the statin in this module classically remembered for having fewer CYP3A4 interactions, which can make it attractive when drug-interaction burden is a concern.",
            objective: .interaction,
            relatedDrugIds: ["d30"],
            tags: ["Mastery", "statin", "interactions", "pravastatin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_002",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "One statin in this module is especially tied to the counseling pearl “take it with the evening meal” rather than on an empty stomach. Which drug is it?",
            options: ["Lovastatin", "Rosuvastatin", "Pravastatin", "Atorvastatin", "Ezetimibe"],
            answer: "Lovastatin",
            explanation: "Lovastatin is classically taken with the evening meal to improve absorption and align with nighttime hepatic cholesterol synthesis.",
            objective: .dosing,
            relatedDrugIds: ["d31"],
            tags: ["Mastery", "statin", "lovastatin", "dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_003",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Simvastatin can lower LDL cholesterol, but higher doses are avoided because of excess muscle toxicity risk. Which safety pearl is most accurate?",
            options: ["Avoid initiating or routinely continuing simvastatin 80 mg unless the patient is already stable on it", "Simvastatin should always be dosed twice daily", "Simvastatin is the safest statin to combine with gemfibrozil", "Simvastatin has essentially no clinically relevant drug interactions", "Simvastatin 10 mg is considered high-intensity therapy"],
            answer: "Avoid initiating or routinely continuing simvastatin 80 mg unless the patient is already stable on it",
            explanation: "Simvastatin has a well-known high-dose myopathy warning. The 80 mg dose is generally avoided unless the patient has already been stable on it without muscle toxicity.",
            objective: .pearl,
            relatedDrugIds: ["d29"],
            tags: ["Mastery", "statin", "simvastatin", "safety"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_004",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "A patient with established ASCVD needs a high-intensity statin regimen. Which option below meets that high-intensity threshold?",
            options: ["Rosuvastatin 20 mg daily", "Pravastatin 40 mg daily", "Simvastatin 20 mg daily", "Lovastatin 20 mg daily", "Ezetimibe 10 mg daily"],
            answer: "Rosuvastatin 20 mg daily",
            explanation: "High-intensity statin therapy is classically atorvastatin 40-80 mg or rosuvastatin 20-40 mg. The other statin doses listed are not high-intensity regimens.",
            objective: .dosing,
            relatedDrugIds: ["d28"],
            tags: ["Mastery", "statin", "high-intensity", "rosuvastatin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_005",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Statins lower LDL not only by slowing hepatic cholesterol synthesis but also by increasing clearance of circulating LDL. This happens primarily because statins:",
            options: ["Upregulate hepatic LDL receptors", "Neutralize PCSK9 with monoclonal antibodies", "Block intestinal NPC1L1 transporters", "Activate PPAR-alpha in the liver", "Irreversibly inhibit platelet COX-1"],
            answer: "Upregulate hepatic LDL receptors",
            explanation: "By lowering intrahepatic cholesterol, statins drive the liver to express more LDL receptors, which increases removal of LDL particles from the bloodstream.",
            objective: .moa,
            relatedDrugIds: ["d27", "d28", "d29", "d30", "d31"],
            tags: ["Mastery", "statin", "mechanism", "LDL receptors"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_006",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient on atorvastatin returns with severe muscle pain, weakness, and cola-colored urine. Which high-yield concern should be recognized immediately?",
            options: ["Possible rhabdomyolysis—check CK and evaluate the statin promptly", "Expected nitrate headache from vasodilation", "Typical ticagrelor-related dyspnea", "Digoxin toxicity from yellow-green vision", "A benign effect that never requires evaluation"],
            answer: "Possible rhabdomyolysis—check CK and evaluate the statin promptly",
            explanation: "Severe myalgias plus dark urine raise concern for statin-associated rhabdomyolysis, which requires prompt evaluation and usually holding the drug while checking CK and renal status.",
            objective: .adverseEffect,
            relatedDrugIds: ["d27"],
            tags: ["Mastery", "statin", "rhabdomyolysis", "adverse effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_007",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient with marked hypertriglyceridemia needs a fibrate but will also remain on a statin. Which option from this module is generally preferred because it carries less statin-associated myopathy risk than gemfibrozil?",
            options: ["Fenofibrate", "Gemfibrozil", "Ezetimibe", "Alirocumab", "Icosapent ethyl"],
            answer: "Fenofibrate",
            explanation: "Fenofibrate is the fibrate classically preferred if combination therapy with a statin is needed. Gemfibrozil is the fibrate more strongly associated with statin-related myopathy risk.",
            objective: .interaction,
            relatedDrugIds: ["d35", "d36"],
            tags: ["Mastery", "fibrate", "statin interaction", "fenofibrate"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_008",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Which non-statin lipid agent is the one pharmacists classically flag as the worse fibrate to combine with statins because it substantially raises myopathy risk?",
            options: ["Gemfibrozil", "Fenofibrate", "Ezetimibe", "Evolocumab", "Icosapent ethyl"],
            answer: "Gemfibrozil",
            explanation: "Gemfibrozil is the classic fibrate to avoid with statins whenever possible because it markedly increases the risk of muscle toxicity compared with fenofibrate.",
            objective: .interaction,
            relatedDrugIds: ["d36"],
            tags: ["Mastery", "gemfibrozil", "myopathy", "interaction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_009",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Repatha and Praluent produce large LDL reductions by preventing PCSK9 from destroying hepatic LDL receptors. What is the practical downstream result of that mechanism?",
            options: ["More LDL receptors are recycled back to the hepatocyte surface", "Platelets stop making thromboxane A2", "Vitamin K-dependent clotting factors are depleted", "Late sodium current is inhibited", "A daily nitrate-free interval becomes unnecessary"],
            answer: "More LDL receptors are recycled back to the hepatocyte surface",
            explanation: "PCSK9 inhibitors preserve receptor recycling, leaving more LDL receptors on the liver surface to pull LDL cholesterol out of the blood.",
            objective: .moa,
            relatedDrugIds: ["d33", "d34"],
            tags: ["Mastery", "PCSK9", "LDL receptors", "mechanism"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_010",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient with ASCVD still has very high LDL despite maximally tolerated statin therapy and oral add-on treatment, and is willing to use injections. Which class from this module is the typical next LDL-lowering escalation?",
            options: ["PCSK9 inhibitors", "Fibrates", "Omega-3 fatty acids", "Loop diuretics", "P2Y12 inhibitors"],
            answer: "PCSK9 inhibitors",
            explanation: "When LDL remains markedly above goal despite statin-based therapy, PCSK9 inhibitors are the classic injectable escalation because they can produce very large additional LDL reductions.",
            objective: .indication,
            relatedDrugIds: ["d33", "d34"],
            tags: ["Mastery", "PCSK9", "LDL", "indication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_011",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "Vascepa should not be dismissed as just “fish oil” on a quiz. Which statement best identifies icosapent ethyl?",
            options: ["It is a purified EPA product used for hypertriglyceridemia and ASCVD-risk reduction contexts", "It is a fibrate that activates PPAR-alpha", "It is a monoclonal antibody injected every few weeks", "It blocks intestinal cholesterol absorption at NPC1L1", "It irreversibly inhibits platelet COX-1"],
            answer: "It is a purified EPA product used for hypertriglyceridemia and ASCVD-risk reduction contexts",
            explanation: "Icosapent ethyl (Vascepa) is the purified EPA product in this module. It is distinct from fibrates, ezetimibe, and PCSK9 inhibitors.",
            objective: .pearl,
            relatedDrugIds: ["d37"],
            tags: ["Mastery", "icosapent ethyl", "Vascepa", "EPA"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_012",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "When counseling a patient on icosapent ethyl, which additional risk deserves emphasis, especially if the patient also takes anticoagulants or antiplatelets?",
            options: ["Bleeding", "Hyperkalemia", "Bradycardia", "Angioedema", "Dry cough"],
            answer: "Bleeding",
            explanation: "Icosapent ethyl is classically counseled with attention to bleeding risk, particularly when used along with agents that already increase bleeding such as anticoagulants or antiplatelets.",
            objective: .adverseEffect,
            relatedDrugIds: ["d37"],
            tags: ["Mastery", "icosapent ethyl", "bleeding", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_013",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "A patient receives a coronary stent and is told they will need DAPT. Which regimen best fits the classic dual-antiplatelet concept?",
            options: ["Aspirin plus clopidogrel", "Warfarin plus aspirin", "Apixaban plus rivaroxaban", "Enoxaparin plus ticagrelor", "Aspirin plus nitroglycerin"],
            answer: "Aspirin plus clopidogrel",
            explanation: "Classic DAPT pairs aspirin with a P2Y12 inhibitor such as clopidogrel. This combination targets platelet-rich arterial thrombosis after PCI and ACS.",
            objective: .indication,
            relatedDrugIds: ["d38", "d39"],
            tags: ["Mastery", "DAPT", "aspirin", "clopidogrel"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_014",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Clopidogrel is a prodrug, so its antiplatelet effect can be reduced when it is given with which common acid-suppressing drug that inhibits CYP2C19?",
            options: ["Omeprazole", "Famotidine", "Sucralfate", "Nitroglycerin", "Ranolazine"],
            answer: "Omeprazole",
            explanation: "Clopidogrel must be activated by CYP2C19. Omeprazole can blunt that activation, reducing clopidogrel's effect and making the interaction highly testable.",
            objective: .interaction,
            relatedDrugIds: ["d39"],
            tags: ["Mastery", "clopidogrel", "CYP2C19", "interaction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_015",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "A patient taking ticagrelor calls because of new shortness of breath, even though the lung exam is unrevealing. Which high-yield adverse effect should be recognized?",
            options: ["Ticagrelor can cause dyspnea", "Ticagrelor commonly causes bradykinin cough", "Ticagrelor causes ototoxicity", "Ticagrelor causes blue-gray skin discoloration", "Ticagrelor causes gynecomastia"],
            answer: "Ticagrelor can cause dyspnea",
            explanation: "Dyspnea is a classic counseling pearl for ticagrelor. Recognizing this expected adverse effect can prevent unnecessary discontinuation when the timing fits.",
            objective: .adverseEffect,
            relatedDrugIds: ["d40"],
            tags: ["Mastery", "ticagrelor", "dyspnea", "adverse effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_016",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Which comparison between the two P2Y12 inhibitors in this module is most accurate?",
            options: ["Clopidogrel is a CYP2C19-activated prodrug, whereas ticagrelor is direct acting", "Ticagrelor is the prodrug and clopidogrel is direct acting", "Both are COX inhibitors", "Both require aspirin doses above 325 mg for best effect", "Neither meaningfully affects bleeding risk"],
            answer: "Clopidogrel is a CYP2C19-activated prodrug, whereas ticagrelor is direct acting",
            explanation: "Clopidogrel needs metabolic activation, while ticagrelor is direct acting. This difference drives high-yield interaction and counseling distinctions between them.",
            objective: .pearl,
            relatedDrugIds: ["d39", "d40"],
            tags: ["Mastery", "P2Y12", "clopidogrel", "ticagrelor"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_017",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "A patient taking high-dose aspirin complains of ringing in the ears. This classic toxicity clue is called:",
            options: ["Tinnitus/salicylism", "Angioedema", "Bronchospasm", "Loop-diuretic ototoxicity", "Torsades de pointes"],
            answer: "Tinnitus/salicylism",
            explanation: "Tinnitus is the classic pharmacology pearl for salicylate toxicity and should make you think of aspirin exposure, especially at higher doses.",
            objective: .adverseEffect,
            relatedDrugIds: ["d38"],
            tags: ["Mastery", "aspirin", "tinnitus", "salicylism"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_018",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "When comparing drug classes in thrombosis, antiplatelet agents such as aspirin and P2Y12 inhibitors are especially important for preventing which type of clot?",
            options: ["Platelet-rich arterial thrombosis", "Venous stasis clots in DVT", "Mechanical-valve thrombosis treated only with warfarin", "Hyperkalemia-related arrhythmias", "Nitrate tolerance"],
            answer: "Platelet-rich arterial thrombosis",
            explanation: "Antiplatelets are classically most important for arterial, platelet-rich clots such as those involved in ACS and after stenting, whereas anticoagulants are central for venous and cardioembolic clot prevention.",
            objective: .classId,
            relatedDrugIds: ["d38", "d39", "d40", "d41", "d42", "d43", "d44"],
            tags: ["Mastery", "antiplatelet", "arterial clots", "comparison"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_019",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient on warfarin dramatically increases daily spinach smoothies. If the dose is unchanged, which effect is most likely?",
            options: ["INR may fall and anticoagulation may weaken", "INR will always rise sharply", "Apixaban levels will rise", "Platelet function will be irreversibly blocked", "QT interval will prolong"],
            answer: "INR may fall and anticoagulation may weaken",
            explanation: "Warfarin effectiveness depends on stable vitamin K intake. A sudden increase in vitamin K-rich foods can lower the INR and reduce anticoagulation.",
            objective: .interaction,
            relatedDrugIds: ["d41"],
            tags: ["Mastery", "warfarin", "vitamin K", "diet"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_020",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Which antibiotic is classically remembered for pushing warfarin patients toward over-anticoagulation and a higher INR?",
            options: ["Trimethoprim/sulfamethoxazole", "Amoxicillin", "Nitrofurantoin", "Oseltamivir", "Metformin"],
            answer: "Trimethoprim/sulfamethoxazole",
            explanation: "TMP-SMX is a classic warfarin interaction pearl and is frequently tested because it can significantly increase INR and bleeding risk.",
            objective: .interaction,
            relatedDrugIds: ["d41"],
            tags: ["Mastery", "warfarin", "TMP-SMX", "INR"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_021",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "Soon after starting warfarin, a patient develops a painful dark skin lesion. Which rare but classic early complication should come to mind?",
            options: ["Warfarin-induced skin necrosis", "Heparin-induced thrombocytopenia", "Nitrate tolerance", "Digoxin immune Fab reaction", "Salicylate ototoxicity"],
            answer: "Warfarin-induced skin necrosis",
            explanation: "Warfarin skin necrosis is a classic early complication tied to transient protein C depletion and is an important high-yield adverse effect to recognize.",
            objective: .adverseEffect,
            relatedDrugIds: ["d41"],
            tags: ["Mastery", "warfarin", "skin necrosis", "adverse effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_022",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "Life-threatening bleeding on warfarin is being treated emergently. Which reversal strategy is most classically associated with warfarin?",
            options: ["Vitamin K plus 4-factor PCC", "Digoxin immune Fab", "Protamine sulfate alone", "Adenosine with saline flush", "A daily nitrate-free interval"],
            answer: "Vitamin K plus 4-factor PCC",
            explanation: "Severe warfarin-associated bleeding is classically reversed with vitamin K plus rapid factor replacement, commonly 4-factor PCC.",
            objective: .pearl,
            relatedDrugIds: ["d41"],
            tags: ["Mastery", "warfarin", "reversal", "bleeding"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_023",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "Among the common oral factor Xa inhibitors in this module, which drug is usually remembered as the twice-daily option rather than the once-daily one?",
            options: ["Apixaban", "Rivaroxaban", "Warfarin", "Enoxaparin", "Aspirin"],
            answer: "Apixaban",
            explanation: "Apixaban is classically remembered as the twice-daily oral factor Xa inhibitor, whereas rivaroxaban is often remembered as the once-daily option in several common settings.",
            objective: .dosing,
            relatedDrugIds: ["d43", "d42"],
            tags: ["Mastery", "apixaban", "rivaroxaban", "dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_024",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "Which counseling pearl is especially high-yield for rivaroxaban when used at common treatment or AFib doses?",
            options: ["Take it with food", "Keep vitamin K intake at zero", "Allow a nitrate-free interval daily", "Push it rapidly IV with a flush", "Take it only at bedtime with grapefruit juice"],
            answer: "Take it with food",
            explanation: "Rivaroxaban is classically tied to the “take with food” pearl for common higher-dose regimens, helping support absorption and memorability.",
            objective: .dosing,
            relatedDrugIds: ["d42"],
            tags: ["Mastery", "rivaroxaban", "food", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_025",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Direct oral factor Xa inhibitors share an important boxed-warning concept. What is it?",
            options: ["Abrupt discontinuation can increase thrombotic risk", "They require routine INR testing", "They are preferred over warfarin for mechanical valves", "They are safe throughout pregnancy", "They commonly cause bradykinin cough"],
            answer: "Abrupt discontinuation can increase thrombotic risk",
            explanation: "A high-yield DOAC boxed-warning concept is that stopping therapy prematurely without another anticoagulant in place can raise the risk of thrombosis.",
            objective: .pearl,
            relatedDrugIds: ["d42", "d43"],
            tags: ["Mastery", "DOAC", "boxed warning", "thrombosis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_026",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Which anticoagulant from this subsection is the classic bridge used while waiting for warfarin to become therapeutic?",
            options: ["Enoxaparin", "Apixaban", "Rivaroxaban", "Aspirin", "Ticagrelor"],
            answer: "Enoxaparin",
            explanation: "Because warfarin takes time to become therapeutic, enoxaparin is the classic bridge used when immediate anticoagulation is needed.",
            objective: .pearl,
            relatedDrugIds: ["d44", "d41"],
            tags: ["Mastery", "warfarin bridge", "enoxaparin", "anticoagulation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_027",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "Routine INR testing is not used for enoxaparin, but in select patients such as pregnancy, severe renal impairment, or extreme body size, which lab may be followed?",
            options: ["Anti-factor Xa level", "INR", "TSH", "Troponin", "BNP"],
            answer: "Anti-factor Xa level",
            explanation: "Enoxaparin is not routinely monitored with INR. In select situations, anti-factor Xa levels may be checked to better gauge anticoagulant exposure.",
            objective: .monitoring,
            relatedDrugIds: ["d44"],
            tags: ["Mastery", "enoxaparin", "monitoring", "anti-Xa"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_028",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient on enoxaparin develops a falling platelet count and a new thrombosis. Which high-yield adverse effect of heparin products should be suspected?",
            options: ["Heparin-induced thrombocytopenia", "Rhabdomyolysis", "Tinnitus", "Angioedema", "Torsades de pointes"],
            answer: "Heparin-induced thrombocytopenia",
            explanation: "A drop in platelets together with new thrombosis while on a heparin product should make you think of HIT, a classic high-yield complication.",
            objective: .adverseEffect,
            relatedDrugIds: ["d44"],
            tags: ["Mastery", "enoxaparin", "HIT", "adverse effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_029",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient wants a daily pill to reduce how often stable angina occurs during the week, not a medication meant to abort chest pain that has already started. Which drug from this subsection best matches that goal?",
            options: ["Isosorbide mononitrate", "Nitroglycerin sublingual", "Adenosine", "Aspirin", "Enoxaparin"],
            answer: "Isosorbide mononitrate",
            explanation: "Isosorbide mononitrate is a long-acting oral nitrate used for angina prophylaxis. It is not the rescue medication for chest pain happening right now.",
            objective: .indication,
            relatedDrugIds: ["d65"],
            tags: ["Mastery", "Imdur", "angina prophylaxis", "nitrate"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_030",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "One nitrate from this subsection is tied to the hydralazine combination pearl in HFrEF. Which drug is it?",
            options: ["Isosorbide dinitrate", "Isosorbide mononitrate", "Nitroglycerin sublingual", "Nitroglycerin IV", "Ranolazine"],
            answer: "Isosorbide dinitrate",
            explanation: "Isosorbide dinitrate is the nitrate classically linked with hydralazine in the HFrEF combination pearl.",
            objective: .pearl,
            relatedDrugIds: ["d66"],
            tags: ["Mastery", "Isordil", "HFrEF", "hydralazine"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_031",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Ranolazine helps chronic angina through a mechanism distinct from nitrates and beta blockers. Which mechanism best matches ranolazine?",
            options: ["Inhibition of the late sodium current", "Irreversible COX-1 inhibition", "Direct factor Xa inhibition", "Neprilysin inhibition", "Transient AV nodal block with an ultra-short half-life"],
            answer: "Inhibition of the late sodium current",
            explanation: "Ranolazine is the antianginal in this module known for inhibiting the late sodium current, which distinguishes it from nitrates and traditional hemodynamic antianginals.",
            objective: .moa,
            relatedDrugIds: ["d67"],
            tags: ["Mastery", "ranolazine", "mechanism", "late sodium"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_032",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "Which statement best captures the biggest practical reason ranolazine is attractive in some patients with chronic angina?",
            options: ["It usually has little effect on heart rate or blood pressure", "It works within 1 minute for acute angina", "It is preferred for mechanical heart valves", "It is a potassium-sparing diuretic", "It reverses digoxin toxicity"],
            answer: "It usually has little effect on heart rate or blood pressure",
            explanation: "Ranolazine is especially useful when more angina control is needed but additional lowering of heart rate or blood pressure would be poorly tolerated.",
            objective: .pearl,
            relatedDrugIds: ["d67"],
            tags: ["Mastery", "ranolazine", "HR", "BP"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_033",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Long-acting nitrates are often scheduled with a daily nitrate-free interval. Why?",
            options: ["To reduce tolerance", "To prevent CYP2C19 inhibition", "To keep INR in range", "To avoid platelet rebound", "To reverse hyperkalemia"],
            answer: "To reduce tolerance",
            explanation: "Continuous nitrate exposure leads to tolerance. A daily nitrate-free interval helps preserve antianginal effectiveness.",
            objective: .pearl,
            relatedDrugIds: ["d65", "d66"],
            tags: ["Mastery", "nitrates", "tolerance", "nitrate-free interval"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_034",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Which ECG-related adverse effect is most important to remember with ranolazine?",
            options: ["QT prolongation", "Widened QRS from class IC blockade", "PR shortening", "ST elevation from vasospasm", "Complete AV silence lasting seconds"],
            answer: "QT prolongation",
            explanation: "QT prolongation is the classic ECG-based safety pearl for ranolazine and helps distinguish it from the nitrate drugs in this subsection.",
            objective: .adverseEffect,
            relatedDrugIds: ["d67"],
            tags: ["Mastery", "ranolazine", "QT", "adverse effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_035",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .easy,
            question: "The antiarrhythmic sold as Cordarone or Pacerone is remembered as highly effective but highly toxic. Which generic drug is it?",
            options: ["Amiodarone", "Dronedarone", "Digoxin", "Sotalol", "Flecainide"],
            answer: "Amiodarone",
            explanation: "Cordarone and Pacerone are brand names for amiodarone, the broad-coverage antiarrhythmic known for both effectiveness and extensive toxicity monitoring.",
            objective: .brandGeneric,
            relatedDrugIds: ["d68"],
            tags: ["Mastery", "amiodarone", "Cordarone", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_036",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient stabilized on warfarin is started on amiodarone for rhythm control. What interaction pearl should you remember?",
            options: ["INR can rise because amiodarone can increase warfarin effect", "Warfarin becomes ineffective because amiodarone blocks vitamin K", "Amiodarone must be taken with an evening meal to work", "Amiodarone immediately reverses warfarin", "There is no meaningful interaction between the two drugs"],
            answer: "INR can rise because amiodarone can increase warfarin effect",
            explanation: "Amiodarone is a classic interaction culprit with warfarin and can increase anticoagulant effect, making INR monitoring and dose adjustment important.",
            objective: .interaction,
            relatedDrugIds: ["d68", "d41"],
            tags: ["Mastery", "amiodarone", "warfarin", "interaction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_037",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Which monitoring bundle best fits long-term amiodarone therapy?",
            options: ["Thyroid, liver, lung, and eye monitoring", "INR only", "Anti-factor Xa only", "Creatine kinase only", "Daily platelet-aggregation testing"],
            answer: "Thyroid, liver, lung, and eye monitoring",
            explanation: "Amiodarone is classically monitored with a broad organ-toxicity checklist: thyroid, liver, lungs, and eyes are the highest-yield systems to remember.",
            objective: .monitoring,
            relatedDrugIds: ["d68"],
            tags: ["Mastery", "amiodarone", "monitoring", "toxicity"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_038",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "Dronedarone is often described as an “amiodarone cousin.” Which statement is most accurate?",
            options: ["It has fewer thyroid/pulmonary issues but is avoided in permanent AFib or advanced heart failure", "It is identical to amiodarone but shorter acting", "It is preferred for structural heart disease after MI", "It is mainly used for acute SVT termination by rapid IV push", "It is a cardiac glycoside"],
            answer: "It has fewer thyroid/pulmonary issues but is avoided in permanent AFib or advanced heart failure",
            explanation: "Dronedarone is structurally related to amiodarone but remembered for fewer thyroid and pulmonary issues. It is also classically avoided in permanent AFib and advanced heart failure.",
            objective: .contraindication,
            relatedDrugIds: ["d69"],
            tags: ["Mastery", "dronedarone", "contraindications", "comparison"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_039",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "Sotalol stands out because it is both a beta blocker and a class III antiarrhythmic. Why is inpatient initiation often recommended?",
            options: ["QT prolongation can trigger torsades de pointes", "It requires a 36-hour ACE washout", "It must be titrated with INR checks", "It rapidly causes heparin-induced thrombocytopenia", "It must always be infused through non-PVC tubing"],
            answer: "QT prolongation can trigger torsades de pointes",
            explanation: "Sotalol has a classic torsades risk because it prolongs the QT interval, which is why monitored initiation and ECG follow-up are high-yield pearls.",
            objective: .monitoring,
            relatedDrugIds: ["d70"],
            tags: ["Mastery", "sotalol", "torsades", "QT"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_040",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "Which patient is the poorest candidate for flecainide?",
            options: ["Someone with prior MI and structural heart disease", "Someone with an otherwise normal heart and paroxysmal SVT", "Someone with mild hyperlipidemia", "Someone needing DVT prophylaxis", "Someone needing chronic angina prophylaxis"],
            answer: "Someone with prior MI and structural heart disease",
            explanation: "Flecainide is a class IC antiarrhythmic that is classically avoided in patients with structural heart disease or coronary disease because of proarrhythmic risk.",
            objective: .contraindication,
            relatedDrugIds: ["d71"],
            tags: ["Mastery", "flecainide", "structural heart disease", "contraindication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_041",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient on digoxin reports nausea and yellow-green halos around lights. Which diagnosis is most likely?",
            options: ["Digoxin toxicity", "Aspirin salicylism", "Nitrate tolerance", "Statin myopathy", "Clopidogrel-associated TTP"],
            answer: "Digoxin toxicity",
            explanation: "Yellow-green vision changes together with GI symptoms are classic digoxin-toxicity clues and remain among the highest-yield adverse-effect associations in cardiovascular pharmacology.",
            objective: .adverseEffect,
            relatedDrugIds: ["d72"],
            tags: ["Mastery", "digoxin", "halos", "toxicity"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_042",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "A patient has life-threatening digoxin toxicity with bradyarrhythmia and severe symptoms. Which reversal strategy is classically used?",
            options: ["Digoxin immune Fab", "Vitamin K plus 4-factor PCC", "Protamine sulfate", "Adenosine flush", "A nitrate-free interval"],
            answer: "Digoxin immune Fab",
            explanation: "Digoxin immune Fab is the classic antidote for severe digoxin toxicity and is a major must-know reversal pearl for this subsection.",
            objective: .pearl,
            relatedDrugIds: ["d72"],
            tags: ["Mastery", "digoxin", "antidote", "reversal"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_043",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .medium,
            question: "A patient with HFrEF is aggressively diuresed with furosemide from Module 1 and then develops digoxin toxicity more easily than expected. Which electrolyte abnormality from the loop diuretic most likely contributed?",
            options: ["Hypokalemia", "Hyperkalemia", "Hypercalcemia", "Hypermagnesemia", "Hypernatremia"],
            answer: "Hypokalemia",
            explanation: "Loop diuretics like furosemide can cause hypokalemia, and low potassium makes digoxin toxicity more likely even if the dose of digoxin has not changed.",
            objective: .interaction,
            relatedDrugIds: ["d11", "d72"],
            tags: ["Mastery", "cross-module", "furosemide", "digoxin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_044",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "A patient with chronic stable angina is already taking metoprolol succinate and valsartan from Module 1, but heart rate and blood pressure are both too low to tolerate more hemodynamic suppression. Which Module 2 drug is a smart add-on because it usually does not significantly lower either?",
            options: ["Ranolazine", "Nitroglycerin sublingual", "Isosorbide dinitrate", "Sotalol", "Enoxaparin"],
            answer: "Ranolazine",
            explanation: "Ranolazine is a strong choice when more angina control is needed but additional lowering of heart rate or blood pressure would be problematic, making it a classic cross-module comparison pearl.",
            objective: .mixedReview,
            relatedDrugIds: ["d14", "d6", "d67"],
            tags: ["Mastery", "cross-module", "ranolazine", "angina"],
            source: .curated
        ),
        .multipleChoice(
            id: "q2g_add_045",
            subsectionId: Self.masteringCv2SubsectionId,
            difficulty: .hard,
            question: "A patient already taking verapamil from Module 1 is started on digoxin for additional rate control. Which problem deserves especially close monitoring because both can slow AV nodal conduction?",
            options: ["Bradycardia or AV block", "Dry cough", "Hyperuricemia", "Ototoxicity", "Myopathy"],
            answer: "Bradycardia or AV block",
            explanation: "Verapamil and digoxin both affect AV nodal conduction, so excessive bradycardia or AV block is the high-yield risk to monitor when they are combined.",
            objective: .interaction,
            relatedDrugIds: ["d26", "d72"],
            tags: ["Mastery", "cross-module", "verapamil", "digoxin"],
            source: .curated
        )

    ]
}
