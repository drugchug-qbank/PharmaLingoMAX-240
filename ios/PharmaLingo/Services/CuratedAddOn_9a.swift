// PharmaLingo — Seizure Meds Overview
// Curated Add-On Question Pack (45 questions)
// IDs: q9a_add_001 ... q9a_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 9a is a review-only mastery subsection in the outline and current repo.
// - These questions should be appended AFTER the app auto-builds the mastery pool in DrugDataService.init().
// - This pack mirrors the integration pattern used for earlier mastery sections.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) In DrugDataService.init(), inside the mastery-generation loop:
//        for sub in mod.subsections where sub.isMasteryQuiz { ... }
//    immediately after:
//        bank[sub.id] = mastery
//    append:
//        if sub.id == Self.seizureMedsOverviewSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_9aOverview)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 9b–9e with a few earlier-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-09

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 9 overview mastery quiz.
    static let seizureMedsOverviewSubsectionId: String = "9a"

    static let curatedAddOnQuestions_9aOverview: [Question] = [

        .multipleChoice(
            id: "q9a_add_001",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Tegretol is a classic antiseizure medication that is also high yield for trigeminal neuralgia and is notorious for drug interactions because it induces liver enzymes. What is the generic name of Tegretol?",
            options: ["Carbamazepine", "Phenytoin", "Valproic acid", "Oxcarbazepine", "Lamotrigine"],
            answer: "Carbamazepine",
            explanation: "Tegretol is carbamazepine, a classic antiepileptic also used for trigeminal neuralgia and known for enzyme induction.",
            objective: .brandGeneric,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9a", "Tegretol", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_002",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient has focal seizures and severe trigeminal neuralgia, so the team wants one classic drug that can help with both problems. Which module 9 medication best fits that role?",
            options: ["Carbamazepine", "Levetiracetam", "Memantine", "Rimegepant", "Pramipexole"],
            answer: "Carbamazepine",
            explanation: "Carbamazepine is high yield because it treats seizures and is also a classic medication for trigeminal neuralgia.",
            objective: .indication,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9a", "carbamazepine", "trigeminal-neuralgia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_003",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "Before starting carbamazepine in a genetically at-risk patient, which severe adverse reaction is most closely tied to the HLA-B*1502 screening pearl?",
            options: ["Stevens-Johnson syndrome/toxic epidermal necrolysis", "Pancreatitis", "Tardive dyskinesia", "Red man syndrome", "Optic neuritis"],
            answer: "Stevens-Johnson syndrome/toxic epidermal necrolysis",
            explanation: "Carbamazepine is strongly associated with serious dermatologic reactions, and HLA-B*1502 screening is the classic pearl tied to SJS/TEN risk in certain ancestries.",
            objective: .contraindication,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9a", "carbamazepine", "HLA-B1502"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_004",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient starting carbamazepine is told that rare but serious blood dyscrasias are one reason clinicians pay attention to the CBC. Which hematologic toxicity is classically associated with this drug?",
            options: ["Aplastic anemia/agranulocytosis", "Hemolytic anemia from G6PD deficiency", "Heparin-induced thrombocytopenia", "Megaloblastic anemia from folate deficiency alone", "Thrombotic thrombocytopenic purpura"],
            answer: "Aplastic anemia/agranulocytosis",
            explanation: "Carbamazepine carries a classic boxed-warning style teaching pearl for aplastic anemia and agranulocytosis, so CBC awareness matters.",
            objective: .monitoring,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9a", "carbamazepine", "CBC"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_005",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Dilantin is a classic antiseizure medication whose toxicity often shows up as nystagmus and ataxia. What is the generic name of Dilantin?",
            options: ["Phenytoin", "Carbamazepine", "Lamotrigine", "Levetiracetam", "Topiramate"],
            answer: "Phenytoin",
            explanation: "Dilantin is phenytoin, a classic antiepileptic known for concentration-related neurologic toxicity.",
            objective: .brandGeneric,
            relatedDrugIds: ["d97"],
            tags: ["Mastery", "9a", "Dilantin", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_006",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "After a phenytoin dose increase, a patient develops horizontal nystagmus and gait ataxia. Which interpretation is most accurate?",
            options: ["The phenytoin level is likely too high", "This is the classic first sign of valproate hepatotoxicity", "This suggests cholinergic excess from donepezil", "The patient is having serotonin syndrome", "This confirms HLA-B*1502 positivity"],
            answer: "The phenytoin level is likely too high",
            explanation: "Nystagmus and ataxia are classic concentration-related signs of phenytoin toxicity.",
            objective: .adverseEffect,
            relatedDrugIds: ["d97"],
            tags: ["Mastery", "9a", "phenytoin", "toxicity"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_007",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "Which classic antiepileptic is famous for zero-order kinetics, meaning a small dose increase can cause a disproportionately large jump in drug level?",
            options: ["Phenytoin", "Lamotrigine", "Levetiracetam", "Memantine", "Ropinirole"],
            answer: "Phenytoin",
            explanation: "Phenytoin is the classic zero-order kinetics drug, so dose adjustments require extra caution.",
            objective: .pearl,
            relatedDrugIds: ["d97"],
            tags: ["Mastery", "9a", "phenytoin", "zero-order"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_008",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Depakote is a broad-use neurologic medication that shows up in seizures, bipolar disorder, and migraine prevention. What is the generic name used in your module 9 bank?",
            options: ["Valproic acid", "Phenytoin", "Topiramate", "Lamotrigine", "Primidone"],
            answer: "Valproic acid",
            explanation: "Depakote is the brand most learners associate with valproic acid/divalproex-style valproate therapy.",
            objective: .brandGeneric,
            relatedDrugIds: ["d93"],
            tags: ["Mastery", "9a", "Depakote", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_009",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient with epilepsy who could become pregnant asks which classic antiepileptic is especially high yield for neural tube defects and other fetal harm. Which drug is the concern?",
            options: ["Valproic acid", "Levetiracetam", "Meclizine", "Memantine", "Sumatriptan"],
            answer: "Valproic acid",
            explanation: "Valproic acid is the classic seizure medication associated with neural tube defects and major fetal harm, so pregnancy counseling is high yield.",
            objective: .contraindication,
            relatedDrugIds: ["d93"],
            tags: ["Mastery", "9a", "valproate", "pregnancy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_010",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "Because valproate can cause hepatotoxicity and thrombocytopenia, which lab pair is most high yield to follow over time?",
            options: ["Liver function tests and CBC", "INR and troponin", "TSH and free T4", "Lipase and uric acid only", "CK and lactate"],
            answer: "Liver function tests and CBC",
            explanation: "Valproate monitoring classically includes liver tests and a CBC because hepatotoxicity and thrombocytopenia are major concerns.",
            objective: .monitoring,
            relatedDrugIds: ["d93"],
            tags: ["Mastery", "9a", "valproate", "labs"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_011",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Lamictal is a newer antiseizure medication that also appears in bipolar depression and must be titrated carefully because of rash risk. What is the generic name of Lamictal?",
            options: ["Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Topiramate", "Carbamazepine"],
            answer: "Lamotrigine",
            explanation: "Lamictal is lamotrigine, a newer antiepileptic and mood stabilizer with a major serious-rash teaching pearl.",
            objective: .brandGeneric,
            relatedDrugIds: ["d94"],
            tags: ["Mastery", "9a", "Lamictal", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_012",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "Why is lamotrigine usually titrated slowly instead of started aggressively at a full dose?",
            options: ["Rapid titration raises the risk of serious rash including Stevens-Johnson syndrome", "It causes immediate agranulocytosis if started quickly", "It blocks dopamine too abruptly and worsens Parkinson symptoms", "It always causes profound bradycardia at standard doses", "It becomes ineffective if the first week dose is too high"],
            answer: "Rapid titration raises the risk of serious rash including Stevens-Johnson syndrome",
            explanation: "The lamotrigine titration pearl exists to reduce the risk of serious rash, including Stevens-Johnson syndrome.",
            objective: .adverseEffect,
            relatedDrugIds: ["d94"],
            tags: ["Mastery", "9a", "lamotrigine", "SJS"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_013",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient already takes valproate and is now starting lamotrigine. Which dosing principle is most important?",
            options: ["Use a lower lamotrigine starting dose and titrate more slowly", "Start with a higher lamotrigine dose because valproate induces its metabolism", "Avoid all dose titration because the combination eliminates rash risk", "Double the lamotrigine dose after one week", "Give the whole lamotrigine daily dose only at bedtime to avoid toxicity"],
            answer: "Use a lower lamotrigine starting dose and titrate more slowly",
            explanation: "Valproate decreases lamotrigine clearance, so lower initial doses and slower titration are needed to reduce toxicity and rash risk.",
            objective: .interaction,
            relatedDrugIds: ["d94", "d93"],
            tags: ["Mastery", "9a", "lamotrigine", "valproate"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_014",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Keppra is a commonly used seizure medication that stands out for having relatively few drug interactions but can cause irritability and behavioral changes. What is the generic name of Keppra?",
            options: ["Levetiracetam", "Lamotrigine", "Topiramate", "Primidone", "Carbamazepine"],
            answer: "Levetiracetam",
            explanation: "Keppra is levetiracetam, a high-yield antiseizure drug known for few interactions and possible behavioral adverse effects.",
            objective: .brandGeneric,
            relatedDrugIds: ["d95"],
            tags: ["Mastery", "9a", "Keppra", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_015",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A family reports that a patient became unusually irritable and short-tempered soon after starting a newer antiseizure drug with few pharmacokinetic interactions. Which medication best fits this “Keppra rage” pearl?",
            options: ["Levetiracetam", "Lamotrigine", "Memantine", "Meclizine", "Pramipexole"],
            answer: "Levetiracetam",
            explanation: "Levetiracetam is classically associated with behavioral changes such as irritability and agitation.",
            objective: .adverseEffect,
            relatedDrugIds: ["d95"],
            tags: ["Mastery", "9a", "levetiracetam", "behavior"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_016",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "Which newer antiseizure drug is especially attractive when you want few drug-drug interactions, but dose adjustment becomes important when renal function declines?",
            options: ["Levetiracetam", "Carbamazepine", "Valproic acid", "Rizatriptan", "Ropinirole"],
            answer: "Levetiracetam",
            explanation: "Levetiracetam has relatively few interactions, but it is renally eliminated, so renal dosing matters.",
            objective: .monitoring,
            relatedDrugIds: ["d95"],
            tags: ["Mastery", "9a", "levetiracetam", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_017",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "Which newer seizure medication is basically a carbamazepine relative and is often remembered as having fewer CYP interactions than carbamazepine?",
            options: ["Oxcarbazepine", "Lamotrigine", "Levetiracetam", "Topiramate", "Memantine"],
            answer: "Oxcarbazepine",
            explanation: "Oxcarbazepine is the carbamazepine-related agent that many learners remember as having fewer drug interactions.",
            objective: .classId,
            relatedDrugIds: ["d262", "d96"],
            tags: ["Mastery", "9a", "oxcarbazepine", "comparison"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_018",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient on oxcarbazepine develops headache, confusion, and malaise during follow-up. Which lab abnormality should immediately come to mind?",
            options: ["Hyponatremia", "Hypercalcemia", "Severe neutropenia", "Profound hyperglycemia", "Elevated ammonia from urea cycle failure"],
            answer: "Hyponatremia",
            explanation: "Oxcarbazepine is high yield for clinically significant hyponatremia, so serum sodium is the lab to think about.",
            objective: .monitoring,
            relatedDrugIds: ["d262"],
            tags: ["Mastery", "9a", "oxcarbazepine", "hyponatremia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_019",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Mysoline is a module 9 medication used in both seizures and essential tremor and is metabolized to phenobarbital. What is the generic name of Mysoline?",
            options: ["Primidone", "Phenytoin", "Pramipexole", "Topiramate", "Donepezil"],
            answer: "Primidone",
            explanation: "Mysoline is primidone, an anticonvulsant that is also used for essential tremor.",
            objective: .brandGeneric,
            relatedDrugIds: ["d263"],
            tags: ["Mastery", "9a", "Mysoline", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_020",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient does not have epilepsy but needs a medication from the seizure/tremor subsection that is especially high yield for essential tremor. Which drug fits best?",
            options: ["Primidone", "Levetiracetam", "Memantine", "Rimegepant", "Donepezil"],
            answer: "Primidone",
            explanation: "Primidone is a classic module 9 choice for essential tremor, even though it is also an anticonvulsant.",
            objective: .indication,
            relatedDrugIds: ["d263"],
            tags: ["Mastery", "9a", "primidone", "essential-tremor"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_021",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Nurtec ODT is a newer migraine medicine from the “-gepant” family and is memorable because it can be used for both acute treatment and prevention. What is the generic name of Nurtec ODT?",
            options: ["Rimegepant", "Rizatriptan", "Sumatriptan", "Topiramate", "Meclizine"],
            answer: "Rimegepant",
            explanation: "Nurtec ODT is rimegepant, a CGRP receptor antagonist with both acute and preventive migraine roles.",
            objective: .brandGeneric,
            relatedDrugIds: ["d268"],
            tags: ["Mastery", "9a", "Nurtec", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_022",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "Which migraine drug in module 9 is especially high yield because it can treat an acute migraine today and also be used for preventive therapy over time?",
            options: ["Rimegepant", "Rizatriptan", "Sumatriptan", "Meclizine", "Donepezil"],
            answer: "Rimegepant",
            explanation: "Rimegepant stands out because it has both acute-treatment and preventive indications for migraine.",
            objective: .indication,
            relatedDrugIds: ["d268"],
            tags: ["Mastery", "9a", "rimegepant", "dual-role"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_023",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Maxalt is a triptan used for acute migraine attacks and has a famous dose adjustment when propranolol is on board. What is the generic name of Maxalt?",
            options: ["Rizatriptan", "Rimegepant", "Sumatriptan", "Topiramate", "Melatonin"],
            answer: "Rizatriptan",
            explanation: "Maxalt is rizatriptan, a triptan used for acute migraine treatment.",
            objective: .brandGeneric,
            relatedDrugIds: ["d269"],
            tags: ["Mastery", "9a", "Maxalt", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_024",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A clinician wants a classic triptan for acute migraine rather than a CGRP receptor antagonist. Which option below is the triptan?",
            options: ["Rizatriptan", "Rimegepant", "Topiramate", "Meclizine", "Memantine"],
            answer: "Rizatriptan",
            explanation: "Rizatriptan is a triptan, while rimegepant is a CGRP receptor antagonist and topiramate is used for prevention.",
            objective: .classId,
            relatedDrugIds: ["d269", "d268"],
            tags: ["Mastery", "9a", "triptan", "migraine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_025",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Imitrex is a classic migraine drug that also shows up in cluster headache teaching and comes in oral, nasal, and subcutaneous forms. What is the generic name of Imitrex?",
            options: ["Sumatriptan", "Rizatriptan", "Rimegepant", "Topiramate", "Pramipexole"],
            answer: "Sumatriptan",
            explanation: "Imitrex is sumatriptan, the classic first-generation triptan.",
            objective: .brandGeneric,
            relatedDrugIds: ["d270"],
            tags: ["Mastery", "9a", "Imitrex", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_026",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient with known coronary artery disease wants the fastest possible acute migraine relief. Which module 9 medication is classically avoided because vasoconstrictive triptans are contraindicated in CAD and uncontrolled hypertension?",
            options: ["Sumatriptan", "Topiramate", "Memantine", "Melatonin", "Meclizine"],
            answer: "Sumatriptan",
            explanation: "Sumatriptan is a triptan and is classically contraindicated in ischemic coronary disease and uncontrolled hypertension.",
            objective: .contraindication,
            relatedDrugIds: ["d270"],
            tags: ["Mastery", "9a", "sumatriptan", "CAD"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_027",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "Which acute migraine drug from module 9 is also a high-yield option for cluster headache and is famous for having a very fast subcutaneous form?",
            options: ["Sumatriptan", "Topiramate", "Lamotrigine", "Memantine", "Pramipexole"],
            answer: "Sumatriptan",
            explanation: "Sumatriptan is used for acute migraine and is also high yield for cluster headache, especially with subcutaneous administration.",
            objective: .indication,
            relatedDrugIds: ["d270"],
            tags: ["Mastery", "9a", "sumatriptan", "cluster-headache"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_028",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Topamax is an antiepileptic that is also used for migraine prevention and is notorious for cognitive slowing and kidney stones. What is the generic name of Topamax?",
            options: ["Topiramate", "Lamotrigine", "Valproic acid", "Memantine", "Primidone"],
            answer: "Topiramate",
            explanation: "Topamax is topiramate, an anticonvulsant also used for migraine prophylaxis.",
            objective: .brandGeneric,
            relatedDrugIds: ["d271"],
            tags: ["Mastery", "9a", "Topamax", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_029",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient wants a medication to reduce how often migraines happen, not something to abort today's attack. Which module 9 drug best fits that preventive role?",
            options: ["Topiramate", "Sumatriptan", "Rizatriptan", "Meclizine", "Pramipexole"],
            answer: "Topiramate",
            explanation: "Topiramate is used for migraine prevention, whereas triptans are used acutely during attacks.",
            objective: .indication,
            relatedDrugIds: ["d271"],
            tags: ["Mastery", "9a", "topiramate", "prevention"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_030",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "Which adverse-effect cluster is most characteristic of topiramate?",
            options: ["Cognitive slowing/word-finding difficulty plus kidney stones and metabolic acidosis", "Gingival hyperplasia with hirsutism", "Aplastic anemia with agranulocytosis", "Bradycardia with syncope", "Compulsive gambling with sleep attacks"],
            answer: "Cognitive slowing/word-finding difficulty plus kidney stones and metabolic acidosis",
            explanation: "Topiramate is high yield for cognitive slowing, kidney stones, and metabolic acidosis, which is why learners remember the nickname “Dopamax.”",
            objective: .adverseEffect,
            relatedDrugIds: ["d271"],
            tags: ["Mastery", "9a", "topiramate", "dopamax"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_031",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Aricept is a cognitive medication used for Alzheimer's disease and is memorable because cholinesterase inhibition can worsen bradycardia. What is the generic name of Aricept?",
            options: ["Donepezil", "Memantine", "Meclizine", "Melatonin", "Pramipexole"],
            answer: "Donepezil",
            explanation: "Aricept is donepezil, a cholinesterase inhibitor used for Alzheimer's disease.",
            objective: .brandGeneric,
            relatedDrugIds: ["d264"],
            tags: ["Mastery", "9a", "Aricept", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_032",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient with mild Alzheimer's disease is started on a cholinesterase inhibitor and later reports nausea with a slower pulse. Which drug best matches that mechanism and adverse-effect pattern?",
            options: ["Donepezil", "Memantine", "Melatonin", "Rimegepant", "Ropinirole"],
            answer: "Donepezil",
            explanation: "Donepezil is a cholinesterase inhibitor used for Alzheimer's disease, and it can cause GI effects plus bradycardia or syncope.",
            objective: .moa,
            relatedDrugIds: ["d264"],
            tags: ["Mastery", "9a", "donepezil", "cholinesterase"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_033",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Memantine is the NMDA receptor antagonist used for moderate to severe Alzheimer's disease. Which brand name belongs to memantine?",
            options: ["Namenda", "Aricept", "Antivert", "Mirapex", "Topamax"],
            answer: "Namenda",
            explanation: "Namenda is the brand name for memantine.",
            objective: .genericBrand,
            relatedDrugIds: ["d267"],
            tags: ["Mastery", "9a", "memantine", "brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_034",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "Which Alzheimer's medication is an NMDA receptor antagonist that is typically used for moderate to severe disease and is often paired with donepezil later in the disease course?",
            options: ["Memantine", "Donepezil", "Meclizine", "Melatonin", "Rizatriptan"],
            answer: "Memantine",
            explanation: "Memantine is the NMDA receptor antagonist used for moderate to severe Alzheimer's disease and is often combined with donepezil.",
            objective: .moa,
            relatedDrugIds: ["d267", "d264"],
            tags: ["Mastery", "9a", "memantine", "NMDA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_035",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Antivert is a vestibular symptom medication used for vertigo and motion sickness, and it often makes patients sleepy. What is the generic name of Antivert?",
            options: ["Meclizine", "Melatonin", "Memantine", "Donepezil", "Pramipexole"],
            answer: "Meclizine",
            explanation: "Antivert is meclizine, an antihistamine-type vestibular medication used for vertigo and motion sickness.",
            objective: .brandGeneric,
            relatedDrugIds: ["d265"],
            tags: ["Mastery", "9a", "Antivert", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_036",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient takes meclizine for vertigo and asks whether it is okay to drive immediately afterward. Which counseling point is most appropriate?",
            options: ["Use caution because drowsiness is common", "Driving is encouraged because it works as a stimulant", "Only avoid driving if the dose is above 100 mg", "Driving is safe as long as it is taken with food", "The real concern is severe neutropenia, not sedation"],
            answer: "Use caution because drowsiness is common",
            explanation: "Meclizine commonly causes drowsiness, so patients should be cautious with driving or hazardous activities.",
            objective: .adverseEffect,
            relatedDrugIds: ["d265"],
            tags: ["Mastery", "9a", "meclizine", "drowsiness"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_037",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Which module 9 agent is an over-the-counter hormone supplement best remembered for jet lag, circadian rhythm problems, and sleep initiation rather than for seizure control?",
            options: ["Melatonin", "Memantine", "Lamotrigine", "Levetiracetam", "Sumatriptan"],
            answer: "Melatonin",
            explanation: "Melatonin is the OTC hormone supplement used for sleep and circadian rhythm issues such as jet lag.",
            objective: .indication,
            relatedDrugIds: ["d266"],
            tags: ["Mastery", "9a", "melatonin", "circadian"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_038",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Mirapex is a dopamine agonist used in Parkinson's disease and restless legs syndrome and is also linked to impulse-control problems. What is the generic name of Mirapex?",
            options: ["Pramipexole", "Ropinirole", "Donepezil", "Memantine", "Topiramate"],
            answer: "Pramipexole",
            explanation: "Mirapex is pramipexole, a dopamine agonist used for Parkinson's disease and restless legs syndrome.",
            objective: .brandGeneric,
            relatedDrugIds: ["d272"],
            tags: ["Mastery", "9a", "Mirapex", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_039",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "Which dopamine agonist from module 9 is the one you most strongly associate with renal elimination, making kidney function especially important during prescribing?",
            options: ["Pramipexole", "Ropinirole", "Donepezil", "Meclizine", "Rizatriptan"],
            answer: "Pramipexole",
            explanation: "Pramipexole is the dopamine agonist most strongly associated with renal elimination, so renal function is a key practical pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d272"],
            tags: ["Mastery", "9a", "pramipexole", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_040",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .easy,
            question: "Requip is another dopamine agonist used in Parkinson's disease and restless legs syndrome. What is the generic name of Requip?",
            options: ["Ropinirole", "Pramipexole", "Topiramate", "Meclizine", "Lamotrigine"],
            answer: "Ropinirole",
            explanation: "Requip is ropinirole, a dopamine agonist used in Parkinson's disease and restless legs syndrome.",
            objective: .brandGeneric,
            relatedDrugIds: ["d273"],
            tags: ["Mastery", "9a", "Requip", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_041",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "Which counseling point is especially high yield for ropinirole and pramipexole?",
            options: ["Watch for impulse-control behaviors and episodes of sudden sleepiness", "Rinse the mouth after each dose to prevent oral thrush", "Expect gingival hyperplasia if therapy is effective", "Avoid all dairy because absorption completely fails with calcium", "Take with backup contraception for 28 days after the last dose"],
            answer: "Watch for impulse-control behaviors and episodes of sudden sleepiness",
            explanation: "Dopamine agonists such as ropinirole and pramipexole are classic for impulse-control problems, somnolence, and even sudden sleep episodes.",
            objective: .adverseEffect,
            relatedDrugIds: ["d273", "d272"],
            tags: ["Mastery", "9a", "dopamine-agonists", "impulse-control"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_042",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient with mild Alzheimer's disease starts donepezil. Years later, when the disease progresses to moderate-severe, which additional module 9 drug is commonly paired because it works through NMDA receptor antagonism?",
            options: ["Memantine", "Meclizine", "Melatonin", "Rimegepant", "Pramipexole"],
            answer: "Memantine",
            explanation: "Donepezil is the cholinesterase inhibitor commonly started first, and memantine is often added later for moderate to severe disease.",
            objective: .mixedReview,
            relatedDrugIds: ["d264", "d267"],
            tags: ["Mastery", "9a", "alzheimers", "comparison"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_043",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient with a known seizure disorder needs treatment for depression. Which previously learned medication is especially high yield to avoid because it lowers seizure threshold?",
            options: ["Bupropion", "Sertraline", "Escitalopram", "Mirtazapine", "Buspirone"],
            answer: "Bupropion",
            explanation: "Bupropion lowers seizure threshold, so it is a classic antidepressant to avoid or use with great caution in patients with seizure disorders.",
            objective: .contraindication,
            relatedDrugIds: ["d202", "d96"],
            tags: ["Mastery", "9a", "bupropion", "crossover"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_044",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .hard,
            question: "A migraine patient already takes propranolol for prevention and now wants to use Maxalt for breakthrough attacks. Which dosing adjustment is correct?",
            options: ["Use only 5 mg per dose, with a maximum of 15 mg in 24 hours", "Use the standard 10 mg dose and double it if the first tablet fails", "Avoid rizatriptan completely because propranolol makes it ineffective", "Take rizatriptan only as a nightly preventive medication", "Use rizatriptan only by injection when combined with propranolol"],
            answer: "Use only 5 mg per dose, with a maximum of 15 mg in 24 hours",
            explanation: "Propranolol increases rizatriptan exposure, so the labeled adult adjustment is 5 mg per dose with a 15 mg maximum in 24 hours.",
            objective: .interaction,
            relatedDrugIds: ["d269", "d18"],
            tags: ["Mastery", "9a", "rizatriptan", "propranolol"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9a_add_045",
            subsectionId: DrugDataService.seizureMedsOverviewSubsectionId,
            difficulty: .medium,
            question: "During an active generalized convulsive seizure in the emergency department, which previously learned benzodiazepine is commonly used for rapid control before longer-term maintenance agents are considered?",
            options: ["Lorazepam", "Zolpidem", "Donepezil", "Memantine", "Ropinirole"],
            answer: "Lorazepam",
            explanation: "Lorazepam is a classic acute benzodiazepine for active seizures/status epilepticus, whereas drugs like phenytoin are used in a broader ongoing management strategy.",
            objective: .mixedReview,
            relatedDrugIds: ["d81", "d97"],
            tags: ["Mastery", "9a", "status-epilepticus", "crossover"],
            source: .curated
        )

    ]
}
