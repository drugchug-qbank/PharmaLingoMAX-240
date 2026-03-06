// PharmaLingo — Module 3e (Thyroid)
// Curated Add-On Question Pack (45 questions)
// IDs: q3e_add_001 ... q3e_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 3e exists, then append:
//
//    if bank["3e"] == nil { bank["3e"] = [] }
//    bank["3e"]?.append(contentsOf: Self.curatedAddOnQuestions_3e)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d59 (Levothyroxine), d60 (Liothyronine),
//   d61 (Methimazole), d62 (Propylthiouracil/PTU).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_3e: [Question] = [

    .multipleChoice(
        id: "q3e_add_001",
        subsectionId: "3e",
        difficulty: .easy,
        question: "A patient with primary hypothyroidism is told to take Synthroid on an empty stomach and away from calcium or iron because absorption matters. What is the generic name of Synthroid?",
        options: ["Levothyroxine", "Liothyronine", "Methimazole", "Propylthiouracil (PTU)", "Pioglitazone"],
        answer: "Levothyroxine",
        explanation: "Synthroid is the brand name for levothyroxine. This is the classic first-line T4 replacement drug for chronic hypothyroidism.",
        objective: .brandGeneric,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "Synthroid", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_002",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Levothyroxine is the usual long-term thyroid hormone replacement for hypothyroidism and is commonly titrated using TSH. Which brand name matches levothyroxine?",
        options: ["Synthroid", "Cytomel", "Tapazole", "PTU", "Actos"],
        answer: "Synthroid",
        explanation: "Levothyroxine is marketed as Synthroid. Knowing this pair is high yield because it is one of the most commonly prescribed thyroid medications.",
        objective: .genericBrand,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "Synthroid", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_003",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Cytomel is the thyroid replacement product that provides active T3 and has a faster onset than T4-based therapy. What is the generic name of Cytomel?",
        options: ["Levothyroxine", "Liothyronine", "Methimazole", "Propylthiouracil (PTU)", "Semaglutide"],
        answer: "Liothyronine",
        explanation: "Cytomel is the brand name for liothyronine. Liothyronine is synthetic T3, so its onset is faster than levothyroxine.",
        objective: .brandGeneric,
        relatedDrugIds: ["d60"],
        tags: ["liothyronine", "Cytomel", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_004",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Liothyronine is synthetic T3 and reaches body tissues quickly because it does not need peripheral conversion from T4. Which brand name matches liothyronine?",
        options: ["Synthroid", "Cytomel", "Tapazole", "PTU", "Lantus"],
        answer: "Cytomel",
        explanation: "Liothyronine is sold as Cytomel. Remembering that Cytomel = T3 helps separate it from levothyroxine, which is T4.",
        objective: .genericBrand,
        relatedDrugIds: ["d60"],
        tags: ["liothyronine", "Cytomel", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_005",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Tapazole is the thionamide most commonly used as first-line drug therapy for hyperthyroidism in nonpregnant adults. What is the generic name of Tapazole?",
        options: ["Levothyroxine", "Liothyronine", "Methimazole", "Propylthiouracil (PTU)", "Metformin"],
        answer: "Methimazole",
        explanation: "Tapazole is the brand name for methimazole. Methimazole is usually preferred over PTU for most patients because PTU carries more severe liver toxicity risk.",
        objective: .brandGeneric,
        relatedDrugIds: ["d61"],
        tags: ["methimazole", "Tapazole", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_006",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Methimazole is an antithyroid drug that inhibits new thyroid hormone synthesis and is often used for Graves disease. Which brand name matches methimazole?",
        options: ["Synthroid", "Cytomel", "Tapazole", "PTU", "NovoLog"],
        answer: "Tapazole",
        explanation: "Methimazole is marketed as Tapazole. This is a core brand-generic pair for the hyperthyroidism section.",
        objective: .genericBrand,
        relatedDrugIds: ["d61"],
        tags: ["methimazole", "Tapazole", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_007",
        subsectionId: "3e",
        difficulty: .easy,
        question: "A pregnant patient in the first trimester with Graves disease may be switched to the antithyroid drug commonly abbreviated PTU. What is the full generic name of PTU?",
        options: ["Methimazole", "Levothyroxine", "Liothyronine", "Propylthiouracil (PTU)", "Empagliflozin"],
        answer: "Propylthiouracil (PTU)",
        explanation: "PTU stands for propylthiouracil. It is high yield because it is often remembered as the first-trimester and thyroid-storm thionamide.",
        objective: .brandGeneric,
        relatedDrugIds: ["d62"],
        tags: ["propylthiouracil", "PTU", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_008",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Propylthiouracil is the thionamide that also blocks peripheral conversion of T4 to T3, making it useful in thyroid storm. In this subsection, what shorthand or brand is associated with propylthiouracil?",
        options: ["PTU", "Tapazole", "Synthroid", "Cytomel", "Farxiga"],
        answer: "PTU",
        explanation: "Propylthiouracil is commonly referred to as PTU. The shorthand itself is so common that many learners encounter PTU before they fully memorize the generic name.",
        objective: .genericBrand,
        relatedDrugIds: ["d62"],
        tags: ["propylthiouracil", "PTU", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_009",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Levothyroxine and liothyronine are both used for hypothyroidism, but they do not lower thyroid hormone production. They belong to which broad category?",
        options: ["Thyroid hormone replacement", "Thionamide antithyroid therapy", "SGLT2 inhibitor therapy", "Biguanide therapy", "GLP-1 receptor agonist therapy"],
        answer: "Thyroid hormone replacement",
        explanation: "Levothyroxine and liothyronine replace thyroid hormone rather than suppress thyroid synthesis. That is the key contrast with methimazole and PTU.",
        objective: .classId,
        relatedDrugIds: ["d59", "d60"],
        tags: ["class", "thyroid hormone replacement"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_010",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Methimazole and PTU lower thyroid hormone production rather than replace missing hormone. Which class best describes them?",
        options: ["Thionamides", "Thyroid hormone replacements", "Sulfonylureas", "SGLT2 inhibitors", "DPP-4 inhibitors"],
        answer: "Thionamides",
        explanation: "Methimazole and propylthiouracil are thionamide antithyroid drugs. If you identify the class, you should think hyperthyroidism, not hypothyroidism.",
        objective: .classId,
        relatedDrugIds: ["d61", "d62"],
        tags: ["class", "thionamide"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_011",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Which drug from this section is synthetic T3 rather than T4?",
        options: ["Levothyroxine", "Liothyronine", "Methimazole", "Propylthiouracil (PTU)", "Insulin glargine"],
        answer: "Liothyronine",
        explanation: "Liothyronine is synthetic T3. Levothyroxine is synthetic T4, while methimazole and PTU are antithyroid drugs.",
        objective: .classId,
        relatedDrugIds: ["d60"],
        tags: ["liothyronine", "T3", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_012",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Which drug from this section is synthetic T4 and is usually the standard first-line replacement choice for chronic hypothyroidism?",
        options: ["Levothyroxine", "Liothyronine", "Methimazole", "Propylthiouracil (PTU)", "Metformin"],
        answer: "Levothyroxine",
        explanation: "Levothyroxine is synthetic T4 and is the usual first-line thyroid replacement drug for long-term hypothyroidism management.",
        objective: .classId,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "T4", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_013",
        subsectionId: "3e",
        difficulty: .easy,
        question: "A patient with elevated TSH, fatigue, constipation, and cold intolerance needs chronic replacement therapy for primary hypothyroidism. Which drug is the usual first-line choice?",
        options: ["Levothyroxine", "Liothyronine", "Methimazole", "Propylthiouracil (PTU)", "Semaglutide"],
        answer: "Levothyroxine",
        explanation: "Levothyroxine is the standard first-line replacement therapy for most patients with hypothyroidism. It provides T4, which is then converted peripherally to T3.",
        objective: .indication,
        relatedDrugIds: ["d59"],
        tags: ["hypothyroidism", "first-line"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_014",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A nonpregnant adult with symptomatic Graves disease wants medication to lower thyroid hormone synthesis. Which antithyroid drug is generally preferred for most patients?",
        options: ["Methimazole", "Propylthiouracil (PTU)", "Levothyroxine", "Liothyronine", "Pioglitazone"],
        answer: "Methimazole",
        explanation: "Methimazole is generally preferred for most nonpregnant patients with hyperthyroidism. PTU is usually reserved for special situations such as the first trimester or thyroid storm.",
        objective: .indication,
        relatedDrugIds: ["d61", "d62"],
        tags: ["hyperthyroidism", "Graves disease", "first-line"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_015",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient newly found to be hyperthyroid is 9 weeks pregnant. Which antithyroid drug is generally preferred in the first trimester?",
        options: ["Propylthiouracil (PTU)", "Methimazole", "Levothyroxine", "Liothyronine", "Metformin"],
        answer: "Propylthiouracil (PTU)",
        explanation: "PTU is generally preferred when an antithyroid drug is needed during or just prior to the first trimester. Methimazole carries first-trimester fetal harm concerns.",
        objective: .indication,
        relatedDrugIds: ["d62", "d61"],
        tags: ["pregnancy", "hyperthyroidism", "first trimester"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_016",
        subsectionId: "3e",
        difficulty: .medium,
        question: "An ICU patient with thyroid storm needs an antithyroid drug that not only reduces new hormone synthesis but also decreases peripheral conversion of T4 to T3. Which drug fits best?",
        options: ["Propylthiouracil (PTU)", "Methimazole", "Levothyroxine", "Liothyronine", "Dapagliflozin"],
        answer: "Propylthiouracil (PTU)",
        explanation: "PTU is high yield in thyroid storm because it reduces new hormone synthesis and also inhibits peripheral conversion of T4 to T3.",
        objective: .indication,
        relatedDrugIds: ["d62"],
        tags: ["thyroid storm", "PTU", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_017",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient with differentiated thyroid cancer is prescribed a thyroid hormone to suppress TSH after surgery. Which drug is most commonly used for this purpose?",
        options: ["Levothyroxine", "Liothyronine", "Methimazole", "Propylthiouracil (PTU)", "Glipizide"],
        answer: "Levothyroxine",
        explanation: "Levothyroxine is used not only for hypothyroidism replacement but also for TSH suppression in selected thyroid cancer settings.",
        objective: .indication,
        relatedDrugIds: ["d59"],
        tags: ["TSH suppression", "thyroid cancer", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_018",
        subsectionId: "3e",
        difficulty: .medium,
        question: "When a clinician wants the thyroid hormone replacement that is already active and has quicker onset and offset than T4, which drug best fits that description?",
        options: ["Liothyronine", "Levothyroxine", "Methimazole", "Propylthiouracil (PTU)", "Empagliflozin"],
        answer: "Liothyronine",
        explanation: "Liothyronine is synthetic T3, so it has a faster onset and a shorter half-life than levothyroxine. Levothyroxine is still the usual first-line chronic replacement option.",
        objective: .pearl,
        relatedDrugIds: ["d60", "d59"],
        tags: ["liothyronine", "rapid onset", "shorter half-life"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_019",
        subsectionId: "3e",
        difficulty: .medium,
        question: "Levothyroxine works mainly by providing which hormone that peripheral tissues can convert to the active form?",
        options: ["T4, which can be converted peripherally to T3", "T3, which is converted to T4 in the liver", "TSH, which stimulates the thyroid gland", "Iodide, which is trapped in the thyroid", "Calcitonin, which lowers calcium"],
        answer: "T4, which can be converted peripherally to T3",
        explanation: "Levothyroxine is synthetic T4. Much of the body's active T3 is produced by peripheral conversion of T4.",
        objective: .moa,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "T4", "MOA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_020",
        subsectionId: "3e",
        difficulty: .medium,
        question: "Liothyronine works by directly providing which active thyroid hormone?",
        options: ["T4", "T3", "TSH", "Reverse T3", "Thyroglobulin"],
        answer: "T3",
        explanation: "Liothyronine is synthetic T3. Because it is already the active hormone, it acts faster than levothyroxine.",
        objective: .moa,
        relatedDrugIds: ["d60"],
        tags: ["liothyronine", "T3", "MOA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_021",
        subsectionId: "3e",
        difficulty: .medium,
        question: "Methimazole lowers thyroid hormone levels by doing which of the following?",
        options: ["It inhibits new thyroid hormone synthesis", "It directly replaces missing T4", "It directly replaces missing T3", "It destroys stored thyroid hormone immediately", "It blocks intestinal calcium absorption"],
        answer: "It inhibits new thyroid hormone synthesis",
        explanation: "Methimazole inhibits thyroid hormone synthesis. It does not replace thyroid hormone and it does not instantly eliminate hormone already stored in the gland.",
        objective: .moa,
        relatedDrugIds: ["d61"],
        tags: ["methimazole", "MOA", "thyroid hormone synthesis"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_022",
        subsectionId: "3e",
        difficulty: .hard,
        question: "Which statement best differentiates PTU from methimazole at the mechanism level?",
        options: ["PTU also blocks peripheral conversion of T4 to T3", "Methimazole is the only thionamide that lowers new hormone synthesis", "PTU is a thyroid hormone replacement drug", "Methimazole works only after it destroys preformed T4", "PTU raises TSH to lower thyroid hormone levels"],
        answer: "PTU also blocks peripheral conversion of T4 to T3",
        explanation: "Both thionamides inhibit new thyroid hormone synthesis, but PTU also inhibits peripheral conversion of T4 to T3. That is the classic thyroid-storm pearl.",
        objective: .moa,
        relatedDrugIds: ["d62", "d61"],
        tags: ["PTU", "MOA", "T4 to T3"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_023",
        subsectionId: "3e",
        difficulty: .hard,
        question: "Why does a patient with Graves disease usually not become euthyroid immediately after starting methimazole?",
        options: ["Stored thyroid hormone must still be released and cleared before levels fall", "The drug only works after being converted to T3", "Methimazole first raises thyroid hormone levels before lowering them", "Hyperthyroidism must always be treated with IV medication first", "The thyroid gland becomes temporarily resistant to all thionamides"],
        answer: "Stored thyroid hormone must still be released and cleared before levels fall",
        explanation: "Thionamides stop new hormone synthesis, but they do not inactivate hormone already stored in the thyroid or circulating in blood. That is why clinical improvement is not immediate.",
        objective: .pearl,
        relatedDrugIds: ["d61", "d62"],
        tags: ["thionamides", "stored hormone", "counseling"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_024",
        subsectionId: "3e",
        difficulty: .easy,
        question: "A patient asks how to take levothyroxine for best absorption. Which counseling point is most accurate?",
        options: ["Take it on an empty stomach 30 to 60 minutes before breakfast", "Take it only at bedtime with food", "Chew it with calcium carbonate to improve absorption", "Take it as needed when symptoms flare", "Take it with iron to stabilize the dose"],
        answer: "Take it on an empty stomach 30 to 60 minutes before breakfast",
        explanation: "Levothyroxine is best taken as a single daily dose on an empty stomach, ideally 30 to 60 minutes before breakfast. Food and certain medications can reduce absorption.",
        objective: .dosing,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "empty stomach", "administration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_025",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient takes levothyroxine with calcium carbonate, ferrous sulfate, and an antacid. Which effect is most likely?",
        options: ["Reduced levothyroxine absorption and possible undertreatment", "Instantly better absorption and a lower TSH", "Rapid destruction of thyroid hormone in the stomach", "Increased methimazole levels and agranulocytosis", "Permanent thyroid suppression after one dose"],
        answer: "Reduced levothyroxine absorption and possible undertreatment",
        explanation: "Calcium, iron, and antacids can reduce levothyroxine absorption. If taken together, the patient may appear undertreated even when the dose looks adequate on paper.",
        objective: .interaction,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "calcium", "iron", "interaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_026",
        subsectionId: "3e",
        difficulty: .medium,
        question: "After increasing a levothyroxine dose, when should TSH usually be rechecked in an adult with primary hypothyroidism?",
        options: ["6 to 8 weeks", "24 hours", "2 to 3 days", "1 week", "6 months"],
        answer: "6 to 8 weeks",
        explanation: "TSH is typically reassessed about 6 to 8 weeks after a dose change. That interval allows the new steady state to be reflected in thyroid labs.",
        objective: .monitoring,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "TSH", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_027",
        subsectionId: "3e",
        difficulty: .easy,
        question: "Which laboratory test is most useful for titrating levothyroxine in an adult with primary hypothyroidism?",
        options: ["Serum TSH", "Troponin", "Hemoglobin A1c", "ANC", "INR"],
        answer: "Serum TSH",
        explanation: "Serum TSH is the main lab used to titrate levothyroxine in primary hypothyroidism. It is the high-yield monitoring target learners should remember.",
        objective: .monitoring,
        relatedDrugIds: ["d59"],
        tags: ["TSH", "monitoring", "hypothyroidism"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_028",
        subsectionId: "3e",
        difficulty: .hard,
        question: "A patient’s TSH remains elevated despite 'taking levothyroxine every morning' and then swallowing calcium right afterward. What is the most likely explanation?",
        options: ["Calcium is reducing levothyroxine absorption", "The levothyroxine is working too well", "Methimazole is causing agranulocytosis", "PTU is increasing T4 to T3 conversion", "Liothyronine is masking hypothyroid symptoms"],
        answer: "Calcium is reducing levothyroxine absorption",
        explanation: "This is a classic absorption problem. Levothyroxine should be separated from calcium-containing products because concurrent administration can leave the patient under-replaced.",
        objective: .interaction,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "absorption", "calcium"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_029",
        subsectionId: "3e",
        difficulty: .medium,
        question: "Levothyroxine has a boxed warning that thyroid hormones should not be used for which inappropriate purpose in euthyroid patients?",
        options: ["Treatment of obesity or weight loss in euthyroid patients", "Primary hypothyroidism", "TSH suppression after thyroid cancer", "Replacement after thyroidectomy", "Hypothyroidism during pregnancy"],
        answer: "Treatment of obesity or weight loss in euthyroid patients",
        explanation: "Thyroid hormones are not appropriate weight-loss drugs in euthyroid patients. Excess dosing can cause serious or even life-threatening toxicity.",
        objective: .contraindication,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "boxed warning", "weight loss"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_030",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient taking too much levothyroxine develops palpitations, tremor, heat intolerance, and unintentional weight loss. These symptoms are most consistent with what?",
        options: ["Thyroid hormone over-replacement", "Agranulocytosis from methimazole", "Acute hepatic failure from PTU", "Progressive hypothyroidism from undertreatment", "SGLT2 inhibitor toxicity"],
        answer: "Thyroid hormone over-replacement",
        explanation: "Too much thyroid hormone produces symptoms that look like hyperthyroidism. Palpitations, tremor, heat intolerance, and weight loss are classic clues.",
        objective: .adverseEffect,
        relatedDrugIds: ["d59", "d60"],
        tags: ["overreplacement", "hyperthyroid symptoms", "adverse effects"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_031",
        subsectionId: "3e",
        difficulty: .medium,
        question: "Why are older adults and patients with coronary disease often started on lower thyroid hormone doses?",
        options: ["They may precipitate angina or arrhythmias if started too aggressively", "They are absorbed only in patients with heart disease", "They become ineffective after age 65", "They are contraindicated once CAD is diagnosed", "They always cause agranulocytosis in older adults"],
        answer: "They may precipitate angina or arrhythmias if started too aggressively",
        explanation: "Thyroid hormone overtreatment can increase heart rate and cardiac workload. That is why lower starting doses are used in older patients and those with cardiovascular disease.",
        objective: .contraindication,
        relatedDrugIds: ["d59", "d60"],
        tags: ["cardiovascular disease", "angina", "arrhythmia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_032",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient on methimazole calls with fever and severe sore throat. Which serious adverse effect should be suspected first?",
        options: ["Agranulocytosis", "Nephrogenic diabetes insipidus", "Ototoxicity", "Pancreatitis", "Lactic acidosis"],
        answer: "Agranulocytosis",
        explanation: "Methimazole can cause potentially life-threatening agranulocytosis. Fever or sore throat on therapy should trigger urgent evaluation.",
        objective: .adverseEffect,
        relatedDrugIds: ["d61"],
        tags: ["methimazole", "agranulocytosis", "fever", "sore throat"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_033",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient on PTU reports dark urine, jaundice, and right upper quadrant pain. Which high-yield toxicity makes this especially concerning?",
        options: ["Severe hepatotoxicity", "Peripheral edema", "Ototoxicity", "Thyroid cancer progression", "Severe hypoglycemia"],
        answer: "Severe hepatotoxicity",
        explanation: "PTU carries a boxed warning for severe liver injury and acute liver failure. Dark urine, jaundice, and right upper quadrant pain are major red flags.",
        objective: .adverseEffect,
        relatedDrugIds: ["d62"],
        tags: ["PTU", "hepatotoxicity", "boxed warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_034",
        subsectionId: "3e",
        difficulty: .hard,
        question: "Why is methimazole generally avoided when an antithyroid drug is needed during the first trimester of pregnancy?",
        options: ["It can cause fetal harm and congenital malformations when used in the first trimester", "It has no effect on thyroid hormone synthesis during pregnancy", "It always causes lifelong hypothyroidism in the mother", "It is contraindicated only after delivery", "It is less effective than levothyroxine for hypothyroidism"],
        answer: "It can cause fetal harm and congenital malformations when used in the first trimester",
        explanation: "Methimazole crosses the placenta and has first-trimester fetal harm concerns. That is why PTU is often preferred early in pregnancy when antithyroid medication is necessary.",
        objective: .contraindication,
        relatedDrugIds: ["d61", "d62"],
        tags: ["methimazole", "pregnancy", "first trimester"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_035",
        subsectionId: "3e",
        difficulty: .medium,
        question: "Why is methimazole usually preferred over PTU for long-term treatment in most nonpregnant adults with hyperthyroidism?",
        options: ["PTU carries a higher risk of severe liver injury", "Methimazole has no effect on thyroid hormone synthesis", "PTU is only available intravenously", "Methimazole is ineffective in Graves disease", "PTU cannot be used with beta blockers"],
        answer: "PTU carries a higher risk of severe liver injury",
        explanation: "Methimazole is usually preferred because PTU is more hepatotoxic. PTU is mainly saved for special situations such as the first trimester or thyroid storm.",
        objective: .pearl,
        relatedDrugIds: ["d61", "d62"],
        tags: ["methimazole", "PTU", "hepatotoxicity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_036",
        subsectionId: "3e",
        difficulty: .medium,
        question: "Which serious adverse effect can occur with BOTH methimazole and PTU and should prompt urgent evaluation if fever or sore throat develops?",
        options: ["Agranulocytosis", "Hypoglycemia", "Osteoporosis", "Myopathy", "Pulmonary fibrosis"],
        answer: "Agranulocytosis",
        explanation: "Both thionamides can cause agranulocytosis. Fever and sore throat are the classic teaching clues that should never be ignored.",
        objective: .adverseEffect,
        relatedDrugIds: ["d61", "d62"],
        tags: ["agranulocytosis", "methimazole", "PTU"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_037",
        subsectionId: "3e",
        difficulty: .hard,
        question: "An older patient with ischemic heart disease is started on liothyronine instead of levothyroxine. Which problem deserves especially close monitoring early on?",
        options: ["Angina or arrhythmias from cardiac stimulation", "Irreversible nephrotoxicity", "Severe hypoglycemia", "Ototoxic hearing loss", "Bronchospasm from beta-2 blockade"],
        answer: "Angina or arrhythmias from cardiac stimulation",
        explanation: "Liothyronine is the active T3 form and acts quickly. In older patients or those with cardiovascular disease, overtreatment can precipitate angina or arrhythmias.",
        objective: .monitoring,
        relatedDrugIds: ["d60"],
        tags: ["liothyronine", "cardiac", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_038",
        subsectionId: "3e",
        difficulty: .hard,
        question: "In suspected myxedema coma, which statement is most accurate regarding oral thyroid hormone tablets?",
        options: ["Oral thyroid hormone products are not recommended because absorption can be unpredictable; IV thyroid hormone is preferred", "Oral methimazole is the standard first-line treatment for myxedema coma", "Liothyronine tablets are preferred over IV therapy because they are absorbed faster in shock", "PTU is preferred because it blocks peripheral conversion of T4 to T3", "No thyroid hormone is used in myxedema coma"],
        answer: "Oral thyroid hormone products are not recommended because absorption can be unpredictable; IV thyroid hormone is preferred",
        explanation: "Myxedema coma is a life-threatening emergency, and oral absorption may be unreliable. The high-yield pearl is to think IV thyroid hormone rather than oral tablets.",
        objective: .contraindication,
        relatedDrugIds: ["d59", "d60"],
        tags: ["myxedema coma", "oral therapy", "IV therapy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_039",
        subsectionId: "3e",
        difficulty: .hard,
        question: "A patient with hypothyroidism is stable on warfarin and then starts levothyroxine. What monitoring change is most appropriate?",
        options: ["Increase INR monitoring because thyroid replacement can enhance anticoagulant response", "Stop warfarin permanently because it becomes ineffective", "Add methimazole to prevent over-anticoagulation", "Switch warfarin to aspirin immediately", "No monitoring change is needed"],
        answer: "Increase INR monitoring because thyroid replacement can enhance anticoagulant response",
        explanation: "Levothyroxine can increase the response to oral anticoagulants. That means INR or coagulation monitoring should be watched closely when thyroid replacement is initiated or increased.",
        objective: .interaction,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "warfarin", "INR"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_040",
        subsectionId: "3e",
        difficulty: .hard,
        question: "A patient with diabetes starts levothyroxine replacement and later notices higher glucose readings. Which explanation is most accurate?",
        options: ["Thyroid hormone replacement can worsen glycemic control and increase antidiabetic requirements", "Levothyroxine directly causes insulin release and hypoglycemia", "Methimazole blocks metformin absorption", "PTU improves insulin sensitivity and lowers A1c", "Liothyronine permanently cures diabetes"],
        answer: "Thyroid hormone replacement can worsen glycemic control and increase antidiabetic requirements",
        explanation: "Thyroid hormone therapy can worsen glycemic control in some patients with diabetes. That is a useful cross-module pearl when endocrine sections start connecting to each other.",
        objective: .interaction,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "diabetes", "glycemic control"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_041",
        subsectionId: "3e",
        difficulty: .hard,
        question: "A postmenopausal woman has been chronically over-replaced with thyroid hormone. Which long-term complication becomes more concerning?",
        options: ["Decreased bone mineral density from over-replacement", "Agranulocytosis from thionamides", "Acute liver failure from PTU", "Pancreatitis from GLP-1 therapy", "Ototoxicity from loop diuretics"],
        answer: "Decreased bone mineral density from over-replacement",
        explanation: "Chronic thyroid hormone over-replacement can increase bone resorption and lower bone mineral density. This is especially important in postmenopausal women.",
        objective: .adverseEffect,
        relatedDrugIds: ["d59", "d60"],
        tags: ["bone mineral density", "overreplacement", "postmenopausal"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_042",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient who becomes pregnant while taking levothyroxine for hypothyroidism asks whether to stop it. Which counseling is most accurate?",
        options: ["Do not stop; hypothyroidism should be treated during pregnancy and dose needs may increase", "Stop immediately and restart after delivery", "Switch all pregnant patients to methimazole", "Take levothyroxine only if TSH is suppressed", "Replace it with liothyronine because T3 does not cross the placenta"],
        answer: "Do not stop; hypothyroidism should be treated during pregnancy and dose needs may increase",
        explanation: "Levothyroxine should not be stopped during pregnancy when hypothyroidism is present. Pregnancy can increase thyroid hormone requirements, so monitoring and dose adjustment may be needed.",
        objective: .pearl,
        relatedDrugIds: ["d59"],
        tags: ["pregnancy", "levothyroxine", "counseling"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_043",
        subsectionId: "3e",
        difficulty: .medium,
        question: "A patient says, 'I take Synthroid with breakfast and my iron supplement because it’s easier to remember.' Which correction is best?",
        options: ["Take levothyroxine by itself on an empty stomach and separate iron by at least 4 hours", "Keep taking both together because iron improves thyroid absorption", "Move both to lunch and take with calcium", "Take levothyroxine only when symptoms appear", "Replace levothyroxine with methimazole"],
        answer: "Take levothyroxine by itself on an empty stomach and separate iron by at least 4 hours",
        explanation: "Iron can reduce levothyroxine absorption. Good counseling often fixes an apparently 'wrong dose' without changing the prescription strength.",
        objective: .interaction,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "iron", "counseling"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_044",
        subsectionId: "3e",
        difficulty: .hard,
        question: "A patient cannot tolerate methimazole and is not a good candidate for surgery or radioactive iodine. Which antithyroid drug is typically reserved in that scenario?",
        options: ["Propylthiouracil (PTU)", "Methimazole", "Levothyroxine", "Liothyronine", "Semaglutide"],
        answer: "Propylthiouracil (PTU)",
        explanation: "PTU is generally reserved for patients who cannot tolerate methimazole or for special scenarios like the first trimester and thyroid storm.",
        objective: .indication,
        relatedDrugIds: ["d62", "d61"],
        tags: ["PTU", "reserved use", "intolerance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3e_add_045",
        subsectionId: "3e",
        difficulty: .hard,
        question: "Even when the microgram strength is unchanged, which change can justify rechecking thyroid labs because of possible differences in bioavailability or absorption?",
        options: ["Switching to a different levothyroxine product or manufacturer", "Eating lunch 6 hours after the dose", "Using methimazole for Graves disease", "Checking ANC while on PTU", "Adding a beta blocker for tremor"],
        answer: "Switching to a different levothyroxine product or manufacturer",
        explanation: "Changing levothyroxine products can alter thyroid balance in some patients. Rechecking labs after a switch helps confirm the patient remains appropriately replaced.",
        objective: .monitoring,
        relatedDrugIds: ["d59"],
        tags: ["levothyroxine", "product switching", "TSH"],
        source: .curated
    )

    ]
}