import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7c_supplement: [Question] = [
    .multipleChoice(
        id: "q7c_sup_001",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A pediatric patient has been on inhaled budesonide for 2 years. Which parameter should be monitored over time?",
        options: ["Growth velocity / height", "Serum creatinine", "INR", "Serum potassium", "Liver enzymes"],
        answer: "Growth velocity / height",
        explanation: "Long-term inhaled corticosteroid use in children can slightly slow growth velocity. Monitoring height over time is a standard safety pearl for ICS therapy.",
        objective: .monitoring,
        relatedDrugIds: ["d115"],
        tags: ["7c", "budesonide", "monitoring", "growth"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_sup_002",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A child maintained on Flovent HFA has annual height checks. Why is growth monitoring recommended for pediatric ICS users?",
        options: ["ICS can slightly slow growth velocity at higher or prolonged exposure", "ICS always causes permanent growth arrest", "ICS causes accelerated growth requiring intervention", "ICS has no effect on growth but monitoring is done for insurance", "ICS increases bone density requiring height tracking"],
        answer: "ICS can slightly slow growth velocity at higher or prolonged exposure",
        explanation: "Inhaled corticosteroids can have a small effect on growth velocity in children. Using the lowest effective dose and monitoring growth helps balance asthma control with safety.",
        objective: .monitoring,
        relatedDrugIds: ["d114"],
        tags: ["7c", "fluticasone", "monitoring", "growth"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_sup_003",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Which drug from this subsection carries a Black Box Warning for increased risk of asthma-related death when used as monotherapy?",
        options: ["Salmeterol", "Budesonide (inhaled)", "Fluticasone (inhaled)", "Budesonide/Formoterol", "Mometasone/Formoterol"],
        answer: "Salmeterol",
        explanation: "Salmeterol carries a Black Box Warning: LABA monotherapy in asthma increases the risk of asthma-related death. It must always be used with an ICS in asthma patients.",
        objective: .contraindication,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "black-box", "monotherapy"],
        source: .curated
    ),

    .matching(
        id: "q7c_sup_004",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Match each inhaler to its composition:",
        pairs: [
            MatchingPair(left: "Pulmicort", right: "Budesonide (ICS only)"),
            MatchingPair(left: "Symbicort", right: "Budesonide + Formoterol"),
            MatchingPair(left: "Advair", right: "Fluticasone + Salmeterol"),
            MatchingPair(left: "Dulera", right: "Mometasone + Formoterol"),
        ],
        explanation: "Pure ICS (Pulmicort, Flovent) vs ICS/LABA combos (Symbicort, Advair, Dulera). Each combo pairs a different steroid with a LABA.",
        objective: .brandGeneric,
        relatedDrugIds: ["d115", "d117", "d116", "d119"],
        tags: ["7c", "matching", "composition"],
        source: .curated
    ),

    .selectAll(
        id: "q7c_sup_005",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Select ALL ICS/LABA combination inhalers from this subsection:",
        options: ["Symbicort", "Advair", "Dulera", "Pulmicort", "Serevent", "Flovent HFA"],
        correctAnswers: ["Symbicort", "Advair", "Dulera"],
        explanation: "Symbicort (budesonide/formoterol), Advair (fluticasone/salmeterol), and Dulera (mometasone/formoterol) are the three ICS/LABA combinations. Pulmicort and Flovent are ICS-only; Serevent is LABA-only.",
        objective: .classId,
        relatedDrugIds: ["d117", "d116", "d119"],
        tags: ["7c", "select-all", "ICS-LABA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_sup_006",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A 22-year-old college student with moderate persistent asthma uses Flovent HFA daily but still wakes up wheezing twice a week and uses albuterol 4-5 times weekly. What is the most appropriate step-up from this subsection?",
        options: ["Switch to Symbicort (budesonide/formoterol)", "Add pseudoephedrine for congestion", "Double the albuterol rescue frequency", "Stop Flovent and use Serevent alone", "Add diphenhydramine at bedtime"],
        answer: "Switch to Symbicort (budesonide/formoterol)",
        explanation: "Persistent symptoms despite ICS monotherapy calls for step-up to an ICS/LABA combination like Symbicort. LABA monotherapy (Serevent alone) is contraindicated in asthma.",
        objective: .indication,
        relatedDrugIds: ["d117", "d114"],
        tags: ["7c", "symbicort", "mini-case", "step-up"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_sup_007",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A 45-year-old with asthma and COPD overlap has been using Advair for years. She develops white patches on her tongue and pain when swallowing. Which component of her inhaler most likely caused this, and what counseling was missed?",
        options: ["The fluticasone (ICS) component — she should rinse her mouth after each use", "The salmeterol (LABA) component — she needs a lower beta-agonist dose", "The propellant — she should switch to a nebulizer", "The lactose carrier — she has a milk protein allergy", "Neither component — this is unrelated to her inhaler"],
        answer: "The fluticasone (ICS) component — she should rinse her mouth after each use",
        explanation: "Oropharyngeal candidiasis (thrush) is caused by local immunosuppression from the ICS component. Rinsing the mouth after each use and spitting is the key counseling pearl to prevent this.",
        objective: .adverseEffect,
        relatedDrugIds: ["d116", "d114"],
        tags: ["7c", "advair", "mini-case", "thrush"],
        source: .curated
    ),
    ]
}
