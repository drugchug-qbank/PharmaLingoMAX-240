// PharmaLingo — Module 4e (Stimulants & ADHD Meds)
// Curated Add-On Question Pack (45 questions)
// IDs: q4e_add_001 ... q4e_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 4e exists, then append:
//
//    if bank["4e"] == nil { bank["4e"] = [] }
//    bank["4e"]?.append(contentsOf: Self.curatedAddOnQuestions_4e)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d212 (Amphetamine/dextroamphetamine),
//   d213 (Atomoxetine), d214 (Dexmethylphenidate), d215 (Guanfacine ER),
//   d216 (Lisdexamfetamine), d217 (Methylphenidate).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_4e: [Question] = [
.multipleChoice(
    id: "q4e_add_001",
    subsectionId: "4e",
    difficulty: .easy,
    question: "A college student with ADHD and narcolepsy is prescribed Adderall, the classic mixed amphetamine salts product and a Schedule II stimulant. What is the generic name of Adderall?",
    options: ["Amphetamine/dextroamphetamine", "Atomoxetine", "Dexmethylphenidate", "Lisdexamfetamine", "Methylphenidate"],
    answer: "Amphetamine/dextroamphetamine",
    explanation: "Adderall is the brand name for amphetamine/dextroamphetamine. It is the mixed amphetamine salts product in this subsection and is high yield for ADHD, narcolepsy, insomnia, appetite suppression, and abuse-potential counseling.",
    objective: .brandGeneric,
    relatedDrugIds: ["d212"],
    tags: ["amphetamine/dextroamphetamine", "Adderall", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_002",
    subsectionId: "4e",
    difficulty: .easy,
    question: "Amphetamine/dextroamphetamine is a CNS stimulant used for ADHD and narcolepsy, and it is remembered as mixed amphetamine salts with high abuse and diversion potential. Which brand name matches amphetamine/dextroamphetamine?",
    options: ["Adderall", "Strattera", "Focalin", "Vyvanse", "Ritalin/Concerta"],
    answer: "Adderall",
    explanation: "Amphetamine/dextroamphetamine is marketed as Adderall. On exam stems, think mixed amphetamine salts, Schedule II status, insomnia, decreased appetite, and tachycardia.",
    objective: .genericBrand,
    relatedDrugIds: ["d212"],
    tags: ["amphetamine/dextroamphetamine", "Adderall", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_003",
    subsectionId: "4e",
    difficulty: .easy,
    question: "A family asks about Strattera, a non-stimulant ADHD medication that is not a controlled substance and is classically associated with a suicidal-ideation boxed warning in younger patients. What is the generic name of Strattera?",
    options: ["Atomoxetine", "Guanfacine ER", "Lisdexamfetamine", "Methylphenidate", "Dexmethylphenidate"],
    answer: "Atomoxetine",
    explanation: "Strattera is the brand name for atomoxetine. Atomoxetine is the selective norepinephrine reuptake inhibitor in this subsection and is high yield for non-stimulant ADHD treatment.",
    objective: .brandGeneric,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "Strattera", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_004",
    subsectionId: "4e",
    difficulty: .easy,
    question: "Atomoxetine is a non-stimulant selective norepinephrine reuptake inhibitor used for ADHD, and it is especially high yield because it is not a controlled substance. Which brand name matches atomoxetine?",
    options: ["Strattera", "Intuniv", "Vyvanse", "Adderall", "Focalin"],
    answer: "Strattera",
    explanation: "Atomoxetine is marketed as Strattera. Pairing the brand with the non-stimulant and non-controlled-substance clues helps separate it from the stimulant ADHD drugs.",
    objective: .genericBrand,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "Strattera", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_005",
    subsectionId: "4e",
    difficulty: .easy,
    question: "A patient switched from methylphenidate to Focalin, a stimulant that represents the active d-isomer of methylphenidate and is often remembered as more potent milligram-for-milligram. What is the generic name of Focalin?",
    options: ["Dexmethylphenidate", "Methylphenidate", "Lisdexamfetamine", "Atomoxetine", "Amphetamine/dextroamphetamine"],
    answer: "Dexmethylphenidate",
    explanation: "Focalin is the brand name for dexmethylphenidate. Dexmethylphenidate is the d-isomer of methylphenidate and belongs to the methylphenidate family of stimulants.",
    objective: .brandGeneric,
    relatedDrugIds: ["d214"],
    tags: ["dexmethylphenidate", "Focalin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_006",
    subsectionId: "4e",
    difficulty: .easy,
    question: "Dexmethylphenidate is a methylphenidate-family stimulant used for ADHD and remembered as the d-isomer of methylphenidate. Which brand name matches dexmethylphenidate?",
    options: ["Focalin", "Ritalin/Concerta", "Adderall", "Intuniv", "Strattera"],
    answer: "Focalin",
    explanation: "Dexmethylphenidate is marketed as Focalin. A good way to remember it is that Focalin is the more targeted d-isomer cousin of methylphenidate.",
    objective: .genericBrand,
    relatedDrugIds: ["d214"],
    tags: ["dexmethylphenidate", "Focalin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_007",
    subsectionId: "4e",
    difficulty: .easy,
    question: "A child with ADHD is prescribed Intuniv, a non-stimulant often chosen when clinicians want an alpha-2 agonist that may also help with hyperactivity and impulsivity. What is the generic name of Intuniv?",
    options: ["Guanfacine ER", "Atomoxetine", "Methylphenidate", "Lisdexamfetamine", "Dexmethylphenidate"],
    answer: "Guanfacine ER",
    explanation: "Intuniv is the brand name for guanfacine ER. Guanfacine ER is the alpha-2 agonist in this subsection and is high yield for somnolence, hypotension, bradycardia, and tapering counseling.",
    objective: .brandGeneric,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "Intuniv", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_008",
    subsectionId: "4e",
    difficulty: .easy,
    question: "Guanfacine ER is a non-stimulant ADHD medication that works through alpha-2 agonism and is commonly associated with sedation and low blood pressure rather than insomnia and appetite loss. Which brand name matches guanfacine ER?",
    options: ["Intuniv", "Strattera", "Vyvanse", "Adderall", "Ritalin/Concerta"],
    answer: "Intuniv",
    explanation: "Guanfacine ER is marketed as Intuniv. The brand is worth knowing because Intuniv questions often hinge on somnolence, bradycardia, hypotension, and rebound hypertension if stopped abruptly.",
    objective: .genericBrand,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "Intuniv", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_009",
    subsectionId: "4e",
    difficulty: .easy,
    question: "An adult with ADHD and binge-eating disorder is prescribed Vyvanse, the stimulant that is remembered as a prodrug of dextroamphetamine. What is the generic name of Vyvanse?",
    options: ["Lisdexamfetamine", "Amphetamine/dextroamphetamine", "Methylphenidate", "Dexmethylphenidate", "Atomoxetine"],
    answer: "Lisdexamfetamine",
    explanation: "Vyvanse is the brand name for lisdexamfetamine. Lisdexamfetamine is the prodrug amphetamine in this subsection and is also high yield for binge-eating-disorder questions.",
    objective: .brandGeneric,
    relatedDrugIds: ["d216"],
    tags: ["lisdexamfetamine", "Vyvanse", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_010",
    subsectionId: "4e",
    difficulty: .easy,
    question: "Lisdexamfetamine is an amphetamine prodrug used for ADHD and also for moderate to severe binge-eating disorder in adults. Which brand name matches lisdexamfetamine?",
    options: ["Vyvanse", "Adderall", "Focalin", "Intuniv", "Strattera"],
    answer: "Vyvanse",
    explanation: "Lisdexamfetamine is marketed as Vyvanse. If a stem mentions a prodrug amphetamine or binge-eating-disorder use, Vyvanse should come to mind.",
    objective: .genericBrand,
    relatedDrugIds: ["d216"],
    tags: ["lisdexamfetamine", "Vyvanse", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_011",
    subsectionId: "4e",
    difficulty: .easy,
    question: "A student takes Ritalin for ADHD, and the care team explains that it belongs to the methylphenidate family of stimulants rather than the amphetamine family. What is the generic name of Ritalin?",
    options: ["Methylphenidate", "Dexmethylphenidate", "Amphetamine/dextroamphetamine", "Atomoxetine", "Guanfacine ER"],
    answer: "Methylphenidate",
    explanation: "Ritalin is a brand name for methylphenidate. Methylphenidate is one of the foundational ADHD stimulants and is also used in narcolepsy.",
    objective: .brandGeneric,
    relatedDrugIds: ["d217"],
    tags: ["methylphenidate", "Ritalin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_012",
    subsectionId: "4e",
    difficulty: .easy,
    question: "Methylphenidate is one of the most widely recognized ADHD stimulants and comes in many formulations, including well-known immediate-release and extended-release brands. Which brand choice best matches methylphenidate?",
    options: ["Ritalin/Concerta", "Focalin", "Adderall", "Intuniv", "Strattera"],
    answer: "Ritalin/Concerta",
    explanation: "Methylphenidate is associated with brands such as Ritalin and Concerta. That helps distinguish it from dexmethylphenidate (Focalin) and the amphetamine products.",
    objective: .genericBrand,
    relatedDrugIds: ["d217"],
    tags: ["methylphenidate", "Ritalin", "Concerta", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_013",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A patient wants an ADHD medication that is not a stimulant. Which option is the selective norepinephrine reuptake inhibitor in this subsection?",
    options: ["Atomoxetine", "Amphetamine/dextroamphetamine", "Dexmethylphenidate", "Lisdexamfetamine", "Methylphenidate"],
    answer: "Atomoxetine",
    explanation: "Atomoxetine is the selective norepinephrine reuptake inhibitor. The others listed here are stimulant options except guanfacine ER, which is an alpha-2 agonist rather than an NRI.",
    objective: .moa,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "NRI", "nonstimulant"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_014",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A child with ADHD needs a non-stimulant that works through central alpha-2 agonism and can be used alone or alongside a stimulant. Which medication best fits that description?",
    options: ["Guanfacine ER", "Atomoxetine", "Methylphenidate", "Lisdexamfetamine", "Amphetamine/dextroamphetamine"],
    answer: "Guanfacine ER",
    explanation: "Guanfacine ER is the alpha-2 agonist ADHD medication in this subsection. It stands apart from atomoxetine, which is an NRI, and from the stimulant drugs.",
    objective: .moa,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "alpha-2 agonist", "ADHD"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_015",
    subsectionId: "4e",
    difficulty: .medium,
    question: "Which ADHD medication is specifically remembered as a prodrug of dextroamphetamine rather than as an already active mixed amphetamine-salts product?",
    options: ["Lisdexamfetamine", "Amphetamine/dextroamphetamine", "Methylphenidate", "Atomoxetine", "Guanfacine ER"],
    answer: "Lisdexamfetamine",
    explanation: "Lisdexamfetamine is a prodrug of dextroamphetamine. Amphetamine/dextroamphetamine is the mixed amphetamine salts product instead.",
    objective: .pearl,
    relatedDrugIds: ["d216"],
    tags: ["lisdexamfetamine", "prodrug", "dextroamphetamine"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_016",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A pharmacology review asks which ADHD stimulant is the active d-isomer of methylphenidate and therefore a close cousin of Ritalin-class therapy. Which drug is it?",
    options: ["Dexmethylphenidate", "Methylphenidate", "Lisdexamfetamine", "Atomoxetine", "Guanfacine ER"],
    answer: "Dexmethylphenidate",
    explanation: "Dexmethylphenidate is the d-isomer of methylphenidate. That is the key pearl that separates Focalin from Ritalin/Concerta products.",
    objective: .pearl,
    relatedDrugIds: ["d214"],
    tags: ["dexmethylphenidate", "d-isomer", "methylphenidate"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_017",
    subsectionId: "4e",
    difficulty: .medium,
    question: "Which pair belongs to the methylphenidate family rather than the amphetamine family of ADHD stimulants?",
    options: ["Dexmethylphenidate and methylphenidate", "Lisdexamfetamine and atomoxetine", "Amphetamine/dextroamphetamine and guanfacine ER", "Atomoxetine and guanfacine ER", "Lisdexamfetamine and amphetamine/dextroamphetamine"],
    answer: "Dexmethylphenidate and methylphenidate",
    explanation: "Dexmethylphenidate and methylphenidate are the methylphenidate-family stimulants. Lisdexamfetamine and amphetamine/dextroamphetamine are amphetamine-based, while atomoxetine and guanfacine ER are non-stimulants.",
    objective: .classId,
    relatedDrugIds: ["d214", "d217"],
    tags: ["methylphenidate family", "dexmethylphenidate", "methylphenidate"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_018",
    subsectionId: "4e",
    difficulty: .medium,
    question: "An adult has both ADHD and moderate to severe binge-eating disorder. Which medication from this subsection is especially high yield because it is labeled for both of those situations?",
    options: ["Lisdexamfetamine", "Atomoxetine", "Guanfacine ER", "Dexmethylphenidate", "Methylphenidate"],
    answer: "Lisdexamfetamine",
    explanation: "Lisdexamfetamine is the standout answer because it is used for ADHD and also for moderate to severe binge-eating disorder in adults.",
    objective: .indication,
    relatedDrugIds: ["d216"],
    tags: ["lisdexamfetamine", "ADHD", "binge eating disorder"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_019",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A patient has ADHD plus narcolepsy, and the prescriber specifically chooses the classic mixed amphetamine salts product rather than a methylphenidate or non-stimulant option. Which medication fits that clue?",
    options: ["Amphetamine/dextroamphetamine", "Atomoxetine", "Guanfacine ER", "Dexmethylphenidate", "Lisdexamfetamine"],
    answer: "Amphetamine/dextroamphetamine",
    explanation: "Amphetamine/dextroamphetamine is the mixed amphetamine salts product used for ADHD and narcolepsy. The stem is meant to point to Adderall rather than to the methylphenidate products.",
    objective: .indication,
    relatedDrugIds: ["d212"],
    tags: ["amphetamine/dextroamphetamine", "ADHD", "narcolepsy"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_020",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A clinician wants to avoid a Schedule II stimulant because of diversion concern and chooses a non-stimulant medication that is not a controlled substance. Which drug best fits that goal?",
    options: ["Atomoxetine", "Amphetamine/dextroamphetamine", "Dexmethylphenidate", "Lisdexamfetamine", "Methylphenidate"],
    answer: "Atomoxetine",
    explanation: "Atomoxetine is not a controlled substance and is a classic non-stimulant ADHD option when misuse or diversion is a concern.",
    objective: .indication,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "non-controlled", "nonstimulant"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_021",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A child develops insomnia and appetite suppression on a stimulant, so the team considers a non-stimulant that may instead cause somnolence, hypotension, and bradycardia. Which medication best matches that profile?",
    options: ["Guanfacine ER", "Atomoxetine", "Lisdexamfetamine", "Amphetamine/dextroamphetamine", "Dexmethylphenidate"],
    answer: "Guanfacine ER",
    explanation: "Guanfacine ER is the best match. Its high-yield adverse-effect profile is sedation with low blood pressure and low heart rate, not the classic stimulant pattern of insomnia and appetite loss.",
    objective: .indication,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "somnolence", "hypotension"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_022",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A pediatric patient will likely remain on stimulant therapy for years. Which monitoring plan is most appropriate because these medications can suppress appetite, slow growth, and affect vital signs?",
    options: ["Track height, weight, appetite, blood pressure, and pulse over time", "Check only liver enzymes every week", "Monitor INR and vitamin K intake", "Follow TSH and free T4 only", "Check ANC before every refill"],
    answer: "Track height, weight, appetite, blood pressure, and pulse over time",
    explanation: "Long-term stimulant monitoring should include growth, appetite, blood pressure, and pulse. These are the high-yield safety and tolerability issues students are expected to remember.",
    objective: .monitoring,
    relatedDrugIds: ["d212", "d214", "d216", "d217"],
    tags: ["stimulants", "growth", "BP", "pulse", "appetite"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_023",
    subsectionId: "4e",
    difficulty: .medium,
    question: "Which ADHD medication in this subsection is the one most classically associated with a boxed warning for suicidal ideation in children and adolescents?",
    options: ["Atomoxetine", "Guanfacine ER", "Methylphenidate", "Lisdexamfetamine", "Amphetamine/dextroamphetamine"],
    answer: "Atomoxetine",
    explanation: "Atomoxetine carries the boxed warning for suicidal ideation in children and adolescents. That warning is a major point that separates it from the stimulants and from guanfacine ER.",
    objective: .contraindication,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "suicidal ideation", "boxed warning"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_024",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A parent is told to store an ADHD medicine in a locked place and never share it because misuse can lead to overdose and death. Which medication most directly fits that classic stimulant boxed-warning counseling point?",
    options: ["Amphetamine/dextroamphetamine", "Atomoxetine", "Guanfacine ER", "Clonazepam", "Hydroxyzine"],
    answer: "Amphetamine/dextroamphetamine",
    explanation: "Amphetamine/dextroamphetamine is a Schedule II stimulant with boxed-warning abuse, misuse, and addiction counseling. Secure storage and no sharing are core teaching points.",
    objective: .pearl,
    relatedDrugIds: ["d212"],
    tags: ["amphetamine/dextroamphetamine", "abuse", "misuse", "secure storage"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_025",
    subsectionId: "4e",
    difficulty: .hard,
    question: "A teenager on stimulant therapy reports painful, cold, pale fingers during the winter. Which high-yield stimulant-related warning term best explains this finding?",
    options: ["Peripheral vasculopathy including Raynaud's phenomenon", "Rebound hypertension", "Priapism", "Neutropenia", "QT prolongation"],
    answer: "Peripheral vasculopathy including Raynaud's phenomenon",
    explanation: "CNS stimulants used for ADHD are associated with peripheral vasculopathy, including Raynaud's phenomenon. Color change, numbness, or pain in the digits should make that warning come to mind.",
    objective: .adverseEffect,
    relatedDrugIds: ["d212", "d214", "d216", "d217"],
    tags: ["stimulants", "Raynaud", "peripheral vasculopathy"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_026",
    subsectionId: "4e",
    difficulty: .hard,
    question: "A family calls because a child taking a methylphenidate product has a prolonged, painful erection. Which urgent adverse effect should they recognize?",
    options: ["Priapism", "Tardive dyskinesia", "Rebound hypertension", "Serotonin syndrome", "Agranulocytosis"],
    answer: "Priapism",
    explanation: "Priapism is a high-yield warning associated with methylphenidate products. It is an emergency symptom that should never be ignored in counseling questions.",
    objective: .adverseEffect,
    relatedDrugIds: ["d217"],
    tags: ["methylphenidate", "priapism", "urgent adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_027",
    subsectionId: "4e",
    difficulty: .medium,
    question: "Which adverse-effect profile is most typical of guanfacine ER and helps distinguish it from the classic stimulant ADHD medications?",
    options: ["Somnolence, hypotension, and bradycardia", "Insomnia, appetite suppression, and tachycardia", "Jaundice, dark urine, and hepatitis", "Priapism and peripheral vasculopathy", "Tremor, diaphoresis, and serotonin syndrome"],
    answer: "Somnolence, hypotension, and bradycardia",
    explanation: "Guanfacine ER commonly causes sedation, low blood pressure, and low heart rate. That profile separates it from stimulant drugs, which more often cause insomnia, appetite loss, and tachycardia.",
    objective: .adverseEffect,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "somnolence", "hypotension", "bradycardia"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_028",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A caregiver abruptly stops Intuniv after several missed doses during a stomach bug. Which rebound problem is especially important to remember with guanfacine ER?",
    options: ["Rebound hypertension", "Severe neutropenia", "Ototoxicity", "Angioedema", "Torsades de pointes"],
    answer: "Rebound hypertension",
    explanation: "Abrupt discontinuation of guanfacine ER can cause rebound hypertension. That is why the drug should be tapered rather than stopped suddenly when possible.",
    objective: .adverseEffect,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "rebound hypertension", "abrupt discontinuation"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_029",
    subsectionId: "4e",
    difficulty: .hard,
    question: "Which ADHD medication should be swallowed whole and should not be taken with a high-fat meal because doing so can change drug exposure?",
    options: ["Guanfacine ER", "Atomoxetine", "Amphetamine/dextroamphetamine", "Methylphenidate", "Lisdexamfetamine"],
    answer: "Guanfacine ER",
    explanation: "Guanfacine ER should be swallowed whole and not administered with a high-fat meal. This is a useful administration pearl that helps separate it from the other ADHD agents.",
    objective: .dosing,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "administration", "high-fat meal"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_030",
    subsectionId: "4e",
    difficulty: .hard,
    question: "Which ADHD medication is not a stimulant but still requires blood pressure and pulse checks at baseline, after dose increases, and periodically because it can raise both?",
    options: ["Atomoxetine", "Guanfacine ER", "Methylphenidate", "Dexmethylphenidate", "Midazolam"],
    answer: "Atomoxetine",
    explanation: "Atomoxetine is not a stimulant, but it can still increase blood pressure and heart rate. Monitoring vital signs is therefore part of safe prescribing.",
    objective: .monitoring,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "blood pressure", "pulse", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_031",
    subsectionId: "4e",
    difficulty: .hard,
    question: "A patient on fluoxetine is started on Strattera. Which interaction principle is most important because it can increase atomoxetine exposure and may require dose adjustment?",
    options: ["Potent CYP2D6 inhibition can raise atomoxetine levels", "Potent CYP3A4 inhibition can lower atomoxetine levels", "Fluoxetine blocks renal excretion of guanfacine", "Fluoxetine reverses stimulant effects", "Fluoxetine prevents conversion of lisdexamfetamine to dextroamphetamine"],
    answer: "Potent CYP2D6 inhibition can raise atomoxetine levels",
    explanation: "Atomoxetine is primarily metabolized by CYP2D6. Potent CYP2D6 inhibitors such as fluoxetine or paroxetine can raise atomoxetine exposure and may require dose adjustment.",
    objective: .interaction,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "CYP2D6", "fluoxetine", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_032",
    subsectionId: "4e",
    difficulty: .hard,
    question: "A patient develops dark urine, jaundice, and right-upper-quadrant discomfort after starting a non-stimulant ADHD medication. Which agent is most associated with this rare but serious hepatic warning?",
    options: ["Atomoxetine", "Guanfacine ER", "Lisdexamfetamine", "Dexmethylphenidate", "Methylphenidate"],
    answer: "Atomoxetine",
    explanation: "Atomoxetine is the non-stimulant ADHD drug classically associated with a rare but serious liver-injury warning. Jaundice or dark urine should prompt urgent evaluation.",
    objective: .adverseEffect,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "liver injury", "jaundice"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_033",
    subsectionId: "4e",
    difficulty: .hard,
    question: "A patient is taking phenelzine, and the prescriber wants to avoid starting an ADHD medication during or within 14 days of MAOI therapy. Which prodrug stimulant most clearly fits that warning?",
    options: ["Lisdexamfetamine", "Guanfacine ER", "Atomoxetine", "Hydroxyzine", "Buspirone"],
    answer: "Lisdexamfetamine",
    explanation: "Lisdexamfetamine should not be started during or within 14 days of MAOI use. The stem also points to it by calling it the prodrug stimulant.",
    objective: .interaction,
    relatedDrugIds: ["d216"],
    tags: ["lisdexamfetamine", "MAOI", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_034",
    subsectionId: "4e",
    difficulty: .hard,
    question: "A patient with known hypertrophic cardiomyopathy asks which ADHD option is most concerning because stimulant therapy can increase heart rate and blood pressure and is avoided in serious cardiac disease. Which medication best matches that warning?",
    options: ["Amphetamine/dextroamphetamine", "Guanfacine ER", "Atomoxetine", "Hydroxyzine", "Trazodone"],
    answer: "Amphetamine/dextroamphetamine",
    explanation: "Amphetamine/dextroamphetamine is a stimulant and therefore carries the classic concern about use in patients with serious structural cardiac disease. The stem is built to make you think of Adderall's stimulant warnings.",
    objective: .contraindication,
    relatedDrugIds: ["d212"],
    tags: ["amphetamine/dextroamphetamine", "cardiac disease", "stimulant"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_035",
    subsectionId: "4e",
    difficulty: .hard,
    question: "A patient taking Vyvanse along with another serotonergic medicine develops agitation, tremor, fever, and diaphoresis. Which interaction-related emergency syndrome should come to mind?",
    options: ["Serotonin syndrome", "Priapism", "Rebound hypertension", "Agranulocytosis", "Neuroleptic malignant syndrome"],
    answer: "Serotonin syndrome",
    explanation: "Lisdexamfetamine can contribute to serotonin syndrome when combined with certain serotonergic medications. Agitation, tremor, fever, and sweating should trigger that recognition.",
    objective: .interaction,
    relatedDrugIds: ["d216"],
    tags: ["lisdexamfetamine", "serotonin syndrome", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_036",
    subsectionId: "4e",
    difficulty: .medium,
    question: "Which pair of ADHD medications is amphetamine-based rather than methylphenidate-based or non-stimulant?",
    options: ["Amphetamine/dextroamphetamine and lisdexamfetamine", "Dexmethylphenidate and methylphenidate", "Atomoxetine and guanfacine ER", "Atomoxetine and lisdexamfetamine", "Guanfacine ER and methylphenidate"],
    answer: "Amphetamine/dextroamphetamine and lisdexamfetamine",
    explanation: "Amphetamine/dextroamphetamine and lisdexamfetamine are the amphetamine-based ADHD medications in this subsection. Dexmethylphenidate and methylphenidate belong to the methylphenidate family instead.",
    objective: .classId,
    relatedDrugIds: ["d212", "d216"],
    tags: ["amphetamine family", "Adderall", "Vyvanse"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_037",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A prescriber wants a once-daily non-stimulant that can be used as adjunctive therapy to a stimulant, but also warns about sedation, dizziness, and low blood pressure. Which medication best fits?",
    options: ["Guanfacine ER", "Atomoxetine", "Methylphenidate", "Amphetamine/dextroamphetamine", "Dexmethylphenidate"],
    answer: "Guanfacine ER",
    explanation: "Guanfacine ER can be used as monotherapy or as adjunctive therapy to stimulant medication. The sedation and hypotension clues help separate it from atomoxetine.",
    objective: .indication,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "adjunctive therapy", "nonstimulant"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_038",
    subsectionId: "4e",
    difficulty: .medium,
    question: "Which statement correctly compares methylphenidate and dexmethylphenidate?",
    options: ["Dexmethylphenidate is the d-isomer of methylphenidate and is often considered more potent milligram-for-milligram", "Methylphenidate is a prodrug of dexmethylphenidate", "Both are alpha-2 agonists rather than stimulants", "Dexmethylphenidate is not used for ADHD", "Methylphenidate is not associated with growth monitoring"],
    answer: "Dexmethylphenidate is the d-isomer of methylphenidate and is often considered more potent milligram-for-milligram",
    explanation: "Dexmethylphenidate is the active d-isomer of methylphenidate. That is the key pharmacology pearl behind the Focalin vs Ritalin/Concerta distinction.",
    objective: .pearl,
    relatedDrugIds: ["d214", "d217"],
    tags: ["dexmethylphenidate", "methylphenidate", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_039",
    subsectionId: "4e",
    difficulty: .medium,
    question: "Which statement correctly compares atomoxetine with the Schedule II stimulants used for ADHD?",
    options: ["Atomoxetine is not a controlled substance and works as a selective norepinephrine reuptake inhibitor", "Atomoxetine is a mixed amphetamine salt", "Atomoxetine is an alpha-2 agonist that lowers blood pressure", "Atomoxetine is the active d-isomer of methylphenidate", "Atomoxetine is primarily used for binge-eating disorder"],
    answer: "Atomoxetine is not a controlled substance and works as a selective norepinephrine reuptake inhibitor",
    explanation: "Atomoxetine stands out because it is a non-controlled, non-stimulant selective norepinephrine reuptake inhibitor. That is why it is often contrasted directly with the stimulant options.",
    objective: .moa,
    relatedDrugIds: ["d213"],
    tags: ["atomoxetine", "non-controlled", "NRI"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_040",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A parent says, “Since Intuniv is just guanfacine, we can crush the tablet and switch it milligram-for-milligram with immediate-release guanfacine if needed.” Which response is most accurate?",
    options: ["That is incorrect because guanfacine ER should be swallowed whole and is not substituted milligram-for-milligram with immediate-release guanfacine", "That is correct because all guanfacine products are interchangeable", "That is correct as long as the dose is taken with a high-fat meal", "That is correct only when combined with atomoxetine", "That is correct if the child also takes lisdexamfetamine"],
    answer: "That is incorrect because guanfacine ER should be swallowed whole and is not substituted milligram-for-milligram with immediate-release guanfacine",
    explanation: "Guanfacine ER should be swallowed whole, and ER and IR guanfacine are not handled as simple milligram-for-milligram substitutions. That distinction matters for safe dosing.",
    objective: .dosing,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "do not crush", "ER vs IR"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_041",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A student starts Adderall and soon reports poor appetite, trouble sleeping, and a racing heart after afternoon dosing. Which adverse-effect cluster best matches this classic stimulant profile?",
    options: ["Insomnia, decreased appetite, and tachycardia", "Somnolence, bradycardia, and hypotension", "Jaundice, rash, and neutropenia", "Constipation, galactorrhea, and priapism", "Weight gain, edema, and hyperkalemia"],
    answer: "Insomnia, decreased appetite, and tachycardia",
    explanation: "Insomnia, appetite suppression, and tachycardia are classic stimulant adverse effects. The stem is designed to contrast Adderall with guanfacine ER, which more often causes sedation and low blood pressure.",
    objective: .adverseEffect,
    relatedDrugIds: ["d212"],
    tags: ["amphetamine/dextroamphetamine", "insomnia", "appetite", "tachycardia"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_042",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A child switched from stimulant therapy to Intuniv now seems sleepy in class and gets dizzy when standing quickly. Which adverse-effect cluster best fits guanfacine ER?",
    options: ["Somnolence, hypotension, and bradycardia", "Insomnia, appetite suppression, and tachycardia", "Peripheral vasculopathy and priapism", "Hepatitis and suicidal ideation", "Serotonin syndrome and hyperreflexia"],
    answer: "Somnolence, hypotension, and bradycardia",
    explanation: "Guanfacine ER commonly causes sedation, hypotension, and bradycardia. Orthostatic dizziness in a sleepy child should make Intuniv rise on the differential.",
    objective: .adverseEffect,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "orthostasis", "somnolence"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_043",
    subsectionId: "4e",
    difficulty: .medium,
    question: "A patient wants a once-daily stimulant but specifically likes the idea of a prodrug rather than immediate mixed amphetamine salts. Which choice best fits?",
    options: ["Lisdexamfetamine", "Amphetamine/dextroamphetamine", "Atomoxetine", "Guanfacine ER", "Methylphenidate"],
    answer: "Lisdexamfetamine",
    explanation: "Lisdexamfetamine is the prodrug stimulant. Amphetamine/dextroamphetamine is the mixed amphetamine salts product rather than the prodrug option.",
    objective: .pearl,
    relatedDrugIds: ["d216"],
    tags: ["lisdexamfetamine", "prodrug", "once daily"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_044",
    subsectionId: "4e",
    difficulty: .hard,
    question: "Which counseling point is most appropriate for a family picking up a stimulant such as Adderall, Vyvanse, or methylphenidate for the first time?",
    options: ["Store it securely, do not share it, and monitor appetite, growth, blood pressure, and pulse", "Stop it abruptly if a dose is missed for one day", "Take extra doses in the evening to improve sleep", "Combine freely with MAOIs because they work synergistically", "Use it to treat acute panic attacks when needed"],
    answer: "Store it securely, do not share it, and monitor appetite, growth, blood pressure, and pulse",
    explanation: "Stimulant counseling should include secure storage, no sharing, and monitoring for appetite loss, slowed growth, blood pressure changes, and pulse changes. These are core high-yield safety points.",
    objective: .monitoring,
    relatedDrugIds: ["d212", "d214", "d216", "d217"],
    tags: ["stimulants", "counseling", "secure storage", "growth"],
    source: .curated
),

.multipleChoice(
    id: "q4e_add_045",
    subsectionId: "4e",
    difficulty: .hard,
    question: "An adolescent with ADHD has a history of stimulant misuse, significant insomnia on prior stimulants, and mild baseline hypertension. Which option from this subsection is most reasonable to think of first because it is non-stimulant and may lower rather than raise heart rate and blood pressure?",
    options: ["Guanfacine ER", "Amphetamine/dextroamphetamine", "Lisdexamfetamine", "Methylphenidate", "Dexmethylphenidate"],
    answer: "Guanfacine ER",
    explanation: "Guanfacine ER is a reasonable first thought here because it is non-stimulant and tends toward somnolence, lower blood pressure, and lower heart rate rather than the classic stimulant pattern of insomnia and tachycardia.",
    objective: .mixedReview,
    relatedDrugIds: ["d215"],
    tags: ["guanfacine ER", "clinical selection", "nonstimulant"],
    source: .curated
)
    ]
}
