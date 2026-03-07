// PharmaLingo — Module 4c (Antipsychotics)
// Curated Add-On Question Pack (45 questions)
// IDs: q4c_add_001 ... q4c_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 4c exists, then append:
//
//    if bank["4c"] == nil { bank["4c"] = [] }
//    bank["4c"]?.append(contentsOf: Self.curatedAddOnQuestions_4c)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d86 (Quetiapine), d87 (Risperidone),
//   d88 (Aripiprazole), d89 (Olanzapine), d90 (Clozapine), d91 (Haloperidol).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_4c: [Question] = [
.multipleChoice(
    id: "q4c_add_001",
    subsectionId: "4c",
    difficulty: .easy,
    question: "A patient with schizophrenia is switched to Abilify, an atypical antipsychotic remembered for partial D2 agonism and for causing akathisia more often than major metabolic syndrome. What is the generic name of Abilify?",
    options: ["Aripiprazole", "Risperidone", "Quetiapine", "Olanzapine", "Haloperidol"],
    answer: "Aripiprazole",
    explanation: "Abilify is the brand name for aripiprazole. Aripiprazole is the unique atypical in this subsection that is best remembered for partial D2 agonism and akathisia.",
    objective: .brandGeneric,
    relatedDrugIds: ["d88"],
    tags: ["aripiprazole", "Abilify", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_002",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Aripiprazole is an atypical antipsychotic used for schizophrenia, bipolar disorder, and as an adjunct in major depressive disorder. Which brand name matches aripiprazole?",
    options: ["Abilify", "Risperdal", "Seroquel", "Zyprexa", "Clozaril"],
    answer: "Abilify",
    explanation: "Aripiprazole is marketed as Abilify. Pairing the brand with the partial D2 agonist pearl helps separate it from the more metabolically heavy atypicals.",
    objective: .genericBrand,
    relatedDrugIds: ["d88"],
    tags: ["aripiprazole", "Abilify", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_003",
    subsectionId: "4c",
    difficulty: .easy,
    question: "A psychiatrist reaches for Clozaril in a patient with treatment-resistant schizophrenia, knowing the drug is famous for ANC monitoring because of severe neutropenia risk. What is the generic name of Clozaril?",
    options: ["Clozapine", "Olanzapine", "Quetiapine", "Haloperidol", "Aripiprazole"],
    answer: "Clozapine",
    explanation: "Clozaril is the brand name for clozapine. Clozapine is the classic treatment-resistant schizophrenia drug and is high yield for neutropenia monitoring.",
    objective: .brandGeneric,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "Clozaril", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_004",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Clozapine is the classic antipsychotic reserved for treatment-resistant schizophrenia and recurrent suicidal behavior in schizophrenia-spectrum illness because of its unique efficacy despite major monitoring burdens. Which brand name matches clozapine?",
    options: ["Clozaril", "Haldol", "Abilify", "Zyprexa", "Risperdal"],
    answer: "Clozaril",
    explanation: "Clozapine is marketed as Clozaril. Remembering that clozapine is the “special monitoring” antipsychotic makes this pair stick.",
    objective: .genericBrand,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "Clozaril", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_005",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Haldol is a high-potency first-generation antipsychotic often remembered for strong D2 blockade, acute dystonia, parkinsonism, and QT concerns. What is the generic name of Haldol?",
    options: ["Haloperidol", "Risperidone", "Olanzapine", "Quetiapine", "Clozapine"],
    answer: "Haloperidol",
    explanation: "Haldol is the brand name for haloperidol. Haloperidol is the high-potency typical antipsychotic in this subsection and is a classic EPS drug.",
    objective: .brandGeneric,
    relatedDrugIds: ["d91"],
    tags: ["haloperidol", "Haldol", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_006",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Haloperidol is a high-potency typical antipsychotic used for schizophrenia and acute psychosis, and it is especially high yield for EPS and neuroleptic malignant syndrome. Which brand name matches haloperidol?",
    options: ["Haldol", "Abilify", "Clozaril", "Seroquel", "Zyprexa"],
    answer: "Haldol",
    explanation: "Haloperidol is marketed as Haldol. On exams, Haldol should immediately make you think of strong D2 blockade and high EPS risk.",
    objective: .genericBrand,
    relatedDrugIds: ["d91"],
    tags: ["haloperidol", "Haldol", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_007",
    subsectionId: "4c",
    difficulty: .easy,
    question: "A patient gains weight rapidly after starting Zyprexa, an atypical antipsychotic known for major metabolic risk. What is the generic name of Zyprexa?",
    options: ["Olanzapine", "Quetiapine", "Risperidone", "Aripiprazole", "Clozapine"],
    answer: "Olanzapine",
    explanation: "Zyprexa is the brand name for olanzapine. Olanzapine is one of the highest-yield atypicals for weight gain, glucose problems, and lipid abnormalities.",
    objective: .brandGeneric,
    relatedDrugIds: ["d89"],
    tags: ["olanzapine", "Zyprexa", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_008",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Olanzapine is an atypical antipsychotic used for schizophrenia and bipolar disorder and is especially remembered for weight gain, hyperglycemia, and dyslipidemia. Which brand name matches olanzapine?",
    options: ["Zyprexa", "Seroquel", "Risperdal", "Abilify", "Haldol"],
    answer: "Zyprexa",
    explanation: "Olanzapine is marketed as Zyprexa. Linking the brand to the highest metabolic-risk pearl is a very efficient way to remember it.",
    objective: .genericBrand,
    relatedDrugIds: ["d89"],
    tags: ["olanzapine", "Zyprexa", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_009",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Seroquel is often remembered as one of the most sedating atypical antipsychotics and is also used as adjunctive therapy in major depressive disorder. What is the generic name of Seroquel?",
    options: ["Quetiapine", "Risperidone", "Aripiprazole", "Olanzapine", "Haloperidol"],
    answer: "Quetiapine",
    explanation: "Seroquel is the brand name for quetiapine. Quetiapine is high yield for sedation, orthostatic hypotension, and adjunctive use in major depressive disorder.",
    objective: .brandGeneric,
    relatedDrugIds: ["d86"],
    tags: ["quetiapine", "Seroquel", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_010",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Quetiapine is an atypical antipsychotic used for schizophrenia, bipolar disorder, and as an adjunct in MDD, and students often remember it for sedation and orthostatic hypotension. Which brand name matches quetiapine?",
    options: ["Seroquel", "Zyprexa", "Clozaril", "Abilify", "Risperdal"],
    answer: "Seroquel",
    explanation: "Quetiapine is marketed as Seroquel. Seroquel is the brand that should make you think “sedating atypical.”",
    objective: .genericBrand,
    relatedDrugIds: ["d86"],
    tags: ["quetiapine", "Seroquel", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_011",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Risperdal is an atypical antipsychotic that stands out because, compared with many atypicals, it is more likely to cause EPS and hyperprolactinemia. What is the generic name of Risperdal?",
    options: ["Risperidone", "Aripiprazole", "Quetiapine", "Olanzapine", "Haloperidol"],
    answer: "Risperidone",
    explanation: "Risperdal is the brand name for risperidone. Among the atypicals in this subsection, risperidone is the one most often linked to prolactin elevation and EPS.",
    objective: .brandGeneric,
    relatedDrugIds: ["d87"],
    tags: ["risperidone", "Risperdal", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_012",
    subsectionId: "4c",
    difficulty: .easy,
    question: "Risperidone is an atypical antipsychotic used for schizophrenia and bipolar mania, and it is especially high yield for prolactin elevation. Which brand name matches risperidone?",
    options: ["Risperdal", "Abilify", "Seroquel", "Haldol", "Zyprexa"],
    answer: "Risperdal",
    explanation: "Risperidone is marketed as Risperdal. When you hear Risperdal, think prolactin, EPS, and an atypical that can feel a little more “typical” than its peers.",
    objective: .genericBrand,
    relatedDrugIds: ["d87"],
    tags: ["risperidone", "Risperdal", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_013",
    subsectionId: "4c",
    difficulty: .medium,
    question: "When comparing drugs in this subsection, one is a first-generation antipsychotic while the others are second-generation agents. Which drug is the typical antipsychotic?",
    options: ["Haloperidol", "Aripiprazole", "Clozapine", "Olanzapine", "Quetiapine"],
    answer: "Haloperidol",
    explanation: "Haloperidol is the typical, first-generation antipsychotic in this group. The others in this subsection are atypical, second-generation agents.",
    objective: .classId,
    relatedDrugIds: ["d91"],
    tags: ["typical", "antipsychotic", "class"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_014",
    subsectionId: "4c",
    difficulty: .medium,
    question: "Most antipsychotics are taught as dopamine D2 antagonists, but one drug in this subsection is the notable exception because its efficacy is linked to partial agonist activity at D2 and 5-HT1A receptors with 5-HT2A antagonism. Which drug is it?",
    options: ["Aripiprazole", "Haloperidol", "Risperidone", "Olanzapine", "Quetiapine"],
    answer: "Aripiprazole",
    explanation: "Aripiprazole is the unique partial D2 agonist in this subsection. That mechanism helps explain why it feels different from pure D2 blockers such as haloperidol.",
    objective: .moa,
    relatedDrugIds: ["d88"],
    tags: ["partial D2 agonist", "mechanism", "aripiprazole"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_015",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient with schizophrenia has failed adequate trials of two other antipsychotics. Which drug is the classic next-step agent because of its unique efficacy in treatment-resistant schizophrenia?",
    options: ["Clozapine", "Haloperidol", "Risperidone", "Quetiapine", "Aripiprazole"],
    answer: "Clozapine",
    explanation: "Clozapine is the classic high-yield answer for treatment-resistant schizophrenia. Its special efficacy is why clinicians accept its significant monitoring burden.",
    objective: .indication,
    relatedDrugIds: ["d90"],
    tags: ["treatment-resistant schizophrenia", "clozapine"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_016",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient with schizophrenia and recurrent suicidal behavior needs the antipsychotic most associated with reducing suicidal behavior in schizophrenia-spectrum illness. Which drug is the best match?",
    options: ["Clozapine", "Olanzapine", "Haloperidol", "Quetiapine", "Risperidone"],
    answer: "Clozapine",
    explanation: "Clozapine is the standout antipsychotic for treatment-resistant schizophrenia and is also uniquely remembered for reducing recurrent suicidal behavior in schizophrenia-spectrum illness.",
    objective: .pearl,
    relatedDrugIds: ["d90"],
    tags: ["suicidality", "clozapine", "schizophrenia"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_017",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient already has obesity, prediabetes, and high triglycerides. Among these antipsychotics, which drug is most notorious for worsening weight gain and metabolic syndrome?",
    options: ["Olanzapine", "Aripiprazole", "Haloperidol", "Risperidone", "Quetiapine"],
    answer: "Olanzapine",
    explanation: "Olanzapine is the metabolic heavyweight of this subsection. It is especially high yield for weight gain, hyperglycemia, and dyslipidemia.",
    objective: .adverseEffect,
    relatedDrugIds: ["d89"],
    tags: ["olanzapine", "weight gain", "metabolic syndrome"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_018",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient with psychosis and severe insomnia is started on an atypical antipsychotic that is commonly remembered as one of the most sedating agents in the class. Which drug best fits that description?",
    options: ["Quetiapine", "Aripiprazole", "Risperidone", "Haloperidol", "Olanzapine"],
    answer: "Quetiapine",
    explanation: "Quetiapine is the most classically sedating atypical in this subsection. That sedation pearl is one reason it is often remembered in nighttime or poor-sleep scenarios.",
    objective: .pearl,
    relatedDrugIds: ["d86"],
    tags: ["quetiapine", "sedation", "sleep"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_019",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient develops marked akathisia, pacing, and inner restlessness soon after starting an antipsychotic that is otherwise often chosen because it is relatively weight-neutral. Which drug is the most likely culprit?",
    options: ["Aripiprazole", "Olanzapine", "Clozapine", "Quetiapine", "Risperidone"],
    answer: "Aripiprazole",
    explanation: "Aripiprazole is often chosen when weight gain is a concern, but akathisia is one of its most testable adverse effects. That “weight-neutral but restless” pattern is classic.",
    objective: .adverseEffect,
    relatedDrugIds: ["d88"],
    tags: ["aripiprazole", "akathisia", "weight neutral"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_020",
    subsectionId: "4c",
    difficulty: .medium,
    question: "Compared with other atypical antipsychotics in this subsection, which one is most associated with hyperprolactinemia, leading to problems like galactorrhea, amenorrhea, or gynecomastia?",
    options: ["Risperidone", "Aripiprazole", "Quetiapine", "Olanzapine", "Clozapine"],
    answer: "Risperidone",
    explanation: "Risperidone is the atypical most classically linked to prolactin elevation. If a stem mentions galactorrhea or amenorrhea after an atypical antipsychotic, risperidone should jump to mind.",
    objective: .adverseEffect,
    relatedDrugIds: ["d87"],
    tags: ["risperidone", "hyperprolactinemia", "galactorrhea"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_021",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient receives a high-potency typical antipsychotic and soon develops acute dystonia with painful neck spasm and marked rigidity. Which drug from this subsection is the most classic cause?",
    options: ["Haloperidol", "Quetiapine", "Clozapine", "Olanzapine", "Aripiprazole"],
    answer: "Haloperidol",
    explanation: "Haloperidol is the classic high-potency typical antipsychotic associated with acute dystonia and other EPS. Strong D2 blockade in the nigrostriatal pathway drives this effect.",
    objective: .adverseEffect,
    relatedDrugIds: ["d91"],
    tags: ["haloperidol", "acute dystonia", "EPS"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_022",
    subsectionId: "4c",
    difficulty: .medium,
    question: "Before starting one antipsychotic in this subsection, you must obtain a baseline absolute neutrophil count because the drug can cause severe neutropenia. Which drug requires that monitoring?",
    options: ["Clozapine", "Risperidone", "Aripiprazole", "Quetiapine", "Haloperidol"],
    answer: "Clozapine",
    explanation: "Clozapine is the antipsychotic tied to baseline and ongoing ANC monitoring because of severe neutropenia risk. No other drug in this subsection is monitored this way.",
    objective: .monitoring,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "ANC", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_023",
    subsectionId: "4c",
    difficulty: .hard,
    question: "For most patients, what baseline ANC is generally recommended before initiating clozapine therapy?",
    options: ["At least 1500/μL", "At least 1000/μL", "At least 500/μL", "At least 2000/μL", "Any measurable ANC is acceptable"],
    answer: "At least 1500/μL",
    explanation: "For the general population, clozapine initiation requires a baseline ANC of at least 1500/μL. The threshold is different for patients with documented benign ethnic neutropenia.",
    objective: .monitoring,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "ANC 1500", "baseline"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_024",
    subsectionId: "4c",
    difficulty: .hard,
    question: "For a patient with documented benign ethnic neutropenia, what baseline ANC threshold is generally used before starting clozapine?",
    options: ["At least 1000/μL", "At least 1500/μL", "At least 500/μL", "At least 2000/μL", "ANC monitoring is not needed"],
    answer: "At least 1000/μL",
    explanation: "In patients with documented benign ethnic neutropenia, the baseline ANC threshold before starting clozapine is at least 1000/μL. This is a favorite board-style distinction.",
    objective: .monitoring,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "BEN", "ANC 1000"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_025",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient taking clozapine develops fever and sore throat. Which complication should this symptom combination make you worry about first?",
    options: ["Severe neutropenia", "Hyperprolactinemia", "Tardive dyskinesia", "QT prolongation", "Cataracts"],
    answer: "Severe neutropenia",
    explanation: "Fever and sore throat on clozapine should immediately raise concern for severe neutropenia and infection risk. This is one of the most important clozapine counseling pearls.",
    objective: .adverseEffect,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "fever", "neutropenia"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_026",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient with treatment-resistant schizophrenia would otherwise be a good candidate for clozapine, but they cannot reliably return for scheduled lab follow-up. Which concern makes that especially problematic?",
    options: ["Clozapine requires ongoing ANC monitoring for severe neutropenia risk", "Clozapine must be titrated by INR", "Clozapine requires daily troponin forever", "Clozapine is unsafe unless potassium stays below 3.0 mEq/L", "Clozapine cannot be used unless the patient also takes lithium"],
    answer: "Clozapine requires ongoing ANC monitoring for severe neutropenia risk",
    explanation: "Clozapine’s unique efficacy comes with a unique monitoring burden: ongoing ANC checks because of severe neutropenia risk. If reliable lab follow-up is impossible, that is a major practical problem.",
    objective: .contraindication,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "ANC monitoring", "follow-up"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_027",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient on clozapine develops worsening constipation, abdominal distention, and very infrequent bowel movements. Which clozapine pearl best explains why this is treated seriously rather than as a minor nuisance?",
    options: ["Clozapine can cause severe GI hypomotility that may progress to ileus", "Constipation proves the drug is working and usually needs no action", "This pattern is most characteristic of haloperidol, not clozapine", "Constipation means the patient has developed NMS", "Constipation is only expected when clozapine is combined with lithium"],
    answer: "Clozapine can cause severe GI hypomotility that may progress to ileus",
    explanation: "Clozapine can cause severe gastrointestinal hypomotility, not just mild constipation. That is why bowel habits on clozapine deserve real attention and counseling.",
    objective: .adverseEffect,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "constipation", "GI hypomotility"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_028",
    subsectionId: "4c",
    difficulty: .medium,
    question: "An obese patient with schizophrenia asks which antipsychotic from this list is often favored when trying to limit weight gain and metabolic burden, while still remembering that akathisia can be an issue. Which drug best fits that teaching pearl?",
    options: ["Aripiprazole", "Olanzapine", "Clozapine", "Quetiapine", "Risperidone"],
    answer: "Aripiprazole",
    explanation: "Aripiprazole is often remembered as one of the more weight-neutral choices in this subsection. The tradeoff is that akathisia and restlessness remain very important to watch for.",
    objective: .pearl,
    relatedDrugIds: ["d88"],
    tags: ["aripiprazole", "metabolic", "akathisia"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_029",
    subsectionId: "4c",
    difficulty: .hard,
    question: "A patient taking risperidone reports breast tenderness and nipple discharge. This adverse effect most directly reflects which pharmacologic consequence of dopamine blockade?",
    options: ["Hyperprolactinemia from tuberoinfundibular D2 blockade", "Severe neutropenia from bone marrow suppression", "Muscarinic blockade causing ileus", "Histamine blockade causing sedation", "Serotonin syndrome from 5-HT excess"],
    answer: "Hyperprolactinemia from tuberoinfundibular D2 blockade",
    explanation: "Risperidone’s prolactin problems come from dopamine blockade in the tuberoinfundibular pathway. The clinical clues are galactorrhea, amenorrhea, gynecomastia, and sexual dysfunction.",
    objective: .moa,
    relatedDrugIds: ["d87"],
    tags: ["risperidone", "prolactin", "tuberoinfundibular"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_030",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient on olanzapine gains 20 pounds and develops rising fasting glucose. Which ongoing monitoring plan is most high yield for this drug?",
    options: ["Track weight, fasting glucose, and lipids over time", "Check ANC every week", "Measure INR regularly", "Monitor digoxin level and potassium", "Obtain baseline TSH and free T4 only"],
    answer: "Track weight, fasting glucose, and lipids over time",
    explanation: "Olanzapine is a major metabolic-monitoring drug. Weight, blood glucose, and lipids are the key high-yield follow-up markers.",
    objective: .monitoring,
    relatedDrugIds: ["d89"],
    tags: ["olanzapine", "glucose", "lipids", "weight"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_031",
    subsectionId: "4c",
    difficulty: .medium,
    question: "An older patient with dementia-related psychosis is being considered for an antipsychotic to control behavior. Which statement is most accurate for the antipsychotics in this subsection?",
    options: ["They carry a boxed warning for increased mortality in elderly patients with dementia-related psychosis", "They are specifically approved for dementia-related psychosis", "Only haloperidol carries this warning", "Only clozapine carries this warning", "This warning applies only to pediatric patients"],
    answer: "They carry a boxed warning for increased mortality in elderly patients with dementia-related psychosis",
    explanation: "Antipsychotics in this subsection carry a boxed warning about increased mortality in elderly patients with dementia-related psychosis. This is a class-level safety concept students must know.",
    objective: .contraindication,
    relatedDrugIds: ["d88", "d90", "d91", "d89", "d86", "d87"],
    tags: ["boxed warning", "dementia-related psychosis", "class warning"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_032",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A family member says that after starting one antipsychotic, the patient suddenly began compulsive gambling and uncontrollable shopping urges. Which drug is most associated with that counseling pearl?",
    options: ["Aripiprazole", "Haloperidol", "Risperidone", "Quetiapine", "Clozapine"],
    answer: "Aripiprazole",
    explanation: "Aripiprazole has an important counseling pearl: rare but serious impulse-control problems such as compulsive gambling, shopping, binge eating, or sexual urges.",
    objective: .adverseEffect,
    relatedDrugIds: ["d88"],
    tags: ["aripiprazole", "impulse control", "gambling"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_033",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient with schizophrenia and chronic insomnia is started on quetiapine. Which adverse effect should you particularly warn about during early titration, in addition to daytime sedation?",
    options: ["Orthostatic hypotension and dizziness", "Severe neutropenia", "Pathological gambling", "Marked prolactin elevation above all others", "Persistent dry cough"],
    answer: "Orthostatic hypotension and dizziness",
    explanation: "Quetiapine is not only sedating; it also commonly causes orthostatic dizziness early in therapy. That is a very teachable quetiapine pearl.",
    objective: .adverseEffect,
    relatedDrugIds: ["d86"],
    tags: ["quetiapine", "orthostatic hypotension", "sedation"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_034",
    subsectionId: "4c",
    difficulty: .hard,
    question: "Two drugs in this subsection are commonly remembered as adjunctive options in major depressive disorder. Which pair is correct?",
    options: ["Aripiprazole and Quetiapine", "Haloperidol and Risperidone", "Clozapine and Olanzapine", "Risperidone and Clozapine", "Olanzapine and Haloperidol"],
    answer: "Aripiprazole and Quetiapine",
    explanation: "In this subsection, aripiprazole and quetiapine are the pair most classically remembered for adjunctive use in major depressive disorder. They teach very different adverse-effect tradeoffs.",
    objective: .indication,
    relatedDrugIds: ["d88", "d86"],
    tags: ["MDD adjunct", "aripiprazole", "quetiapine"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_035",
    subsectionId: "4c",
    difficulty: .medium,
    question: "If adjunctive therapy for major depressive disorder is the goal and you want the option more likely to help sleep because of sedation, which drug best fits?",
    options: ["Quetiapine", "Aripiprazole", "Haloperidol", "Risperidone", "Clozapine"],
    answer: "Quetiapine",
    explanation: "Both aripiprazole and quetiapine may appear in MDD-adjunct teaching, but quetiapine is the one far more associated with sedation and sleepiness.",
    objective: .pearl,
    relatedDrugIds: ["d86", "d88"],
    tags: ["quetiapine", "MDD adjunct", "sedation"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_036",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient on long-term haloperidol develops lip-smacking, tongue movements, and other involuntary choreiform movements. What high-yield adverse effect does this describe?",
    options: ["Tardive dyskinesia", "Akathisia", "Severe neutropenia", "Myocarditis", "Hyperprolactinemia"],
    answer: "Tardive dyskinesia",
    explanation: "Lip-smacking and involuntary choreiform movements after chronic antipsychotic exposure describe tardive dyskinesia. Haloperidol is a classic board-style trigger for this diagnosis.",
    objective: .adverseEffect,
    relatedDrugIds: ["d91"],
    tags: ["haloperidol", "tardive dyskinesia", "long-term"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_037",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A hospitalized patient receives haloperidol and has risk factors for electrolyte abnormalities and other QT-prolonging medications. Which safety issue is especially important to remember with haloperidol?",
    options: ["QT prolongation and ventricular arrhythmia risk", "Severe neutropenia requiring ANC monitoring", "Marked hyperglycemia more than all atypicals", "Compulsive gambling", "Cataract formation"],
    answer: "QT prolongation and ventricular arrhythmia risk",
    explanation: "Haloperidol is high yield for QT prolongation, especially when other risk factors are present. This is one reason ECG awareness matters with potent typical antipsychotics.",
    objective: .monitoring,
    relatedDrugIds: ["d91"],
    tags: ["haloperidol", "QT prolongation", "ECG"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_038",
    subsectionId: "4c",
    difficulty: .medium,
    question: "A patient with treatment-resistant schizophrenia also has a history of seizures. Which antipsychotic deserves extra caution because it is especially associated with dose-related seizure risk?",
    options: ["Clozapine", "Aripiprazole", "Haloperidol", "Risperidone", "Quetiapine"],
    answer: "Clozapine",
    explanation: "Clozapine is not only a neutropenia drug; it is also high yield for seizure risk, especially as doses rise. That is part of why clozapine questions feel “heavier” than other antipsychotic questions.",
    objective: .contraindication,
    relatedDrugIds: ["d90"],
    tags: ["clozapine", "seizures", "caution"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_039",
    subsectionId: "4c",
    difficulty: .medium,
    question: "Antipsychotics are most reliable for improving which schizophrenia symptom cluster?",
    options: ["Positive symptoms such as hallucinations and delusions", "Negative symptoms such as flat affect and social withdrawal", "Cognitive symptoms more than positive symptoms", "Memory impairment from dementia", "Obsessions and compulsions"],
    answer: "Positive symptoms such as hallucinations and delusions",
    explanation: "Classically, antipsychotics work best for positive symptoms like hallucinations and delusions. They are generally less powerful for negative and cognitive symptoms.",
    objective: .classId,
    relatedDrugIds: ["d88", "d90", "d91", "d89", "d86", "d87"],
    tags: ["positive symptoms", "antipsychotics", "class effect"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_040",
    subsectionId: "4c",
    difficulty: .medium,
    question: "Several antipsychotics can trigger neuroleptic malignant syndrome, but board-style stems often make you think of a high-potency typical antipsychotic when a patient develops fever, severe rigidity, autonomic instability, and altered mental status. Which drug best fits that classic association?",
    options: ["Haloperidol", "Aripiprazole", "Quetiapine", "Risperidone", "Olanzapine"],
    answer: "Haloperidol",
    explanation: "NMS can occur with many antipsychotics, but the classic exam association is a potent typical agent such as haloperidol. Fever plus “lead-pipe” rigidity is a red-flag clue.",
    objective: .adverseEffect,
    relatedDrugIds: ["d91"],
    tags: ["haloperidol", "NMS", "rigidity"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_041",
    subsectionId: "4c",
    difficulty: .hard,
    question: "Which pairing is MOST accurate?",
    options: ["Aripiprazole — partial D2 agonist often associated with akathisia", "Haloperidol — atypical antipsychotic with major metabolic syndrome risk", "Clozapine — no need for ANC monitoring", "Risperidone — usually chosen to avoid prolactin elevation", "Quetiapine — classically highest risk of myocarditis"],
    answer: "Aripiprazole — partial D2 agonist often associated with akathisia",
    explanation: "Aripiprazole is the correctly paired drug-pearl combination here. The other options intentionally mix up hallmark associations such as prolactin with risperidone and ANC monitoring with clozapine.",
    objective: .mixedReview,
    relatedDrugIds: ["d88", "d91", "d90", "d87", "d86"],
    tags: ["pairing", "aripiprazole", "akathisia"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_042",
    subsectionId: "4c",
    difficulty: .hard,
    question: "One atypical antipsychotic in this subsection has a label pearl about periodic lens examinations during chronic treatment because of cataract or lens-change concern. Which drug is it?",
    options: ["Quetiapine", "Aripiprazole", "Risperidone", "Haloperidol", "Clozapine"],
    answer: "Quetiapine",
    explanation: "Quetiapine carries the classic lens-exam pearl. It is not the first fact students learn, but it is a distinctive and memorable quetiapine monitoring point.",
    objective: .monitoring,
    relatedDrugIds: ["d86"],
    tags: ["quetiapine", "lens exam", "cataracts"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_043",
    subsectionId: "4c",
    difficulty: .hard,
    question: "A patient stabilized on aripiprazole begins fluoxetine, a strong CYP2D6 inhibitor from your antidepressant section. Which counseling point is most accurate?",
    options: ["Aripiprazole levels can rise, so dose review may be needed", "Fluoxetine prevents all akathisia so no monitoring is needed", "Aripiprazole becomes a typical antipsychotic when combined with fluoxetine", "The combination eliminates the boxed warning about dementia-related psychosis", "Fluoxetine blocks ANC suppression, making clozapine-like monitoring unnecessary"],
    answer: "Aripiprazole levels can rise, so dose review may be needed",
    explanation: "Aripiprazole is metabolized in part by CYP2D6 and CYP3A4, so strong CYP2D6 inhibitors such as fluoxetine can raise its levels. This is a useful cross-module interaction pearl.",
    objective: .interaction,
    relatedDrugIds: ["d88"],
    tags: ["aripiprazole", "fluoxetine", "CYP2D6"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_044",
    subsectionId: "4c",
    difficulty: .medium,
    question: "Among the atypical antipsychotics in this subsection, which one most often feels “closest to a typical” because it can cause both EPS and hyperprolactinemia more than its peers?",
    options: ["Risperidone", "Aripiprazole", "Clozapine", "Quetiapine", "Olanzapine"],
    answer: "Risperidone",
    explanation: "Risperidone is the atypical most often remembered as blurring the line toward a typical because it can cause both EPS and prolactin elevation more than many of its peers.",
    objective: .pearl,
    relatedDrugIds: ["d87"],
    tags: ["risperidone", "EPS", "hyperprolactinemia"],
    source: .curated
),

.multipleChoice(
    id: "q4c_add_045",
    subsectionId: "4c",
    difficulty: .hard,
    question: "A student asks for the fastest way to separate haloperidol from the atypical antipsychotics in this subsection. Which teaching statement is best?",
    options: ["Haloperidol is a first-generation high-potency agent with higher EPS risk, whereas the atypicals generally trade some EPS risk for more metabolic effects", "Haloperidol is the atypical with the greatest metabolic burden", "Haloperidol is uniquely monitored with ANC", "Haloperidol is a partial D2 agonist", "Haloperidol is the only antipsychotic approved as adjunctive therapy in MDD"],
    answer: "Haloperidol is a first-generation high-potency agent with higher EPS risk, whereas the atypicals generally trade some EPS risk for more metabolic effects",
    explanation: "That contrast is the cleanest big-picture distinction: haloperidol is the classic high-EPS typical, while the atypicals usually shift the burden toward metabolic and other drug-specific effects.",
    objective: .mixedReview,
    relatedDrugIds: ["d91", "d88", "d90", "d89", "d86", "d87"],
    tags: ["typical vs atypical", "EPS", "metabolic"],
    source: .curated
)
    ]
}
