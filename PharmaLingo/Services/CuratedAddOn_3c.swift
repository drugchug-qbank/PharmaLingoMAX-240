// PharmaLingo — Module 3c (SGLT2 Inhibitors)
// Curated Add-On Question Pack (45 questions)
// IDs: q3c_add_001 ... q3c_add_045

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_3c: [Question] = [

    .multipleChoice(
        id: "q3c_add_001",
        subsectionId: "3c",
        difficulty: .easy,
        question: "A patient with type 2 diabetes and heart failure is started on Jardiance, an oral SGLT2 inhibitor with important cardio-renal indications. What is the generic name of Jardiance?",
        options: ["Empagliflozin", "Dapagliflozin", "Pioglitazone", "Sitagliptin", "Glipizide"],
        answer: "Empagliflozin",
        explanation: "Jardiance is the brand name for empagliflozin. This is a high-yield brand-generic pair because empagliflozin is more than just a glucose drug; it also carries major heart and kidney indications.",
        objective: .brandGeneric,
        relatedDrugIds: ["d51"],
        tags: ["empagliflozin", "Jardiance", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_002",
        subsectionId: "3c",
        difficulty: .easy,
        question: "Empagliflozin lowers glucose by increasing urinary glucose excretion and is also used in adults with heart failure and chronic kidney disease at risk of progression. Which brand name matches empagliflozin?",
        options: ["Farxiga", "Jardiance", "Actos", "Januvia", "Glucophage"],
        answer: "Jardiance",
        explanation: "Empagliflozin is sold as Jardiance. Tying the generic to the brand helps anchor one of the two major SGLT2 inhibitors in this subsection.",
        objective: .genericBrand,
        relatedDrugIds: ["d51"],
        tags: ["empagliflozin", "Jardiance", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_003",
        subsectionId: "3c",
        difficulty: .easy,
        question: "A patient with type 2 diabetes and chronic kidney disease is prescribed Farxiga, an oral SGLT2 inhibitor. What is the generic name of Farxiga?",
        options: ["Dapagliflozin", "Empagliflozin", "Metformin", "Semaglutide", "Liraglutide"],
        answer: "Dapagliflozin",
        explanation: "Farxiga is the brand name for dapagliflozin. This pair is worth mastering because dapagliflozin has high-yield heart failure and kidney labeling in addition to glycemic use.",
        objective: .brandGeneric,
        relatedDrugIds: ["d52"],
        tags: ["dapagliflozin", "Farxiga", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_004",
        subsectionId: "3c",
        difficulty: .easy,
        question: "Dapagliflozin is an oral SGLT2 inhibitor that can be used for glycemic control and also has adult heart failure and chronic kidney disease indications. Which brand name matches dapagliflozin?",
        options: ["Jardiance", "Actos", "Farxiga", "Januvia", "Ozempic"],
        answer: "Farxiga",
        explanation: "Dapagliflozin is sold as Farxiga. Knowing this brand-generic pair helps separate it from empagliflozin, the other gliflozin in this subsection.",
        objective: .genericBrand,
        relatedDrugIds: ["d52"],
        tags: ["dapagliflozin", "Farxiga", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_005",
        subsectionId: "3c",
        difficulty: .easy,
        question: "Both empagliflozin and dapagliflozin end in a suffix that helps identify their class. Which suffix is it?",
        options: ["-gliflozin", "-gliptin", "-glitazone", "-statin", "-sartan"],
        answer: "-gliflozin",
        explanation: "The -gliflozin suffix points to the SGLT2 inhibitor class. Suffix recognition is a fast way to identify these drugs on exams and in clinic.",
        objective: .suffixId,
        relatedDrugIds: ["d51", "d52"],
        tags: ["SGLT2", "suffix", "gliflozin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_006",
        subsectionId: "3c",
        difficulty: .easy,
        question: "A learner sees Jardiance and Farxiga in the diabetes module and wants to classify them correctly. Which drug class do both belong to?",
        options: ["SGLT2 inhibitors", "DPP-4 inhibitors", "Sulfonylureas", "Biguanides", "Thiazolidinediones"],
        answer: "SGLT2 inhibitors",
        explanation: "Empagliflozin and dapagliflozin are SGLT2 inhibitors. They lower glucose through the kidney rather than by directly increasing insulin secretion.",
        objective: .classId,
        relatedDrugIds: ["d51", "d52"],
        tags: ["SGLT2", "class", "gliflozin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_007",
        subsectionId: "3c",
        difficulty: .easy,
        question: "Which of the following drugs is an SGLT2 inhibitor from subsection 3c?",
        options: ["Empagliflozin", "Pioglitazone", "Sitagliptin", "Glimepiride", "Metformin"],
        answer: "Empagliflozin",
        explanation: "Empagliflozin is an SGLT2 inhibitor. The distractors come from other diabetes classes, so this question reinforces class differentiation.",
        objective: .classId,
        relatedDrugIds: ["d51"],
        tags: ["empagliflozin", "class", "recognition"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_008",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Which statement best describes a shared approved glycemic-control use of empagliflozin and dapagliflozin?",
        options: ["Both are used as adjuncts to diet and exercise for type 2 diabetes, including pediatric patients aged 10 years and older", "Both are approved for type 1 diabetes because they do not cause hypoglycemia", "Both are only used after insulin fails in diabetic ketoacidosis", "Both are approved only for adults and not for pediatrics", "Both are oral insulin secretagogues used before meals"],
        answer: "Both are used as adjuncts to diet and exercise for type 2 diabetes, including pediatric patients aged 10 years and older",
        explanation: "Both drugs have labeling for glycemic control in type 2 diabetes and both are approved in pediatric patients aged 10 years and older for that purpose. That shared indication is easy to miss if you only think of them as heart-kidney drugs.",
        objective: .indication,
        relatedDrugIds: ["d51", "d52"],
        tags: ["T2DM", "pediatrics", "shared indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_009",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A patient with type 2 diabetes and chronic kidney disease asks why an SGLT2 inhibitor might be useful even beyond A1c reduction. Which statement is most accurate for the subsection 3c drugs?",
        options: ["Both have important cardio-renal indications in adults in addition to glycemic control", "Both are mainly used to stimulate rapid insulin release at meals", "Both are reserved only for diabetic ketoacidosis", "Both work only if combined with metformin", "Both are antiplatelet agents that reduce thrombosis"],
        answer: "Both have important cardio-renal indications in adults in addition to glycemic control",
        explanation: "Empagliflozin and dapagliflozin are high yield because they are not just glucose drugs. Their labeling also includes major adult heart failure and chronic kidney disease use cases.",
        objective: .indication,
        relatedDrugIds: ["d51", "d52"],
        tags: ["cardiorenal", "shared indication", "SGLT2"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_010",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A patient with type 2 diabetes and established cardiovascular disease needs an oral agent specifically labeled to reduce cardiovascular death. Which subsection 3c drug best fits that description?",
        options: ["Empagliflozin", "Dapagliflozin", "Glipizide", "Pioglitazone", "Sitagliptin"],
        answer: "Empagliflozin",
        explanation: "Empagliflozin is specifically labeled to reduce cardiovascular death in adults with type 2 diabetes and established cardiovascular disease. That wording is a classic way to distinguish Jardiance from Farxiga.",
        objective: .indication,
        relatedDrugIds: ["d51"],
        tags: ["empagliflozin", "CV death", "established CVD"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_011",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A patient with type 2 diabetes and multiple cardiovascular risk factors asks which subsection 3c drug specifically carries a label to reduce hospitalization for heart failure in that population. Which is it?",
        options: ["Dapagliflozin", "Empagliflozin", "Metformin", "Pioglitazone", "Regular insulin"],
        answer: "Dapagliflozin",
        explanation: "Dapagliflozin has labeling to reduce hospitalization for heart failure in adults with type 2 diabetes who have established cardiovascular disease or multiple cardiovascular risk factors.",
        objective: .indication,
        relatedDrugIds: ["d52"],
        tags: ["dapagliflozin", "HF hospitalization", "CV risk factors"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_012",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Which mechanism best explains how empagliflozin and dapagliflozin lower glucose?",
        options: ["They inhibit SGLT2 in the proximal renal tubule, reducing glucose reabsorption and increasing urinary glucose excretion", "They directly stimulate pancreatic beta cells to release insulin", "They slow gastric emptying through GLP-1 receptor activation", "They block intestinal carbohydrate absorption", "They irreversibly inhibit DPP-4 in the plasma"],
        answer: "They inhibit SGLT2 in the proximal renal tubule, reducing glucose reabsorption and increasing urinary glucose excretion",
        explanation: "SGLT2 inhibitors lower blood glucose through the kidney. They reduce reabsorption of filtered glucose, which increases glucosuria.",
        objective: .moa,
        relatedDrugIds: ["d51", "d52"],
        tags: ["mechanism", "kidney", "glucosuria"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_013",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Where in the nephron do empagliflozin and dapagliflozin exert their primary glucose-lowering effect?",
        options: ["Proximal renal tubule", "Loop of Henle", "Distal convoluted tubule", "Collecting duct", "Glomerulus"],
        answer: "Proximal renal tubule",
        explanation: "SGLT2 is located in the proximal renal tubule, where it reabsorbs most filtered glucose. That is why these drugs work by promoting urinary glucose loss.",
        objective: .moa,
        relatedDrugIds: ["d51", "d52"],
        tags: ["proximal tubule", "nephron", "SGLT2"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_014",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A student says SGLT2 inhibitors work by squeezing the pancreas to release insulin. Which correction is best?",
        options: ["They lower the renal threshold for glucose and increase urinary glucose excretion rather than directly stimulating insulin release", "They only work by increasing beta-cell mass", "They raise glucagon to offset hypoglycemia", "They prevent carbohydrate absorption in the jejunum", "They act mainly by blocking aldosterone receptors"],
        answer: "They lower the renal threshold for glucose and increase urinary glucose excretion rather than directly stimulating insulin release",
        explanation: "Empagliflozin and dapagliflozin do not act as insulin secretagogues. Their hallmark mechanism is renal glucose wasting through SGLT2 inhibition.",
        objective: .moa,
        relatedDrugIds: ["d51", "d52"],
        tags: ["insulin independent", "glucosuria", "mechanism"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_015",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Why do empagliflozin and dapagliflozin generally have a lower hypoglycemia risk when used alone than sulfonylureas?",
        options: ["They do not directly stimulate insulin secretion", "They permanently destroy pancreatic alpha cells", "They are given only at bedtime", "They are always combined with dextrose", "They prevent all urinary glucose loss"],
        answer: "They do not directly stimulate insulin secretion",
        explanation: "Because SGLT2 inhibitors do not directly force the pancreas to release insulin, hypoglycemia is less likely when they are used alone than with insulin secretagogues.",
        objective: .pearl,
        relatedDrugIds: ["d51", "d52"],
        tags: ["hypoglycemia", "not secretagogue", "pearl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_016",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A patient newly started on Farxiga reports slightly more frequent urination. Which explanation best fits the class mechanism?",
        options: ["The drug increases urinary glucose excretion, creating an osmotic diuresis", "The drug directly irritates the bladder lining", "The drug blocks antidiuretic hormone receptors", "The drug causes nephrotic syndrome", "The drug suppresses thirst centers in the brain"],
        answer: "The drug increases urinary glucose excretion, creating an osmotic diuresis",
        explanation: "SGLT2 inhibitors cause glucosuria, and that glucose in the urine pulls water with it. The result is osmotic diuresis, which can show up as increased urination.",
        objective: .adverseEffect,
        relatedDrugIds: ["d52"],
        tags: ["osmotic diuresis", "increased urination", "dapagliflozin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_017",
        subsectionId: "3c",
        difficulty: .medium,
        question: "An older adult taking a loop diuretic is started on Jardiance. Which adverse effect deserves extra monitoring soon after initiation?",
        options: ["Symptomatic hypotension from volume depletion", "Severe constipation from calcium channel blockade", "Dry cough from bradykinin accumulation", "Tardive dyskinesia", "Severe neutropenia"],
        answer: "Symptomatic hypotension from volume depletion",
        explanation: "Empagliflozin can cause intravascular volume depletion. The risk is higher in older adults, patients with reduced renal function, and those taking loop diuretics.",
        objective: .adverseEffect,
        relatedDrugIds: ["d51"],
        tags: ["volume depletion", "hypotension", "loop diuretics"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_018",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Before starting an SGLT2 inhibitor in a patient with type 2 diabetes and chronic kidney disease, what should be assessed or corrected first?",
        options: ["Renal function and volume status", "INR and vitamin K intake", "TSH and free T4", "Peak and trough vancomycin levels", "Pulmonary function tests"],
        answer: "Renal function and volume status",
        explanation: "Before initiating empagliflozin or dapagliflozin, labeling recommends checking renal function and assessing volume status. If the patient is volume depleted, correct that first.",
        objective: .monitoring,
        relatedDrugIds: ["d51", "d52"],
        tags: ["renal function", "volume status", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_019",
        subsectionId: "3c",
        difficulty: .easy,
        question: "Which common adverse effect pair is most associated with SGLT2 inhibitors because they increase glucose in the urine?",
        options: ["Genital mycotic infections and urinary tract infections", "Gingival hyperplasia and hirsutism", "Dry cough and angioedema", "Constipation and bradycardia", "Photosensitivity and tendon rupture"],
        answer: "Genital mycotic infections and urinary tract infections",
        explanation: "Glucosuria promotes genitourinary infections, so genital yeast infections and urinary tract infections are classic adverse effects of this class.",
        objective: .adverseEffect,
        relatedDrugIds: ["d51", "d52"],
        tags: ["UTI", "genital infection", "class effect"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_020",
        subsectionId: "3c",
        difficulty: .easy,
        question: "A woman develops recurrent vulvovaginal candidiasis after starting empagliflozin. Which high-yield class effect best explains this?",
        options: ["Genital mycotic infection risk from glucosuria", "Bradykinin accumulation", "Direct bone marrow suppression", "Dopamine blockade", "Cholinergic excess"],
        answer: "Genital mycotic infection risk from glucosuria",
        explanation: "Empagliflozin increases glucose in the urine, which raises the risk of genital mycotic infections. This is one of the most testable adverse effects for the class.",
        objective: .adverseEffect,
        relatedDrugIds: ["d51"],
        tags: ["empagliflozin", "genital mycotic", "adverse effect"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_021",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A patient taking dapagliflozin has burning urination, urgency, fever, and flank pain. Which class warning makes this complaint especially important?",
        options: ["Serious urinary tract infection including pyelonephritis or urosepsis", "Drug-induced lupus", "Malignant hyperthermia", "Acute angle-closure glaucoma", "Red-man syndrome"],
        answer: "Serious urinary tract infection including pyelonephritis or urosepsis",
        explanation: "Dapagliflozin and other SGLT2 inhibitors can increase the risk of serious urinary tract infections, not just mild dysuria. Fever and flank pain raise concern for upper-tract infection or urosepsis.",
        objective: .adverseEffect,
        relatedDrugIds: ["d52"],
        tags: ["dapagliflozin", "UTI", "pyelonephritis"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_022",
        subsectionId: "3c",
        difficulty: .hard,
        question: "Which rare but life-threatening infection should be discussed when counseling a patient starting an SGLT2 inhibitor?",
        options: ["Necrotizing fasciitis of the perineum (Fournier's gangrene)", "Necrotizing pneumonia", "Toxic epidermal necrolysis", "Clostridioides difficile colitis", "Subacute bacterial endocarditis"],
        answer: "Necrotizing fasciitis of the perineum (Fournier's gangrene)",
        explanation: "Fournier's gangrene is a rare but life-threatening necrotizing infection that has been reported with SGLT2 inhibitors. Patients should seek urgent care if they develop severe pain, swelling, or redness in the perineal area.",
        objective: .adverseEffect,
        relatedDrugIds: ["d51", "d52"],
        tags: ["Fournier", "necrotizing fasciitis", "serious warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_023",
        subsectionId: "3c",
        difficulty: .hard,
        question: "A patient on Farxiga develops nausea, vomiting, abdominal pain, malaise, and shortness of breath, but the finger-stick glucose is 190 mg/dL. Which complication should still be suspected?",
        options: ["Ketoacidosis", "Isolated uncomplicated cystitis", "Hyperthyroidism", "Serotonin syndrome", "Pure dehydration without acidosis"],
        answer: "Ketoacidosis",
        explanation: "SGLT2 inhibitors can cause ketoacidosis even when glucose is not dramatically elevated. This euglycemic DKA-style presentation is a key class pearl.",
        objective: .adverseEffect,
        relatedDrugIds: ["d52"],
        tags: ["ketoacidosis", "euglycemic DKA", "dapagliflozin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_024",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Which statement about SGLT2 inhibitors in type 1 diabetes is most accurate?",
        options: ["They are not recommended for glycemic control in type 1 diabetes because they increase ketoacidosis risk", "They are first-line monotherapy in type 1 diabetes because they spare insulin", "They are mainly used to treat diabetic ketoacidosis in type 1 diabetes", "They are safer than basal insulin in type 1 diabetes", "They are contraindicated only because of severe constipation"],
        answer: "They are not recommended for glycemic control in type 1 diabetes because they increase ketoacidosis risk",
        explanation: "Empagliflozin and dapagliflozin are not recommended for glycemic control in type 1 diabetes because SGLT2 inhibition increases the risk of diabetic ketoacidosis in that setting.",
        objective: .contraindication,
        relatedDrugIds: ["d51", "d52"],
        tags: ["type 1 diabetes", "DKA risk", "not recommended"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_025",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A patient is scheduled for elective surgery and asks what to do with Jardiance. What is the best instruction based on labeling?",
        options: ["Withhold it for at least 3 days before surgery or prolonged fasting and restart when the patient is stable and eating again", "Continue it through surgery to avoid hyperglycemia", "Stop it only the morning of surgery and restart in the recovery room", "Double the dose the day before surgery", "Hold it for 24 hours only, regardless of the procedure"],
        answer: "Withhold it for at least 3 days before surgery or prolonged fasting and restart when the patient is stable and eating again",
        explanation: "Empagliflozin should be withheld for at least 3 days before surgery or prolonged fasting. This helps reduce the risk of perioperative ketoacidosis.",
        objective: .dosing,
        relatedDrugIds: ["d51"],
        tags: ["surgery hold", "empagliflozin", "perioperative"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_026",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Why are SGLT2 inhibitors typically held before major surgery or prolonged fasting?",
        options: ["Because fasting and physiologic stress can increase the risk of ketoacidosis", "Because they cause severe withdrawal hypertension if continued", "Because they must always be taken with food to work", "Because they irreversibly damage beta cells during anesthesia", "Because they interfere with platelet aggregation during surgery"],
        answer: "Because fasting and physiologic stress can increase the risk of ketoacidosis",
        explanation: "Surgery, reduced oral intake, acute illness, and insulin disruption can predispose patients taking SGLT2 inhibitors to ketoacidosis. Holding the drug before major procedures is a high-yield safety step.",
        objective: .pearl,
        relatedDrugIds: ["d51", "d52"],
        tags: ["surgery", "ketoacidosis", "class pearl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_027",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A urine dipstick remains positive for glucose in a patient taking empagliflozin despite improved A1c. Which explanation is best?",
        options: ["The drug intentionally increases urinary glucose excretion, so urine glucose testing is not a reliable way to monitor glycemic control", "The patient is definitely nonadherent because urine glucose should be zero", "The patient must have type 1 diabetes instead of type 2 diabetes", "The medication is causing hematuria rather than glucosuria", "The positive result proves diabetic ketoacidosis"],
        answer: "The drug intentionally increases urinary glucose excretion, so urine glucose testing is not a reliable way to monitor glycemic control",
        explanation: "Positive urine glucose can be expected with SGLT2 inhibitors because glucosuria is part of the mechanism. Urine glucose testing should not be used to judge whether the drug is working.",
        objective: .monitoring,
        relatedDrugIds: ["d51"],
        tags: ["urine glucose", "monitoring", "empagliflozin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_028",
        subsectionId: "3c",
        difficulty: .hard,
        question: "Which lab assay is unreliable in patients taking empagliflozin or dapagliflozin?",
        options: ["1,5-anhydroglucitol (1,5-AG)", "TSH", "Troponin I", "Serum potassium", "INR"],
        answer: "1,5-anhydroglucitol (1,5-AG)",
        explanation: "SGLT2 inhibitors make the 1,5-AG assay unreliable because they alter urinary glucose handling. That is a classic monitoring pearl for this class.",
        objective: .monitoring,
        relatedDrugIds: ["d51", "d52"],
        tags: ["1,5-AG", "assay", "monitoring pearl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_029",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A patient uses empagliflozin together with glimepiride and begins having shakiness and sweating. Which explanation is best?",
        options: ["Hypoglycemia risk increases when an SGLT2 inhibitor is combined with an insulin secretagogue", "Empagliflozin directly causes severe insulin overdose on its own", "The symptoms prove Fournier's gangrene", "This is the typical presentation of hyperkalemia", "The combination causes serotonin excess"],
        answer: "Hypoglycemia risk increases when an SGLT2 inhibitor is combined with an insulin secretagogue",
        explanation: "SGLT2 inhibitors are not strong hypoglycemia drugs by themselves, but the risk rises when they are used with insulin or insulin secretagogues such as sulfonylureas.",
        objective: .interaction,
        relatedDrugIds: ["d51"],
        tags: ["hypoglycemia", "glimepiride", "interaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_030",
        subsectionId: "3c",
        difficulty: .hard,
        question: "Which concomitant medication may require more frequent concentration monitoring after starting Farxiga or Jardiance because SGLT2 inhibitors can lower its serum levels?",
        options: ["Lithium", "Warfarin", "Digoxin", "Levothyroxine", "Clopidogrel"],
        answer: "Lithium",
        explanation: "SGLT2 inhibitors can decrease serum lithium concentrations. If a patient is taking lithium, levels may need closer monitoring when this class is started or adjusted.",
        objective: .interaction,
        relatedDrugIds: ["d51", "d52"],
        tags: ["lithium", "drug interaction", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_031",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Which counseling statement is most accurate regarding pregnancy and SGLT2 inhibitors?",
        options: ["They are not recommended during the second and third trimesters because of fetal renal risk concerns", "They are preferred oral drugs throughout pregnancy", "They are safest during the third trimester because the kidneys are fully formed", "They are only avoided in the first trimester", "They are recommended to prevent gestational diabetes"],
        answer: "They are not recommended during the second and third trimesters because of fetal renal risk concerns",
        explanation: "Empagliflozin and dapagliflozin are not recommended during the second and third trimesters of pregnancy. This is a key counseling point tied to fetal renal development.",
        objective: .contraindication,
        relatedDrugIds: ["d51", "d52"],
        tags: ["pregnancy", "second trimester", "third trimester"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_032",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Which counseling statement is most accurate regarding breastfeeding and SGLT2 inhibitors?",
        options: ["Use while breastfeeding is not recommended", "Breastfeeding is encouraged because the drug does not enter milk", "They are only avoided during the first week postpartum", "They are safer than metformin during lactation", "They must be given immediately after nursing to prevent infant exposure"],
        answer: "Use while breastfeeding is not recommended",
        explanation: "Empagliflozin and dapagliflozin are not recommended while breastfeeding because of concern for adverse effects on the developing kidney of the infant.",
        objective: .contraindication,
        relatedDrugIds: ["d51", "d52"],
        tags: ["breastfeeding", "lactation", "counseling"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_033",
        subsectionId: "3c",
        difficulty: .medium,
        question: "For glycemic control in adults with type 2 diabetes, what is the labeled starting dose of Farxiga?",
        options: ["5 mg once daily", "10 mg twice daily", "25 mg once daily", "2.5 mg once daily", "10 mg only with meals"],
        answer: "5 mg once daily",
        explanation: "For glycemic control, dapagliflozin starts at 5 mg once daily and may be increased to 10 mg once daily if additional control is needed.",
        objective: .dosing,
        relatedDrugIds: ["d52"],
        tags: ["Farxiga", "dose", "glycemic control"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_034",
        subsectionId: "3c",
        difficulty: .medium,
        question: "For glycemic control, what is the usual starting dose of Jardiance and what may it be increased to for additional control?",
        options: ["10 mg once daily, with the option to increase to 25 mg once daily", "5 mg once daily, with the option to increase to 10 mg twice daily", "25 mg once daily only; there is no lower starting dose", "10 units before each meal", "2.5 mg once daily, with the option to increase to 5 mg once daily"],
        answer: "10 mg once daily, with the option to increase to 25 mg once daily",
        explanation: "Empagliflozin is typically started at 10 mg once daily and may be increased to 25 mg once daily for additional glycemic control in patients who tolerate it.",
        objective: .dosing,
        relatedDrugIds: ["d51"],
        tags: ["Jardiance", "dose", "25 mg"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_035",
        subsectionId: "3c",
        difficulty: .easy,
        question: "Which subsection 3c SGLT2 inhibitor is available as 10 mg and 25 mg tablets?",
        options: ["Jardiance", "Farxiga", "Actos", "Glucophage", "Amaryl"],
        answer: "Jardiance",
        explanation: "Jardiance tablets come in 10 mg and 25 mg strengths. This is a quick way to separate it from Farxiga, which uses 5 mg and 10 mg strengths.",
        objective: .dosing,
        relatedDrugIds: ["d51"],
        tags: ["tablet strengths", "empagliflozin", "Jardiance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_036",
        subsectionId: "3c",
        difficulty: .easy,
        question: "Which subsection 3c SGLT2 inhibitor is available as 5 mg and 10 mg tablets?",
        options: ["Farxiga", "Jardiance", "Januvia", "Ozempic", "Lantus"],
        answer: "Farxiga",
        explanation: "Farxiga tablets come in 5 mg and 10 mg strengths. That strength pattern helps distinguish dapagliflozin from empagliflozin.",
        objective: .dosing,
        relatedDrugIds: ["d52"],
        tags: ["tablet strengths", "dapagliflozin", "Farxiga"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_037",
        subsectionId: "3c",
        difficulty: .hard,
        question: "Why is Jardiance not recommended to improve glycemic control when eGFR is below 30 mL/min/1.73 m²?",
        options: ["It is likely to be ineffective for glucose lowering in that setting based on its mechanism", "It always causes lactic acidosis below that eGFR", "It becomes a direct nephrotoxin at that threshold", "It cannot be absorbed from the GI tract when renal function falls", "It causes life-threatening hyperkalemia in all patients with CKD"],
        answer: "It is likely to be ineffective for glucose lowering in that setting based on its mechanism",
        explanation: "Because empagliflozin works by increasing urinary glucose excretion, its glycemic effect becomes less useful when kidney function is too reduced. This is why labeling does not recommend it for glycemic control below that eGFR threshold.",
        objective: .monitoring,
        relatedDrugIds: ["d51"],
        tags: ["eGFR", "glycemic control", "renal function"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_038",
        subsectionId: "3c",
        difficulty: .hard,
        question: "Which statement about Farxiga and renal function is most accurate?",
        options: ["For glycemic control it is not recommended when eGFR is below 45, but for adult heart failure or CKD indications patients already taking it may continue 10 mg once daily even if eGFR falls below 25", "It must always be stopped immediately once eGFR drops below 60 regardless of indication", "It is contraindicated in all chronic kidney disease because it acts in the kidney", "It becomes a loop diuretic when eGFR falls below 45", "Its dose should be doubled if eGFR falls below 25"],
        answer: "For glycemic control it is not recommended when eGFR is below 45, but for adult heart failure or CKD indications patients already taking it may continue 10 mg once daily even if eGFR falls below 25",
        explanation: "Dapagliflozin has different renal thresholds depending on why it is being used. That dosing nuance is one of the most testable details in the section.",
        objective: .monitoring,
        relatedDrugIds: ["d52"],
        tags: ["eGFR", "Farxiga", "renal dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_039",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A 12-year-old with type 2 diabetes needs an oral SGLT2 option as an adjunct to diet and exercise. Which statement is accurate for subsection 3c?",
        options: ["Both empagliflozin and dapagliflozin have labeling for glycemic control in pediatric patients aged 10 years and older", "Neither drug is approved below age 18 for any use", "Only empagliflozin is labeled for pediatric glycemic control", "Only dapagliflozin is labeled for pediatric glycemic control", "Both are labeled only for type 1 diabetes in pediatrics"],
        answer: "Both empagliflozin and dapagliflozin have labeling for glycemic control in pediatric patients aged 10 years and older",
        explanation: "Both drugs have labeling for pediatric patients aged 10 years and older with type 2 diabetes for glycemic control, which makes them unusual among some newer diabetes classes.",
        objective: .indication,
        relatedDrugIds: ["d51", "d52"],
        tags: ["pediatrics", "age 10+", "shared labeling"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_040",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Which explanation best distinguishes SGLT2 inhibitors from sulfonylureas?",
        options: ["SGLT2 inhibitors work through urinary glucose excretion rather than by triggering pancreatic insulin release", "SGLT2 inhibitors permanently shut down glucagon release", "SGLT2 inhibitors are injectable rather than oral", "SGLT2 inhibitors are used only in type 1 diabetes", "SGLT2 inhibitors slow gastric emptying through vagal stimulation"],
        answer: "SGLT2 inhibitors work through urinary glucose excretion rather than by triggering pancreatic insulin release",
        explanation: "This difference explains both the lower hypoglycemia risk when used alone and the unique genitourinary adverse-effect pattern of empagliflozin and dapagliflozin.",
        objective: .moa,
        relatedDrugIds: ["d51", "d52"],
        tags: ["vs sulfonylurea", "mechanism", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_041",
        subsectionId: "3c",
        difficulty: .medium,
        question: "A clinician orders repeat renal-function monitoring after starting empagliflozin. Why is that a reasonable plan?",
        options: ["The drug can cause volume depletion and acute transient changes in creatinine, so renal function should be followed after initiation", "The drug causes predictable agranulocytosis that is detected by creatinine", "The drug accumulates only in dialysis tubing", "The drug is monitored with INR because it blocks vitamin K", "The drug causes permanent nephrotic syndrome in most patients"],
        answer: "The drug can cause volume depletion and acute transient changes in creatinine, so renal function should be followed after initiation",
        explanation: "Empagliflozin can cause intravascular volume depletion and transient creatinine changes, with postmarketing reports of acute kidney injury in the class. Monitoring renal function after starting therapy is high-yield and practical.",
        objective: .monitoring,
        relatedDrugIds: ["d51"],
        tags: ["creatinine", "renal monitoring", "empagliflozin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_042",
        subsectionId: "3c",
        difficulty: .medium,
        question: "Which concomitant therapy should make you especially alert for hypotension when starting dapagliflozin?",
        options: ["Loop diuretics", "Proton pump inhibitors", "Topical corticosteroids", "Statins", "Thyroid hormone"],
        answer: "Loop diuretics",
        explanation: "Patients on loop diuretics are at higher risk for volume depletion and hypotension after SGLT2 initiation. That combination deserves closer blood pressure and hydration monitoring.",
        objective: .interaction,
        relatedDrugIds: ["d52"],
        tags: ["loop diuretics", "hypotension", "dapagliflozin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_043",
        subsectionId: "3c",
        difficulty: .hard,
        question: "A patient stopped Farxiga yesterday but still has glucose in the urine today. Which explanation is best?",
        options: ["Urinary glucose excretion can remain elevated for about 3 days after discontinuation", "This proves the patient secretly took another dose today", "The patient must have developed type 1 diabetes overnight", "It means the drug has caused irreversible kidney damage", "Persistent glucosuria after one day proves a urinary tract infection"],
        answer: "Urinary glucose excretion can remain elevated for about 3 days after discontinuation",
        explanation: "SGLT2-related glucosuria does not disappear immediately after the last dose. This helps explain why urine glucose may remain positive for a few days after stopping therapy.",
        objective: .pearl,
        relatedDrugIds: ["d52"],
        tags: ["glucosuria", "discontinuation", "Farxiga"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_044",
        subsectionId: "3c",
        difficulty: .hard,
        question: "Which subsection 3c drug has labeling for adults with heart failure that explicitly mentions urgent heart failure visit in addition to cardiovascular death and hospitalization for heart failure?",
        options: ["Dapagliflozin", "Empagliflozin", "Metformin", "Pioglitazone", "Sitagliptin"],
        answer: "Dapagliflozin",
        explanation: "Dapagliflozin's heart failure labeling explicitly includes urgent heart failure visit in addition to cardiovascular death and hospitalization for heart failure. That wording helps distinguish it from empagliflozin.",
        objective: .indication,
        relatedDrugIds: ["d52"],
        tags: ["urgent heart failure visit", "Farxiga", "label distinction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3c_add_045",
        subsectionId: "3c",
        difficulty: .hard,
        question: "Which advanced mechanism pearl best helps explain why SGLT2 inhibitors may offer heart and kidney benefits beyond glucose lowering?",
        options: ["They also reduce sodium reabsorption and increase delivery of sodium to the distal tubule, which can support tubuloglomerular feedback and cardiorenal effects", "They irreversibly block beta-1 receptors in the heart", "They act mainly as direct coronary vasodilators", "They inhibit platelet P2Y12 receptors", "They neutralize aldosterone in the collecting duct"],
        answer: "They also reduce sodium reabsorption and increase delivery of sodium to the distal tubule, which can support tubuloglomerular feedback and cardiorenal effects",
        explanation: "In addition to promoting glucosuria, SGLT2 inhibition changes sodium handling in the proximal tubule. That mechanistic pearl helps connect the class to its heart-failure and kidney benefits.",
        objective: .pearl,
        relatedDrugIds: ["d51", "d52"],
        tags: ["sodium reabsorption", "cardiorenal", "advanced pearl"],
        source: .curated
    )
    ]
}
