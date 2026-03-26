import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_9b_supplement: [Question] = [

    .matching(
        id: "q9b_sup_001",
        subsectionId: "9b",
        difficulty: .medium,
        question: "Match each classic antiepileptic to its brand name:",
        pairs: [
            MatchingPair(left: "Carbamazepine", right: "Tegretol"),
            MatchingPair(left: "Phenytoin", right: "Dilantin"),
            MatchingPair(left: "Valproic acid", right: "Depakote"),
        ],
        explanation: "Carbamazepine = Tegretol, Phenytoin = Dilantin, Valproic acid = Depakote.",
        objective: .brandGeneric,
        relatedDrugIds: ["d96", "d97", "d93"],
        tags: ["9b", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q9b_sup_002",
        subsectionId: "9b",
        difficulty: .hard,
        question: "Match each classic antiepileptic to its hallmark adverse effect:",
        pairs: [
            MatchingPair(left: "Phenytoin", right: "Gingival hyperplasia"),
            MatchingPair(left: "Carbamazepine", right: "SIADH / hyponatremia"),
            MatchingPair(left: "Valproic acid", right: "Neural tube defects"),
        ],
        explanation: "Phenytoin → gingival hyperplasia, Carbamazepine → SIADH, Valproic acid → teratogenicity (neural tube defects).",
        objective: .adverseEffect,
        relatedDrugIds: ["d97", "d96", "d93"],
        tags: ["9b", "matching", "adverse-effects", "differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q9b_sup_003",
        subsectionId: "9b",
        difficulty: .hard,
        question: "Select ALL classic antiepileptics in this subsection that carry a boxed warning for serious dermatologic reactions (SJS/TEN):",
        options: ["Carbamazepine", "Phenytoin", "Valproic acid"],
        correctAnswers: ["Carbamazepine"],
        explanation: "Carbamazepine has the strongest SJS/TEN association with HLA-B*1502 screening. Phenytoin can cause SJS but lacks the same pharmacogenomic screening pearl. Valproic acid's boxed warnings are for hepatotoxicity, pancreatitis, and teratogenicity.",
        objective: .contraindication,
        relatedDrugIds: ["d96", "d97", "d93"],
        tags: ["9b", "select-all", "SJS"],
        source: .curated
    ),

    .selectAll(
        id: "q9b_sup_004",
        subsectionId: "9b",
        difficulty: .medium,
        question: "Select ALL classic antiepileptics that require therapeutic drug monitoring:",
        options: ["Carbamazepine", "Phenytoin", "Valproic acid", "Levetiracetam", "Meclizine"],
        correctAnswers: ["Carbamazepine", "Phenytoin", "Valproic acid"],
        explanation: "All three classic antiepileptics in 9b require serum level monitoring. Levetiracetam and meclizine do not.",
        objective: .monitoring,
        relatedDrugIds: ["d96", "d97", "d93"],
        tags: ["9b", "select-all", "TDM"],
        source: .curated
    ),

    .fillBlank(
        id: "q9b_sup_005",
        subsectionId: "9b",
        difficulty: .medium,
        question: "Phenytoin is famous for _____ kinetics, meaning small dose changes can cause disproportionately large increases in drug level.",
        options: ["Zero-order", "First-order", "Second-order", "Linear"],
        answer: "Zero-order",
        explanation: "Phenytoin exhibits zero-order (saturable) kinetics at therapeutic concentrations, making dose adjustments tricky.",
        objective: .pearl,
        relatedDrugIds: ["d97"],
        tags: ["9b", "fill-blank", "phenytoin", "kinetics"],
        source: .curated
    ),

    .fillBlank(
        id: "q9b_sup_006",
        subsectionId: "9b",
        difficulty: .easy,
        question: "Before starting carbamazepine in patients of certain ancestries, screening for _____ is recommended to reduce the risk of SJS/TEN.",
        options: ["HLA-B*1502", "HLA-B*5701", "TPMT", "G6PD"],
        answer: "HLA-B*1502",
        explanation: "HLA-B*1502 testing is a classic pharmacogenomic pearl for carbamazepine-associated SJS/TEN risk.",
        objective: .contraindication,
        relatedDrugIds: ["d96"],
        tags: ["9b", "fill-blank", "carbamazepine", "pharmacogenomics"],
        source: .curated
    ),

    .matching(
        id: "q9b_sup_007",
        subsectionId: "9b",
        difficulty: .hard,
        question: "Match each classic antiepileptic to its key pharmacokinetic pearl:",
        pairs: [
            MatchingPair(left: "Phenytoin", right: "Zero-order kinetics"),
            MatchingPair(left: "Carbamazepine", right: "Autoinduction"),
            MatchingPair(left: "Valproic acid", right: "Broad-spectrum (covers absence seizures)"),
        ],
        explanation: "Phenytoin = zero-order kinetics, Carbamazepine = autoinduction (induces own metabolism), Valproic acid = broadest coverage including absence.",
        objective: .pearl,
        relatedDrugIds: ["d97", "d96", "d93"],
        tags: ["9b", "matching", "pk-pearls", "differentiator"],
        source: .curated
    ),

    ]
}
