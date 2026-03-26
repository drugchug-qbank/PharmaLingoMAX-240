import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8e_supplement: [Question] = [

    .matching(
        id: "q8e_sup_001",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Match each IBD drug to its drug class:",
        pairs: [
            MatchingPair(left: "Mesalamine", right: "5-ASA anti-inflammatory"),
            MatchingPair(left: "Infliximab", right: "Anti-TNF monoclonal antibody"),
        ],
        explanation: "Mesalamine is a 5-aminosalicylic acid (5-ASA) drug for mild-moderate UC. Infliximab is an anti-TNF biologic for moderate-severe IBD.",
        objective: .classId,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "matching", "drug-class"],
        source: .curated
    ),

    .matching(
        id: "q8e_sup_002",
        subsectionId: "8e",
        difficulty: .hard,
        question: "Match each IBD drug to its key monitoring requirement:",
        pairs: [
            MatchingPair(left: "Mesalamine", right: "Renal function"),
            MatchingPair(left: "Infliximab", right: "TB screening and HBV status"),
        ],
        explanation: "Mesalamine requires renal monitoring (nephrotoxicity risk). Infliximab requires pre-treatment TB and hepatitis B screening due to infection reactivation risk.",
        objective: .monitoring,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "matching", "monitoring"],
        source: .curated
    ),

    .selectAll(
        id: "q8e_sup_003",
        subsectionId: "8e",
        difficulty: .hard,
        question: "Select ALL screening tests recommended before starting infliximab:",
        options: ["Latent TB test", "Hepatitis B serology", "Magnesium level", "INR", "Thyroid function"],
        correctAnswers: ["Latent TB test", "Hepatitis B serology"],
        explanation: "Before infliximab, patients should be screened for latent TB (risk of reactivation) and hepatitis B (risk of reactivation). The other labs are not specific pre-infliximab requirements.",
        objective: .monitoring,
        relatedDrugIds: ["d145"],
        tags: ["8e", "select-all", "infliximab", "pre-treatment"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_sup_004",
        subsectionId: "8e",
        difficulty: .hard,
        question: "A 28-year-old woman with ulcerative colitis starts mesalamine. One week later she develops cramping, bloody diarrhea, fever, and rash. Her GI team wonders whether her UC is flaring or if this is drug-related. Which explanation best fits?",
        options: ["Mesalamine-induced acute intolerance syndrome", "Infliximab infusion reaction", "C. difficile superinfection from a PPI", "Anticholinergic toxicity", "Serotonin syndrome"],
        answer: "Mesalamine-induced acute intolerance syndrome",
        explanation: "Mesalamine can cause an acute intolerance syndrome that closely mimics a UC flare, with cramping, bloody diarrhea, fever, and rash. The temporal relationship to drug initiation is the key clue.",
        objective: .adverseEffect,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mini-case", "mesalamine", "acute-intolerance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_sup_005",
        subsectionId: "8e",
        difficulty: .hard,
        question: "A patient with moderate Crohn disease failed mesalamine and corticosteroids. The team starts infliximab. During the second infusion, she develops dyspnea, urticaria, and hypotension. What is the most likely event?",
        options: ["Infusion reaction to infliximab", "Mesalamine acute intolerance syndrome", "Anaphylaxis to lactulose", "Anticholinergic crisis", "Serotonin syndrome"],
        answer: "Infusion reaction to infliximab",
        explanation: "Infliximab can cause infusion reactions with dyspnea, urticaria, and hypotension. These reactions can occur during any infusion but are important to recognize and manage promptly.",
        objective: .adverseEffect,
        relatedDrugIds: ["d145"],
        tags: ["8e", "mini-case", "infliximab", "infusion-reaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_sup_006",
        subsectionId: "8e",
        difficulty: .hard,
        question: "A patient with Crohn disease on infliximab and azathioprine develops persistent fevers and night sweats. Imaging shows hepatosplenomegaly. Which rare but high-yield malignancy should be considered?",
        options: ["Hepatosplenic T-cell lymphoma", "Colon adenocarcinoma", "Papillary thyroid cancer", "Basal cell carcinoma", "Renal cell carcinoma"],
        answer: "Hepatosplenic T-cell lymphoma",
        explanation: "Hepatosplenic T-cell lymphoma (HSTCL) is a rare but high-yield malignancy associated with TNF blockers, especially when combined with azathioprine or 6-MP in young IBD patients.",
        objective: .adverseEffect,
        relatedDrugIds: ["d145"],
        tags: ["8e", "mini-case", "infliximab", "HSTCL", "malignancy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_sup_007",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Which feature best differentiates mesalamine from infliximab in the IBD treatment algorithm?",
        options: ["Mesalamine is first-line for mild-moderate UC; infliximab is escalation for moderate-severe or refractory IBD", "Mesalamine is IV-only; infliximab is oral", "Both require TB screening before use", "Infliximab is safer than mesalamine in pregnancy", "Both are 5-ASA anti-inflammatories"],
        answer: "Mesalamine is first-line for mild-moderate UC; infliximab is escalation for moderate-severe or refractory IBD",
        explanation: "The key differentiator: mesalamine (5-ASA) is the initial bowel-directed anti-inflammatory for milder UC, while infliximab (anti-TNF biologic) is reserved for more severe or refractory disease.",
        objective: .pearl,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "differentiator", "step-therapy"],
        source: .curated
    ),

    .trueFalse(
        id: "q8e_sup_008",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Mesalamine is classified as a 5-aminosalicylic acid (5-ASA) anti-inflammatory drug.",
        answer: true,
        explanation: "True. Mesalamine is a 5-ASA agent that works as a topical anti-inflammatory in the colon, primarily used for ulcerative colitis.",
        objective: .classId,
        relatedDrugIds: ["d144"],
        tags: ["8e", "true-false", "mesalamine", "class"],
        source: .curated
    ),

    .trueFalse(
        id: "q8e_sup_009",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Live vaccines can be safely given concurrently with infliximab therapy.",
        answer: false,
        explanation: "False. Live vaccines should generally not be given concurrently with infliximab because of the increased risk of infection from immunosuppression.",
        objective: .interaction,
        relatedDrugIds: ["d145"],
        tags: ["8e", "true-false", "infliximab", "live-vaccines"],
        source: .curated
    ),

    .fillBlank(
        id: "q8e_sup_010",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Infliximab induction is given at weeks 0, 2, and 6, then maintenance every ___ weeks.",
        options: ["8", "4", "12", "2"],
        answer: "8",
        explanation: "Infliximab maintenance dosing for IBD is typically every 8 weeks after the induction series at weeks 0, 2, and 6.",
        objective: .dosing,
        relatedDrugIds: ["d145"],
        tags: ["8e", "fill-blank", "infliximab", "schedule"],
        source: .curated
    )

    ]
}
