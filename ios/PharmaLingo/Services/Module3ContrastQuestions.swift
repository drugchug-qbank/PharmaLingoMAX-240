import Foundation

extension DrugDataService {
    static let module3ContrastQuestions: [Question] = [

        // MARK: - 3a Insulin Role Classification (Easy)

        .multipleChoice(
            id: "q3a_ctr_001",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Which role does insulin glargine (Lantus) fill in a basal-bolus regimen?",
            options: ["Basal / background coverage", "Mealtime bolus", "Correction-only insulin", "IV drip for DKA", "Weekly injectable"],
            answer: "Basal / background coverage",
            explanation: "Insulin glargine is a long-acting basal insulin providing steady background coverage for ~24 hours.",
            objective: .classId,
            relatedDrugIds: ["d46"],
            tags: ["insulin-role", "basal", "contrast-role"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_ctr_002",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Which role does insulin lispro (Humalog) fill in a basal-bolus regimen?",
            options: ["Mealtime bolus", "Basal / background coverage", "Once-weekly injection", "IV-only emergency insulin", "Inhaled insulin"],
            answer: "Mealtime bolus",
            explanation: "Insulin lispro is a rapid-acting insulin given before meals to cover post-prandial glucose spikes.",
            objective: .classId,
            relatedDrugIds: ["d47"],
            tags: ["insulin-role", "bolus", "contrast-role"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_ctr_003",
            subsectionId: "3a",
            difficulty: .easy,
            question: "A nurse labels insulin detemir (Levemir) as a mealtime insulin. Is this correct?",
            options: ["No — it is a basal insulin", "Yes — it is rapid-acting", "Yes — it is given with each meal", "No — it is only for IV use", "No — it is an oral agent"],
            answer: "No — it is a basal insulin",
            explanation: "Insulin detemir is a long-acting basal insulin. Confusing it with a mealtime product could lead to dosing errors.",
            objective: .classId,
            relatedDrugIds: ["d49"],
            tags: ["insulin-role", "basal", "contrast-role"],
            source: .curated
        ),

        .trueFalse(
            id: "q3a_ctr_004",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Insulin aspart (NovoLog) is a rapid-acting mealtime insulin, not a basal insulin.",
            answer: true,
            explanation: "Insulin aspart is rapid-acting and used as a bolus around meals. It should not be confused with basal products like glargine or detemir.",
            objective: .classId,
            relatedDrugIds: ["d48"],
            tags: ["insulin-role", "bolus", "contrast-role"],
            source: .curated
        ),

        .trueFalse(
            id: "q3a_ctr_005",
            subsectionId: "3a",
            difficulty: .easy,
            question: "Regular insulin (Humulin R) is classified as a rapid-acting insulin analog.",
            answer: false,
            explanation: "Regular insulin is short-acting, not rapid-acting. It has a slower onset (~30 min) than lispro or aspart (~15 min).",
            objective: .classId,
            relatedDrugIds: ["d50"],
            tags: ["insulin-role", "short-acting", "contrast-role"],
            source: .curated
        ),

        // MARK: - 3a Contrast: Glargine vs Detemir (Medium)

        .multipleChoice(
            id: "q3a_ctr_006",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Both glargine and detemir are basal insulins. Which statement best differentiates them?",
            options: [
                "Glargine is typically once daily; detemir may need twice-daily dosing",
                "Detemir is peakless and always once daily; glargine needs BID",
                "Glargine is rapid-acting; detemir is long-acting",
                "Detemir can be given IV; glargine cannot",
                "They are identical in every way"
            ],
            answer: "Glargine is typically once daily; detemir may need twice-daily dosing",
            explanation: "Glargine provides ~24h peakless coverage. Detemir may not last a full 24h in some patients, sometimes requiring BID dosing.",
            objective: .pearl,
            relatedDrugIds: ["d46", "d49"],
            tags: ["contrast-pair", "basal-vs-basal", "glargine-detemir"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_ctr_007",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A patient needs a basal insulin that provides the most consistent 24-hour coverage with once-daily dosing. Which is the better match?",
            options: ["Insulin glargine", "Insulin detemir", "Insulin lispro", "Regular insulin", "Insulin aspart"],
            answer: "Insulin glargine",
            explanation: "Glargine is the classic peakless ~24h basal insulin. Detemir is also basal but may need BID dosing in some patients.",
            objective: .indication,
            relatedDrugIds: ["d46", "d49"],
            tags: ["contrast-pair", "best-match", "glargine-detemir"],
            source: .curated
        ),

        // MARK: - 3a Contrast: Lispro vs Aspart (Medium)

        .multipleChoice(
            id: "q3a_ctr_008",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Insulin lispro (Humalog) and insulin aspart (NovoLog) are both rapid-acting. Which statement best differentiates them?",
            options: [
                "They are nearly interchangeable rapid-acting analogs from different manufacturers",
                "Lispro is long-acting; aspart is rapid-acting",
                "Only aspart can be given subcutaneously",
                "Lispro has a 24-hour duration; aspart peaks in 1 hour",
                "Only lispro causes weight loss"
            ],
            answer: "They are nearly interchangeable rapid-acting analogs from different manufacturers",
            explanation: "Both are rapid-acting with similar onset/peak/duration. The main difference is brand (Humalog vs NovoLog). Distinguishing them from basal insulins matters more.",
            objective: .pearl,
            relatedDrugIds: ["d47", "d48"],
            tags: ["contrast-pair", "rapid-vs-rapid", "lispro-aspart"],
            source: .curated
        ),

        // MARK: - 3a Contrast: Basal vs Bolus (Medium/Hard)

        .multipleChoice(
            id: "q3a_ctr_009",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A patient's fasting glucose is well controlled but post-meal glucose spikes persist. Which insulin type should be added or adjusted?",
            options: ["Bolus / mealtime insulin", "Basal insulin", "No change needed", "Switch to oral metformin only", "Stop all insulin"],
            answer: "Bolus / mealtime insulin",
            explanation: "Fasting control suggests adequate basal coverage. Post-meal spikes need bolus (rapid-acting) insulin adjustment.",
            objective: .indication,
            relatedDrugIds: ["d47", "d48"],
            tags: ["contrast-role", "basal-vs-bolus", "clinical-scenario"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_ctr_010",
            subsectionId: "3a",
            difficulty: .medium,
            question: "A patient's post-meal glucose is fine but fasting morning glucose is consistently elevated. Which insulin type needs adjustment?",
            options: ["Basal insulin", "Bolus / mealtime insulin", "Correction dose only", "No insulin — use oral agents", "IV insulin drip"],
            answer: "Basal insulin",
            explanation: "Elevated fasting glucose with controlled post-meal readings suggests inadequate basal coverage. Glargine or detemir dose may need titration.",
            objective: .indication,
            relatedDrugIds: ["d46", "d49"],
            tags: ["contrast-role", "basal-vs-bolus", "clinical-scenario"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_ctr_011",
            subsectionId: "3a",
            difficulty: .hard,
            question: "Why is it dangerous to confuse a basal insulin (glargine) with a bolus insulin (lispro)?",
            options: [
                "Giving basal dose as bolus at meals could cause severe hypoglycemia; giving bolus dose as basal leaves no background coverage",
                "They are the same drug with different labels",
                "Both are given IV so there is no confusion risk",
                "Glargine is always given with meals anyway",
                "Lispro provides 24-hour coverage like glargine"
            ],
            answer: "Giving basal dose as bolus at meals could cause severe hypoglycemia; giving bolus dose as basal leaves no background coverage",
            explanation: "Basal and bolus insulins have different doses, timing, and durations. Mix-ups are a leading cause of insulin-related medication errors.",
            objective: .pearl,
            relatedDrugIds: ["d46", "d47"],
            tags: ["contrast-pair", "safety", "basal-vs-bolus"],
            source: .curated
        ),

        // MARK: - 3a Contrast: Regular vs Rapid (Medium)

        .multipleChoice(
            id: "q3a_ctr_012",
            subsectionId: "3a",
            difficulty: .medium,
            question: "What is the key timing difference between regular insulin and insulin lispro before a meal?",
            options: [
                "Regular: ~30 min before; lispro: within 15 min or immediately after",
                "Regular: immediately before; lispro: 2 hours before",
                "Both are taken at the same time",
                "Regular: at bedtime only; lispro: with breakfast only",
                "Lispro: 30 min before; regular: 5 min before"
            ],
            answer: "Regular: ~30 min before; lispro: within 15 min or immediately after",
            explanation: "Regular insulin has a slower onset, requiring ~30 min lead time. Lispro acts faster and can be dosed closer to or right after eating.",
            objective: .dosing,
            relatedDrugIds: ["d50", "d47"],
            tags: ["contrast-pair", "timing", "regular-vs-rapid"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3a_ctr_013",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Which insulin can be given intravenously in DKA and hyperkalemia — regular insulin or insulin lispro?",
            options: ["Regular insulin", "Insulin lispro", "Both equally", "Neither", "Only glargine"],
            answer: "Regular insulin",
            explanation: "Regular insulin is the classic IV insulin. Lispro is not the standard answer for IV protocols in DKA or hyperkalemia.",
            objective: .indication,
            relatedDrugIds: ["d50", "d47"],
            tags: ["contrast-pair", "IV-use", "regular-vs-rapid"],
            source: .curated
        ),

        // MARK: - 3a Matching: Insulin Role Sort

        .matching(
            id: "q3a_ctr_014",
            subsectionId: "3a",
            difficulty: .medium,
            question: "Match each insulin to its therapeutic role:",
            pairs: [
                MatchingPair(left: "Insulin glargine", right: "Basal"),
                MatchingPair(left: "Insulin lispro", right: "Bolus / mealtime"),
                MatchingPair(left: "Insulin detemir", right: "Basal"),
                MatchingPair(left: "Regular insulin", right: "Short-acting")
            ],
            explanation: "Glargine and detemir are basal. Lispro is rapid-acting bolus. Regular is short-acting with IV capability.",
            objective: .classId,
            relatedDrugIds: ["d46", "d47", "d49", "d50"],
            tags: ["matching", "insulin-role", "contrast-role"],
            source: .curated
        ),

        // MARK: - 3b/3c/3d Contrast: Oral Class Differentiators

        .multipleChoice(
            id: "q3_ctr_015",
            subsectionId: "3d",
            difficulty: .medium,
            question: "A patient needs a diabetes class that promotes weight loss and has CV benefit. Which class fits best?",
            options: ["GLP-1 receptor agonist", "Sulfonylurea", "DPP-4 inhibitor", "Thiazolidinedione", "Alpha-glucosidase inhibitor"],
            answer: "GLP-1 receptor agonist",
            explanation: "GLP-1 RAs (e.g., semaglutide) offer significant weight loss and cardiovascular benefit, unlike sulfonylureas (weight gain) or DPP-4 inhibitors (weight neutral).",
            objective: .indication,
            relatedDrugIds: ["d53", "d54"],
            tags: ["contrast-class", "GLP1-vs-SU-vs-DPP4"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3_ctr_016",
            subsectionId: "3d",
            difficulty: .medium,
            question: "Which diabetes drug class directly stimulates insulin secretion and carries the highest hypoglycemia risk among oral agents?",
            options: ["Sulfonylureas", "SGLT2 inhibitors", "DPP-4 inhibitors", "Biguanides", "GLP-1 receptor agonists"],
            answer: "Sulfonylureas",
            explanation: "Sulfonylureas (glipizide, glimepiride) are insulin secretagogues that cause hypoglycemia and weight gain — distinguishing them from newer classes.",
            objective: .adverseEffect,
            relatedDrugIds: ["d56", "d57"],
            tags: ["contrast-class", "SU-hypoglycemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3_ctr_017",
            subsectionId: "3d",
            difficulty: .medium,
            question: "How do DPP-4 inhibitors differ from GLP-1 receptor agonists?",
            options: [
                "DPP-4 inhibitors are oral and weight-neutral; GLP-1 RAs are mostly injectable with weight loss",
                "DPP-4 inhibitors cause more weight loss than GLP-1 RAs",
                "GLP-1 RAs are oral only; DPP-4 inhibitors are injected",
                "They are identical in mechanism and effect",
                "DPP-4 inhibitors carry a thyroid C-cell tumor warning; GLP-1 RAs do not"
            ],
            answer: "DPP-4 inhibitors are oral and weight-neutral; GLP-1 RAs are mostly injectable with weight loss",
            explanation: "DPP-4 inhibitors (-gliptins) are oral and weight-neutral. GLP-1 RAs (-glutides) are mostly injectable with significant weight loss and CV benefit.",
            objective: .pearl,
            relatedDrugIds: ["d55", "d53"],
            tags: ["contrast-class", "DPP4-vs-GLP1"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3_ctr_018",
            subsectionId: "3c",
            difficulty: .medium,
            question: "SGLT2 inhibitors lower glucose through the kidney. How does this differ from sulfonylureas?",
            options: [
                "SGLT2i promote urinary glucose excretion without stimulating insulin; SUs force insulin release",
                "SGLT2i stimulate insulin release; SUs block renal glucose",
                "Both work identically through the pancreas",
                "SUs promote glucosuria; SGLT2i inhibit glucagon",
                "Neither affects blood glucose directly"
            ],
            answer: "SGLT2i promote urinary glucose excretion without stimulating insulin; SUs force insulin release",
            explanation: "SGLT2 inhibitors work via insulin-independent renal glucose wasting. Sulfonylureas are insulin secretagogues — explaining the hypoglycemia and weight differences.",
            objective: .moa,
            relatedDrugIds: ["d51", "d56"],
            tags: ["contrast-class", "SGLT2-vs-SU"],
            source: .curated
        ),

        // MARK: - 3e Contrast: Levothyroxine vs Liothyronine

        .multipleChoice(
            id: "q3e_ctr_019",
            subsectionId: "3e",
            difficulty: .medium,
            question: "Which statement best differentiates levothyroxine from liothyronine?",
            options: [
                "Levothyroxine is synthetic T4 with a long half-life; liothyronine is T3 with a shorter half-life",
                "Liothyronine is the standard first-line; levothyroxine is used only in emergencies",
                "They are the same molecule with different brand names",
                "Levothyroxine is an anti-thyroid drug; liothyronine replaces thyroid hormone",
                "Both are given only intravenously"
            ],
            answer: "Levothyroxine is synthetic T4 with a long half-life; liothyronine is T3 with a shorter half-life",
            explanation: "Levothyroxine (T4) is first-line for hypothyroidism. Liothyronine (T3) is active T3 with a shorter half-life, used less commonly.",
            objective: .pearl,
            relatedDrugIds: ["d59", "d60"],
            tags: ["contrast-pair", "T4-vs-T3", "thyroid"],
            source: .curated
        ),

        // MARK: - 3e Contrast: Methimazole vs PTU

        .multipleChoice(
            id: "q3e_ctr_020",
            subsectionId: "3e",
            difficulty: .medium,
            question: "Both methimazole and PTU treat hyperthyroidism. When is PTU preferred over methimazole?",
            options: [
                "First trimester of pregnancy and thyroid storm",
                "Always — PTU is first-line in all settings",
                "Only in elderly patients with Graves' disease",
                "When the patient has severe hepatic disease",
                "PTU is never preferred; methimazole is always used"
            ],
            answer: "First trimester of pregnancy and thyroid storm",
            explanation: "PTU is preferred in the first trimester (methimazole is teratogenic early) and in thyroid storm (PTU also blocks T4→T3 conversion). Otherwise, methimazole is preferred.",
            objective: .pearl,
            relatedDrugIds: ["d61", "d62"],
            tags: ["contrast-pair", "methimazole-vs-PTU", "pregnancy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3e_ctr_021",
            subsectionId: "3e",
            difficulty: .medium,
            question: "Which anti-thyroid drug carries the greater risk of severe hepatotoxicity?",
            options: ["PTU", "Methimazole", "Both equally", "Neither", "Levothyroxine"],
            answer: "PTU",
            explanation: "PTU has a boxed warning for severe liver injury and acute liver failure. Methimazole is preferred partly because of this lower hepatotoxicity risk.",
            objective: .adverseEffect,
            relatedDrugIds: ["d62", "d61"],
            tags: ["contrast-pair", "hepatotoxicity", "methimazole-vs-PTU"],
            source: .curated
        ),

        // MARK: - 3f Contrast: Corticosteroid Potency

        .multipleChoice(
            id: "q3f_ctr_022",
            subsectionId: "3f",
            difficulty: .medium,
            question: "Which corticosteroid is the most potent with the longest half-life and no mineralocorticoid activity?",
            options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Methylprednisolone", "Fludrocortisone"],
            answer: "Dexamethasone",
            explanation: "Dexamethasone is the most potent corticosteroid with a 36-72h half-life and no significant mineralocorticoid activity.",
            objective: .pearl,
            relatedDrugIds: ["d165"],
            tags: ["contrast-pair", "corticosteroid-potency"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3f_ctr_023",
            subsectionId: "3f",
            difficulty: .medium,
            question: "Which corticosteroid is used for physiologic replacement in adrenal insufficiency because it most closely mimics endogenous cortisol?",
            options: ["Hydrocortisone", "Dexamethasone", "Methylprednisolone", "Prednisone", "Triamcinolone"],
            answer: "Hydrocortisone",
            explanation: "Hydrocortisone has the most mineralocorticoid activity and is used for physiologic replacement. Dexamethasone is too potent for replacement therapy.",
            objective: .indication,
            relatedDrugIds: ["d166", "d165"],
            tags: ["contrast-pair", "replacement-vs-potent", "corticosteroid"],
            source: .curated
        ),

        .matching(
            id: "q3f_ctr_024",
            subsectionId: "3f",
            difficulty: .hard,
            question: "Match each corticosteroid to its distinguishing feature:",
            pairs: [
                MatchingPair(left: "Dexamethasone", right: "Most potent, no mineralocorticoid"),
                MatchingPair(left: "Hydrocortisone", right: "Physiologic replacement, most mineralocorticoid"),
                MatchingPair(left: "Prednisone", right: "Oral workhorse, moderate potency"),
                MatchingPair(left: "Methylprednisolone", right: "IV (Solu-Medrol) for acute flares")
            ],
            explanation: "Potency ranking: dexamethasone > methylprednisolone > prednisone > hydrocortisone. Mineralocorticoid activity is inverse.",
            objective: .pearl,
            relatedDrugIds: ["d165", "d166", "d163", "d164"],
            tags: ["matching", "corticosteroid-potency", "contrast-pair"],
            source: .curated
        ),

        // MARK: - Cross-Subsection Contrast: Diabetes Class Sort

        .matching(
            id: "q3_ctr_025",
            subsectionId: "3d",
            difficulty: .hard,
            question: "Match each diabetes drug class to its hallmark characteristic:",
            pairs: [
                MatchingPair(left: "SGLT2 inhibitor", right: "Urinary glucose excretion, UTI/yeast risk"),
                MatchingPair(left: "GLP-1 RA", right: "Weight loss, nausea, thyroid C-cell warning"),
                MatchingPair(left: "DPP-4 inhibitor", right: "Weight neutral, oral, low hypoglycemia risk"),
                MatchingPair(left: "Sulfonylurea", right: "Insulin secretagogue, hypoglycemia, weight gain")
            ],
            explanation: "Each class has a distinct profile. Knowing these contrasts prevents confusion across Module 3d and 3c.",
            objective: .pearl,
            relatedDrugIds: ["d51", "d53", "d55", "d56"],
            tags: ["matching", "diabetes-class-sort", "contrast-class"],
            source: .curated
        ),

        // MARK: - Mini-Case Capstones (Hard)

        .multipleChoice(
            id: "q3a_ctr_026",
            subsectionId: "3a",
            difficulty: .hard,
            question: "A T1DM patient takes Lantus at bedtime and Humalog before meals. They wake up at 3 AM with sweating and confusion. Blood glucose is 42 mg/dL. Which insulin is most likely responsible?",
            options: [
                "Lantus — the basal insulin dose may be too high",
                "Humalog — even though the last meal was 8 hours ago",
                "Neither — this is unrelated to insulin",
                "Both equally",
                "Regular insulin they aren't taking"
            ],
            answer: "Lantus — the basal insulin dose may be too high",
            explanation: "Nocturnal hypoglycemia during sleep is most often caused by excessive basal insulin. Humalog's effect would have waned hours earlier.",
            objective: .pearl,
            relatedDrugIds: ["d46", "d47"],
            tags: ["mini-case", "capstone", "nocturnal-hypo"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3e_ctr_027",
            subsectionId: "3e",
            difficulty: .hard,
            question: "A pregnant woman in her first trimester has severe Graves' disease. Which anti-thyroid drug should be used?",
            options: ["PTU", "Methimazole", "Levothyroxine", "Dexamethasone", "Radioactive iodine"],
            answer: "PTU",
            explanation: "PTU is preferred in the first trimester because methimazole is associated with teratogenic effects (aplasia cutis, choanal atresia) in early pregnancy.",
            objective: .indication,
            relatedDrugIds: ["d62", "d61"],
            tags: ["mini-case", "capstone", "pregnancy-thyroid"],
            source: .curated
        ),

        .multipleChoice(
            id: "q3f_ctr_028",
            subsectionId: "3f",
            difficulty: .hard,
            question: "A patient with cerebral edema from a brain tumor needs a potent corticosteroid with minimal fluid retention. Which is the best choice?",
            options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Methylprednisolone", "Fludrocortisone"],
            answer: "Dexamethasone",
            explanation: "Dexamethasone is the classic choice for cerebral edema: highest potency, long half-life, and no mineralocorticoid activity to worsen edema.",
            objective: .indication,
            relatedDrugIds: ["d165"],
            tags: ["mini-case", "capstone", "cerebral-edema"],
            source: .curated
        ),
    ]
}
