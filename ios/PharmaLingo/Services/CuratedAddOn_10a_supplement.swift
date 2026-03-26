import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_10a_supplement: [Question] = [
        .matching(id: "q10a_sup_001", subsectionId: "10a", difficulty: .medium,
            question: "Match each BPH/OAB drug to its brand name:",
            pairs: [
                MatchingPair(left: "Tamsulosin", right: "Flomax"),
                MatchingPair(left: "Finasteride", right: "Proscar"),
                MatchingPair(left: "Oxybutynin", right: "Ditropan"),
                MatchingPair(left: "Mirabegron", right: "Myrbetriq")
            ],
            explanation: "Key brand-generic pairs for BPH and overactive bladder medications.",
            objective: .brandGeneric, relatedDrugIds: ["d188", "d189", "d191", "d192"], tags: ["10a", "matching", "brand-generic"]),

        .matching(id: "q10a_sup_002", subsectionId: "10a", difficulty: .medium,
            question: "Match each drug to its mechanism of action:",
            pairs: [
                MatchingPair(left: "Tamsulosin", right: "Alpha-1 blocker"),
                MatchingPair(left: "Finasteride", right: "5-alpha reductase inhibitor"),
                MatchingPair(left: "Mirabegron", right: "Beta-3 agonist"),
                MatchingPair(left: "Sildenafil", right: "PDE-5 inhibitor")
            ],
            explanation: "Each drug class in this subsection has a distinct mechanism targeting urologic conditions.",
            objective: .moa, relatedDrugIds: ["d188", "d189", "d192", "d193"], tags: ["10a", "matching", "moa"]),

        .matching(id: "q10a_sup_003", subsectionId: "10a", difficulty: .hard,
            question: "Match each drug to its high-yield adverse effect:",
            pairs: [
                MatchingPair(left: "Tamsulosin", right: "Orthostatic hypotension"),
                MatchingPair(left: "Oxybutynin", right: "Dry mouth / cognitive fog"),
                MatchingPair(left: "Phenazopyridine", right: "Orange-red urine"),
                MatchingPair(left: "Sildenafil", right: "Visual changes / flushing")
            ],
            explanation: "Each urologic medication has a distinctive adverse effect profile.",
            objective: .adverseEffect, relatedDrugIds: ["d188", "d191", "d274", "d193"], tags: ["10a", "matching", "adverse-effects"]),

        .selectAll(id: "q10a_sup_004", subsectionId: "10a", difficulty: .hard,
            question: "Select ALL drugs from this subsection that are 5-alpha reductase inhibitors:",
            options: ["Finasteride", "Dutasteride", "Tamsulosin", "Mirabegron", "Tadalafil"],
            correctAnswers: ["Finasteride", "Dutasteride"],
            explanation: "Finasteride and dutasteride are the two 5-alpha reductase inhibitors. Tamsulosin is an alpha-1 blocker, mirabegron is a beta-3 agonist, and tadalafil is a PDE-5 inhibitor.",
            objective: .classId, relatedDrugIds: ["d189", "d190"], tags: ["10a", "select-all", "5ari"]),

        .selectAll(id: "q10a_sup_005", subsectionId: "10a", difficulty: .hard,
            question: "Select ALL drugs that should NEVER be combined with nitrates:",
            options: ["Sildenafil", "Tadalafil", "Tamsulosin", "Finasteride", "Phenazopyridine"],
            correctAnswers: ["Sildenafil", "Tadalafil"],
            explanation: "Both PDE-5 inhibitors (sildenafil and tadalafil) are contraindicated with nitrates due to severe hypotension risk.",
            objective: .contraindication, relatedDrugIds: ["d193", "d194"], tags: ["10a", "select-all", "nitrates"]),

        .selectAll(id: "q10a_sup_006", subsectionId: "10a", difficulty: .hard,
            question: "Select ALL anticholinergic (antimuscarinic) overactive bladder drugs in this subsection:",
            options: ["Oxybutynin", "Solifenacin", "Mirabegron", "Tamsulosin", "Phenazopyridine"],
            correctAnswers: ["Oxybutynin", "Solifenacin"],
            explanation: "Oxybutynin and solifenacin are antimuscarinics. Mirabegron is a beta-3 agonist and is the non-anticholinergic OAB option.",
            objective: .classId, relatedDrugIds: ["d191", "d275"], tags: ["10a", "select-all", "anticholinergic"]),

        .multipleChoice(id: "q10a_sup_007", subsectionId: "10a", difficulty: .hard,
            question: "A patient needs both prostate symptom relief AND prostate size reduction. Which pair of drugs is most appropriate?",
            options: ["Tamsulosin + finasteride", "Mirabegron + oxybutynin", "Sildenafil + phenazopyridine", "Solifenacin + dutasteride", "Tadalafil + mirabegron"],
            answer: "Tamsulosin + finasteride",
            explanation: "Combination therapy with an alpha-1 blocker (tamsulosin) for fast relief plus a 5-alpha reductase inhibitor (finasteride) for prostate shrinkage is a classic BPH strategy.",
            objective: .mixedReview, relatedDrugIds: ["d188", "d189"], tags: ["10a", "differentiator", "combination"]),

        .multipleChoice(id: "q10a_sup_008", subsectionId: "10a", difficulty: .hard,
            question: "Which feature best distinguishes tadalafil from sildenafil in clinical practice?",
            options: ["Tadalafil has a much longer duration (~36 hours) and is also approved for BPH", "Sildenafil lasts longer and treats BPH", "Tadalafil can be safely used with nitrates", "Sildenafil is a beta-3 agonist", "Tadalafil is an anticholinergic"],
            answer: "Tadalafil has a much longer duration (~36 hours) and is also approved for BPH",
            explanation: "Tadalafil's ~36 hour duration and dual ED/BPH indication distinguish it from sildenafil.",
            objective: .mixedReview, relatedDrugIds: ["d193", "d194"], tags: ["10a", "differentiator", "pde5"]),
    ]
}
