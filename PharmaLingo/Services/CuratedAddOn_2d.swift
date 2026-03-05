// PharmaLingo — Module 2d (Anticoagulants)
// Curated Add-On Question Pack (45 questions)
// IDs: q2d_add_001 ... q2d_add_045
//
// Integration options:
//
// Option A (recommended, clean diff):
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 2d exists, then append:
//
//    if bank["2d"] == nil { bank["2d"] = [] }
//    bank["2d"]?.append(contentsOf: Self.curatedAddOnQuestions_2d)
//
// Option B (quick paste):
// - Create a new block `bank["2d"] = [` in populateCuratedBank(_:), then paste the questions below.
//
// Notes:
// - All questions are single-best-answer (5 choices each).
// - Stems are written to avoid exact duplicates of the current generator templates.
// - Objectives + relatedDrugIds are set to support spaced repetition and mastery tracking.

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_2d: [Question] = [

        .multipleChoice(
            id: "q2d_add_001",
            subsectionId: "2d",
            difficulty: .easy,
            question: "A discharge summary says the patient with a mechanical mitral valve should continue Coumadin long term because it remains the classic anticoagulant for mechanical valves. What is the generic name of Coumadin?",
            options: ["Warfarin", "Apixaban", "Rivaroxaban", "Enoxaparin", "Clopidogrel"],
            answer: "Warfarin",
            explanation: "Coumadin is the brand name for warfarin. Tying the brand to the mechanical-valve indication helps learners remember why warfarin still matters even in the DOAC era.",
            objective: .brandGeneric,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "Coumadin", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_002",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Warfarin is the traditional vitamin K antagonist used for AFib, DVT/PE, and mechanical heart valves. Which brand name is commonly associated with warfarin?",
            options: ["Coumadin", "Eliquis", "Xarelto", "Lovenox", "Plavix"],
            answer: "Coumadin",
            explanation: "Warfarin is commonly recognized by the brand name Coumadin. This pair is high yield because warfarin appears often on inpatient and outpatient med lists.",
            objective: .genericBrand,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "Coumadin", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_003",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Warfarin prevents the liver from making fully functional vitamin K-dependent clotting factors. Which set of factors is most directly reduced by warfarin therapy?",
            options: ["II, VII, IX, and X", "I, V, VIII, and XIII", "IIa and Xa only", "Protein C only", "XII and XI only"],
            answer: "II, VII, IX, and X",
            explanation: "Warfarin inhibits vitamin K epoxide reductase, so the liver cannot properly activate vitamin K-dependent factors II, VII, IX, and X. It also lowers proteins C and S, which explains some early-warfarin pearls.",
            objective: .moa,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "MOA", "vitamin K"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_004",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Because warfarin has a narrow therapeutic window and many interactions, which laboratory test is routinely followed to guide chronic dosing?",
            options: ["INR", "aPTT", "Anti-Xa level", "Platelet function assay", "Troponin"],
            answer: "INR",
            explanation: "Warfarin is monitored with the INR. This is one of the biggest practical differences between warfarin and the oral factor Xa inhibitors in this subsection.",
            objective: .monitoring,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "INR", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_005",
            subsectionId: "2d",
            difficulty: .medium,
            question: "A patient asks why anyone still uses warfarin now that Eliquis and Xarelto exist. Which scenario is the classic reason warfarin is still chosen over these direct oral anticoagulants?",
            options: ["Mechanical heart valve", "Seasonal allergies", "Stable angina", "Hyperlipidemia", "Migraine prophylaxis"],
            answer: "Mechanical heart valve",
            explanation: "Warfarin remains the high-yield anticoagulant for mechanical heart valves. Apixaban and rivaroxaban are commonly used for nonvalvular AFib and DVT/PE, but not mechanical valves.",
            objective: .indication,
            relatedDrugIds: ["d41", "d42", "d43"],
            tags: ["Warfarin", "mechanical valve", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_006",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Warfarin crosses the placenta and can cause fetal harm. In which patient should warfarin generally be avoided because of this high-yield contraindication?",
            options: ["A pregnant patient needing anticoagulation", "A patient with allergic rhinitis", "A patient with GERD", "A patient with chronic constipation", "A patient with eczema"],
            answer: "A pregnant patient needing anticoagulation",
            explanation: "Warfarin is classically avoided in pregnancy because it is teratogenic. This makes pregnancy a key situation where another anticoagulant is usually preferred.",
            objective: .contraindication,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "pregnancy", "contraindication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_007",
            subsectionId: "2d",
            difficulty: .hard,
            question: "A patient is newly started on warfarin and then develops a painful dark skin lesion early in therapy. This rare complication is most strongly associated with warfarin's early drop in natural anticoagulants, especially:",
            options: ["Protein C", "Fibrinogen", "Antithrombin", "Albumin", "Plasminogen"],
            answer: "Protein C",
            explanation: "Early in therapy, warfarin can lower protein C faster than some procoagulant factors. That transient imbalance helps explain the rare but classic board-style complication of warfarin-induced skin necrosis.",
            objective: .pearl,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "protein C", "skin necrosis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_008",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Warfarin does not dissolve an acute clot and takes time to become fully effective. What is the high-yield practical implication when treating a brand-new DVT?",
            options: ["Use a faster-acting anticoagulant first or alongside it until warfarin is therapeutic", "Double the first warfarin dose and stop after 24 hours", "Skip lab monitoring for the first week", "Take it only as needed for leg pain", "Give it by intramuscular injection for faster effect"],
            answer: "Use a faster-acting anticoagulant first or alongside it until warfarin is therapeutic",
            explanation: "Warfarin has a delayed onset because it affects synthesis of new clotting factors rather than directly inactivating existing ones. Acute clot treatment often requires bridging with a faster-acting anticoagulant.",
            objective: .pearl,
            relatedDrugIds: ["d41", "d44"],
            tags: ["Warfarin", "bridging", "acute DVT"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_009",
            subsectionId: "2d",
            difficulty: .medium,
            question: "A patient on warfarin suddenly starts drinking large spinach smoothies every day. If the dose is not adjusted, what is the most likely effect of this increased vitamin K intake?",
            options: ["INR may fall and anticoagulation may weaken", "INR will always rise sharply", "Platelet count will become zero", "Drug absorption will stop completely", "Warfarin will become a direct Xa inhibitor"],
            answer: "INR may fall and anticoagulation may weaken",
            explanation: "Leafy greens contain vitamin K, which can counteract warfarin's effect. The key counseling pearl is consistency, not complete avoidance of healthy foods.",
            objective: .interaction,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "vitamin K", "diet interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_010",
            subsectionId: "2d",
            difficulty: .hard,
            question: "A patient on stable warfarin therapy is prescribed trimethoprim/sulfamethoxazole for a skin infection. What is the classic anticoagulation concern with adding this antibiotic?",
            options: ["INR can rise, increasing bleeding risk", "Warfarin instantly stops working", "It prevents any vitamin K from being absorbed for life", "It causes predictable thrombocytopenia in all patients", "It reverses warfarin the same way vitamin K does"],
            answer: "INR can rise, increasing bleeding risk",
            explanation: "Trimethoprim/sulfamethoxazole is a famous warfarin interaction. The high-yield takeaway is that antibiotics can increase INR and bleeding risk, so closer monitoring is often needed.",
            objective: .interaction,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "TMP-SMX", "interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_011",
            subsectionId: "2d",
            difficulty: .medium,
            question: "A patient taking warfarin develops serious bleeding. Which reversal strategy is most classically associated with warfarin?",
            options: ["Vitamin K", "Protamine sulfate", "Naloxone", "Atropine", "Flumazenil"],
            answer: "Vitamin K",
            explanation: "Vitamin K is the classic reversal agent tied to warfarin because warfarin blocks vitamin K recycling. In major bleeding, more rapid supportive reversal strategies may also be used clinically.",
            objective: .pearl,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "vitamin K", "reversal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_012",
            subsectionId: "2d",
            difficulty: .medium,
            question: "For many common warfarin indications such as nonvalvular AFib or DVT/PE, the usual target INR is closest to:",
            options: ["2 to 3", "0.5 to 1", "1 to 1.5", "4 to 5", "6 to 8"],
            answer: "2 to 3",
            explanation: "A typical warfarin goal for many common indications is an INR of 2 to 3. Remembering the usual range helps learners interpret whether a patient is subtherapeutic or supratherapeutic.",
            objective: .monitoring,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "INR goal", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_013",
            subsectionId: "2d",
            difficulty: .medium,
            question: "An older patient with nonvalvular AFib wants an oral anticoagulant that does not require routine INR checks and is typically taken twice daily. Which medication best fits that description?",
            options: ["Apixaban", "Warfarin", "Enoxaparin", "Nitroglycerin", "Clopidogrel"],
            answer: "Apixaban",
            explanation: "Apixaban is a direct oral factor Xa inhibitor used for nonvalvular AFib and DVT/PE. It is a classic choice when learners need to contrast DOAC convenience with warfarin monitoring.",
            objective: .indication,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "AFib", "no INR"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_014",
            subsectionId: "2d",
            difficulty: .easy,
            question: "A patient is discharged after a DVT on Eliquis, an oral anticoagulant used for DVT/PE treatment and stroke prevention in nonvalvular AFib. What is the generic name of Eliquis?",
            options: ["Apixaban", "Rivaroxaban", "Warfarin", "Enoxaparin", "Aspirin"],
            answer: "Apixaban",
            explanation: "Eliquis is the brand name for apixaban. This brand-generic pair is high yield because Eliquis is a very common medication name seen on discharge lists.",
            objective: .brandGeneric,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "Eliquis", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_015",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Apixaban is a direct oral anticoagulant frequently chosen for nonvalvular AFib and DVT/PE. Which brand name corresponds to apixaban?",
            options: ["Eliquis", "Xarelto", "Coumadin", "Lovenox", "Brilinta"],
            answer: "Eliquis",
            explanation: "Apixaban is sold as Eliquis. Linking the indication and the brand helps reinforce recognition in medication reconciliation scenarios.",
            objective: .genericBrand,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "Eliquis", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_016",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Apixaban belongs to the -xaban family of anticoagulants. What is the direct molecular target inhibited by apixaban?",
            options: ["Factor Xa", "Thrombin only", "COX-1", "P2Y12 receptor", "Vitamin K epoxide reductase"],
            answer: "Factor Xa",
            explanation: "Apixaban directly inhibits factor Xa. That is why it is grouped with rivaroxaban rather than with warfarin or antiplatelet drugs.",
            objective: .moa,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "factor Xa", "MOA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_017",
            subsectionId: "2d",
            difficulty: .hard,
            question: "A patient with a mechanical valve asks to switch from warfarin to apixaban so they can avoid INR checks. Which answer is most consistent with the high-yield pharmacology distinction between these drugs?",
            options: ["Warfarin remains the classic anticoagulant for mechanical valves", "Apixaban is preferred for all valve replacements", "Apixaban is safer only if combined with aspirin 325 mg", "Mechanical valves do not require any anticoagulation", "Apixaban should replace warfarin whenever INR is inconvenient"],
            answer: "Warfarin remains the classic anticoagulant for mechanical valves",
            explanation: "Apixaban is commonly used for nonvalvular AFib and DVT/PE, but warfarin is the classic choice associated with mechanical heart valves. This distinction is one of the most testable differences in the subsection.",
            objective: .contraindication,
            relatedDrugIds: ["d41", "d43"],
            tags: ["Apixaban", "Warfarin", "mechanical valve"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_018",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Bleeding is the most important adverse effect to counsel on with apixaban. Which patient report should raise the most concern for a clinically significant bleed?",
            options: ["Black tarry stools", "A mild dry cough", "Constipation for one day", "A runny nose in spring", "Transient flushing after exercise"],
            answer: "Black tarry stools",
            explanation: "Melena, or black tarry stools, can signal gastrointestinal bleeding. Because apixaban is an anticoagulant, any major or occult bleeding symptom deserves attention.",
            objective: .adverseEffect,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "bleeding", "melena"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_019",
            subsectionId: "2d",
            difficulty: .hard,
            question: "A clinician starts apixaban and explains that routine INR checks are not needed. Which baseline information is still especially important to follow over time because it affects safe anticoagulant use?",
            options: ["CBC and renal function", "TSH and vitamin D level", "Serum amylase and lipase", "Platelet function assay only", "Fasting lipid panel only"],
            answer: "CBC and renal function",
            explanation: "Even without routine INR monitoring, anticoagulants like apixaban still require practical safety monitoring. Hemoglobin/hematocrit and kidney function help clinicians watch for bleeding risk and dose-appropriateness.",
            objective: .monitoring,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "CBC", "renal function"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_020",
            subsectionId: "2d",
            difficulty: .hard,
            question: "Which co-medication is a classic example of a strong CYP3A4/P-gp inhibitor that can increase apixaban exposure and bleeding risk?",
            options: ["Ketoconazole", "Famotidine", "Acetaminophen", "Levothyroxine", "Polyethylene glycol"],
            answer: "Ketoconazole",
            explanation: "Ketoconazole is a high-yield example of a strong CYP3A4/P-gp inhibitor that can raise apixaban levels. The teaching point is to watch for interacting drugs, not just the anticoagulant itself.",
            objective: .interaction,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "ketoconazole", "interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_021",
            subsectionId: "2d",
            difficulty: .hard,
            question: "Apixaban carries an important boxed-warning concept shared by other direct oral anticoagulants. Abruptly stopping apixaban without another anticoagulant on board can increase the risk of:",
            options: ["Thrombotic events such as stroke or recurrent clot", "Profound hypoglycemia", "Irreversible hearing loss", "Severe hyperkalemia", "Drug-induced lupus"],
            answer: "Thrombotic events such as stroke or recurrent clot",
            explanation: "Stopping apixaban too early can leave the patient unprotected and increase the risk of stroke or recurrent thrombosis. Anticoagulants should not be stopped casually without a plan.",
            objective: .pearl,
            relatedDrugIds: ["d43"],
            tags: ["Apixaban", "boxed warning", "thrombosis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_022",
            subsectionId: "2d",
            difficulty: .easy,
            question: "A patient says, \"I remember one of the common oral anticoagulants is usually taken twice daily rather than once daily.\" Which anticoagulant from this subsection best matches that pearl?",
            options: ["Apixaban", "Rivaroxaban", "Warfarin", "Enoxaparin", "Aspirin"],
            answer: "Apixaban",
            explanation: "Apixaban is classically remembered as the twice-daily oral factor Xa inhibitor, while rivaroxaban is often remembered as once daily for AFib.",
            objective: .dosing,
            relatedDrugIds: ["d43", "d42"],
            tags: ["Apixaban", "twice daily", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_023",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Rivaroxaban is an oral anticoagulant used for stroke prevention in nonvalvular AFib and for DVT/PE treatment. Which brand name corresponds to rivaroxaban?",
            options: ["Xarelto", "Eliquis", "Coumadin", "Lovenox", "Nitrostat"],
            answer: "Xarelto",
            explanation: "Rivaroxaban is marketed as Xarelto. This brand-generic pair is worth memorizing because it appears often in outpatient anticoagulation lists.",
            objective: .genericBrand,
            relatedDrugIds: ["d42"],
            tags: ["Rivaroxaban", "Xarelto", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_024",
            subsectionId: "2d",
            difficulty: .easy,
            question: "A patient with a recent PE is told to continue Xarelto after discharge. What is the generic medication in Xarelto?",
            options: ["Rivaroxaban", "Apixaban", "Warfarin", "Enoxaparin", "Ticagrelor"],
            answer: "Rivaroxaban",
            explanation: "Xarelto is the brand name for rivaroxaban. Pairing the brand with the PE indication helps reinforce recognition in real clinical language.",
            objective: .brandGeneric,
            relatedDrugIds: ["d42"],
            tags: ["Rivaroxaban", "Xarelto", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_025",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Rivaroxaban and apixaban are grouped together pharmacologically because both directly inhibit which coagulation factor?",
            options: ["Factor Xa", "Factor VIII", "Thrombin only", "Factor XIII", "Cyclooxygenase-1"],
            answer: "Factor Xa",
            explanation: "Both rivaroxaban and apixaban are direct factor Xa inhibitors. This is the key mechanism that separates them from warfarin and from antiplatelet drugs.",
            objective: .classId,
            relatedDrugIds: ["d42", "d43"],
            tags: ["Rivaroxaban", "Apixaban", "factor Xa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_026",
            subsectionId: "2d",
            difficulty: .medium,
            question: "A patient with AFib starts rivaroxaban. Which counseling point is especially high yield for the common higher-dose AFib regimen?",
            options: ["Take it with food, often with the evening meal", "Take it only on days with symptoms", "Avoid all leafy greens forever", "Inject it into the abdomen", "Check INR every morning"],
            answer: "Take it with food, often with the evening meal",
            explanation: "Rivaroxaban is classically tied to the counseling pearl 'take with food,' especially for the common AFib dosing pattern. That helps learners distinguish it from apixaban.",
            objective: .dosing,
            relatedDrugIds: ["d42"],
            tags: ["Rivaroxaban", "food", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_027",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Compared with warfarin, rivaroxaban is attractive to many patients because it usually does NOT require routine:",
            options: ["INR monitoring", "Blood pressure checks", "Weight measurement", "Lipid panels", "A1c testing"],
            answer: "INR monitoring",
            explanation: "Rivaroxaban is a DOAC, so routine INR monitoring is not a built-in part of therapy the way it is with warfarin. That convenience is a major teaching contrast between the two drugs.",
            objective: .monitoring,
            relatedDrugIds: ["d42", "d41"],
            tags: ["Rivaroxaban", "INR", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_028",
            subsectionId: "2d",
            difficulty: .easy,
            question: "A learner is trying to remember which common oral factor Xa inhibitor is usually taken once daily for AFib rather than twice daily. Which drug best fits that memory aid?",
            options: ["Rivaroxaban", "Apixaban", "Warfarin", "Enoxaparin", "Aspirin"],
            answer: "Rivaroxaban",
            explanation: "Rivaroxaban is often remembered as the once-daily oral factor Xa inhibitor for AFib, while apixaban is the commonly tested twice-daily option.",
            objective: .dosing,
            relatedDrugIds: ["d42", "d43"],
            tags: ["Rivaroxaban", "once daily", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_029",
            subsectionId: "2d",
            difficulty: .hard,
            question: "A patient taking rivaroxaban is scheduled for an epidural procedure. Which boxed-warning complication should clinicians keep in mind with factor Xa inhibitors around neuraxial anesthesia or spinal procedures?",
            options: ["Spinal or epidural hematoma", "Severe bronchospasm", "Corneal deposits", "Acute pancreatitis", "Tardive dyskinesia"],
            answer: "Spinal or epidural hematoma",
            explanation: "A high-yield boxed-warning concept for rivaroxaban is spinal/epidural hematoma risk around neuraxial procedures. This can lead to serious neurologic injury if not recognized.",
            objective: .contraindication,
            relatedDrugIds: ["d42"],
            tags: ["Rivaroxaban", "neuraxial", "boxed warning"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_030",
            subsectionId: "2d",
            difficulty: .hard,
            question: "Stopping rivaroxaban early without starting another anticoagulant leaves a patient vulnerable to which major problem?",
            options: ["Recurrent thrombosis or stroke", "Profound neutropenia", "Severe hypothyroidism", "Vitamin K deficiency anemia", "Acute angle-closure glaucoma"],
            answer: "Recurrent thrombosis or stroke",
            explanation: "The major boxed-warning concept is that premature discontinuation of rivaroxaban can increase thrombotic risk. Patients should not stop it on their own just because they feel well.",
            objective: .pearl,
            relatedDrugIds: ["d42"],
            tags: ["Rivaroxaban", "thrombosis", "boxed warning"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_031",
            subsectionId: "2d",
            difficulty: .medium,
            question: "A patient on rivaroxaban asks what side effect matters most to watch for at home. Which answer is most accurate?",
            options: ["Bleeding", "Dry cough", "Constipation", "Hyperkalemia", "Ringing in the ears"],
            answer: "Bleeding",
            explanation: "Like the other anticoagulants in this subsection, rivaroxaban's major adverse effect is bleeding. That includes visible bleeding, occult GI bleeding, or excessive bruising.",
            objective: .adverseEffect,
            relatedDrugIds: ["d42"],
            tags: ["Rivaroxaban", "bleeding", "adverse effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_032",
            subsectionId: "2d",
            difficulty: .hard,
            question: "Which added medication would be the most concerning because it can increase rivaroxaban exposure and bleeding risk through CYP3A4/P-gp inhibition?",
            options: ["Ketoconazole", "Docusate", "Famotidine", "Alendronate", "Metformin"],
            answer: "Ketoconazole",
            explanation: "Ketoconazole is a classic strong inhibitor that can raise rivaroxaban levels. This teaches the broader lesson that DOAC safety depends partly on other drugs in the regimen.",
            objective: .interaction,
            relatedDrugIds: ["d42"],
            tags: ["Rivaroxaban", "ketoconazole", "interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_033",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Lovenox is commonly used after surgery or during hospitalization because it can be given by subcutaneous injection for DVT prophylaxis or treatment. What is the generic name of Lovenox?",
            options: ["Enoxaparin", "Warfarin", "Apixaban", "Rivaroxaban", "Aspirin"],
            answer: "Enoxaparin",
            explanation: "Lovenox is the brand name for enoxaparin. This pair is high yield because Lovenox is a very common term in hospital medicine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "Lovenox", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_034",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Enoxaparin is the low-molecular-weight heparin often used for DVT prophylaxis, bridge therapy, and ACS. Which brand name corresponds to enoxaparin?",
            options: ["Lovenox", "Coumadin", "Xarelto", "Eliquis", "Brilinta"],
            answer: "Lovenox",
            explanation: "Enoxaparin is sold as Lovenox. Associating the brand with its injectable route helps distinguish it from the oral anticoagulants in the same subsection.",
            objective: .genericBrand,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "Lovenox", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_035",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Enoxaparin is a low-molecular-weight heparin that works through antithrombin. Its anticoagulant effect is best described as promoting inhibition of:",
            options: ["Factor Xa more than thrombin (IIa)", "Vitamin K epoxide reductase", "P2Y12 receptors", "Platelet COX-1", "Fibrinogen directly"],
            answer: "Factor Xa more than thrombin (IIa)",
            explanation: "Enoxaparin enhances antithrombin activity and inhibits factor Xa more than factor IIa. That mechanism separates LMWH from warfarin and from the direct oral Xa inhibitors.",
            objective: .moa,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "antithrombin", "factor Xa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_036",
            subsectionId: "2d",
            difficulty: .easy,
            question: "Unlike warfarin, apixaban, and rivaroxaban, enoxaparin is usually administered by which route?",
            options: ["Subcutaneous injection", "Oral tablet", "Sublingual tablet", "Transdermal patch", "Inhalation"],
            answer: "Subcutaneous injection",
            explanation: "Enoxaparin is typically given subcutaneously. Its injectable route is one of the fastest ways to distinguish it from the oral anticoagulants in Module 2d.",
            objective: .dosing,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "SubQ", "route"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_037",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Which patient scenario is especially classic for enoxaparin rather than an oral anticoagulant?",
            options: ["A postoperative patient needing DVT prophylaxis", "A patient who needs a nitrate for acute angina", "A patient starting a statin for LDL lowering", "A patient with Raynaud phenomenon", "A patient needing migraine prophylaxis"],
            answer: "A postoperative patient needing DVT prophylaxis",
            explanation: "Enoxaparin is commonly used for postoperative DVT prophylaxis. That hospital-based use pattern helps learners remember why LMWH is still very important even with oral anticoagulants available.",
            objective: .indication,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "post-op", "DVT prophylaxis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_038",
            subsectionId: "2d",
            difficulty: .hard,
            question: "What high-yield adverse effect should students remember with heparin products such as enoxaparin because it involves a drop in platelets plus paradoxical thrombosis risk?",
            options: ["Heparin-induced thrombocytopenia (HIT)", "Torsades de pointes", "Nephrogenic diabetes insipidus", "Gynecomastia", "Stevens-Johnson syndrome"],
            answer: "Heparin-induced thrombocytopenia (HIT)",
            explanation: "HIT is a classic heparin-related adverse effect. Even though enoxaparin is an LMWH, the heparin family association makes HIT an important testable safety pearl.",
            objective: .adverseEffect,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "HIT", "thrombocytopenia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_039",
            subsectionId: "2d",
            difficulty: .easy,
            question: "A patient is learning to self-inject enoxaparin at home. Which mild but common effect near the injection site is worth counseling about?",
            options: ["Bruising or hematoma", "Dry cough", "Tinnitus", "Constipation", "Blurred blue vision"],
            answer: "Bruising or hematoma",
            explanation: "Injection-site bruising or small hematomas are common with enoxaparin because it is given subcutaneously and is an anticoagulant. Patients should still report more serious bleeding.",
            objective: .adverseEffect,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "injection site", "hematoma"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_040",
            subsectionId: "2d",
            difficulty: .hard,
            question: "Routine INR testing is not used for enoxaparin. In select patients such as severe renal impairment, pregnancy, or extreme body weight, which lab may be followed instead?",
            options: ["Anti-Xa level", "INR", "TSH", "Troponin", "Serum uric acid"],
            answer: "Anti-Xa level",
            explanation: "Enoxaparin is not titrated with the INR. In special situations, anti-Xa levels may be used to help assess LMWH effect and dosing.",
            objective: .monitoring,
            relatedDrugIds: ["d44"],
            tags: ["Enoxaparin", "anti-Xa", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_041",
            subsectionId: "2d",
            difficulty: .medium,
            question: "A patient on enoxaparin develops significant bleeding. Which reversal approach is most classically associated with partial reversal of enoxaparin?",
            options: ["Protamine sulfate", "Vitamin K", "Digoxin immune Fab", "Naloxone", "Atropine"],
            answer: "Protamine sulfate",
            explanation: "Protamine sulfate can partially reverse enoxaparin. This contrasts nicely with vitamin K, which is classically associated with warfarin reversal.",
            objective: .pearl,
            relatedDrugIds: ["d44", "d41"],
            tags: ["Enoxaparin", "protamine", "reversal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_042",
            subsectionId: "2d",
            difficulty: .medium,
            question: "Among the anticoagulants in this subsection, which is classically preferred in pregnancy because warfarin is teratogenic and the oral factor Xa inhibitors are generally avoided?",
            options: ["Enoxaparin", "Warfarin", "Apixaban", "Rivaroxaban", "Ticagrelor"],
            answer: "Enoxaparin",
            explanation: "Enoxaparin is the classic anticoagulant associated with pregnancy use when anticoagulation is needed. High-yield contrast: warfarin is teratogenic and usually avoided.",
            objective: .indication,
            relatedDrugIds: ["d44", "d41", "d42", "d43"],
            tags: ["Enoxaparin", "pregnancy", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_043",
            subsectionId: "2d",
            difficulty: .medium,
            question: "A patient asks, \"Which blood thinner in this subsection needs the most counseling about diet consistency and food-drug interactions?\" Which medication best fits that description?",
            options: ["Warfarin", "Apixaban", "Rivaroxaban", "Enoxaparin", "None of them"],
            answer: "Warfarin",
            explanation: "Warfarin is the anticoagulant most strongly tied to vitamin K consistency, INR monitoring, and numerous drug interactions. That practical burden is a major reason DOACs became so popular.",
            objective: .interaction,
            relatedDrugIds: ["d41"],
            tags: ["Warfarin", "diet", "interactions"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_044",
            subsectionId: "2d",
            difficulty: .easy,
            question: "The suffix -xaban is a useful naming clue in pharmacology. In Module 2d, that suffix points to drugs that are best classified as:",
            options: ["Direct factor Xa inhibitors", "Vitamin K antagonists", "Low-molecular-weight heparins", "Antiplatelet COX inhibitors", "Direct thrombin inhibitors used only by IV infusion"],
            answer: "Direct factor Xa inhibitors",
            explanation: "The -xaban suffix is a naming pearl for direct factor Xa inhibitors such as apixaban and rivaroxaban. Suffix recognition can speed up drug-class identification in quiz mode.",
            objective: .suffixId,
            relatedDrugIds: ["d42", "d43"],
            tags: ["-xaban", "factor Xa", "suffix"],
            source: .curated
        ),

        .multipleChoice(
            id: "q2d_add_045",
            subsectionId: "2d",
            difficulty: .hard,
            question: "A patient with a brand-new DVT is started on long-term warfarin, but immediate anticoagulation is needed while the INR is still subtherapeutic. Which medication from this subsection is commonly used as the bridging agent?",
            options: ["Enoxaparin", "Apixaban", "Rivaroxaban", "Aspirin", "Atorvastatin"],
            answer: "Enoxaparin",
            explanation: "Because warfarin works slowly, a faster-acting anticoagulant is often used initially. Enoxaparin is a classic bridging medication for this purpose.",
            objective: .pearl,
            relatedDrugIds: ["d41", "d44"],
            tags: ["Warfarin", "Enoxaparin", "bridging"],
            source: .curated
        )

    ]
}
