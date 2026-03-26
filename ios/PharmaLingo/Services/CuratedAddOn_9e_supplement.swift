import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9e_supplement: [Question] = [

    .matching(
        id: "q9e_sup_001",
        subsectionId: "9e",
        difficulty: .medium,
        question: "Match each Parkinson's dopamine agonist to its brand name:",
        pairs: [
            MatchingPair(left: "Pramipexole", right: "Mirapex"),
            MatchingPair(left: "Ropinirole", right: "Requip"),
        ],
        explanation: "Pramipexole = Mirapex, Ropinirole = Requip.",
        objective: .brandGeneric,
        relatedDrugIds: ["d272", "d273"],
        tags: ["9e", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q9e_sup_002",
        subsectionId: "9e",
        difficulty: .hard,
        question: "Match each dopamine agonist to its primary elimination route:",
        pairs: [
            MatchingPair(left: "Pramipexole", right: "Renal elimination"),
            MatchingPair(left: "Ropinirole", right: "Hepatic CYP1A2 metabolism"),
        ],
        explanation: "Pramipexole is largely renally eliminated. Ropinirole is metabolized by CYP1A2 (affected by smoking, ciprofloxacin).",
        objective: .pearl,
        relatedDrugIds: ["d272", "d273"],
        tags: ["9e", "matching", "pk", "differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q9e_sup_003",
        subsectionId: "9e",
        difficulty: .medium,
        question: "Select ALL indications shared by BOTH pramipexole and ropinirole:",
        options: ["Parkinson's disease", "Restless legs syndrome", "Essential tremor", "Alzheimer's disease", "Acute migraine"],
        correctAnswers: ["Parkinson's disease", "Restless legs syndrome"],
        explanation: "Both dopamine agonists are indicated for Parkinson's disease and restless legs syndrome. Essential tremor uses propranolol/primidone. Alzheimer's uses donepezil/memantine.",
        objective: .indication,
        relatedDrugIds: ["d272", "d273"],
        tags: ["9e", "select-all", "indications"],
        source: .curated
    ),

    .selectAll(
        id: "q9e_sup_004",
        subsectionId: "9e",
        difficulty: .hard,
        question: "Select ALL adverse effects that are high-yield for BOTH pramipexole and ropinirole:",
        options: ["Impulse control disorders", "Sudden onset of sleep", "Orthostatic hypotension", "Hallucinations", "Gingival hyperplasia"],
        correctAnswers: ["Impulse control disorders", "Sudden onset of sleep", "Orthostatic hypotension", "Hallucinations"],
        explanation: "Both dopamine agonists share impulse control disorders, somnolence/sleep attacks, orthostasis, and hallucinations. Gingival hyperplasia is a phenytoin pearl.",
        objective: .adverseEffect,
        relatedDrugIds: ["d272", "d273"],
        tags: ["9e", "select-all", "adverse-effects"],
        source: .curated
    ),

    .fillBlank(
        id: "q9e_sup_005",
        subsectionId: "9e",
        difficulty: .easy,
        question: "Pramipexole and ropinirole both belong to the _____ drug class.",
        options: ["Dopamine agonist", "Dopamine antagonist", "Cholinesterase inhibitor", "SSRI"],
        answer: "Dopamine agonist",
        explanation: "Both pramipexole and ropinirole are dopamine agonists that directly stimulate dopamine receptors.",
        objective: .classId,
        relatedDrugIds: ["d272", "d273"],
        tags: ["9e", "fill-blank", "class"],
        source: .curated
    ),

    .fillBlank(
        id: "q9e_sup_006",
        subsectionId: "9e",
        difficulty: .medium,
        question: "Dopamine agonists can cause _____ control disorders such as gambling, compulsive shopping, and hypersexuality.",
        options: ["Impulse", "Seizure", "Blood pressure", "Appetite"],
        answer: "Impulse",
        explanation: "Impulse control disorders are the hallmark behavioral adverse effect of dopamine agonists like pramipexole and ropinirole.",
        objective: .adverseEffect,
        relatedDrugIds: ["d272", "d273"],
        tags: ["9e", "fill-blank", "impulse-control"],
        source: .curated
    ),

    ]
}
