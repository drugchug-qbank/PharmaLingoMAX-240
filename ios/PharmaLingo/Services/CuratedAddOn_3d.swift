// PharmaLingo — Module 3d (GLP-1, DPP-4, Sulfonylureas)
// Curated Add-On Question Pack (45 questions)
// IDs: q3d_add_001 ... q3d_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 3d exists, then append:
//
//    if bank["3d"] == nil { bank["3d"] = [] }
//    bank["3d"]?.append(contentsOf: Self.curatedAddOnQuestions_3d)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are intentionally written in a teaching style and to avoid exact duplicates
//   of the current auto-generated templates.
// - relatedDrugIds use the uploaded repo IDs: d53 (Semaglutide), d54 (Liraglutide),
//   d55 (Sitagliptin), d56 (Glipizide), d57 (Glimepiride).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_3d: [Question] = [

    .multipleChoice(
        id: "q3d_add_001",
        subsectionId: "3d",
        difficulty: .easy,
        question: "A patient with type 2 diabetes and obesity is started on Ozempic/Wegovy, a GLP-1 receptor agonist known for weight loss and cardiometabolic benefits. What is the generic name of Ozempic/Wegovy?",
        options: ["Semaglutide", "Liraglutide", "Sitagliptin", "Glimepiride", "Glipizide"],
        answer: "Semaglutide",
        explanation: "Ozempic and Wegovy are brand names for semaglutide. This is a high-yield pair because semaglutide shows up under different brand names depending on the indication.",
        objective: .brandGeneric,
        relatedDrugIds: ["d53"],
        tags: ["semaglutide", "Ozempic/Wegovy", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_002",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Semaglutide is a GLP-1 receptor agonist used in diabetes and chronic weight management. Which brand pairing matches semaglutide in this subsection?",
        options: ["Ozempic/Wegovy", "Victoza/Saxenda", "Januvia", "Amaryl", "Glucotrol"],
        answer: "Ozempic/Wegovy",
        explanation: "Semaglutide is marketed here as Ozempic and Wegovy. Remembering the brand split helps separate diabetes-focused and obesity-focused use.",
        objective: .genericBrand,
        relatedDrugIds: ["d53"],
        tags: ["semaglutide", "Ozempic/Wegovy", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_003",
        subsectionId: "3d",
        difficulty: .easy,
        question: "A patient with type 2 diabetes and established cardiovascular disease is prescribed Victoza/Saxenda, a GLP-1 receptor agonist. What is the generic name of Victoza/Saxenda?",
        options: ["Liraglutide", "Semaglutide", "Sitagliptin", "Glipizide", "Glimepiride"],
        answer: "Liraglutide",
        explanation: "Victoza and Saxenda are brand names for liraglutide. This pair is worth mastering because the same generic appears under different brands depending on the treatment goal.",
        objective: .brandGeneric,
        relatedDrugIds: ["d54"],
        tags: ["liraglutide", "Victoza/Saxenda", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_004",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Liraglutide is a daily GLP-1 receptor agonist used for type 2 diabetes and weight management. Which brand pairing matches liraglutide?",
        options: ["Januvia", "Ozempic/Wegovy", "Victoza/Saxenda", "Glucotrol", "Amaryl"],
        answer: "Victoza/Saxenda",
        explanation: "Liraglutide is sold as Victoza and Saxenda. The key teaching point is that one generic can show up with different brands tied to different indications.",
        objective: .genericBrand,
        relatedDrugIds: ["d54"],
        tags: ["liraglutide", "Victoza/Saxenda", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_005",
        subsectionId: "3d",
        difficulty: .easy,
        question: "A patient who wants an oral, weight-neutral add-on for type 2 diabetes is started on Januvia, a DPP-4 inhibitor. What is the generic name of Januvia?",
        options: ["Sitagliptin", "Semaglutide", "Liraglutide", "Glimepiride", "Glipizide"],
        answer: "Sitagliptin",
        explanation: "Januvia is the brand name for sitagliptin. This is a classic DPP-4 brand-generic pair that contrasts well with the injectable GLP-1 drugs in the same subsection.",
        objective: .brandGeneric,
        relatedDrugIds: ["d55"],
        tags: ["sitagliptin", "Januvia", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_006",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Sitagliptin is an oral DPP-4 inhibitor used as an adjunct to diet and exercise in type 2 diabetes. Which brand name matches sitagliptin?",
        options: ["Victoza", "Januvia", "Ozempic", "Amaryl", "Farxiga"],
        answer: "Januvia",
        explanation: "Sitagliptin is marketed as Januvia. Knowing this pair helps distinguish the weight-neutral DPP-4 option from GLP-1 receptor agonists and sulfonylureas.",
        objective: .genericBrand,
        relatedDrugIds: ["d55"],
        tags: ["sitagliptin", "Januvia", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_007",
        subsectionId: "3d",
        difficulty: .easy,
        question: "A patient taking Amaryl is using an older oral diabetes drug that lowers glucose by increasing insulin release. What is the generic name of Amaryl?",
        options: ["Glimepiride", "Glipizide", "Sitagliptin", "Metformin", "Pioglitazone"],
        answer: "Glimepiride",
        explanation: "Amaryl is the brand name for glimepiride. It is a sulfonylurea, so brand recognition should also cue hypoglycemia and weight gain risk.",
        objective: .brandGeneric,
        relatedDrugIds: ["d57"],
        tags: ["glimepiride", "Amaryl", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_008",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Glimepiride is a sulfonylurea used for type 2 diabetes and is well known for hypoglycemia risk if meals are skipped. Which brand name matches glimepiride?",
        options: ["Glucotrol", "Amaryl", "Januvia", "Actos", "Ozempic"],
        answer: "Amaryl",
        explanation: "Glimepiride is sold as Amaryl. Connecting the drug to its class helps reinforce the oral secretagogue mechanism and the main adverse effects.",
        objective: .genericBrand,
        relatedDrugIds: ["d57"],
        tags: ["glimepiride", "Amaryl", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_009",
        subsectionId: "3d",
        difficulty: .easy,
        question: "A patient is prescribed Glucotrol, a sulfonylurea that is often taken before meals to improve postprandial glucose control. What is the generic name of Glucotrol?",
        options: ["Glipizide", "Glimepiride", "Sitagliptin", "Semaglutide", "Liraglutide"],
        answer: "Glipizide",
        explanation: "Glucotrol is the brand name for glipizide. This pair is especially useful because glipizide is one of the classic meal-linked sulfonylureas.",
        objective: .brandGeneric,
        relatedDrugIds: ["d56"],
        tags: ["glipizide", "Glucotrol", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_010",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Glipizide is an oral sulfonylurea that lowers blood sugar by stimulating insulin release from pancreatic beta cells. Which brand name matches glipizide?",
        options: ["Amaryl", "Januvia", "Glucotrol", "Victoza", "Wegovy"],
        answer: "Glucotrol",
        explanation: "Glipizide is marketed as Glucotrol. Knowing this brand helps you quickly connect it to the sulfonylurea adverse-effect profile.",
        objective: .genericBrand,
        relatedDrugIds: ["d56"],
        tags: ["glipizide", "Glucotrol", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_011",
        subsectionId: "3d",
        difficulty: .easy,
        question: "A learner notices that both semaglutide and liraglutide end in -glutide. That suffix should make you think of which drug class?",
        options: ["GLP-1 receptor agonists", "DPP-4 inhibitors", "Sulfonylureas", "Biguanides", "SGLT2 inhibitors"],
        answer: "GLP-1 receptor agonists",
        explanation: "The -glutide suffix is the clue for GLP-1 receptor agonists. In this subsection, semaglutide and liraglutide are the two key examples.",
        objective: .suffixId,
        relatedDrugIds: ["d53", "d54"],
        tags: ["suffix", "-glutide", "GLP-1"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_012",
        subsectionId: "3d",
        difficulty: .easy,
        question: "A student sees the suffix -gliptin on sitagliptin and wants to classify it quickly. Which class does that suffix usually indicate?",
        options: ["DPP-4 inhibitors", "GLP-1 receptor agonists", "Sulfonylureas", "Thiazolidinediones", "SGLT2 inhibitors"],
        answer: "DPP-4 inhibitors",
        explanation: "The -gliptin suffix points to the DPP-4 inhibitor class. Sitagliptin is the representative drug from this subsection.",
        objective: .suffixId,
        relatedDrugIds: ["d55"],
        tags: ["suffix", "-gliptin", "DPP-4"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_013",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Glipizide and glimepiride are older oral diabetes medications that can be effective but are limited by hypoglycemia and weight gain. Which class do they belong to?",
        options: ["Sulfonylureas", "GLP-1 receptor agonists", "DPP-4 inhibitors", "Biguanides", "SGLT2 inhibitors"],
        answer: "Sulfonylureas",
        explanation: "Glipizide and glimepiride are sulfonylureas. If you identify the class, you should immediately think insulin release, hypoglycemia, and weight gain.",
        objective: .classId,
        relatedDrugIds: ["d56", "d57"],
        tags: ["sulfonylurea", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_014",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Which subsection 3d drug is the weekly GLP-1 receptor agonist most associated with substantial weight loss?",
        options: ["Semaglutide", "Liraglutide", "Sitagliptin", "Glipizide", "Glimepiride"],
        answer: "Semaglutide",
        explanation: "Semaglutide is the weekly GLP-1 receptor agonist in this subsection. That weekly schedule is a major way to distinguish it from liraglutide, which is given daily.",
        objective: .pearl,
        relatedDrugIds: ["d53"],
        tags: ["weekly", "GLP-1", "weight loss"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_015",
        subsectionId: "3d",
        difficulty: .easy,
        question: "Which subsection 3d drug is the daily GLP-1 receptor agonist rather than the weekly one?",
        options: ["Liraglutide", "Semaglutide", "Sitagliptin", "Glipizide", "Glimepiride"],
        answer: "Liraglutide",
        explanation: "Liraglutide is the daily GLP-1 receptor agonist. This daily-vs-weekly distinction is one of the fastest ways to separate liraglutide from semaglutide.",
        objective: .pearl,
        relatedDrugIds: ["d54"],
        tags: ["daily", "GLP-1", "administration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_016",
        subsectionId: "3d",
        difficulty: .medium,
        question: "GLP-1 receptor agonists are high yield because they do more than just lower A1c. Which mechanism best explains how semaglutide and liraglutide work?",
        options: ["They activate the GLP-1 receptor, increasing glucose-dependent insulin secretion while reducing glucagon and slowing gastric emptying", "They block DPP-4 to prevent incretin breakdown", "They close ATP-sensitive potassium channels to trigger insulin release regardless of glucose level", "They reduce hepatic gluconeogenesis as their primary action", "They block glucose reabsorption in the proximal tubule"],
        answer: "They activate the GLP-1 receptor, increasing glucose-dependent insulin secretion while reducing glucagon and slowing gastric emptying",
        explanation: "Semaglutide and liraglutide are GLP-1 receptor agonists. Their mechanism explains why they can lower glucose, promote satiety, and contribute to weight loss.",
        objective: .moa,
        relatedDrugIds: ["d53", "d54"],
        tags: ["GLP-1", "mechanism", "gastric emptying"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_017",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Sitagliptin does not mimic GLP-1 directly. Instead, what is its main mechanism of action?",
        options: ["It inhibits DPP-4, increasing endogenous incretin activity", "It stimulates insulin release by closing pancreatic potassium channels", "It activates the GLP-1 receptor directly", "It blocks intestinal glucose absorption", "It increases urinary glucose excretion"],
        answer: "It inhibits DPP-4, increasing endogenous incretin activity",
        explanation: "Sitagliptin is a DPP-4 inhibitor. By slowing incretin breakdown, it boosts the body's own incretin effect instead of directly acting like a GLP-1 agonist.",
        objective: .moa,
        relatedDrugIds: ["d55"],
        tags: ["DPP-4", "mechanism", "incretin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_018",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Glipizide and glimepiride lower blood glucose through which mechanism?",
        options: ["They close ATP-sensitive potassium channels in pancreatic beta cells, stimulating insulin release", "They increase urinary glucose excretion in the kidney", "They inhibit DPP-4 and prolong incretin signaling", "They activate PPAR-gamma to improve insulin sensitivity", "They block hepatic glucose production without increasing insulin release"],
        answer: "They close ATP-sensitive potassium channels in pancreatic beta cells, stimulating insulin release",
        explanation: "Sulfonylureas such as glipizide and glimepiride stimulate insulin release directly. That is why they work, but it is also why they can cause hypoglycemia.",
        objective: .moa,
        relatedDrugIds: ["d56", "d57"],
        tags: ["sulfonylurea", "mechanism", "insulin release"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_019",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Why is sitagliptin generally less likely to cause hypoglycemia when used alone than glipizide or glimepiride?",
        options: ["It enhances incretin signaling rather than forcing insulin release regardless of glucose level", "It permanently suppresses glucagon secretion", "It is always taken with food", "It cannot be combined with other diabetes drugs", "It is excreted unchanged and therefore cannot lower glucose too far"],
        answer: "It enhances incretin signaling rather than forcing insulin release regardless of glucose level",
        explanation: "Sitagliptin works through the incretin pathway and is not a direct insulin secretagogue. Sulfonylureas are more likely to overshoot because they stimulate insulin release more directly.",
        objective: .pearl,
        relatedDrugIds: ["d55", "d56", "d57"],
        tags: ["hypoglycemia", "comparison", "incretin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_020",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient wants a diabetes medication from subsection 3d that is most associated with weight loss rather than weight neutrality or weight gain. Which class best fits?",
        options: ["GLP-1 receptor agonists", "DPP-4 inhibitors", "Sulfonylureas", "Biguanides", "Thiazolidinediones"],
        answer: "GLP-1 receptor agonists",
        explanation: "In this subsection, GLP-1 receptor agonists are the class most associated with meaningful weight loss. Sitagliptin tends to be weight neutral, and sulfonylureas tend to cause weight gain.",
        objective: .classId,
        relatedDrugIds: ["d53", "d54", "d55", "d56", "d57"],
        tags: ["weight", "class comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_021",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which subsection 3d class is usually described as weight neutral rather than weight loss or weight gain?",
        options: ["DPP-4 inhibitors", "GLP-1 receptor agonists", "Sulfonylureas", "Insulins", "Thiazolidinediones"],
        answer: "DPP-4 inhibitors",
        explanation: "Sitagliptin, the DPP-4 inhibitor in this subsection, is typically weight neutral. That makes it a useful contrast against GLP-1 receptor agonists and sulfonylureas.",
        objective: .classId,
        relatedDrugIds: ["d55"],
        tags: ["weight neutral", "DPP-4"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_022",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which subsection 3d class is most strongly linked to both hypoglycemia and weight gain?",
        options: ["Sulfonylureas", "GLP-1 receptor agonists", "DPP-4 inhibitors", "SGLT2 inhibitors", "Biguanides"],
        answer: "Sulfonylureas",
        explanation: "Sulfonylureas such as glipizide and glimepiride are the class to remember for hypoglycemia plus weight gain. This combination is a major reason newer agents are often preferred when possible.",
        objective: .classId,
        relatedDrugIds: ["d56", "d57"],
        tags: ["sulfonylurea", "hypoglycemia", "weight gain"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_023",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient with type 2 diabetes and obesity wants the subsection 3d option that is weekly and strongly associated with weight loss. Which drug best fits?",
        options: ["Semaglutide", "Liraglutide", "Sitagliptin", "Glipizide", "Glimepiride"],
        answer: "Semaglutide",
        explanation: "Semaglutide is the weekly GLP-1 receptor agonist in this subsection and is strongly associated with weight loss. This makes it a common high-yield choice in patients with T2DM plus obesity.",
        objective: .indication,
        relatedDrugIds: ["d53"],
        tags: ["T2DM", "obesity", "weekly"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_024",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient with type 2 diabetes and known heart disease wants a daily injectable agent from subsection 3d that can also reduce major cardiovascular events. Which drug best matches that profile?",
        options: ["Liraglutide", "Semaglutide", "Sitagliptin", "Glipizide", "Glimepiride"],
        answer: "Liraglutide",
        explanation: "Victoza, the diabetes brand of liraglutide, is labeled to reduce major adverse cardiovascular events in adults with type 2 diabetes and established cardiovascular disease. The daily injection clue helps separate it from semaglutide.",
        objective: .indication,
        relatedDrugIds: ["d54"],
        tags: ["MACE", "T2DM", "CVD"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_025",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient wants an oral add-on for type 2 diabetes, prefers to avoid injections, and is especially concerned about both hypoglycemia and weight gain. Which subsection 3d drug is the best fit?",
        options: ["Sitagliptin", "Glipizide", "Glimepiride", "Liraglutide", "Semaglutide"],
        answer: "Sitagliptin",
        explanation: "Sitagliptin is oral, generally weight neutral, and carries a lower hypoglycemia risk when used alone than sulfonylureas. That makes it the best fit among the choices provided.",
        objective: .indication,
        relatedDrugIds: ["d55"],
        tags: ["oral", "weight neutral", "low hypoglycemia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_026",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient with obesity is prescribed the liraglutide brand specifically marketed for chronic weight management rather than the diabetes brand. Which brand is that?",
        options: ["Victoza", "Saxenda", "Januvia", "Ozempic", "Amaryl"],
        answer: "Saxenda",
        explanation: "Saxenda is the weight-management brand of liraglutide. Victoza is the diabetes brand name for the same active ingredient.",
        objective: .indication,
        relatedDrugIds: ["d54"],
        tags: ["liraglutide", "Saxenda", "obesity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_027",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient with obesity is prescribed the semaglutide brand specifically marketed for chronic weight management rather than the diabetes brand. Which brand is that?",
        options: ["Ozempic", "Wegovy", "Victoza", "Januvia", "Glucotrol"],
        answer: "Wegovy",
        explanation: "Wegovy is the weight-management brand of semaglutide. Ozempic is the diabetes brand most students associate with semaglutide.",
        objective: .indication,
        relatedDrugIds: ["d53"],
        tags: ["semaglutide", "Wegovy", "obesity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_028",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient starting Ozempic asks why the first weekly dose is so low. Which statement is most accurate?",
        options: ["The 0.25 mg weekly starting dose is for treatment initiation and is not intended to provide full glycemic control", "The initial weekly dose is chosen mainly to avoid renal toxicity", "The first dose is intentionally subtherapeutic because semaglutide only works after 3 months", "The starting dose is low because the drug must be combined with insulin to work", "The first dose is low to avoid severe hypoglycemia caused by direct insulin release"],
        answer: "The 0.25 mg weekly starting dose is for treatment initiation and is not intended to provide full glycemic control",
        explanation: "Semaglutide is started low and titrated upward. The initial dose is mainly a titration step rather than the fully effective maintenance dose for glycemic control.",
        objective: .dosing,
        relatedDrugIds: ["d53"],
        tags: ["semaglutide", "titration", "weekly"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_029",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient starting Victoza asks why therapy begins at 0.6 mg once daily rather than the higher maintenance dose. Which explanation is best?",
        options: ["The starting dose is mainly used to reduce gastrointestinal adverse effects and is not fully effective for adult glycemic control", "The drug only works if started below 1 mg because of renal dosing rules", "The starting dose is used to avoid permanent thyroid injury", "The lower dose is chosen because liraglutide causes immediate severe hypoglycemia", "The starting dose is required only when liraglutide is combined with metformin"],
        answer: "The starting dose is mainly used to reduce gastrointestinal adverse effects and is not fully effective for adult glycemic control",
        explanation: "Liraglutide is started at 0.6 mg daily to improve tolerability, especially gastrointestinal symptoms. It is then titrated up as needed for glycemic control.",
        objective: .dosing,
        relatedDrugIds: ["d54"],
        tags: ["liraglutide", "titration", "GI tolerability"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_030",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which statement reflects an important limitation of use for Januvia?",
        options: ["It is not indicated for type 1 diabetes or diabetic ketoacidosis", "It is contraindicated in all patients with obesity", "It must always be used with insulin", "It is approved only for gestational diabetes", "It should only be used if the patient has established cardiovascular disease"],
        answer: "It is not indicated for type 1 diabetes or diabetic ketoacidosis",
        explanation: "Sitagliptin is used for type 2 diabetes, not for type 1 diabetes or diabetic ketoacidosis. This is a common class-level distinction worth remembering for DPP-4 inhibitors.",
        objective: .contraindication,
        relatedDrugIds: ["d55"],
        tags: ["limitation of use", "T1DM", "DKA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_031",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Both semaglutide and liraglutide carry a boxed warning related to which serious safety concern?",
        options: ["Risk of thyroid C-cell tumors", "Severe lactic acidosis", "Fatal agranulocytosis", "Tendon rupture", "Pulmonary fibrosis"],
        answer: "Risk of thyroid C-cell tumors",
        explanation: "GLP-1 receptor agonists such as semaglutide and liraglutide carry a boxed warning about thyroid C-cell tumors seen in rodents. That warning is one of the signature counseling points for this class.",
        objective: .contraindication,
        relatedDrugIds: ["d53", "d54"],
        tags: ["boxed warning", "MTC", "GLP-1"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_032",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which history would make semaglutide or liraglutide a poor choice because of a labeled contraindication?",
        options: ["Personal or family history of medullary thyroid carcinoma or MEN 2", "Past episode of uncomplicated cystitis", "Seasonal allergic rhinitis", "Controlled hypothyroidism on levothyroxine", "Mild iron-deficiency anemia"],
        answer: "Personal or family history of medullary thyroid carcinoma or MEN 2",
        explanation: "Semaglutide and liraglutide are contraindicated in patients with a personal or family history of medullary thyroid carcinoma or with MEN 2. That is the clinical consequence of the boxed warning.",
        objective: .contraindication,
        relatedDrugIds: ["d53", "d54"],
        tags: ["MTC", "MEN2", "contraindication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_033",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient newly started on semaglutide or liraglutide reports nausea, early satiety, and occasional vomiting during dose escalation. Which adverse-effect pattern is most likely?",
        options: ["Common gastrointestinal effects seen with GLP-1 receptor agonists", "Classic bullous pemphigoid from DPP-4 inhibition", "Dose-limiting hemolysis from sulfonylureas", "Expected diabetic ketoacidosis", "Statin-associated myopathy"],
        answer: "Common gastrointestinal effects seen with GLP-1 receptor agonists",
        explanation: "Nausea and other gastrointestinal symptoms are among the most common adverse effects of GLP-1 receptor agonists. This is why both semaglutide and liraglutide are titrated gradually.",
        objective: .adverseEffect,
        relatedDrugIds: ["d53", "d54"],
        tags: ["GI", "nausea", "GLP-1"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_034",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which serious adverse effect is shared by semaglutide, liraglutide, and sitagliptin and should be considered if a patient develops persistent severe abdominal pain?",
        options: ["Pancreatitis", "Ototoxicity", "Aplastic anemia", "Torsades de pointes", "Rhabdomyolysis"],
        answer: "Pancreatitis",
        explanation: "Semaglutide, liraglutide, and sitagliptin all have pancreatitis warnings or precautions. Persistent severe abdominal pain, sometimes radiating to the back, is a classic red flag.",
        objective: .adverseEffect,
        relatedDrugIds: ["d53", "d54", "d55"],
        tags: ["pancreatitis", "abdominal pain", "shared risk"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_035",
        subsectionId: "3d",
        difficulty: .hard,
        question: "A patient with pre-existing diabetic retinopathy starts a weekly GLP-1 receptor agonist and is told to report vision changes promptly. Which drug is the most likely reason for that counseling pearl?",
        options: ["Semaglutide", "Liraglutide", "Sitagliptin", "Glipizide", "Glimepiride"],
        answer: "Semaglutide",
        explanation: "Semaglutide labeling includes a warning about diabetic retinopathy complications, especially in patients who already have retinopathy. That makes eye-symptom counseling particularly high yield for semaglutide.",
        objective: .monitoring,
        relatedDrugIds: ["d53"],
        tags: ["retinopathy", "vision", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_036",
        subsectionId: "3d",
        difficulty: .hard,
        question: "A patient taking several oral medications is started on Ozempic. Which counseling point best reflects a labeled interaction pearl?",
        options: ["Semaglutide delays gastric emptying and may affect absorption of oral medications", "Semaglutide strongly induces CYP3A4 and lowers oral drug levels", "Semaglutide chelates iron in the gut", "Semaglutide irreversibly inhibits platelet aggregation", "Semaglutide increases urinary excretion of all oral drugs"],
        answer: "Semaglutide delays gastric emptying and may affect absorption of oral medications",
        explanation: "Semaglutide delays gastric emptying, so absorption of concomitant oral medications may be affected. This is a useful mechanism-based counseling pearl for GLP-1 receptor agonists.",
        objective: .interaction,
        relatedDrugIds: ["d53"],
        tags: ["gastric emptying", "oral medications", "interaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_037",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which pair should NOT be used together because both contain liraglutide and coadministration with other GLP-1 receptor agonists is not recommended?",
        options: ["Victoza and Saxenda", "Ozempic and Januvia", "Amaryl and Januvia", "Glucotrol and Amaryl", "Saxenda and metformin"],
        answer: "Victoza and Saxenda",
        explanation: "Victoza and Saxenda are both liraglutide products. Using them together would duplicate the same active ingredient and also violate the advice to avoid coadministration with other GLP-1 receptor agonists.",
        objective: .interaction,
        relatedDrugIds: ["d54"],
        tags: ["liraglutide", "duplicate therapy", "GLP-1"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_038",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which subsection 3d drug requires dose adjustment when renal function declines?",
        options: ["Sitagliptin", "Semaglutide", "Liraglutide", "Glipizide", "Glimepiride"],
        answer: "Sitagliptin",
        explanation: "Sitagliptin is the standout drug here for renal dose adjustment. That is why renal function assessment is part of safe DPP-4 inhibitor prescribing.",
        objective: .monitoring,
        relatedDrugIds: ["d55"],
        tags: ["renal dosing", "Januvia", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_039",
        subsectionId: "3d",
        difficulty: .hard,
        question: "A patient taking Januvia develops severe disabling joint pain with no clear alternative explanation. Which adverse effect should come to mind first?",
        options: ["Severe arthralgia from a DPP-4 inhibitor", "Acute dystonia from dopamine blockade", "Thyroid C-cell tumor", "Sulfonylurea-induced hemolytic anemia", "Semaglutide-associated diabetic retinopathy"],
        answer: "Severe arthralgia from a DPP-4 inhibitor",
        explanation: "DPP-4 inhibitors, including sitagliptin, have been associated with severe and disabling arthralgia. It is easy to miss if you only memorize glucose-lowering effects and ignore the warning details.",
        objective: .adverseEffect,
        relatedDrugIds: ["d55"],
        tags: ["arthralgia", "DPP-4", "warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_040",
        subsectionId: "3d",
        difficulty: .hard,
        question: "A patient on sitagliptin reports new blisters and erosions that may require hospitalization if ignored. Which rare adverse effect best fits this warning?",
        options: ["Bullous pemphigoid", "Stevens-Johnson syndrome from sulfonylureas only", "Pancreatic cancer", "Serotonin syndrome", "Torsades de pointes"],
        answer: "Bullous pemphigoid",
        explanation: "Bullous pemphigoid is a labeled warning for sitagliptin and other DPP-4 inhibitors. Patients should be told to report blisters or erosions promptly.",
        objective: .adverseEffect,
        relatedDrugIds: ["d55"],
        tags: ["bullous pemphigoid", "blisters", "DPP-4"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_041",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Older sulfonylureas remain common on exams partly because of a class warning carried on labeling. Which warning is associated with glipizide and glimepiride?",
        options: ["Potential increased risk of cardiovascular mortality", "Risk of thyroid C-cell tumors", "Black box warning for lactic acidosis", "Risk of tendon rupture", "Pulmonary fibrosis with long-term use"],
        answer: "Potential increased risk of cardiovascular mortality",
        explanation: "Sulfonylurea labeling includes a warning about a potential increased risk of cardiovascular mortality. Even if you do not use this fact every day clinically, it remains a classic high-yield teaching point.",
        objective: .contraindication,
        relatedDrugIds: ["d56", "d57"],
        tags: ["sulfonylurea", "cardiovascular mortality", "warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_042",
        subsectionId: "3d",
        difficulty: .hard,
        question: "A patient with G6PD deficiency needs diabetes therapy. Why might glipizide or glimepiride be less attractive than another class?",
        options: ["Sulfonylureas can precipitate hemolytic anemia in G6PD deficiency", "They are absolutely contraindicated in all renal impairment", "They directly cause pancreatitis in every patient", "They cannot be used with metformin", "They permanently damage pancreatic beta cells"],
        answer: "Sulfonylureas can precipitate hemolytic anemia in G6PD deficiency",
        explanation: "Sulfonylureas carry a hemolytic anemia warning in G6PD deficiency. This is not the first thing most learners memorize, which is exactly why it can become a differentiating test point.",
        objective: .contraindication,
        relatedDrugIds: ["d56", "d57"],
        tags: ["G6PD", "hemolytic anemia", "sulfonylurea"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_043",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which administration pearl best matches glimepiride?",
        options: ["Take once daily with breakfast or the first main meal of the day", "Inject once weekly without regard to meals", "Take 30 minutes before a meal to maximize postprandial control", "Start at 0.6 mg daily for one week, then titrate", "Administer only at bedtime because it peaks overnight"],
        answer: "Take once daily with breakfast or the first main meal of the day",
        explanation: "Glimepiride is typically dosed once daily with breakfast or the first main meal. This pearl helps distinguish it from glipizide, which is classically linked to pre-meal administration.",
        objective: .dosing,
        relatedDrugIds: ["d57"],
        tags: ["glimepiride", "breakfast", "once daily"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_044",
        subsectionId: "3d",
        difficulty: .medium,
        question: "Which administration pearl best matches immediate-release glipizide?",
        options: ["Give it about 30 minutes before a meal to improve postprandial control", "Take it only at bedtime", "Inject it once weekly", "Give it at any time because meals do not matter", "It must always be taken on an empty stomach first thing in the morning with only water"],
        answer: "Give it about 30 minutes before a meal to improve postprandial control",
        explanation: "Immediate-release glipizide is classically given about 30 minutes before a meal. This timing pearl is one of the most testable ways to distinguish it from glimepiride.",
        objective: .dosing,
        relatedDrugIds: ["d56"],
        tags: ["glipizide", "before meals", "postprandial"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3d_add_045",
        subsectionId: "3d",
        difficulty: .medium,
        question: "A patient takes glipizide or glimepiride and then skips meals because of a busy clinic schedule. Which adverse effect becomes especially likely?",
        options: ["Hypoglycemia", "Severe hypertension", "Constipation from delayed gastric emptying", "Bullous pemphigoid", "Dry cough"],
        answer: "Hypoglycemia",
        explanation: "Sulfonylureas stimulate insulin release, so skipping meals can leave the patient with insulin on board but not enough incoming glucose. That is why meal consistency matters so much with glipizide and glimepiride.",
        objective: .adverseEffect,
        relatedDrugIds: ["d56", "d57"],
        tags: ["hypoglycemia", "skipped meals", "sulfonylurea"],
        source: .curated
    )

    ]
}