
// PharmaLingo — Module 5b (Opioids & Pain Management Basics + Adjuncts)
// Curated Add-On Question Pack (45 questions)
// IDs: q5b_add_001 ... q5b_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 5b exists, then append:
//
//    if bank["5b"] == nil { bank["5b"] = [] }
//    bank["5b"]?.append(contentsOf: Self.curatedAddOnQuestions_5b)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d160 (Baclofen), d158 (Cyclobenzaprine),
//   d149 (Fentanyl), d161 (Gabapentin), d148 (Hydrocodone/Acetaminophen), d159 (Methocarbamol),
//   d146 (Morphine), d151 (Naloxone), d147 (Oxycodone), d162 (Pregabalin), d150 (Tramadol).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5b: [Question] = [
.multipleChoice(
    id: "q5b_add_001",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Lioresal is the oral antispasticity agent often used in multiple sclerosis or spinal cord disease because it decreases flexor spasms and muscle rigidity. What is the generic name of Lioresal?",
    options: ["Baclofen", "Cyclobenzaprine", "Methocarbamol", "Gabapentin", "Tramadol"],
    answer: "Baclofen",
    explanation: "Lioresal is the brand name for baclofen. Baclofen is the GABA-acting antispasticity drug in this subsection and is especially associated with spasticity rather than routine acute back-strain pain.",
    objective: .brandGeneric,
    relatedDrugIds: ["d160"],
    tags: ["Lioresal", "baclofen", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_002",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Baclofen is a centrally acting antispasticity medication, so it is most associated with chronic spasticity syndromes rather than simple weekend muscle strain. Which brand name matches baclofen?",
    options: ["Lioresal", "Flexeril", "Robaxin", "Neurontin", "Ultram"],
    answer: "Lioresal",
    explanation: "Baclofen is marketed as Lioresal. Remembering baclofen-Lioresal helps distinguish it from short-term muscle relaxants like cyclobenzaprine or methocarbamol.",
    objective: .genericBrand,
    relatedDrugIds: ["d160"],
    tags: ["baclofen", "Lioresal", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_003",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Flexeril is the classic short-term muscle relaxant used for acute musculoskeletal spasm, and it is well known for causing sedation and dry mouth. What is the generic name of Flexeril?",
    options: ["Cyclobenzaprine", "Baclofen", "Methocarbamol", "Pregabalin", "Morphine"],
    answer: "Cyclobenzaprine",
    explanation: "Flexeril is the brand name for cyclobenzaprine. It is remembered as the TCA-like muscle relaxant used short term for acute muscle spasm, not for chronic neurologic spasticity.",
    objective: .brandGeneric,
    relatedDrugIds: ["d158"],
    tags: ["Flexeril", "cyclobenzaprine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_004",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Cyclobenzaprine is a short-term skeletal muscle relaxant commonly used after acute back or neck strain. Which brand name best matches cyclobenzaprine?",
    options: ["Flexeril", "Lioresal", "Robaxin", "Lyrica", "Narcan"],
    answer: "Flexeril",
    explanation: "Cyclobenzaprine is sold as Flexeril. The pair is high yield because cyclobenzaprine questions often test short-term use and anticholinergic sedation.",
    objective: .genericBrand,
    relatedDrugIds: ["d158"],
    tags: ["cyclobenzaprine", "Flexeril", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_005",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Duragesic is the transdermal opioid product used for selected patients with severe chronic pain who already tolerate opioids. What is the generic name of Duragesic (patch)?",
    options: ["Fentanyl", "Morphine", "Oxycodone", "Hydrocodone/Acetaminophen", "Tramadol"],
    answer: "Fentanyl",
    explanation: "Duragesic is the brand name for fentanyl transdermal patches. The patch formulation is a major pearl because fentanyl patches are not for opioid-naive, short-term pain treatment.",
    objective: .brandGeneric,
    relatedDrugIds: ["d149"],
    tags: ["Duragesic", "fentanyl", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_006",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Fentanyl is a highly potent opioid agonist that appears in this subsection mainly as a long-acting transdermal patch for chronic severe pain. Which brand name best matches fentanyl in this module?",
    options: ["Duragesic (patch)", "MS Contin", "OxyContin/Roxicodone", "Norco/Vicodin", "Ultram"],
    answer: "Duragesic (patch)",
    explanation: "Fentanyl is marketed here as Duragesic transdermal patch. Linking the generic to the patch brand helps students remember the heat warning and opioid-tolerant-only pearl.",
    objective: .genericBrand,
    relatedDrugIds: ["d149"],
    tags: ["fentanyl", "Duragesic", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_007",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Neurontin is a non-opioid pain adjunct that is commonly used for neuropathic pain and postherpetic neuralgia. What is the generic name of Neurontin?",
    options: ["Gabapentin", "Pregabalin", "Baclofen", "Methocarbamol", "Naloxone"],
    answer: "Gabapentin",
    explanation: "Neurontin is the brand name for gabapentin. Gabapentin is a gabapentinoid and is a classic neuropathic-pain adjunct rather than a traditional anti-inflammatory or opioid.",
    objective: .brandGeneric,
    relatedDrugIds: ["d161"],
    tags: ["Neurontin", "gabapentin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_008",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Gabapentin is a gabapentinoid used most often for neuropathic pain, especially burning or shooting pain rather than inflammatory pain. Which brand name matches gabapentin?",
    options: ["Neurontin", "Lyrica", "Flexeril", "Narcan", "Robaxin"],
    answer: "Neurontin",
    explanation: "Gabapentin is marketed as Neurontin. Keeping Neurontin separate from Lyrica is important because both are gabapentinoids but pregabalin has some unique labeling pearls.",
    objective: .genericBrand,
    relatedDrugIds: ["d161"],
    tags: ["gabapentin", "Neurontin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_009",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Norco or Vicodin is a combination pain product that pairs an opioid with acetaminophen, so counseling must cover both opioid toxicity and hidden daily acetaminophen exposure. What is the generic name of Norco/Vicodin?",
    options: ["Hydrocodone/Acetaminophen", "Acetaminophen/Oxycodone", "Oxycodone", "Tramadol", "Morphine"],
    answer: "Hydrocodone/Acetaminophen",
    explanation: "Norco and Vicodin are brand names for hydrocodone/acetaminophen. A core teaching pearl is that patients can accidentally exceed safe acetaminophen limits if they also take OTC Tylenol.",
    objective: .brandGeneric,
    relatedDrugIds: ["d148"],
    tags: ["Norco", "Vicodin", "hydrocodone/APAP", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_010",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Hydrocodone/acetaminophen is a common combination opioid used for moderate pain, and it requires the patient to count every other acetaminophen-containing product they take. Which brand name pair matches hydrocodone/acetaminophen?",
    options: ["Norco/Vicodin", "Percocet", "OxyContin/Roxicodone", "MS Contin", "Ultram"],
    answer: "Norco/Vicodin",
    explanation: "Hydrocodone/acetaminophen is sold as Norco and Vicodin. Distinguishing it from Percocet teaches the hydrocodone-vs-oxycodone difference while reinforcing the hidden-acetaminophen issue.",
    objective: .genericBrand,
    relatedDrugIds: ["d148"],
    tags: ["hydrocodone/APAP", "Norco", "Vicodin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_011",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Robaxin is one of the short-term muscle relaxants used as an adjunct for acute musculoskeletal pain, and it is commonly associated with drowsiness and dizziness. What is the generic name of Robaxin?",
    options: ["Methocarbamol", "Cyclobenzaprine", "Baclofen", "Gabapentin", "Tramadol"],
    answer: "Methocarbamol",
    explanation: "Robaxin is the brand name for methocarbamol. It is typically taught as a muscle relaxant for acute musculoskeletal pain, with sedation and dizziness as practical counseling points.",
    objective: .brandGeneric,
    relatedDrugIds: ["d159"],
    tags: ["Robaxin", "methocarbamol", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_012",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Methocarbamol is a short-term muscle relaxant used in acute musculoskeletal pain and often compared with cyclobenzaprine. Which brand name matches methocarbamol?",
    options: ["Robaxin", "Flexeril", "Lioresal", "Neurontin", "Lyrica"],
    answer: "Robaxin",
    explanation: "Methocarbamol is marketed as Robaxin. In practice and on exams, Robaxin is often contrasted with Flexeril when teaching sedation and short-term spasm treatment.",
    objective: .genericBrand,
    relatedDrugIds: ["d159"],
    tags: ["methocarbamol", "Robaxin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_013",
    subsectionId: "5b",
    difficulty: .easy,
    question: "MS Contin is the extended-release brand associated with the classic reference opioid often used for severe persistent pain. What is the generic name of MS Contin?",
    options: ["Morphine", "Fentanyl", "Oxycodone", "Tramadol", "Hydrocodone/Acetaminophen"],
    answer: "Morphine",
    explanation: "MS Contin is the brand name for extended-release morphine. Morphine is a high-yield opioid because it is often treated as the reference standard against which other opioids are compared.",
    objective: .brandGeneric,
    relatedDrugIds: ["d146"],
    tags: ["MS Contin", "morphine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_014",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Morphine is the classic strong opioid agonist taught as a reference drug for severe pain, especially when students are first learning opioid comparisons. Which brand name in this subsection best matches morphine?",
    options: ["MS Contin", "Duragesic (patch)", "OxyContin/Roxicodone", "Ultram", "Narcan"],
    answer: "MS Contin",
    explanation: "Morphine is marketed as MS Contin in this subsection. Tying morphine to MS Contin also reminds students that this brand represents an extended-release formulation for persistent pain.",
    objective: .genericBrand,
    relatedDrugIds: ["d146"],
    tags: ["morphine", "MS Contin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_015",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Narcan is the community rescue product used to reverse known or suspected opioid overdose, especially when breathing slows or the patient becomes unresponsive. What is the generic name of Narcan?",
    options: ["Naloxone", "Naltrexone", "Morphine", "Fentanyl", "Gabapentin"],
    answer: "Naloxone",
    explanation: "Narcan is the brand name for naloxone. Naloxone is an opioid antagonist used for emergency reversal of opioid-induced respiratory and CNS depression.",
    objective: .brandGeneric,
    relatedDrugIds: ["d151"],
    tags: ["Narcan", "naloxone", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_016",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Naloxone is kept as a rescue medication in homes or clinics where opioid overdose is a concern because it can rapidly reverse opioid effects. Which brand name best matches naloxone?",
    options: ["Narcan", "Ultram", "Lyrica", "Roxicodone", "Lioresal"],
    answer: "Narcan",
    explanation: "Naloxone is marketed as Narcan. The naloxone-Narcan pair is especially high yield because it ties drug identification to overdose recognition and rescue counseling.",
    objective: .genericBrand,
    relatedDrugIds: ["d151"],
    tags: ["naloxone", "Narcan", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_017",
    subsectionId: "5b",
    difficulty: .easy,
    question: "OxyContin and Roxicodone are two brand names that highlight different formulations of the same opioid, one extended-release and one immediate-release. What is the generic name of OxyContin/Roxicodone?",
    options: ["Oxycodone", "Hydrocodone/Acetaminophen", "Morphine", "Fentanyl", "Tramadol"],
    answer: "Oxycodone",
    explanation: "OxyContin and Roxicodone are brands of oxycodone. The pairing is high yield because students are often tested on the ER versus IR distinction rather than the molecule name alone.",
    objective: .brandGeneric,
    relatedDrugIds: ["d147"],
    tags: ["OxyContin", "Roxicodone", "oxycodone", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_018",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Oxycodone is a strong opioid agonist used for moderate to severe pain, and this subsection expects learners to recognize both its extended-release and immediate-release brand names. Which brand name pair best matches oxycodone?",
    options: ["OxyContin/Roxicodone", "Norco/Vicodin", "MS Contin", "Duragesic (patch)", "Ultram"],
    answer: "OxyContin/Roxicodone",
    explanation: "Oxycodone is sold as OxyContin and Roxicodone. OxyContin is the extended-release product, while Roxicodone is the immediate-release product.",
    objective: .genericBrand,
    relatedDrugIds: ["d147"],
    tags: ["oxycodone", "OxyContin", "Roxicodone", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_019",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Lyrica is a gabapentinoid that students often remember because it is also used for fibromyalgia in addition to neuropathic pain. What is the generic name of Lyrica?",
    options: ["Pregabalin", "Gabapentin", "Cyclobenzaprine", "Baclofen", "Naloxone"],
    answer: "Pregabalin",
    explanation: "Lyrica is the brand name for pregabalin. Pregabalin is a gabapentinoid like gabapentin, but its fibromyalgia indication and Schedule V status make it easy to distinguish.",
    objective: .brandGeneric,
    relatedDrugIds: ["d162"],
    tags: ["Lyrica", "pregabalin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_020",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Pregabalin is a gabapentinoid used for neuropathic pain and fibromyalgia, so it is often taught as a more distinctively labeled cousin of gabapentin. Which brand name matches pregabalin?",
    options: ["Lyrica", "Neurontin", "Robaxin", "Flexeril", "Narcan"],
    answer: "Lyrica",
    explanation: "Pregabalin is marketed as Lyrica. Linking pregabalin with Lyrica helps students separate it from Neurontin, the brand name for gabapentin.",
    objective: .genericBrand,
    relatedDrugIds: ["d162"],
    tags: ["pregabalin", "Lyrica", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_021",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Ultram is the pain medication that is remembered for having both weak opioid activity and serotonin/norepinephrine reuptake effects. What is the generic name of Ultram?",
    options: ["Tramadol", "Morphine", "Oxycodone", "Gabapentin", "Methocarbamol"],
    answer: "Tramadol",
    explanation: "Ultram is the brand name for tramadol. Tramadol stands out because it behaves partly like an opioid and partly like an SNRI, which explains some of its unique risks.",
    objective: .brandGeneric,
    relatedDrugIds: ["d150"],
    tags: ["Ultram", "tramadol", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_022",
    subsectionId: "5b",
    difficulty: .easy,
    question: "Tramadol is used for pain but is pharmacologically different from classic opioids because it also affects serotonin and norepinephrine. Which brand name best matches tramadol?",
    options: ["Ultram", "Narcan", "MS Contin", "Roxicodone", "Lioresal"],
    answer: "Ultram",
    explanation: "Tramadol is marketed as Ultram. The tramadol-Ultram pair is high yield because tramadol questions often go beyond naming and ask about seizures or serotonin syndrome.",
    objective: .genericBrand,
    relatedDrugIds: ["d150"],
    tags: ["tramadol", "Ultram", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_023",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A patient with multiple sclerosis has painful flexor spasms and muscle rigidity from chronic spasticity. Which drug from this subsection best fits that indication?",
    options: ["Baclofen", "Cyclobenzaprine", "Methocarbamol", "Gabapentin", "Naproxen"],
    answer: "Baclofen",
    explanation: "Baclofen is the best fit for spasticity related to neurologic disease such as multiple sclerosis or spinal cord injury. Cyclobenzaprine and methocarbamol are taught more as short-term options for acute musculoskeletal spasm.",
    objective: .indication,
    relatedDrugIds: ["d160"],
    tags: ["baclofen", "spasticity", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_024",
    subsectionId: "5b",
    difficulty: .medium,
    question: "Baclofen decreases spasticity by acting through which high-yield mechanism?",
    options: ["GABA-B agonism", "Mu-opioid receptor antagonism", "COX inhibition", "Alpha-2-delta calcium-channel binding", "Serotonin reuptake inhibition"],
    answer: "GABA-B agonism",
    explanation: "Baclofen acts as a GABA-B agonist. That mechanism fits its role in reducing spasticity and helps distinguish it from opioids, NSAIDs, and gabapentinoids.",
    objective: .moa,
    relatedDrugIds: ["d160"],
    tags: ["baclofen", "GABA-B", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_025",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A patient who has been taking baclofen regularly asks whether it can just be stopped tonight because the spasms are better. Which counseling point is most important?",
    options: ["Taper it rather than stopping abruptly because withdrawal can cause hallucinations and seizures", "Stop it abruptly to prevent tolerance", "Switch to naloxone for a few days before stopping", "Take a double dose before stopping to avoid rebound spasms", "Only the bedtime dose needs to be tapered"],
    answer: "Taper it rather than stopping abruptly because withdrawal can cause hallucinations and seizures",
    explanation: "Baclofen should not be stopped abruptly. A high-yield pearl is that withdrawal can cause rebound spasticity as well as serious CNS effects including hallucinations and seizures, so tapering is safer.",
    objective: .pearl,
    relatedDrugIds: ["d160"],
    tags: ["baclofen", "withdrawal", "taper"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_026",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A patient strains a lower back muscle while moving furniture and needs a short-term adjunct to rest and physical therapy for acute painful spasm, not chronic neurologic spasticity. Which drug best fits that role?",
    options: ["Cyclobenzaprine", "Baclofen", "Pregabalin", "Naloxone", "Morphine"],
    answer: "Cyclobenzaprine",
    explanation: "Cyclobenzaprine is the classic short-term muscle relaxant for acute musculoskeletal spasm. Baclofen is more associated with chronic spasticity syndromes, while pregabalin treats neuropathic pain rather than mechanical back spasm.",
    objective: .indication,
    relatedDrugIds: ["d158"],
    tags: ["cyclobenzaprine", "acute spasm", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_027",
    subsectionId: "5b",
    difficulty: .medium,
    question: "Which muscle relaxant in this subsection is structurally similar to tricyclic antidepressants and is therefore more likely to cause dry mouth and other anticholinergic effects?",
    options: ["Cyclobenzaprine", "Methocarbamol", "Baclofen", "Gabapentin", "Naloxone"],
    answer: "Cyclobenzaprine",
    explanation: "Cyclobenzaprine is structurally related to TCAs. That helps explain why dry mouth, sedation, and other anticholinergic-type effects are common teaching points for this drug.",
    objective: .adverseEffect,
    relatedDrugIds: ["d158"],
    tags: ["cyclobenzaprine", "anticholinergic", "dry mouth"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_028",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A patient taking Robaxin for acute musculoskeletal pain asks whether a few drinks and nighttime cold medicine are okay. Which counseling point is best?",
    options: ["Methocarbamol can add to drowsiness and dizziness, so alcohol and other CNS depressants increase impairment risk", "Methocarbamol is stimulating, so alcohol is the only safe sedative to combine with it", "Robaxin blocks opioid receptors, so it offsets alcohol sedation", "Only opioids interact with alcohol; muscle relaxants do not", "Taking methocarbamol with alcohol prevents dizziness"],
    answer: "Methocarbamol can add to drowsiness and dizziness, so alcohol and other CNS depressants increase impairment risk",
    explanation: "Methocarbamol commonly causes drowsiness and dizziness. A practical teaching pearl is to warn patients about impaired driving and additive CNS depression with alcohol or other sedating drugs.",
    objective: .interaction,
    relatedDrugIds: ["d159"],
    tags: ["methocarbamol", "alcohol", "CNS depression"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_029",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A patient describes burning postherpetic neuralgia after shingles and wants an option that targets neuropathic pain rather than inflammation. Which drug from this subsection is a classic choice?",
    options: ["Gabapentin", "Morphine", "Cyclobenzaprine", "Naproxen", "Naloxone"],
    answer: "Gabapentin",
    explanation: "Gabapentin is a classic neuropathic-pain adjunct and is commonly used for postherpetic neuralgia. It is a better mechanistic fit for burning or shooting neuropathic pain than opioids or muscle relaxants.",
    objective: .indication,
    relatedDrugIds: ["d161"],
    tags: ["gabapentin", "postherpetic neuralgia", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_030",
    subsectionId: "5b",
    difficulty: .medium,
    question: "Which gabapentinoid in this subsection is especially memorable because it is a Schedule V controlled substance and is also FDA-approved for fibromyalgia?",
    options: ["Pregabalin", "Gabapentin", "Baclofen", "Cyclobenzaprine", "Tramadol"],
    answer: "Pregabalin",
    explanation: "Pregabalin is the gabapentinoid with Schedule V status and a labeled fibromyalgia indication. Gabapentin is also used for neuropathic pain, but that specific pair of pearls points to pregabalin.",
    objective: .pearl,
    relatedDrugIds: ["d162"],
    tags: ["pregabalin", "fibromyalgia", "Schedule V"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_031",
    subsectionId: "5b",
    difficulty: .hard,
    question: "Pregabalin and gabapentin are grouped together because they reduce neuropathic pain through which high-yield target?",
    options: ["Binding the alpha-2-delta subunit of voltage-gated calcium channels", "Irreversible inhibition of cyclooxygenase", "Direct mu-opioid receptor antagonism", "Blockade of bacterial cell-wall synthesis", "Activation of mineralocorticoid receptors"],
    answer: "Binding the alpha-2-delta subunit of voltage-gated calcium channels",
    explanation: "Gabapentinoids are associated with binding the alpha-2-delta site on voltage-gated calcium channels. That is the key mechanistic pearl separating them from opioids, NSAIDs, and antidepressants.",
    objective: .moa,
    relatedDrugIds: ["d161", "d162"],
    tags: ["gabapentinoids", "alpha-2-delta", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_032",
    subsectionId: "5b",
    difficulty: .medium,
    question: "An older adult with chronic kidney disease is starting gabapentin for neuropathic pain. Which parameter most directly guides safe dose adjustment?",
    options: ["Renal function or creatinine clearance", "INR", "TSH", "ANC", "Serum uric acid"],
    answer: "Renal function or creatinine clearance",
    explanation: "Gabapentin is renally cleared, so renal function guides dose adjustment. This is a classic monitoring pearl because accumulation can worsen dizziness, sedation, and other CNS adverse effects.",
    objective: .monitoring,
    relatedDrugIds: ["d161"],
    tags: ["gabapentin", "renal dosing", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_033",
    subsectionId: "5b",
    difficulty: .hard,
    question: "Tramadol is often taught separately from morphine or oxycodone because its analgesia comes from which dual mechanism?",
    options: ["Weak mu-opioid agonism plus serotonin/norepinephrine reuptake inhibition", "GABA-B agonism plus sodium-channel blockade", "Pure COX-2 inhibition plus acetaminophen activity", "Dopamine antagonism plus muscarinic blockade", "Alpha-1 blockade plus beta-1 blockade"],
    answer: "Weak mu-opioid agonism plus serotonin/norepinephrine reuptake inhibition",
    explanation: "Tramadol has a dual mechanism: weak mu-opioid agonism plus inhibition of serotonin and norepinephrine reuptake. That dual action explains why it behaves differently from classic full opioid agonists.",
    objective: .moa,
    relatedDrugIds: ["d150"],
    tags: ["tramadol", "dual mechanism", "SNRI"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_034",
    subsectionId: "5b",
    difficulty: .hard,
    question: "A patient already taking sertraline asks about starting tramadol for pain. Which interaction risk is especially high yield in this pairing?",
    options: ["Serotonin syndrome", "Hyperkalemia", "Gingival hyperplasia", "Ototoxicity", "Rhabdomyolysis"],
    answer: "Serotonin syndrome",
    explanation: "Because tramadol has serotonergic activity, combining it with SSRIs or SNRIs raises concern for serotonin syndrome. This is one of the major reasons tramadol is tested as more than just 'another opioid.'",
    objective: .interaction,
    relatedDrugIds: ["d150"],
    tags: ["tramadol", "sertraline", "serotonin syndrome"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_035",
    subsectionId: "5b",
    difficulty: .medium,
    question: "Which adverse-effect pearl makes tramadol a less attractive choice in a patient with poorly controlled epilepsy?",
    options: ["It lowers the seizure threshold", "It commonly causes angioedema", "It produces severe neutropenia", "It causes tendon rupture", "It is strongly nephrotoxic"],
    answer: "It lowers the seizure threshold",
    explanation: "Tramadol is high yield for seizure risk. In a patient with epilepsy or other seizure risk factors, that pearl should immediately move tramadol lower on the list.",
    objective: .adverseEffect,
    relatedDrugIds: ["d150"],
    tags: ["tramadol", "seizures", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_036",
    subsectionId: "5b",
    difficulty: .medium,
    question: "Morphine, oxycodone, hydrocodone, and fentanyl all provide analgesia primarily through which receptor action?",
    options: ["Mu-opioid receptor agonism", "GABA-A receptor antagonism", "Histamine-2 receptor blockade", "Alpha-2-delta receptor antagonism", "Cyclooxygenase-2 activation"],
    answer: "Mu-opioid receptor agonism",
    explanation: "The major opioid agonists in this subsection work mainly by activating mu-opioid receptors. The same receptor action that produces analgesia also contributes to respiratory depression and constipation.",
    objective: .moa,
    relatedDrugIds: ["d146", "d147", "d148", "d149"],
    tags: ["opioids", "mu receptor", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_037",
    subsectionId: "5b",
    difficulty: .medium,
    question: "Which drug from this subsection is used to reverse opioid-induced respiratory depression rather than to provide analgesia?",
    options: ["Naloxone", "Morphine", "Fentanyl", "Oxycodone", "Hydrocodone/Acetaminophen"],
    answer: "Naloxone",
    explanation: "Naloxone is an opioid antagonist used for emergency reversal of opioid overdose. Unlike the opioid agonists in this subsection, it is a rescue medication rather than a pain medicine.",
    objective: .classId,
    relatedDrugIds: ["d151"],
    tags: ["naloxone", "opioid antagonist", "class"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_038",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A bystander gives intranasal naloxone and the patient wakes up briefly. Which next step is best?",
    options: ["Call emergency services and give another dose in 2 to 3 minutes if symptoms return or breathing worsens again", "Assume the emergency is over and let the person sleep it off", "Give a benzodiazepine to keep the patient calm", "Start long-acting morphine to prevent withdrawal", "Wait until the next day to seek care if the patient becomes sleepy again"],
    answer: "Call emergency services and give another dose in 2 to 3 minutes if symptoms return or breathing worsens again",
    explanation: "Naloxone can wear off before the opioid does, so toxicity can recur. High-yield counseling is to call for emergency help after the first dose and repeat naloxone every 2 to 3 minutes if needed.",
    objective: .pearl,
    relatedDrugIds: ["d151"],
    tags: ["naloxone", "repeat dosing", "EMS"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_039",
    subsectionId: "5b",
    difficulty: .hard,
    question: "Fentanyl patches provide continuous opioid delivery, but only certain patients are appropriate candidates. Which patient is the best match for a transdermal fentanyl system?",
    options: ["An opioid-tolerant adult with severe chronic pain needing around-the-clock therapy", "An opioid-naive patient with pain after wisdom-tooth extraction", "A teenager with intermittent tension headaches", "A patient needing a one-time PRN medication before physical therapy", "An adult with occasional mild osteoarthritis pain controlled by acetaminophen"],
    answer: "An opioid-tolerant adult with severe chronic pain needing around-the-clock therapy",
    explanation: "Fentanyl transdermal systems are intended for selected opioid-tolerant patients with severe chronic pain requiring continuous opioid therapy. They are not appropriate for opioid-naive or short-term as-needed pain treatment.",
    objective: .contraindication,
    relatedDrugIds: ["d149"],
    tags: ["fentanyl", "opioid tolerant", "patch"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_040",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A patient using a fentanyl patch wants to use a heating pad over the patch site for extra back comfort. What is the best response?",
    options: ["Avoid external heat because it can increase fentanyl absorption and raise overdose risk", "Heat is recommended because it helps the patch release the exact intended dose", "Move the patch to the chest and use as much heat as desired", "Only ice, not heat, changes drug release from patches", "Heat is safe as long as the patient also takes naloxone"],
    answer: "Avoid external heat because it can increase fentanyl absorption and raise overdose risk",
    explanation: "External heat can increase fentanyl absorption from a transdermal system. That is why heating pads, hot tubs, saunas, and similar heat exposures are a classic fentanyl patch counseling pearl.",
    objective: .interaction,
    relatedDrugIds: ["d149"],
    tags: ["fentanyl", "heat", "patch counseling"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_041",
    subsectionId: "5b",
    difficulty: .medium,
    question: "Which opioid in this subsection deserves extra caution in renal impairment because accumulation can increase sedation and respiratory-depression risk?",
    options: ["Morphine", "Naloxone", "Cyclobenzaprine", "Methocarbamol", "Celecoxib"],
    answer: "Morphine",
    explanation: "Morphine is a classic opioid, but it is also high yield for caution in renal impairment because active metabolites can accumulate. That makes morphine different from a simple 'gold standard' memory fact.",
    objective: .pearl,
    relatedDrugIds: ["d146"],
    tags: ["morphine", "renal impairment", "pearl"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_042",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A prescriber writes for oxycodone to cover both chronic baseline pain and intermittent breakthrough pain. Which formulation pearl is correct?",
    options: ["OxyContin is extended-release, while Roxicodone is immediate-release", "Roxicodone is extended-release, while OxyContin is immediate-release", "Both OxyContin and Roxicodone are transdermal patches", "Both brands are non-opioid pain adjuncts rather than opioid agonists", "Neither brand should ever be used for severe pain"],
    answer: "OxyContin is extended-release, while Roxicodone is immediate-release",
    explanation: "OxyContin is the extended-release form of oxycodone for around-the-clock therapy, while Roxicodone is the immediate-release product. That distinction is one of the most testable oxycodone pearls.",
    objective: .dosing,
    relatedDrugIds: ["d147"],
    tags: ["oxycodone", "OxyContin", "Roxicodone"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_043",
    subsectionId: "5b",
    difficulty: .hard,
    question: "A patient with dysphagia asks whether an OxyContin tablet can be crushed before administration. What is the safest answer?",
    options: ["No—extended-release oxycodone should be swallowed whole because crushing can release a potentially dangerous dose at once", "Yes—crushing improves absorption and makes it safer in opioid-naive patients", "Yes—but only if it is mixed with alcohol first", "No—because crushing converts oxycodone into naloxone", "Yes—extended-release opioids are designed to be crushed for faster onset"],
    answer: "No—extended-release oxycodone should be swallowed whole because crushing can release a potentially dangerous dose at once",
    explanation: "OxyContin is an extended-release oxycodone product and should be swallowed whole. Crushing, chewing, or dissolving it can cause rapid release of a large dose and increase overdose risk.",
    objective: .contraindication,
    relatedDrugIds: ["d147"],
    tags: ["OxyContin", "crushing", "extended-release"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_044",
    subsectionId: "5b",
    difficulty: .medium,
    question: "A patient taking Norco for pain also uses extra-strength Tylenol at home. Which counseling point is most important?",
    options: ["Count total daily acetaminophen from all products to avoid exceeding safe limits and liver injury risk", "Take more Tylenol because hydrocodone blocks acetaminophen absorption", "Add ibuprofen only if the urine turns orange", "Avoid all bowel regimens because acetaminophen causes diarrhea", "Use naloxone before each hydrocodone dose"],
    answer: "Count total daily acetaminophen from all products to avoid exceeding safe limits and liver injury risk",
    explanation: "Norco and Vicodin contain hydrocodone plus acetaminophen. A core counseling pearl is that liver injury risk rises when patients unknowingly stack multiple acetaminophen-containing products.",
    objective: .monitoring,
    relatedDrugIds: ["d148"],
    tags: ["hydrocodone/APAP", "acetaminophen", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q5b_add_045",
    subsectionId: "5b",
    difficulty: .medium,
    question: "When starting a full opioid agonist such as morphine, oxycodone, hydrocodone, or fentanyl, which adverse effect should be proactively discussed because it is common and often needs a bowel regimen?",
    options: ["Constipation", "Dry cough", "Gingival hyperplasia", "Photosensitivity", "Tendon rupture"],
    answer: "Constipation",
    explanation: "Constipation is a classic opioid adverse effect and often persists rather than fading with time. That is why opioid counseling often includes hydration, bowel regimens, or other constipation-prevention strategies from the start.",
    objective: .adverseEffect,
    relatedDrugIds: ["d146", "d147", "d148", "d149"],
    tags: ["opioids", "constipation", "adverse effect"],
    source: .curated
)
        ]
    }
