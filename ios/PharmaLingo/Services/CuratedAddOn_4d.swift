// PharmaLingo — Module 4d (Anxiolytics & Sedatives)
// Curated Add-On Question Pack (45 questions)
// IDs: q4d_add_001 ... q4d_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 4d exists, then append:
//
//    if bank["4d"] == nil { bank["4d"] = [] }
//    bank["4d"]?.append(contentsOf: Self.curatedAddOnQuestions_4d)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d80 (Alprazolam), d81 (Lorazepam),
//   d82 (Diazepam), d83 (Midazolam), d84 (Zolpidem), d85 (Suvorexant).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_4d: [Question] = [
.multipleChoice(
    id: "q4d_add_001",
    subsectionId: "4d",
    difficulty: .easy,
    question: "A patient with panic disorder is started on Xanax, a short-acting benzodiazepine remembered for fast symptom relief but high misuse and dependence potential. What is the generic name of Xanax?",
    options: ["Alprazolam", "Lorazepam", "Diazepam", "Zolpidem", "Suvorexant"],
    answer: "Alprazolam",
    explanation: "Xanax is the brand name for alprazolam. Alprazolam is the classic short-acting outpatient benzodiazepine tied to panic disorder and dependence counseling.",
    objective: .brandGeneric,
    relatedDrugIds: ["d80"],
    tags: ["alprazolam", "Xanax", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_002",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Alprazolam is a benzodiazepine used for generalized anxiety disorder and panic disorder, and it is especially high yield for dependence and withdrawal teaching. Which brand name matches alprazolam?",
    options: ["Xanax", "Ativan", "Valium", "Ambien", "Belsomra"],
    answer: "Xanax",
    explanation: "Alprazolam is marketed as Xanax. Pairing this with panic disorder and short-acting benzo counseling helps separate it from the other sedatives in this subsection.",
    objective: .genericBrand,
    relatedDrugIds: ["d80"],
    tags: ["alprazolam", "Xanax", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_003",
    subsectionId: "4d",
    difficulty: .easy,
    question: "A patient in alcohol withdrawal is treated with Valium, a long-acting benzodiazepine with active metabolites that can provide smoother coverage than shorter-acting options. What is the generic name of Valium?",
    options: ["Diazepam", "Lorazepam", "Alprazolam", "Midazolam", "Zolpidem"],
    answer: "Diazepam",
    explanation: "Valium is the brand name for diazepam. Diazepam is the classic long-acting benzodiazepine in this subsection and is high yield for alcohol withdrawal and muscle spasm questions.",
    objective: .brandGeneric,
    relatedDrugIds: ["d82"],
    tags: ["diazepam", "Valium", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_004",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Diazepam is a benzodiazepine used for anxiety, alcohol withdrawal, seizures, and skeletal muscle spasm, and it is remembered for very long duration because of active metabolites. Which brand name matches diazepam?",
    options: ["Valium", "Ativan", "Versed", "Xanax", "Ambien"],
    answer: "Valium",
    explanation: "Diazepam is marketed as Valium. On exams, Valium should make you think long-acting benzodiazepine, active metabolites, and alcohol withdrawal or muscle spasm use.",
    objective: .genericBrand,
    relatedDrugIds: ["d82"],
    tags: ["diazepam", "Valium", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_005",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Ativan is a benzodiazepine commonly used for anxiety and is especially high yield because it is often preferred in liver disease and is used IV for status epilepticus. What is the generic name of Ativan?",
    options: ["Lorazepam", "Diazepam", "Alprazolam", "Midazolam", "Suvorexant"],
    answer: "Lorazepam",
    explanation: "Ativan is the brand name for lorazepam. Lorazepam is one of the classic “LOT” benzodiazepines and is a key emergency medicine and liver-disease pearl drug.",
    objective: .brandGeneric,
    relatedDrugIds: ["d81"],
    tags: ["lorazepam", "Ativan", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_006",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Lorazepam is a benzodiazepine used for anxiety, alcohol withdrawal, and status epilepticus, and it is remembered as a safer benzo choice when liver metabolism is a concern. Which brand name matches lorazepam?",
    options: ["Ativan", "Xanax", "Valium", "Versed", "Belsomra"],
    answer: "Ativan",
    explanation: "Lorazepam is marketed as Ativan. Remembering Ativan with the liver-disease and status-epilepticus pearls helps it stand apart from alprazolam and diazepam.",
    objective: .genericBrand,
    relatedDrugIds: ["d81"],
    tags: ["lorazepam", "Ativan", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_007",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Before an endoscopy, the care team uses Versed for anxiolysis and anterograde amnesia, knowing it has rapid onset but meaningful respiratory risk. What is the generic name of Versed?",
    options: ["Midazolam", "Diazepam", "Lorazepam", "Zolpidem", "Suvorexant"],
    answer: "Midazolam",
    explanation: "Versed is the brand name for midazolam. Midazolam is the classic hospital procedural-sedation benzodiazepine in this subsection.",
    objective: .brandGeneric,
    relatedDrugIds: ["d83"],
    tags: ["midazolam", "Versed", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_008",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Midazolam is a benzodiazepine used for preoperative and procedural sedation, and it is especially high yield for amnesia and respiratory-depression monitoring. Which brand name matches midazolam?",
    options: ["Versed", "Valium", "Ativan", "Ambien", "Xanax"],
    answer: "Versed",
    explanation: "Midazolam is marketed as Versed. Think of Versed when the question mentions rapid procedural sedation, amnesia, and close airway monitoring.",
    objective: .genericBrand,
    relatedDrugIds: ["d83"],
    tags: ["midazolam", "Versed", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_009",
    subsectionId: "4d",
    difficulty: .easy,
    question: "A patient with trouble falling asleep is prescribed Ambien, a non-benzodiazepine hypnotic remembered for sleep-driving and other complex sleep behaviors. What is the generic name of Ambien?",
    options: ["Zolpidem", "Suvorexant", "Alprazolam", "Diazepam", "Lorazepam"],
    answer: "Zolpidem",
    explanation: "Ambien is the brand name for zolpidem. Zolpidem is the classic Z-drug in this subsection and is high yield for complex sleep-behavior counseling.",
    objective: .brandGeneric,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "Ambien", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_010",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Zolpidem is a non-benzodiazepine hypnotic used for short-term insomnia, and it is best remembered for bedtime-only dosing and boxed-warning complex sleep behaviors. Which brand name matches zolpidem?",
    options: ["Ambien", "Belsomra", "Versed", "Xanax", "Ativan"],
    answer: "Ambien",
    explanation: "Zolpidem is marketed as Ambien. On exams, Ambien should trigger thoughts of insomnia, bedtime counseling, lower starting doses in women, and sleepwalking/sleep-driving risk.",
    objective: .genericBrand,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "Ambien", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_011",
    subsectionId: "4d",
    difficulty: .easy,
    question: "A patient with insomnia is started on Belsomra, an orexin receptor antagonist that helps with sleep onset and maintenance and is notable for daytime somnolence and sleep paralysis. What is the generic name of Belsomra?",
    options: ["Suvorexant", "Zolpidem", "Midazolam", "Lorazepam", "Diazepam"],
    answer: "Suvorexant",
    explanation: "Belsomra is the brand name for suvorexant. Suvorexant stands apart from the other drugs here because it blocks orexin rather than enhancing GABA-A.",
    objective: .brandGeneric,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "Belsomra", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_012",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Suvorexant is an orexin receptor antagonist used for insomnia, and it is high yield for next-day driving impairment, narcolepsy contraindication, and sleep-paralysis counseling. Which brand name matches suvorexant?",
    options: ["Belsomra", "Ambien", "Versed", "Valium", "Ativan"],
    answer: "Belsomra",
    explanation: "Suvorexant is marketed as Belsomra. Belsomra should immediately make you think orexin blockade rather than the GABA-A mechanisms of the benzos and Z-drugs.",
    objective: .genericBrand,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "Belsomra", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_013",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A hospitalized patient is receiving alprazolam, lorazepam, diazepam, or midazolam. Which mechanism best describes the benzodiazepine class?",
    options: ["Positive allosteric modulation of GABA-A receptors", "Orexin receptor antagonism", "Irreversible MAO inhibition", "Dopamine D2 blockade", "Selective serotonin reuptake inhibition"],
    answer: "Positive allosteric modulation of GABA-A receptors",
    explanation: "Benzodiazepines enhance GABA-A receptor activity. That increased inhibitory signaling explains their anxiolytic, sedative, anticonvulsant, and amnestic effects.",
    objective: .moa,
    relatedDrugIds: ["d80", "d81", "d82", "d83"],
    tags: ["benzodiazepines", "GABA-A", "MOA"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_014",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A prescriber wants an insomnia medication that works by blocking a wake-promoting neuropeptide system rather than enhancing GABA-A. Which drug from this subsection best matches that mechanism?",
    options: ["Suvorexant", "Zolpidem", "Alprazolam", "Diazepam", "Lorazepam"],
    answer: "Suvorexant",
    explanation: "Suvorexant is an orexin receptor antagonist. That makes it mechanistically distinct from benzodiazepines and from zolpidem, which acts at the GABA-A receptor complex.",
    objective: .moa,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "orexin", "MOA"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_015",
    subsectionId: "4d",
    difficulty: .medium,
    question: "Which drug in this subsection is the classic Z-drug: a non-benzodiazepine hypnotic that still acts at the GABA-A benzodiazepine receptor complex to help with sleep initiation?",
    options: ["Zolpidem", "Suvorexant", "Lorazepam", "Diazepam", "Alprazolam"],
    answer: "Zolpidem",
    explanation: "Zolpidem is the Z-drug in this subsection. It is not a benzodiazepine structurally, but it works at the GABA-A receptor complex and is used as a hypnotic rather than a daytime anxiolytic.",
    objective: .classId,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "Z-drug", "class"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_016",
    subsectionId: "4d",
    difficulty: .easy,
    question: "Students often use suffixes to spot drug classes quickly. In this subsection, generic names ending in -pam or -lam most strongly suggest which class?",
    options: ["Benzodiazepines", "Orexin receptor antagonists", "SSRIs", "Antipsychotics", "Barbiturates"],
    answer: "Benzodiazepines",
    explanation: "The -pam and -lam patterns are classic benzodiazepine clues. Alprazolam, lorazepam, diazepam, and midazolam all fit that recognition shortcut.",
    objective: .suffixId,
    relatedDrugIds: ["d80", "d81", "d82", "d83"],
    tags: ["suffix", "-pam", "-lam"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_017",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient with panic attacks needs an outpatient benzodiazepine especially remembered for panic disorder treatment rather than bedtime insomnia treatment or procedural sedation. Which drug best fits?",
    options: ["Alprazolam", "Zolpidem", "Midazolam", "Suvorexant", "Diazepam"],
    answer: "Alprazolam",
    explanation: "Alprazolam is the high-yield panic-disorder benzodiazepine in this subsection. Diazepam can treat anxiety too, but alprazolam is the classic panic-disorder pairing students are expected to know.",
    objective: .indication,
    relatedDrugIds: ["d80"],
    tags: ["alprazolam", "panic disorder", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_018",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient in alcohol withdrawal needs a benzodiazepine with long action and active metabolites that can provide smoother symptom coverage than shorter-acting options. Which drug best matches that description?",
    options: ["Diazepam", "Alprazolam", "Zolpidem", "Suvorexant", "Midazolam"],
    answer: "Diazepam",
    explanation: "Diazepam is the long-acting benzodiazepine with active metabolites. That long duration is a major reason it is remembered for alcohol withdrawal and muscle-spasm questions.",
    objective: .indication,
    relatedDrugIds: ["d82"],
    tags: ["diazepam", "alcohol withdrawal", "long acting"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_019",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient with cirrhosis needs a benzodiazepine for severe anxiety. Which option is classically preferred because it is less dependent on oxidative hepatic metabolism?",
    options: ["Lorazepam", "Diazepam", "Alprazolam", "Midazolam", "Zolpidem"],
    answer: "Lorazepam",
    explanation: "Lorazepam is a classic liver-disease pearl because it is less dependent on oxidative metabolism than diazepam, alprazolam, or midazolam. This is why students learn the “LOT” memory aid.",
    objective: .pearl,
    relatedDrugIds: ["d81"],
    tags: ["lorazepam", "liver disease", "LOT"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_020",
    subsectionId: "4d",
    difficulty: .medium,
    question: "Before an endoscopy, the team wants pre-procedure anxiolysis and anterograde amnesia from a fast-onset agent that must be given with airway monitoring. Which drug is the classic choice?",
    options: ["Midazolam", "Alprazolam", "Suvorexant", "Zolpidem", "Diazepam"],
    answer: "Midazolam",
    explanation: "Midazolam is the classic procedural-sedation benzodiazepine. Its rapid onset and amnestic effect are useful, but its respiratory risk is why monitoring matters.",
    objective: .indication,
    relatedDrugIds: ["d83"],
    tags: ["midazolam", "procedural sedation", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_021",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient says, “I can’t fall asleep, but I do not need a daytime anxiety medication.” Which drug from this subsection is most specifically used as a short-term hypnotic for insomnia characterized by sleep-initiation difficulty?",
    options: ["Zolpidem", "Lorazepam", "Alprazolam", "Diazepam", "Midazolam"],
    answer: "Zolpidem",
    explanation: "Zolpidem is used for short-term insomnia, especially difficulty falling asleep. It is a hypnotic, not a standard daytime anxiolytic like the benzodiazepines.",
    objective: .indication,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "insomnia", "sleep initiation"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_022",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient has insomnia with trouble both falling asleep and staying asleep, and the prescriber wants an orexin receptor antagonist rather than a benzo or Z-drug. Which medication best matches that plan?",
    options: ["Suvorexant", "Zolpidem", "Alprazolam", "Diazepam", "Lorazepam"],
    answer: "Suvorexant",
    explanation: "Suvorexant is an orexin receptor antagonist indicated for insomnia characterized by difficulties with sleep onset and/or sleep maintenance. That makes it mechanistically and clinically distinct from zolpidem.",
    objective: .indication,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "insomnia", "sleep maintenance"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_023",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient with painful skeletal muscle spasm and anxiety asks which benzodiazepine in this subsection is also high yield for muscle-spasm relief. Which drug fits best?",
    options: ["Diazepam", "Alprazolam", "Lorazepam", "Midazolam", "Suvorexant"],
    answer: "Diazepam",
    explanation: "Diazepam is the classic benzodiazepine paired with muscle-spasm relief. That pearl helps separate it from alprazolam and lorazepam, which are more strongly associated with anxiety and withdrawal questions.",
    objective: .indication,
    relatedDrugIds: ["d82"],
    tags: ["diazepam", "muscle spasm", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_024",
    subsectionId: "4d",
    difficulty: .hard,
    question: "In the ED, a patient with convulsive status epilepticus needs an IV benzodiazepine with a classic labeled role in this emergency. Which drug is the best answer?",
    options: ["Lorazepam", "Alprazolam", "Zolpidem", "Suvorexant", "Midazolam"],
    answer: "Lorazepam",
    explanation: "Lorazepam injection has a classic role in status epilepticus. Even though other benzodiazepines may appear in seizure care, Ativan is the high-yield answer in this subsection.",
    objective: .indication,
    relatedDrugIds: ["d81"],
    tags: ["lorazepam", "status epilepticus", "ED"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_025",
    subsectionId: "4d",
    difficulty: .hard,
    question: "Which benzodiazepine in this subsection is most associated with a short-acting, high-misuse, rebound-anxiety reputation in outpatient panic treatment?",
    options: ["Alprazolam", "Diazepam", "Lorazepam", "Midazolam", "Suvorexant"],
    answer: "Alprazolam",
    explanation: "Alprazolam is the classic short-acting outpatient benzodiazepine tied to panic disorder, dependence, and rebound symptoms between doses. That is why tapering and misuse counseling are so important.",
    objective: .pearl,
    relatedDrugIds: ["d80"],
    tags: ["alprazolam", "short acting", "misuse"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_026",
    subsectionId: "4d",
    difficulty: .hard,
    question: "Which drug in this subsection is most likely to accumulate because it has active metabolites and a very long terminal elimination profile?",
    options: ["Diazepam", "Alprazolam", "Lorazepam", "Midazolam", "Zolpidem"],
    answer: "Diazepam",
    explanation: "Diazepam is the classic long-acting benzodiazepine with active metabolites. That pharmacokinetic profile helps explain its smoother withdrawal coverage but also its tendency to linger.",
    objective: .pearl,
    relatedDrugIds: ["d82"],
    tags: ["diazepam", "active metabolites", "long half-life"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_027",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A hospitalized patient receives a benzodiazepine plus IV opioids. Which complication is the boxed-warning concern clinicians should monitor for most closely?",
    options: ["Respiratory depression", "Hypertensive crisis", "Neutropenia", "Tardive dyskinesia", "Hyperthyroidism"],
    answer: "Respiratory depression",
    explanation: "The major boxed-warning concern when benzodiazepines are combined with opioids is profound sedation and respiratory depression, which can progress to coma or death.",
    objective: .interaction,
    relatedDrugIds: ["d80", "d81", "d82", "d83"],
    tags: ["benzodiazepines", "opioids", "respiratory depression"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_028",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient who has taken lorazepam nightly for months asks whether it is okay to stop abruptly tonight. Which counseling point is most accurate?",
    options: ["Gradual tapering is needed because abrupt discontinuation can trigger serious, even life-threatening, withdrawal", "Abrupt discontinuation is encouraged to avoid daytime sedation", "Switching directly to zolpidem prevents withdrawal", "Dependence does not occur with lorazepam when prescribed", "Taking lorazepam with food prevents withdrawal"],
    answer: "Gradual tapering is needed because abrupt discontinuation can trigger serious, even life-threatening, withdrawal",
    explanation: "Lorazepam and other benzodiazepines can cause clinically significant physical dependence. Stopping suddenly can precipitate severe withdrawal, including seizures, so tapering is the teaching pearl.",
    objective: .pearl,
    relatedDrugIds: ["d81"],
    tags: ["lorazepam", "withdrawal", "taper"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_029",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient reports sleep-driving and making food overnight after taking a sleep medication, with no memory of the event the next morning. Which drug in this subsection is famous for boxed-warning complex sleep behaviors?",
    options: ["Zolpidem", "Alprazolam", "Diazepam", "Lorazepam", "Midazolam"],
    answer: "Zolpidem",
    explanation: "Zolpidem is the classic high-yield culprit for complex sleep behaviors such as sleep-walking and sleep-driving. Patients should stop the drug and contact the prescriber if these occur.",
    objective: .adverseEffect,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "complex sleep behaviors", "boxed warning"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_030",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient with narcolepsy asks for a new insomnia medication. Which option from this subsection is specifically contraindicated in narcolepsy?",
    options: ["Suvorexant", "Zolpidem", "Diazepam", "Alprazolam", "Lorazepam"],
    answer: "Suvorexant",
    explanation: "Suvorexant is contraindicated in narcolepsy. Because it blocks orexin wake-promoting signaling, it can worsen the very physiology that is already impaired in narcolepsy.",
    objective: .contraindication,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "narcolepsy", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_031",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient taking Belsomra describes being awake but unable to move for a few moments during a sleep-wake transition. Which adverse effect best matches this orexin-antagonist pearl?",
    options: ["Sleep paralysis", "Tardive dyskinesia", "Serotonin syndrome", "Orthostatic syncope", "Akathisia"],
    answer: "Sleep paralysis",
    explanation: "Suvorexant can cause sleep paralysis and other REM-related phenomena such as hypnagogic or hypnopompic hallucinations. This is a signature counseling point for orexin antagonists.",
    objective: .adverseEffect,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "sleep paralysis", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_032",
    subsectionId: "4d",
    difficulty: .medium,
    question: "Which drug in this subsection is especially associated with respiratory depression and apnea during procedural sedation, particularly when combined with other CNS depressants?",
    options: ["Midazolam", "Zolpidem", "Suvorexant", "Alprazolam", "Diazepam"],
    answer: "Midazolam",
    explanation: "Midazolam is the classic answer when procedural sedation and respiratory depression appear in the same question. This is why capnography, pulse oximetry, and airway readiness matter.",
    objective: .adverseEffect,
    relatedDrugIds: ["d83"],
    tags: ["midazolam", "respiratory depression", "sedation"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_033",
    subsectionId: "4d",
    difficulty: .medium,
    question: "Which benzodiazepine is especially associated with anterograde amnesia and is often chosen because patients remember little of the procedure afterward?",
    options: ["Midazolam", "Zolpidem", "Suvorexant", "Alprazolam", "Diazepam"],
    answer: "Midazolam",
    explanation: "Midazolam is famous for producing anterograde amnesia during procedural sedation. That memory effect is part of why it is so useful in endoscopy and preoperative settings.",
    objective: .pearl,
    relatedDrugIds: ["d83"],
    tags: ["midazolam", "amnesia", "procedural sedation"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_034",
    subsectionId: "4d",
    difficulty: .hard,
    question: "A clinician adds ketoconazole to a patient receiving midazolam. What is the highest-yield interaction concern?",
    options: ["Prolonged sedation from CYP3A4 inhibition", "Severe hyperkalemia from RAAS blockade", "Serotonin syndrome from MAO inhibition", "Reduced anticoagulation from vitamin K excess", "Loss of efficacy from enzyme induction"],
    answer: "Prolonged sedation from CYP3A4 inhibition",
    explanation: "Midazolam is a CYP3A4 substrate, so strong inhibitors such as ketoconazole can raise exposure and prolong sedation. This is a classic interaction pearl for procedural benzodiazepines.",
    objective: .interaction,
    relatedDrugIds: ["d83"],
    tags: ["midazolam", "CYP3A4", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_035",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient asks how to take zolpidem correctly. Which instruction is best?",
    options: ["Take it right before bed only when you can stay in bed 7 to 8 hours", "Take it each morning with breakfast to reduce dizziness", "Take it after a heavy meal so it works faster", "Split the dose and take half every 2 hours overnight", "Use it during the day for panic attacks"],
    answer: "Take it right before bed only when you can stay in bed 7 to 8 hours",
    explanation: "Zolpidem should be taken immediately before bedtime, and only when the patient can stay in bed a full night. This counseling pearl reduces next-day impairment risk.",
    objective: .dosing,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "bedtime", "7-8 hours"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_036",
    subsectionId: "4d",
    difficulty: .hard,
    question: "Which bedtime hypnotic in this subsection has a well-known dosing pearl that women generally start lower, often 5 mg for immediate-release products?",
    options: ["Zolpidem", "Suvorexant", "Diazepam", "Alprazolam", "Lorazepam"],
    answer: "Zolpidem",
    explanation: "Zolpidem is the high-yield sleep drug with lower initial immediate-release dosing in women. This pearl exists because next-morning blood levels and impairment can be greater.",
    objective: .dosing,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "women", "dose"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_037",
    subsectionId: "4d",
    difficulty: .hard,
    question: "A patient asks which sleep medication from this subsection should not be taken with or right after a meal because food can slow sleep onset. Which best answer fits that classic counseling pearl?",
    options: ["Zolpidem", "Lorazepam", "Diazepam", "Alprazolam", "Midazolam"],
    answer: "Zolpidem",
    explanation: "Zolpidem works best when taken right before bed and not with or right after a meal. Food can delay its effect, which matters when the goal is fast sleep initiation.",
    objective: .dosing,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "meal", "sleep onset"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_038",
    subsectionId: "4d",
    difficulty: .hard,
    question: "A patient is prescribed Belsomra but plans to eat a large meal immediately beforehand. Which counseling point is most accurate?",
    options: ["Taking suvorexant with or soon after a meal can delay its effect", "Suvorexant must always be taken with food to avoid hypotension", "Food converts suvorexant into an active metabolite", "Suvorexant should be taken every morning with breakfast", "Meals eliminate the risk of next-day somnolence"],
    answer: "Taking suvorexant with or soon after a meal can delay its effect",
    explanation: "Suvorexant should be taken within 30 minutes of bedtime, and meals can delay onset. That matters when the patient expects quick help with sleep.",
    objective: .dosing,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "meal", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_039",
    subsectionId: "4d",
    difficulty: .medium,
    question: "Which insomnia medication from this subsection is especially known for next-day impairment and driving caution at higher doses, including the 20 mg dose?",
    options: ["Suvorexant", "Alprazolam", "Diazepam", "Midazolam", "Lorazepam"],
    answer: "Suvorexant",
    explanation: "Suvorexant can impair next-day alertness and driving, and that risk increases with higher doses. This is one of the core counseling pearls that separates it from the daytime anxiolytics in the subsection.",
    objective: .adverseEffect,
    relatedDrugIds: ["d85"],
    tags: ["suvorexant", "next-day impairment", "driving"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_040",
    subsectionId: "4d",
    difficulty: .hard,
    question: "A student compares zolpidem with suvorexant. Which statement is correct?",
    options: ["Zolpidem is a benzo-like GABA-A hypnotic, while suvorexant blocks orexin receptors", "Zolpidem blocks orexin receptors, while suvorexant is a benzodiazepine", "Both are benzodiazepines with identical boxed warnings for dependence and withdrawal", "Both are first-line daytime anxiolytics for panic disorder", "Neither can impair next-day alertness"],
    answer: "Zolpidem is a benzo-like GABA-A hypnotic, while suvorexant blocks orexin receptors",
    explanation: "Zolpidem is the Z-drug, which works at the GABA-A receptor complex, while suvorexant is the orexin receptor antagonist. This is the central mechanistic distinction between the two insomnia agents in 4d.",
    objective: .mixedReview,
    relatedDrugIds: ["d84", "d85"],
    tags: ["zolpidem", "suvorexant", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_041",
    subsectionId: "4d",
    difficulty: .hard,
    question: "A patient with prior episodes of complex sleep behaviors asks whether it is safe to retry Ambien. What is the best answer?",
    options: ["It is contraindicated in patients who have experienced complex sleep behaviors after zolpidem", "The problem only matters if alcohol was also used", "A lower morning dose eliminates the concern", "Switching from tablets to sublingual zolpidem eliminates the concern", "The warning applies only to benzodiazepines"],
    answer: "It is contraindicated in patients who have experienced complex sleep behaviors after zolpidem",
    explanation: "Zolpidem is contraindicated in patients who have had complex sleep behaviors with prior use. The right move is to stop it and use a different strategy rather than rechallenge casually.",
    objective: .contraindication,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "contraindication", "complex sleep behaviors"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_042",
    subsectionId: "4d",
    difficulty: .medium,
    question: "Which benzodiazepine from this subsection is most strongly associated with the “LOT” memory aid and is often preferred when liver metabolism is a major concern?",
    options: ["Lorazepam", "Diazepam", "Alprazolam", "Midazolam", "Zolpidem"],
    answer: "Lorazepam",
    explanation: "Lorazepam is one of the classic “LOT” benzodiazepines. In practice and on exams, that cue often points to less dependence on oxidative liver metabolism.",
    objective: .pearl,
    relatedDrugIds: ["d81"],
    tags: ["lorazepam", "LOT", "liver disease"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_043",
    subsectionId: "4d",
    difficulty: .medium,
    question: "A patient says they had two glasses of wine and now want to take their bedtime sleep medicine. Which counseling point specifically matches zolpidem labeling?",
    options: ["Do not take zolpidem after drinking alcohol that evening", "Alcohol prevents zolpidem from working, so the dose should be doubled", "Alcohol is only a concern with suvorexant, not zolpidem", "Drinking alcohol makes zolpidem safer by reducing sleepwalking", "Zolpidem should always be combined with alcohol to improve sleep maintenance"],
    answer: "Do not take zolpidem after drinking alcohol that evening",
    explanation: "Zolpidem labeling specifically counsels patients not to take it if they drank alcohol that evening. Combining CNS depressants increases the risk of impairment and dangerous sleep behaviors.",
    objective: .interaction,
    relatedDrugIds: ["d84"],
    tags: ["zolpidem", "alcohol", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_044",
    subsectionId: "4d",
    difficulty: .hard,
    question: "Which statement about the benzodiazepines in this subsection is true?",
    options: ["Combining them with opioids can markedly worsen opioid-related respiratory depression", "They work by blocking orexin receptors", "They are safest to stop abruptly after chronic daily use", "They are first-line agents for schizophrenia", "They never cause physical dependence"],
    answer: "Combining them with opioids can markedly worsen opioid-related respiratory depression",
    explanation: "The benzodiazepine-opioid interaction is a core boxed-warning pearl. The combo can produce profound sedation, respiratory depression, coma, and death.",
    objective: .interaction,
    relatedDrugIds: ["d80", "d81", "d82", "d83"],
    tags: ["benzodiazepines", "opioids", "boxed warning"],
    source: .curated
),

.multipleChoice(
    id: "q4d_add_045",
    subsectionId: "4d",
    difficulty: .hard,
    question: "A clinician needs the classic reversal agent for excessive benzodiazepine sedation. Which medication is the usual antidote?",
    options: ["Flumazenil", "Naloxone", "Protamine", "Phytonadione", "Atropine"],
    answer: "Flumazenil",
    explanation: "Flumazenil is the classic benzodiazepine reversal agent. It is a high-yield class pearl worth knowing whenever benzodiazepine sedation or overdose is discussed.",
    objective: .pearl,
    relatedDrugIds: ["d80", "d81", "d82", "d83"],
    tags: ["flumazenil", "benzodiazepines", "reversal"],
    source: .curated
)
    ]
}
