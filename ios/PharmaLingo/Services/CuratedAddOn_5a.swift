// PharmaLingo — Module 5a (NSAIDs & Acetaminophen)
// Curated Add-On Question Pack (45 questions)
// IDs: q5a_add_001 ... q5a_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 5a exists, then append:
//
//    if bank["5a"] == nil { bank["5a"] = [] }
//    bank["5a"]?.append(contentsOf: Self.curatedAddOnQuestions_5a)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d155 (Acetaminophen), d218 (Acetaminophen/Butalbital/Caffeine),
//   d219 (Acetaminophen/Oxycodone), d154 (Celecoxib), d220 (Diclofenac), d221 (Etodolac),
//   d152 (Ibuprofen), d222 (Indomethacin), d156 (Ketorolac), d223 (Lidocaine patch),
//   d224 (Meloxicam), d225 (Nabumetone), d153 (Naproxen).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5a: [Question] = [
.multipleChoice(
    id: "q5a_add_001",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient with a viral upper respiratory infection reaches for Tylenol because it lowers fever and relieves pain without meaningful anti-inflammatory activity. What is the generic name of Tylenol?",
    options: ["Acetaminophen", "Ibuprofen", "Naproxen", "Celecoxib", "Diclofenac"],
    answer: "Acetaminophen",
    explanation: "Tylenol is the brand name for acetaminophen. It is a non-opioid analgesic and antipyretic rather than an NSAID, so it helps pain and fever but is not relied on for anti-inflammatory effect.",
    objective: .brandGeneric,
    relatedDrugIds: ["d155"],
    tags: ["acetaminophen", "Tylenol", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_002",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Acetaminophen is often chosen when a patient needs pain or fever relief but an oral NSAID may not be ideal because of GI or renal concerns. Which brand name best matches acetaminophen?",
    options: ["Tylenol", "Advil/Motrin", "Aleve/Naprosyn", "Celebrex", "Toradol"],
    answer: "Tylenol",
    explanation: "Acetaminophen is sold as Tylenol. Pairing the generic with the common OTC brand is high yield because acetaminophen also appears inside many combination products.",
    objective: .genericBrand,
    relatedDrugIds: ["d155"],
    tags: ["acetaminophen", "Tylenol", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_003",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient with recurrent tension headaches says Fioricet helps, and you remember it as the acetaminophen combination that also contains a barbiturate and caffeine. What is the generic name of Fioricet?",
    options: ["Acetaminophen/Butalbital/Caffeine", "Acetaminophen/Oxycodone", "Hydrocodone/Acetaminophen", "Acetaminophen", "Diclofenac"],
    answer: "Acetaminophen/Butalbital/Caffeine",
    explanation: "Fioricet is the brand name for acetaminophen/butalbital/caffeine. The butalbital component explains the sedation and medication-overuse-headache counseling that often shows up in questions.",
    objective: .brandGeneric,
    relatedDrugIds: ["d218"],
    tags: ["Fioricet", "acetaminophen/butalbital/caffeine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_004",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Acetaminophen/butalbital/caffeine is a high-yield headache combination because it adds a barbiturate and caffeine to acetaminophen. Which brand name matches this combination?",
    options: ["Fioricet", "Percocet", "Tylenol", "Celebrex", "Voltaren"],
    answer: "Fioricet",
    explanation: "Acetaminophen/butalbital/caffeine is marketed as Fioricet. On exams, Fioricet is commonly tied to tension headache, sedation, and rebound or medication-overuse headache.",
    objective: .genericBrand,
    relatedDrugIds: ["d218"],
    tags: ["Fioricet", "acetaminophen/butalbital/caffeine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_005",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient is discharged with Percocet after a painful procedure, and the team reviews both opioid adverse effects and hidden acetaminophen exposure. What is the generic name of Percocet?",
    options: ["Acetaminophen/Oxycodone", "Hydrocodone/Acetaminophen", "Acetaminophen/Butalbital/Caffeine", "Oxycodone ER", "Acetaminophen"],
    answer: "Acetaminophen/Oxycodone",
    explanation: "Percocet is the brand name for acetaminophen/oxycodone. Because it contains both an opioid and acetaminophen, students should think about respiratory depression, constipation, and cumulative daily acetaminophen dose.",
    objective: .brandGeneric,
    relatedDrugIds: ["d219"],
    tags: ["Percocet", "acetaminophen/oxycodone", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_006",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Acetaminophen/oxycodone is an opioid-containing combination used for more severe pain, so counseling must cover both opioid toxicity and acetaminophen liver risk. Which brand name matches acetaminophen/oxycodone?",
    options: ["Percocet", "Norco/Vicodin", "Fioricet", "OxyContin", "Tylenol"],
    answer: "Percocet",
    explanation: "Acetaminophen/oxycodone is sold as Percocet. A good memory cue is that Percocet combines oxycodone pain relief with the added need to count total acetaminophen from all products.",
    objective: .genericBrand,
    relatedDrugIds: ["d219"],
    tags: ["Percocet", "acetaminophen/oxycodone", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_007",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient with osteoarthritis is prescribed Celebrex, the classic COX-2 selective NSAID that is often contrasted with nonselective agents like ibuprofen and naproxen. What is the generic name of Celebrex?",
    options: ["Celecoxib", "Diclofenac", "Meloxicam", "Etodolac", "Nabumetone"],
    answer: "Celecoxib",
    explanation: "Celebrex is the brand name for celecoxib. Celecoxib is the COX-2 selective NSAID in this subsection and is often remembered for less GI toxicity than nonselective NSAIDs, while still carrying serious NSAID warnings.",
    objective: .brandGeneric,
    relatedDrugIds: ["d154"],
    tags: ["Celebrex", "celecoxib", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_008",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Celecoxib is the selective COX-2 NSAID in this subsection and is commonly used for osteoarthritis, rheumatoid arthritis, and pain. Which brand name matches celecoxib?",
    options: ["Celebrex", "Voltaren", "Mobic", "Toradol", "Relafen"],
    answer: "Celebrex",
    explanation: "Celecoxib is marketed as Celebrex. If a stem highlights selective COX-2 inhibition, celecoxib and the brand Celebrex should come to mind.",
    objective: .genericBrand,
    relatedDrugIds: ["d154"],
    tags: ["Celebrex", "celecoxib", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_009",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient says Voltaren helped an arthritic joint, and you remember that Voltaren can refer to diclofenac formulations including topical gel. What is the generic name of Voltaren?",
    options: ["Diclofenac", "Celecoxib", "Ibuprofen", "Meloxicam", "Naproxen"],
    answer: "Diclofenac",
    explanation: "Voltaren is the brand name for diclofenac. Diclofenac is an NSAID that is especially high yield because students often see it as a topical arthritis-pain option as well as an oral NSAID.",
    objective: .brandGeneric,
    relatedDrugIds: ["d220"],
    tags: ["Voltaren", "diclofenac", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_010",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Diclofenac is an NSAID available in oral and topical formulations, and the topical version is especially memorable for arthritis pain of superficial joints. Which brand name best matches diclofenac?",
    options: ["Voltaren", "Celebrex", "Lodine", "Mobic", "Aleve/Naprosyn"],
    answer: "Voltaren",
    explanation: "Diclofenac is marketed as Voltaren. Linking diclofenac with Voltaren helps students recognize both oral NSAID questions and topical arthritis-gel questions.",
    objective: .genericBrand,
    relatedDrugIds: ["d220"],
    tags: ["Voltaren", "diclofenac", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_011",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient reaches for Advil or Motrin for fever, headache, and musculoskeletal pain, and you recall that both are common brand names for the same nonselective NSAID. What is the generic name of Advil/Motrin?",
    options: ["Ibuprofen", "Naproxen", "Acetaminophen", "Diclofenac", "Ketorolac"],
    answer: "Ibuprofen",
    explanation: "Advil and Motrin are brand names for ibuprofen. Ibuprofen is one of the most recognizable nonselective NSAIDs and is high yield for GI bleeding, renal effects, and the aspirin interaction pearl.",
    objective: .brandGeneric,
    relatedDrugIds: ["d152"],
    tags: ["Advil", "Motrin", "ibuprofen", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_012",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Ibuprofen is a nonselective NSAID used for pain, fever, and inflammation, and it is one of the most common OTC drugs patients take without realizing its interaction profile. Which brand name best matches ibuprofen?",
    options: ["Advil/Motrin", "Aleve/Naprosyn", "Tylenol", "Toradol", "Celebrex"],
    answer: "Advil/Motrin",
    explanation: "Ibuprofen is sold as Advil and Motrin. This pair is important because ibuprofen is frequently self-administered and often appears in counseling questions about GI risk and interference with low-dose aspirin.",
    objective: .genericBrand,
    relatedDrugIds: ["d152"],
    tags: ["Advil", "Motrin", "ibuprofen", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_013",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A postoperative patient receives Toradol in the hospital, and the team reminds learners that this NSAID is for short-term acute pain rather than long-term outpatient use. What is the generic name of Toradol?",
    options: ["Ketorolac", "Naproxen", "Ibuprofen", "Diclofenac", "Indomethacin"],
    answer: "Ketorolac",
    explanation: "Toradol is the brand name for ketorolac. Ketorolac is the high-yield short-course NSAID linked to strong analgesia, renal and GI toxicity, and a strict maximum duration of therapy.",
    objective: .brandGeneric,
    relatedDrugIds: ["d156"],
    tags: ["Toradol", "ketorolac", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_014",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Ketorolac is the potent NSAID often used for moderate to severe acute pain in IV, IM, and short oral step-down regimens. Which brand name matches ketorolac?",
    options: ["Toradol", "Voltaren", "Celebrex", "Mobic", "Indocin"],
    answer: "Toradol",
    explanation: "Ketorolac is marketed as Toradol. If a question mentions a potent NSAID that must not be used beyond 5 days, Toradol and ketorolac are the pair to know.",
    objective: .genericBrand,
    relatedDrugIds: ["d156"],
    tags: ["Toradol", "ketorolac", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_015",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient with postherpetic neuralgia says Lidoderm helps because the medicine stays local over the painful area instead of acting like a systemic NSAID. What is the generic name of Lidoderm?",
    options: ["Lidocaine (patch)", "Diclofenac", "Capsaicin", "Acetaminophen", "Naproxen"],
    answer: "Lidocaine (patch)",
    explanation: "Lidoderm is the brand name for lidocaine 5% patch. It is a local anesthetic patch rather than an NSAID and is high yield for postherpetic neuralgia and application counseling.",
    objective: .brandGeneric,
    relatedDrugIds: ["d223"],
    tags: ["Lidoderm", "lidocaine patch", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_016",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Lidocaine patch is the topical local anesthetic option in this subsection and is most classically associated with postherpetic neuralgia. Which brand name matches lidocaine patch?",
    options: ["Lidoderm", "Voltaren", "Mobic", "Celebrex", "Tylenol"],
    answer: "Lidoderm",
    explanation: "Lidocaine patch is sold as Lidoderm. It stands out in this subsection because it provides local analgesia through sodium-channel blockade rather than systemic COX inhibition.",
    objective: .genericBrand,
    relatedDrugIds: ["d223"],
    tags: ["Lidoderm", "lidocaine patch", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_017",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient with chronic osteoarthritis takes Mobic once daily, and you remember it as an NSAID commonly recognized for convenient daily dosing. What is the generic name of Mobic?",
    options: ["Meloxicam", "Celecoxib", "Etodolac", "Nabumetone", "Naproxen"],
    answer: "Meloxicam",
    explanation: "Mobic is the brand name for meloxicam. Meloxicam is a once-daily NSAID that is commonly used for osteoarthritis and rheumatoid arthritis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d224"],
    tags: ["Mobic", "meloxicam", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_018",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Meloxicam is an NSAID often remembered for once-daily dosing in osteoarthritis or rheumatoid arthritis. Which brand name matches meloxicam?",
    options: ["Mobic", "Celebrex", "Voltaren", "Lodine", "Relafen"],
    answer: "Mobic",
    explanation: "Meloxicam is marketed as Mobic. When a question emphasizes once-daily oral NSAID dosing, meloxicam is a strong answer choice to consider.",
    objective: .genericBrand,
    relatedDrugIds: ["d224"],
    tags: ["Mobic", "meloxicam", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_019",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient says Aleve or Naprosyn works well because it lasts longer than some other OTC NSAIDs, making twice-daily use common in many settings. What is the generic name of Aleve/Naprosyn?",
    options: ["Naproxen", "Ibuprofen", "Ketorolac", "Etodolac", "Diclofenac"],
    answer: "Naproxen",
    explanation: "Aleve and Naprosyn are brand names for naproxen. Naproxen is a nonselective NSAID with a relatively longer duration than ibuprofen, making it a familiar twice-daily option.",
    objective: .brandGeneric,
    relatedDrugIds: ["d153"],
    tags: ["Aleve", "Naprosyn", "naproxen", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_020",
    subsectionId: "5a",
    difficulty: .easy,
    question: "Naproxen is a nonselective NSAID used for pain and inflammation and is commonly remembered as a longer-acting cousin of ibuprofen. Which brand name best matches naproxen?",
    options: ["Aleve/Naprosyn", "Advil/Motrin", "Toradol", "Voltaren", "Tylenol"],
    answer: "Aleve/Naprosyn",
    explanation: "Naproxen is sold as Aleve and Naprosyn. This pair is high yield because students often need to distinguish naproxen from ibuprofen by duration and common brand names.",
    objective: .genericBrand,
    relatedDrugIds: ["d153"],
    tags: ["Aleve", "Naprosyn", "naproxen", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_021",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient with osteoarthritis is prescribed Lodine, an NSAID used for pain and arthritis symptoms. What is the generic name of Lodine?",
    options: ["Etodolac", "Meloxicam", "Nabumetone", "Diclofenac", "Celecoxib"],
    answer: "Etodolac",
    explanation: "Lodine is the brand name for etodolac. Etodolac is an NSAID used for pain, osteoarthritis, and rheumatoid arthritis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d221"],
    tags: ["Lodine", "etodolac", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_022",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A rheumatology patient mentions Relafen, and you remember it as the NSAID prodrug in this subsection. What is the generic name of Relafen?",
    options: ["Nabumetone", "Etodolac", "Meloxicam", "Celecoxib", "Naproxen"],
    answer: "Nabumetone",
    explanation: "Relafen is the brand name for nabumetone. Nabumetone is a prodrug NSAID commonly used for osteoarthritis and rheumatoid arthritis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d225"],
    tags: ["Relafen", "nabumetone", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_023",
    subsectionId: "5a",
    difficulty: .easy,
    question: "A patient with acute gout is given Indocin, the classic NSAID board questions often associate with rapid treatment of a hot swollen gout flare. What is the generic name of Indocin?",
    options: ["Indomethacin", "Ketorolac", "Naproxen", "Celecoxib", "Ibuprofen"],
    answer: "Indomethacin",
    explanation: "Indocin is the brand name for indomethacin. Indomethacin is especially memorable as a classic NSAID for acute gouty arthritis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d222"],
    tags: ["Indocin", "indomethacin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_024",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which medication in this subsection is best described as an analgesic and antipyretic with little to no clinically meaningful anti-inflammatory effect?",
    options: ["Acetaminophen", "Ibuprofen", "Naproxen", "Diclofenac", "Celecoxib"],
    answer: "Acetaminophen",
    explanation: "Acetaminophen relieves pain and reduces fever, but it is not used as an anti-inflammatory drug the way NSAIDs are. This distinction is a classic way to separate acetaminophen from the rest of the subsection.",
    objective: .classId,
    relatedDrugIds: ["d155"],
    tags: ["acetaminophen", "analgesic", "antipyretic"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_025",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient presents after a large acetaminophen overdose, and the team wants the antidote that can reduce hepatic injury when given appropriately. Which option is the antidote for acetaminophen toxicity?",
    options: ["N-acetylcysteine", "Naloxone", "Flumazenil", "Vitamin K", "Protamine"],
    answer: "N-acetylcysteine",
    explanation: "N-acetylcysteine is the antidote for acetaminophen overdose. This is one of the highest-yield toxicology facts tied to Tylenol and acetaminophen-containing combination products.",
    objective: .pearl,
    relatedDrugIds: ["d155"],
    tags: ["acetaminophen", "NAC", "overdose"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_026",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient with headaches takes Fioricet, then uses Percocet after dental surgery, and later adds extra-strength Tylenol. Which ingredient is being unintentionally duplicated across all three products and drives the biggest liver-toxicity concern?",
    options: ["Acetaminophen", "Oxycodone", "Butalbital", "Caffeine", "Ibuprofen"],
    answer: "Acetaminophen",
    explanation: "Fioricet, Percocet, and Tylenol all contain acetaminophen. One of the most important counseling points in this subsection is to total acetaminophen from every product to avoid hepatotoxicity.",
    objective: .monitoring,
    relatedDrugIds: ["d155", "d218", "d219"],
    tags: ["acetaminophen", "cumulative dose", "combination products"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_027",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which medication from this subsection is most specifically associated with tension headache treatment because it combines acetaminophen with butalbital and caffeine?",
    options: ["Acetaminophen/Butalbital/Caffeine", "Acetaminophen/Oxycodone", "Lidocaine (patch)", "Celecoxib", "Ketorolac"],
    answer: "Acetaminophen/Butalbital/Caffeine",
    explanation: "Acetaminophen/butalbital/caffeine, branded as Fioricet, is the classic tension-headache combination in this subsection. It is different from Percocet, which is an opioid combination for more severe pain.",
    objective: .indication,
    relatedDrugIds: ["d218"],
    tags: ["Fioricet", "tension headache", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_028",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient with escalating headache frequency keeps using Fioricet and is now sleepy between doses. Which counseling point is most high yield for Fioricet because of the butalbital component?",
    options: ["Sedation and medication-overuse headache can occur", "Severe constipation is expected from every dose", "QT prolongation is the main toxicity", "It should be used for chronic inflammatory arthritis", "It is free of liver toxicity concerns"],
    answer: "Sedation and medication-overuse headache can occur",
    explanation: "The butalbital in Fioricet can cause sedation, and repeated use can contribute to rebound or medication-overuse headache. Because Fioricet also contains acetaminophen, liver-toxicity counseling still matters.",
    objective: .adverseEffect,
    relatedDrugIds: ["d218"],
    tags: ["Fioricet", "butalbital", "overuse headache"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_029",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient starting Percocet is warned about opioid effects that go beyond the acetaminophen component. Which adverse-effect pair is most classically tied to the oxycodone portion of Percocet?",
    options: ["Respiratory depression and constipation", "Dry cough and hyperkalemia", "Tendon rupture and QT prolongation", "Ototoxicity and photosensitivity", "Bradycardia and gingival hyperplasia"],
    answer: "Respiratory depression and constipation",
    explanation: "Percocet contains oxycodone, so opioid adverse effects such as respiratory depression and constipation are key counseling points. The acetaminophen portion adds a second issue: cumulative daily liver-toxicity risk.",
    objective: .adverseEffect,
    relatedDrugIds: ["d219"],
    tags: ["Percocet", "oxycodone", "adverse effects"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_030",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which drug in this subsection works by selectively inhibiting cyclooxygenase-2 (COX-2) rather than nonselectively inhibiting both COX-1 and COX-2?",
    options: ["Celecoxib", "Ibuprofen", "Naproxen", "Ketorolac", "Diclofenac"],
    answer: "Celecoxib",
    explanation: "Celecoxib is the COX-2 selective NSAID in this subsection. Its selectivity helps explain why it is often taught as having less GI toxicity than nonselective NSAIDs, although major NSAID warnings still remain.",
    objective: .moa,
    relatedDrugIds: ["d154"],
    tags: ["celecoxib", "COX-2", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_031",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A learner is trying to remember why celecoxib is often discussed separately from ibuprofen and naproxen. Which statement best explains the usual GI teaching pearl for celecoxib?",
    options: ["It tends to cause less GI ulceration and bleeding than nonselective NSAIDs", "It has no GI risk at all", "It is not an NSAID, so GI risk does not apply", "It increases gastric prostaglandins more than other NSAIDs", "It must be combined with a proton pump inhibitor in every patient"],
    answer: "It tends to cause less GI ulceration and bleeding than nonselective NSAIDs",
    explanation: "Because celecoxib selectively inhibits COX-2, it is often taught as having less GI toxicity than nonselective NSAIDs. That teaching pearl is relative, not absolute, and serious GI events can still occur.",
    objective: .pearl,
    relatedDrugIds: ["d154"],
    tags: ["celecoxib", "GI risk", "COX-2 selective"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_032",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A student incorrectly says celecoxib is completely free of the serious risks seen with other NSAIDs. Which risk pair should you still remember for celecoxib because it remains an NSAID?",
    options: ["Serious cardiovascular thrombotic events and serious GI bleeding or ulceration", "Dry cough and angioedema", "Hypoglycemia and pancreatitis", "Ototoxicity and nephrogenic diabetes insipidus", "Thyroid dysfunction and pulmonary fibrosis"],
    answer: "Serious cardiovascular thrombotic events and serious GI bleeding or ulceration",
    explanation: "Celecoxib is still an NSAID and carries serious cardiovascular and gastrointestinal warnings. Selective COX-2 activity does not eliminate those class risks.",
    objective: .contraindication,
    relatedDrugIds: ["d154"],
    tags: ["celecoxib", "NSAID warnings", "CV GI risk"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_033",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient with a history of serious sulfonamide hypersensitivity asks which NSAID from this subsection deserves extra caution because of its chemical class. Which drug is the best answer?",
    options: ["Celecoxib", "Ibuprofen", "Naproxen", "Ketorolac", "Etodolac"],
    answer: "Celecoxib",
    explanation: "Celecoxib is a sulfonamide and deserves caution in patients with sulfonamide hypersensitivity. This is a classic differentiating pearl that helps separate celecoxib from other NSAIDs.",
    objective: .contraindication,
    relatedDrugIds: ["d154"],
    tags: ["celecoxib", "sulfonamide", "hypersensitivity"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_034",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient with hand osteoarthritis wants a topical option instead of swallowing another oral analgesic. Which medication from this subsection is the topical NSAID best known for arthritis pain and is not meant for immediate relief after the first application?",
    options: ["Diclofenac", "Lidocaine (patch)", "Acetaminophen", "Celecoxib", "Ketorolac"],
    answer: "Diclofenac",
    explanation: "Topical diclofenac is a go-to NSAID option for arthritis pain of superficial joints such as the hands or knees. It differs from lidocaine patch, which is better known for postherpetic neuralgia rather than arthritis inflammation.",
    objective: .indication,
    relatedDrugIds: ["d220"],
    tags: ["diclofenac", "topical NSAID", "arthritis pain"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_035",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient takes daily low-dose aspirin for cardioprotection and asks which common OTC NSAID can interfere with aspirin's antiplatelet effect when taken at the wrong time. Which drug is the classic culprit?",
    options: ["Ibuprofen", "Celecoxib", "Meloxicam", "Etodolac", "Nabumetone"],
    answer: "Ibuprofen",
    explanation: "Ibuprofen is the classic NSAID associated with blunting the antiplatelet effect of low-dose aspirin when the drugs are taken too close together. This is an important counseling pearl because ibuprofen is so widely available OTC.",
    objective: .interaction,
    relatedDrugIds: ["d152"],
    tags: ["ibuprofen", "aspirin interaction", "OTC counseling"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_036",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which risk triad should come to mind for most oral NSAIDs in this subsection, including ibuprofen, naproxen, diclofenac, and ketorolac?",
    options: ["GI bleeding, renal injury, and cardiovascular risk", "Dry cough, angioedema, and hyperkalemia", "Hyperglycemia, weight gain, and edema", "QT prolongation, tendon rupture, and neuropathy", "Myelosuppression, mucositis, and hepatosplenomegaly"],
    answer: "GI bleeding, renal injury, and cardiovascular risk",
    explanation: "The shared high-yield NSAID risk triad is GI toxicity, renal toxicity, and cardiovascular risk. Questions often test this class pattern more than the details of any single NSAID.",
    objective: .classId,
    relatedDrugIds: ["d152", "d153", "d154", "d156", "d220", "d221", "d222", "d224", "d225"],
    tags: ["NSAIDs", "class effects", "GI renal CV"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_037",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient presents with an acutely inflamed first metatarsophalangeal joint, and the stem wants the classic NSAID often associated with acute gout flares. Which drug best fits that description?",
    options: ["Indomethacin", "Acetaminophen", "Celecoxib", "Lidocaine (patch)", "Meloxicam"],
    answer: "Indomethacin",
    explanation: "Indomethacin is a classic high-yield NSAID for acute gouty arthritis. Even when other NSAIDs can also be used, board-style questions frequently point to indomethacin.",
    objective: .indication,
    relatedDrugIds: ["d222"],
    tags: ["indomethacin", "acute gout", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_038",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which medication from this subsection is best known for short-term treatment of moderate to severe acute pain, often starting as an IV or IM hospital analgesic rather than a chronic outpatient arthritis medication?",
    options: ["Ketorolac", "Meloxicam", "Celecoxib", "Nabumetone", "Etodolac"],
    answer: "Ketorolac",
    explanation: "Ketorolac is the potent short-course NSAID used for moderate to severe acute pain, often in inpatient or perioperative settings. It is not the choice for chronic daily arthritis management.",
    objective: .indication,
    relatedDrugIds: ["d156"],
    tags: ["ketorolac", "acute pain", "hospital use"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_039",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A resident wants to keep a patient on ketorolac tablets for two weeks because the analgesia worked well. Which rule makes that plan unsafe?",
    options: ["Total ketorolac therapy should not exceed 5 days", "Ketorolac must always be taken for at least 14 days", "Ketorolac is safe only if paired with aspirin", "Ketorolac becomes safer after the first 72 hours", "Ketorolac is limited only by constipation, not organ toxicity"],
    answer: "Total ketorolac therapy should not exceed 5 days",
    explanation: "Ketorolac therapy has a strict 5-day maximum because longer use increases the risk of serious adverse effects such as GI bleeding and renal injury. This is one of the single most testable ketorolac facts.",
    objective: .dosing,
    relatedDrugIds: ["d156"],
    tags: ["ketorolac", "5 days", "dosing limit"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_040",
    subsectionId: "5a",
    difficulty: .hard,
    question: "A pharmacist sees a new order for ketorolac in a patient who is already taking probenecid. Which action is most appropriate based on this high-yield interaction?",
    options: ["Avoid ketorolac because concomitant probenecid is contraindicated", "Proceed normally because the combination is preferred", "Add aspirin to make the combination safer", "Increase the ketorolac dose to overcome the interaction", "Use ketorolac only if it is topical"],
    answer: "Avoid ketorolac because concomitant probenecid is contraindicated",
    explanation: "Concomitant probenecid is a contraindication to ketorolac. This interaction is more specific and testable than the broad class NSAID warnings students already know.",
    objective: .interaction,
    relatedDrugIds: ["d156"],
    tags: ["ketorolac", "probenecid", "contraindicated interaction"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_041",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which medication from this subsection is most classically indicated for pain associated with postherpetic neuralgia rather than systemic inflammatory pain?",
    options: ["Lidocaine (patch)", "Diclofenac", "Celecoxib", "Naproxen", "Ibuprofen"],
    answer: "Lidocaine (patch)",
    explanation: "Lidocaine 5% patch is the classic local therapy for postherpetic neuralgia. It stands apart from the oral NSAIDs because it treats localized neuropathic pain through local anesthetic action.",
    objective: .indication,
    relatedDrugIds: ["d223"],
    tags: ["lidocaine patch", "postherpetic neuralgia", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_042",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient asks how to use lidocaine 5% patches at home. Which instruction is the most accurate high-yield counseling point?",
    options: ["Apply up to 3 patches for no more than 12 hours in a 24-hour period", "Wear 1 patch continuously for 24 hours every day", "Apply to any painful broken skin for faster absorption", "Use every 4 hours as needed like an oral pain medicine", "Always cover the entire torso if the pain is widespread"],
    answer: "Apply up to 3 patches for no more than 12 hours in a 24-hour period",
    explanation: "Lidocaine 5% patch is typically used for up to 12 hours within a 24-hour period, with a maximum of 3 patches at one time. This is a core dosing pearl for Lidoderm-style questions.",
    objective: .dosing,
    relatedDrugIds: ["d223"],
    tags: ["lidocaine patch", "12 hours", "max 3 patches"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_043",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which NSAID in this subsection is especially remembered for convenient once-daily dosing in chronic osteoarthritis or rheumatoid arthritis management?",
    options: ["Meloxicam", "Ibuprofen", "Ketorolac", "Indomethacin", "Diclofenac"],
    answer: "Meloxicam",
    explanation: "Meloxicam is commonly dosed once daily, which makes it easy to distinguish from shorter-acting agents like ibuprofen and from short-course ketorolac.",
    objective: .pearl,
    relatedDrugIds: ["d224"],
    tags: ["meloxicam", "once daily", "pearl"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_044",
    subsectionId: "5a",
    difficulty: .medium,
    question: "A patient wants to place a lidocaine patch directly over an excoriated shingles lesion because the pain is severe. Which counseling point is most appropriate?",
    options: ["Do not apply lidocaine patch to broken skin; it should be used only on intact skin", "Apply an extra patch to damaged skin for better penetration", "Use the patch only after coating the area with diclofenac gel", "Cut the patch into tiny pieces and pack it into the lesion", "Broken skin does not matter because topical lidocaine has no absorption concerns"],
    answer: "Do not apply lidocaine patch to broken skin; it should be used only on intact skin",
    explanation: "Lidocaine patch is intended for intact skin only. That counseling point helps prevent inappropriate application and excessive absorption concerns.",
    objective: .contraindication,
    relatedDrugIds: ["d223"],
    tags: ["lidocaine patch", "intact skin", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q5a_add_045",
    subsectionId: "5a",
    difficulty: .medium,
    question: "Which NSAID from this subsection is often remembered as the longer-acting nonselective option that many patients take about twice daily, helping distinguish it from the shorter-acting ibuprofen?",
    options: ["Naproxen", "Ibuprofen", "Ketorolac", "Diclofenac", "Celecoxib"],
    answer: "Naproxen",
    explanation: "Naproxen is commonly remembered as a longer-acting nonselective NSAID, which is why twice-daily use is a common pearl. That helps separate naproxen from ibuprofen in exam questions.",
    objective: .pearl,
    relatedDrugIds: ["d153"],
    tags: ["naproxen", "longer acting", "q12h"],
    source: .curated
)
    ]
}
