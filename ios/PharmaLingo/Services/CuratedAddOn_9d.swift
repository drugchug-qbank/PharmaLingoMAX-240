// PharmaLingo — Module 9d (Migraine + Cognition + Vestibular)
// Curated Add-On Question Pack (45 questions)
// IDs: q9d_add_001 ... q9d_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 9d exists, then append:
//
//    if bank["9d"] == nil { bank["9d"] = [] }
//    bank["9d"]?.append(contentsOf: Self.curatedAddOnQuestions_9d)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d264 (Donepezil / Aricept), d265 (Meclizine / Antivert), d266 (Melatonin),
//   d267 (Memantine / Namenda), d268 (Rimegepant / Nurtec ODT),
//   d269 (Rizatriptan / Maxalt), d270 (Sumatriptan / Imitrex),
//   d271 (Topiramate / Topamax).
//
// Generated on: 2026-03-10

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9d: [Question] = [
        .multipleChoice(
            id: "q9d_add_001",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Aricept is a cholinesterase inhibitor used to treat Alzheimer’s dementia symptomatically rather than cure the underlying neurodegeneration. What is the generic name of Aricept?",
            options: ["Donepezil", "Memantine", "Meclizine", "Topiramate", "Melatonin"],
            answer: "Donepezil",
            explanation: "Aricept is the brand name for donepezil, the acetylcholinesterase inhibitor in this subsection used for Alzheimer’s disease.",
            objective: .brandGeneric,
            relatedDrugIds: ["d264"],
            tags: ["9d", "donepezil", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_002",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Donepezil is a cholinesterase inhibitor often started at a low nightly dose for Alzheimer’s disease. Which brand name matches donepezil?",
            options: ["Aricept", "Namenda", "Antivert", "Nurtec ODT", "Topamax"],
            answer: "Aricept",
            explanation: "Donepezil corresponds to the brand name Aricept.",
            objective: .genericBrand,
            relatedDrugIds: ["d264"],
            tags: ["9d", "donepezil", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_003",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A patient with Alzheimer’s disease is started on a medicine that increases acetylcholine signaling by inhibiting acetylcholinesterase. Which 9d medication best fits that mechanism?",
            options: ["Donepezil", "Memantine", "Rimegepant", "Meclizine", "Rizatriptan"],
            answer: "Donepezil",
            explanation: "Donepezil is the cholinesterase inhibitor in this subsection; it works by decreasing acetylcholine breakdown.",
            objective: .moa,
            relatedDrugIds: ["d264"],
            tags: ["9d", "donepezil", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_004",
            subsectionId: "9d",
            difficulty: .hard,
            question: "An older adult newly started on donepezil has dizziness and a lower heart rate at follow-up. Which high-yield donepezil adverse-effect warning best explains this finding?",
            options: ["It can have vagotonic effects that cause bradycardia or heart block", "It predictably causes severe hypertension through alpha agonism", "It commonly causes QT prolongation by blocking potassium channels", "It is famous for nephrolithiasis from carbonic anhydrase inhibition", "It causes red man syndrome if infused too quickly"],
            answer: "It can have vagotonic effects that cause bradycardia or heart block",
            explanation: "Donepezil can produce vagotonic effects on the sinoatrial and atrioventricular nodes, so bradycardia and heart block are classic high-yield cautions.",
            objective: .adverseEffect,
            relatedDrugIds: ["d264"],
            tags: ["9d", "donepezil", "bradycardia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_005",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which label-based titration plan best matches donepezil when treating Alzheimer’s disease?",
            options: ["Start 5 mg nightly, increase to 10 mg only after 4 to 6 weeks, and use 23 mg only after at least 3 months on 10 mg", "Start 10 mg twice daily on day 1, then taper to 5 mg if nausea develops", "Start 23 mg nightly on day 1 because higher doses work faster", "Give 5 mg only as needed on bad-memory days", "Use 5 mg every other day for 2 months before switching to memantine"],
            answer: "Start 5 mg nightly, increase to 10 mg only after 4 to 6 weeks, and use 23 mg only after at least 3 months on 10 mg",
            explanation: "Donepezil is started low and titrated gradually; 10 mg should wait until 5 mg has been tolerated for 4 to 6 weeks, and 23 mg is reserved for patients already on 10 mg for at least 3 months.",
            objective: .dosing,
            relatedDrugIds: ["d264"],
            tags: ["9d", "donepezil", "titration"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_006",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Antivert is a classic antihistamine-based vestibular medication used for motion sickness and vertigo. What is the generic name of Antivert?",
            options: ["Meclizine", "Melatonin", "Memantine", "Metoclopramide", "Montelukast"],
            answer: "Meclizine",
            explanation: "Antivert is the brand name for meclizine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d265"],
            tags: ["9d", "meclizine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_007",
            subsectionId: "9d",
            difficulty: .easy,
            question: "A patient asks for the brand name of meclizine, the antihistamine commonly used for vertigo and motion sickness. Which answer is correct?",
            options: ["Antivert", "Aricept", "Namenda", "Imitrex", "Maxalt"],
            answer: "Antivert",
            explanation: "Meclizine corresponds to the brand Antivert.",
            objective: .genericBrand,
            relatedDrugIds: ["d265"],
            tags: ["9d", "meclizine", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_008",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A patient with benign positional vertigo wants symptom relief for spinning and nausea during an episode. Which 9d drug is most associated with vestibular symptom control rather than migraine abortive therapy or dementia care?",
            options: ["Meclizine", "Rimegepant", "Donepezil", "Memantine", "Topiramate"],
            answer: "Meclizine",
            explanation: "Meclizine is the vestibular/motion-sickness antihistamine in this subsection and is commonly used for vertigo symptom relief.",
            objective: .indication,
            relatedDrugIds: ["d265"],
            tags: ["9d", "meclizine", "vertigo"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_009",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient who gets seasick wants the most label-consistent way to use meclizine before a cruise. Which instruction is best?",
            options: ["Take 25 to 50 mg about 1 hour before embarkation", "Take 25 mg only after vomiting begins", "Take 100 mg at bedtime the night before and repeat every 8 hours", "Apply one patch behind the ear 4 hours before travel", "Use one tablet every morning regardless of travel timing"],
            answer: "Take 25 to 50 mg about 1 hour before embarkation",
            explanation: "For motion sickness, meclizine is classically taken 1 hour before travel; this is a high-yield counseling pearl.",
            objective: .dosing,
            relatedDrugIds: ["d265"],
            tags: ["9d", "meclizine", "motion-sickness", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_010",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which counseling point best fits meclizine’s common adverse-effect profile and precautions?",
            options: ["It can cause drowsiness and dry mouth, so caution with alcohol, driving, glaucoma, and prostate enlargement is appropriate", "It commonly causes cough and angioedema, so avoid ACE inhibitors", "It reliably causes diarrhea and bradycardia, so avoid beta blockers", "It is nephrotoxic, so double the dose in kidney disease", "It is a migraine preventive that must be titrated slowly to avoid rash"],
            answer: "It can cause drowsiness and dry mouth, so caution with alcohol, driving, glaucoma, and prostate enlargement is appropriate",
            explanation: "Meclizine has antihistaminic and anticholinergic effects, so drowsiness and dry mouth are common, and glaucoma/BPH-type cautions are high yield.",
            objective: .adverseEffect,
            relatedDrugIds: ["d265"],
            tags: ["9d", "meclizine", "anticholinergic", "counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_011",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A traveler crossing multiple time zones wants help shifting sleep timing rather than aborting migraine pain or treating vertigo. Which 9d product best fits that circadian-rhythm role?",
            options: ["Melatonin", "Meclizine", "Rizatriptan", "Donepezil", "Memantine"],
            answer: "Melatonin",
            explanation: "Melatonin is the hormone supplement in this subsection most closely associated with jet lag and other circadian-rhythm sleep issues.",
            objective: .indication,
            relatedDrugIds: ["d266"],
            tags: ["9d", "melatonin", "jet-lag", "circadian"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_012",
            subsectionId: "9d",
            difficulty: .medium,
            question: "An older adult takes melatonin and then feels groggy the next morning. Which adverse effect best fits that teaching pearl?",
            options: ["Daytime drowsiness or sleepiness", "Severe gingival hyperplasia", "Bronchospasm with wheezing", "Acute urinary retention from alpha blockade", "Rapid tachyphylaxis with rebound hypertension"],
            answer: "Daytime drowsiness or sleepiness",
            explanation: "Melatonin is generally used for sleep/circadian concerns, but next-day drowsiness or sleepiness is a common high-yield counseling point.",
            objective: .adverseEffect,
            relatedDrugIds: ["d266"],
            tags: ["9d", "melatonin", "drowsiness"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_013",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Namenda is used in Alzheimer’s disease and works differently from donepezil because it targets glutamatergic signaling rather than acetylcholinesterase. What is the generic name of Namenda?",
            options: ["Memantine", "Donepezil", "Melatonin", "Meclizine", "Topiramate"],
            answer: "Memantine",
            explanation: "Namenda is the brand name for memantine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d267"],
            tags: ["9d", "memantine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_014",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Memantine is an NMDA receptor antagonist used for more advanced Alzheimer’s disease. Which brand name matches memantine?",
            options: ["Namenda", "Aricept", "Antivert", "Maxalt", "Nurtec ODT"],
            answer: "Namenda",
            explanation: "Memantine corresponds to the brand Namenda.",
            objective: .genericBrand,
            relatedDrugIds: ["d267"],
            tags: ["9d", "memantine", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_015",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A clinician wants a 9d drug that is specifically associated with moderate-to-severe Alzheimer’s disease rather than motion sickness or acute migraine. Which drug best fits?",
            options: ["Memantine", "Meclizine", "Rizatriptan", "Rimegepant", "Melatonin"],
            answer: "Memantine",
            explanation: "Memantine is the NMDA antagonist in this subsection primarily associated with moderate-to-severe Alzheimer’s disease.",
            objective: .indication,
            relatedDrugIds: ["d267"],
            tags: ["9d", "memantine", "alzheimers"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_016",
            subsectionId: "9d",
            difficulty: .medium,
            question: "Which mechanism best matches memantine in Alzheimer’s disease pharmacology?",
            options: ["NMDA receptor antagonism", "Acetylcholinesterase inhibition", "5-HT1B/1D agonism", "CGRP receptor antagonism", "Histamine H1 blockade"],
            answer: "NMDA receptor antagonism",
            explanation: "Memantine works through NMDA receptor antagonism, which distinguishes it clearly from donepezil.",
            objective: .moa,
            relatedDrugIds: ["d267"],
            tags: ["9d", "memantine", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_017",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient with moderate-to-severe Alzheimer’s disease is already taking donepezil and needs an add-on from this subsection that is often paired with it. Which drug is the best match?",
            options: ["Memantine", "Meclizine", "Melatonin", "Rimegepant", "Topiramate"],
            answer: "Memantine",
            explanation: "Memantine is commonly combined with donepezil in more advanced Alzheimer’s disease because the two drugs work through different mechanisms.",
            objective: .pearl,
            relatedDrugIds: ["d264", "d267"],
            tags: ["9d", "memantine", "donepezil", "combination"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_018",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient with severe renal impairment is being considered for memantine. Which principle is most accurate?",
            options: ["Dose reduction is recommended in severe renal impairment", "Memantine is contraindicated in all kidney disease and must never be used", "Kidney function does not matter because memantine is only hepatically cleared", "Memantine should be doubled in severe renal impairment because clearance falls", "Memantine is used only as a one-time infusion in renal disease"],
            answer: "Dose reduction is recommended in severe renal impairment",
            explanation: "Memantine does not need adjustment in mild to moderate renal impairment, but the dose should be reduced in severe renal impairment.",
            objective: .monitoring,
            relatedDrugIds: ["d267"],
            tags: ["9d", "memantine", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_019",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Nurtec ODT is a newer migraine medicine that stands out because it can be used both acutely and preventively. What is the generic name of Nurtec ODT?",
            options: ["Rimegepant", "Rizatriptan", "Sumatriptan", "Topiramate", "Memantine"],
            answer: "Rimegepant",
            explanation: "Nurtec ODT is the brand name for rimegepant.",
            objective: .brandGeneric,
            relatedDrugIds: ["d268"],
            tags: ["9d", "rimegepant", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_020",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Rimegepant is the oral disintegrating “-gepant” in this subsection. Which brand name matches rimegepant?",
            options: ["Nurtec ODT", "Maxalt", "Imitrex", "Antivert", "Topamax"],
            answer: "Nurtec ODT",
            explanation: "Rimegepant corresponds to the brand Nurtec ODT.",
            objective: .genericBrand,
            relatedDrugIds: ["d268"],
            tags: ["9d", "rimegepant", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_021",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A student remembers that drugs ending in “-gepant” block calcitonin gene-related peptide signaling rather than stimulate serotonin receptors. Which class best describes rimegepant?",
            options: ["CGRP receptor antagonist", "Triptan", "Cholinesterase inhibitor", "NMDA receptor antagonist", "Antihistamine"],
            answer: "CGRP receptor antagonist",
            explanation: "Rimegepant is a CGRP receptor antagonist, which is why it is grouped with the newer “-gepant” migraine medicines.",
            objective: .classId,
            relatedDrugIds: ["d268"],
            tags: ["9d", "rimegepant", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_022",
            subsectionId: "9d",
            difficulty: .medium,
            question: "Which migraine-use statement best distinguishes rimegepant from triptans like rizatriptan and sumatriptan?",
            options: ["It can be used for both acute treatment and preventive treatment of episodic migraine", "It is used only for prevention and never for an active attack", "It is used only as a once-monthly injectable preventive", "It is primarily for vertigo and motion sickness", "It is used only in moderate-to-severe Alzheimer’s disease"],
            answer: "It can be used for both acute treatment and preventive treatment of episodic migraine",
            explanation: "Rimegepant stands out because it has a dual role: acute treatment of migraine and preventive treatment of episodic migraine.",
            objective: .indication,
            relatedDrugIds: ["d268"],
            tags: ["9d", "rimegepant", "acute", "prevention"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_023",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which dosing statement is most accurate for rimegepant?",
            options: ["Acute treatment is 75 mg as needed, while preventive treatment is 75 mg every other day", "Acute treatment is 10 mg at onset, while prevention is 10 mg nightly", "Acute treatment is 6 mg subcutaneously, while prevention is 20 mg daily", "Acute treatment is 25 to 50 mg 1 hour before travel", "Acute treatment is 5 mg nightly, while prevention is 10 mg after 4 to 6 weeks"],
            answer: "Acute treatment is 75 mg as needed, while preventive treatment is 75 mg every other day",
            explanation: "Rimegepant’s high-yield dosing pearl is its 75 mg dose used either as needed for acute migraine or every other day for prevention.",
            objective: .dosing,
            relatedDrugIds: ["d268"],
            tags: ["9d", "rimegepant", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_024",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient taking ketoconazole asks whether they can start rimegepant. Which interaction principle is most accurate?",
            options: ["Avoid concomitant use with strong CYP3A4 inhibitors", "Always combine the two because ketoconazole improves migraine prevention", "Take both together, but double the rimegepant dose", "The main issue is bradycardia from excessive vagal tone", "The only interaction concern is with dairy products"],
            answer: "Avoid concomitant use with strong CYP3A4 inhibitors",
            explanation: "Rimegepant should be avoided with strong CYP3A4 inhibitors, and additional timing precautions also apply with moderate CYP3A4 and potent P-gp inhibitors.",
            objective: .interaction,
            relatedDrugIds: ["d268"],
            tags: ["9d", "rimegepant", "CYP3A4"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_025",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Maxalt is a triptan used for acute migraine treatment. What is the generic name of Maxalt?",
            options: ["Rizatriptan", "Rimegepant", "Sumatriptan", "Topiramate", "Meclizine"],
            answer: "Rizatriptan",
            explanation: "Maxalt is the brand name for rizatriptan.",
            objective: .brandGeneric,
            relatedDrugIds: ["d269"],
            tags: ["9d", "rizatriptan", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_026",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Rizatriptan is one of the “-triptan” agents used for acute migraine attacks. Which brand matches rizatriptan?",
            options: ["Maxalt", "Imitrex", "Nurtec ODT", "Topamax", "Aricept"],
            answer: "Maxalt",
            explanation: "Rizatriptan corresponds to the brand Maxalt.",
            objective: .genericBrand,
            relatedDrugIds: ["d269"],
            tags: ["9d", "rizatriptan", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_027",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A patient wants a migraine medicine from this subsection that acts as a 5-HT1B/1D agonist and is meant for acute treatment, not prevention. Which drug best fits?",
            options: ["Rizatriptan", "Topiramate", "Rimegepant", "Donepezil", "Melatonin"],
            answer: "Rizatriptan",
            explanation: "Rizatriptan is a triptan, meaning it is a serotonin 5-HT1B/1D agonist used for acute migraine treatment.",
            objective: .moa,
            relatedDrugIds: ["d269"],
            tags: ["9d", "rizatriptan", "triptan"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_028",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient on propranolol needs rizatriptan for migraine attacks. Which dosing pearl is most important?",
            options: ["Use rizatriptan 5 mg because propranolol increases rizatriptan exposure", "Use rizatriptan 20 mg because propranolol lowers exposure", "Avoid food for 4 hours because propranolol blocks absorption", "Switch to donepezil because propranolol is contraindicated with all triptans", "Use rizatriptan only every other day for prevention"],
            answer: "Use rizatriptan 5 mg because propranolol increases rizatriptan exposure",
            explanation: "Propranolol raises rizatriptan levels, so the rizatriptan dose should be reduced to 5 mg in this setting.",
            objective: .interaction,
            relatedDrugIds: ["d269", "d78"],
            tags: ["9d", "rizatriptan", "propranolol"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_029",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which patient scenario is the clearest contraindication to rizatriptan use?",
            options: ["A patient with uncontrolled hypertension or known coronary artery disease", "A patient with mild seasonal allergies", "A patient with benign positional vertigo", "A patient with occasional tension headaches relieved by acetaminophen", "A patient with insomnia during jet lag"],
            answer: "A patient with uncontrolled hypertension or known coronary artery disease",
            explanation: "Like other triptans, rizatriptan should not be used in patients with significant ischemic vascular disease or uncontrolled hypertension.",
            objective: .contraindication,
            relatedDrugIds: ["d269"],
            tags: ["9d", "rizatriptan", "cad", "hypertension"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_030",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Imitrex was the first widely used triptan and remains a classic acute migraine medication. What is the generic name of Imitrex?",
            options: ["Sumatriptan", "Rizatriptan", "Rimegepant", "Topiramate", "Memantine"],
            answer: "Sumatriptan",
            explanation: "Imitrex is the brand name for sumatriptan.",
            objective: .brandGeneric,
            relatedDrugIds: ["d270"],
            tags: ["9d", "sumatriptan", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_031",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Sumatriptan is a classic triptan used in migraine care and available in multiple dosage forms. Which brand matches sumatriptan?",
            options: ["Imitrex", "Maxalt", "Nurtec ODT", "Namenda", "Antivert"],
            answer: "Imitrex",
            explanation: "Sumatriptan corresponds to the brand Imitrex.",
            objective: .genericBrand,
            relatedDrugIds: ["d270"],
            tags: ["9d", "sumatriptan", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_032",
            subsectionId: "9d",
            difficulty: .medium,
            question: "Which use best fits sumatriptan from this subsection?",
            options: ["Acute migraine treatment, and in injection form it is also used for acute cluster headache", "Migraine prevention taken nightly for months", "Symptomatic treatment of vertigo and motion sickness", "Treatment of moderate-to-severe Alzheimer’s disease", "Primary treatment of circadian-rhythm sleep disorders"],
            answer: "Acute migraine treatment, and in injection form it is also used for acute cluster headache",
            explanation: "Sumatriptan is an acute migraine medication, and its injection formulation is also indicated for acute cluster headache.",
            objective: .indication,
            relatedDrugIds: ["d270"],
            tags: ["9d", "sumatriptan", "cluster-headache"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_033",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A patient with severe migraine wants the formulation associated with the fastest onset of relief. Which sumatriptan formulation is the classic answer?",
            options: ["Subcutaneous injection", "Extended-release capsule", "Transdermal patch", "Rectal suppository", "Chewable tablet"],
            answer: "Subcutaneous injection",
            explanation: "Among sumatriptan formulations, subcutaneous injection is the classic fastest-onset option and is a common high-yield pearl.",
            objective: .dosing,
            relatedDrugIds: ["d270"],
            tags: ["9d", "sumatriptan", "subcutaneous"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_034",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which counseling statement is most accurate for sumatriptan?",
            options: ["Do not use it within 24 hours of another triptan or an ergot-type medication", "It is the preferred daily medicine for migraine prevention", "It is safe to use in uncontrolled hypertension because it lowers blood pressure", "It should be combined with donepezil to improve response", "It is mainly used to prevent jet lag before long flights"],
            answer: "Do not use it within 24 hours of another triptan or an ergot-type medication",
            explanation: "Sumatriptan carries the classic triptan rule: avoid use within 24 hours of another triptan or an ergot-type medication.",
            objective: .contraindication,
            relatedDrugIds: ["d270"],
            tags: ["9d", "sumatriptan", "24-hours", "ergot"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_035",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Topamax is an anticonvulsant that is also one of the most testable migraine preventive agents. What is the generic name of Topamax?",
            options: ["Topiramate", "Valproic acid", "Lamotrigine", "Sumatriptan", "Rimegepant"],
            answer: "Topiramate",
            explanation: "Topamax is the brand name for topiramate.",
            objective: .brandGeneric,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_036",
            subsectionId: "9d",
            difficulty: .easy,
            question: "Topiramate is the anticonvulsant in this subsection that is also used for migraine prevention. Which brand name matches topiramate?",
            options: ["Topamax", "Depakote", "Keppra", "Imitrex", "Antivert"],
            answer: "Topamax",
            explanation: "Topiramate corresponds to the brand Topamax.",
            objective: .genericBrand,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_037",
            subsectionId: "9d",
            difficulty: .medium,
            question: "A patient asks for a medicine from 9d that reduces migraine frequency over time rather than aborting an attack that has already started. Which drug is the classic preventive choice?",
            options: ["Topiramate", "Sumatriptan", "Rizatriptan", "Meclizine", "Donepezil"],
            answer: "Topiramate",
            explanation: "Topiramate is a classic migraine prophylaxis agent, while triptans are used for acute attacks.",
            objective: .indication,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "migraine-prevention"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_038",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient on topiramate says, “I’ve lost some weight, but I also feel mentally slower and keep searching for words.” Which interpretation fits best?",
            options: ["Those are classic topiramate effects: weight loss plus cognitive slowing", "This strongly suggests meclizine toxicity", "These findings prove donepezil is working perfectly", "This is the expected effect of memantine in advanced dementia", "These are classic rizatriptan withdrawal symptoms"],
            answer: "Those are classic topiramate effects: weight loss plus cognitive slowing",
            explanation: "Topiramate is famous for weight loss and cognitive side effects such as slowed thinking and word-finding difficulty, which is why students remember the nickname “Dopamax.”",
            objective: .adverseEffect,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "cognitive", "weight-loss"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_039",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which counseling point is most appropriate for a patient starting topiramate for migraine prevention?",
            options: ["Maintain good hydration because kidney stone risk is increased", "Take it 1 hour before embarkation for motion sickness", "Expect bradycardia from vagal stimulation", "Use it only when a migraine has already begun", "Avoid all oral medications because absorption is unreliable"],
            answer: "Maintain good hydration because kidney stone risk is increased",
            explanation: "Topiramate can increase the risk of nephrolithiasis, so hydration counseling is a classic high-yield pearl.",
            objective: .pearl,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "kidney-stones", "hydration"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_040",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient on topiramate has a low serum bicarbonate level on routine labs. Which adverse-effect mechanism best explains this?",
            options: ["Topiramate can cause metabolic acidosis", "Topiramate irreversibly blocks platelet COX-1", "Topiramate causes SIADH with dilutional alkalosis", "Topiramate triggers severe hyperaldosteronism", "Topiramate causes lactic acidosis only in renal failure"],
            answer: "Topiramate can cause metabolic acidosis",
            explanation: "Topiramate is associated with metabolic acidosis, so low bicarbonate is a classic monitoring clue.",
            objective: .monitoring,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "metabolic-acidosis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_041",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient taking topiramate and a combined oral contraceptive reports breakthrough bleeding and asks if the birth control still works as well. Which answer is most accurate?",
            options: ["Topiramate can lower ethinyl estradiol exposure and may make birth control less effective", "Topiramate reliably increases estrogen levels, so no issue exists", "Topiramate has no interaction with hormonal contraception at any dose", "Topiramate is used to reverse contraceptive failure", "Breakthrough bleeding proves pregnancy and requires stopping all medicines"],
            answer: "Topiramate can lower ethinyl estradiol exposure and may make birth control less effective",
            explanation: "Topiramate can decrease estrogen exposure and reduce hormonal contraceptive effectiveness, so breakthrough bleeding should prompt counseling.",
            objective: .interaction,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "oral-contraceptives"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_042",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which pregnancy counseling point is most important for a person of childbearing potential taking topiramate?",
            options: ["Topiramate exposure in pregnancy can increase the risk of cleft lip and/or cleft palate", "Topiramate is one of the safest migraine medicines in pregnancy", "Topiramate must be stopped abruptly the moment pregnancy is suspected", "Topiramate prevents all neural tube and oral-cleft defects", "Topiramate’s only fetal effect is temporary neonatal drowsiness"],
            answer: "Topiramate exposure in pregnancy can increase the risk of cleft lip and/or cleft palate",
            explanation: "Topiramate has important fetal toxicity counseling, including increased risk of oral clefts with in utero exposure.",
            objective: .contraindication,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "pregnancy", "oral-clefts"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_043",
            subsectionId: "9d",
            difficulty: .hard,
            question: "A patient on topiramate suddenly develops eye pain and blurry vision. Which adverse-effect emergency should come to mind?",
            options: ["Acute myopia with secondary angle-closure glaucoma", "Chronic open-angle glaucoma from beta blockade", "Retinal detachment from serotonin excess", "Macular degeneration from NMDA blockade", "Optic neuritis from cholinesterase inhibition"],
            answer: "Acute myopia with secondary angle-closure glaucoma",
            explanation: "Topiramate can cause an acute myopia/secondary angle-closure glaucoma syndrome; sudden eye pain and visual change should be taken seriously.",
            objective: .adverseEffect,
            relatedDrugIds: ["d271"],
            tags: ["9d", "topiramate", "angle-closure-glaucoma"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_044",
            subsectionId: "9d",
            difficulty: .hard,
            question: "Which pairing is correctly matched to its role in Alzheimer’s disease pharmacology?",
            options: ["Donepezil = cholinesterase inhibitor; Memantine = NMDA receptor antagonist", "Donepezil = NMDA receptor antagonist; Memantine = antihistamine", "Donepezil = triptan; Memantine = CGRP antagonist", "Donepezil = vestibular suppressant; Memantine = melatonin agonist", "Donepezil = anticonvulsant; Memantine = H2 blocker"],
            answer: "Donepezil = cholinesterase inhibitor; Memantine = NMDA receptor antagonist",
            explanation: "The core dementia comparison in this subsection is donepezil as the cholinesterase inhibitor and memantine as the NMDA receptor antagonist.",
            objective: .mixedReview,
            relatedDrugIds: ["d264", "d267"],
            tags: ["9d", "comparison", "alzheimers"],
            source: .curated
        ),

        .multipleChoice(
            id: "q9d_add_045",
            subsectionId: "9d",
            difficulty: .hard,
            question: "One traveler wants help with jet lag and another wants a medicine taken about 1 hour before boarding to reduce motion sickness. Which pair best fits those two requests?",
            options: ["Melatonin for jet lag; Meclizine for motion sickness", "Meclizine for jet lag; Rizatriptan for motion sickness", "Donepezil for jet lag; Memantine for motion sickness", "Topiramate for jet lag; Sumatriptan for motion sickness", "Rimegepant for jet lag; Donepezil for motion sickness"],
            answer: "Melatonin for jet lag; Meclizine for motion sickness",
            explanation: "Melatonin is the circadian/jet-lag supplement in this subsection, while meclizine is the antihistamine commonly used for motion sickness prevention.",
            objective: .mixedReview,
            relatedDrugIds: ["d265", "d266"],
            tags: ["9d", "comparison", "jet-lag", "motion-sickness"],
            source: .curated
        )
    ]
}
