// PharmaLingo — Module 4b (Antidepressants II + Mood Stabilizers)
// Curated Add-On Question Pack (45 questions)
// IDs: q4b_add_001 ... q4b_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 4b exists, then append:
//
//    if bank["4b"] == nil { bank["4b"] = [] }
//    bank["4b"]?.append(contentsOf: Self.curatedAddOnQuestions_4b)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d201 (Amitriptyline), d202 (Bupropion),
//   d203 (Buspirone), d204 (Citalopram), d205 (Clonazepam), d206 (Desvenlafaxine),
//   d207 (Doxepin), d208 (Hydroxyzine), d92 (Lithium), d209 (Mirtazapine),
//   d210 (Nortriptyline), d211 (Trazodone).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_4b: [Question] = [
.multipleChoice(
    id: "q4b_add_001",
    subsectionId: "4b",
    difficulty: .easy,
    question: "A patient with neuropathic pain and poor sleep is started on Elavil, an older tricyclic antidepressant that is also remembered for strong anticholinergic effects. What is the generic name of Elavil?",
    options: ["Amitriptyline", "Nortriptyline", "Doxepin", "Trazodone", "Bupropion"],
    answer: "Amitriptyline",
    explanation: "Elavil is the brand name for amitriptyline. Amitriptyline is a classic TCA that is high yield for sedation, anticholinergic effects, neuropathic pain, and migraine prevention.",
    objective: .brandGeneric,
    relatedDrugIds: ["d201"],
    tags: ["amitriptyline", "Elavil", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_002",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Amitriptyline is a tricyclic antidepressant often remembered for sedation, dry mouth, constipation, and use in neuropathic pain or migraine prevention. Which brand name matches amitriptyline?",
    options: ["Elavil", "Pamelor", "Desyrel", "Remeron", "Celexa"],
    answer: "Elavil",
    explanation: "Amitriptyline is marketed as Elavil. Pairing the brand with the anticholinergic and pain-use pearls makes this easier to retain.",
    objective: .genericBrand,
    relatedDrugIds: ["d201"],
    tags: ["amitriptyline", "Elavil", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_003",
    subsectionId: "4b",
    difficulty: .easy,
    question: "A patient who wants depression treatment but also hopes to quit smoking is started on Wellbutrin, a medication that is notable for having little sexual dysfunction compared with many serotonergic antidepressants. What is the generic name of Wellbutrin?",
    options: ["Bupropion", "Buspirone", "Mirtazapine", "Desvenlafaxine", "Trazodone"],
    answer: "Bupropion",
    explanation: "Wellbutrin is the brand name for bupropion. The smoking-cessation pearl also helps you remember its alternate brand, Zyban.",
    objective: .brandGeneric,
    relatedDrugIds: ["d202"],
    tags: ["bupropion", "Wellbutrin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_004",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Bupropion is an NDRI used for depression and smoking cessation, and students often remember it because it tends to cause less sexual dysfunction than SSRIs or SNRIs. Which brand name matches bupropion?",
    options: ["Wellbutrin/Zyban", "BuSpar", "Pristiq", "Remeron", "Desyrel"],
    answer: "Wellbutrin/Zyban",
    explanation: "Bupropion is marketed as Wellbutrin for depression and Zyban for smoking cessation. That brand pair is worth knowing both ways.",
    objective: .genericBrand,
    relatedDrugIds: ["d202"],
    tags: ["bupropion", "Wellbutrin", "Zyban", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_005",
    subsectionId: "4b",
    difficulty: .easy,
    question: "BuSpar is prescribed for generalized anxiety disorder in a patient who wants to avoid a benzodiazepine. What is the generic name of BuSpar?",
    options: ["Buspirone", "Clonazepam", "Hydroxyzine", "Citalopram", "Trazodone"],
    answer: "Buspirone",
    explanation: "BuSpar is the brand name for buspirone. It is a useful high-yield pair because buspirone is anxiolytic but not a benzodiazepine.",
    objective: .brandGeneric,
    relatedDrugIds: ["d203"],
    tags: ["buspirone", "BuSpar", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_006",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Buspirone is a non-benzodiazepine anxiolytic used for generalized anxiety and is especially high yield because it is not habit-forming and does not work immediately. Which brand name matches buspirone?",
    options: ["BuSpar", "Celexa", "Klonopin", "Vistaril/Atarax", "Desyrel"],
    answer: "BuSpar",
    explanation: "Buspirone is marketed as BuSpar. Remembering its delayed onset and lack of dependence helps distinguish it from benzodiazepines like clonazepam.",
    objective: .genericBrand,
    relatedDrugIds: ["d203"],
    tags: ["buspirone", "BuSpar", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_007",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Celexa is an SSRI used for major depressive disorder, and it is especially high yield because dose-related QT prolongation limits how far it should be pushed. What is the generic name of Celexa?",
    options: ["Citalopram", "Escitalopram", "Sertraline", "Desvenlafaxine", "Paroxetine"],
    answer: "Citalopram",
    explanation: "Celexa is the brand name for citalopram. The QT-prolongation pearl is one of the most testable facts about citalopram.",
    objective: .brandGeneric,
    relatedDrugIds: ["d204"],
    tags: ["citalopram", "Celexa", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_008",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Citalopram is an SSRI used for depression and is remembered for dose-related QT prolongation and dose limits in older adults. Which brand name matches citalopram?",
    options: ["Celexa", "Lexapro", "Pristiq", "Paxil", "Zoloft"],
    answer: "Celexa",
    explanation: "Citalopram is marketed as Celexa. Do not confuse it with escitalopram, which is Lexapro.",
    objective: .genericBrand,
    relatedDrugIds: ["d204"],
    tags: ["citalopram", "Celexa", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_009",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Klonopin is chosen for a patient with panic disorder who also has a seizure history, because it is a long-acting benzodiazepine. What is the generic name of Klonopin?",
    options: ["Clonazepam", "Alprazolam", "Diazepam", "Buspirone", "Hydroxyzine"],
    answer: "Clonazepam",
    explanation: "Klonopin is the brand name for clonazepam. The combination of panic-disorder use plus anticonvulsant activity is a classic clue.",
    objective: .brandGeneric,
    relatedDrugIds: ["d205"],
    tags: ["clonazepam", "Klonopin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_010",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Clonazepam is a long-acting benzodiazepine used for panic disorder and some seizure disorders. Which brand name matches clonazepam?",
    options: ["Klonopin", "Xanax", "Valium", "Ativan", "BuSpar"],
    answer: "Klonopin",
    explanation: "Clonazepam is marketed as Klonopin. Its long duration helps separate it from shorter-acting agents such as alprazolam.",
    objective: .genericBrand,
    relatedDrugIds: ["d205"],
    tags: ["clonazepam", "Klonopin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_011",
    subsectionId: "4b",
    difficulty: .easy,
    question: "A patient is started on Pristiq, an SNRI that is the active metabolite of venlafaxine and is commonly used at a fixed 50 mg dose. What is the generic name of Pristiq?",
    options: ["Desvenlafaxine", "Venlafaxine", "Duloxetine", "Citalopram", "Bupropion"],
    answer: "Desvenlafaxine",
    explanation: "Pristiq is the brand name for desvenlafaxine. The venlafaxine-metabolite pearl is one of the easiest ways to remember it.",
    objective: .brandGeneric,
    relatedDrugIds: ["d206"],
    tags: ["desvenlafaxine", "Pristiq", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_012",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Desvenlafaxine is an SNRI used for major depressive disorder and is especially high yield because it is essentially the active metabolite of venlafaxine. Which brand name matches desvenlafaxine?",
    options: ["Pristiq", "Effexor XR", "Cymbalta", "Celexa", "Prozac"],
    answer: "Pristiq",
    explanation: "Desvenlafaxine is marketed as Pristiq. Avoid mixing it up with venlafaxine, which is Effexor XR.",
    objective: .genericBrand,
    relatedDrugIds: ["d206"],
    tags: ["desvenlafaxine", "Pristiq", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_013",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Silenor is prescribed at very low dose for sleep-maintenance insomnia, even though its generic drug also belongs to the tricyclic antidepressant class. What is the generic name of Silenor?",
    options: ["Doxepin", "Trazodone", "Nortriptyline", "Amitriptyline", "Mirtazapine"],
    answer: "Doxepin",
    explanation: "Silenor is the low-dose insomnia brand of doxepin. Remember that doxepin can appear on exams both as a TCA and as an insomnia medication.",
    objective: .brandGeneric,
    relatedDrugIds: ["d207"],
    tags: ["doxepin", "Silenor", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_014",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Doxepin is a very sedating tricyclic antidepressant that can also be used at low dose for insomnia. Which brand name matches doxepin?",
    options: ["Sinequan/Silenor", "Pamelor", "Elavil", "Remeron", "Desyrel"],
    answer: "Sinequan/Silenor",
    explanation: "Doxepin is associated with the brand names Sinequan and Silenor. Silenor is the memorable low-dose insomnia product.",
    objective: .genericBrand,
    relatedDrugIds: ["d207"],
    tags: ["doxepin", "Sinequan", "Silenor", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_015",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Vistaril is given to a patient with anxiety and itching who wants to avoid habit-forming medications. What is the generic name of Vistaril?",
    options: ["Hydroxyzine", "Buspirone", "Clonazepam", "Mirtazapine", "Trazodone"],
    answer: "Hydroxyzine",
    explanation: "Vistaril is a brand name for hydroxyzine. Hydroxyzine is an antihistamine with anxiolytic and antipruritic uses.",
    objective: .brandGeneric,
    relatedDrugIds: ["d208"],
    tags: ["hydroxyzine", "Vistaril", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_016",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Hydroxyzine is an antihistamine often used short term for anxiety, itching, or sleep because it is sedating and not habit-forming. Which brand name matches hydroxyzine?",
    options: ["Vistaril/Atarax", "BuSpar", "Klonopin", "Remeron", "Celexa"],
    answer: "Vistaril/Atarax",
    explanation: "Hydroxyzine is sold as Vistaril and Atarax. Knowing both brands helps because different clinicians may use either name.",
    objective: .genericBrand,
    relatedDrugIds: ["d208"],
    tags: ["hydroxyzine", "Vistaril", "Atarax", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_017",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Lithobid is started for bipolar disorder in a patient who will need close lab monitoring because the medication has a narrow therapeutic index. What is the generic name of Lithobid?",
    options: ["Lithium", "Bupropion", "Nortriptyline", "Desvenlafaxine", "Mirtazapine"],
    answer: "Lithium",
    explanation: "Lithobid is the brand name for lithium. This is a must-know pair because lithium is one of the most testable drugs in the entire psych module.",
    objective: .brandGeneric,
    relatedDrugIds: ["d92"],
    tags: ["lithium", "Lithobid", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_018",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Lithium is a classic mood stabilizer used for bipolar disorder and is famous for its narrow therapeutic index and need for serum-level monitoring. Which brand name matches lithium?",
    options: ["Lithobid", "Remeron", "Klonopin", "Pamelor", "Zyban"],
    answer: "Lithobid",
    explanation: "Lithium is marketed as Lithobid. It is worth knowing cold because many later counseling and monitoring questions build on that recognition.",
    objective: .genericBrand,
    relatedDrugIds: ["d92"],
    tags: ["lithium", "Lithobid", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_019",
    subsectionId: "4b",
    difficulty: .easy,
    question: "A depressed patient with insomnia and low appetite is started on Remeron, an atypical antidepressant that often causes sedation and weight gain. What is the generic name of Remeron?",
    options: ["Mirtazapine", "Trazodone", "Bupropion", "Nortriptyline", "Doxepin"],
    answer: "Mirtazapine",
    explanation: "Remeron is the brand name for mirtazapine. The appetite-and-sleep clue is one of the easiest ways to remember this pairing.",
    objective: .brandGeneric,
    relatedDrugIds: ["d209"],
    tags: ["mirtazapine", "Remeron", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_020",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Mirtazapine is an atypical antidepressant often chosen when depression comes with insomnia, poor appetite, or weight loss. Which brand name matches mirtazapine?",
    options: ["Remeron", "Desyrel", "Wellbutrin/Zyban", "Sinequan/Silenor", "Celexa"],
    answer: "Remeron",
    explanation: "Mirtazapine is marketed as Remeron. The 'sleep and snacks' pearl helps anchor this brand-generic pair.",
    objective: .genericBrand,
    relatedDrugIds: ["d209"],
    tags: ["mirtazapine", "Remeron", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_021",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Pamelor is used in some patients for depression or neuropathic pain and is often remembered as a somewhat 'cleaner' tricyclic than amitriptyline. What is the generic name of Pamelor?",
    options: ["Nortriptyline", "Amitriptyline", "Doxepin", "Trazodone", "Bupropion"],
    answer: "Nortriptyline",
    explanation: "Pamelor is the brand name for nortriptyline. It is often contrasted with amitriptyline because it tends to be a bit less anticholinergic.",
    objective: .brandGeneric,
    relatedDrugIds: ["d210"],
    tags: ["nortriptyline", "Pamelor", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_022",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Nortriptyline is a tricyclic antidepressant that is somewhat less anticholinergic than amitriptyline and can also be used for neuropathic pain. Which brand name matches nortriptyline?",
    options: ["Pamelor", "Elavil", "Sinequan/Silenor", "Desyrel", "BuSpar"],
    answer: "Pamelor",
    explanation: "Nortriptyline is marketed as Pamelor. This is a good pair to know because exams often compare it with amitriptyline.",
    objective: .genericBrand,
    relatedDrugIds: ["d210"],
    tags: ["nortriptyline", "Pamelor", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_023",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Desyrel is prescribed at bedtime in a patient who needs an antidepressant but is most likely to use the medication as a sleep aid because of its sedation. What is the generic name of Desyrel?",
    options: ["Trazodone", "Mirtazapine", "Doxepin", "Citalopram", "Bupropion"],
    answer: "Trazodone",
    explanation: "Desyrel is the brand name for trazodone. Trazodone is one of the most commonly recognized low-dose sleep aids in clinical practice.",
    objective: .brandGeneric,
    relatedDrugIds: ["d211"],
    tags: ["trazodone", "Desyrel", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_024",
    subsectionId: "4b",
    difficulty: .easy,
    question: "Trazodone is an antidepressant that is more commonly remembered as a low-dose bedtime medication for insomnia, with rare but serious priapism as a classic board-style pearl. Which brand name matches trazodone?",
    options: ["Desyrel", "Remeron", "Elavil", "Pristiq", "Klonopin"],
    answer: "Desyrel",
    explanation: "Trazodone is marketed as Desyrel. Pairing the brand with the sleep-aid and priapism pearls is high yield.",
    objective: .genericBrand,
    relatedDrugIds: ["d211"],
    tags: ["trazodone", "Desyrel", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_025",
    subsectionId: "4b",
    difficulty: .medium,
    question: "A patient wants an antidepressant that is less likely than SSRIs or SNRIs to cause sexual dysfunction and also likes the idea that the same drug has a smoking-cessation brand. Which 4b medication best fits?",
    options: ["Bupropion", "Mirtazapine", "Trazodone", "Citalopram", "Desvenlafaxine"],
    answer: "Bupropion",
    explanation: "Bupropion is the standout choice here. It is an NDRI, is often remembered for minimal sexual side effects relative to many serotonergic agents, and is also sold as Zyban for smoking cessation.",
    objective: .pearl,
    relatedDrugIds: ["d202"],
    tags: ["bupropion", "sexual dysfunction", "smoking cessation"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_026",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Because it lowers seizure threshold, which medication from 4b is especially important to avoid in a patient with a seizure disorder or a history of bulimia nervosa?",
    options: ["Bupropion", "Buspirone", "Hydroxyzine", "Mirtazapine", "Trazodone"],
    answer: "Bupropion",
    explanation: "Bupropion is contraindicated in seizure disorders and in patients with current or prior bulimia or anorexia because seizure risk is increased.",
    objective: .contraindication,
    relatedDrugIds: ["d202"],
    tags: ["bupropion", "seizure", "bulimia"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_027",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which 4b agent works mainly as a 5-HT1A partial agonist rather than by blocking serotonin or norepinephrine reuptake?",
    options: ["Buspirone", "Citalopram", "Desvenlafaxine", "Bupropion", "Clonazepam"],
    answer: "Buspirone",
    explanation: "Buspirone is a 5-HT1A partial agonist. That mechanism is a major reason it feels different from SSRIs, SNRIs, benzodiazepines, and antihistamines.",
    objective: .moa,
    relatedDrugIds: ["d203"],
    tags: ["buspirone", "5-HT1A", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_028",
    subsectionId: "4b",
    difficulty: .medium,
    question: "A patient asks for a medicine for generalized anxiety that is non-sedating, non-addictive, and not a controlled substance, but the prescriber explains that it will not work right away and should not be used as a PRN panic pill. Which drug is being described?",
    options: ["Buspirone", "Clonazepam", "Hydroxyzine", "Trazodone", "Amitriptyline"],
    answer: "Buspirone",
    explanation: "Buspirone is the classic delayed-onset anxiolytic. It is useful for chronic anxiety, but it does not give the immediate relief that clonazepam or hydroxyzine may provide.",
    objective: .dosing,
    relatedDrugIds: ["d203"],
    tags: ["buspirone", "delayed onset", "GAD"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_029",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which antidepressant in 4b is the SSRI most strongly associated with dose-related QT prolongation, making dose limits and ECG awareness especially high yield?",
    options: ["Citalopram", "Desvenlafaxine", "Bupropion", "Mirtazapine", "Trazodone"],
    answer: "Citalopram",
    explanation: "Citalopram is the key 4b antidepressant linked to dose-related QT prolongation. That is why learners often memorize its dose limits and use extra caution in older adults or higher-risk patients.",
    objective: .adverseEffect,
    relatedDrugIds: ["d204"],
    tags: ["citalopram", "QT prolongation", "SSRI"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_030",
    subsectionId: "4b",
    difficulty: .medium,
    question: "A patient with panic disorder is given a long-acting benzodiazepine that enhances GABA-A signaling and may also be used for seizure disorders. Which 4b medication is this?",
    options: ["Clonazepam", "Buspirone", "Hydroxyzine", "Citalopram", "Lithium"],
    answer: "Clonazepam",
    explanation: "Clonazepam is a long-acting benzodiazepine and works by enhancing GABA-A receptor activity. It is used for panic disorder and also has anticonvulsant indications.",
    objective: .moa,
    relatedDrugIds: ["d205"],
    tags: ["clonazepam", "benzodiazepine", "GABA-A"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_031",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which counseling point is most important when a patient starts clonazepam for panic symptoms?",
    options: ["It can be stopped abruptly after daily use without any problem.", "It works best only as a once-weekly rescue medication.", "Combining it with alcohol or opioid pain medicines can dangerously increase CNS and respiratory depression.", "It usually improves energy and concentration like a stimulant.", "It is non-habit-forming and has no withdrawal risk."],
    answer: "Combining it with alcohol or opioid pain medicines can dangerously increase CNS and respiratory depression.",
    explanation: "Clonazepam is a benzodiazepine, so additive sedation with alcohol or opioids is a major safety issue. It also should not be stopped abruptly after regular long-term use.",
    objective: .interaction,
    relatedDrugIds: ["d205"],
    tags: ["clonazepam", "opioids", "alcohol"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_032",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which 4b antidepressant is best recognized as the active metabolite of venlafaxine and still belongs to the SNRI class, so blood pressure monitoring remains a practical pearl?",
    options: ["Desvenlafaxine", "Citalopram", "Bupropion", "Mirtazapine", "Buspirone"],
    answer: "Desvenlafaxine",
    explanation: "Desvenlafaxine is the active metabolite of venlafaxine. Because it is an SNRI, blood pressure and discontinuation symptoms still matter clinically.",
    objective: .classId,
    relatedDrugIds: ["d206"],
    tags: ["desvenlafaxine", "SNRI", "venlafaxine metabolite"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_033",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which 4b medication is a very sedating TCA that also appears in practice as low-dose Silenor for sleep-maintenance insomnia?",
    options: ["Doxepin", "Nortriptyline", "Bupropion", "Buspirone", "Desvenlafaxine"],
    answer: "Doxepin",
    explanation: "Doxepin is the answer. It is a TCA, but low-dose doxepin is also a classic sleep medication pearl under the Silenor brand.",
    objective: .indication,
    relatedDrugIds: ["d207"],
    tags: ["doxepin", "insomnia", "Silenor"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_034",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which medication from 4b can help both anxiety and pruritus, often starts working faster than buspirone, and is not a benzodiazepine or controlled substance?",
    options: ["Hydroxyzine", "Clonazepam", "Citalopram", "Bupropion", "Lithium"],
    answer: "Hydroxyzine",
    explanation: "Hydroxyzine is an antihistamine used for anxiety and itching. It is often used because it can be sedating and relatively fast acting, without the dependence concerns of benzodiazepines.",
    objective: .indication,
    relatedDrugIds: ["d208"],
    tags: ["hydroxyzine", "anxiety", "pruritus"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_035",
    subsectionId: "4b",
    difficulty: .hard,
    question: "A stable patient on lithium begins taking ibuprofen several times a day for back pain. What is the most important medication-related concern?",
    options: ["Lithium levels may rise, increasing the risk of toxicity.", "Lithium will become ineffective because ibuprofen blocks its absorption.", "The combination predictably causes serotonin syndrome.", "Ibuprofen directly lowers lithium levels and can trigger mania.", "The main concern is severe QT prolongation from the combination."],
    answer: "Lithium levels may rise, increasing the risk of toxicity.",
    explanation: "NSAIDs can increase lithium concentrations. This is a classic interaction to remember along with ACE inhibitors and thiazide diuretics.",
    objective: .interaction,
    relatedDrugIds: ["d92"],
    tags: ["lithium", "NSAIDs", "toxicity"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_036",
    subsectionId: "4b",
    difficulty: .hard,
    question: "Which monitoring plan is most appropriate for a patient who has been started on long-term lithium therapy?",
    options: ["Serum lithium level plus renal and thyroid function", "Weekly CBC with differential only", "INR and aPTT every month", "Troponin and CK after each dose change", "Liver enzymes and ANC only"],
    answer: "Serum lithium level plus renal and thyroid function",
    explanation: "Lithium has a narrow therapeutic index, so serum drug levels matter. Renal and thyroid monitoring are also core long-term safety checks.",
    objective: .monitoring,
    relatedDrugIds: ["d92"],
    tags: ["lithium", "monitoring", "renal", "thyroid"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_037",
    subsectionId: "4b",
    difficulty: .hard,
    question: "A patient taking lithium becomes dehydrated from gastroenteritis and then develops worsening tremor, vomiting, ataxia, and confusion. Which explanation is most likely?",
    options: ["Lithium toxicity", "Serotonin syndrome", "Benzodiazepine withdrawal", "Antidepressant discontinuation syndrome", "Acute hydroxyzine allergy"],
    answer: "Lithium toxicity",
    explanation: "Dehydration can raise lithium concentrations and precipitate toxicity. Coarse tremor, GI upset, ataxia, and confusion are classic warning signs.",
    objective: .adverseEffect,
    relatedDrugIds: ["d92"],
    tags: ["lithium", "toxicity", "dehydration"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_038",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which antidepressant in 4b is especially helpful to remember when depression comes with insomnia, poor appetite, or weight loss because it tends to be sedating and increase appetite?",
    options: ["Mirtazapine", "Bupropion", "Citalopram", "Buspirone", "Desvenlafaxine"],
    answer: "Mirtazapine",
    explanation: "Mirtazapine is the classic answer when the depressed patient cannot sleep and is losing weight. Its tendency toward sedation and appetite stimulation becomes useful in the right patient.",
    objective: .indication,
    relatedDrugIds: ["d209"],
    tags: ["mirtazapine", "insomnia", "appetite"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_039",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which medication is commonly used off-label at low bedtime doses as a sleep aid, but patients should still be warned about orthostatic hypotension and rare priapism?",
    options: ["Trazodone", "Mirtazapine", "Bupropion", "Citalopram", "Clonazepam"],
    answer: "Trazodone",
    explanation: "Trazodone is commonly used as a sleep aid at low doses. Priapism is rare but serious, and orthostatic hypotension is another classic counseling pearl.",
    objective: .adverseEffect,
    relatedDrugIds: ["d211"],
    tags: ["trazodone", "priapism", "orthostasis"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_040",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Among the tricyclic antidepressants in 4b, which drug is especially high yield as the more anticholinergic and more sedating option that is also used for neuropathic pain and migraine prevention?",
    options: ["Amitriptyline", "Nortriptyline", "Doxepin", "Citalopram", "Trazodone"],
    answer: "Amitriptyline",
    explanation: "Amitriptyline is the TCA most students remember as the more anticholinergic, more sedating choice. It also shows up frequently in questions on neuropathic pain and migraine prophylaxis.",
    objective: .adverseEffect,
    relatedDrugIds: ["d201"],
    tags: ["amitriptyline", "TCA", "anticholinergic"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_041",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which TCA is often remembered as the somewhat 'cleaner' cousin of amitriptyline because it tends to be a bit less anticholinergic and can be followed with therapeutic drug monitoring?",
    options: ["Nortriptyline", "Amitriptyline", "Doxepin", "Bupropion", "Trazodone"],
    answer: "Nortriptyline",
    explanation: "Nortriptyline is often contrasted with amitriptyline as the somewhat less anticholinergic TCA. That comparison is a classic way to keep the two straight.",
    objective: .pearl,
    relatedDrugIds: ["d210", "d201"],
    tags: ["nortriptyline", "amitriptyline", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_042",
    subsectionId: "4b",
    difficulty: .hard,
    question: "A patient is brought in after an overdose with confusion, flushed skin, dry mouth, urinary retention, tachycardia, and a widened QRS on ECG. Which 4b medication is the most likely culprit?",
    options: ["Amitriptyline", "Buspirone", "Mirtazapine", "Hydroxyzine", "Lithium"],
    answer: "Amitriptyline",
    explanation: "This is a classic TCA overdose presentation, and amitriptyline is the highest-yield answer. TCAs can produce anticholinergic toxicity and dangerous cardiac conduction abnormalities.",
    objective: .adverseEffect,
    relatedDrugIds: ["d201"],
    tags: ["amitriptyline", "overdose", "QRS"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_043",
    subsectionId: "4b",
    difficulty: .hard,
    question: "Low-dose doxepin for insomnia is a poor choice in a patient with untreated narrow-angle glaucoma or severe urinary retention because of what high-yield property?",
    options: ["Its anticholinergic effects", "Its irreversible MAOI activity", "Its strong dopamine blockade", "Its platelet inhibition", "Its factor Xa inhibition"],
    answer: "Its anticholinergic effects",
    explanation: "Doxepin is a tricyclic antidepressant, so anticholinergic effects still matter even when learners first meet it as a sleep medication. That is why glaucoma and urinary retention are important cautions.",
    objective: .contraindication,
    relatedDrugIds: ["d207"],
    tags: ["doxepin", "anticholinergic", "glaucoma"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_044",
    subsectionId: "4b",
    difficulty: .medium,
    question: "Which 4b antidepressant is an SNRI that can produce bothersome discontinuation symptoms if stopped abruptly, making gradual tapering a practical counseling pearl?",
    options: ["Desvenlafaxine", "Bupropion", "Mirtazapine", "Trazodone", "Buspirone"],
    answer: "Desvenlafaxine",
    explanation: "Desvenlafaxine is an SNRI, and like venlafaxine it is worth remembering for discontinuation symptoms if it is stopped suddenly.",
    objective: .adverseEffect,
    relatedDrugIds: ["d206"],
    tags: ["desvenlafaxine", "SNRI", "discontinuation"],
    source: .curated
),

.multipleChoice(
    id: "q4b_add_045",
    subsectionId: "4b",
    difficulty: .hard,
    question: "Which 4b medication requires especially careful pregnancy counseling because it is teratogenic and also needs serum-level monitoring due to a narrow therapeutic index?",
    options: ["Lithium", "Citalopram", "Trazodone", "Buspirone", "Hydroxyzine"],
    answer: "Lithium",
    explanation: "Lithium is the mood stabilizer here with a narrow therapeutic index and important pregnancy counseling. It is one of the most testable psych drugs for both monitoring and safety.",
    objective: .contraindication,
    relatedDrugIds: ["d92"],
    tags: ["lithium", "pregnancy", "monitoring"],
    source: .curated
)
    ]
}
