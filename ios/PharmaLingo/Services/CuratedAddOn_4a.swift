// PharmaLingo — Module 4a (Antidepressants I: SSRIs, SNRIs)
// Curated Add-On Question Pack (45 questions)
// IDs: q4a_add_001 ... q4a_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 4a exists, then append:
//
//    if bank["4a"] == nil { bank["4a"] = [] }
//    bank["4a"]?.append(contentsOf: Self.curatedAddOnQuestions_4a)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d74 (Sertraline), d75 (Fluoxetine),
//   d76 (Escitalopram), d77 (Paroxetine), d78 (Venlafaxine), d79 (Duloxetine).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_4a: [Question] = [

    .multipleChoice(
        id: "q4a_add_001",
        subsectionId: "4a",
        difficulty: .easy,
        question: "A patient with depression and diabetic neuropathic pain is started on Cymbalta, an SNRI that also helps certain chronic pain syndromes. What is the generic name of Cymbalta?",
        options: ["Duloxetine", "Venlafaxine", "Sertraline", "Escitalopram", "Fluoxetine"],
        answer: "Duloxetine",
        explanation: "Cymbalta is the brand name for duloxetine. This is a high-yield pair because duloxetine is one of the antidepressants in this subsection with important pain indications in addition to mood disorders.",
        objective: .brandGeneric,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "Cymbalta", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_002",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Duloxetine is an SNRI used for depression, anxiety, and certain pain conditions such as diabetic peripheral neuropathy and fibromyalgia. Which brand name matches duloxetine?",
        options: ["Lexapro", "Prozac", "Effexor XR", "Cymbalta", "Zoloft"],
        answer: "Cymbalta",
        explanation: "Duloxetine is marketed as Cymbalta. Linking the generic to its pain-related indications makes this pair easier to remember than memorizing the name in isolation.",
        objective: .genericBrand,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "Cymbalta", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_003",
        subsectionId: "4a",
        difficulty: .easy,
        question: "A patient with major depressive disorder and generalized anxiety disorder is started on Lexapro, a commonly used SSRI. What is the generic name of Lexapro?",
        options: ["Escitalopram", "Sertraline", "Paroxetine", "Fluoxetine", "Venlafaxine"],
        answer: "Escitalopram",
        explanation: "Lexapro is the brand name for escitalopram. This is a core SSRI brand-generic pair worth knowing cold.",
        objective: .brandGeneric,
        relatedDrugIds: ["d76"],
        tags: ["escitalopram", "Lexapro", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_004",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Escitalopram is a once-daily SSRI often chosen for major depressive disorder and generalized anxiety disorder. Which brand name matches escitalopram?",
        options: ["Paxil", "Lexapro", "Zoloft", "Effexor XR", "Cymbalta"],
        answer: "Lexapro",
        explanation: "Escitalopram is sold as Lexapro. Remembering the indication alongside the brand pair helps separate it from the other SSRIs in this subsection.",
        objective: .genericBrand,
        relatedDrugIds: ["d76"],
        tags: ["escitalopram", "Lexapro", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_005",
        subsectionId: "4a",
        difficulty: .easy,
        question: "A patient with depression and binge-eating/vomiting behavior from bulimia is prescribed Prozac, an SSRI with a notably long half-life. What is the generic name of Prozac?",
        options: ["Fluoxetine", "Paroxetine", "Sertraline", "Escitalopram", "Duloxetine"],
        answer: "Fluoxetine",
        explanation: "Prozac is the brand name for fluoxetine. The bulimia association and long half-life are two classic fluoxetine pearls.",
        objective: .brandGeneric,
        relatedDrugIds: ["d75"],
        tags: ["fluoxetine", "Prozac", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_006",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Fluoxetine is an SSRI used for depression, OCD, panic disorder, and bulimia nervosa, and it has a long half-life compared with many other antidepressants. Which brand name matches fluoxetine?",
        options: ["Zoloft", "Paxil", "Prozac", "Lexapro", "Cymbalta"],
        answer: "Prozac",
        explanation: "Fluoxetine is marketed as Prozac. Its long half-life is a major clue that distinguishes it from shorter half-life agents like paroxetine and venlafaxine.",
        objective: .genericBrand,
        relatedDrugIds: ["d75"],
        tags: ["fluoxetine", "Prozac", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_007",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Paxil is prescribed for depression and anxiety, but the prescriber warns that stopping it suddenly can cause troublesome withdrawal symptoms. What is the generic name of Paxil?",
        options: ["Paroxetine", "Fluoxetine", "Sertraline", "Escitalopram", "Venlafaxine"],
        answer: "Paroxetine",
        explanation: "Paxil is the brand name for paroxetine. Paroxetine is a high-yield SSRI because of its discontinuation issues and pregnancy concerns.",
        objective: .brandGeneric,
        relatedDrugIds: ["d77"],
        tags: ["paroxetine", "Paxil", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_008",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Paroxetine is an SSRI used for depression, anxiety, PTSD, and panic disorder, but it is also known for sedation, sexual dysfunction, and pronounced discontinuation symptoms. Which brand name matches paroxetine?",
        options: ["Zoloft", "Lexapro", "Paxil", "Prozac", "Effexor XR"],
        answer: "Paxil",
        explanation: "Paroxetine is marketed as Paxil. Pairing the brand with its memorable adverse-effect profile helps reinforce recall.",
        objective: .genericBrand,
        relatedDrugIds: ["d77"],
        tags: ["paroxetine", "Paxil", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_009",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Zoloft is a commonly used SSRI for depression and is also high yield for OCD, PTSD, and panic disorder. What is the generic name of Zoloft?",
        options: ["Sertraline", "Escitalopram", "Fluoxetine", "Paroxetine", "Duloxetine"],
        answer: "Sertraline",
        explanation: "Zoloft is the brand name for sertraline. Sertraline is one of the broadest-purpose SSRIs in this subsection.",
        objective: .brandGeneric,
        relatedDrugIds: ["d74"],
        tags: ["sertraline", "Zoloft", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_010",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Sertraline is an SSRI often associated with early GI upset but widely used for depression, trauma-related disorders, OCD, and panic disorder. Which brand name matches sertraline?",
        options: ["Paxil", "Prozac", "Lexapro", "Zoloft", "Cymbalta"],
        answer: "Zoloft",
        explanation: "Sertraline is marketed as Zoloft. The GI side-effect pearl makes this pair more memorable than simple rote memorization.",
        objective: .genericBrand,
        relatedDrugIds: ["d74"],
        tags: ["sertraline", "Zoloft", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_011",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Effexor XR is started for anxiety and depression, and the clinician plans to recheck blood pressure at follow-up because the drug can raise it. What is the generic name of Effexor XR?",
        options: ["Duloxetine", "Venlafaxine", "Fluoxetine", "Paroxetine", "Escitalopram"],
        answer: "Venlafaxine",
        explanation: "Effexor XR is the brand name for venlafaxine. Blood pressure monitoring is a classic pearl tied to venlafaxine.",
        objective: .brandGeneric,
        relatedDrugIds: ["d78"],
        tags: ["venlafaxine", "Effexor XR", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_012",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Venlafaxine is an SNRI used for major depressive disorder, generalized anxiety disorder, social anxiety disorder, and panic disorder, and it is commonly dispensed as an extended-release product. Which brand name matches venlafaxine?",
        options: ["Cymbalta", "Lexapro", "Paxil", "Effexor XR", "Zoloft"],
        answer: "Effexor XR",
        explanation: "Venlafaxine is marketed as Effexor XR. The XR association is high yield because many learners remember venlafaxine most easily in its extended-release form.",
        objective: .genericBrand,
        relatedDrugIds: ["d78"],
        tags: ["venlafaxine", "Effexor XR", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_013",
        subsectionId: "4a",
        difficulty: .easy,
        question: "A patient has depression plus diabetic neuropathic pain. Which medication from subsection 4a is an SNRI rather than an SSRI and is especially useful to remember for pain comorbidity?",
        options: ["Sertraline", "Fluoxetine", "Escitalopram", "Duloxetine", "Paroxetine"],
        answer: "Duloxetine",
        explanation: "Duloxetine is an SNRI, not an SSRI. It stands out because it also has important pain indications such as diabetic peripheral neuropathic pain and fibromyalgia.",
        objective: .classId,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "SNRI", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_014",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Which subsection 4a medication is also an SNRI and is especially high yield because sustained increases in blood pressure can occur during treatment?",
        options: ["Escitalopram", "Fluoxetine", "Venlafaxine", "Sertraline", "Paroxetine"],
        answer: "Venlafaxine",
        explanation: "Venlafaxine is an SNRI and is classically associated with blood pressure monitoring. That pearl helps separate it from the SSRIs in this subsection.",
        objective: .classId,
        relatedDrugIds: ["d78"],
        tags: ["venlafaxine", "SNRI", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_015",
        subsectionId: "4a",
        difficulty: .easy,
        question: "Escitalopram, fluoxetine, paroxetine, and sertraline all belong to which drug class?",
        options: ["SSRIs", "SNRIs", "TCAs", "MAOIs", "Benzodiazepines"],
        answer: "SSRIs",
        explanation: "Escitalopram, fluoxetine, paroxetine, and sertraline are selective serotonin reuptake inhibitors. Knowing this grouping helps you predict shared adverse effects and interactions.",
        objective: .classId,
        relatedDrugIds: ["d74", "d75", "d76", "d77"],
        tags: ["SSRIs", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_016",
        subsectionId: "4a",
        difficulty: .medium,
        question: "The main antidepressant mechanism of an SSRI such as sertraline or escitalopram is best described as:",
        options: ["Blocking serotonin reuptake", "Blocking dopamine reuptake", "Blocking norepinephrine only", "Stimulating GABA-A receptors", "Blocking NMDA receptors"],
        answer: "Blocking serotonin reuptake",
        explanation: "SSRIs work by inhibiting serotonin reuptake, increasing serotonergic signaling in the CNS. That mechanism explains why the whole class shares serotonin-related adverse effects and interactions.",
        objective: .moa,
        relatedDrugIds: ["d74", "d76"],
        tags: ["SSRI", "MOA", "serotonin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_017",
        subsectionId: "4a",
        difficulty: .medium,
        question: "SNRIs such as duloxetine and venlafaxine improve mood primarily by blocking reuptake of which neurotransmitters?",
        options: ["Dopamine and acetylcholine", "Serotonin and norepinephrine", "GABA and glutamate", "Histamine and acetylcholine", "Norepinephrine only"],
        answer: "Serotonin and norepinephrine",
        explanation: "SNRIs inhibit reuptake of both serotonin and norepinephrine. That dual action is part of why duloxetine is also useful in certain pain conditions.",
        objective: .moa,
        relatedDrugIds: ["d78", "d79"],
        tags: ["SNRI", "MOA", "serotonin", "norepinephrine"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_018",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient has major depressive disorder plus PTSD and panic symptoms. Which 4a antidepressant is especially high yield because it is also used for OCD, PTSD, and panic disorder?",
        options: ["Escitalopram", "Duloxetine", "Sertraline", "Venlafaxine", "Paroxetine"],
        answer: "Sertraline",
        explanation: "Sertraline has a broad set of psychiatric uses, including PTSD, OCD, and panic disorder in addition to depression. That breadth makes it one of the most versatile SSRIs in this section.",
        objective: .indication,
        relatedDrugIds: ["d74"],
        tags: ["sertraline", "PTSD", "OCD", "panic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_019",
        subsectionId: "4a",
        difficulty: .medium,
        question: "Which antidepressant in subsection 4a is especially high yield to remember for bulimia nervosa, in addition to major depressive disorder and OCD?",
        options: ["Paroxetine", "Escitalopram", "Fluoxetine", "Sertraline", "Duloxetine"],
        answer: "Fluoxetine",
        explanation: "Fluoxetine is the classic 4a antidepressant associated with bulimia nervosa. That indication is a favorite differentiator on exams.",
        objective: .indication,
        relatedDrugIds: ["d75"],
        tags: ["fluoxetine", "bulimia", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_020",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient with major depressive disorder and generalized anxiety disorder is being started on a straightforward once-daily SSRI from subsection 4a. Which drug best matches that profile?",
        options: ["Duloxetine", "Escitalopram", "Venlafaxine", "Paroxetine", "Fluoxetine"],
        answer: "Escitalopram",
        explanation: "Escitalopram is a core SSRI used for both MDD and GAD. It is a common first-line option when a learner is trying to map cleanly from indication to drug choice.",
        objective: .indication,
        relatedDrugIds: ["d76"],
        tags: ["escitalopram", "MDD", "GAD"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_021",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient with major depressive disorder and painful diabetic peripheral neuropathy wants one medication that may help both conditions. Which 4a option best fits?",
        options: ["Sertraline", "Fluoxetine", "Escitalopram", "Paroxetine", "Duloxetine"],
        answer: "Duloxetine",
        explanation: "Duloxetine is the best match because it is both an antidepressant and a high-yield option for diabetic peripheral neuropathic pain.",
        objective: .indication,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "diabetic neuropathy", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_022",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient with fibromyalgia and depression is being started on a subsection 4a antidepressant that also has a pain indication. Which drug is the best match?",
        options: ["Paroxetine", "Duloxetine", "Sertraline", "Escitalopram", "Fluoxetine"],
        answer: "Duloxetine",
        explanation: "Duloxetine is the standout antidepressant in this subsection for fibromyalgia. This is one of the most useful ways to separate duloxetine from venlafaxine on recall questions.",
        objective: .indication,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "fibromyalgia", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_023",
        subsectionId: "4a",
        difficulty: .medium,
        question: "Which subsection 4a antidepressant is officially used for generalized anxiety disorder, social anxiety disorder, and panic disorder in addition to major depressive disorder?",
        options: ["Fluoxetine", "Paroxetine", "Venlafaxine", "Escitalopram", "Sertraline"],
        answer: "Venlafaxine",
        explanation: "Venlafaxine has indications that extend beyond depression to GAD, social anxiety disorder, and panic disorder. That broad anxiety coverage is a key SNRI pearl.",
        objective: .indication,
        relatedDrugIds: ["d78"],
        tags: ["venlafaxine", "GAD", "SAD", "panic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_024",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient says, “I started sertraline 3 days ago and still feel depressed, so it must not work.” Which counseling point is most accurate?",
        options: ["These drugs usually have their full antidepressant effect within several weeks, often around 4 to 6 weeks", "SSRIs work only if they are taken as needed", "If you do not feel better in 3 days, the dose is definitely too low", "Antidepressants should stop working after the first week if they are effective", "SSRIs should relieve acute panic within minutes like a benzodiazepine"],
        answer: "These drugs usually have their full antidepressant effect within several weeks, often around 4 to 6 weeks",
        explanation: "SSRIs and SNRIs are not instant-relief medications. Early counseling about delayed onset improves adherence and prevents patients from stopping too soon.",
        objective: .pearl,
        relatedDrugIds: ["d74", "d75", "d76", "d77", "d78", "d79"],
        tags: ["onset", "counseling", "pearl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_025",
        subsectionId: "4a",
        difficulty: .medium,
        question: "All of the antidepressants in subsection 4a share a boxed warning for increased suicidal thoughts and behaviors in which group?",
        options: ["Children, adolescents, and young adults", "Adults older than 65 years only", "Patients with chronic kidney disease only", "Patients with schizophrenia only", "Pregnant patients only"],
        answer: "Children, adolescents, and young adults",
        explanation: "Antidepressants carry a boxed warning for increased suicidal thoughts and behaviors in pediatric and young adult patients. This is one of the most important counseling points for the entire section.",
        objective: .pearl,
        relatedDrugIds: ["d74", "d75", "d76", "d77", "d78", "d79"],
        tags: ["boxed warning", "suicidality", "class warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_026",
        subsectionId: "4a",
        difficulty: .hard,
        question: "A patient stable on fluoxetine is prescribed linezolid for an infection and then develops agitation, tremor, fever, and autonomic changes. What is the main reason this combination is dangerous?",
        options: ["It can precipitate serotonin syndrome", "It causes abrupt lithium toxicity", "It blocks insulin release and causes severe hyperglycemia", "It causes irreversible hearing loss", "It produces malignant hypertension by beta-blockade"],
        answer: "It can precipitate serotonin syndrome",
        explanation: "Fluoxetine should not be combined closely with MAOIs such as linezolid because serotonin syndrome can occur. Recognizing this interaction is much more important than memorizing routine brand-name facts.",
        objective: .interaction,
        relatedDrugIds: ["d75"],
        tags: ["fluoxetine", "linezolid", "serotonin syndrome"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_027",
        subsectionId: "4a",
        difficulty: .hard,
        question: "A patient taking sertraline begins using ibuprofen daily and later reports easy bruising and black stools. Which explanation is most likely?",
        options: ["SSRIs can increase bleeding risk, especially when combined with NSAIDs, aspirin, or anticoagulants", "Sertraline directly causes peptic ulcers in every patient", "Ibuprofen blocks sertraline absorption and causes withdrawal", "Sertraline strongly increases potassium and causes GI bleeding", "This combination is harmless and the symptoms are unrelated"],
        answer: "SSRIs can increase bleeding risk, especially when combined with NSAIDs, aspirin, or anticoagulants",
        explanation: "Drugs that interfere with serotonin reuptake can increase bleeding risk. The risk becomes more clinically important when NSAIDs, aspirin, warfarin, or other anticoagulants are added.",
        objective: .interaction,
        relatedDrugIds: ["d74"],
        tags: ["sertraline", "NSAID", "bleeding"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_028",
        subsectionId: "4a",
        difficulty: .hard,
        question: "An older adult started on venlafaxine becomes confused, fatigued, and is found to have a low serum sodium. Which drug-related problem best explains this presentation?",
        options: ["Hyponatremia from SIADH", "Rhabdomyolysis", "Hypercalcemia", "Neutropenia", "Pancreatitis"],
        answer: "Hyponatremia from SIADH",
        explanation: "SSRIs and SNRIs can cause hyponatremia, often through SIADH. Older adults are especially vulnerable, so new confusion after initiation should not be dismissed.",
        objective: .adverseEffect,
        relatedDrugIds: ["d78"],
        tags: ["venlafaxine", "hyponatremia", "SIADH"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_029",
        subsectionId: "4a",
        difficulty: .medium,
        question: "Which follow-up parameter is especially high yield to monitor after starting venlafaxine?",
        options: ["Blood pressure", "INR", "Serum calcium", "Absolute neutrophil count", "Pulmonary function tests"],
        answer: "Blood pressure",
        explanation: "Venlafaxine can cause sustained increases in blood pressure, so blood pressure monitoring is a classic follow-up point.",
        objective: .monitoring,
        relatedDrugIds: ["d78"],
        tags: ["venlafaxine", "blood pressure", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_030",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient with heavy alcohol use and chronic liver disease needs an antidepressant. Which subsection 4a option is the poorest choice because it carries an important liver injury warning?",
        options: ["Escitalopram", "Sertraline", "Fluoxetine", "Duloxetine", "Paroxetine"],
        answer: "Duloxetine",
        explanation: "Duloxetine should be used very cautiously, and often avoided, in patients with substantial alcohol use or significant hepatic impairment because severe liver injury can occur.",
        objective: .contraindication,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "hepatotoxicity", "alcohol"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_031",
        subsectionId: "4a",
        difficulty: .medium,
        question: "Which subsection 4a drug is least likely to cause abrupt withdrawal symptoms when doses are missed or the medicine is tapered, because its half-life is so long?",
        options: ["Paroxetine", "Venlafaxine", "Fluoxetine", "Escitalopram", "Sertraline"],
        answer: "Fluoxetine",
        explanation: "Fluoxetine has a long half-life, which makes discontinuation symptoms generally less abrupt than with shorter half-life agents such as paroxetine or venlafaxine.",
        objective: .pearl,
        relatedDrugIds: ["d75"],
        tags: ["fluoxetine", "half-life", "discontinuation"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_032",
        subsectionId: "4a",
        difficulty: .hard,
        question: "A patient stopped fluoxetine and wants to start an MAOI antidepressant tomorrow. What is the best teaching point?",
        options: ["Fluoxetine requires a longer washout, typically about 5 weeks, before starting an MAOI", "Fluoxetine can be switched to an MAOI the next day without concern", "The only risk is mild nausea, so no washout is needed", "Fluoxetine needs only a 24-hour washout before an MAOI", "MAOIs are safe to overlap with all SSRIs if the fluoxetine dose was low"],
        answer: "Fluoxetine requires a longer washout, typically about 5 weeks, before starting an MAOI",
        explanation: "Fluoxetine is the exception students must remember: because of its long half-life, the washout before an MAOI is much longer than with most other SSRIs.",
        objective: .interaction,
        relatedDrugIds: ["d75"],
        tags: ["fluoxetine", "MAOI", "washout"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_033",
        subsectionId: "4a",
        difficulty: .hard,
        question: "A patient abruptly stops paroxetine and soon develops dizziness, irritability, nausea, and “electric shock” sensations. What is the best explanation?",
        options: ["Discontinuation syndrome from abrupt antidepressant cessation", "Serotonin syndrome from dose accumulation", "Neuroleptic malignant syndrome", "Hypertensive emergency from MAOI exposure", "Acute cholinergic crisis"],
        answer: "Discontinuation syndrome from abrupt antidepressant cessation",
        explanation: "Paroxetine is one of the classic antidepressants associated with troublesome discontinuation symptoms if it is stopped suddenly. This is why tapering and counseling matter.",
        objective: .adverseEffect,
        relatedDrugIds: ["d77"],
        tags: ["paroxetine", "withdrawal", "discontinuation syndrome"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_034",
        subsectionId: "4a",
        difficulty: .medium,
        question: "Which subsection 4a antidepressant is classically associated with more sedation, weight gain, and anticholinergic effects than the other SSRIs in this section?",
        options: ["Fluoxetine", "Escitalopram", "Sertraline", "Paroxetine", "Venlafaxine"],
        answer: "Paroxetine",
        explanation: "Paroxetine is the SSRI in this section that learners most often associate with sedation, weight gain, and anticholinergic effects. That cluster helps distinguish it from fluoxetine or escitalopram.",
        objective: .adverseEffect,
        relatedDrugIds: ["d77"],
        tags: ["paroxetine", "sedation", "weight gain", "anticholinergic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_035",
        subsectionId: "4a",
        difficulty: .hard,
        question: "Which subsection 4a SSRI is generally avoided in pregnancy because first-trimester exposure has been associated with fetal cardiac malformations?",
        options: ["Sertraline", "Escitalopram", "Paroxetine", "Fluoxetine", "Venlafaxine"],
        answer: "Paroxetine",
        explanation: "Paroxetine is the high-yield pregnancy exception in this section. When learners remember one SSRI to be cautious about in pregnancy, this is usually the one.",
        objective: .contraindication,
        relatedDrugIds: ["d77"],
        tags: ["paroxetine", "pregnancy", "fetal risk"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_036",
        subsectionId: "4a",
        difficulty: .medium,
        question: "Which adverse effect is common across SSRIs and SNRIs and should routinely be discussed before starting treatment?",
        options: ["Sexual dysfunction", "Agranulocytosis", "Nephrotoxicity", "Blue-gray skin discoloration", "Gingival hyperplasia"],
        answer: "Sexual dysfunction",
        explanation: "Sexual dysfunction is a common, high-yield adverse effect across SSRIs and SNRIs. Discussing it up front improves adherence and sets expectations realistically.",
        objective: .adverseEffect,
        relatedDrugIds: ["d74", "d75", "d76", "d77", "d78", "d79"],
        tags: ["sexual dysfunction", "class effect"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_037",
        subsectionId: "4a",
        difficulty: .hard,
        question: "A patient recently started on an SSRI develops agitation, diaphoresis, tremor, hyperreflexia, and fever after another serotonergic medication is added. Which syndrome is most likely?",
        options: ["Serotonin syndrome", "Neuroleptic malignant syndrome", "Tardive dyskinesia", "Lithium nephrogenic diabetes insipidus", "Myasthenic crisis"],
        answer: "Serotonin syndrome",
        explanation: "Serotonin syndrome is the classic toxic interaction syndrome for SSRIs and SNRIs, especially when combined with MAOIs, linezolid, or other serotonergic drugs.",
        objective: .adverseEffect,
        relatedDrugIds: ["d74", "d75", "d76", "d77", "d78", "d79"],
        tags: ["serotonin syndrome", "interaction", "class effect"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_038",
        subsectionId: "4a",
        difficulty: .hard,
        question: "A patient with previously unrecognized bipolar disorder is started on an antidepressant and then develops decreased need for sleep, racing thoughts, impulsive behavior, and grandiosity. Which adverse psychiatric reaction should be suspected?",
        options: ["Manic activation", "Akathisia", "Delirium tremens", "Opioid withdrawal", "Absence seizure"],
        answer: "Manic activation",
        explanation: "Antidepressants can precipitate a manic switch in susceptible patients. This is why a careful psychiatric history matters before treatment is started.",
        objective: .adverseEffect,
        relatedDrugIds: ["d74", "d75", "d76", "d77", "d78", "d79"],
        tags: ["mania", "bipolar", "class warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_039",
        subsectionId: "4a",
        difficulty: .hard,
        question: "A patient taking duloxetine starts warfarin and later notices more bruising than expected. Which counseling pearl best explains this?",
        options: ["SNRIs can increase bleeding risk, especially with anticoagulants, aspirin, or NSAIDs", "Duloxetine neutralizes warfarin and causes thrombosis", "Duloxetine raises calcium and causes easy bruising", "Warfarin blocks duloxetine absorption completely", "This combination only increases blood pressure, not bleeding"],
        answer: "SNRIs can increase bleeding risk, especially with anticoagulants, aspirin, or NSAIDs",
        explanation: "Duloxetine, like other serotonin reuptake inhibitors, can increase bleeding risk. Combining it with warfarin, aspirin, or NSAIDs makes that counseling point even more important.",
        objective: .interaction,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "warfarin", "bleeding"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_040",
        subsectionId: "4a",
        difficulty: .hard,
        question: "Which subsection 4a antidepressant is a strong CYP2D6 inhibitor and is especially important to remember because it can reduce activation of tamoxifen?",
        options: ["Escitalopram", "Sertraline", "Paroxetine", "Venlafaxine", "Duloxetine"],
        answer: "Paroxetine",
        explanation: "Paroxetine is a strong CYP2D6 inhibitor. That matters because tamoxifen relies on CYP2D6 for activation, making this a classic interaction pearl.",
        objective: .interaction,
        relatedDrugIds: ["d77"],
        tags: ["paroxetine", "CYP2D6", "tamoxifen"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_041",
        subsectionId: "4a",
        difficulty: .medium,
        question: "Which subsection 4a SSRI is especially known for causing diarrhea or GI upset early in therapy?",
        options: ["Paroxetine", "Sertraline", "Escitalopram", "Fluoxetine", "Venlafaxine"],
        answer: "Sertraline",
        explanation: "Sertraline is a very common SSRI choice, but GI effects such as diarrhea and nausea are classic early counseling points.",
        objective: .adverseEffect,
        relatedDrugIds: ["d74"],
        tags: ["sertraline", "diarrhea", "GI"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_042",
        subsectionId: "4a",
        difficulty: .medium,
        question: "When starting escitalopram for an adult with major depressive disorder, what is the usual recommended starting dose?",
        options: ["5 mg once daily", "10 mg once daily", "20 mg twice daily", "40 mg once daily", "60 mg once daily"],
        answer: "10 mg once daily",
        explanation: "Escitalopram is typically started at 10 mg once daily in adults. Knowing a few signature starting doses makes the section more clinically grounded.",
        objective: .dosing,
        relatedDrugIds: ["d76"],
        tags: ["escitalopram", "dose", "10 mg"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_043",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient asks whether they can open a duloxetine delayed-release capsule and sprinkle it on food to make it easier to take. Which answer is best?",
        options: ["Yes, opening the capsule improves absorption", "Yes, but only if taken with dairy", "No, the delayed-release capsule should be swallowed whole", "No, because duloxetine must always be chewed first", "Only the evening dose can be opened"],
        answer: "No, the delayed-release capsule should be swallowed whole",
        explanation: "Duloxetine delayed-release capsules should be swallowed whole. Opening, chewing, or crushing them can interfere with the enteric coating and the way the drug is delivered.",
        objective: .dosing,
        relatedDrugIds: ["d79"],
        tags: ["duloxetine", "administration", "delayed-release"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_044",
        subsectionId: "4a",
        difficulty: .medium,
        question: "A patient feels better on venlafaxine and wants to stop it suddenly this weekend. Which counseling point is best?",
        options: ["Stopping suddenly is ideal because it prevents tolerance", "Venlafaxine should usually be tapered rather than stopped abruptly", "Venlafaxine can only be stopped suddenly if taken with food", "Abrupt discontinuation is safe if blood pressure is normal", "Venlafaxine should be replaced with an MAOI the next day"],
        answer: "Venlafaxine should usually be tapered rather than stopped abruptly",
        explanation: "Venlafaxine is one of the antidepressants most associated with discontinuation symptoms. Tapering is a much safer teaching point than telling patients they can stop it abruptly.",
        objective: .pearl,
        relatedDrugIds: ["d78"],
        tags: ["venlafaxine", "taper", "discontinuation"],
        source: .curated
    ),

    .multipleChoice(
        id: "q4a_add_045",
        subsectionId: "4a",
        difficulty: .hard,
        question: "Which subsection 4a SSRI warrants extra QT-caution at higher doses or when combined with other QT-prolonging medications?",
        options: ["Fluoxetine", "Sertraline", "Escitalopram", "Paroxetine", "Duloxetine"],
        answer: "Escitalopram",
        explanation: "Escitalopram is generally considered a clean SSRI, but QT-related caution remains a high-yield pearl, especially when higher doses or other QT-prolonging drugs are involved.",
        objective: .interaction,
        relatedDrugIds: ["d76"],
        tags: ["escitalopram", "QT", "interaction"],
        source: .curated
    )

    ]
}