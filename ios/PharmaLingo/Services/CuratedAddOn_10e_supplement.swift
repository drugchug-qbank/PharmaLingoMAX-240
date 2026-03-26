import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_10e_supplement: [Question] = [
        .matching(id: "q10e_sup_001", subsectionId: "10e", difficulty: .medium,
            question: "Match each glaucoma drug to its brand name:",
            pairs: [
                MatchingPair(left: "Latanoprost", right: "Xalatan"),
                MatchingPair(left: "Timolol", right: "Timoptic"),
                MatchingPair(left: "Dorzolamide", right: "Trusopt"),
                MatchingPair(left: "Brimonidine", right: "Alphagan")
            ],
            explanation: "Key brand-generic pairs for glaucoma medications.",
            objective: .brandGeneric, relatedDrugIds: ["d295", "d298", "d290", "d284"], tags: ["10e", "matching", "brand-generic"]),

        .matching(id: "q10e_sup_002", subsectionId: "10e", difficulty: .hard,
            question: "Match each glaucoma drug class to its mechanism:",
            pairs: [
                MatchingPair(left: "Latanoprost", right: "Increases uveoscleral outflow"),
                MatchingPair(left: "Timolol", right: "Reduces aqueous production (beta-blocker)"),
                MatchingPair(left: "Dorzolamide", right: "Reduces aqueous production (CAI)"),
                MatchingPair(left: "Brimonidine", right: "Alpha-2 agonist (dual mechanism)")
            ],
            explanation: "Each glaucoma drug class lowers IOP through a distinct mechanism.",
            objective: .moa, relatedDrugIds: ["d295", "d298", "d290", "d284"], tags: ["10e", "matching", "moa"]),

        .matching(id: "q10e_sup_003", subsectionId: "10e", difficulty: .medium,
            question: "Match each topical corticosteroid to its potency level:",
            pairs: [
                MatchingPair(left: "Clobetasol (Temovate)", right: "Super-high potency"),
                MatchingPair(left: "Betamethasone (Diprolene)", right: "High potency"),
                MatchingPair(left: "Triamcinolone (Kenalog)", right: "Medium potency"),
                MatchingPair(left: "Hydrocortisone", right: "Low potency")
            ],
            explanation: "Topical steroid potency ranking is high yield: clobetasol > betamethasone > triamcinolone > hydrocortisone.",
            objective: .classId, relatedDrugIds: ["d288", "d282", "d300"], tags: ["10e", "matching", "steroid-potency"]),

        .matching(id: "q10e_sup_004", subsectionId: "10e", difficulty: .medium,
            question: "Match each emergency/reversal agent to its indication:",
            pairs: [
                MatchingPair(left: "Epinephrine (EpiPen)", right: "Anaphylaxis"),
                MatchingPair(left: "Atropine", right: "Symptomatic bradycardia"),
                MatchingPair(left: "Flumazenil", right: "Benzodiazepine overdose")
            ],
            explanation: "Each emergency agent has a specific first-line indication.",
            objective: .indication, relatedDrugIds: ["d198", "d199", "d200"], tags: ["10e", "matching", "emergency"]),

        .selectAll(id: "q10e_sup_005", subsectionId: "10e", difficulty: .hard,
            question: "Select ALL prostaglandin analog eye drops used for glaucoma in this subsection:",
            options: ["Latanoprost", "Bimatoprost", "Timolol", "Dorzolamide", "Brimonidine"],
            correctAnswers: ["Latanoprost", "Bimatoprost"],
            explanation: "Latanoprost and bimatoprost are prostaglandin analogs. Timolol is a beta-blocker, dorzolamide is a CAI, and brimonidine is an alpha-2 agonist.",
            objective: .classId, relatedDrugIds: ["d295", "d283"], tags: ["10e", "select-all", "prostaglandin"]),

        .selectAll(id: "q10e_sup_006", subsectionId: "10e", difficulty: .hard,
            question: "Select ALL glaucoma drugs that should be avoided or used cautiously in patients with asthma or COPD:",
            options: ["Timolol", "Dorzolamide/Timolol (Cosopt)", "Latanoprost", "Brimonidine", "Bimatoprost"],
            correctAnswers: ["Timolol", "Dorzolamide/Timolol (Cosopt)"],
            explanation: "Timolol (a beta-blocker) can cause bronchospasm via systemic absorption. Cosopt contains timolol. The others are not beta-blockers.",
            objective: .contraindication, relatedDrugIds: ["d298", "d291"], tags: ["10e", "select-all", "asthma-caution"]),

        .selectAll(id: "q10e_sup_007", subsectionId: "10e", difficulty: .hard,
            question: "Select ALL topical products in this subsection that can cause skin atrophy with prolonged use:",
            options: ["Clobetasol", "Betamethasone", "Triamcinolone", "Mupirocin", "Tretinoin"],
            correctAnswers: ["Clobetasol", "Betamethasone", "Triamcinolone"],
            explanation: "All topical corticosteroids can cause skin atrophy with prolonged use. Mupirocin is a topical antibiotic and tretinoin is a retinoid.",
            objective: .adverseEffect, relatedDrugIds: ["d288", "d282", "d300"], tags: ["10e", "select-all", "atrophy"]),

        .multipleChoice(id: "q10e_sup_008", subsectionId: "10e", difficulty: .hard,
            question: "Which feature best distinguishes latanoprost from timolol as a glaucoma treatment?",
            options: ["Latanoprost increases outflow and causes iris color change; timolol reduces production and risks bronchospasm", "Timolol causes iris color change and eyelash growth", "Latanoprost is a beta-blocker that causes bradycardia", "Both drugs work identically with the same side effects", "Timolol is first-line and latanoprost is never used"],
            answer: "Latanoprost increases outflow and causes iris color change; timolol reduces production and risks bronchospasm",
            explanation: "Latanoprost (prostaglandin) increases uveoscleral outflow with iris color change risk. Timolol (beta-blocker) reduces aqueous production with systemic cardiovascular/pulmonary risks.",
            objective: .mixedReview, relatedDrugIds: ["d295", "d298"], tags: ["10e", "differentiator", "glaucoma"]),
    ]
}
