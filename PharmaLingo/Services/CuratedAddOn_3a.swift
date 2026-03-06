// PharmaLingo — Module 3a (Insulin Overview)
// Curated Add-On Question Pack (45 questions)
// IDs: q3a_add_001 ... q3a_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), append:
//
//    if bank["3a"] == nil { bank["3a"] = [] }
//    bank["3a"]?.append(contentsOf: Self.curatedAddOnQuestions_3a)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 options.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - Objectives + relatedDrugIds are set to support spaced repetition and mastery tracking.

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_3a: [Question] = [

        .multipleChoice(
            id: "q3a_add_001",
            subsectionId: "3a",
            difficulty: .easy,
            question: "A patient with type 1 diabetes is told to keep taking Lantus daily because it serves as the basal insulin in a basal-bolus regimen. What is the generic name of Lantus?",
            options: ["Insulin glargine", "Insulin detemir", "Insulin lispro", "Insulin aspart", "Regular insulin"],
            answer: "Insulin glargine",
            explanation: "Lantus is the brand name for insulin glargine, a long-acting basal insulin used to cover fasting and between-meal glucose needs.",
            objective: .brandGeneric,
            relatedDrugIds: ["d46"],
            tags: ["Insulin glargine", "Lantus", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_002",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Insulin glargine is a long-acting insulin chosen for steady basal coverage rather than meal-time spikes. Which brand name matches insulin glargine?",
            options: ["Lantus", "Humalog", "NovoLog", "Levemir", "Humulin R/Novolin R"],
            answer: "Lantus",
            explanation: "Insulin glargine is sold as Lantus. Remembering this pair helps separate basal insulin from rapid meal-time products.",
            objective: .genericBrand,
            relatedDrugIds: ["d46"],
            tags: ["Insulin glargine", "Lantus", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_003",
            subsectionId: "3a",
            difficulty: .easy,
            question: "A student sees Humalog on a medication list and remembers it is a rapid-acting insulin given around meals. What is the generic name of Humalog?",
            options: ["Insulin lispro", "Insulin aspart", "Regular insulin", "Insulin glargine", "Insulin detemir"],
            answer: "Insulin lispro",
            explanation: "Humalog is the brand name for insulin lispro, a rapid-acting insulin commonly used for prandial and correction dosing.",
            objective: .brandGeneric,
            relatedDrugIds: ["d47"],
            tags: ["Insulin lispro", "Humalog", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_004",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Insulin lispro is a rapid-acting insulin that is timed with meals to blunt post-prandial glucose excursions. Which brand name corresponds to insulin lispro?",
            options: ["Humalog", "NovoLog", "Lantus", "Levemir", "Humulin R/Novolin R"],
            answer: "Humalog",
            explanation: "Insulin lispro is marketed as Humalog. This is a high-yield brand-generic pair because lispro is a classic meal-time insulin.",
            objective: .genericBrand,
            relatedDrugIds: ["d47"],
            tags: ["Insulin lispro", "Humalog", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_005",
            subsectionId: "3a",
            difficulty: .easy,
            question: "NovoLog is a rapid-acting insulin analog used right before meals in many basal-bolus regimens. What is the generic name of NovoLog?",
            options: ["Insulin aspart", "Insulin lispro", "Insulin glargine", "Regular insulin", "Insulin detemir"],
            answer: "Insulin aspart",
            explanation: "NovoLog is the brand name for insulin aspart, another rapid-acting insulin analog used for prandial coverage.",
            objective: .brandGeneric,
            relatedDrugIds: ["d48"],
            tags: ["Insulin aspart", "NovoLog", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_006",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Insulin aspart is a rapid-acting insulin chosen when a patient needs meal-time glucose control. Which brand name matches insulin aspart?",
            options: ["NovoLog", "Humalog", "Lantus", "Levemir", "Humulin R/Novolin R"],
            answer: "NovoLog",
            explanation: "Insulin aspart is sold as NovoLog. Pairing the brand with its rapid-acting class makes timing questions easier later.",
            objective: .genericBrand,
            relatedDrugIds: ["d48"],
            tags: ["Insulin aspart", "NovoLog", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_007",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Levemir is used as a basal insulin rather than as a meal-time bolus. What is the generic name of Levemir?",
            options: ["Insulin detemir", "Insulin glargine", "Insulin lispro", "Insulin aspart", "Regular insulin"],
            answer: "Insulin detemir",
            explanation: "Levemir is the brand name for insulin detemir, a long-acting insulin used for basal coverage.",
            objective: .brandGeneric,
            relatedDrugIds: ["d49"],
            tags: ["Insulin detemir", "Levemir", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_008",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Insulin detemir is a long-acting insulin that may be dosed once or sometimes twice daily depending on patient needs. Which brand name corresponds to insulin detemir?",
            options: ["Levemir", "Lantus", "Humalog", "NovoLog", "Humulin R/Novolin R"],
            answer: "Levemir",
            explanation: "Insulin detemir is marketed as Levemir. It is grouped with basal insulins rather than with prandial products.",
            objective: .genericBrand,
            relatedDrugIds: ["d49"],
            tags: ["Insulin detemir", "Levemir", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_009",
            subsectionId: "3a",
            difficulty: .easy,
            question: "A hospital order mentions Humulin R, the short-acting insulin that can also be used intravenously under supervision. What is the generic name of Humulin R/Novolin R?",
            options: ["Regular insulin", "Insulin lispro", "Insulin aspart", "Insulin glargine", "Insulin detemir"],
            answer: "Regular insulin",
            explanation: "Humulin R and Novolin R are brand names for regular insulin. It is the classic short-acting human insulin in this subsection.",
            objective: .brandGeneric,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "Humulin R", "Novolin R", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_010",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Regular insulin is the classic short-acting human insulin and remains important for DKA and hyperkalemia protocols. Which brand listing matches regular insulin in this course?",
            options: ["Humulin R/Novolin R", "Humalog", "NovoLog", "Lantus", "Levemir"],
            answer: "Humulin R/Novolin R",
            explanation: "Regular insulin is commonly recognized by the brands Humulin R and Novolin R. This pair is high yield because it shows up often on inpatient protocols.",
            objective: .genericBrand,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "Humulin R", "Novolin R", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_011",
            subsectionId: "3a",
            difficulty: .medium,
            question: "All drugs in this subsection are forms of insulin. Which mechanism best explains how insulin therapy lowers blood glucose?",
            options: ["It promotes glucose uptake into tissues and lowers hepatic glucose output", "It blocks intestinal glucose absorption", "It increases urinary glucose excretion", "It stimulates glucagon release", "It inhibits DPP-4"],
            answer: "It promotes glucose uptake into tissues and lowers hepatic glucose output",
            explanation: "Insulin lowers glucose primarily by helping glucose move into cells and by reducing hepatic glucose production. That is the core mechanism shared by basal and bolus insulins.",
            objective: .moa,
            relatedDrugIds: ["d46", "d47", "d48", "d49", "d50"],
            tags: ["insulin", "MOA", "glucose lowering"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_012",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Humalog is usually selected to cover the rise in glucose that happens with eating. Which drug class best describes Humalog?",
            options: ["Rapid-acting insulin", "Long-acting insulin", "Short-acting insulin", "Biguanide", "SGLT2 inhibitor"],
            answer: "Rapid-acting insulin",
            explanation: "Humalog (insulin lispro) is a rapid-acting insulin. Rapid-acting insulins are used as meal-time or correction insulin rather than as basal coverage.",
            objective: .classId,
            relatedDrugIds: ["d47"],
            tags: ["Humalog", "Rapid-acting insulin", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_013",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Lantus is prescribed once daily to provide background insulin levels between meals and overnight. Which drug class best describes Lantus?",
            options: ["Long-acting insulin", "Rapid-acting insulin", "Short-acting insulin", "Sulfonylurea", "GLP-1 receptor agonist"],
            answer: "Long-acting insulin",
            explanation: "Lantus (insulin glargine) is a long-acting insulin used for basal coverage. It is not the insulin you reach for to cover a meal you are about to eat.",
            objective: .classId,
            relatedDrugIds: ["d46"],
            tags: ["Lantus", "Long-acting insulin", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_014",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Humulin R is still tested heavily because it behaves differently from rapid-acting analogs and can even be given IV in some settings. Which class best describes Humulin R/Novolin R?",
            options: ["Short-acting insulin", "Rapid-acting insulin", "Long-acting insulin", "DPP-4 inhibitor", "Thiazolidinedione"],
            answer: "Short-acting insulin",
            explanation: "Regular insulin is classified as short-acting insulin. That distinguishes it from lispro and aspart, which are rapid-acting analogs.",
            objective: .classId,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "Short-acting insulin", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_015",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A teaching chart separates basal insulins from bolus insulins. Which pair from this subsection contains the TWO long-acting basal insulins?",
            options: ["Insulin glargine and insulin detemir", "Insulin lispro and insulin aspart", "Insulin lispro and regular insulin", "Insulin glargine and insulin aspart", "Insulin detemir and regular insulin"],
            answer: "Insulin glargine and insulin detemir",
            explanation: "Insulin glargine and insulin detemir are the long-acting basal insulins in this subsection. Lispro and aspart are rapid-acting, while regular insulin is short-acting.",
            objective: .mixedReview,
            relatedDrugIds: ["d46", "d49"],
            tags: ["basal insulin", "glargine", "detemir"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_016",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A basal-bolus insulin plan usually uses one background insulin and one meal-time insulin. Which pair below contains the TWO rapid-acting meal-time insulins in this subsection?",
            options: ["Insulin lispro and insulin aspart", "Insulin glargine and insulin detemir", "Insulin aspart and regular insulin", "Insulin glargine and regular insulin", "Insulin detemir and insulin lispro"],
            answer: "Insulin lispro and insulin aspart",
            explanation: "Insulin lispro and insulin aspart are the rapid-acting analogs in this subsection. They are used around meals, unlike glargine and detemir, which are basal insulins.",
            objective: .mixedReview,
            relatedDrugIds: ["d47", "d48"],
            tags: ["rapid-acting insulin", "lispro", "aspart"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_017",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A person with type 1 diabetes needs a classic basal-bolus regimen that separates steady background coverage from meal-time dosing. Which option best matches that strategy?",
            options: ["Insulin glargine once daily plus insulin lispro with meals", "Regular insulin once daily alone", "Insulin lispro twice daily without basal insulin", "Insulin glargine only when blood sugar is high", "Insulin detemir only right before meals"],
            answer: "Insulin glargine once daily plus insulin lispro with meals",
            explanation: "A basal-bolus regimen uses a basal insulin such as glargine for background coverage and a rapid-acting insulin such as lispro for meals. This is a foundational insulin concept.",
            objective: .mixedReview,
            relatedDrugIds: ["d46", "d47"],
            tags: ["basal-bolus", "glargine", "lispro"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_018",
            subsectionId: "3a",
            difficulty: .medium,
            question: "One reason insulin glargine is memorable is that it is taught as a relatively peakless basal insulin that can provide about 24 hours of coverage. Which insulin fits that description?",
            options: ["Insulin glargine", "Insulin lispro", "Insulin aspart", "Regular insulin", "Insulin detemir"],
            answer: "Insulin glargine",
            explanation: "Insulin glargine is the classic long-acting, relatively peakless basal insulin with about 24-hour coverage. That makes it useful for fasting and between-meal control.",
            objective: .pearl,
            relatedDrugIds: ["d46"],
            tags: ["Insulin glargine", "peakless", "24 hours"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_019",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Levemir is also a basal insulin, but one classic pearl is that some patients do not get a full 24 hours from it. Which insulin may therefore need twice-daily dosing in some patients?",
            options: ["Insulin detemir", "Insulin glargine", "Insulin lispro", "Insulin aspart", "Regular insulin"],
            answer: "Insulin detemir",
            explanation: "Insulin detemir may be dosed once daily, but some patients need twice-daily dosing. This is a classic contrast with insulin glargine.",
            objective: .dosing,
            relatedDrugIds: ["d49"],
            tags: ["Insulin detemir", "BID dosing", "basal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_020",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Humalog is designed to act quickly around meal time. When should insulin lispro typically be taken in relation to a meal?",
            options: ["Within 15 minutes before a meal or immediately after", "Only at bedtime", "Exactly 2 hours after eating", "Once weekly with breakfast", "Only on days with exercise"],
            answer: "Within 15 minutes before a meal or immediately after",
            explanation: "Insulin lispro is rapid acting, so it is typically taken within 15 minutes before a meal or immediately after. That timing matches post-prandial glucose rises.",
            objective: .dosing,
            relatedDrugIds: ["d47"],
            tags: ["Insulin lispro", "meal timing", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_021",
            subsectionId: "3a",
            difficulty: .medium,
            question: "NovoLog has a faster onset than regular insulin, which is why it is commonly used as a pre-meal bolus. When is insulin aspart usually given?",
            options: ["About 5 to 10 minutes before a meal", "Only 30 to 60 minutes after a meal", "Only at bedtime", "Exactly 2 hours before eating", "Only with the largest meal of the week"],
            answer: "About 5 to 10 minutes before a meal",
            explanation: "Insulin aspart is a rapid-acting insulin usually taken about 5 to 10 minutes before a meal. It works sooner than regular insulin, so it can be dosed closer to eating.",
            objective: .dosing,
            relatedDrugIds: ["d48"],
            tags: ["Insulin aspart", "meal timing", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_022",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Regular insulin is slower than rapid-acting analogs, so its pre-meal timing is different. Approximately when should regular insulin usually be injected before eating?",
            options: ["About 30 minutes before a meal", "Right after the meal ends", "Only at bedtime", "At least 4 hours before the meal", "Only when fasting blood sugar is normal"],
            answer: "About 30 minutes before a meal",
            explanation: "Regular insulin has a slower onset than lispro or aspart, so it is usually injected about 30 minutes before a meal. This is a classic timing difference worth memorizing.",
            objective: .dosing,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "30 minutes before meal", "dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_023",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A patient with diabetic ketoacidosis needs an insulin that can be given intravenously in a monitored setting. Which insulin from this subsection is classically used for IV insulin therapy?",
            options: ["Regular insulin", "Insulin lispro", "Insulin aspart", "Insulin glargine", "Insulin detemir"],
            answer: "Regular insulin",
            explanation: "Regular insulin is the classic insulin used intravenously for situations such as DKA. The rapid-acting and long-acting analogs are not the standard answer to this board-style question.",
            objective: .indication,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "IV insulin", "DKA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_024",
            subsectionId: "3a",
            difficulty: .medium,
            question: "In hyperkalemia treatment, regular insulin is often paired with dextrose because insulin drives which electrolyte into cells?",
            options: ["Potassium", "Calcium", "Magnesium", "Sodium", "Phosphate"],
            answer: "Potassium",
            explanation: "Regular insulin helps shift potassium into cells, which is why it is used in hyperkalemia protocols. This pearl is separate from its glucose-lowering role in diabetes.",
            objective: .moa,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "hyperkalemia", "potassium"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_025",
            subsectionId: "3a",
            difficulty: .hard,
            question: "A non-diabetic patient with severe hyperkalemia receives IV regular insulin. Why is dextrose often given at the same time?",
            options: ["To reduce the risk of hypoglycemia from insulin", "To increase potassium release from cells", "To neutralize insulin allergy", "To make regular insulin last 24 hours", "To convert insulin into a basal formulation"],
            answer: "To reduce the risk of hypoglycemia from insulin",
            explanation: "When regular insulin is used to treat hyperkalemia, dextrose is often co-administered to avoid causing hypoglycemia. The potassium-shifting benefit of insulin is preserved.",
            objective: .pearl,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "dextrose", "hyperkalemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_026",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A clinician explains that basal insulin mainly covers fasting glucose between meals and overnight rather than the glucose rise from a meal. Which drug from this subsection is the best classic example of basal insulin?",
            options: ["Insulin glargine", "Insulin lispro", "Insulin aspart", "Regular insulin", "Metformin"],
            answer: "Insulin glargine",
            explanation: "Insulin glargine is the classic basal insulin in this subsection. Basal insulin targets fasting and between-meal glucose rather than the immediate glucose surge from eating.",
            objective: .indication,
            relatedDrugIds: ["d46"],
            tags: ["Insulin glargine", "basal", "fasting glucose"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_027",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A preceptor says, \"Bolus insulin is the insulin that covers the food the patient is about to eat.\" Which drug from this subsection best fits that bolus role?",
            options: ["Insulin lispro", "Insulin glargine", "Insulin detemir", "Metformin", "Pioglitazone"],
            answer: "Insulin lispro",
            explanation: "Insulin lispro is a rapid-acting meal-time insulin, so it is a classic bolus insulin. Basal products like glargine and detemir are used differently.",
            objective: .indication,
            relatedDrugIds: ["d47"],
            tags: ["Insulin lispro", "bolus insulin", "mealtime"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_028",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Even though these insulin products differ in onset and duration, what is the most important high-yield adverse effect shared by all of them?",
            options: ["Hypoglycemia", "Dry cough", "Constipation", "Neutropenia", "Bradycardia"],
            answer: "Hypoglycemia",
            explanation: "Hypoglycemia is the major adverse effect shared across insulin therapies. That is why timing, food intake, and glucose monitoring matter so much.",
            objective: .adverseEffect,
            relatedDrugIds: ["d46", "d47", "d48", "d49", "d50"],
            tags: ["insulin", "hypoglycemia", "adverse effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_029",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A patient is being titrated on a new insulin regimen. Which monitoring parameter is the most important to follow closely when adjusting insulin doses?",
            options: ["Blood glucose readings", "INR", "TSH", "LDL cholesterol", "Serum uric acid"],
            answer: "Blood glucose readings",
            explanation: "Blood glucose monitoring is essential when insulin doses are adjusted. Insulin titration depends on patterns in fasting and/or pre-meal and post-meal glucose values.",
            objective: .monitoring,
            relatedDrugIds: ["d46", "d47", "d48", "d49", "d50"],
            tags: ["insulin", "monitoring", "blood glucose"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_030",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A patient always injects insulin into the exact same abdominal spot and later develops thickened, lumpy tissue. What counseling point would have best helped prevent this problem?",
            options: ["Rotate injection sites within the same region", "Shake the insulin harder before use", "Double the insulin dose weekly", "Take the insulin only after exercise", "Store each pen in the freezer"],
            answer: "Rotate injection sites within the same region",
            explanation: "Insulin injection sites should be rotated to reduce the risk of lipodystrophy and localized cutaneous amyloidosis. Repeated use of the same spot can make absorption less predictable.",
            objective: .pearl,
            relatedDrugIds: ["d46", "d47", "d48", "d49", "d50"],
            tags: ["insulin", "rotation", "lipodystrophy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_031",
            subsectionId: "3a",
            difficulty: .hard,
            question: "One long-acting insulin is classically taught as something you do not dilute or mix with other insulins because it is designed to provide steady basal coverage. Which insulin is that?",
            options: ["Insulin glargine", "Insulin lispro", "Insulin aspart", "Regular insulin", "Metformin"],
            answer: "Insulin glargine",
            explanation: "Insulin glargine is classically taught as a long-acting insulin that should not be diluted or mixed with other insulins. This pearl reinforces its unique basal role.",
            objective: .pearl,
            relatedDrugIds: ["d46"],
            tags: ["Insulin glargine", "do not mix", "basal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_032",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Compared with regular insulin, what is the main practical advantage of insulin aspart for meal-time dosing?",
            options: ["It can be given closer to the start of a meal", "It is the only insulin that lowers glucose", "It has a 24-hour peakless profile", "It never causes hypoglycemia", "It replaces the need for basal insulin"],
            answer: "It can be given closer to the start of a meal",
            explanation: "Insulin aspart is rapid acting, so it can be dosed much closer to a meal than regular insulin. That timing difference is one of the cleanest ways to distinguish the two.",
            objective: .pearl,
            relatedDrugIds: ["d48", "d50"],
            tags: ["Insulin aspart", "Regular insulin", "timing comparison"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_033",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Compared with regular insulin, what feature makes insulin lispro especially useful for covering post-prandial glucose spikes?",
            options: ["It has a faster onset around meals", "It is taken once weekly", "It provides 24-hour basal coverage", "It is monitored with INR", "It increases potassium levels"],
            answer: "It has a faster onset around meals",
            explanation: "Insulin lispro acts faster than regular insulin, which is why it is useful for meal-time coverage and correction dosing around eating.",
            objective: .pearl,
            relatedDrugIds: ["d47", "d50"],
            tags: ["Insulin lispro", "Regular insulin", "postprandial"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_034",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Which insulin in this subsection is a human short-acting insulin rather than an insulin analog?",
            options: ["Regular insulin", "Insulin lispro", "Insulin aspart", "Insulin glargine", "Insulin detemir"],
            answer: "Regular insulin",
            explanation: "Regular insulin is the classic human short-acting insulin. Lispro, aspart, glargine, and detemir are insulin analogs with different pharmacokinetic profiles.",
            objective: .classId,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "human insulin", "short-acting"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_035",
            subsectionId: "3a",
            difficulty: .hard,
            question: "A patient only uses Humalog before meals but still wakes up every morning with high fasting glucose. Which additional insulin from this subsection would best add the missing classic basal coverage?",
            options: ["Insulin glargine", "Insulin lispro", "Insulin aspart", "Regular insulin", "No additional insulin is needed"],
            answer: "Insulin glargine",
            explanation: "Using only a rapid-acting insulin leaves the patient without strong basal coverage. Insulin glargine is a classic choice to cover fasting and between-meal glucose levels.",
            objective: .mixedReview,
            relatedDrugIds: ["d46", "d47"],
            tags: ["fasting glucose", "basal-bolus", "glargine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_036",
            subsectionId: "3a",
            difficulty: .hard,
            question: "A patient takes Lantus every day but still has large glucose spikes after meals. Which additional drug from this subsection would best target those meal-related excursions?",
            options: ["Insulin lispro", "Insulin glargine", "Insulin detemir", "No additional drug is needed", "Levothyroxine"],
            answer: "Insulin lispro",
            explanation: "Lantus covers background glucose, but meal spikes are often addressed with a rapid-acting insulin such as lispro. This question teaches the basal-versus-bolus split.",
            objective: .mixedReview,
            relatedDrugIds: ["d46", "d47"],
            tags: ["postprandial glucose", "lispro", "basal-bolus"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_037",
            subsectionId: "3a",
            difficulty: .hard,
            question: "Which regimen below best reflects the core idea of basal-bolus therapy for type 1 diabetes?",
            options: ["Insulin glargine daily plus insulin aspart before meals", "Insulin lispro once daily alone", "Regular insulin once weekly", "Insulin detemir only after large meals", "No insulin because oral drugs are enough"],
            answer: "Insulin glargine daily plus insulin aspart before meals",
            explanation: "Basal-bolus therapy pairs a basal insulin such as glargine with a rapid-acting insulin such as aspart before meals. This is a foundational type 1 diabetes concept.",
            objective: .mixedReview,
            relatedDrugIds: ["d46", "d48"],
            tags: ["basal-bolus", "glargine", "aspart"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_038",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A prescriber specifically asks for a SHORT-acting insulin, not a rapid-acting analog and not a long-acting basal insulin. Which option best matches that request?",
            options: ["Regular insulin", "Insulin lispro", "Insulin aspart", "Insulin glargine", "Insulin detemir"],
            answer: "Regular insulin",
            explanation: "Regular insulin is the short-acting insulin in this subsection. Lispro and aspart are rapid-acting; glargine and detemir are long-acting.",
            objective: .classId,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "short-acting", "classification"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_039",
            subsectionId: "3a",
            difficulty: .medium,
            question: "One drug in this subsection is commonly listed with TWO brand names rather than one, which can confuse learners reading hospital orders. Which product is that?",
            options: ["Regular insulin", "Insulin lispro", "Insulin glargine", "Insulin aspart", "Insulin detemir"],
            answer: "Regular insulin",
            explanation: "Regular insulin is commonly seen as Humulin R or Novolin R. Recognizing both brands prevents you from missing that they refer to the same short-acting insulin.",
            objective: .pearl,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "Humulin R", "Novolin R"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_040",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Which statement about insulin detemir is the most accurate and high yield?",
            options: ["It is a long-acting basal insulin that may need twice-daily dosing in some patients", "It is a rapid-acting insulin taken only with meals", "It is the only insulin used intravenously for DKA", "It must always be given exactly 30 minutes before meals", "It is a GLP-1 receptor agonist"],
            answer: "It is a long-acting basal insulin that may need twice-daily dosing in some patients",
            explanation: "Insulin detemir is a long-acting basal insulin, but some patients require twice-daily dosing. That pearl helps distinguish it from glargine.",
            objective: .pearl,
            relatedDrugIds: ["d49"],
            tags: ["Insulin detemir", "basal", "BID"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_041",
            subsectionId: "3a",
            difficulty: .hard,
            question: "A patient in the ICU has DKA and severe hyperkalemia. Which insulin from this subsection is most classically associated with both of those urgent inpatient uses?",
            options: ["Regular insulin", "Insulin glargine", "Insulin detemir", "Insulin lispro", "Insulin glargine plus lispro premixed together"],
            answer: "Regular insulin",
            explanation: "Regular insulin is the classic answer for IV insulin use in DKA and for potassium shifting in hyperkalemia. Those two pearls make it much more than just another meal-time insulin.",
            objective: .indication,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "DKA", "hyperkalemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_042",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A patient injects a rapid-acting insulin and then skips the meal because the restaurant is delayed. What is the biggest immediate risk of this timing mismatch?",
            options: ["Hypoglycemia", "Hypertensive crisis", "Angioedema", "GI bleeding", "Neutropenia"],
            answer: "Hypoglycemia",
            explanation: "Rapid-acting insulin is designed to cover a meal that is about to be eaten. If the meal is delayed or skipped, glucose can fall too low and cause hypoglycemia.",
            objective: .adverseEffect,
            relatedDrugIds: ["d47", "d48"],
            tags: ["rapid-acting insulin", "meal timing", "hypoglycemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_043",
            subsectionId: "3a",
            difficulty: .hard,
            question: "During an IV regular insulin infusion, what should be monitored closely along with blood glucose because insulin can shift it into cells and lower the serum level?",
            options: ["Potassium", "INR", "Hemoglobin A1c", "TSH", "Uric acid"],
            answer: "Potassium",
            explanation: "Regular insulin can lower serum potassium by shifting potassium into cells. That is useful in hyperkalemia treatment, but it also means potassium must be monitored during IV insulin therapy.",
            objective: .monitoring,
            relatedDrugIds: ["d50"],
            tags: ["Regular insulin", "potassium", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_044",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Which insulin from this subsection is the best classic choice when the learning goal is 'steady overnight and fasting coverage from a once-daily basal insulin'?",
            options: ["Insulin glargine", "Insulin lispro", "Insulin aspart", "Regular insulin", "Semaglutide"],
            answer: "Insulin glargine",
            explanation: "Insulin glargine is the classic once-daily basal insulin used for steady overnight and fasting coverage. Meal-time agents like lispro and aspart serve a different role.",
            objective: .indication,
            relatedDrugIds: ["d46"],
            tags: ["Insulin glargine", "overnight coverage", "basal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_add_045",
            subsectionId: "3a",
            difficulty: .hard,
            question: "Why is it especially risky for a patient to confuse Humalog, NovoLog, Lantus, and Humulin R as if they were interchangeable?",
            options: ["They have different onsets, durations, and meal timing requirements", "Only one of them actually lowers blood sugar", "They all require INR monitoring", "They all must be injected intravenously", "They are all non-insulin oral drugs"],
            answer: "They have different onsets, durations, and meal timing requirements",
            explanation: "Insulin products are not interchangeable just because they are all insulins. Their different onsets, durations, and timing requirements are exactly what make basal-bolus therapy work—and what make product mix-ups dangerous.",
            objective: .pearl,
            relatedDrugIds: ["d46", "d47", "d48", "d49", "d50"],
            tags: ["insulin safety", "timing", "product mix-ups"],
            source: .curated
        )
    ]
}