// PharmaLingo — Module 9c (Newer Seizure/Tremor Agents)
// Curated Add-On Question Pack (45 questions)
// IDs: q9c_add_001 ... q9c_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 9c exists, then append:
//
//    if bank["9c"] == nil { bank["9c"] = [] }
//    bank["9c"]?.append(contentsOf: Self.curatedAddOnQuestions_9c)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d94 (Lamotrigine / Lamictal), d95 (Levetiracetam / Keppra),
//   d262 (Oxcarbazepine / Trileptal), d263 (Primidone / Mysoline).
//
// Generated on: 2026-03-10

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9c: [Question] = [
        .multipleChoice(
            id: "q9c_add_001",
            subsectionId: "9c",
            difficulty: .easy,
            question: "Lamictal is a newer antiseizure medicine that is also important in bipolar care and is famous for its slow titration schedule. What is the generic name of Lamictal?",
            options: ["Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Primidone", "Valproic acid"],
            answer: "Lamotrigine",
            explanation: "Lamictal is the brand name for lamotrigine, the newer antiepileptic in this subsection that is strongly associated with slow titration because of rash risk.",
            objective: .brandGeneric,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_002",
            subsectionId: "9c",
            difficulty: .easy,
            question: "A patient has been stable on lamotrigine for seizures and mood stabilization. Which brand name matches lamotrigine?",
            options: ["Lamictal", "Keppra", "Trileptal", "Mysoline", "Tegretol"],
            answer: "Lamictal",
            explanation: "Lamotrigine corresponds to the brand name Lamictal.",
            objective: .genericBrand,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_003",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A neurology resident wants a seizure medication from this subsection that also stands out as a mood stabilizer in bipolar disorder. Which drug best fits that teaching pearl?",
            options: ["Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Primidone", "Donepezil"],
            answer: "Lamotrigine",
            explanation: "Lamotrigine is the standout seizure medication in this subsection that also carries a major bipolar mood-stabilizer association.",
            objective: .indication,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "bipolar"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_004",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Lamotrigine helps prevent seizures by stabilizing excitable neurons. Which mechanism best matches lamotrigine?",
            options: ["Blocks voltage-sensitive sodium channels", "Binds synaptic vesicle protein SV2A", "Enhances antithrombin activity", "Irreversibly inhibits COX-1", "Stimulates dopamine D2 receptors"],
            answer: "Blocks voltage-sensitive sodium channels",
            explanation: "Lamotrigine is classically taught as a sodium-channel anticonvulsant that helps stabilize neuronal membranes and reduce excessive excitatory firing.",
            objective: .moa,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_005",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A student notices that lamotrigine is titrated much more slowly than many everyday medications. What is the main reason for that cautious titration?",
            options: ["Rapid titration increases the risk of serious rash including Stevens-Johnson syndrome", "It causes immediate neutropenia if started too quickly", "It always causes severe hypotension at full dose", "It loses effectiveness if given at target dose too early", "It predictably causes pancreatitis during week 1"],
            answer: "Rapid titration increases the risk of serious rash including Stevens-Johnson syndrome",
            explanation: "Lamotrigine is slowly titrated to reduce the risk of serious and potentially life-threatening rash, including Stevens-Johnson syndrome.",
            objective: .adverseEffect,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "SJS", "titration"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_006",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A patient already taking valproic acid is about to start lamotrigine. Which dosing principle is most important to remember?",
            options: ["Start lamotrigine lower and titrate more slowly", "Start lamotrigine higher because valproate induces its clearance", "Use the same dose, but add folic acid to prevent rash", "Avoid all future dose adjustments once therapy starts", "Give lamotrigine only as a once-weekly medication"],
            answer: "Start lamotrigine lower and titrate more slowly",
            explanation: "Valproate inhibits lamotrigine metabolism, so lamotrigine is started at a lower dose and titrated more slowly to reduce toxicity and rash risk.",
            objective: .interaction,
            relatedDrugIds: ["d94", "d93"],
            tags: ["9c", "lamotrigine", "valproate"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_007",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A patient stabilized on lamotrigine begins an estrogen-containing oral contraceptive. Which change is most likely?",
            options: ["Lamotrigine levels can fall, so the maintenance dose may need to increase", "Lamotrigine levels always double, so it should be stopped immediately", "Lamotrigine becomes nephrotoxic when combined with estrogen", "Lamotrigine blocks contraception but does not affect its own levels", "No meaningful interaction is expected"],
            answer: "Lamotrigine levels can fall, so the maintenance dose may need to increase",
            explanation: "Estrogen-containing oral contraceptives can lower lamotrigine concentrations, so dose adjustment is often needed to keep seizure or mood control consistent.",
            objective: .interaction,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "oral-contraceptives"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_008",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A patient on lamotrigine stops an estrogen-containing oral contraceptive and then reports more dizziness and blurred vision. What is the best explanation?",
            options: ["Lamotrigine levels may rise after the contraceptive is stopped", "Stopping the contraceptive blocks lamotrigine absorption completely", "The change proves she is in nonconvulsive status epilepticus", "Stopping estrogen always causes acute liver failure with lamotrigine", "The symptoms are unrelated because oral contraceptives never affect lamotrigine"],
            answer: "Lamotrigine levels may rise after the contraceptive is stopped",
            explanation: "When estrogen-containing contraceptives are stopped, lamotrigine concentrations can increase, which can make dose-related adverse effects more noticeable.",
            objective: .interaction,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "oral-contraceptives", "toxicity"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_009",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A patient stopped lamotrigine for several days and now wants to restart at the same full dose because “it worked before.” What is the safest high-yield response?",
            options: ["Consider restarting with the initial titration schedule rather than jumping back to the full dose", "Resume the previous full dose immediately because rash risk disappears after the first prescription", "Double the old dose for 2 days to reach steady state faster", "Switch to primidone for 24 hours and then restart lamotrigine at full dose", "Take the missed total weekly amount all at once"],
            answer: "Consider restarting with the initial titration schedule rather than jumping back to the full dose",
            explanation: "If lamotrigine has been interrupted long enough, clinicians often reassess and restart with initial titration guidance to reduce serious-rash risk.",
            objective: .dosing,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "retitration"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_010",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Two weeks after starting lamotrigine, a patient develops a diffuse new rash. What is the best high-yield teaching point?",
            options: ["Lamotrigine is usually stopped at the first sign of rash unless another cause is clear", "The rash is expected, so continue the same dose for another month", "Add an antihistamine and automatically double the lamotrigine dose", "This means the patient is definitely allergic to all seizure drugs", "Switch to oral contraceptives to lower lamotrigine levels and keep going"],
            answer: "Lamotrigine is usually stopped at the first sign of rash unless another cause is clear",
            explanation: "Because benign and life-threatening lamotrigine rashes cannot be reliably separated early, the first appearance of a rash is a major red-flag counseling point.",
            objective: .contraindication,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "rash"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_011",
            subsectionId: "9c",
            difficulty: .medium,
            question: "When are the most dangerous lamotrigine rashes most likely to appear?",
            options: ["Within the first 2 to 8 weeks after starting therapy", "Only after 6 months of treatment", "Only after abrupt discontinuation", "Only in patients with kidney failure", "Only during the pill-free week of oral contraceptives"],
            answer: "Within the first 2 to 8 weeks after starting therapy",
            explanation: "Life-threatening lamotrigine rashes are especially associated with early therapy, making the first several weeks a high-yield counseling window.",
            objective: .pearl,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "rash-timing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_012",
            subsectionId: "9c",
            difficulty: .medium,
            question: "After a lamotrigine dose increase, a patient reports dizziness, blurred vision, and double vision. Which interpretation fits best?",
            options: ["These are common dose-related CNS adverse effects of lamotrigine", "This proves oxcarbazepine-induced hyponatremia", "This is the expected sign of levetiracetam psychosis", "This confirms porphyria from primidone", "These symptoms are classic for donepezil overdose"],
            answer: "These are common dose-related CNS adverse effects of lamotrigine",
            explanation: "Lamotrigine commonly causes dizziness, diplopia, and visual blurring, especially after dose escalation.",
            objective: .adverseEffect,
            relatedDrugIds: ["d94"],
            tags: ["9c", "lamotrigine", "cns-effects"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_013",
            subsectionId: "9c",
            difficulty: .easy,
            question: "Keppra is a newer seizure medication that many students remember for “few interactions, but watch the mood.” What is the generic name of Keppra?",
            options: ["Levetiracetam", "Lamotrigine", "Oxcarbazepine", "Primidone", "Phenytoin"],
            answer: "Levetiracetam",
            explanation: "Keppra is the brand name for levetiracetam.",
            objective: .brandGeneric,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_014",
            subsectionId: "9c",
            difficulty: .easy,
            question: "A patient is doing well on levetiracetam, a seizure drug known for relatively few drug-drug interactions. Which brand name matches levetiracetam?",
            options: ["Keppra", "Lamictal", "Trileptal", "Mysoline", "Depakote"],
            answer: "Keppra",
            explanation: "Levetiracetam corresponds to the brand Keppra.",
            objective: .genericBrand,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_015",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A patient with epilepsy takes many other medications, so the team wants a newer antiseizure drug with relatively few pharmacokinetic interactions. Which 9c medication is most attractive?",
            options: ["Levetiracetam", "Lamotrigine", "Oxcarbazepine", "Primidone", "Carbamazepine"],
            answer: "Levetiracetam",
            explanation: "Levetiracetam is especially popular in patients with polypharmacy because it has relatively few major drug-drug interactions.",
            objective: .classId,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "polypharmacy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_016",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Levetiracetam does not fit the classic sodium-channel story as neatly as some other seizure drugs. Which mechanism is most closely associated with levetiracetam?",
            options: ["Binds synaptic vesicle protein SV2A", "Irreversibly inhibits GABA transaminase", "Blocks histamine H1 receptors", "Stimulates serotonin 5-HT1B/1D receptors", "Activates PPAR-gamma receptors"],
            answer: "Binds synaptic vesicle protein SV2A",
            explanation: "Levetiracetam is high yield for its association with synaptic vesicle protein SV2A, a key teaching pearl for mechanism of action.",
            objective: .moa,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "SV2A"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_017",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A family member says a patient became unusually irritable, angry, and short-tempered soon after a new seizure medication was added. Which drug best matches that pattern?",
            options: ["Levetiracetam", "Lamotrigine", "Oxcarbazepine", "Primidone", "Memantine"],
            answer: "Levetiracetam",
            explanation: "Levetiracetam is classically associated with behavioral changes such as irritability, agitation, and aggression.",
            objective: .adverseEffect,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "behavior"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_018",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Which newer antiseizure drug in this subsection usually needs dose adjustment when kidney function declines?",
            options: ["Levetiracetam", "Lamotrigine", "Primidone", "Valproic acid", "Donepezil"],
            answer: "Levetiracetam",
            explanation: "Levetiracetam clearance falls in renal impairment, so dose adjustment based on renal function is a major monitoring pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_019",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A patient just started levetiracetam and asks whether it is okay to drive home every day right away. Which counseling point is best?",
            options: ["Use caution because levetiracetam can cause dizziness and somnolence until you know how you respond", "Driving is always safe because levetiracetam never affects alertness", "Driving is prohibited only when levetiracetam is combined with valproate", "Driving risk matters only if the patient also takes oral contraceptives", "Driving is the best way to reduce behavioral adverse effects"],
            answer: "Use caution because levetiracetam can cause dizziness and somnolence until you know how you respond",
            explanation: "Levetiracetam can cause dizziness and somnolence, so patients are counseled to use caution with driving or machinery until they know their response.",
            objective: .pearl,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "driving"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_020",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Levetiracetam is often praised for convenience, but what monitoring conversation still matters because of labeled psychiatric risk?",
            options: ["Watch for new depression, aggression, or suicidal thoughts", "Watch for severe gingival hyperplasia every week", "Check sodium weekly for all patients", "Monitor INR closely after every dose increase", "Expect oral candidiasis unless the mouth is rinsed after each dose"],
            answer: "Watch for new depression, aggression, or suicidal thoughts",
            explanation: "Levetiracetam carries important psychiatric counseling and monitoring pearls, including behavioral changes and suicidal ideation risk seen across AEDs.",
            objective: .monitoring,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "mood"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_021",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Which newer antiseizure drug in this subsection is high yield for broad seizure coverage, including partial-onset, myoclonic, and primary generalized tonic-clonic seizures?",
            options: ["Levetiracetam", "Primidone", "Donepezil", "Rimegepant", "Meclizine"],
            answer: "Levetiracetam",
            explanation: "Levetiracetam is a broad-use antiseizure medication and is commonly remembered for covering multiple common seizure types.",
            objective: .indication,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "seizure-types"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_022",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A hospitalized patient taking oral levetiracetam is temporarily NPO after surgery. Which IV replacement pearl is most accurate?",
            options: ["The initial IV total daily dose should usually match the oral total daily dose and frequency", "The IV dose must always be doubled because of low bioavailability", "Levetiracetam has no IV option, so it must be held", "IV levetiracetam is used only after all other anticonvulsants fail", "The IV form should be given once weekly regardless of prior regimen"],
            answer: "The initial IV total daily dose should usually match the oral total daily dose and frequency",
            explanation: "When switching between oral and IV levetiracetam, the total daily dose and dosing frequency are generally kept equivalent.",
            objective: .dosing,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "iv-po"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_023",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Students sometimes use the informal phrase “Keppra rage” to remember a high-yield adverse effect pattern. What does that nickname refer to?",
            options: ["Irritability and behavioral change with levetiracetam", "Severe rash from lamotrigine", "Hyponatremia from oxcarbazepine", "Porphyria risk with primidone", "Kidney stones from topiramate"],
            answer: "Irritability and behavioral change with levetiracetam",
            explanation: "“Keppra rage” is a memorable teaching phrase for the irritability, agitation, and aggression that can occur with levetiracetam.",
            objective: .pearl,
            relatedDrugIds: ["d95"],
            tags: ["9c", "levetiracetam", "nickname"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_024",
            subsectionId: "9c",
            difficulty: .easy,
            question: "Trileptal is a newer anticonvulsant related to carbamazepine and is especially high yield for hyponatremia. What is the generic name of Trileptal?",
            options: ["Oxcarbazepine", "Lamotrigine", "Levetiracetam", "Primidone", "Phenytoin"],
            answer: "Oxcarbazepine",
            explanation: "Trileptal is the brand name for oxcarbazepine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_025",
            subsectionId: "9c",
            difficulty: .easy,
            question: "A patient takes oxcarbazepine, the carbamazepine relative often remembered for fewer interactions but more sodium concerns. Which brand name matches oxcarbazepine?",
            options: ["Trileptal", "Lamictal", "Keppra", "Mysoline", "Tegretol"],
            answer: "Trileptal",
            explanation: "Oxcarbazepine corresponds to the brand name Trileptal.",
            objective: .genericBrand,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_026",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Which newer 9c medication is most strongly associated with partial-onset seizure treatment and is often compared with carbamazepine?",
            options: ["Oxcarbazepine", "Levetiracetam", "Primidone", "Memantine", "Rizatriptan"],
            answer: "Oxcarbazepine",
            explanation: "Oxcarbazepine is a carbamazepine-related anticonvulsant that is especially high yield for partial seizures.",
            objective: .indication,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "partial-seizures"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_027",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A student wants the “carbamazepine cousin” from the newer seizure subsection, especially when trying to lower the interaction burden. Which drug fits best?",
            options: ["Oxcarbazepine", "Levetiracetam", "Lamotrigine", "Primidone", "Valproic acid"],
            answer: "Oxcarbazepine",
            explanation: "Oxcarbazepine is the carbamazepine-related agent commonly remembered as having fewer CYP interactions than carbamazepine.",
            objective: .classId,
            relatedDrugIds: ["d262", "d96"],
            tags: ["9c", "oxcarbazepine", "comparison"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_028",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Oxcarbazepine reduces repetitive neuronal firing in a way that feels familiar to anyone who knows carbamazepine. Which mechanism best matches oxcarbazepine?",
            options: ["Blocks voltage-gated sodium channels", "Binds synaptic vesicle protein SV2A", "Blocks acetylcholinesterase", "Activates orexin receptors", "Inhibits H+/K+-ATPase"],
            answer: "Blocks voltage-gated sodium channels",
            explanation: "Oxcarbazepine is classically taught as a sodium-channel anticonvulsant closely related to carbamazepine.",
            objective: .moa,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_029",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A patient on oxcarbazepine develops fatigue, headache, and confusion. Which lab abnormality should immediately come to mind?",
            options: ["Hyponatremia", "Hypercalcemia", "Elevated ammonia", "Severe hyperglycemia", "Profound thrombocytosis"],
            answer: "Hyponatremia",
            explanation: "Oxcarbazepine is high yield for clinically significant hyponatremia, so sodium is the lab to think about when symptoms appear.",
            objective: .adverseEffect,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "hyponatremia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_030",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Which follow-up lab is especially important when an older adult starts oxcarbazepine, particularly if they are also taking a diuretic?",
            options: ["Serum sodium", "INR", "Uric acid", "TSH", "Serum iron"],
            answer: "Serum sodium",
            explanation: "Because oxcarbazepine can cause hyponatremia, serum sodium monitoring is especially important in older adults and other at-risk patients.",
            objective: .monitoring,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "sodium"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_031",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Before starting oxcarbazepine in a patient with ancestry from a genetically at-risk population, which screening pearl is most relevant because of severe skin reaction risk?",
            options: ["Consider HLA-B*1502 testing because of SJS/TEN risk", "Check TPMT because of pancreatitis risk", "Check G6PD because of hemolysis risk", "Test HLA-B*5701 because of optic neuritis risk", "Screen for JAK2 because of thrombosis risk"],
            answer: "Consider HLA-B*1502 testing because of SJS/TEN risk",
            explanation: "Oxcarbazepine shares a serious dermatologic reaction warning with HLA-B*1502 relevance in genetically at-risk populations.",
            objective: .contraindication,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "HLA-B1502", "SJS"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_032",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A patient had a hypersensitivity reaction to carbamazepine. Why should oxcarbazepine be used carefully?",
            options: ["Cross-hypersensitivity can occur because the drugs are closely related", "Oxcarbazepine always causes the same reaction in every patient", "Oxcarbazepine is chemically unrelated, so no special caution is needed", "Oxcarbazepine only becomes risky if combined with sumatriptan", "The issue is unique to levetiracetam, not oxcarbazepine"],
            answer: "Cross-hypersensitivity can occur because the drugs are closely related",
            explanation: "Oxcarbazepine is closely related to carbamazepine, so cross-hypersensitivity is a major counseling and safety pearl.",
            objective: .contraindication,
            relatedDrugIds: ["d262", "d96"],
            tags: ["9c", "oxcarbazepine", "cross-hypersensitivity"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_033",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A patient taking oxcarbazepine asks whether her oral contraceptive will still be reliable. What is the best counseling point?",
            options: ["Oxcarbazepine can reduce hormonal contraceptive effectiveness, so additional non-hormonal contraception is often advised", "Oxcarbazepine makes hormonal contraception more potent", "Oxcarbazepine has no interaction with hormonal contraception at any dose", "Only progesterone-only products are affected; combined pills are not", "The only concern is sodium loss, not pregnancy risk"],
            answer: "Oxcarbazepine can reduce hormonal contraceptive effectiveness, so additional non-hormonal contraception is often advised",
            explanation: "Oxcarbazepine can decrease the effectiveness of hormonal contraceptives, so backup non-hormonal contraception is an important pearl.",
            objective: .interaction,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "contraception"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_034",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A patient wants to stop oxcarbazepine suddenly because the dizziness has improved and they feel “cured.” What is the best high-yield advice?",
            options: ["It should usually be tapered gradually rather than stopped abruptly", "It can always be stopped immediately because it does not affect seizure threshold", "Sudden withdrawal is recommended whenever sodium is normal", "Stop it suddenly and replace it with scopolamine", "Only the morning dose needs to be tapered"],
            answer: "It should usually be tapered gradually rather than stopped abruptly",
            explanation: "Like other antiepileptic drugs, oxcarbazepine is generally withdrawn gradually to avoid worsening seizure control.",
            objective: .pearl,
            relatedDrugIds: ["d262"],
            tags: ["9c", "oxcarbazepine", "taper"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_035",
            subsectionId: "9c",
            difficulty: .easy,
            question: "Mysoline is the barbiturate-related anticonvulsant in this subsection and is also famous in practice for essential tremor. What is the generic name of Mysoline?",
            options: ["Primidone", "Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Phenazopyridine"],
            answer: "Primidone",
            explanation: "Mysoline is the brand name for primidone.",
            objective: .brandGeneric,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_036",
            subsectionId: "9c",
            difficulty: .easy,
            question: "A patient says their tremor improved after starting primidone. Which brand name matches primidone?",
            options: ["Mysoline", "Lamictal", "Keppra", "Trileptal", "Dilantin"],
            answer: "Mysoline",
            explanation: "Primidone corresponds to the brand Mysoline.",
            objective: .genericBrand,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_037",
            subsectionId: "9c",
            difficulty: .medium,
            question: "In a subsection specifically labeled “Seizure/Tremor Agents,” which drug is most classically associated with essential tremor?",
            options: ["Primidone", "Levetiracetam", "Lamotrigine", "Oxcarbazepine", "Donepezil"],
            answer: "Primidone",
            explanation: "Primidone is a classic medication associated with essential tremor, which is why it fits especially well in this seizure/tremor subsection.",
            objective: .indication,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "essential-tremor"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_038",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Primidone has a memorable pharmacology pearl that helps explain why it feels like an older sedating anticonvulsant. Which statement is most accurate?",
            options: ["Primidone is metabolized to phenobarbital and PEMA", "Primidone is the active metabolite of lamotrigine", "Primidone is converted into valproic acid in the liver", "Primidone irreversibly blocks acetylcholinesterase", "Primidone is a prodrug of topiramate"],
            answer: "Primidone is metabolized to phenobarbital and PEMA",
            explanation: "A high-yield primidone pearl is that it is metabolized to phenobarbital and phenylethylmalonamide (PEMA), helping explain its sedating barbiturate-like feel.",
            objective: .pearl,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "phenobarbital"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_039",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A patient starting primidone says the first few doses made them woozy and unsteady. Which early adverse-effect pattern is most characteristic?",
            options: ["Ataxia and vertigo", "Dry cough and angioedema", "Severe constipation and bradycardia", "Peripheral edema and gingival hyperplasia", "Red man syndrome"],
            answer: "Ataxia and vertigo",
            explanation: "The most frequent early adverse effects with primidone are ataxia and vertigo, especially when therapy is first started or titrated too quickly.",
            objective: .adverseEffect,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "ataxia", "vertigo"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_040",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Which 9c drug is best described as a barbiturate-related anticonvulsant rather than a modern SV2A binder or a sodium-channel mood stabilizer?",
            options: ["Primidone", "Levetiracetam", "Lamotrigine", "Oxcarbazepine", "Rimegepant"],
            answer: "Primidone",
            explanation: "Primidone is the older barbiturate-related anticonvulsant in this subsection.",
            objective: .classId,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "barbiturate-related"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_041",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Which patient history would make primidone a poor choice because it is a labeled contraindication?",
            options: ["Porphyria", "Seasonal allergies", "Migraine with aura", "GERD", "Hypothyroidism"],
            answer: "Porphyria",
            explanation: "Primidone is contraindicated in patients with porphyria and in patients with hypersensitivity to phenobarbital.",
            objective: .contraindication,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "porphyria"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_042",
            subsectionId: "9c",
            difficulty: .medium,
            question: "A patient taking primidone for seizure control wants to stop it all at once because the prescription ran out. What is the most important counseling point?",
            options: ["Do not stop it abruptly without guidance because seizure worsening can occur", "Abrupt discontinuation is safest because primidone never causes withdrawal concerns", "Skip directly to a full dose of lamotrigine instead", "Take one large catch-up dose next week", "Replace it with pseudoephedrine until follow-up"],
            answer: "Do not stop it abruptly without guidance because seizure worsening can occur",
            explanation: "Like other anticonvulsants, primidone should generally not be stopped abruptly because seizure control can worsen.",
            objective: .pearl,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "taper"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_043",
            subsectionId: "9c",
            difficulty: .medium,
            question: "Which symptom cluster best fits the common “starting primidone” experience that often improves as the body adjusts or the initial dose is reduced?",
            options: ["Sleepiness, nausea, and unsteadiness", "Bradycardia, diarrhea, and cough", "Hypertension, edema, and tremor", "Dry cough, hyperkalemia, and kidney injury", "Photosensitivity, esophagitis, and tooth staining"],
            answer: "Sleepiness, nausea, and unsteadiness",
            explanation: "Primidone commonly causes early CNS and GI effects such as sedation, nausea, and unsteadiness, especially near initiation.",
            objective: .adverseEffect,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "sedation"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_044",
            subsectionId: "9c",
            difficulty: .hard,
            question: "A clinician ordering follow-up labs on long-term primidone is partly thinking about a rare but serious adverse-effect category. Which category fits best?",
            options: ["Blood dyscrasias such as agranulocytosis or red-cell aplasia", "Marked hyperkalemia from aldosterone blockade", "QT prolongation from 5-HT3 blockade", "Severe nephrolithiasis from carbonic anhydrase inhibition", "Red man syndrome from histamine release"],
            answer: "Blood dyscrasias such as agranulocytosis or red-cell aplasia",
            explanation: "Primidone has rare but important hematologic toxicity in its label, making blood dyscrasias a worthwhile teaching pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d263"],
            tags: ["9c", "primidone", "hematology"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9c_add_045",
            subsectionId: "9c",
            difficulty: .hard,
            question: "Match the clue to the most likely 9c medication: “used for tremor, metabolized to phenobarbital, and often limited early by sedation and ataxia.” Which answer is correct?",
            options: ["Primidone", "Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Topiramate"],
            answer: "Primidone",
            explanation: "Primidone is the 9c drug tied to essential tremor and phenobarbital metabolism, with sedation and ataxia as memorable early adverse effects.",
            objective: .mixedReview,
            relatedDrugIds: ["d94", "d95", "d262", "d263"],
            tags: ["9c", "comparison", "mixed-review"],
            source: .curated
        )
    ]
}
