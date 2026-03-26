import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9c_supplement: [Question] = [

    .matching(
        id: "q9c_sup_001",
        subsectionId: "9c",
        difficulty: .medium,
        question: "Match each newer seizure/tremor agent to its brand name:",
        pairs: [
            MatchingPair(left: "Lamotrigine", right: "Lamictal"),
            MatchingPair(left: "Levetiracetam", right: "Keppra"),
            MatchingPair(left: "Oxcarbazepine", right: "Trileptal"),
            MatchingPair(left: "Primidone", right: "Mysoline"),
        ],
        explanation: "Lamotrigine = Lamictal, Levetiracetam = Keppra, Oxcarbazepine = Trileptal, Primidone = Mysoline.",
        objective: .brandGeneric,
        relatedDrugIds: ["d94", "d95", "d262", "d263"],
        tags: ["9c", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q9c_sup_002",
        subsectionId: "9c",
        difficulty: .hard,
        question: "Match each newer seizure agent to its hallmark teaching pearl:",
        pairs: [
            MatchingPair(left: "Lamotrigine", right: "Slow titration to prevent SJS"),
            MatchingPair(left: "Levetiracetam", right: "\"Keppra rage\" behavioral changes"),
            MatchingPair(left: "Oxcarbazepine", right: "Hyponatremia risk"),
            MatchingPair(left: "Primidone", right: "Metabolized to phenobarbital"),
        ],
        explanation: "Lamotrigine → SJS titration, Levetiracetam → behavioral changes, Oxcarbazepine → hyponatremia, Primidone → phenobarbital metabolism.",
        objective: .pearl,
        relatedDrugIds: ["d94", "d95", "d262", "d263"],
        tags: ["9c", "matching", "pearls", "differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q9c_sup_003",
        subsectionId: "9c",
        difficulty: .hard,
        question: "Select ALL 9c medications that work primarily through sodium-channel blockade:",
        options: ["Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Primidone"],
        correctAnswers: ["Lamotrigine", "Oxcarbazepine"],
        explanation: "Lamotrigine and oxcarbazepine are sodium-channel blockers. Levetiracetam binds SV2A. Primidone enhances GABA via barbiturate-like activity.",
        objective: .moa,
        relatedDrugIds: ["d94", "d95", "d262", "d263"],
        tags: ["9c", "select-all", "moa"],
        source: .curated
    ),

    .selectAll(
        id: "q9c_sup_004",
        subsectionId: "9c",
        difficulty: .medium,
        question: "Select ALL 9c agents that can reduce hormonal contraceptive effectiveness:",
        options: ["Oxcarbazepine", "Lamotrigine", "Levetiracetam", "Primidone"],
        correctAnswers: ["Oxcarbazepine"],
        explanation: "Oxcarbazepine can reduce hormonal contraceptive effectiveness. Lamotrigine has a bidirectional interaction (estrogen lowers lamotrigine levels) but does not reduce OCP efficacy. Levetiracetam and primidone are not major inducers of OCP metabolism.",
        objective: .interaction,
        relatedDrugIds: ["d262", "d94", "d95", "d263"],
        tags: ["9c", "select-all", "contraception"],
        source: .curated
    ),

    .fillBlank(
        id: "q9c_sup_005",
        subsectionId: "9c",
        difficulty: .easy,
        question: "Lamotrigine must be titrated _____ to reduce the risk of Stevens-Johnson syndrome.",
        options: ["Slowly", "Rapidly", "Only at bedtime", "Only with food"],
        answer: "Slowly",
        explanation: "Slow titration of lamotrigine is the #1 teaching pearl for reducing serious rash risk including SJS/TEN.",
        objective: .adverseEffect,
        relatedDrugIds: ["d94"],
        tags: ["9c", "fill-blank", "lamotrigine", "titration"],
        source: .curated
    ),

    .fillBlank(
        id: "q9c_sup_006",
        subsectionId: "9c",
        difficulty: .medium,
        question: "Levetiracetam binds the synaptic vesicle protein _____, which is its unique mechanism of action.",
        options: ["SV2A", "NMDA", "GABA-A", "COX-2"],
        answer: "SV2A",
        explanation: "Levetiracetam's mechanism involves binding synaptic vesicle protein SV2A, distinguishing it from sodium-channel and GABA-ergic agents.",
        objective: .moa,
        relatedDrugIds: ["d95"],
        tags: ["9c", "fill-blank", "levetiracetam", "SV2A"],
        source: .curated
    ),

    .multipleChoice(
        id: "q9c_sup_007",
        subsectionId: "9c",
        difficulty: .hard,
        question: "Which 9c agent is preferred in a patient with bipolar depression who also needs seizure control, making it a dual-purpose choice?",
        options: ["Lamotrigine", "Levetiracetam", "Oxcarbazepine", "Primidone", "Carbamazepine"],
        answer: "Lamotrigine",
        explanation: "Lamotrigine is the standout 9c drug for both seizure control and bipolar depression maintenance, making it a key within-class differentiator.",
        objective: .indication,
        relatedDrugIds: ["d94"],
        tags: ["9c", "differentiator", "lamotrigine", "bipolar"],
        source: .curated
    ),

    ]
}
