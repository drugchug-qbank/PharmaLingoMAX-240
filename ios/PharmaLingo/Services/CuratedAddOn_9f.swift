// PharmaLingo — Mastering Neuro & Seizure Disorders
// Curated Add-On Question Pack (45 questions)
// IDs: q9f_add_001 ... q9f_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 9f is a review-only mastery subsection in the outline.
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
//        if sub.id == Self.masteringNeuroSeizureSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_9fMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 9b–9e with a few earlier-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-10

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 9 mastery quiz.
    static let masteringNeuroSeizureSubsectionId: String = "9f"

    static let curatedAddOnQuestions_9fMastery: [Question] = [

        .multipleChoice(
            id: "q9f_add_001",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Tegretol is one of the classic older antiepileptics and is especially high yield for sodium-channel blockade, enzyme induction, and HLA-B*1502 rash counseling. What is the generic name of Tegretol?",
            options: ["Carbamazepine", "Phenytoin", "Valproic acid", "Lamotrigine", "Oxcarbazepine"],
            answer: "Carbamazepine",
            explanation: "Tegretol is the brand name for carbamazepine, a classic sodium-channel blocking antiepileptic.",
            objective: .brandGeneric,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9f", "carbamazepine", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_002",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient of Han Chinese ancestry is about to start a classic seizure medicine with a famous HLA-B*1502 warning because of Stevens-Johnson syndrome and toxic epidermal necrolysis risk. Which drug best fits that warning?",
            options: ["Carbamazepine", "Levetiracetam", "Meclizine", "Memantine", "Rimegepant"],
            answer: "Carbamazepine",
            explanation: "Carbamazepine is the classic antiepileptic strongly associated with HLA-B*1502 testing discussions because of severe dermatologic reaction risk.",
            objective: .contraindication,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9f", "carbamazepine", "HLA-B1502"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_003",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A woman taking a combined oral contraceptive starts a seizure medicine that is notorious for enzyme induction, autoinduction, and reducing contraceptive reliability over time. Which module 9 drug is the best match?",
            options: ["Carbamazepine", "Valproic acid", "Lamotrigine", "Levetiracetam", "Donepezil"],
            answer: "Carbamazepine",
            explanation: "Carbamazepine is a strong enzyme inducer and can reduce the effectiveness of hormonal contraceptives.",
            objective: .interaction,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9f", "carbamazepine", "OCP"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_004",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Dilantin is a classic seizure medicine that students often remember for nonlinear kinetics, drug-level monitoring, and gingival hyperplasia. What is the generic name of Dilantin?",
            options: ["Phenytoin", "Carbamazepine", "Valproic acid", "Topiramate", "Primidone"],
            answer: "Phenytoin",
            explanation: "Dilantin is the brand name for phenytoin.",
            objective: .brandGeneric,
            relatedDrugIds: ["d97"],
            tags: ["Mastery", "9f", "phenytoin", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_005",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient on long-term seizure treatment develops gum overgrowth and coarse facial hair, which are classic board-style clues for one older antiepileptic. Which drug best explains these findings?",
            options: ["Phenytoin", "Lamotrigine", "Oxcarbazepine", "Levetiracetam", "Memantine"],
            answer: "Phenytoin",
            explanation: "Phenytoin is the classic older antiepileptic associated with gingival hyperplasia and hirsutism.",
            objective: .adverseEffect,
            relatedDrugIds: ["d97"],
            tags: ["Mastery", "9f", "phenytoin", "gingival-hyperplasia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_006",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A hospitalized patient receives continuous tube feeds and then has unexpectedly low levels of an older seizure medicine despite ordered doses. Which antiepileptic is most famous for erratic enteral absorption and close level monitoring in this situation?",
            options: ["Phenytoin", "Valproic acid", "Levetiracetam", "Rimegepant", "Pramipexole"],
            answer: "Phenytoin",
            explanation: "Phenytoin absorption can become unreliable with enteral tube feeds, so drug levels often need close monitoring.",
            objective: .monitoring,
            relatedDrugIds: ["d97"],
            tags: ["Mastery", "9f", "phenytoin", "tube-feeds"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_007",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Depakote is a high-yield seizure medicine remembered for hepatotoxicity, pancreatitis, hyperammonemia, and pregnancy risk. What is the generic name commonly grouped under Depakote teaching?",
            options: ["Valproic acid", "Carbamazepine", "Lamotrigine", "Levetiracetam", "Topiramate"],
            answer: "Valproic acid",
            explanation: "Depakote teaching in this subsection points to valproic acid/valproate pharmacology.",
            objective: .brandGeneric,
            relatedDrugIds: ["d93"],
            tags: ["Mastery", "9f", "valproic-acid", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_008",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A woman with epilepsy is planning pregnancy and asks which older broad-spectrum seizure medicine is especially avoided because of major fetal risk, including neural tube defects. Which drug is the best answer?",
            options: ["Valproic acid", "Levetiracetam", "Lamotrigine", "Pramipexole", "Memantine"],
            answer: "Valproic acid",
            explanation: "Valproic acid is the classic antiepileptic strongly associated with teratogenic risk, including neural tube defects.",
            objective: .contraindication,
            relatedDrugIds: ["d93"],
            tags: ["Mastery", "9f", "valproic-acid", "pregnancy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_009",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A seizure medicine is being followed with liver tests and platelets because the teaching team wants to catch boxed-warning hepatotoxicity, pancreatitis, or thrombocytopenia early. Which drug fits that monitoring pattern best?",
            options: ["Valproic acid", "Phenytoin", "Meclizine", "Memantine", "Ropinirole"],
            answer: "Valproic acid",
            explanation: "Valproic acid is high yield for liver monitoring and platelet awareness because of hepatotoxicity and hematologic adverse effects.",
            objective: .monitoring,
            relatedDrugIds: ["d93"],
            tags: ["Mastery", "9f", "valproic-acid", "LFTs"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_010",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Lamictal is the newer seizure medicine that students associate with slow titration and serious rash prevention rather than serum drug-level chasing. What is the generic name of Lamictal?",
            options: ["Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Valproic acid", "Topiramate"],
            answer: "Lamotrigine",
            explanation: "Lamictal is the brand name for lamotrigine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d94"],
            tags: ["Mastery", "9f", "lamotrigine", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_011",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A resident emphasizes that one seizure medicine must be titrated slowly and restarted cautiously after a long lapse because serious rash risk rises when the dose is pushed too quickly. Which drug are they describing?",
            options: ["Lamotrigine", "Levetiracetam", "Phenytoin", "Meclizine", "Pramipexole"],
            answer: "Lamotrigine",
            explanation: "Lamotrigine is the classic antiepileptic associated with serious rash risk and slow titration requirements.",
            objective: .adverseEffect,
            relatedDrugIds: ["d94"],
            tags: ["Mastery", "9f", "lamotrigine", "rash"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_012",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "A patient already taking valproic acid is now started on another antiepileptic that must usually begin at a lower dose because valproate can raise its levels and increase rash risk. Which drug is it?",
            options: ["Lamotrigine", "Oxcarbazepine", "Levetiracetam", "Primidone", "Donepezil"],
            answer: "Lamotrigine",
            explanation: "Valproic acid inhibits lamotrigine clearance, so lamotrigine dosing must start lower and titrate more cautiously.",
            objective: .interaction,
            relatedDrugIds: ["d94", "d93"],
            tags: ["Mastery", "9f", "lamotrigine", "valproate"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_013",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Levetiracetam is the newer antiepileptic in this module that is often chosen when clinicians want fewer interaction headaches, though mood and behavior still need counseling. Which brand name matches levetiracetam?",
            options: ["Keppra", "Lamictal", "Depakote", "Tegretol", "Aricept"],
            answer: "Keppra",
            explanation: "Keppra is the brand name for levetiracetam.",
            objective: .genericBrand,
            relatedDrugIds: ["d95"],
            tags: ["Mastery", "9f", "levetiracetam", "generic-brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_014",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient needs a seizure medicine with relatively few CYP interactions, renal-dose awareness, and the memorable pearl that the total daily IV dose can replace the oral total daily dose one-to-one. Which module 9 drug best fits?",
            options: ["Levetiracetam", "Carbamazepine", "Phenytoin", "Rimegepant", "Memantine"],
            answer: "Levetiracetam",
            explanation: "Levetiracetam is popular when fewer metabolic interactions are desired, and its IV and oral total daily doses are commonly matched one-to-one.",
            objective: .pearl,
            relatedDrugIds: ["d95"],
            tags: ["Mastery", "9f", "levetiracetam", "few-interactions"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_015",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "Six weeks after starting a newer seizure medicine, a patient feels tired and confused and now has a sodium of 122 mmol/L. Which module 9 drug should immediately rise to the top of the differential?",
            options: ["Oxcarbazepine", "Lamotrigine", "Levetiracetam", "Valproic acid", "Melatonin"],
            answer: "Oxcarbazepine",
            explanation: "Oxcarbazepine is the newer antiepileptic classically associated with clinically important hyponatremia.",
            objective: .adverseEffect,
            relatedDrugIds: ["d262"],
            tags: ["Mastery", "9f", "oxcarbazepine", "hyponatremia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_016",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "A patient with stable seizure control starts an estrogen-containing oral contraceptive and then has breakthrough seizures because one antiepileptic’s levels can fall with estrogen exposure. Which drug best fits that counseling pearl?",
            options: ["Lamotrigine", "Levetiracetam", "Primidone", "Topiramate", "Memantine"],
            answer: "Lamotrigine",
            explanation: "Estrogen-containing contraceptives can lower lamotrigine concentrations, which may reduce seizure control.",
            objective: .interaction,
            relatedDrugIds: ["d94"],
            tags: ["Mastery", "9f", "lamotrigine", "oral-contraceptives"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_017",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Trileptal is the newer seizure medicine most famous in this module for hyponatremia rather than serious behavioral change or zero-order kinetics. What is the generic name of Trileptal?",
            options: ["Oxcarbazepine", "Lamotrigine", "Levetiracetam", "Primidone", "Carbamazepine"],
            answer: "Oxcarbazepine",
            explanation: "Trileptal is the brand name for oxcarbazepine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d262"],
            tags: ["Mastery", "9f", "oxcarbazepine", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_018",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Mysoline is the older barbiturate-related agent in this module and is also famous in practice for tremor teaching. What is the generic name of Mysoline?",
            options: ["Primidone", "Phenytoin", "Lamotrigine", "Meclizine", "Pramipexole"],
            answer: "Primidone",
            explanation: "Mysoline is the brand name for primidone.",
            objective: .brandGeneric,
            relatedDrugIds: ["d263"],
            tags: ["Mastery", "9f", "primidone", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_019",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A student is trying to remember why primidone feels like an older sedating anticonvulsant. Which pharmacology pearl is most accurate?",
            options: ["It is metabolized to phenobarbital and PEMA", "It irreversibly inhibits acetylcholinesterase", "It is a direct CGRP receptor antagonist", "It is primarily eliminated unchanged by the kidneys with no active metabolites", "It is a selective NMDA receptor antagonist"],
            answer: "It is metabolized to phenobarbital and PEMA",
            explanation: "Primidone is metabolized to phenobarbital and phenylethylmalonamide (PEMA), which helps explain its older barbiturate-like feel.",
            objective: .pearl,
            relatedDrugIds: ["d263"],
            tags: ["Mastery", "9f", "primidone", "phenobarbital"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_020",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Aricept is the Alzheimer drug in this module that boosts cholinergic signaling and is remembered for bradycardia and GI side effects rather than migraine rescue. What is the generic name of Aricept?",
            options: ["Donepezil", "Memantine", "Meclizine", "Melatonin", "Topiramate"],
            answer: "Donepezil",
            explanation: "Aricept is the brand name for donepezil.",
            objective: .brandGeneric,
            relatedDrugIds: ["d264"],
            tags: ["Mastery", "9f", "donepezil", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_021",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "An older adult with Alzheimer disease starts a cognitive enhancer and later develops lightheadedness, syncope, and a slow pulse because of vagotonic effects on cardiac conduction. Which module 9 drug best explains this pattern?",
            options: ["Donepezil", "Memantine", "Melatonin", "Rimegepant", "Levetiracetam"],
            answer: "Donepezil",
            explanation: "Donepezil can produce vagotonic effects that manifest as bradycardia, heart block, or syncope.",
            objective: .adverseEffect,
            relatedDrugIds: ["d264"],
            tags: ["Mastery", "9f", "donepezil", "bradycardia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_022",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A clinician wants a dementia medicine for moderate-to-severe Alzheimer disease that works as an NMDA receptor antagonist rather than a cholinesterase inhibitor. Which drug fits best?",
            options: ["Memantine", "Donepezil", "Meclizine", "Pramipexole", "Lamotrigine"],
            answer: "Memantine",
            explanation: "Memantine is the NMDA receptor antagonist in this module and is used for moderate-to-severe Alzheimer disease.",
            objective: .classId,
            relatedDrugIds: ["d267"],
            tags: ["Mastery", "9f", "memantine", "NMDA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_023",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient with advanced Alzheimer disease and severe renal impairment needs dose adjustment of the dementia medicine being considered. Which module 9 drug is most clearly linked to that renal-dosing pearl?",
            options: ["Memantine", "Donepezil", "Meclizine", "Melatonin", "Ropinirole"],
            answer: "Memantine",
            explanation: "Memantine requires dose reduction in severe renal impairment, unlike donepezil which is not adjusted the same way.",
            objective: .monitoring,
            relatedDrugIds: ["d267"],
            tags: ["Mastery", "9f", "memantine", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_024",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Antivert is the vestibular and motion-sickness medicine in this module that students remember for antihistamine sedation rather than migraine-specific activity. What is the generic name of Antivert?",
            options: ["Meclizine", "Memantine", "Melatonin", "Rizatriptan", "Donepezil"],
            answer: "Meclizine",
            explanation: "Antivert is the brand name for meclizine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d265"],
            tags: ["Mastery", "9f", "meclizine", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_025",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient uses a medicine for motion sickness and vertigo and is warned that driving, machinery, and alcohol may become more dangerous because the drug commonly causes drowsiness. Which module 9 drug matches that counseling point?",
            options: ["Meclizine", "Memantine", "Rimegepant", "Lamotrigine", "Carbamazepine"],
            answer: "Meclizine",
            explanation: "Meclizine commonly causes drowsiness, and alcohol or other CNS depressants can worsen that effect.",
            objective: .adverseEffect,
            relatedDrugIds: ["d265"],
            tags: ["Mastery", "9f", "meclizine", "drowsiness"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_026",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "One item in this neuro module is not a classic anticonvulsant, migraine abortive, or dementia drug at all, but an endogenous hormone often used for sleep-onset support. Which option is it?",
            options: ["Melatonin", "Memantine", "Meclizine", "Rimegepant", "Pramipexole"],
            answer: "Melatonin",
            explanation: "Melatonin is the sleep-related hormone/supplement in this module rather than a seizure or migraine-specific drug.",
            objective: .classId,
            relatedDrugIds: ["d266"],
            tags: ["Mastery", "9f", "melatonin", "sleep"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_027",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient wants one migraine medicine that can be used both to abort an acute attack and, on a scheduled every-other-day basis, to help prevent episodic migraine. Which module 9 drug fits that unusual dual role?",
            options: ["Rimegepant", "Rizatriptan", "Sumatriptan", "Topiramate", "Meclizine"],
            answer: "Rimegepant",
            explanation: "Rimegepant is the oral CGRP antagonist in this module that can be used for both acute treatment and preventive therapy.",
            objective: .indication,
            relatedDrugIds: ["d268"],
            tags: ["Mastery", "9f", "rimegepant", "acute-and-preventive"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_028",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Nurtec ODT is the orally disintegrating migraine medicine that stands out because it can be used acutely or preventively instead of acting like a triptan. What is the generic name of Nurtec ODT?",
            options: ["Rimegepant", "Rizatriptan", "Sumatriptan", "Topiramate", "Melatonin"],
            answer: "Rimegepant",
            explanation: "Nurtec ODT is the brand name for rimegepant.",
            objective: .brandGeneric,
            relatedDrugIds: ["d268"],
            tags: ["Mastery", "9f", "rimegepant", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_029",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .easy,
            question: "Maxalt is one of the triptans in this module and is used for acute migraine rather than prevention. What is the generic name of Maxalt?",
            options: ["Rizatriptan", "Rimegepant", "Sumatriptan", "Topiramate", "Lamotrigine"],
            answer: "Rizatriptan",
            explanation: "Maxalt is the brand name for rizatriptan.",
            objective: .brandGeneric,
            relatedDrugIds: ["d269"],
            tags: ["Mastery", "9f", "rizatriptan", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_030",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "A patient with essential tremor takes propranolol and now wants a triptan for acute migraine. Which module 9 migraine drug has the classic pearl that the dose should be lowered to 5 mg when propranolol is on board?",
            options: ["Rizatriptan", "Sumatriptan", "Rimegepant", "Topiramate", "Melatonin"],
            answer: "Rizatriptan",
            explanation: "Propranolol raises rizatriptan exposure, so the rizatriptan dose should be lowered.",
            objective: .interaction,
            relatedDrugIds: ["d269", "d18"],
            tags: ["Mastery", "9f", "rizatriptan", "propranolol"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_031",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "Imitrex is a 5-HT1 agonist used for acute migraine, but it is high yield to avoid in ischemic coronary disease or uncontrolled hypertension because of vasoconstrictive risk. What is the generic name of Imitrex?",
            options: ["Sumatriptan", "Rizatriptan", "Rimegepant", "Topiramate", "Meclizine"],
            answer: "Sumatriptan",
            explanation: "Imitrex is the brand name for sumatriptan, a triptan contraindicated in ischemic CAD and uncontrolled hypertension.",
            objective: .contraindication,
            relatedDrugIds: ["d270"],
            tags: ["Mastery", "9f", "sumatriptan", "CAD"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_032",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient using a drug for migraine prevention and seizure control complains of word-finding difficulty and paresthesias, and later is found to have low bicarbonate and a kidney stone. Which module 9 drug best fits?",
            options: ["Topiramate", "Rimegepant", "Rizatriptan", "Lamotrigine", "Donepezil"],
            answer: "Topiramate",
            explanation: "Topiramate is high yield for cognitive slowing, paresthesias, metabolic acidosis, and kidney stone risk.",
            objective: .adverseEffect,
            relatedDrugIds: ["d271"],
            tags: ["Mastery", "9f", "topiramate", "stones"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_033",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "When comparing the two Parkinson dopamine agonists in this module, which one is more dependent on renal clearance and therefore deserves extra dosing caution in chronic kidney disease?",
            options: ["Pramipexole", "Ropinirole", "Donepezil", "Topiramate", "Meclizine"],
            answer: "Pramipexole",
            explanation: "Pramipexole is more dependent on renal elimination than ropinirole and needs greater CKD dosing awareness.",
            objective: .monitoring,
            relatedDrugIds: ["d272"],
            tags: ["Mastery", "9f", "pramipexole", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_034",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "A patient with Parkinson disease is stable on one dopamine agonist until ciprofloxacin is started and smoking habits change, both of which matter because the drug is tied to CYP1A2 handling. Which drug is the best match?",
            options: ["Ropinirole", "Pramipexole", "Memantine", "Levetiracetam", "Rimegepant"],
            answer: "Ropinirole",
            explanation: "Ropinirole is the dopamine agonist more tied to CYP1A2 issues, so smoking changes and inhibitors like ciprofloxacin matter.",
            objective: .interaction,
            relatedDrugIds: ["d273"],
            tags: ["Mastery", "9f", "ropinirole", "CYP1A2"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_035",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A neurology preceptor warns that two Parkinson dopamine agonists in this module can both cause sudden sleep episodes and impulse-control problems such as compulsive gambling or shopping. Which pair matches that warning?",
            options: ["Pramipexole and ropinirole", "Donepezil and memantine", "Rizatriptan and sumatriptan", "Lamotrigine and levetiracetam", "Meclizine and melatonin"],
            answer: "Pramipexole and ropinirole",
            explanation: "Both pramipexole and ropinirole are dopamine agonists associated with sudden sleep and impulse-control/compulsive behavior warnings.",
            objective: .mixedReview,
            relatedDrugIds: ["d272", "d273"],
            tags: ["Mastery", "9f", "dopamine-agonists", "sleep-attacks"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_036",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "A patient with Parkinson disease taking pramipexole develops severe nausea. Which previously learned antiemetic is usually the better fit because it blocks 5-HT3 rather than dopamine receptors that can worsen parkinsonism?",
            options: ["Ondansetron", "Metoclopramide", "Promethazine", "Meclizine", "Scopolamine"],
            answer: "Ondansetron",
            explanation: "Ondansetron is a 5-HT3 blocker and avoids the dopamine antagonism that can worsen parkinsonian symptoms.",
            objective: .mixedReview,
            relatedDrugIds: ["d272", "d136", "d138"],
            tags: ["Mastery", "9f", "parkinsons", "antiemetic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_037",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "An older adult with Alzheimer disease takes donepezil but starts using diphenhydramine nightly for sleep and allergies. Which module 9 drug’s cognitive benefit is most likely being undermined by that anticholinergic choice?",
            options: ["Donepezil", "Memantine", "Rimegepant", "Topiramate", "Pramipexole"],
            answer: "Donepezil",
            explanation: "Diphenhydramine is anticholinergic, so it can work against the cholinergic benefit that donepezil is trying to provide.",
            objective: .mixedReview,
            relatedDrugIds: ["d264", "d247"],
            tags: ["Mastery", "9f", "donepezil", "diphenhydramine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_038",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A seizure medicine requires special respect because serum levels are followed closely and small dose changes can sometimes produce unexpectedly large concentration changes due to nonlinear kinetics. Which drug best fits this pearl?",
            options: ["Phenytoin", "Levetiracetam", "Lamotrigine", "Memantine", "Melatonin"],
            answer: "Phenytoin",
            explanation: "Phenytoin is the classic antiepileptic associated with nonlinear kinetics and close serum-level monitoring.",
            objective: .monitoring,
            relatedDrugIds: ["d97"],
            tags: ["Mastery", "9f", "phenytoin", "zero-order"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_039",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A clinician orders CBC monitoring after starting a classic antiepileptic because of the memorable risk of aplastic anemia and agranulocytosis. Which module 9 drug best matches that monitoring concern?",
            options: ["Carbamazepine", "Levetiracetam", "Meclizine", "Rimegepant", "Pramipexole"],
            answer: "Carbamazepine",
            explanation: "Carbamazepine is high yield for CBC monitoring because of aplastic anemia and agranulocytosis concerns.",
            objective: .monitoring,
            relatedDrugIds: ["d96"],
            tags: ["Mastery", "9f", "carbamazepine", "CBC"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_040",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A patient on a broad-spectrum seizure medicine becomes lethargic and confused, and the team is worried about hyperammonemia rather than hyponatremia or bradycardia. Which drug best fits that adverse-effect pattern?",
            options: ["Valproic acid", "Oxcarbazepine", "Donepezil", "Ropinirole", "Rimegepant"],
            answer: "Valproic acid",
            explanation: "Valproic acid is a classic cause of hyperammonemia, which can present with lethargy and confusion.",
            objective: .adverseEffect,
            relatedDrugIds: ["d93"],
            tags: ["Mastery", "9f", "valproic-acid", "hyperammonemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_041",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "A student is choosing between lamotrigine, levetiracetam, and oxcarbazepine for a patient who already trends toward low sodium. Which option should raise the most concern because hyponatremia is a signature teaching pearl?",
            options: ["Oxcarbazepine", "Lamotrigine", "Levetiracetam", "All are equally associated with hyponatremia", "None of them can affect sodium"],
            answer: "Oxcarbazepine",
            explanation: "Oxcarbazepine is the standout choice for hyponatremia risk among those newer antiepileptics.",
            objective: .mixedReview,
            relatedDrugIds: ["d262", "d94", "d95"],
            tags: ["Mastery", "9f", "oxcarbazepine", "low-sodium"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_042",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "Which module 9 migraine drug matches the memorable dosing pearl “75 mg as needed for acute treatment, no more than 75 mg in 24 hours, and every other day when used preventively”?",
            options: ["Rimegepant", "Rizatriptan", "Sumatriptan", "Topiramate", "Meclizine"],
            answer: "Rimegepant",
            explanation: "Those dosing pearls point to rimegepant, the oral CGRP antagonist that can be used acutely and preventively.",
            objective: .dosing,
            relatedDrugIds: ["d268"],
            tags: ["Mastery", "9f", "rimegepant", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_043",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .medium,
            question: "As Alzheimer disease progresses from mild symptoms into moderate-to-severe disease, clinicians often think about adding or switching to the non-cholinesterase option from this module. Which drug best fits that later-stage role?",
            options: ["Memantine", "Donepezil", "Meclizine", "Melatonin", "Lamotrigine"],
            answer: "Memantine",
            explanation: "Memantine is the non-cholinesterase Alzheimer medication in this module and is especially associated with moderate-to-severe disease.",
            objective: .indication,
            relatedDrugIds: ["d267", "d264"],
            tags: ["Mastery", "9f", "memantine", "alzheimers"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_044",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "A patient abruptly stops a dopamine agonist used for Parkinson disease and later develops the classic counseling pearl of dopamine agonist withdrawal symptoms. Which drug from this module is most associated with that warning?",
            options: ["Pramipexole", "Ropinirole", "Meclizine", "Rimegepant", "Memantine"],
            answer: "Pramipexole",
            explanation: "Pramipexole is high yield for dopamine agonist withdrawal counseling and should not be stopped abruptly without guidance.",
            objective: .pearl,
            relatedDrugIds: ["d272"],
            tags: ["Mastery", "9f", "pramipexole", "withdrawal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9f_add_045",
            subsectionId: DrugDataService.masteringNeuroSeizureSubsectionId,
            difficulty: .hard,
            question: "A module 9 antiepileptic is easy to confuse with the psychiatry module because it also has a major role in bipolar maintenance, yet in seizure teaching it is remembered for slow titration and serious rash risk. Which drug is it?",
            options: ["Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Primidone", "Memantine"],
            answer: "Lamotrigine",
            explanation: "Lamotrigine crosses over into bipolar maintenance teaching, but within seizure pharmacology it is especially remembered for slow titration and serious rash risk.",
            objective: .mixedReview,
            relatedDrugIds: ["d94"],
            tags: ["Mastery", "9f", "lamotrigine", "bipolar"],
            source: .curated
        ),

    ]
}
