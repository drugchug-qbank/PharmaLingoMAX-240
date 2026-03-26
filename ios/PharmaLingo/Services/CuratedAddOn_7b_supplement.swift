import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7b_supplement: [Question] = [
    .multipleChoice(
        id: "q7b_sup_001",
        subsectionId: "7b",
        difficulty: .easy,
        question: "What is the standard rescue dosing for albuterol MDI in acute bronchospasm?",
        options: ["2 puffs every 4-6 hours as needed", "1 puff once daily", "4 puffs every hour around the clock", "1 puff weekly for maintenance", "6 puffs at bedtime only"],
        answer: "2 puffs every 4-6 hours as needed",
        explanation: "Albuterol MDI is dosed at 2 puffs every 4-6 hours as needed for acute bronchospasm. Overuse signals the need for controller therapy reassessment.",
        objective: .dosing,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_sup_002",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient wants to prevent exercise-induced bronchospasm. When should albuterol be used before exercise?",
        options: ["15-30 minutes before exercise", "2 hours before exercise", "Immediately after exercise starts", "The night before exercise", "Only after symptoms begin"],
        answer: "15-30 minutes before exercise",
        explanation: "Albuterol should be taken 15-30 minutes before exercise to prevent exercise-induced bronchospasm. This allows time for the drug to reach peak bronchodilation.",
        objective: .dosing,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "exercise", "dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_sup_003",
        subsectionId: "7b",
        difficulty: .medium,
        question: "What is the standard maintenance dose of tiotropium via Spiriva HandiHaler?",
        options: ["18 mcg (1 capsule) inhaled once daily", "2 puffs every 4 hours as needed", "90 mcg inhaled twice daily", "250 mcg orally once daily", "5 mg nebulized every 6 hours"],
        answer: "18 mcg (1 capsule) inhaled once daily",
        explanation: "Tiotropium via HandiHaler is dosed at 18 mcg (one capsule) inhaled once daily. The capsule is for inhalation through the device, NOT for swallowing.",
        objective: .dosing,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "dosing", "HandiHaler"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_sup_004",
        subsectionId: "7b",
        difficulty: .medium,
        question: "What is the once-daily dose of Anoro Ellipta for COPD maintenance?",
        options: ["62.5/25 mcg inhaled once daily", "250/50 mcg inhaled twice daily", "18 mcg inhaled once daily", "2 puffs every 4-6 hours as needed", "500 mcg orally once daily"],
        answer: "62.5/25 mcg inhaled once daily",
        explanation: "Anoro Ellipta (umeclidinium 62.5 mcg / vilanterol 25 mcg) is inhaled once daily for COPD maintenance. It is not a rescue inhaler.",
        objective: .dosing,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_sup_005",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A patient with known hypersensitivity to atropine is prescribed an inhaled anticholinergic. Which drug carries a specific contraindication for this allergy?",
        options: ["Ipratropium", "Albuterol", "Levalbuterol", "Montelukast", "Fluticasone (inhaled)"],
        answer: "Ipratropium",
        explanation: "Ipratropium is contraindicated in patients with hypersensitivity to atropine or its derivatives because it is structurally related to atropine.",
        objective: .contraindication,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "contraindication", "atropine"],
        source: .curated
    ),

    .matching(
        id: "q7b_sup_006",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Match each bronchodilator to its dosing schedule:",
        pairs: [
            MatchingPair(left: "Albuterol", right: "2 puffs every 4-6 hours PRN"),
            MatchingPair(left: "Tiotropium", right: "18 mcg inhaled once daily"),
            MatchingPair(left: "Umeclidinium/Vilanterol", right: "62.5/25 mcg once daily"),
        ],
        explanation: "Albuterol is rescue (PRN), while tiotropium and Anoro Ellipta are once-daily maintenance inhalers for COPD.",
        objective: .dosing,
        relatedDrugIds: ["d120", "d123", "d124"],
        tags: ["7b", "dosing", "matching"],
        source: .curated
    ),

    .matching(
        id: "q7b_sup_007",
        subsectionId: "7b",
        difficulty: .hard,
        question: "Match each bronchodilator to its drug class:",
        pairs: [
            MatchingPair(left: "Albuterol", right: "SABA"),
            MatchingPair(left: "Ipratropium", right: "Short-acting Anticholinergic"),
            MatchingPair(left: "Tiotropium", right: "LAMA"),
            MatchingPair(left: "Umeclidinium/Vilanterol", right: "LAMA/LABA Combination"),
        ],
        explanation: "Rescue SABAs (albuterol), short-acting anticholinergics (ipratropium), long-acting LAMAs (tiotropium), and dual LAMA/LABA combos (Anoro) each fill different roles.",
        objective: .classId,
        relatedDrugIds: ["d120", "d122", "d123", "d124"],
        tags: ["7b", "class", "matching"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_sup_008",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A patient with severe milk protein allergy needs COPD maintenance therapy. Which inhaler from this subsection is specifically contraindicated?",
        options: ["Umeclidinium/Vilanterol (Anoro Ellipta)", "Albuterol (ProAir)", "Ipratropium (Atrovent)", "Tiotropium (Spiriva Respimat)", "Levalbuterol (Xopenex)"],
        answer: "Umeclidinium/Vilanterol (Anoro Ellipta)",
        explanation: "Anoro Ellipta contains lactose powder and is contraindicated in patients with severe milk protein allergy. Alternative COPD maintenance options should be used.",
        objective: .contraindication,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "milk-protein", "contraindication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_sup_009",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A 62-year-old with COPD presents to the ED with acute dyspnea and diffuse wheezing. He uses tiotropium daily but forgot his rescue inhaler at home. Which drug from this subsection should be administered first for rapid symptom relief?",
        options: ["Albuterol", "Tiotropium", "Umeclidinium/Vilanterol", "Ipratropium", "Levalbuterol"],
        answer: "Albuterol",
        explanation: "Albuterol is the first-line rescue SABA for acute bronchospasm. Tiotropium and Anoro are maintenance only. Ipratropium may be added but albuterol is the priority rescue agent.",
        objective: .indication,
        relatedDrugIds: ["d120", "d123"],
        tags: ["7b", "albuterol", "mini-case", "acute-COPD"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_sup_010",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A 70-year-old with stable COPD uses albuterol 6-8 times daily. His FEV1 is 45% predicted. The clinician wants to add once-daily maintenance bronchodilation without an inhaled steroid. Which drug from this subsection is most appropriate?",
        options: ["Tiotropium", "Ipratropium", "Levalbuterol", "Albuterol scheduled", "Umeclidinium/Vilanterol"],
        answer: "Tiotropium",
        explanation: "Tiotropium is the once-daily LAMA maintenance cornerstone for COPD. Frequent albuterol use signals inadequate maintenance therapy. Anoro would also work but adds a LABA; tiotropium as single-agent LAMA is the classic first step.",
        objective: .indication,
        relatedDrugIds: ["d123", "d120"],
        tags: ["7b", "tiotropium", "mini-case", "COPD-maintenance"],
        source: .curated
    ),
    ]
}
