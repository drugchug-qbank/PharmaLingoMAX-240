import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9d_supplement: [Question] = [

    .matching(
        id: "q9d_sup_001",
        subsectionId: "9d",
        difficulty: .medium,
        question: "Match each migraine/cognition drug to its brand name:",
        pairs: [
            MatchingPair(left: "Sumatriptan", right: "Imitrex"),
            MatchingPair(left: "Rizatriptan", right: "Maxalt"),
            MatchingPair(left: "Rimegepant", right: "Nurtec ODT"),
            MatchingPair(left: "Topiramate", right: "Topamax"),
        ],
        explanation: "Sumatriptan = Imitrex, Rizatriptan = Maxalt, Rimegepant = Nurtec ODT, Topiramate = Topamax.",
        objective: .brandGeneric,
        relatedDrugIds: ["d270", "d269", "d268", "d271"],
        tags: ["9d", "matching", "brand-generic", "migraine"],
        source: .curated
    ),

    .matching(
        id: "q9d_sup_002",
        subsectionId: "9d",
        difficulty: .medium,
        question: "Match each dementia/vestibular drug to its brand name:",
        pairs: [
            MatchingPair(left: "Donepezil", right: "Aricept"),
            MatchingPair(left: "Memantine", right: "Namenda"),
            MatchingPair(left: "Meclizine", right: "Antivert"),
        ],
        explanation: "Donepezil = Aricept, Memantine = Namenda, Meclizine = Antivert.",
        objective: .brandGeneric,
        relatedDrugIds: ["d264", "d267", "d265"],
        tags: ["9d", "matching", "brand-generic", "dementia"],
        source: .curated
    ),

    .matching(
        id: "q9d_sup_003",
        subsectionId: "9d",
        difficulty: .hard,
        question: "Match each 9d drug to its drug class:",
        pairs: [
            MatchingPair(left: "Sumatriptan", right: "Triptan (5-HT1B/1D agonist)"),
            MatchingPair(left: "Rimegepant", right: "CGRP receptor antagonist"),
            MatchingPair(left: "Donepezil", right: "Cholinesterase inhibitor"),
            MatchingPair(left: "Memantine", right: "NMDA receptor antagonist"),
        ],
        explanation: "Triptans activate serotonin receptors; gepants block CGRP; donepezil inhibits AChE; memantine blocks NMDA.",
        objective: .classId,
        relatedDrugIds: ["d270", "d268", "d264", "d267"],
        tags: ["9d", "matching", "drug-class", "differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q9d_sup_004",
        subsectionId: "9d",
        difficulty: .hard,
        question: "Select ALL 9d drugs that are contraindicated in patients with coronary artery disease or uncontrolled hypertension:",
        options: ["Sumatriptan", "Rizatriptan", "Rimegepant", "Topiramate", "Donepezil"],
        correctAnswers: ["Sumatriptan", "Rizatriptan"],
        explanation: "Triptans (sumatriptan, rizatriptan) are contraindicated in ischemic heart disease and uncontrolled HTN due to vasoconstrictive effects. CGRP antagonists like rimegepant do not carry this contraindication.",
        objective: .contraindication,
        relatedDrugIds: ["d270", "d269", "d268", "d271", "d264"],
        tags: ["9d", "select-all", "triptan", "CAD"],
        source: .curated
    ),

    .selectAll(
        id: "q9d_sup_005",
        subsectionId: "9d",
        difficulty: .medium,
        question: "Select ALL triptans in subsection 9d:",
        options: ["Sumatriptan", "Rizatriptan", "Rimegepant", "Topiramate", "Meclizine"],
        correctAnswers: ["Sumatriptan", "Rizatriptan"],
        explanation: "Sumatriptan and rizatriptan are triptans. Rimegepant is a CGRP antagonist. Topiramate is an anticonvulsant. Meclizine is an antihistamine.",
        objective: .classId,
        relatedDrugIds: ["d270", "d269"],
        tags: ["9d", "select-all", "triptan"],
        source: .curated
    ),

    .fillBlank(
        id: "q9d_sup_006",
        subsectionId: "9d",
        difficulty: .easy,
        question: "Donepezil (Aricept) is the first-line cholinesterase inhibitor for mild-to-moderate _____ disease.",
        options: ["Alzheimer's", "Parkinson's", "Crohn's", "Paget's"],
        answer: "Alzheimer's",
        explanation: "Donepezil is the classic first-line cholinesterase inhibitor for Alzheimer's disease.",
        objective: .indication,
        relatedDrugIds: ["d264"],
        tags: ["9d", "fill-blank", "donepezil", "indication"],
        source: .curated
    ),

    .fillBlank(
        id: "q9d_sup_007",
        subsectionId: "9d",
        difficulty: .medium,
        question: "Topiramate is remembered by the nickname \"Dopamax\" because it commonly causes cognitive slowing and _____.",
        options: ["Weight loss", "Weight gain", "Hypertension", "Bradycardia"],
        answer: "Weight loss",
        explanation: "Topiramate causes weight loss (unlike most other antiepileptics) and cognitive slowing, earning the nickname \"Dopamax.\"",
        objective: .adverseEffect,
        relatedDrugIds: ["d271"],
        tags: ["9d", "fill-blank", "topiramate", "weight-loss"],
        source: .curated
    ),

    .multipleChoice(
        id: "q9d_sup_008",
        subsectionId: "9d",
        difficulty: .medium,
        question: "A patient takes sumatriptan for an acute migraine and reports transient chest tightness and tingling. Which interpretation is most accurate?",
        options: ["These are common triptan sensations and usually benign, but cardiac causes should be ruled out in at-risk patients", "This always confirms myocardial infarction", "This is a sign of melatonin overdose", "This proves the patient has serotonin syndrome", "This is expected meclizine toxicity"],
        answer: "These are common triptan sensations and usually benign, but cardiac causes should be ruled out in at-risk patients",
        explanation: "Chest tightness, paresthesias, and flushing are common triptan effects. While usually benign, cardiac evaluation is warranted in patients with cardiovascular risk factors.",
        objective: .adverseEffect,
        relatedDrugIds: ["d270"],
        tags: ["9d", "sumatriptan", "chest-tightness", "safety"],
        source: .curated
    ),

    .multipleChoice(
        id: "q9d_sup_009",
        subsectionId: "9d",
        difficulty: .medium,
        question: "A patient takes rizatriptan for acute migraine and later develops chest pressure and paresthesias in the fingers. Which adverse-effect pattern is this most consistent with?",
        options: ["Common triptan sensations (chest tightness, paresthesias)", "Gingival hyperplasia from phenytoin", "Impulse control disorder from a dopamine agonist", "Metabolic acidosis from topiramate", "Hyponatremia from oxcarbazepine"],
        answer: "Common triptan sensations (chest tightness, paresthesias)",
        explanation: "Rizatriptan, like other triptans, commonly causes transient chest tightness, dizziness, and paresthesias.",
        objective: .adverseEffect,
        relatedDrugIds: ["d269"],
        tags: ["9d", "rizatriptan", "adverse-effect"],
        source: .curated
    ),

    .multipleChoice(
        id: "q9d_sup_010",
        subsectionId: "9d",
        difficulty: .easy,
        question: "Melatonin is classified as which type of product?",
        options: ["OTC hormone supplement", "Prescription anticonvulsant", "Controlled substance benzodiazepine", "Prescription triptan", "Injectable biologic"],
        answer: "OTC hormone supplement",
        explanation: "Melatonin is an over-the-counter hormone supplement used for sleep and circadian rhythm concerns.",
        objective: .classId,
        relatedDrugIds: ["d266"],
        tags: ["9d", "melatonin", "class", "foundation"],
        source: .curated
    ),

    .multipleChoice(
        id: "q9d_sup_011",
        subsectionId: "9d",
        difficulty: .medium,
        question: "Which 9d drug is teratogenic and associated with cleft lip/palate, making pregnancy counseling essential?",
        options: ["Topiramate", "Meclizine", "Melatonin", "Donepezil", "Memantine"],
        answer: "Topiramate",
        explanation: "Topiramate is teratogenic and associated with increased risk of oral clefts. Effective contraception counseling is critical.",
        objective: .contraindication,
        relatedDrugIds: ["d271"],
        tags: ["9d", "topiramate", "pregnancy", "differentiator"],
        source: .curated
    ),

    ]
}
