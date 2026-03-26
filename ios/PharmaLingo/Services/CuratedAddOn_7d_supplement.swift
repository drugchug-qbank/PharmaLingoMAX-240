import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7d_supplement: [Question] = [
    .multipleChoice(
        id: "q7d_sup_001",
        subsectionId: "7d",
        difficulty: .medium,
        question: "What is the standard adult dose of montelukast for chronic asthma control?",
        options: ["10 mg once daily in the evening", "5 mg twice daily with meals", "20 mg every 12 hours", "50 mg weekly injection", "100 mg at bedtime with food"],
        answer: "10 mg once daily in the evening",
        explanation: "Montelukast is dosed at 10 mg once daily in the evening for adult asthma and allergic rhinitis. The evening timing is a classic test pearl.",
        objective: .dosing,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_sup_002",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient starts roflumilast for COPD. What is the recommended starting dose before titrating to the maintenance dose?",
        options: ["250 mcg once daily for 4 weeks, then 500 mcg once daily", "500 mcg twice daily from day one", "125 mcg every 12 hours for 2 weeks", "1000 mcg once weekly", "500 mcg once daily from day one"],
        answer: "250 mcg once daily for 4 weeks, then 500 mcg once daily",
        explanation: "Roflumilast uses a 250 mcg starter dose for 4 weeks to improve tolerability before titrating to the 500 mcg once daily maintenance dose.",
        objective: .dosing,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "dosing", "titration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_sup_003",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Which monitoring parameter is most important for a patient on theophylline?",
        options: ["Serum theophylline levels (target 5-15 mcg/mL)", "Serum creatinine", "INR", "Hemoglobin A1c", "Serum uric acid"],
        answer: "Serum theophylline levels (target 5-15 mcg/mL)",
        explanation: "Theophylline requires serum concentration monitoring because of its narrow therapeutic index. Target levels of 5-15 mcg/mL help balance efficacy with toxicity risk.",
        objective: .monitoring,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "monitoring", "serum levels"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_sup_004",
        subsectionId: "7d",
        difficulty: .medium,
        question: "After administering omalizumab, what monitoring step is essential?",
        options: ["Observe patient for anaphylaxis after injection", "Check serum creatinine within 1 hour", "Obtain a chest X-ray", "Monitor blood glucose every 15 minutes", "Measure peak flow before discharge"],
        answer: "Observe patient for anaphylaxis after injection",
        explanation: "Omalizumab carries a Black Box Warning for anaphylaxis. Patients must be observed in a healthcare setting after injection, especially during early treatments.",
        objective: .monitoring,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "monitoring", "anaphylaxis"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_sup_005",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient on roflumilast reports significant weight loss and worsening mood. Which monitoring actions are most appropriate?",
        options: ["Monitor weight and psychiatric symptoms closely; consider discontinuation", "Increase the dose to overcome tolerance", "Add pseudoephedrine to counteract weight loss", "Switch to theophylline to improve mood", "No action needed; these are expected and benign"],
        answer: "Monitor weight and psychiatric symptoms closely; consider discontinuation",
        explanation: "Roflumilast is associated with clinically significant weight loss and psychiatric adverse events including suicidality. Weight and mood monitoring are essential, and discontinuation may be needed.",
        objective: .monitoring,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "monitoring", "weight", "psychiatric"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_sup_006",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Which patient should NOT receive roflumilast based on a specific contraindication?",
        options: ["A patient with moderate hepatic impairment", "A patient with seasonal allergies", "A patient already using tiotropium", "A patient with well-controlled hypertension", "A patient using a rescue inhaler"],
        answer: "A patient with moderate hepatic impairment",
        explanation: "Roflumilast is contraindicated in moderate-to-severe hepatic impairment. This liver-related contraindication distinguishes it from most inhaled controllers.",
        objective: .contraindication,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "contraindication", "liver"],
        source: .curated
    ),

    .matching(
        id: "q7d_sup_007",
        subsectionId: "7d",
        difficulty: .hard,
        question: "Match each controller to its key monitoring pearl:",
        pairs: [
            MatchingPair(left: "Theophylline", right: "Serum drug levels (5-15 mcg/mL)"),
            MatchingPair(left: "Omalizumab", right: "Observe for anaphylaxis post-injection"),
            MatchingPair(left: "Roflumilast", right: "Weight and psychiatric symptoms"),
            MatchingPair(left: "Montelukast", right: "Neuropsychiatric symptom monitoring"),
        ],
        explanation: "Each 7d controller has a distinct monitoring pearl: theophylline levels, omalizumab anaphylaxis observation, roflumilast weight/mood, and montelukast neuropsychiatric symptoms.",
        objective: .monitoring,
        relatedDrugIds: ["d129", "d126", "d128", "d125"],
        tags: ["7d", "monitoring", "matching"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_sup_008",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A 28-year-old with moderate-severe eosinophilic asthma and atopic dermatitis is failing standard ICS/LABA therapy. Which biologic from this subsection targets IL-4/IL-13 and covers both conditions?",
        options: ["Dupilumab", "Omalizumab", "Montelukast", "Roflumilast", "Theophylline"],
        answer: "Dupilumab",
        explanation: "Dupilumab blocks IL-4 and IL-13 signaling and is approved for moderate-to-severe eosinophilic asthma AND atopic dermatitis — making it the ideal choice when both conditions coexist.",
        objective: .indication,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "mini-case", "eosinophilic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_sup_009",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A 45-year-old with severe COPD, chronic bronchitis, and frequent exacerbations despite triple inhaler therapy is offered an oral anti-inflammatory add-on. The clinician warns about potential weight loss and mood changes. Which drug is being described?",
        options: ["Roflumilast", "Montelukast", "Theophylline", "Omalizumab", "Dupilumab"],
        answer: "Roflumilast",
        explanation: "Roflumilast is the oral PDE-4 inhibitor for severe COPD with chronic bronchitis and exacerbation history. Weight loss and psychiatric symptoms are its key counseling warnings.",
        objective: .indication,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "mini-case", "COPD"],
        source: .curated
    ),
    ]
}
