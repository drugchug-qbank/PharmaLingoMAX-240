import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7e_supplement: [Question] = [
    .multipleChoice(
        id: "q7e_sup_001",
        subsectionId: "7e",
        difficulty: .easy,
        question: "What is the standard adult dose of diphenhydramine for allergic reactions?",
        options: ["25-50 mg every 4-6 hours as needed", "100 mg once daily", "5 mg twice daily", "200 mg at bedtime only", "10 mg every 12 hours"],
        answer: "25-50 mg every 4-6 hours as needed",
        explanation: "Diphenhydramine is dosed at 25-50 mg every 4-6 hours as needed for allergic reactions. Its sedating and anticholinergic effects limit use, especially in the elderly.",
        objective: .dosing,
        relatedDrugIds: ["d247"],
        tags: ["7e", "diphenhydramine", "dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7e_sup_002",
        subsectionId: "7e",
        difficulty: .medium,
        question: "Which antihistamine from this subsection requires renal dose adjustment?",
        options: ["Levocetirizine", "Loratadine", "Fexofenadine", "Diphenhydramine", "Cetirizine"],
        answer: "Levocetirizine",
        explanation: "Levocetirizine requires dose adjustment based on renal function. Both dose and dosing frequency may need reduction when kidney function declines.",
        objective: .monitoring,
        relatedDrugIds: ["d250"],
        tags: ["7e", "levocetirizine", "monitoring", "renal"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7e_sup_003",
        subsectionId: "7e",
        difficulty: .medium,
        question: "A patient on an MAOI asks for help with nasal congestion. Which drug from this subsection is specifically contraindicated with MAOIs?",
        options: ["Pseudoephedrine", "Cetirizine", "Loratadine", "Fluticasone (nasal)", "Azelastine (nasal)"],
        answer: "Pseudoephedrine",
        explanation: "Pseudoephedrine is contraindicated with MAOI use within 14 days because the combination can cause dangerous hypertensive crisis.",
        objective: .contraindication,
        relatedDrugIds: ["d254"],
        tags: ["7e", "pseudoephedrine", "MAOI", "contraindication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7e_sup_004",
        subsectionId: "7e",
        difficulty: .medium,
        question: "An 82-year-old with allergies asks for diphenhydramine. Why does the Beers Criteria flag this drug in older adults?",
        options: ["High anticholinergic burden increases fall and confusion risk", "It causes severe hepatotoxicity in all elderly patients", "It is only available by injection for patients over 65", "It interacts with all blood pressure medications", "It has no antihistamine effect in patients over 60"],
        answer: "High anticholinergic burden increases fall and confusion risk",
        explanation: "Diphenhydramine is on the Beers Criteria list because its strong anticholinergic effects increase the risk of sedation, falls, confusion, and urinary retention in elderly patients.",
        objective: .contraindication,
        relatedDrugIds: ["d247"],
        tags: ["7e", "diphenhydramine", "Beers", "elderly"],
        source: .curated
    ),

    .matching(
        id: "q7e_sup_005",
        subsectionId: "7e",
        difficulty: .medium,
        question: "Match each allergy drug to its key counseling pearl:",
        pairs: [
            MatchingPair(left: "Fexofenadine", right: "Avoid fruit juice"),
            MatchingPair(left: "Diphenhydramine", right: "Avoid in elderly"),
            MatchingPair(left: "Azelastine (nasal)", right: "May cause bitter taste"),
            MatchingPair(left: "Pseudoephedrine", right: "Behind-the-counter; avoid in HTN"),
        ],
        explanation: "Each allergy drug has a distinct counseling point: fexofenadine + juice interaction, diphenhydramine + elderly risk, azelastine + taste, pseudoephedrine + BP concerns.",
        objective: .pearl,
        relatedDrugIds: ["d248", "d247", "d245", "d254"],
        tags: ["7e", "counseling", "matching"],
        source: .curated
    ),

    .selectAll(
        id: "q7e_sup_006",
        subsectionId: "7e",
        difficulty: .hard,
        question: "Select ALL second-generation (less sedating) antihistamines from this subsection:",
        options: ["Cetirizine", "Fexofenadine", "Loratadine", "Levocetirizine", "Diphenhydramine", "Pseudoephedrine"],
        correctAnswers: ["Cetirizine", "Fexofenadine", "Loratadine", "Levocetirizine"],
        explanation: "Cetirizine, fexofenadine, loratadine, and levocetirizine are all 2nd-generation antihistamines. Diphenhydramine is 1st-gen; pseudoephedrine is a decongestant.",
        objective: .classId,
        relatedDrugIds: ["d246", "d248", "d251", "d250"],
        tags: ["7e", "select-all", "2nd-gen"],
        source: .curated
    ),

    .matching(
        id: "q7e_sup_007",
        subsectionId: "7e",
        difficulty: .hard,
        question: "Match each nasal product to its drug class:",
        pairs: [
            MatchingPair(left: "Flonase", right: "Intranasal Corticosteroid"),
            MatchingPair(left: "Nasonex", right: "Intranasal Corticosteroid"),
            MatchingPair(left: "Astelin", right: "Intranasal Antihistamine"),
        ],
        explanation: "Flonase (fluticasone) and Nasonex (mometasone) are intranasal corticosteroids. Astelin (azelastine) is an intranasal antihistamine — a different class.",
        objective: .classId,
        relatedDrugIds: ["d249", "d253", "d245"],
        tags: ["7e", "nasal", "matching", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7e_sup_008",
        subsectionId: "7e",
        difficulty: .hard,
        question: "A 35-year-old nurse with severe allergic rhinitis, prominent nasal congestion, and well-controlled hypertension wants the most effective daily controller. She is worried about sedation at work. Which is the best first-line recommendation?",
        options: ["Fluticasone nasal spray", "Diphenhydramine", "Pseudoephedrine", "Loratadine/Pseudoephedrine", "Azelastine nasal spray"],
        answer: "Fluticasone nasal spray",
        explanation: "Intranasal corticosteroids like fluticasone are the most effective class for allergic rhinitis with congestion. They avoid the sedation of diphenhydramine and the BP concerns of pseudoephedrine.",
        objective: .indication,
        relatedDrugIds: ["d249"],
        tags: ["7e", "fluticasone nasal", "mini-case"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7e_sup_009",
        subsectionId: "7e",
        difficulty: .hard,
        question: "A 78-year-old with seasonal allergies and benign prostatic hyperplasia asks for diphenhydramine because it 'always worked.' Why should a second-generation antihistamine be recommended instead?",
        options: ["Diphenhydramine's anticholinergic effects can worsen urinary retention and increase fall risk in elderly", "Diphenhydramine is not available OTC for patients over 65", "Diphenhydramine has no antihistamine effect after age 70", "Second-generation antihistamines are stronger bronchodilators", "Diphenhydramine causes severe hepatotoxicity in all elderly patients"],
        answer: "Diphenhydramine's anticholinergic effects can worsen urinary retention and increase fall risk in elderly",
        explanation: "Diphenhydramine is on the Beers Criteria for older adults. Its anticholinergic burden can worsen urinary retention (relevant with BPH), cause confusion, and increase fall risk. A 2nd-gen option like loratadine or cetirizine is safer.",
        objective: .contraindication,
        relatedDrugIds: ["d247", "d251", "d246"],
        tags: ["7e", "diphenhydramine", "mini-case", "elderly"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7e_sup_010",
        subsectionId: "7e",
        difficulty: .medium,
        question: "Which second-generation antihistamine from this subsection is best described as 'non-sedating, OTC, and one of the most recognizable daytime allergy brands'?",
        options: ["Loratadine", "Diphenhydramine", "Pseudoephedrine", "Azelastine (nasal)", "Mometasone (nasal)"],
        answer: "Loratadine",
        explanation: "Loratadine (Claritin) is one of the most widely used OTC second-generation antihistamines marketed as non-drowsy for daytime allergy relief.",
        objective: .pearl,
        relatedDrugIds: ["d251"],
        tags: ["7e", "loratadine", "pearl", "OTC"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7e_sup_011",
        subsectionId: "7e",
        difficulty: .medium,
        question: "Which intranasal corticosteroid from this subsection is specifically associated with both allergic rhinitis AND nasal polyps indications?",
        options: ["Mometasone (nasal)", "Fluticasone (nasal)", "Azelastine (nasal)", "Cetirizine", "Loratadine"],
        answer: "Mometasone (nasal)",
        explanation: "Mometasone nasal (Nasonex) is the intranasal corticosteroid in this subsection that also has a nasal polyps indication, making it a useful differentiator from fluticasone nasal.",
        objective: .indication,
        relatedDrugIds: ["d253"],
        tags: ["7e", "mometasone nasal", "nasal polyps", "differentiator"],
        source: .curated
    ),
    ]
}
