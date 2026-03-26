import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5a_supplement: [Question] = [

    .matching(
        id: "q5a_sup_001",
        subsectionId: "5a",
        difficulty: .medium,
        question: "Match each NSAID or analgesic to its brand name:",
        pairs: [
            MatchingPair(left: "Celecoxib", right: "Celebrex"),
            MatchingPair(left: "Ketorolac", right: "Toradol"),
            MatchingPair(left: "Meloxicam", right: "Mobic"),
            MatchingPair(left: "Diclofenac", right: "Voltaren"),
        ],
        explanation: "Celecoxib = Celebrex, Ketorolac = Toradol, Meloxicam = Mobic, Diclofenac = Voltaren.",
        objective: .brandGeneric,
        relatedDrugIds: ["d154", "d156", "d224", "d220"],
        tags: ["5a", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q5a_sup_002",
        subsectionId: "5a",
        difficulty: .hard,
        question: "Match each drug to its most distinguishing clinical feature:",
        pairs: [
            MatchingPair(left: "Ketorolac", right: "Max 5-day course"),
            MatchingPair(left: "Celecoxib", right: "COX-2 selective"),
            MatchingPair(left: "Acetaminophen", right: "No anti-inflammatory effect"),
            MatchingPair(left: "Indomethacin", right: "Classic for acute gout"),
        ],
        explanation: "Ketorolac is limited to 5 days. Celecoxib is COX-2 selective. Acetaminophen lacks anti-inflammatory activity. Indomethacin is classically linked to acute gout treatment.",
        objective: .pearl,
        relatedDrugIds: ["d156", "d154", "d155", "d222"],
        tags: ["5a", "matching", "differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q5a_sup_003",
        subsectionId: "5a",
        difficulty: .hard,
        question: "Select ALL medications from this subsection that are nonselective NSAIDs:",
        options: ["Ibuprofen", "Naproxen", "Celecoxib", "Indomethacin", "Acetaminophen", "Ketorolac"],
        correctAnswers: ["Ibuprofen", "Naproxen", "Indomethacin", "Ketorolac"],
        explanation: "Ibuprofen, naproxen, indomethacin, and ketorolac are nonselective NSAIDs. Celecoxib is COX-2 selective. Acetaminophen is not an NSAID.",
        objective: .classId,
        relatedDrugIds: ["d152", "d153", "d222", "d156", "d154", "d155"],
        tags: ["5a", "select-all", "nonselective NSAID"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5a_sup_004",
        subsectionId: "5a",
        difficulty: .hard,
        question: "A 58-year-old with osteoarthritis and a history of peptic ulcer disease needs an oral NSAID. Which option from this subsection offers the best GI risk profile?",
        options: ["Celecoxib", "Ibuprofen", "Naproxen", "Ketorolac", "Indomethacin"],
        answer: "Celecoxib",
        explanation: "Celecoxib is COX-2 selective and tends to cause less GI ulceration than nonselective NSAIDs. In a patient with peptic ulcer history, celecoxib is the better choice among these options, though GI risk is not eliminated entirely.",
        objective: .indication,
        relatedDrugIds: ["d154", "d152", "d153", "d156", "d222"],
        tags: ["5a", "mini-case", "celecoxib", "GI risk"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5a_sup_005",
        subsectionId: "5a",
        difficulty: .hard,
        question: "A postoperative patient is receiving IV ketorolac on day 4 and asks to continue it for another 2 weeks. The surgical team orders labs showing a rising creatinine. What is the most appropriate action?",
        options: ["Discontinue ketorolac and switch to an alternative analgesic", "Continue ketorolac because 2 weeks is within the safe limit", "Double the ketorolac dose to finish pain treatment faster", "Add ibuprofen to reduce the ketorolac dose needed", "Ignore the creatinine because NSAIDs do not affect renal function"],
        answer: "Discontinue ketorolac and switch to an alternative analgesic",
        explanation: "Ketorolac should not exceed 5 days total. A rising creatinine suggests nephrotoxicity, reinforcing the need to stop. Continuing or adding another NSAID would worsen renal injury.",
        objective: .adverseEffect,
        relatedDrugIds: ["d156"],
        tags: ["5a", "mini-case", "ketorolac", "renal"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5a_sup_006",
        subsectionId: "5a",
        difficulty: .hard,
        question: "A 45-year-old woman takes Tylenol Extra Strength for headaches, Percocet after dental surgery, and NyQuil at bedtime. She presents with nausea and elevated liver enzymes. Which shared ingredient most likely explains her presentation?",
        options: ["Acetaminophen", "Oxycodone", "Dextromethorphan", "Ibuprofen", "Caffeine"],
        answer: "Acetaminophen",
        explanation: "Tylenol, Percocet, and NyQuil all contain acetaminophen. Stacking these products easily exceeds the 4 g/day maximum. The nausea and elevated LFTs suggest early hepatotoxicity from cumulative acetaminophen exposure.",
        objective: .monitoring,
        relatedDrugIds: ["d155", "d219"],
        tags: ["5a", "mini-case", "acetaminophen", "hepatotoxicity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5a_sup_007",
        subsectionId: "5a",
        difficulty: .hard,
        question: "A patient with knee osteoarthritis and stage 3 CKD asks for a topical pain option to minimize systemic NSAID exposure. Which drug from this subsection best fits?",
        options: ["Diclofenac (topical)", "Ketorolac", "Celecoxib", "Indomethacin", "Naproxen"],
        answer: "Diclofenac (topical)",
        explanation: "Topical diclofenac provides localized NSAID relief with lower systemic exposure, making it a better option than oral NSAIDs in a patient with CKD where systemic NSAID effects on the kidney are concerning.",
        objective: .pearl,
        relatedDrugIds: ["d220"],
        tags: ["5a", "mini-case", "diclofenac", "topical", "CKD"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5a_sup_008",
        subsectionId: "5a",
        difficulty: .medium,
        question: "Which feature best differentiates naproxen from ibuprofen for a student trying to tell them apart?",
        options: ["Naproxen has a longer duration allowing twice-daily dosing", "Naproxen is COX-2 selective while ibuprofen is not", "Ibuprofen is only available by prescription", "Naproxen is not an NSAID", "Ibuprofen has a longer half-life than naproxen"],
        answer: "Naproxen has a longer duration allowing twice-daily dosing",
        explanation: "Naproxen is commonly dosed q12h due to its longer half-life, while ibuprofen is typically dosed q6-8h. Both are nonselective NSAIDs and both are available OTC.",
        objective: .pearl,
        relatedDrugIds: ["d153", "d152"],
        tags: ["5a", "differentiator", "naproxen", "ibuprofen"],
        source: .curated
    ),

    ]
}
