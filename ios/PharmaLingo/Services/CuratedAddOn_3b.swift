// PharmaLingo — Module 3b (Metformin & Oral Agents Overview)
// Curated Add-On Question Pack (45 questions)
// IDs: q3b_add_001 ... q3b_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 3b exists, then append:
//
//    if bank["3b"] == nil { bank["3b"] = [] }
//    bank["3b"]?.append(contentsOf: Self.curatedAddOnQuestions_3b)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d45 (Metformin), d58 (Pioglitazone).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_3b: [Question] = [

.multipleChoice(
    id: "q3b_add_001",
    subsectionId: "3b",
    difficulty: .easy,
    question: "A patient newly diagnosed with type 2 diabetes is started on Glucophage, an oral medication that lowers hepatic glucose production and is often used as a foundation therapy. What is the generic name of Glucophage?",
    options: ["Metformin", "Pioglitazone", "Empagliflozin", "Sitagliptin", "Glipizide"],
    answer: "Metformin",
    explanation: "Glucophage is the brand name for metformin. This is a core pairing because metformin is the classic foundation oral agent in type 2 diabetes.",
    objective: .brandGeneric,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "Glucophage", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_002",
    subsectionId: "3b",
    difficulty: .easy,
    question: "Metformin is often chosen early in type 2 diabetes because it improves glycemic control without directly increasing insulin secretion. Which brand name matches metformin?",
    options: ["Actos", "Jardiance", "Glucophage", "Januvia", "Amaryl"],
    answer: "Glucophage",
    explanation: "Metformin is sold as Glucophage. Linking the generic to the brand helps reinforce this biguanide's role in type 2 diabetes.",
    objective: .genericBrand,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "Glucophage", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_003",
    subsectionId: "3b",
    difficulty: .easy,
    question: "A patient with type 2 diabetes is prescribed Actos, a thiazolidinedione that improves insulin sensitivity. What is the generic name of Actos?",
    options: ["Pioglitazone", "Metformin", "Glimepiride", "Sitagliptin", "Semaglutide"],
    answer: "Pioglitazone",
    explanation: "Actos is the brand name for pioglitazone. Remembering this pair matters because pioglitazone has several high-yield safety warnings.",
    objective: .brandGeneric,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "Actos", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_004",
    subsectionId: "3b",
    difficulty: .easy,
    question: "Pioglitazone is an oral insulin sensitizer used in type 2 diabetes, but it requires caution in patients with heart failure. Which brand name matches pioglitazone?",
    options: ["Actos", "Glucophage", "Farxiga", "Ozempic", "Victoza"],
    answer: "Actos",
    explanation: "Pioglitazone is sold as Actos. Knowing this brand-generic pair is high yield because Actos is tied to edema and heart failure counseling.",
    objective: .genericBrand,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "Actos", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_005",
    subsectionId: "3b",
    difficulty: .easy,
    question: "A student is reviewing oral diabetes drugs and sees that metformin lowers glucose without being an insulin secretagogue. Which drug class does metformin belong to?",
    options: ["Biguanide", "Thiazolidinedione", "SGLT2 inhibitor", "DPP-4 inhibitor", "Sulfonylurea"],
    answer: "Biguanide",
    explanation: "Metformin is a biguanide. Class recognition helps connect metformin to its hallmark mechanism, GI effects, lactic acidosis warning, and B12 pearl.",
    objective: .classId,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "biguanide", "class"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_006",
    subsectionId: "3b",
    difficulty: .easy,
    question: "Pioglitazone improves insulin sensitivity in peripheral tissues and liver through PPAR-gamma activity. Which class best describes pioglitazone?",
    options: ["Thiazolidinedione", "Biguanide", "Sulfonylurea", "GLP-1 receptor agonist", "SGLT2 inhibitor"],
    answer: "Thiazolidinedione",
    explanation: "Pioglitazone is a thiazolidinedione, often shortened to TZD. That class link helps you remember edema, fracture risk, and heart failure warnings.",
    objective: .classId,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "TZD", "class"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_007",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A resident wants an oral agent commonly used as the foundation of type 2 diabetes management because it improves glycemic control and has low hypoglycemia risk when used alone. Which 3b drug best fits that description?",
    options: ["Metformin", "Pioglitazone", "Glimepiride", "Sitagliptin", "Regular insulin"],
    answer: "Metformin",
    explanation: "Metformin is the classic foundation oral drug for type 2 diabetes. It lowers glucose without directly stimulating insulin release, so hypoglycemia is less likely when it is used alone.",
    objective: .indication,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "foundation therapy", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_008",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Which statement is most accurate about the approved use of the two drugs in subsection 3b?",
    options: ["Both are oral agents used as adjuncts to diet and exercise for type 2 diabetes", "Both are approved for type 1 diabetes", "Both are used mainly for diabetic ketoacidosis", "Only pioglitazone is used for type 2 diabetes", "Only metformin is an oral agent"],
    answer: "Both are oral agents used as adjuncts to diet and exercise for type 2 diabetes",
    explanation: "Both metformin and pioglitazone are oral agents used to improve glycemic control in type 2 diabetes as adjuncts to diet and exercise. They differ much more in mechanism and safety than in their broad indication.",
    objective: .indication,
    relatedDrugIds: ["d45", "d58"],
    tags: ["metformin", "pioglitazone", "shared indication"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_009",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient asks why their clinician says metformin is less likely to cause hypoglycemia by itself than a sulfonylurea. Which explanation is best?",
    options: ["It does not directly increase insulin secretion", "It irreversibly blocks pancreatic beta cells", "It stimulates glucagon release", "It causes glucose to spill into the urine", "It must be taken with food to work"],
    answer: "It does not directly increase insulin secretion",
    explanation: "Metformin lowers glucose without directly stimulating insulin secretion. That is why it generally has a lower hypoglycemia risk when used alone than insulin secretagogues such as sulfonylureas.",
    objective: .moa,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "hypoglycemia", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_010",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient with type 2 diabetes is told their medication mainly decreases hepatic glucose production while also improving insulin sensitivity. Which drug matches that mechanism?",
    options: ["Metformin", "Pioglitazone", "Glipizide", "Sitagliptin", "Dapagliflozin"],
    answer: "Metformin",
    explanation: "Metformin classically decreases hepatic glucose production and improves insulin sensitivity. That liver-focused mechanism is one of its hallmark teaching points.",
    objective: .moa,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "hepatic glucose production", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_011",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Which mechanism best describes metformin?",
    options: ["Decreases hepatic glucose production, decreases intestinal glucose absorption, and increases peripheral glucose uptake", "Activates PPAR-gamma to increase insulin sensitivity", "Blocks SGLT2 in the proximal tubule", "Stimulates insulin release from pancreatic beta cells", "Mimics GLP-1 to slow gastric emptying"],
    answer: "Decreases hepatic glucose production, decreases intestinal glucose absorption, and increases peripheral glucose uptake",
    explanation: "Metformin decreases hepatic glucose production, decreases intestinal absorption of glucose, and improves insulin sensitivity by increasing peripheral glucose uptake and utilization. This full mechanism helps distinguish it from other diabetes classes.",
    objective: .moa,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "full MOA", "biguanide"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_012",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient is prescribed an oral diabetes agent that works as a PPAR-gamma agonist and improves insulin sensitivity in adipose tissue, skeletal muscle, and liver. Which drug is it?",
    options: ["Pioglitazone", "Metformin", "Glimepiride", "Empagliflozin", "Liraglutide"],
    answer: "Pioglitazone",
    explanation: "Pioglitazone is the PPAR-gamma agonist in this subsection. That mechanism makes it an insulin sensitizer rather than an insulin secretagogue.",
    objective: .moa,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "PPAR-gamma", "mechanism"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_013",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Which statement about pioglitazone is most accurate?",
    options: ["It is not an insulin secretagogue and depends on the presence of insulin to work", "It causes insulin release regardless of blood glucose", "It lowers glucose by blocking intestinal carbohydrate digestion", "It is mainly used to treat diabetic ketoacidosis", "It must be taken before every meal"],
    answer: "It is not an insulin secretagogue and depends on the presence of insulin to work",
    explanation: "Pioglitazone is not an insulin secretagogue. It works by decreasing insulin resistance, so it depends on the presence of insulin rather than forcing the pancreas to release more.",
    objective: .moa,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "not secretagogue", "insulin sensitizer"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_014",
    subsectionId: "3b",
    difficulty: .easy,
    question: "A patient started on metformin develops loose stools and nausea during the first week of therapy. Which adverse effect profile best fits metformin?",
    options: ["GI upset such as diarrhea and nausea", "Severe bronchospasm and wheezing", "Gingival hyperplasia", "Dry cough from bradykinin buildup", "Urinary tract infection from glucosuria"],
    answer: "GI upset such as diarrhea and nausea",
    explanation: "Metformin commonly causes GI adverse effects such as diarrhea, nausea, and abdominal upset, especially when therapy is first started or titrated too quickly.",
    objective: .adverseEffect,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "GI upset", "diarrhea"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_015",
    subsectionId: "3b",
    difficulty: .easy,
    question: "A pharmacist wants to reduce early GI intolerance when counseling a patient starting metformin. Which instruction is most appropriate?",
    options: ["Take it with meals", "Take it on an empty stomach for best absorption", "Crush the tablets into juice", "Use it only as needed when glucose is high", "Stop after the first episode of diarrhea without contacting your clinician"],
    answer: "Take it with meals",
    explanation: "Taking metformin with meals can help lessen stomach upset. This is one of the simplest and most testable counseling points for the drug.",
    objective: .dosing,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "with meals", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_016",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient says metformin is helping their glucose but they had diarrhea after starting at a full dose. Which adjustment pearl most directly helps tolerance while keeping the drug on board?",
    options: ["Start low and titrate slowly", "Switch immediately to insulin", "Double the dose to overcome GI effects", "Take it only once weekly", "Add gemfibrozil to improve tolerance"],
    answer: "Start low and titrate slowly",
    explanation: "Metformin is often better tolerated when started low and titrated slowly. That approach reduces the common early GI adverse effects that make patients want to quit therapy.",
    objective: .pearl,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "titrate slowly", "GI tolerance"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_017",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient on a biguanide presents with malaise, abdominal discomfort, and concerning metabolic acidosis. Which serious warning is classically associated with metformin?",
    options: ["Lactic acidosis", "Congestive heart failure exacerbation", "Stevens-Johnson syndrome", "Agranulocytosis", "Torsades de pointes"],
    answer: "Lactic acidosis",
    explanation: "Metformin carries a boxed warning for lactic acidosis. It is rare but serious, so recognizing the risk and the setting in which it occurs is high yield.",
    objective: .contraindication,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "lactic acidosis", "boxed warning"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_018",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient on long-term metformin reports worsening numbness and fatigue. Which deficiency should a clinician keep on the differential and monitor for over time?",
    options: ["Vitamin B12 deficiency", "Vitamin K deficiency", "Iron overload", "Folate excess", "Vitamin C deficiency"],
    answer: "Vitamin B12 deficiency",
    explanation: "Metformin can lower vitamin B12 levels over time. This makes B12 deficiency an important long-term monitoring pearl, especially when neuropathy or fatigue develops.",
    objective: .monitoring,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "vitamin B12", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_019",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Before starting metformin and periodically during therapy, which parameter is especially important to monitor because renal impairment raises the risk of drug accumulation and lactic acidosis?",
    options: ["eGFR/renal function", "QT interval", "INR", "Serum digoxin level", "Serum uric acid"],
    answer: "eGFR/renal function",
    explanation: "Renal function should be assessed before metformin is started and periodically afterward. This is essential because worsening kidney function increases metformin accumulation and lactic acidosis risk.",
    objective: .monitoring,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "eGFR", "renal monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_020",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient with type 2 diabetes has an eGFR of 27 mL/min/1.73 m² before therapy is started. Which statement is most accurate?",
    options: ["Metformin is contraindicated at this renal function", "Pioglitazone is contraindicated solely because of renal function", "Both metformin and pioglitazone are contraindicated", "Metformin should be started at a higher dose", "Renal function does not matter for metformin"],
    answer: "Metformin is contraindicated at this renal function",
    explanation: "Metformin is contraindicated when eGFR is below 30 mL/min/1.73 m². This renal cutoff is a classic number worth memorizing.",
    objective: .contraindication,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "eGFR <30", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_021",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient with newly diagnosed type 2 diabetes has an eGFR of 38 mL/min/1.73 m². What is the best metformin-specific pearl?",
    options: ["Initiation is not recommended when eGFR is 30 to 45", "Metformin is preferred because renal impairment improves tolerability", "Metformin is mandatory if HbA1c is elevated", "Metformin should replace insulin in DKA", "No renal monitoring is needed"],
    answer: "Initiation is not recommended when eGFR is 30 to 45",
    explanation: "Metformin initiation is not recommended when eGFR is between 30 and 45 mL/min/1.73 m². This is a separate pearl from the absolute contraindication at eGFR below 30.",
    objective: .contraindication,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "eGFR 30-45", "renal pearl"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_022",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient taking metformin is scheduled for an iodinated contrast study and has an eGFR of 52 mL/min/1.73 m² plus a history of heart failure. Which plan matches label-based counseling?",
    options: ["Hold metformin at or before the procedure and recheck renal function before restarting", "Continue metformin with no precautions", "Double the metformin dose after the scan", "Replace metformin with pioglitazone only on the day of the scan", "Take metformin immediately after contrast to protect the kidneys"],
    answer: "Hold metformin at or before the procedure and recheck renal function before restarting",
    explanation: "Metformin should be held around certain iodinated contrast procedures in patients with renal-risk settings, and renal function is re-evaluated before restarting. The classic restart pearl is after renal function is stable.",
    objective: .interaction,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "contrast", "restart after procedure"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_023",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient arrives with diabetic ketoacidosis. Which statement about metformin is correct?",
    options: ["It is contraindicated in acute or chronic metabolic acidosis, including DKA", "It is the preferred oral treatment for DKA", "It should be used only if given with food", "It must be doubled in DKA", "It reverses ketone production within minutes"],
    answer: "It is contraindicated in acute or chronic metabolic acidosis, including DKA",
    explanation: "Metformin is contraindicated in acute or chronic metabolic acidosis, including diabetic ketoacidosis. That keeps it out of the acute DKA treatment toolbox.",
    objective: .contraindication,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "DKA", "metabolic acidosis"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_024",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient taking metformin asks about weekend binge drinking. Which counseling point is highest yield?",
    options: ["Excessive alcohol can increase the risk of lactic acidosis", "Alcohol is recommended because it reduces GI upset", "Alcohol completely blocks metformin absorption", "Alcohol prevents B12 deficiency", "Alcohol eliminates the need for renal monitoring"],
    answer: "Excessive alcohol can increase the risk of lactic acidosis",
    explanation: "Alcohol can potentiate metformin's effect on lactate metabolism. That is why excessive alcohol intake is an important counseling red flag with metformin.",
    objective: .interaction,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "alcohol", "lactic acidosis risk"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_025",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient stable on metformin is later started on insulin and begins having symptomatic hypoglycemia. Which explanation is best?",
    options: ["Metformin can increase hypoglycemia risk when combined with insulin or secretagogues", "Metformin alone always causes severe hypoglycemia", "Metformin converts into insulin in the liver", "Metformin directly blocks glucagon receptors", "Metformin causes hypoglycemia only if taken without water"],
    answer: "Metformin can increase hypoglycemia risk when combined with insulin or secretagogues",
    explanation: "Metformin alone has a low hypoglycemia risk, but that risk increases when it is combined with insulin or an insulin secretagogue. Dose reduction of the partner drug may be needed.",
    objective: .interaction,
    relatedDrugIds: ["d45"],
    tags: ["metformin", "insulin combination", "hypoglycemia"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_026",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A thiazolidinedione is being considered for a patient with type 2 diabetes. Which boxed warning should come to mind for pioglitazone?",
    options: ["It can cause or exacerbate congestive heart failure", "It causes fatal lactic acidosis in all patients", "It must never be used with meals", "It causes neutropenia requiring weekly CBCs", "It irreversibly damages the pancreas"],
    answer: "It can cause or exacerbate congestive heart failure",
    explanation: "Pioglitazone carries a boxed warning for congestive heart failure. This is one of the most important safety distinctions between pioglitazone and metformin.",
    objective: .contraindication,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "heart failure", "boxed warning"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_027",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient with established NYHA class IV heart failure needs diabetes therapy reviewed. Which drug from subsection 3b should not be initiated in that setting?",
    options: ["Pioglitazone", "Metformin", "Sitagliptin", "Glimepiride", "Insulin lispro"],
    answer: "Pioglitazone",
    explanation: "Initiation of pioglitazone is contraindicated in patients with established NYHA class III or IV heart failure. This is a classic must-not-miss contraindication.",
    objective: .contraindication,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "NYHA III-IV", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_028",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient already struggling with symptomatic heart failure is being considered for Actos. Which statement is most accurate?",
    options: ["Pioglitazone is not recommended in symptomatic heart failure", "Pioglitazone improves heart failure symptoms through diuresis", "Pioglitazone is preferred over all other diabetes agents in edema-prone patients", "Pioglitazone treats acute pulmonary edema", "Heart failure is irrelevant to pioglitazone use"],
    answer: "Pioglitazone is not recommended in symptomatic heart failure",
    explanation: "Pioglitazone is not recommended in symptomatic heart failure because it can cause fluid retention and worsen congestion. This is different from the stricter class III-IV initiation contraindication.",
    objective: .pearl,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "symptomatic HF", "avoid"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_029",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Two weeks after starting pioglitazone, a patient reports ankle swelling, rapid weight gain, and shortness of breath. What is the highest-yield interpretation?",
    options: ["Possible fluid retention and heart failure exacerbation", "Expected dehydration from osmotic diuresis", "Classic B12 deficiency", "Likely ACE inhibitor cough", "Harmless transient flushing"],
    answer: "Possible fluid retention and heart failure exacerbation",
    explanation: "Pioglitazone can cause dose-related fluid retention. Rapid weight gain, edema, and dyspnea should raise concern for worsening heart failure rather than simple nuisance swelling.",
    objective: .adverseEffect,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "edema", "HF exacerbation"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_030",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Which adverse effect profile most strongly points toward pioglitazone rather than metformin?",
    options: ["Edema and weight gain", "Diarrhea and nausea", "Lactic acidosis after contrast", "Vitamin B12 deficiency", "GI upset improved by meals"],
    answer: "Edema and weight gain",
    explanation: "Edema and weight gain are classic pioglitazone concerns because TZDs can cause fluid retention. The other options lean much more toward metformin pearls.",
    objective: .adverseEffect,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "weight gain", "edema"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_031",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A postmenopausal woman is prescribed pioglitazone for type 2 diabetes. Which long-term risk deserves extra attention?",
    options: ["Bone fractures", "Gingival hyperplasia", "Ototoxicity", "Dry cough", "Tinnitus"],
    answer: "Bone fractures",
    explanation: "Pioglitazone has been associated with increased fracture risk, especially in female patients. That makes bone health counseling a high-yield TZD pearl.",
    objective: .adverseEffect,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "fracture risk", "women"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_032",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient on pioglitazone develops new blurry vision. Which adverse effect should be considered?",
    options: ["Macular edema", "Acute angle-closure glaucoma from anticholinergics", "Corneal abrasion", "Cataract from short-term metformin use", "Optic neuritis from linezolid"],
    answer: "Macular edema",
    explanation: "Pioglitazone has postmarketing reports of macular edema. New visual changes should prompt attention rather than being brushed off as a minor complaint.",
    objective: .adverseEffect,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "macular edema", "vision"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_033",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient with active bladder cancer is having their diabetes regimen reviewed. Which oral 3b drug is the more concerning choice?",
    options: ["Pioglitazone", "Metformin", "Both equally", "Neither", "Regular insulin"],
    answer: "Pioglitazone",
    explanation: "Pioglitazone should not be used in patients with active bladder cancer. This warning is less famous than the heart failure boxed warning, but it is still very testable.",
    objective: .contraindication,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "bladder cancer", "avoid"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_034",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Before starting pioglitazone, which monitoring step is recommended because hepatic injury must remain on the radar?",
    options: ["Obtain baseline liver tests", "Obtain weekly INR", "Obtain routine troponins", "Obtain baseline TSH only", "Obtain creatine kinase after every dose"],
    answer: "Obtain baseline liver tests",
    explanation: "Baseline liver tests are recommended before starting pioglitazone. This helps separate TZD monitoring from metformin's stronger renal-function focus.",
    objective: .monitoring,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "baseline LFTs", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_035",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A patient taking pioglitazone reports fatigue, anorexia, right upper quadrant discomfort, dark urine, and jaundice. What is the highest-yield next thought?",
    options: ["Evaluate promptly for possible hepatic injury", "Reassure that these are expected GI effects", "Double the pioglitazone dose", "Tell the patient to take it with contrast dye", "Attribute the symptoms to B12 deficiency"],
    answer: "Evaluate promptly for possible hepatic injury",
    explanation: "Symptoms such as dark urine or jaundice on pioglitazone should prompt evaluation for possible hepatic injury. These are not routine nuisance effects.",
    objective: .monitoring,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "hepatic injury", "warning symptoms"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_036",
    subsectionId: "3b",
    difficulty: .easy,
    question: "A patient asks whether pioglitazone has to be coordinated with meals the way some other oral diabetes drugs do. What is the best answer?",
    options: ["It is taken once daily and can be taken without regard to meals", "It must be taken exactly 30 minutes before breakfast", "It should only be taken with the evening meal", "It must be taken with carbohydrate-containing food to activate it", "It should be taken only when blood sugar is high"],
    answer: "It is taken once daily and can be taken without regard to meals",
    explanation: "Pioglitazone is generally taken once daily and can be taken without regard to meals. That makes its day-to-day administration simpler than metformin's meal-based counseling pearl.",
    objective: .dosing,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "once daily", "without regard to meals"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_037",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient taking gemfibrozil is prescribed pioglitazone. Which dose pearl is most accurate?",
    options: ["Limit pioglitazone to a maximum of 15 mg daily", "Increase pioglitazone to 60 mg daily", "Stop gemfibrozil because it lowers pioglitazone levels", "Take pioglitazone every other week", "No dose adjustment principle applies"],
    answer: "Limit pioglitazone to a maximum of 15 mg daily",
    explanation: "Strong CYP2C8 inhibitors such as gemfibrozil raise pioglitazone exposure, so the maximum recommended pioglitazone dose becomes 15 mg daily in that setting.",
    objective: .interaction,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "gemfibrozil", "dose limit"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_038",
    subsectionId: "3b",
    difficulty: .hard,
    question: "Why is gemfibrozil a classic interaction to remember with pioglitazone?",
    options: ["It increases pioglitazone exposure as a strong CYP2C8 inhibitor", "It blocks metformin absorption in the gut", "It prevents all TZDs from working", "It eliminates fracture risk", "It converts pioglitazone into an active sulfonylurea"],
    answer: "It increases pioglitazone exposure as a strong CYP2C8 inhibitor",
    explanation: "Gemfibrozil is a strong CYP2C8 inhibitor and significantly increases pioglitazone exposure. That is why dose limitation and interaction recognition matter.",
    objective: .interaction,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "CYP2C8", "gemfibrozil"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_039",
    subsectionId: "3b",
    difficulty: .medium,
    question: "A premenopausal patient with irregular periods starts pioglitazone. Which counseling point is high yield?",
    options: ["It may restore ovulation and increase the chance of unintended pregnancy", "It guarantees infertility", "It must be stopped during every menstrual period", "It prevents pregnancy as a secondary effect", "It causes permanent amenorrhea"],
    answer: "It may restore ovulation and increase the chance of unintended pregnancy",
    explanation: "Pioglitazone can lead to ovulation in some anovulatory premenopausal women. That makes pregnancy counseling a real pearl, not a trivia point.",
    objective: .pearl,
    relatedDrugIds: ["d58"],
    tags: ["pioglitazone", "ovulation", "pregnancy counseling"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_040",
    subsectionId: "3b",
    difficulty: .hard,
    question: "Which drug pair is matched correctly with its hallmark caution?",
    options: ["Metformin—lactic acidosis and B12 deficiency risk; Pioglitazone—edema and heart failure warning", "Metformin—heart failure exacerbation; Pioglitazone—B12 deficiency", "Metformin—macular edema; Pioglitazone—iodinated contrast hold", "Metformin—fractures; Pioglitazone—lactic acidosis", "Metformin—bladder cancer; Pioglitazone—dry cough"],
    answer: "Metformin—lactic acidosis and B12 deficiency risk; Pioglitazone—edema and heart failure warning",
    explanation: "Metformin's classic cautions include lactic acidosis risk and vitamin B12 deficiency, while pioglitazone is tied to edema and heart failure warnings. Keeping those patterns separate is high yield.",
    objective: .mixedReview,
    relatedDrugIds: ["d45", "d58"],
    tags: ["metformin", "pioglitazone", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_041",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient on oral diabetes therapy is heading for coronary angiography with intra-arterial contrast. Which drug from subsection 3b is the one most classically held around the procedure when renal-risk factors are present?",
    options: ["Metformin", "Pioglitazone", "Both always", "Neither ever", "Glimepiride"],
    answer: "Metformin",
    explanation: "Metformin is the classic oral diabetes drug that may need to be held around iodinated contrast procedures in the right renal-risk setting. This is a favorite monitoring and counseling pearl.",
    objective: .mixedReview,
    relatedDrugIds: ["d45", "d58"],
    tags: ["metformin", "contrast hold", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_042",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A patient with symptomatic HFrEF and chronic leg edema needs their diabetes regimen reviewed. Which drug from subsection 3b is the red flag because it can worsen fluid retention?",
    options: ["Pioglitazone", "Metformin", "Sitagliptin", "Regular insulin", "Semaglutide"],
    answer: "Pioglitazone",
    explanation: "Pioglitazone can cause fluid retention and worsen heart failure, making it the red flag choice in a patient with symptomatic HFrEF and edema.",
    objective: .mixedReview,
    relatedDrugIds: ["d45", "d58"],
    tags: ["pioglitazone", "heart failure", "comparison"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_043",
    subsectionId: "3b",
    difficulty: .medium,
    question: "Which statement best distinguishes the day-to-day administration pearls for the two subsection 3b drugs?",
    options: ["Metformin is usually taken with meals, whereas pioglitazone can be taken without regard to meals", "Pioglitazone must be taken with every meal", "Metformin is given only once weekly", "Both drugs must be taken on an empty stomach", "Neither drug has any administration counseling"],
    answer: "Metformin is usually taken with meals, whereas pioglitazone can be taken without regard to meals",
    explanation: "Metformin is usually taken with meals to improve GI tolerability, while pioglitazone can be taken without regard to meals. This is a practical counseling contrast students should know.",
    objective: .mixedReview,
    relatedDrugIds: ["d45", "d58"],
    tags: ["administration", "metformin", "pioglitazone"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_044",
    subsectionId: "3b",
    difficulty: .hard,
    question: "Which drug in subsection 3b is the one for which baseline liver tests are specifically recommended before starting, rather than renal function plus contrast precautions being the main monitoring pearl?",
    options: ["Pioglitazone", "Metformin", "Both equally", "Neither", "Regular insulin"],
    answer: "Pioglitazone",
    explanation: "Pioglitazone stands out for baseline liver-test monitoring, while metformin is more strongly associated with renal-function checks and contrast-related precautions.",
    objective: .mixedReview,
    relatedDrugIds: ["d45", "d58"],
    tags: ["pioglitazone", "liver tests", "monitoring compare"],
    source: .curated
),

.multipleChoice(
    id: "q3b_add_045",
    subsectionId: "3b",
    difficulty: .hard,
    question: "A student is trying to keep the boxed warnings straight between the two main oral drugs in 3b. Which pairing is correct?",
    options: ["Metformin—lactic acidosis; Pioglitazone—congestive heart failure", "Metformin—congestive heart failure; Pioglitazone—tendon rupture", "Metformin—pancreatitis; Pioglitazone—lactic acidosis", "Metformin—angioedema; Pioglitazone—aplastic anemia", "Metformin—QT prolongation; Pioglitazone—pulmonary fibrosis"],
    answer: "Metformin—lactic acidosis; Pioglitazone—congestive heart failure",
    explanation: "Metformin's boxed warning centers on lactic acidosis, while pioglitazone's boxed warning centers on congestive heart failure. Keeping those two warnings straight is essential for safe prescribing.",
    objective: .mixedReview,
    relatedDrugIds: ["d45", "d58"],
    tags: ["boxed warnings", "metformin", "pioglitazone"],
    source: .curated
)

    ]
}
