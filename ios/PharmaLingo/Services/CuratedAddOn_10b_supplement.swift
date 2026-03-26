import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_10b_supplement: [Question] = [
        .matching(id: "q10b_sup_001", subsectionId: "10b", difficulty: .medium,
            question: "Match each osteoporosis drug to its brand name:",
            pairs: [
                MatchingPair(left: "Alendronate", right: "Fosamax"),
                MatchingPair(left: "Risedronate", right: "Actonel"),
                MatchingPair(left: "Denosumab", right: "Prolia"),
                MatchingPair(left: "Teriparatide", right: "Forteo")
            ],
            explanation: "Key brand-generic pairs for osteoporosis medications.",
            objective: .brandGeneric, relatedDrugIds: ["d171", "d172", "d174", "d175"], tags: ["10b", "matching", "brand-generic"]),

        .matching(id: "q10b_sup_002", subsectionId: "10b", difficulty: .hard,
            question: "Match each osteoporosis drug to its dosing route and frequency:",
            pairs: [
                MatchingPair(left: "Alendronate", right: "Oral weekly"),
                MatchingPair(left: "Zoledronic acid", right: "IV once yearly"),
                MatchingPair(left: "Denosumab", right: "SubQ every 6 months"),
                MatchingPair(left: "Teriparatide", right: "SubQ daily")
            ],
            explanation: "Each bone medication has a distinctive administration schedule that is high yield for exams.",
            objective: .dosing, relatedDrugIds: ["d171", "d173", "d174", "d175"], tags: ["10b", "matching", "dosing"]),

        .matching(id: "q10b_sup_003", subsectionId: "10b", difficulty: .hard,
            question: "Match each osteoporosis drug to its mechanism:",
            pairs: [
                MatchingPair(left: "Alendronate", right: "Inhibits osteoclast resorption"),
                MatchingPair(left: "Denosumab", right: "Binds RANKL"),
                MatchingPair(left: "Teriparatide", right: "Anabolic PTH analog"),
                MatchingPair(left: "Zoledronic acid", right: "IV bisphosphonate")
            ],
            explanation: "Osteoporosis drugs use distinct mechanisms: bisphosphonates inhibit osteoclasts, denosumab blocks RANKL, and teriparatide builds new bone.",
            objective: .moa, relatedDrugIds: ["d171", "d174", "d175", "d173"], tags: ["10b", "matching", "moa"]),

        .selectAll(id: "q10b_sup_004", subsectionId: "10b", difficulty: .hard,
            question: "Select ALL bisphosphonates in this subsection:",
            options: ["Alendronate", "Risedronate", "Zoledronic acid", "Denosumab", "Teriparatide"],
            correctAnswers: ["Alendronate", "Risedronate", "Zoledronic acid"],
            explanation: "Alendronate, risedronate, and zoledronic acid are bisphosphonates (-dronate suffix). Denosumab is a RANKL inhibitor and teriparatide is a PTH analog.",
            objective: .classId, relatedDrugIds: ["d171", "d172", "d173"], tags: ["10b", "select-all", "bisphosphonate"]),

        .selectAll(id: "q10b_sup_005", subsectionId: "10b", difficulty: .hard,
            question: "Select ALL osteoporosis drugs that require correction of hypocalcemia before starting:",
            options: ["Alendronate", "Zoledronic acid", "Denosumab", "Teriparatide", "All of the above"],
            correctAnswers: ["Alendronate", "Zoledronic acid", "Denosumab"],
            explanation: "Pre-existing hypocalcemia should be corrected before starting any antiresorptive bone therapy. Teriparatide can worsen hypercalcemia rather than hypocalcemia.",
            objective: .monitoring, relatedDrugIds: ["d171", "d173", "d174"], tags: ["10b", "select-all", "hypocalcemia"]),

        .selectAll(id: "q10b_sup_006", subsectionId: "10b", difficulty: .hard,
            question: "Select ALL osteoporosis drugs associated with osteonecrosis of the jaw (ONJ):",
            options: ["Alendronate", "Risedronate", "Zoledronic acid", "Denosumab", "Teriparatide"],
            correctAnswers: ["Alendronate", "Risedronate", "Zoledronic acid", "Denosumab"],
            explanation: "All bisphosphonates and denosumab have been associated with ONJ. Teriparatide, as an anabolic agent, is not associated with ONJ.",
            objective: .adverseEffect, relatedDrugIds: ["d171", "d172", "d173", "d174"], tags: ["10b", "select-all", "onj"]),

        .multipleChoice(id: "q10b_sup_007", subsectionId: "10b", difficulty: .hard,
            question: "Which osteoporosis drug is the only anabolic option in this subsection that builds new bone rather than slowing breakdown?",
            options: ["Teriparatide", "Alendronate", "Denosumab", "Zoledronic acid", "Risedronate"],
            answer: "Teriparatide",
            explanation: "Teriparatide is the only anabolic (bone-building) agent. All others are antiresorptive.",
            objective: .mixedReview, relatedDrugIds: ["d175"], tags: ["10b", "differentiator", "anabolic"]),

        .multipleChoice(id: "q10b_sup_008", subsectionId: "10b", difficulty: .hard,
            question: "Which feature best distinguishes denosumab from the bisphosphonates in this subsection?",
            options: ["It is a RANKL inhibitor given SubQ every 6 months and has rebound fracture risk if delayed", "It is an oral bisphosphonate requiring fasting and upright posture", "It is an IV infusion given once yearly", "It builds new bone like a PTH analog", "It requires sulfa allergy screening"],
            answer: "It is a RANKL inhibitor given SubQ every 6 months and has rebound fracture risk if delayed",
            explanation: "Denosumab's RANKL mechanism, SubQ route, and rebound fracture risk on discontinuation distinguish it from bisphosphonates.",
            objective: .mixedReview, relatedDrugIds: ["d174"], tags: ["10b", "differentiator", "denosumab"]),
    ]
}
