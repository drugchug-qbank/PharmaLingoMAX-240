// PharmaLingo — Mastering CNS & Psych
// Curated Add-On Question Pack (45 questions)
// IDs: q4f_add_001 ... q4f_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 4f is a mastery/review-only subsection in the current repo and the vNext outline.
// - These questions should be appended AFTER the app auto-builds the mastery pool in DrugDataService.init().
// - This pack is designed to mirror the integration pattern used for previous mastery sections.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) In DrugDataService.init(), inside the mastery-generation loop:
//        for sub in mod.subsections where sub.isMasteryQuiz { ... }
//    immediately after:
//        bank[sub.id] = mastery
//    append:
//        if sub.id == Self.masteringCnsPsychSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_4fMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 4a–4e with a few prior-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 4 mastery quiz.
    static let masteringCnsPsychSubsectionId: String = "4f"

    static let curatedAddOnQuestions_4fMastery: [Question] = [

        .multipleChoice(
            id: "q4f_add_001",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient with major depressive disorder also has diabetic peripheral neuropathic pain from earlier endocrine modules. Which antidepressant from this module best teaches the idea that one drug can help both mood symptoms and neuropathic pain?",
            options: ["Duloxetine", "Escitalopram", "Bupropion", "Quetiapine", "Trazodone"],
            answer: "Duloxetine",
            explanation: "Duloxetine is an SNRI that treats major depressive disorder and is also high yield for diabetic peripheral neuropathic pain and fibromyalgia.",
            objective: .indication,
            relatedDrugIds: ["d79", "d45"],
            tags: ["Mastery", "4f", "Duloxetine", "Neuropathic pain"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_002",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A resident is planning a switch from an SSRI to an MAOI and is worried about washout time. Which SSRI is the outlier because its long half-life means the washout must be much longer than with the others?",
            options: ["Fluoxetine", "Sertraline", "Paroxetine", "Escitalopram", "Citalopram"],
            answer: "Fluoxetine",
            explanation: "Fluoxetine has the longest half-life among the SSRIs in this module, so its washout before an MAOI is longer than for the others.",
            objective: .pearl,
            relatedDrugIds: ["d75"],
            tags: ["Mastery", "4f", "Fluoxetine", "Washout"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_003",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient stopped an SSRI abruptly and developed dizziness, irritability, and 'electric shock' sensations. Which SSRI is most classically remembered for withdrawal symptoms, weight gain, and anticholinergic burden?",
            options: ["Paroxetine", "Sertraline", "Fluoxetine", "Escitalopram", "Duloxetine"],
            answer: "Paroxetine",
            explanation: "Paroxetine is high yield for bothersome discontinuation symptoms, more sedation and weight gain, and more anticholinergic effects than most other SSRIs.",
            objective: .adverseEffect,
            relatedDrugIds: ["d77"],
            tags: ["Mastery", "4f", "Paroxetine", "Withdrawal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_004",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "For a patient with depression after myocardial infarction, learners often remember one SSRI in this bank as the classic 'cardiac-friendly' choice. Which drug is that?",
            options: ["Sertraline", "Citalopram", "Paroxetine", "Bupropion", "Trazodone"],
            answer: "Sertraline",
            explanation: "Sertraline is commonly remembered as the SSRI most often favored in cardiac patients.",
            objective: .pearl,
            relatedDrugIds: ["d74"],
            tags: ["Mastery", "4f", "Sertraline", "Cardiac patients"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_005",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient taking an SNRI has gradually increasing blood pressure at follow-up. Which antidepressant from this module is most associated with dose-related hypertension and therefore deserves blood pressure monitoring?",
            options: ["Venlafaxine", "Escitalopram", "Mirtazapine", "Buspirone", "Fluoxetine"],
            answer: "Venlafaxine",
            explanation: "Venlafaxine is the SNRI in this module most classically linked to dose-related blood pressure elevation.",
            objective: .monitoring,
            relatedDrugIds: ["d78"],
            tags: ["Mastery", "4f", "Venlafaxine", "Blood pressure"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_006",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient wants an SSRI with relatively few drug interactions compared with many others in the class, but you still teach that QT caution matters at higher doses. Which drug fits best?",
            options: ["Escitalopram", "Fluoxetine", "Paroxetine", "Sertraline", "Duloxetine"],
            answer: "Escitalopram",
            explanation: "Escitalopram is often remembered for having fewer drug interactions than many SSRIs, though QT caution remains a high-yield pearl at higher doses.",
            objective: .pearl,
            relatedDrugIds: ["d76"],
            tags: ["Mastery", "4f", "Escitalopram", "Interactions"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_007",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "An older adult with major depressive disorder is already taking several QT-prolonging medications. Which antidepressant from this module is remembered for a strict dose ceiling because QT prolongation is the major teaching pearl?",
            options: ["Citalopram", "Sertraline", "Mirtazapine", "Bupropion", "Buspirone"],
            answer: "Citalopram",
            explanation: "Citalopram is the antidepressant in this module with the classic dose ceiling pearl because QT prolongation becomes more concerning at higher doses.",
            objective: .dosing,
            relatedDrugIds: ["d204"],
            tags: ["Mastery", "4f", "Citalopram", "QT prolongation"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_008",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A learner keeps forgetting why Pristiq appears next to venlafaxine in this course. Which statement best identifies desvenlafaxine?",
            options: ["It is the active metabolite of venlafaxine and is often taught as a fixed-dose SNRI", "It is the prodrug form of duloxetine", "It is the metabolite of citalopram and is mainly used for insomnia", "It is a TCA used mainly for neuropathic pain", "It is the only SSRI with a boxed warning for suicidality"],
            answer: "It is the active metabolite of venlafaxine and is often taught as a fixed-dose SNRI",
            explanation: "Desvenlafaxine is the active metabolite of venlafaxine and is high yield for its fixed 50 mg teaching pearl.",
            objective: .pearl,
            relatedDrugIds: ["d206", "d78"],
            tags: ["Mastery", "4f", "Desvenlafaxine", "Venlafaxine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_009",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient wants help with depression but is especially worried about sexual dysfunction and weight gain, and also hopes to quit smoking. Which option best fits those teaching pearls while still requiring seizure-risk counseling?",
            options: ["Bupropion", "Paroxetine", "Mirtazapine", "Trazodone", "Olanzapine"],
            answer: "Bupropion",
            explanation: "Bupropion is high yield for causing less sexual dysfunction and less weight gain than many antidepressants, and it is also used for smoking cessation. It lowers the seizure threshold.",
            objective: .indication,
            relatedDrugIds: ["d202"],
            tags: ["Mastery", "4f", "Bupropion", "Smoking cessation"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_010",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient with generalized anxiety disorder wants a non-controlled, non-sedating option instead of a benzodiazepine and understands that it will not work immediately. Which drug fits that teaching stem best?",
            options: ["Buspirone", "Alprazolam", "Hydroxyzine", "Clonazepam", "Zolpidem"],
            answer: "Buspirone",
            explanation: "Buspirone is a non-controlled, non-sedating anxiolytic for generalized anxiety disorder, but it takes time to work and is not useful for rapid symptom relief.",
            objective: .indication,
            relatedDrugIds: ["d203"],
            tags: ["Mastery", "4f", "Buspirone", "GAD"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_011",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A depressed patient has insomnia and poor appetite with unwanted weight loss. Which antidepressant is high yield because lower doses are often more sedating and can stimulate appetite?",
            options: ["Mirtazapine", "Bupropion", "Fluoxetine", "Venlafaxine", "Aripiprazole"],
            answer: "Mirtazapine",
            explanation: "Mirtazapine is remembered for sedation and appetite stimulation, especially at lower doses, making it useful when depression is paired with insomnia and weight loss.",
            objective: .pearl,
            relatedDrugIds: ["d209"],
            tags: ["Mastery", "4f", "Mirtazapine", "Appetite"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_012",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A trainee remembers low-dose trazodone as a common off-label sleep aid. Which rare but serious adverse effect must still be taught every time?",
            options: ["Priapism", "Agranulocytosis", "Dry cough", "Ototoxicity", "Tardive dyskinesia"],
            answer: "Priapism",
            explanation: "Trazodone is often used for sleep at low doses, but priapism is the classic rare but serious adverse effect that students must remember.",
            objective: .adverseEffect,
            relatedDrugIds: ["d211"],
            tags: ["Mastery", "4f", "Trazodone", "Priapism"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_013",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "Amitriptyline, doxepin, and nortriptyline are all older antidepressants, but one is the classic 'most anticholinergic' TCA that is easy to over-sedate and easy to avoid in older adults. Which is it?",
            options: ["Amitriptyline", "Nortriptyline", "Doxepin", "Desvenlafaxine", "Escitalopram"],
            answer: "Amitriptyline",
            explanation: "Amitriptyline is the TCA most strongly associated with anticholinergic burden and sedation among the options here.",
            objective: .adverseEffect,
            relatedDrugIds: ["d201"],
            tags: ["Mastery", "4f", "Amitriptyline", "Anticholinergic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_014",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "If you want a TCA-like option for neuropathic pain or depression but with somewhat less anticholinergic burden than amitriptyline, which drug is the better teaching answer?",
            options: ["Nortriptyline", "Doxepin", "Trazodone", "Paroxetine", "Hydroxyzine"],
            answer: "Nortriptyline",
            explanation: "Nortriptyline is usually remembered as less anticholinergic than amitriptyline while still belonging to the TCA family.",
            objective: .pearl,
            relatedDrugIds: ["d210", "d201"],
            tags: ["Mastery", "4f", "Nortriptyline", "TCA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_015",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient asks for a sleep-specific use of an older antidepressant. Which drug has a high-yield low-dose insomnia product sold as Silenor?",
            options: ["Doxepin", "Trazodone", "Mirtazapine", "Fluoxetine", "Buspirone"],
            answer: "Doxepin",
            explanation: "Low-dose doxepin is marketed as Silenor for insomnia, while higher doses are antidepressant TCA doses.",
            objective: .brandGeneric,
            relatedDrugIds: ["d207"],
            tags: ["Mastery", "4f", "Doxepin", "Silenor"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_016",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient with anxiety and severe pruritus wants something non-addictive that may also help sleep. Which sedating antihistamine from this module best matches that description?",
            options: ["Hydroxyzine", "Buspirone", "Lorazepam", "Zolpidem", "Suvorexant"],
            answer: "Hydroxyzine",
            explanation: "Hydroxyzine is an antihistamine that can help anxiety, pruritus, and sleep, and it is not a controlled substance.",
            objective: .indication,
            relatedDrugIds: ["d208"],
            tags: ["Mastery", "4f", "Hydroxyzine", "Pruritus"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_017",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A medication for bipolar disorder remains a gold-standard mood stabilizer but demands serum level, renal, and thyroid monitoring because of its narrow therapeutic index. Which drug is it?",
            options: ["Lithium", "Valproic acid", "Quetiapine", "Buspirone", "Paroxetine"],
            answer: "Lithium",
            explanation: "Lithium is a classic mood stabilizer with a narrow therapeutic index and requires monitoring of serum levels, kidney function, and thyroid function.",
            objective: .monitoring,
            relatedDrugIds: ["d92"],
            tags: ["Mastery", "4f", "Lithium", "Monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_018",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient on long-term mood stabilization develops polyuria and polydipsia. Which medication in this module is classically linked to nephrogenic diabetes insipidus and hypothyroidism?",
            options: ["Lithium", "Bupropion", "Haloperidol", "Guanfacine ER", "Midazolam"],
            answer: "Lithium",
            explanation: "Lithium is high yield for nephrogenic diabetes insipidus, tremor, hypothyroidism, and renal concerns.",
            objective: .adverseEffect,
            relatedDrugIds: ["d92"],
            tags: ["Mastery", "4f", "Lithium", "Nephrogenic DI"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_019",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "Which antipsychotic remains the classic teaching answer for treatment-resistant schizophrenia and suicidal behavior, while still requiring ANC monitoring for severe neutropenia?",
            options: ["Clozapine", "Olanzapine", "Haloperidol", "Risperidone", "Aripiprazole"],
            answer: "Clozapine",
            explanation: "Clozapine is the high-yield antipsychotic for treatment-resistant schizophrenia and suicidality, but ANC monitoring remains essential because of severe neutropenia risk.",
            objective: .monitoring,
            relatedDrugIds: ["d90"],
            tags: ["Mastery", "4f", "Clozapine", "ANC"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_020",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient switched from a metabolically heavy antipsychotic develops pacing and inner restlessness rather than hyperprolactinemia. Which atypical is most famous for partial D2 agonism and akathisia?",
            options: ["Aripiprazole", "Quetiapine", "Olanzapine", "Risperidone", "Clozapine"],
            answer: "Aripiprazole",
            explanation: "Aripiprazole is the partial D2 agonist in this module and is classically associated with akathisia more than heavy metabolic effects.",
            objective: .moa,
            relatedDrugIds: ["d88"],
            tags: ["Mastery", "4f", "Aripiprazole", "Akathisia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_021",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "An acutely agitated patient receives a high-potency typical antipsychotic. Which drug from this module is most classically associated with EPS, dystonia, and neuroleptic malignant syndrome teaching points?",
            options: ["Haloperidol", "Quetiapine", "Aripiprazole", "Mirtazapine", "Lithium"],
            answer: "Haloperidol",
            explanation: "Haloperidol is the classic high-potency typical antipsychotic associated with EPS, dystonia, and NMS teaching pearls.",
            objective: .adverseEffect,
            relatedDrugIds: ["d91"],
            tags: ["Mastery", "4f", "Haloperidol", "EPS"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_022",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient with schizophrenia, obesity, and a rising A1c is about to start a new antipsychotic. Which option is least attractive because it is one of the biggest metabolic-weight-gain offenders in the module?",
            options: ["Olanzapine", "Aripiprazole", "Haloperidol", "Buspirone", "Zolpidem"],
            answer: "Olanzapine",
            explanation: "Olanzapine is a major metabolic offender and is high yield for weight gain, dyslipidemia, and hyperglycemia.",
            objective: .contraindication,
            relatedDrugIds: ["d89"],
            tags: ["Mastery", "4f", "Olanzapine", "Metabolic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_023",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A highly sedating atypical antipsychotic is sometimes remembered because patients notice sleepiness and orthostasis more than EPS. Which drug fits that pattern best?",
            options: ["Quetiapine", "Risperidone", "Aripiprazole", "Haloperidol", "Atomoxetine"],
            answer: "Quetiapine",
            explanation: "Quetiapine is the atypical antipsychotic in this module most associated with sedation and orthostasis.",
            objective: .adverseEffect,
            relatedDrugIds: ["d86"],
            tags: ["Mastery", "4f", "Quetiapine", "Sedation"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_024",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient develops galactorrhea and menstrual changes after starting an atypical antipsychotic. Which drug from this module is most classically tied to hyperprolactinemia?",
            options: ["Risperidone", "Aripiprazole", "Quetiapine", "Olanzapine", "Clozapine"],
            answer: "Risperidone",
            explanation: "Risperidone is high yield for hyperprolactinemia and, among the atypicals here, relatively more EPS than many of its peers.",
            objective: .adverseEffect,
            relatedDrugIds: ["d87"],
            tags: ["Mastery", "4f", "Risperidone", "Prolactin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_025",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient wants fast relief of panic symptoms, but you teach that the short half-life also raises rebound anxiety and misuse concerns. Which benzodiazepine best matches that pearl?",
            options: ["Alprazolam", "Diazepam", "Clonazepam", "Lorazepam", "Hydroxyzine"],
            answer: "Alprazolam",
            explanation: "Alprazolam is high yield for rapid symptom relief but also for short half-life, dependence, and rebound anxiety concerns.",
            objective: .pearl,
            relatedDrugIds: ["d80"],
            tags: ["Mastery", "4f", "Alprazolam", "Panic disorder"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_026",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "In a patient with cirrhosis who still needs a benzodiazepine, which choice is favored from this module because it has no active metabolites and belongs to the classic LOT drugs?",
            options: ["Lorazepam", "Diazepam", "Alprazolam", "Clonazepam", "Midazolam"],
            answer: "Lorazepam",
            explanation: "Lorazepam is one of the classic LOT benzodiazepines and is preferred in hepatic impairment because it lacks active metabolites.",
            objective: .pearl,
            relatedDrugIds: ["d81"],
            tags: ["Mastery", "4f", "Lorazepam", "Liver disease"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_027",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "Which benzodiazepine from this module is especially remembered for a very long duration of action because active metabolites keep it around?",
            options: ["Diazepam", "Lorazepam", "Alprazolam", "Midazolam", "Hydroxyzine"],
            answer: "Diazepam",
            explanation: "Diazepam is the classic long-acting benzodiazepine here because of active metabolites.",
            objective: .pearl,
            relatedDrugIds: ["d82"],
            tags: ["Mastery", "4f", "Diazepam", "Active metabolites"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_028",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A patient with panic disorder and seizure history needs a longer-acting benzodiazepine rather than a rapid on-off option. Which drug fits best?",
            options: ["Clonazepam", "Zolpidem", "Buspirone", "Alprazolam", "Suvorexant"],
            answer: "Clonazepam",
            explanation: "Clonazepam is a long-acting benzodiazepine used for panic disorder and certain seizure disorders.",
            objective: .indication,
            relatedDrugIds: ["d205"],
            tags: ["Mastery", "4f", "Clonazepam", "Seizures"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_029",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "For bedside procedures, one benzodiazepine is high yield for rapid-onset sedation and anterograde amnesia. Which drug is it?",
            options: ["Midazolam", "Diazepam", "Lorazepam", "Clonazepam", "Buspirone"],
            answer: "Midazolam",
            explanation: "Midazolam is the classic procedural-sedation benzodiazepine and is remembered for anterograde amnesia and respiratory-depression caution.",
            objective: .indication,
            relatedDrugIds: ["d83"],
            tags: ["Mastery", "4f", "Midazolam", "Procedural sedation"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_030",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient asks for a 'sleeping pill' for short-term insomnia. Which medication requires counseling about taking it only when at least 7–8 hours remain before planned awakening and about complex sleep behaviors?",
            options: ["Zolpidem", "Suvorexant", "Hydroxyzine", "Lorazepam", "Quetiapine"],
            answer: "Zolpidem",
            explanation: "Zolpidem is a Z-drug used for insomnia and is high yield for complex sleep behaviors and for bedtime-only dosing when enough sleep time remains.",
            objective: .dosing,
            relatedDrugIds: ["d84"],
            tags: ["Mastery", "4f", "Zolpidem", "Complex sleep behaviors"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_031",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "Which insomnia drug in this module works by blocking orexin signaling rather than enhancing GABA-A activity and is contraindicated in narcolepsy?",
            options: ["Suvorexant", "Zolpidem", "Diazepam", "Trazodone", "Hydroxyzine"],
            answer: "Suvorexant",
            explanation: "Suvorexant is an orexin receptor antagonist and is contraindicated in narcolepsy.",
            objective: .moa,
            relatedDrugIds: ["d85"],
            tags: ["Mastery", "4f", "Suvorexant", "Orexin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_032",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A college student with ADHD is started on the classic mixed amphetamine salts product, a Schedule II stimulant that can also be used for narcolepsy. Which generic name matches that teaching pearl?",
            options: ["Amphetamine/dextroamphetamine", "Lisdexamfetamine", "Methylphenidate", "Atomoxetine", "Guanfacine ER"],
            answer: "Amphetamine/dextroamphetamine",
            explanation: "Amphetamine/dextroamphetamine is the mixed amphetamine salts product and a classic Schedule II stimulant for ADHD and narcolepsy.",
            objective: .genericBrand,
            relatedDrugIds: ["d212"],
            tags: ["Mastery", "4f", "Adderall", "Amphetamine salts"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_033",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "Which ADHD medication is the prodrug stimulant that is also high yield for binge-eating disorder?",
            options: ["Lisdexamfetamine", "Methylphenidate", "Atomoxetine", "Guanfacine ER", "Dexmethylphenidate"],
            answer: "Lisdexamfetamine",
            explanation: "Lisdexamfetamine is the stimulant prodrug in this module and is also used for binge-eating disorder.",
            objective: .indication,
            relatedDrugIds: ["d216"],
            tags: ["Mastery", "4f", "Lisdexamfetamine", "Binge-eating disorder"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_034",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "A preceptor says Focalin is basically the more potent D-isomer version of a familiar stimulant. What is the generic name of Focalin?",
            options: ["Dexmethylphenidate", "Methylphenidate", "Lisdexamfetamine", "Atomoxetine", "Amphetamine/dextroamphetamine"],
            answer: "Dexmethylphenidate",
            explanation: "Focalin is the brand name for dexmethylphenidate, the D-isomer of methylphenidate.",
            objective: .brandGeneric,
            relatedDrugIds: ["d214"],
            tags: ["Mastery", "4f", "Dexmethylphenidate", "Focalin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_035",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .easy,
            question: "Which ADHD drug is the very common methylphenidate family product remembered for IR, ER, and even transdermal formulations?",
            options: ["Methylphenidate", "Dexmethylphenidate", "Atomoxetine", "Guanfacine ER", "Buspirone"],
            answer: "Methylphenidate",
            explanation: "Methylphenidate is the classic widely used stimulant family with multiple formulations, including immediate-release, extended-release, and patch options.",
            objective: .pearl,
            relatedDrugIds: ["d217"],
            tags: ["Mastery", "4f", "Methylphenidate", "Formulations"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_036",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A family wants a non-stimulant ADHD medication that is not controlled but still requires counseling about suicidal thoughts, liver injury, blood pressure/heart-rate changes, and delayed onset. Which drug fits best?",
            options: ["Atomoxetine", "Guanfacine ER", "Lisdexamfetamine", "Methylphenidate", "Clonazepam"],
            answer: "Atomoxetine",
            explanation: "Atomoxetine is the non-stimulant selective norepinephrine reuptake inhibitor in this module and is high yield for suicidality and liver-injury counseling.",
            objective: .contraindication,
            relatedDrugIds: ["d213"],
            tags: ["Mastery", "4f", "Atomoxetine", "Liver injury"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_037",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "Which non-stimulant ADHD option works through alpha-2 agonism and is high yield for somnolence, bradycardia, hypotension, and the need to taper rather than stop abruptly?",
            options: ["Guanfacine ER", "Atomoxetine", "Methylphenidate", "Amphetamine/dextroamphetamine", "Bupropion"],
            answer: "Guanfacine ER",
            explanation: "Guanfacine ER is an alpha-2 agonist used for ADHD and is classically associated with somnolence, bradycardia, hypotension, and tapering counseling.",
            objective: .moa,
            relatedDrugIds: ["d215"],
            tags: ["Mastery", "4f", "Guanfacine ER", "Alpha-2 agonist"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_038",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .hard,
            question: "A patient on warfarin for atrial fibrillation starts a new antidepressant and then notices easier bruising. Which psych medication from this module most strongly reinforces the teaching pearl that SSRIs can add to bleeding risk?",
            options: ["Sertraline", "Bupropion", "Buspirone", "Mirtazapine", "Lithium"],
            answer: "Sertraline",
            explanation: "SSRIs such as sertraline can impair platelet serotonin uptake and add to bleeding risk, which matters even more when a patient is already taking warfarin.",
            objective: .interaction,
            relatedDrugIds: ["d74", "d41"],
            tags: ["Mastery", "4f", "Sertraline", "Warfarin", "Bleeding"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_039",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .hard,
            question: "A bipolar patient stable on lithium develops tremor, nausea, and worsening toxicity shortly after a thiazide is added for hypertension. Which prior-module drug is the most likely culprit?",
            options: ["Chlorthalidone", "Amlodipine", "Metoprolol succinate", "Atorvastatin", "Metformin"],
            answer: "Chlorthalidone",
            explanation: "Thiazide and thiazide-like diuretics can raise lithium concentrations and precipitate toxicity. Chlorthalidone is the best answer here.",
            objective: .interaction,
            relatedDrugIds: ["d92", "d10"],
            tags: ["Mastery", "4f", "Lithium", "Chlorthalidone", "Toxicity"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_040",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .hard,
            question: "A patient with schizophrenia gains significant weight and develops hyperglycemia after starting olanzapine. Which prior-module medication is the classic first-line, generally weight-neutral oral agent for type 2 diabetes that would be most familiar from endocrine review?",
            options: ["Metformin", "Pioglitazone", "Glipizide", "Insulin glargine", "Levothyroxine"],
            answer: "Metformin",
            explanation: "Metformin is the classic first-line oral medication for type 2 diabetes and is generally weight neutral, making it a common crossover review answer when antipsychotic metabolic effects come up.",
            objective: .mixedReview,
            relatedDrugIds: ["d89", "d45"],
            tags: ["Mastery", "4f", "Olanzapine", "Metformin", "Cross-module"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_041",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .hard,
            question: "A patient with ADHD already takes metoprolol for HFrEF and has baseline bradycardia. Which non-stimulant from this module deserves extra caution because it can also lower heart rate and blood pressure?",
            options: ["Guanfacine ER", "Atomoxetine", "Bupropion", "Methylphenidate", "Lisdexamfetamine"],
            answer: "Guanfacine ER",
            explanation: "Guanfacine ER can cause bradycardia and hypotension, so it deserves caution in a patient who already has baseline bradycardia while taking metoprolol.",
            objective: .interaction,
            relatedDrugIds: ["d215", "d14"],
            tags: ["Mastery", "4f", "Guanfacine ER", "Metoprolol", "Bradycardia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_042",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient with type 2 diabetes wants an antidepressant less likely to worsen weight and sexual dysfunction than mirtazapine or many SSRIs. Which option is often the best teaching answer?",
            options: ["Bupropion", "Mirtazapine", "Paroxetine", "Olanzapine", "Doxepin"],
            answer: "Bupropion",
            explanation: "Bupropion is a common teaching answer when weight gain and sexual dysfunction are concerns because it is less likely to worsen either than many alternatives.",
            objective: .pearl,
            relatedDrugIds: ["d202", "d45"],
            tags: ["Mastery", "4f", "Bupropion", "Weight"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_043",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .hard,
            question: "Following the August 2025 FDA change, prescribers are no longer required to participate in a REMS to dispense which antipsychotic, even though ANC monitoring remains a core teaching point?",
            options: ["Clozapine", "Haloperidol", "Risperidone", "Olanzapine", "Quetiapine"],
            answer: "Clozapine",
            explanation: "FDA removed the clozapine REMS in 2025, but clozapine still requires attention to ANC monitoring because severe neutropenia remains a key safety issue.",
            objective: .pearl,
            relatedDrugIds: ["d90"],
            tags: ["Mastery", "4f", "Clozapine", "REMS", "ANC"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_044",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .medium,
            question: "A patient with depression and bulimia nervosa is starting an SSRI. Which drug in this module is best remembered for that distinctive use in addition to major depression?",
            options: ["Fluoxetine", "Escitalopram", "Sertraline", "Paroxetine", "Citalopram"],
            answer: "Fluoxetine",
            explanation: "Fluoxetine is the standout SSRI in this module for its distinctive association with bulimia nervosa.",
            objective: .indication,
            relatedDrugIds: ["d75"],
            tags: ["Mastery", "4f", "Fluoxetine", "Bulimia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q4f_add_045",
            subsectionId: DrugDataService.masteringCnsPsychSubsectionId,
            difficulty: .hard,
            question: "When organizing ADHD drugs by family, which answer choice correctly identifies the two medications in this module that belong to the methylphenidate branch rather than the amphetamine branch?",
            options: ["Methylphenidate and dexmethylphenidate", "Amphetamine/dextroamphetamine and lisdexamfetamine", "Atomoxetine and guanfacine ER", "Lisdexamfetamine and methylphenidate", "Amphetamine/dextroamphetamine and dexmethylphenidate"],
            answer: "Methylphenidate and dexmethylphenidate",
            explanation: "Methylphenidate and dexmethylphenidate belong to the methylphenidate family, whereas amphetamine/dextroamphetamine and lisdexamfetamine belong to the amphetamine family.",
            objective: .classId,
            relatedDrugIds: ["d214", "d217", "d212", "d216"],
            tags: ["Mastery", "4f", "ADHD", "Class ID"],
            source: .curated
        )

    ]
}
