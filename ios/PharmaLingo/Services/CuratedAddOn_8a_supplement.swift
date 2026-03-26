import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8a_supplement: [Question] = [

    .matching(
        id: "q8a_sup_001",
        subsectionId: "8a",
        difficulty: .medium,
        question: "Match each acid-suppression drug to its brand name:",
        pairs: [
            MatchingPair(left: "Omeprazole", right: "Prilosec"),
            MatchingPair(left: "Pantoprazole", right: "Protonix"),
            MatchingPair(left: "Famotidine", right: "Pepcid"),
            MatchingPair(left: "Sucralfate", right: "Carafate"),
        ],
        explanation: "Omeprazole = Prilosec, Pantoprazole = Protonix, Famotidine = Pepcid, Sucralfate = Carafate.",
        objective: .brandGeneric,
        relatedDrugIds: ["d130", "d132", "d134", "d135"],
        tags: ["8a", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q8a_sup_002",
        subsectionId: "8a",
        difficulty: .hard,
        question: "Match each acid-suppression drug to its drug class:",
        pairs: [
            MatchingPair(left: "Omeprazole", right: "Proton Pump Inhibitor"),
            MatchingPair(left: "Famotidine", right: "H2 Receptor Antagonist"),
            MatchingPair(left: "Sucralfate", right: "Mucosal Protectant"),
        ],
        explanation: "PPIs irreversibly inhibit the proton pump. H2 blockers competitively block histamine receptors. Sucralfate coats the ulcer locally.",
        objective: .classId,
        relatedDrugIds: ["d130", "d134", "d135"],
        tags: ["8a", "matching", "drug-class"],
        source: .curated
    ),

    .selectAll(
        id: "q8a_sup_003",
        subsectionId: "8a",
        difficulty: .hard,
        question: "Select ALL recognized long-term risks of proton pump inhibitors:",
        options: ["C. difficile infection", "Hypomagnesemia", "Bone fractures", "Vitamin B12 deficiency", "Tardive dyskinesia"],
        correctAnswers: ["C. difficile infection", "Hypomagnesemia", "Bone fractures", "Vitamin B12 deficiency"],
        explanation: "Long-term PPI use is associated with C. diff, hypomagnesemia, osteoporosis-related fractures, and B12 deficiency. Tardive dyskinesia is a metoclopramide concern.",
        objective: .adverseEffect,
        relatedDrugIds: ["d130", "d131", "d132", "d133"],
        tags: ["8a", "select-all", "PPI", "long-term-risks"],
        source: .curated
    ),

    .selectAll(
        id: "q8a_sup_004",
        subsectionId: "8a",
        difficulty: .medium,
        question: "Select ALL proton pump inhibitors in this subsection:",
        options: ["Omeprazole", "Esomeprazole", "Lansoprazole", "Pantoprazole", "Famotidine", "Sucralfate"],
        correctAnswers: ["Omeprazole", "Esomeprazole", "Lansoprazole", "Pantoprazole"],
        explanation: "Omeprazole, esomeprazole, lansoprazole, and pantoprazole are PPIs. Famotidine is an H2 blocker; sucralfate is a mucosal protectant.",
        objective: .classId,
        relatedDrugIds: ["d130", "d131", "d132", "d133"],
        tags: ["8a", "select-all", "PPI", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8a_sup_005",
        subsectionId: "8a",
        difficulty: .hard,
        question: "A 62-year-old man with a recent drug-eluting stent presents with worsening heartburn. He takes aspirin and clopidogrel daily. Which acid-suppression strategy is most appropriate?",
        options: ["Start pantoprazole", "Start omeprazole", "Start esomeprazole", "Use sucralfate as sole therapy", "Add famotidine only at bedtime"],
        answer: "Start pantoprazole",
        explanation: "Pantoprazole is preferred with clopidogrel because approved doses do not have a clinically important effect on clopidogrel activation, unlike omeprazole and esomeprazole which inhibit CYP2C19.",
        objective: .interaction,
        relatedDrugIds: ["d132", "d130", "d131"],
        tags: ["8a", "mini-case", "clopidogrel", "pantoprazole"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8a_sup_006",
        subsectionId: "8a",
        difficulty: .hard,
        question: "A 70-year-old woman on long-term omeprazole and a thiazide diuretic presents with muscle cramps and palpitations. Labs show Mg²⁺ 1.0 mEq/L. Which drug is the most likely contributor to her hypomagnesemia?",
        options: ["Omeprazole", "Hydrochlorothiazide", "Aspirin", "Metformin", "Amlodipine"],
        answer: "Omeprazole",
        explanation: "Long-term PPI therapy is a well-recognized cause of hypomagnesemia. Although thiazide diuretics can also lower magnesium, the PPI class carries a specific labeled warning for this adverse effect.",
        objective: .adverseEffect,
        relatedDrugIds: ["d130"],
        tags: ["8a", "mini-case", "omeprazole", "hypomagnesemia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8a_sup_007",
        subsectionId: "8a",
        difficulty: .hard,
        question: "A hospitalized patient on chronic PPI therapy develops watery diarrhea, fever, and abdominal pain. Stool toxin is positive. Which PPI-associated complication has occurred?",
        options: ["Clostridioides difficile infection", "Vitamin B12 deficiency", "Fundic gland polyps", "Hypomagnesemia", "Osteoporotic fracture"],
        answer: "Clostridioides difficile infection",
        explanation: "PPI-associated reduction in gastric acidity is a recognized risk factor for C. difficile infection. Watery diarrhea, fever, and positive stool toxin are classic findings.",
        objective: .adverseEffect,
        relatedDrugIds: ["d130", "d131", "d132", "d133"],
        tags: ["8a", "mini-case", "c-diff", "PPI"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8a_sup_008",
        subsectionId: "8a",
        difficulty: .medium,
        question: "Which PPI is best differentiated from the others by having an orally disintegrating tablet (SoluTab) formulation?",
        options: ["Lansoprazole", "Omeprazole", "Esomeprazole", "Pantoprazole", "Famotidine"],
        answer: "Lansoprazole",
        explanation: "Lansoprazole (Prevacid) is distinguished by its SoluTab orally disintegrating tablet, which is a classic within-class differentiator.",
        objective: .pearl,
        relatedDrugIds: ["d133", "d130", "d131", "d132"],
        tags: ["8a", "differentiator", "lansoprazole", "formulation"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8a_sup_009",
        subsectionId: "8a",
        difficulty: .medium,
        question: "How does esomeprazole differ pharmacologically from omeprazole?",
        options: ["It is the S-enantiomer of omeprazole", "It is the active metabolite of omeprazole", "It belongs to the H2 blocker class", "It is a mucosal protectant derivative", "It has no structural relationship to omeprazole"],
        answer: "It is the S-enantiomer of omeprazole",
        explanation: "Esomeprazole is the purified S-enantiomer of omeprazole. This is a high-yield within-class differentiator that separates Nexium from Prilosec.",
        objective: .pearl,
        relatedDrugIds: ["d131", "d130"],
        tags: ["8a", "differentiator", "esomeprazole", "enantiomer"],
        source: .curated
    ),

    .trueFalse(
        id: "q8a_sup_010",
        subsectionId: "8a",
        difficulty: .easy,
        question: "Sucralfate works by irreversibly inhibiting the gastric proton pump.",
        answer: false,
        explanation: "False. Sucralfate is a mucosal protectant that forms a protective barrier over the ulcer surface. PPIs are the drugs that inhibit the proton pump.",
        objective: .moa,
        relatedDrugIds: ["d135"],
        tags: ["8a", "true-false", "sucralfate", "moa"],
        source: .curated
    ),

    .fillBlank(
        id: "q8a_sup_011",
        subsectionId: "8a",
        difficulty: .easy,
        question: "The suffix \"-prazole\" identifies drugs in the ___ class.",
        options: ["Proton Pump Inhibitor", "H2 Receptor Antagonist", "Mucosal Protectant", "Antiemetic"],
        answer: "Proton Pump Inhibitor",
        explanation: "The -prazole suffix is the key identifier for proton pump inhibitors (PPIs).",
        objective: .suffixId,
        relatedDrugIds: ["d130", "d131", "d132", "d133"],
        tags: ["8a", "fill-blank", "suffix", "prazole"],
        source: .curated
    ),

    .fillBlank(
        id: "q8a_sup_012",
        subsectionId: "8a",
        difficulty: .medium,
        question: "PPIs should be taken ___ minutes before eating for optimal acid suppression.",
        options: ["30-60", "5-10", "120", "Immediately after"],
        answer: "30-60",
        explanation: "PPIs are most effective when taken 30-60 minutes before a meal, allowing the drug to be absorbed and active when parietal cells are stimulated by food.",
        objective: .dosing,
        relatedDrugIds: ["d130", "d131", "d132", "d133"],
        tags: ["8a", "fill-blank", "PPI", "timing"],
        source: .curated
    )

    ]
}
