import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_10d_supplement: [Question] = [
        .matching(id: "q10d_sup_001", subsectionId: "10d", difficulty: .medium,
            question: "Match each smoking cessation drug to its brand name:",
            pairs: [
                MatchingPair(left: "Nicotine patch", right: "Nicoderm CQ"),
                MatchingPair(left: "Nicotine gum", right: "Nicorette"),
                MatchingPair(left: "Bupropion SR", right: "Zyban"),
                MatchingPair(left: "Varenicline", right: "Chantix")
            ],
            explanation: "Key brand-generic pairs for smoking cessation agents.",
            objective: .brandGeneric, relatedDrugIds: ["d301", "d302", "d304", "d305"], tags: ["10d", "matching", "brand-generic"]),

        .matching(id: "q10d_sup_002", subsectionId: "10d", difficulty: .hard,
            question: "Match each smoking cessation agent to its mechanism:",
            pairs: [
                MatchingPair(left: "Nicotine patch", right: "Steady nicotine replacement"),
                MatchingPair(left: "Nicotine gum", right: "Short-acting oral mucosal NRT"),
                MatchingPair(left: "Bupropion SR", right: "NE/DA reuptake inhibitor"),
                MatchingPair(left: "Varenicline", right: "Partial nicotinic agonist")
            ],
            explanation: "Each smoking cessation medication works through a distinct mechanism.",
            objective: .moa, relatedDrugIds: ["d301", "d302", "d304", "d305"], tags: ["10d", "matching", "moa"]),

        .matching(id: "q10d_sup_003", subsectionId: "10d", difficulty: .hard,
            question: "Match each smoking cessation drug to its high-yield adverse effect:",
            pairs: [
                MatchingPair(left: "Nicotine patch", right: "Vivid dreams / skin irritation"),
                MatchingPair(left: "Nicotine gum", right: "Hiccups / jaw soreness"),
                MatchingPair(left: "Bupropion SR", right: "Insomnia / seizure risk"),
                MatchingPair(left: "Varenicline", right: "Nausea / vivid dreams")
            ],
            explanation: "Each cessation agent has a distinctive adverse effect profile.",
            objective: .adverseEffect, relatedDrugIds: ["d301", "d302", "d304", "d305"], tags: ["10d", "matching", "adverse-effects"]),

        .selectAll(id: "q10d_sup_004", subsectionId: "10d", difficulty: .hard,
            question: "Select ALL nicotine replacement therapy products in this subsection:",
            options: ["Nicotine patch", "Nicotine gum", "Nicotine lozenge", "Bupropion SR", "Varenicline"],
            correctAnswers: ["Nicotine patch", "Nicotine gum", "Nicotine lozenge"],
            explanation: "The three NRT products provide nicotine directly. Bupropion and varenicline are non-nicotine prescription medications.",
            objective: .classId, relatedDrugIds: ["d301", "d302", "d303"], tags: ["10d", "select-all", "nrt"]),

        .selectAll(id: "q10d_sup_005", subsectionId: "10d", difficulty: .hard,
            question: "Select ALL smoking cessation medications that should be started BEFORE the quit date:",
            options: ["Bupropion SR", "Varenicline", "Nicotine patch", "Nicotine gum", "Nicotine lozenge"],
            correctAnswers: ["Bupropion SR", "Varenicline"],
            explanation: "Bupropion SR (1-2 weeks before) and varenicline (1 week before) are started before the quit date. NRT products are started on the quit date.",
            objective: .dosing, relatedDrugIds: ["d304", "d305"], tags: ["10d", "select-all", "quit-date"]),

        .selectAll(id: "q10d_sup_006", subsectionId: "10d", difficulty: .hard,
            question: "Select ALL conditions that are contraindications to bupropion SR for smoking cessation:",
            options: ["Seizure disorder", "Bulimia nervosa", "Anorexia nervosa", "Mild hypertension", "Nicotine dependence"],
            correctAnswers: ["Seizure disorder", "Bulimia nervosa", "Anorexia nervosa"],
            explanation: "Bupropion SR is contraindicated in seizure disorders and eating disorders (bulimia, anorexia) because it lowers seizure threshold.",
            objective: .contraindication, relatedDrugIds: ["d304"], tags: ["10d", "select-all", "bupropion-ci"]),

        .multipleChoice(id: "q10d_sup_007", subsectionId: "10d", difficulty: .hard,
            question: "Which feature best distinguishes varenicline from bupropion SR as a smoking cessation medication?",
            options: ["Varenicline is a partial nicotinic agonist that both reduces cravings and blocks smoking reward", "Bupropion is a partial nicotinic agonist", "Varenicline contains nicotine replacement", "Bupropion has no seizure risk", "Varenicline is an OTC product"],
            answer: "Varenicline is a partial nicotinic agonist that both reduces cravings and blocks smoking reward",
            explanation: "Varenicline's partial agonism at nicotinic receptors provides a dual benefit: mild receptor stimulation to ease withdrawal plus competitive blockade to reduce the rewarding effect of smoking.",
            objective: .mixedReview, relatedDrugIds: ["d305", "d304"], tags: ["10d", "differentiator", "varenicline-vs-bupropion"]),

        .multipleChoice(id: "q10d_sup_008", subsectionId: "10d", difficulty: .hard,
            question: "Which short-acting NRT product requires the 'chew-and-park' technique rather than dissolving in the mouth?",
            options: ["Nicotine gum", "Nicotine lozenge", "Nicotine patch", "Bupropion SR", "Varenicline"],
            answer: "Nicotine gum",
            explanation: "Nicotine gum uses the chew-and-park technique. The lozenge dissolves slowly without chewing. The patch is applied to skin.",
            objective: .mixedReview, relatedDrugIds: ["d302", "d303"], tags: ["10d", "differentiator", "gum-vs-lozenge"]),
    ]
}
