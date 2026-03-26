import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5b_supplement: [Question] = [

    .matching(
        id: "q5b_sup_001",
        subsectionId: "5b",
        difficulty: .medium,
        question: "Match each opioid or pain adjunct to its brand name:",
        pairs: [
            MatchingPair(left: "Morphine", right: "MS Contin"),
            MatchingPair(left: "Fentanyl", right: "Duragesic"),
            MatchingPair(left: "Naloxone", right: "Narcan"),
            MatchingPair(left: "Tramadol", right: "Ultram"),
        ],
        explanation: "Morphine = MS Contin, Fentanyl = Duragesic, Naloxone = Narcan, Tramadol = Ultram.",
        objective: .brandGeneric,
        relatedDrugIds: ["d146", "d149", "d151", "d150"],
        tags: ["5b", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q5b_sup_002",
        subsectionId: "5b",
        difficulty: .hard,
        question: "Match each muscle relaxant or adjunct to its primary clinical niche:",
        pairs: [
            MatchingPair(left: "Baclofen", right: "Chronic spasticity (MS, spinal cord)"),
            MatchingPair(left: "Cyclobenzaprine", right: "Acute musculoskeletal spasm"),
            MatchingPair(left: "Gabapentin", right: "Neuropathic pain"),
            MatchingPair(left: "Pregabalin", right: "Neuropathic pain + fibromyalgia"),
        ],
        explanation: "Baclofen is for chronic spasticity. Cyclobenzaprine is for short-term acute muscle spasm. Gabapentin targets neuropathic pain. Pregabalin adds fibromyalgia to its neuropathic pain role.",
        objective: .indication,
        relatedDrugIds: ["d160", "d158", "d161", "d162"],
        tags: ["5b", "matching", "indication-differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q5b_sup_003",
        subsectionId: "5b",
        difficulty: .hard,
        question: "Select ALL full mu-opioid agonists from this subsection:",
        options: ["Morphine", "Oxycodone", "Fentanyl", "Hydrocodone/Acetaminophen", "Naloxone", "Tramadol"],
        correctAnswers: ["Morphine", "Oxycodone", "Fentanyl", "Hydrocodone/Acetaminophen"],
        explanation: "Morphine, oxycodone, fentanyl, and hydrocodone are full mu-opioid agonists. Naloxone is an antagonist. Tramadol is a weak partial mu agonist with SNRI activity.",
        objective: .classId,
        relatedDrugIds: ["d146", "d147", "d149", "d148", "d151", "d150"],
        tags: ["5b", "select-all", "opioid agonist"],
        source: .curated
    ),

    .selectAll(
        id: "q5b_sup_004",
        subsectionId: "5b",
        difficulty: .hard,
        question: "Select ALL drugs from this subsection that require dose adjustment in renal impairment:",
        options: ["Gabapentin", "Morphine", "Pregabalin", "Cyclobenzaprine", "Naloxone"],
        correctAnswers: ["Gabapentin", "Morphine", "Pregabalin"],
        explanation: "Gabapentin and pregabalin are renally cleared and need dose adjustment. Morphine accumulates active metabolites in renal impairment. Cyclobenzaprine is hepatically metabolized. Naloxone is a rescue drug not routinely dose-adjusted for renal function.",
        objective: .monitoring,
        relatedDrugIds: ["d161", "d146", "d162"],
        tags: ["5b", "select-all", "renal dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5b_sup_005",
        subsectionId: "5b",
        difficulty: .hard,
        question: "A 70-year-old with chronic pain and GFR 25 mL/min needs an opioid. Which full opioid agonist from this subsection deserves the most caution because active metabolites accumulate in renal failure?",
        options: ["Morphine", "Fentanyl", "Oxycodone", "Tramadol", "Naloxone"],
        answer: "Morphine",
        explanation: "Morphine produces morphine-6-glucuronide, an active metabolite that accumulates in renal impairment, increasing sedation and respiratory depression risk. Fentanyl and oxycodone are generally considered safer choices in renal failure.",
        objective: .contraindication,
        relatedDrugIds: ["d146"],
        tags: ["5b", "mini-case", "morphine", "renal"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5b_sup_006",
        subsectionId: "5b",
        difficulty: .hard,
        question: "A patient on duloxetine for depression is prescribed tramadol for back pain. Two days later he presents with agitation, clonus, and diaphoresis. Which diagnosis best fits?",
        options: ["Serotonin syndrome", "Opioid withdrawal", "Neuroleptic malignant syndrome", "Anticholinergic toxicity", "Baclofen withdrawal"],
        answer: "Serotonin syndrome",
        explanation: "Tramadol inhibits serotonin reuptake, and duloxetine is an SNRI. The combination raises serotonin syndrome risk. Agitation, clonus, and diaphoresis are classic findings.",
        objective: .interaction,
        relatedDrugIds: ["d150"],
        tags: ["5b", "mini-case", "tramadol", "serotonin syndrome"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5b_sup_007",
        subsectionId: "5b",
        difficulty: .hard,
        question: "An elderly patient on intrathecal baclofen has a pump malfunction and suddenly stops receiving the drug. Which life-threatening complication is most concerning?",
        options: ["Withdrawal seizures and autonomic instability", "Serotonin syndrome", "Respiratory depression", "Medication-overuse headache", "Tardive dyskinesia"],
        answer: "Withdrawal seizures and autonomic instability",
        explanation: "Abrupt baclofen discontinuation, especially from intrathecal delivery, can trigger severe withdrawal with rebound spasticity, seizures, hyperthermia, and autonomic instability that can be fatal.",
        objective: .adverseEffect,
        relatedDrugIds: ["d160"],
        tags: ["5b", "mini-case", "baclofen", "withdrawal"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5b_sup_008",
        subsectionId: "5b",
        difficulty: .medium,
        question: "Which feature best differentiates pregabalin from gabapentin for a student learning this subsection?",
        options: ["Pregabalin is Schedule V and FDA-approved for fibromyalgia", "Gabapentin is Schedule V and pregabalin is not scheduled", "Pregabalin is an opioid while gabapentin is not", "Gabapentin treats fibromyalgia but pregabalin does not", "Pregabalin does not need renal dose adjustment"],
        answer: "Pregabalin is Schedule V and FDA-approved for fibromyalgia",
        explanation: "Both are gabapentinoids binding alpha-2-delta subunits. Pregabalin stands out with Schedule V status and an FDA-labeled fibromyalgia indication, which gabapentin lacks.",
        objective: .pearl,
        relatedDrugIds: ["d162", "d161"],
        tags: ["5b", "differentiator", "pregabalin", "gabapentin"],
        source: .curated
    ),

    ]
}
