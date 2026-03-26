import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8b_supplement: [Question] = [

    .matching(
        id: "q8b_sup_001",
        subsectionId: "8b",
        difficulty: .medium,
        question: "Match each antiemetic to its brand name:",
        pairs: [
            MatchingPair(left: "Ondansetron", right: "Zofran"),
            MatchingPair(left: "Metoclopramide", right: "Reglan"),
            MatchingPair(left: "Aprepitant", right: "Emend"),
            MatchingPair(left: "Scopolamine", right: "Transderm Scop"),
        ],
        explanation: "Ondansetron = Zofran, Metoclopramide = Reglan, Aprepitant = Emend, Scopolamine = Transderm Scop.",
        objective: .brandGeneric,
        relatedDrugIds: ["d136", "d138", "d140", "d139"],
        tags: ["8b", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q8b_sup_002",
        subsectionId: "8b",
        difficulty: .hard,
        question: "Match each antiemetic to its receptor target:",
        pairs: [
            MatchingPair(left: "Ondansetron", right: "5-HT3"),
            MatchingPair(left: "Metoclopramide", right: "Dopamine D2"),
            MatchingPair(left: "Aprepitant", right: "NK1"),
            MatchingPair(left: "Scopolamine", right: "Muscarinic"),
        ],
        explanation: "Ondansetron blocks 5-HT3 receptors. Metoclopramide blocks D2 receptors. Aprepitant blocks NK1 receptors. Scopolamine blocks muscarinic receptors.",
        objective: .moa,
        relatedDrugIds: ["d136", "d138", "d140", "d139"],
        tags: ["8b", "matching", "receptor-target"],
        source: .curated
    ),

    .selectAll(
        id: "q8b_sup_003",
        subsectionId: "8b",
        difficulty: .hard,
        question: "Select ALL antiemetics with a boxed warning or contraindication in children younger than 2 years:",
        options: ["Promethazine", "Ondansetron", "Metoclopramide", "Scopolamine", "Aprepitant"],
        correctAnswers: ["Promethazine"],
        explanation: "Promethazine is the antiemetic with a specific contraindication in children younger than 2 years due to potentially fatal respiratory depression.",
        objective: .contraindication,
        relatedDrugIds: ["d137"],
        tags: ["8b", "select-all", "pediatric-safety"],
        source: .curated
    ),

    .selectAll(
        id: "q8b_sup_004",
        subsectionId: "8b",
        difficulty: .hard,
        question: "Select ALL antiemetics from this subsection that can cause QT prolongation:",
        options: ["Ondansetron", "Metoclopramide", "Promethazine", "Scopolamine", "Aprepitant"],
        correctAnswers: ["Ondansetron"],
        explanation: "Ondansetron is the antiemetic in this subsection most classically associated with QT prolongation risk. ECG monitoring is important in at-risk patients.",
        objective: .adverseEffect,
        relatedDrugIds: ["d136"],
        tags: ["8b", "select-all", "QT-prolongation"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8b_sup_005",
        subsectionId: "8b",
        difficulty: .hard,
        question: "A 58-year-old woman with diabetes and gastroparesis has been on metoclopramide for 14 weeks. She now has involuntary lip-smacking and tongue movements. What is the most likely diagnosis?",
        options: ["Tardive dyskinesia from metoclopramide", "Serotonin syndrome from ondansetron", "Anticholinergic toxicity from scopolamine", "NK1-related hiccups from aprepitant", "Tissue necrosis from promethazine"],
        answer: "Tardive dyskinesia from metoclopramide",
        explanation: "Metoclopramide carries a boxed warning for tardive dyskinesia, which becomes more likely with prolonged use (>12 weeks) and higher cumulative exposure. Involuntary orofacial movements are classic.",
        objective: .adverseEffect,
        relatedDrugIds: ["d138"],
        tags: ["8b", "mini-case", "metoclopramide", "tardive-dyskinesia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8b_sup_006",
        subsectionId: "8b",
        difficulty: .hard,
        question: "A patient receiving cisplatin chemotherapy is given a 3-drug antiemetic regimen. On Day 1 she receives ondansetron IV, dexamethasone IV, and a 125 mg oral capsule 1 hour before chemo. Days 2-3 she takes 80 mg each morning. Which drug completes the regimen?",
        options: ["Aprepitant", "Promethazine", "Scopolamine", "Metoclopramide", "Famotidine"],
        answer: "Aprepitant",
        explanation: "The classic 3-day oral aprepitant CINV regimen is 125 mg on Day 1 before chemotherapy, then 80 mg on Days 2 and 3, combined with a 5-HT3 antagonist and dexamethasone.",
        objective: .dosing,
        relatedDrugIds: ["d140"],
        tags: ["8b", "mini-case", "aprepitant", "CINV"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8b_sup_007",
        subsectionId: "8b",
        difficulty: .hard,
        question: "A 30-year-old woman on sertraline is prescribed ondansetron for post-op nausea. Which safety concern should be communicated?",
        options: ["Risk of serotonin syndrome with combined serotonergic drugs", "Risk of tardive dyskinesia", "Risk of tissue necrosis at the injection site", "Risk of hormonal contraceptive failure", "Risk of acute angle-closure glaucoma"],
        answer: "Risk of serotonin syndrome with combined serotonergic drugs",
        explanation: "Ondansetron carries a labeled serotonin syndrome warning when used with other serotonergic drugs such as SSRIs. Monitoring for agitation, tremor, and hyperthermia is warranted.",
        objective: .interaction,
        relatedDrugIds: ["d136"],
        tags: ["8b", "mini-case", "ondansetron", "serotonin-syndrome"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8b_sup_008",
        subsectionId: "8b",
        difficulty: .medium,
        question: "Which antiemetic is the ONLY one in this subsection that also speeds gastric emptying, making it uniquely suited for nausea caused by gastroparesis?",
        options: ["Metoclopramide", "Ondansetron", "Aprepitant", "Promethazine", "Scopolamine"],
        answer: "Metoclopramide",
        explanation: "Metoclopramide is both an antiemetic and a prokinetic, making it the within-class differentiator for gastroparesis-related nausea.",
        objective: .indication,
        relatedDrugIds: ["d138"],
        tags: ["8b", "differentiator", "metoclopramide", "prokinetic"],
        source: .curated
    ),

    .trueFalse(
        id: "q8b_sup_009",
        subsectionId: "8b",
        difficulty: .easy,
        question: "Ondansetron is the first-line antiemetic for most types of nausea and vomiting.",
        answer: true,
        explanation: "True. Ondansetron (Zofran) is widely considered first-line for chemotherapy, post-operative, and general nausea/vomiting.",
        objective: .indication,
        relatedDrugIds: ["d136"],
        tags: ["8b", "true-false", "ondansetron", "first-line"],
        source: .curated
    ),

    .fillBlank(
        id: "q8b_sup_010",
        subsectionId: "8b",
        difficulty: .easy,
        question: "The suffix \"-setron\" identifies drugs that block ___ receptors.",
        options: ["5-HT3", "Dopamine D2", "NK1", "Muscarinic"],
        answer: "5-HT3",
        explanation: "The -setron suffix identifies 5-HT3 receptor antagonists. Ondansetron is the classic example.",
        objective: .suffixId,
        relatedDrugIds: ["d136"],
        tags: ["8b", "fill-blank", "suffix", "setron"],
        source: .curated
    )

    ]
}
