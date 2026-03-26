// PharmaLingo — Mastering Endocrine & Diabetes
// Curated Add-On Question Pack (45 questions)
// IDs: q3g_add_001 ... q3g_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 3g is a mastery/review-only subsection in the current repo and the vNext outline.
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
//        if sub.id == Self.masteringEndocrineDiabetesSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_3gMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 3a–3f with a few prior-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-06

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 3 mastery quiz.
    static let masteringEndocrineDiabetesSubsectionId: String = "3g"

    static let curatedAddOnQuestions_3gMastery: [Question] = [

        .multipleChoice(
            id: "q3g_add_001",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "You are reviewing basal-versus-bolus insulin products before clinic. Which brand/generic pair is correctly matched for a long-acting basal insulin?",
            options: ["Lantus - insulin glargine", "Humalog - insulin detemir", "NovoLog - regular insulin", "Levemir - insulin lispro", "Humulin R - insulin aspart"],
            answer: "Lantus - insulin glargine",
            explanation: "Lantus is insulin glargine, a long-acting basal insulin. Humalog is lispro, NovoLog is aspart, Levemir is detemir, and Humulin R is regular insulin.",
            objective: .brandGeneric,
            relatedDrugIds: ["d46"],
            tags: ["Mastery", "Insulin", "brand-generic", "Basal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_002",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient uses NovoLog for mealtime coverage and asks when to inject it. Because insulin aspart is a rapid-acting bolus insulin, when is it generally given?",
            options: ["Immediately before a meal, usually within 5 to 10 minutes of eating", "At bedtime only", "Exactly 60 minutes before every meal", "Only after the meal is completely finished", "Once weekly on the same day each week"],
            answer: "Immediately before a meal, usually within 5 to 10 minutes of eating",
            explanation: "Insulin aspart is rapid acting and is generally given within 5 to 10 minutes before a meal for prandial glucose control.",
            objective: .dosing,
            relatedDrugIds: ["d48"],
            tags: ["Mastery", "Insulin", "timing", "Aspart"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_003",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "One insulin from this module has a special high-yield pearl: it is the classic insulin used intravenously for emergencies like DKA and shifting potassium in hyperkalemia. Which insulin is it?",
            options: ["Regular insulin", "Insulin glargine", "Insulin detemir", "Insulin lispro", "Insulin aspart"],
            answer: "Regular insulin",
            explanation: "Regular insulin is the classic short-acting insulin used intravenously in DKA and in insulin/dextrose protocols for hyperkalemia.",
            objective: .pearl,
            relatedDrugIds: ["d50"],
            tags: ["Mastery", "Insulin", "DKA", "Hyperkalemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_004",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A student is drawing up two insulins into the same syringe and asks whether Lantus can be mixed with other insulins. Which answer is most accurate?",
            options: ["No — insulin glargine should not be mixed with other insulins", "Yes — glargine is routinely mixed with rapid-acting insulins", "Yes — glargine should always be mixed with regular insulin", "Yes — but only if the patient has type 1 diabetes", "Yes — as long as the total dose stays under 10 units"],
            answer: "No — insulin glargine should not be mixed with other insulins",
            explanation: "Insulin glargine is a long-acting basal insulin and should not be mixed with other insulins in the same syringe.",
            objective: .contraindication,
            relatedDrugIds: ["d46"],
            tags: ["Mastery", "Insulin", "mixing", "Glargine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_005",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Two patients need basal insulin. One is prescribed insulin detemir and the other insulin glargine. Which pearl best distinguishes detemir from glargine?",
            options: ["Detemir may require twice-daily dosing in some patients", "Detemir is the preferred IV insulin in DKA", "Detemir is a rapid-acting mealtime insulin", "Detemir must always be taken with food", "Detemir is contraindicated in type 2 diabetes"],
            answer: "Detemir may require twice-daily dosing in some patients",
            explanation: "Insulin detemir is a long-acting basal insulin, but some patients require twice-daily dosing, unlike glargine which is more often once daily.",
            objective: .pearl,
            relatedDrugIds: ["d49", "d46"],
            tags: ["Mastery", "Insulin", "Detemir", "Basal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_006",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "Humalog is a rapid-acting insulin used for prandial coverage around meals. What is the generic name of Humalog?",
            options: ["Insulin lispro", "Insulin glargine", "Insulin detemir", "Regular insulin", "Insulin aspart"],
            answer: "Insulin lispro",
            explanation: "Humalog is the brand name for insulin lispro, a rapid-acting mealtime insulin.",
            objective: .genericBrand,
            relatedDrugIds: ["d47"],
            tags: ["Mastery", "Insulin", "brand-generic", "Lispro"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_007",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "Whether the insulin is basal or bolus, the most important adverse effect students must recognize quickly is low blood sugar. Which adverse effect is shared across essentially all insulin products in this module?",
            options: ["Hypoglycemia", "Agranulocytosis", "Dry cough", "Ototoxicity", "Thyroid storm"],
            answer: "Hypoglycemia",
            explanation: "Hypoglycemia is the major class-wide adverse effect of insulin therapy and is especially important when meals are missed or doses are excessive.",
            objective: .adverseEffect,
            relatedDrugIds: ["d46", "d47", "d48", "d49", "d50"],
            tags: ["Mastery", "Insulin", "Hypoglycemia", "Adverse effects"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_008",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient injects insulin into the exact same abdominal spot every day and starts having erratic absorption. Which counseling point best teaches the prevention strategy?",
            options: ["Rotate injection sites to reduce lipodystrophy and absorption problems", "Massage the same site after every injection to improve uptake", "Switch all insulin doses to bedtime", "Take the insulin only with a high-fat meal", "Store the current pen at room temperature for several months"],
            answer: "Rotate injection sites to reduce lipodystrophy and absorption problems",
            explanation: "Repeated injections into the same area can cause lipodystrophy and unpredictable absorption. Rotation of injection sites is an important insulin-counseling pearl.",
            objective: .pearl,
            relatedDrugIds: ["d47", "d48", "d46", "d49", "d50"],
            tags: ["Mastery", "Insulin", "Counseling", "Lipodystrophy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_009",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "A newly diagnosed patient with type 2 diabetes needs a first-line oral drug that lowers hepatic glucose production and usually does not cause hypoglycemia when used alone. Which drug best fits that description?",
            options: ["Metformin", "Glipizide", "Insulin lispro", "Pioglitazone", "Regular insulin"],
            answer: "Metformin",
            explanation: "Metformin is the classic first-line oral agent for type 2 diabetes. It decreases hepatic glucose production and generally does not cause hypoglycemia when used alone.",
            objective: .indication,
            relatedDrugIds: ["d45"],
            tags: ["Mastery", "Metformin", "First-line", "T2DM"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_010",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient starts Glucophage and develops nausea and loose stools. Which counseling point is most likely to improve tolerability while keeping the patient on this high-yield first-line drug?",
            options: ["Take metformin with meals and titrate gradually", "Take it on an empty stomach with calcium", "Stop all food intake for two hours after each dose", "Switch the dose to immediately before bedtime on day one", "Take it only when fasting glucose is above goal"],
            answer: "Take metformin with meals and titrate gradually",
            explanation: "GI upset is common when metformin is started. Taking it with meals and increasing the dose gradually can improve tolerability.",
            objective: .pearl,
            relatedDrugIds: ["d45"],
            tags: ["Mastery", "Metformin", "GI effects", "Counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_011",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Metformin is high yield not just for its mechanism, but also for a long-term deficiency it can cause. Which lab issue becomes important to monitor over time in a patient on chronic metformin therapy?",
            options: ["Vitamin B12 deficiency", "Severe neutropenia", "Prolonged INR", "Hyperthyroidism", "QT prolongation"],
            answer: "Vitamin B12 deficiency",
            explanation: "Long-term metformin therapy can lower vitamin B12 levels, so B12 deficiency is an important monitoring pearl in chronic use.",
            objective: .monitoring,
            relatedDrugIds: ["d45"],
            tags: ["Mastery", "Metformin", "B12", "Monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_012",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient on metformin is scheduled for a contrast-enhanced CT scan and has borderline renal function. Which medication is classically held around this scenario because of lactic acidosis concern if kidney function worsens?",
            options: ["Metformin", "Pioglitazone", "Sitagliptin", "Glimepiride", "Levothyroxine"],
            answer: "Metformin",
            explanation: "Metformin is commonly held around iodinated contrast exposure in patients at risk for renal injury because reduced clearance can increase lactic acidosis risk.",
            objective: .contraindication,
            relatedDrugIds: ["d45"],
            tags: ["Mastery", "Metformin", "Contrast", "Renal function"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_013",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Actos improves insulin sensitivity rather than directly stimulating pancreatic insulin release. Through which high-yield mechanism does pioglitazone primarily work?",
            options: ["PPAR-gamma agonism", "Direct GLP-1 receptor agonism", "DPP-4 inhibition", "SGLT2 blockade in the proximal tubule", "ATP-sensitive potassium channel closure on beta cells"],
            answer: "PPAR-gamma agonism",
            explanation: "Pioglitazone is a thiazolidinedione that improves insulin sensitivity through PPAR-gamma agonism.",
            objective: .moa,
            relatedDrugIds: ["d58"],
            tags: ["Mastery", "Pioglitazone", "Mechanism", "PPAR-gamma"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_014",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient with type 2 diabetes starts Actos and soon develops worsening ankle edema and rapid weight gain. Which major caution makes pioglitazone a poor choice in patients with significant heart failure?",
            options: ["It can cause fluid retention and worsen heart failure", "It commonly causes severe hypoglycemia even when used alone", "It is directly nephrotoxic and usually causes acute tubular necrosis", "It irreversibly suppresses cortisol production", "It causes agranulocytosis in a dose-dependent fashion"],
            answer: "It can cause fluid retention and worsen heart failure",
            explanation: "Pioglitazone can cause fluid retention, edema, and worsening heart failure, which is why it is high yield to avoid or use very cautiously in patients with significant HF.",
            objective: .contraindication,
            relatedDrugIds: ["d58"],
            tags: ["Mastery", "Pioglitazone", "Heart failure", "Adverse effects"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_015",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Empagliflozin and dapagliflozin help lower glucose by acting in the kidney rather than the pancreas. What do SGLT2 inhibitors primarily block?",
            options: ["Renal glucose reabsorption in the proximal tubule", "DPP-4 breakdown of incretins", "Peripheral conversion of T4 to T3", "Aldosterone receptors in the collecting duct", "HMG-CoA reductase in the liver"],
            answer: "Renal glucose reabsorption in the proximal tubule",
            explanation: "SGLT2 inhibitors block glucose reabsorption in the proximal renal tubule, causing glucosuria and lowering plasma glucose.",
            objective: .moa,
            relatedDrugIds: ["d51", "d52"],
            tags: ["Mastery", "SGLT2", "Mechanism", "Kidney"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_016",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient has type 2 diabetes plus heart failure and chronic kidney disease. Which drug class from this module is especially high yield because it can help all three problems?",
            options: ["SGLT2 inhibitors", "Sulfonylureas", "Short-acting insulins", "Thionamides", "Thiazolidinediones"],
            answer: "SGLT2 inhibitors",
            explanation: "SGLT2 inhibitors are high yield because, beyond glucose lowering, they have important heart failure and kidney-protective roles.",
            objective: .pearl,
            relatedDrugIds: ["d51", "d52"],
            tags: ["Mastery", "SGLT2", "HF", "CKD"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_017",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "Jardiance is one of the highest-yield SGLT2 inhibitors because of its diabetes, heart-failure, and kidney benefits. What is the generic name of Jardiance?",
            options: ["Empagliflozin", "Dapagliflozin", "Sitagliptin", "Semaglutide", "Pioglitazone"],
            answer: "Empagliflozin",
            explanation: "Jardiance is the brand name for empagliflozin.",
            objective: .genericBrand,
            relatedDrugIds: ["d51"],
            tags: ["Mastery", "SGLT2", "brand-generic", "Empagliflozin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_018",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient taking a -gliflozin is scheduled for surgery. Because this class can contribute to euglycemic ketoacidosis around fasting and procedures, what is the usual high-yield perioperative counseling point?",
            options: ["Hold the SGLT2 inhibitor for at least 3 days before surgery when possible", "Double the dose the day before surgery", "Continue it but skip all insulin", "Switch it to bedtime the night before surgery", "Take it with a large carbohydrate load immediately before anesthesia"],
            answer: "Hold the SGLT2 inhibitor for at least 3 days before surgery when possible",
            explanation: "SGLT2 inhibitors are commonly held for at least 3 days before surgery or prolonged fasting because of ketoacidosis risk.",
            objective: .dosing,
            relatedDrugIds: ["d51", "d52"],
            tags: ["Mastery", "SGLT2", "Perioperative", "DKA"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_019",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "When counseling a patient starting Farxiga or Jardiance, which common class adverse effect should be discussed up front?",
            options: ["Genital mycotic infections", "Dry cough from bradykinin buildup", "Gingival hyperplasia", "Blue-gray skin discoloration", "Ototoxicity"],
            answer: "Genital mycotic infections",
            explanation: "Genital mycotic infections are a classic counseling point for SGLT2 inhibitors because they increase urinary glucose exposure.",
            objective: .adverseEffect,
            relatedDrugIds: ["d51", "d52"],
            tags: ["Mastery", "SGLT2", "Adverse effects", "Genital infections"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_020",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "An older adult starts empagliflozin and later reports dizziness, orthostasis, and mild dehydration. Which class effect best explains these symptoms?",
            options: ["Osmotic diuresis leading to volume depletion", "Direct bone marrow suppression", "Profound thyroid hormone blockade", "Aldosterone-mediated potassium retention", "Bradykinin accumulation"],
            answer: "Osmotic diuresis leading to volume depletion",
            explanation: "SGLT2 inhibitors increase urinary glucose and water loss, so osmotic diuresis and volume depletion are important counseling points.",
            objective: .adverseEffect,
            relatedDrugIds: ["d51", "d52"],
            tags: ["Mastery", "SGLT2", "Volume depletion", "Counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_021",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "Ozempic and Wegovy are two high-yield brand names tied to one very testable generic. What is the generic name of Ozempic/Wegovy?",
            options: ["Semaglutide", "Liraglutide", "Sitagliptin", "Glipizide", "Glimepiride"],
            answer: "Semaglutide",
            explanation: "Ozempic and Wegovy are brand names for semaglutide.",
            objective: .genericBrand,
            relatedDrugIds: ["d53"],
            tags: ["Mastery", "GLP-1", "brand-generic", "Semaglutide"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_022",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Two GLP-1 receptor agonists appear in this module. Which one is classically remembered as a once-daily injection rather than a once-weekly product?",
            options: ["Liraglutide", "Semaglutide", "Sitagliptin", "Glipizide", "Pioglitazone"],
            answer: "Liraglutide",
            explanation: "Liraglutide is the daily GLP-1 receptor agonist in this module, while semaglutide is the classic once-weekly GLP-1 option.",
            objective: .dosing,
            relatedDrugIds: ["d54", "d53"],
            tags: ["Mastery", "GLP-1", "Dosing", "Liraglutide"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_023",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient wants a diabetes medication that often helps with weight loss and slows gastric emptying while increasing glucose-dependent insulin secretion. Which drug class best fits that description?",
            options: ["GLP-1 receptor agonists", "Sulfonylureas", "Thiazolidinediones", "Thionamides", "Long-acting insulins"],
            answer: "GLP-1 receptor agonists",
            explanation: "GLP-1 receptor agonists increase glucose-dependent insulin secretion, slow gastric emptying, and often promote weight loss.",
            objective: .moa,
            relatedDrugIds: ["d53", "d54"],
            tags: ["Mastery", "GLP-1", "Mechanism", "Weight loss"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_024",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient with a personal or family history of medullary thyroid carcinoma asks whether Ozempic is safe to use. Which answer is most appropriate?",
            options: ["No — semaglutide is contraindicated with a personal or family history of MTC or MEN2", "Yes — semaglutide is preferred in MEN2 because it lowers weight", "Yes — but only if taken with metformin", "Yes — because the warning applies only to sitagliptin", "No — but only because semaglutide causes severe hypoglycemia when used alone"],
            answer: "No — semaglutide is contraindicated with a personal or family history of MTC or MEN2",
            explanation: "Semaglutide carries a thyroid C-cell tumor warning and is contraindicated in patients with a personal or family history of MTC or MEN2.",
            objective: .contraindication,
            relatedDrugIds: ["d53"],
            tags: ["Mastery", "GLP-1", "MEN2", "MTC"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_025",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Januvia is a weight-neutral DPP-4 inhibitor that rarely causes hypoglycemia by itself. What additional high-yield dosing pearl should students remember about sitagliptin?",
            options: ["It often needs renal dose adjustment", "It must always be injected weekly", "It should never be combined with metformin", "It is mainly used for hyperthyroidism", "It should be held because of bradykinin-mediated cough"],
            answer: "It often needs renal dose adjustment",
            explanation: "Sitagliptin is a DPP-4 inhibitor with low hypoglycemia risk alone, but renal dose adjustment is a key prescribing pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d55"],
            tags: ["Mastery", "Sitagliptin", "DPP-4", "Renal dosing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_026",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient on sitagliptin develops blistering erosions, and the team is concerned about a rare but classic postmarketing warning. Which drug is most closely associated with bullous pemphigoid in this module?",
            options: ["Sitagliptin", "Semaglutide", "Liraglutide", "Metformin", "Insulin detemir"],
            answer: "Sitagliptin",
            explanation: "Bullous pemphigoid is a high-yield rare adverse effect associated with DPP-4 inhibitors such as sitagliptin.",
            objective: .adverseEffect,
            relatedDrugIds: ["d55"],
            tags: ["Mastery", "Sitagliptin", "Bullous pemphigoid", "Adverse effects"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_027",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient takes glipizide and then skips breakfast, increasing the risk of symptomatic hypoglycemia. What counseling point was most likely missed?",
            options: ["Glipizide is typically taken about 30 minutes before a meal", "Glipizide should only be taken once weekly", "Glipizide should be taken at bedtime with no food", "Glipizide is only for type 1 diabetes", "Glipizide must be taken with calcium supplements"],
            answer: "Glipizide is typically taken about 30 minutes before a meal",
            explanation: "Glipizide is commonly taken about 30 minutes before a meal to reduce postprandial glucose, so skipping that meal increases hypoglycemia risk.",
            objective: .dosing,
            relatedDrugIds: ["d56"],
            tags: ["Mastery", "Sulfonylurea", "Glipizide", "Meal timing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_028",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A student is comparing the two sulfonylureas in this module. Which drug is classically administered with breakfast or the first main meal of the day, often as once-daily therapy?",
            options: ["Glimepiride", "Glipizide", "Metformin", "Sitagliptin", "Pioglitazone"],
            answer: "Glimepiride",
            explanation: "Glimepiride is the once-daily sulfonylurea in this module and is administered with breakfast or the first main meal.",
            objective: .dosing,
            relatedDrugIds: ["d57"],
            tags: ["Mastery", "Sulfonylurea", "Glimepiride", "Meal timing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_029",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient newly prescribed Synthroid asks how to take it correctly. Which counseling statement is most accurate and high yield?",
            options: ["Take levothyroxine on an empty stomach and separate it from calcium or iron by about 4 hours", "Take levothyroxine only with a large breakfast to improve absorption", "Take levothyroxine together with calcium for better thyroid replacement", "Take levothyroxine only at bedtime with dairy products", "Crush levothyroxine into antacid suspension before use"],
            answer: "Take levothyroxine on an empty stomach and separate it from calcium or iron by about 4 hours",
            explanation: "Levothyroxine is best taken on an empty stomach, and calcium/iron can impair absorption, so they should be separated by about 4 hours.",
            objective: .pearl,
            relatedDrugIds: ["d59"],
            tags: ["Mastery", "Levothyroxine", "Counseling", "Absorption"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_030",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "One thyroid hormone product in this module is synthetic T3 rather than T4 and therefore has a shorter half-life and faster onset. Which drug is it?",
            options: ["Liothyronine", "Levothyroxine", "Methimazole", "Propylthiouracil", "Hydrocortisone"],
            answer: "Liothyronine",
            explanation: "Liothyronine is synthetic T3. Levothyroxine is synthetic T4 and has a longer half-life.",
            objective: .classId,
            relatedDrugIds: ["d60", "d59"],
            tags: ["Mastery", "Thyroid", "Liothyronine", "T3"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_031",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A nonpregnant adult with Graves disease is starting drug therapy for hyperthyroidism. Which thionamide is usually preferred for most patients because it is generally favored over PTU?",
            options: ["Methimazole", "Propylthiouracil", "Levothyroxine", "Liothyronine", "Prednisone"],
            answer: "Methimazole",
            explanation: "Methimazole is generally preferred over PTU for most nonpregnant patients with hyperthyroidism.",
            objective: .indication,
            relatedDrugIds: ["d61", "d62"],
            tags: ["Mastery", "Hyperthyroidism", "Methimazole", "Preferred therapy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_032",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "Which antithyroid drug is classically preferred in the first trimester of pregnancy and is also remembered for blocking peripheral conversion of T4 to T3 in thyroid storm?",
            options: ["Propylthiouracil (PTU)", "Methimazole", "Levothyroxine", "Liothyronine", "Sitagliptin"],
            answer: "Propylthiouracil (PTU)",
            explanation: "PTU is high yield for two reasons: it is preferred in the first trimester and it also blocks peripheral conversion of T4 to T3, which is useful in thyroid storm.",
            objective: .pearl,
            relatedDrugIds: ["d62"],
            tags: ["Mastery", "PTU", "Pregnancy", "Thyroid storm"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_033",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient taking methimazole calls the clinic reporting fever and a very sore throat. Which serious adverse effect must be considered urgently with thionamide therapy?",
            options: ["Agranulocytosis", "Ototoxicity", "Pancreatitis", "Torsades de pointes", "Angioedema"],
            answer: "Agranulocytosis",
            explanation: "Methimazole and PTU can rarely cause agranulocytosis. Fever or sore throat should prompt urgent evaluation.",
            objective: .adverseEffect,
            relatedDrugIds: ["d61", "d62"],
            tags: ["Mastery", "Thionamides", "Agranulocytosis", "Counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_034",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A euthyroid patient asks for thyroid hormone solely to lose weight faster. Which response best reflects a high-yield boxed-warning pearl for levothyroxine?",
            options: ["Thyroid hormone should not be used for weight loss in euthyroid patients", "Levothyroxine is ideal for routine cosmetic weight loss", "Levothyroxine should be used whenever BMI is above 30", "Levothyroxine is safer for weight loss than GLP-1 agonists", "Levothyroxine works only if taken with methimazole"],
            answer: "Thyroid hormone should not be used for weight loss in euthyroid patients",
            explanation: "Levothyroxine carries a high-yield boxed-warning pearl: thyroid hormones should not be used for weight loss in euthyroid patients because toxicity can be serious.",
            objective: .contraindication,
            relatedDrugIds: ["d59"],
            tags: ["Mastery", "Levothyroxine", "Boxed warning", "Weight loss"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_035",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A levothyroxine dose was just adjusted today. Because thyroid hormone has a long half-life, when is the peak therapeutic effect of a given dose typically reached rather than judged after only a few days?",
            options: ["About 4 to 6 weeks", "12 hours", "24 hours", "2 to 3 days", "Within one meal"],
            answer: "About 4 to 6 weeks",
            explanation: "Levothyroxine has a long half-life, so the peak therapeutic effect at a given dose is reached over weeks rather than days.",
            objective: .monitoring,
            relatedDrugIds: ["d59"],
            tags: ["Mastery", "Levothyroxine", "TSH", "Monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_036",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "A patient with adrenal insufficiency needs physiologic steroid replacement rather than simply an anti-inflammatory steroid burst. Which corticosteroid in this module is the classic replacement choice because it also has meaningful mineralocorticoid activity?",
            options: ["Hydrocortisone", "Dexamethasone", "Prednisone", "Methylprednisolone", "Methimazole"],
            answer: "Hydrocortisone",
            explanation: "Hydrocortisone is the classic corticosteroid used for physiologic adrenal replacement and has more salt-retaining (mineralocorticoid) activity than the others in this module.",
            objective: .pearl,
            relatedDrugIds: ["d166", "d163", "d165"],
            tags: ["Mastery", "Steroids", "Hydrocortisone", "Replacement"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_037",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Which corticosteroid in this module is most classically remembered as very potent and having little to no significant mineralocorticoid activity?",
            options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Methylprednisolone", "Pioglitazone"],
            answer: "Dexamethasone",
            explanation: "Dexamethasone is the most potent steroid in this module and has minimal clinically significant mineralocorticoid activity.",
            objective: .pearl,
            relatedDrugIds: ["d165"],
            tags: ["Mastery", "Steroids", "Dexamethasone", "Potency"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_038",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .medium,
            question: "Which corticosteroid is the classic oral outpatient \"workhorse\" in this module, often taken in the morning and associated with hyperglycemia, osteoporosis, and adrenal suppression with longer courses?",
            options: ["Prednisone", "Hydrocortisone", "Methimazole", "Levothyroxine", "Insulin aspart"],
            answer: "Prednisone",
            explanation: "Prednisone is the common oral outpatient corticosteroid associated with classic steroid adverse effects such as hyperglycemia, osteoporosis, and adrenal suppression.",
            objective: .pearl,
            relatedDrugIds: ["d163"],
            tags: ["Mastery", "Steroids", "Prednisone", "Counseling"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_039",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .easy,
            question: "You are reviewing IV steroid names for acute inflammatory flares. Medrol and Solu-Medrol correspond to which generic corticosteroid?",
            options: ["Methylprednisolone", "Prednisone", "Hydrocortisone", "Dexamethasone", "Liothyronine"],
            answer: "Methylprednisolone",
            explanation: "Medrol and Solu-Medrol are brand names for methylprednisolone.",
            objective: .genericBrand,
            relatedDrugIds: ["d164"],
            tags: ["Mastery", "Steroids", "brand-generic", "Methylprednisolone"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_040",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient has been taking systemic corticosteroids for several weeks. Why is tapering often necessary instead of abruptly stopping the drug?",
            options: ["To reduce the risk of HPA-axis suppression and secondary adrenal insufficiency after withdrawal", "To prevent permanent diabetes insipidus", "To avoid irreversible thyroid failure", "To increase mineralocorticoid potency", "To prevent drug-induced neutropenia"],
            answer: "To reduce the risk of HPA-axis suppression and secondary adrenal insufficiency after withdrawal",
            explanation: "Longer courses of systemic corticosteroids can suppress the HPA axis. Gradual tapering helps reduce the risk of steroid-withdrawal adrenal insufficiency.",
            objective: .pearl,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["Mastery", "Steroids", "Taper", "HPA axis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_041",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient is receiving immunosuppressive doses of prednisone and asks about live vaccines. Which teaching point is most accurate?",
            options: ["Live or live-attenuated vaccines are generally contraindicated at immunosuppressive steroid doses", "Live vaccines are preferred because steroids improve vaccine response", "All vaccines are ineffective once any steroid is started", "Vaccines are only an issue with hydrocortisone, not prednisone", "Prednisone must be stopped for one full year before any vaccine"],
            answer: "Live or live-attenuated vaccines are generally contraindicated at immunosuppressive steroid doses",
            explanation: "At immunosuppressive corticosteroid doses, live or live-attenuated vaccines are generally contraindicated. Inactivated vaccines may be used, but response can be blunted.",
            objective: .contraindication,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["Mastery", "Steroids", "Vaccines", "Immunosuppression"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_042",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient stable on warfarin starts levothyroxine for hypothyroidism. Which monitoring test deserves closer follow-up because thyroid replacement can alter anticoagulant response?",
            options: ["INR", "TSH only", "Serum digoxin level", "QT interval", "Anti-Xa level"],
            answer: "INR",
            explanation: "Levothyroxine can alter warfarin response, so INR monitoring is a high-yield cross-module interaction pearl.",
            objective: .interaction,
            relatedDrugIds: ["d59", "d41"],
            tags: ["Mastery", "Cross-module", "Levothyroxine", "Warfarin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_043",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient uses insulin lispro for meals and propranolol for migraine prevention. Which counseling point is most important about this cross-module combination?",
            options: ["Propranolol can mask adrenergic warning signs of hypoglycemia", "Propranolol prevents all insulin-related hypoglycemia", "Lispro should never be used in patients with migraine", "The combination causes hyperthyroidism", "Propranolol converts lispro into a long-acting insulin"],
            answer: "Propranolol can mask adrenergic warning signs of hypoglycemia",
            explanation: "Nonselective beta blockers such as propranolol can blunt adrenergic warning symptoms of hypoglycemia, making insulin therapy riskier to recognize early.",
            objective: .interaction,
            relatedDrugIds: ["d47", "d18"],
            tags: ["Mastery", "Cross-module", "Insulin", "Propranolol"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_044",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient with heart failure is already taking furosemide and then starts empagliflozin for diabetes plus cardiorenal benefit. Which adverse-effect risk becomes especially important because both therapies can promote fluid loss?",
            options: ["Volume depletion and hypotension", "Bradykinin-mediated cough", "Agranulocytosis", "Severe constipation", "Hyperthyroidism"],
            answer: "Volume depletion and hypotension",
            explanation: "Furosemide and SGLT2 inhibitors can both contribute to fluid loss, so dizziness, orthostasis, and volume depletion are important cross-module counseling points.",
            objective: .interaction,
            relatedDrugIds: ["d51", "d11"],
            tags: ["Mastery", "Cross-module", "SGLT2", "Furosemide"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3g_add_045",
            subsectionId: DrugDataService.masteringEndocrineDiabetesSubsectionId,
            difficulty: .hard,
            question: "A patient takes low-dose aspirin for secondary cardiovascular prevention and then receives a longer course of prednisone. Which complication deserves extra counseling because this combination can increase risk?",
            options: ["GI irritation and bleeding", "Thyroid storm", "Profound bradycardia", "Angioedema", "Blue-gray skin discoloration"],
            answer: "GI irritation and bleeding",
            explanation: "Aspirin plus systemic corticosteroids can increase GI irritation and bleeding risk, so patients should be counseled to report melena, hematemesis, or persistent epigastric pain.",
            objective: .interaction,
            relatedDrugIds: ["d163", "d38"],
            tags: ["Mastery", "Cross-module", "Prednisone", "Aspirin"],
            source: .curated
        )

    ]
}
