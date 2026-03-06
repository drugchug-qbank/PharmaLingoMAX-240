// PharmaLingo — Module 3f (Adrenal Steroids)
// Curated Add-On Question Pack (45 questions)
// IDs: q3f_add_001 ... q3f_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 3f exists, then append:
//
//    if bank["3f"] == nil { bank["3f"] = [] }
//    bank["3f"]?.append(contentsOf: Self.curatedAddOnQuestions_3f)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs: d163 (Prednisone), d164 (Methylprednisolone),
//   d165 (Dexamethasone), d166 (Hydrocortisone).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_3f: [Question] = [

    .multipleChoice(
        id: "q3f_add_001",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Decadron is the corticosteroid often remembered for cerebral edema because it provides strong anti-inflammatory activity with very little sodium-retaining effect. What is the generic name of Decadron?",
        options: ["Dexamethasone", "Hydrocortisone", "Methylprednisolone", "Prednisone", "Methimazole"],
        answer: "Dexamethasone",
        explanation: "Decadron is the brand name for dexamethasone. In this section, dexamethasone is the steroid most associated with CNS edema and minimal mineralocorticoid effect.",
        objective: .brandGeneric,
        relatedDrugIds: ["d165"],
        tags: ["dexamethasone", "Decadron", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_002",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Dexamethasone is a systemic corticosteroid that is commonly chosen when clinicians want potent anti-inflammatory activity without much sodium retention. Which brand name matches dexamethasone?",
        options: ["Decadron", "Cortef/Solu-Cortef", "Medrol/Solu-Medrol", "Deltasone", "Cytomel"],
        answer: "Decadron",
        explanation: "Dexamethasone is marketed as Decadron. This pair is high yield because dexamethasone is frequently contrasted with hydrocortisone in adrenal and neuro questions.",
        objective: .genericBrand,
        relatedDrugIds: ["d165"],
        tags: ["dexamethasone", "Decadron", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_003",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Cortef and Solu-Cortef are the oral and injectable forms of the steroid most used for physiologic replacement in adrenal insufficiency. What is the generic name of Cortef/Solu-Cortef?",
        options: ["Hydrocortisone", "Prednisone", "Methylprednisolone", "Dexamethasone", "Levothyroxine"],
        answer: "Hydrocortisone",
        explanation: "Cortef and Solu-Cortef contain hydrocortisone. Hydrocortisone is the classic replacement steroid because it has salt-retaining properties that matter in adrenal insufficiency.",
        objective: .brandGeneric,
        relatedDrugIds: ["d166"],
        tags: ["hydrocortisone", "Cortef", "Solu-Cortef", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_004",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Hydrocortisone is a naturally occurring glucocorticoid and is often first choice for primary or secondary adrenal insufficiency. Which brand option matches hydrocortisone in this module?",
        options: ["Cortef/Solu-Cortef", "Decadron", "Medrol/Solu-Medrol", "Deltasone", "Januvia"],
        answer: "Cortef/Solu-Cortef",
        explanation: "Hydrocortisone corresponds to Cortef and Solu-Cortef. Seeing both oral and injectable brand names together helps learners recognize that the same steroid appears in outpatient and acute-care settings.",
        objective: .genericBrand,
        relatedDrugIds: ["d166"],
        tags: ["hydrocortisone", "Cortef", "Solu-Cortef", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_005",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Medrol and Solu-Medrol are two forms of a corticosteroid commonly used for acute inflammatory flares, with the injectable form used when oral therapy is not feasible. What is the generic name of Medrol/Solu-Medrol?",
        options: ["Methylprednisolone", "Prednisone", "Hydrocortisone", "Dexamethasone", "Semaglutide"],
        answer: "Methylprednisolone",
        explanation: "Medrol and Solu-Medrol are brand names for methylprednisolone. The oral and IV forms are a common pair to recognize for rheum, allergy, and neurologic flare questions.",
        objective: .brandGeneric,
        relatedDrugIds: ["d164"],
        tags: ["methylprednisolone", "Medrol", "Solu-Medrol", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_006",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Methylprednisolone is a glucocorticoid used for many inflammatory disorders, and its IV sodium succinate form can act quickly in acute flares. Which brand option matches methylprednisolone?",
        options: ["Medrol/Solu-Medrol", "Decadron", "Cortef/Solu-Cortef", "Deltasone", "Farxiga"],
        answer: "Medrol/Solu-Medrol",
        explanation: "Methylprednisolone is marketed as Medrol orally and Solu-Medrol for injection. This is one of the most recognizable oral-to-IV corticosteroid brand pairs.",
        objective: .genericBrand,
        relatedDrugIds: ["d164"],
        tags: ["methylprednisolone", "Medrol", "Solu-Medrol", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_007",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Deltasone is the oral corticosteroid that students often picture for short outpatient steroid tapers after asthma or inflammatory flares. What is the generic name of Deltasone?",
        options: ["Prednisone", "Hydrocortisone", "Methylprednisolone", "Dexamethasone", "Pioglitazone"],
        answer: "Prednisone",
        explanation: "Deltasone is the brand name used here for prednisone. Prednisone is one of the most commonly prescribed oral systemic steroids.",
        objective: .brandGeneric,
        relatedDrugIds: ["d163"],
        tags: ["prednisone", "Deltasone", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_008",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Prednisone is a synthetic corticosteroid frequently used as a short oral burst for inflammatory conditions such as asthma exacerbations or autoimmune flares. Which brand name matches prednisone in this module?",
        options: ["Deltasone", "Decadron", "Cortef/Solu-Cortef", "Medrol/Solu-Medrol", "Tapazole"],
        answer: "Deltasone",
        explanation: "Prednisone matches Deltasone in this course outline. Knowing this pair helps separate prednisone from methylprednisolone and dexamethasone.",
        objective: .genericBrand,
        relatedDrugIds: ["d163"],
        tags: ["prednisone", "Deltasone", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_009",
        subsectionId: "3f",
        difficulty: .easy,
        question: "Prednisone, methylprednisolone, dexamethasone, and hydrocortisone all reduce inflammation and suppress immune responses rather than replace insulin or thyroid hormone. Which drug class best describes this subsection?",
        options: ["Systemic corticosteroids (glucocorticoids)", "Thionamides", "SGLT2 inhibitors", "Loop diuretics", "Beta blockers"],
        answer: "Systemic corticosteroids (glucocorticoids)",
        explanation: "These four drugs are systemic corticosteroids, also called glucocorticoids. Recognizing the class helps learners predict shared adverse effects such as hyperglycemia, infection risk, and adrenal suppression.",
        objective: .classId,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["class", "glucocorticoid", "systemic corticosteroids"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_010",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Systemic corticosteroids lower inflammation by acting at intracellular glucocorticoid receptors and changing gene transcription, which decreases inflammatory signaling and alters immune responses. Which mechanism best matches prednisone and its classmates?",
        options: ["Glucocorticoid receptor activation that alters gene transcription", "Cyclooxygenase-1 inhibition that lowers thromboxane A2", "SGLT2 blockade in the proximal tubule", "Direct factor Xa inhibition", "Beta-1 receptor blockade in the heart"],
        answer: "Glucocorticoid receptor activation that alters gene transcription",
        explanation: "Prednisone and the other systemic steroids in this subsection work through glucocorticoid receptors to change transcription of inflammatory mediators. That broad genomic effect explains both their anti-inflammatory benefit and their many systemic adverse effects.",
        objective: .moa,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["moa", "glucocorticoid receptor", "anti-inflammatory"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_011",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient with primary adrenal insufficiency needs a steroid that helps replace physiologic cortisol and also brings salt-retaining activity to the table. Which drug from this subsection best fits that role?",
        options: ["Hydrocortisone", "Dexamethasone", "Prednisone", "Methylprednisolone", "Semaglutide"],
        answer: "Hydrocortisone",
        explanation: "Hydrocortisone is the classic first-choice replacement steroid for adrenal insufficiency because it is naturally occurring and has salt-retaining properties. Dexamethasone is not preferred when mineralocorticoid effect matters.",
        objective: .indication,
        relatedDrugIds: ["d166", "d165"],
        tags: ["adrenal insufficiency", "replacement", "hydrocortisone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_012",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient with brain-tumor-related cerebral edema needs a corticosteroid that provides strong anti-inflammatory activity with almost no sodium-retaining effect. Which drug is the classic choice?",
        options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Methylprednisolone", "Metformin"],
        answer: "Dexamethasone",
        explanation: "Dexamethasone is strongly associated with cerebral edema and has minimal sodium-retaining activity. That makes it a classic comparison point against hydrocortisone in high-yield steroid questions.",
        objective: .indication,
        relatedDrugIds: ["d165"],
        tags: ["dexamethasone", "cerebral edema", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_013",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient with an acute inflammatory flare cannot take oral medication, so the team wants an IV corticosteroid whose sodium succinate form has demonstrable effects within about an hour. Which drug best matches that scenario?",
        options: ["Methylprednisolone", "Prednisone", "Hydrocortisone", "Dexamethasone", "Levothyroxine"],
        answer: "Methylprednisolone",
        explanation: "IV methylprednisolone sodium succinate (Solu-Medrol) is a classic acute-care steroid choice when oral therapy is not feasible. The fast parenteral onset is a high-yield pearl for acute flares.",
        objective: .indication,
        relatedDrugIds: ["d164"],
        tags: ["methylprednisolone", "Solu-Medrol", "acute flare"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_014",
        subsectionId: "3f",
        difficulty: .medium,
        question: "An outpatient with an asthma exacerbation is sent home on a short oral steroid burst to calm airway inflammation over the next several days. Which drug from this subsection is the most classic oral choice?",
        options: ["Prednisone", "Hydrocortisone", "Dexamethasone", "Methylprednisolone", "Sitagliptin"],
        answer: "Prednisone",
        explanation: "Prednisone is one of the most common oral systemic steroids used for short inflammatory bursts, including asthma exacerbations. It is a very common outpatient steroid to recognize quickly.",
        objective: .indication,
        relatedDrugIds: ["d163"],
        tags: ["prednisone", "asthma exacerbation", "oral burst"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_015",
        subsectionId: "3f",
        difficulty: .hard,
        question: "Steroid-equivalence charts are high yield because the anti-inflammatory potency of these drugs differs a lot. According to standard oral/IV comparison charts, 5 mg of prednisone is approximately equivalent to which dose of methylprednisolone?",
        options: ["4 mg", "0.75 mg", "5 mg", "10 mg", "20 mg"],
        answer: "4 mg",
        explanation: "About 5 mg prednisone is equivalent to 4 mg methylprednisolone on standard comparison charts for oral or IV dosing. This is a classic conversion pearl worth memorizing.",
        objective: .dosing,
        relatedDrugIds: ["d163", "d164"],
        tags: ["equivalence", "prednisone", "methylprednisolone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_016",
        subsectionId: "3f",
        difficulty: .hard,
        question: "If you are converting anti-inflammatory steroid doses, 5 mg of prednisone is approximately equivalent to which dose of hydrocortisone?",
        options: ["20 mg", "4 mg", "0.75 mg", "5 mg", "40 mg"],
        answer: "20 mg",
        explanation: "On standard comparison charts, 5 mg of prednisone is approximately equal to 20 mg of hydrocortisone. This helps explain why hydrocortisone is less potent per milligram and often used in replacement dosing.",
        objective: .dosing,
        relatedDrugIds: ["d163", "d166"],
        tags: ["equivalence", "prednisone", "hydrocortisone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_017",
        subsectionId: "3f",
        difficulty: .hard,
        question: "A team is switching from prednisone to dexamethasone and wants an approximate anti-inflammatory equivalent dose. Which dose of dexamethasone is roughly equivalent to 5 mg of prednisone?",
        options: ["0.75 mg", "4 mg", "5 mg", "10 mg", "20 mg"],
        answer: "0.75 mg",
        explanation: "About 0.75 mg dexamethasone is roughly equivalent to 5 mg prednisone on standard oral/IV comparison charts. This highlights the much greater anti-inflammatory potency of dexamethasone per milligram.",
        objective: .dosing,
        relatedDrugIds: ["d163", "d165"],
        tags: ["equivalence", "prednisone", "dexamethasone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_018",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Which answer choice best captures the mineralocorticoid contrast that helps distinguish these steroids on exams?",
        options: ["Hydrocortisone has salt-retaining activity, while dexamethasone has very little sodium-retaining effect", "Dexamethasone is the best replacement steroid for Addison disease because of strong salt retention", "Prednisone has more salt-retaining effect than hydrocortisone", "Methylprednisolone has more sodium-retaining effect than hydrocortisone", "All four drugs have identical mineralocorticoid effects"],
        answer: "Hydrocortisone has salt-retaining activity, while dexamethasone has very little sodium-retaining effect",
        explanation: "Hydrocortisone is the replacement steroid with meaningful salt-retaining properties, while dexamethasone is the classic low-mineralocorticoid comparator. That contrast explains many adrenal-insufficiency and edema questions.",
        objective: .pearl,
        relatedDrugIds: ["d166", "d165"],
        tags: ["mineralocorticoid", "hydrocortisone", "dexamethasone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_019",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient has been taking prednisone for several weeks and says they feel better, so they plan to stop it tonight without instructions. Which counseling point is most important?",
        options: ["Do not stop abruptly after prolonged use because adrenal suppression can occur; tapering may be needed", "Double the last dose before stopping to prevent rebound inflammation", "Switch to live vaccines immediately because immunity is suppressed", "Take the remaining tablets only at bedtime to avoid adrenal suppression", "Replace prednisone with methimazole because both affect endocrine function"],
        answer: "Do not stop abruptly after prolonged use because adrenal suppression can occur; tapering may be needed",
        explanation: "Longer or higher-dose corticosteroid therapy can suppress the HPA axis, so abrupt discontinuation can precipitate steroid insufficiency. A taper is often required after prolonged use.",
        objective: .contraindication,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["taper", "HPA axis suppression", "adrenal insufficiency"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_020",
        subsectionId: "3f",
        difficulty: .medium,
        question: "During prolonged prednisone therapy, the label specifically recommends routine monitoring because steroids can worsen glucose control and shift electrolytes. Which monitoring pair is specifically high yield?",
        options: ["Blood glucose and serum potassium", "TSH and free T4", "INR and aPTT", "Troponin and CK-MB", "Amylase and lipase"],
        answer: "Blood glucose and serum potassium",
        explanation: "Prednisone labeling highlights monitoring blood glucose and serum potassium during prolonged therapy. That fits the classic steroid profile of hyperglycemia plus possible potassium effects.",
        objective: .monitoring,
        relatedDrugIds: ["d163"],
        tags: ["monitoring", "glucose", "potassium"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_021",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient on high-dose methylprednisolone develops fever and vague abdominal discomfort, but the presentation seems muted. Which steroid effect best explains why clinicians still worry about infection?",
        options: ["Systemic corticosteroids can suppress immunity and mask signs of infection", "Corticosteroids directly kill bacteria and make cultures falsely negative", "Steroids block all cytokines permanently after one dose", "Steroids mainly cause pancreatitis, not infection risk", "This pattern is unique to hydrocortisone replacement doses only"],
        answer: "Systemic corticosteroids can suppress immunity and mask signs of infection",
        explanation: "Corticosteroids increase susceptibility to infection and can mask typical inflammatory signs. That is why fever or new symptoms on systemic steroids should not be brushed off.",
        objective: .adverseEffect,
        relatedDrugIds: ["d164", "d163", "d165", "d166"],
        tags: ["infection risk", "immunosuppression", "masked infection"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_022",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient with diabetes starts methylprednisolone for a severe inflammatory flare. Which medication-management issue is most important to anticipate?",
        options: ["Antidiabetic doses may need adjustment because corticosteroids can raise blood glucose", "Methimazole should be added because steroids lower thyroid hormone", "Warfarin should always be stopped because steroids make INR zero", "Basal insulin should always be cut in half because steroids cause hypoglycemia", "Ezetimibe should be stopped because steroids lower LDL too much"],
        answer: "Antidiabetic doses may need adjustment because corticosteroids can raise blood glucose",
        explanation: "Corticosteroids commonly worsen glucose control and can increase antidiabetic medication requirements. Hyperglycemia is one of the most testable systemic steroid adverse effects.",
        objective: .interaction,
        relatedDrugIds: ["d164", "d163", "d165", "d166"],
        tags: ["hyperglycemia", "diabetes", "interaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_023",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient on warfarin is started on Solu-Medrol for an acute inflammatory condition. Which monitoring pearl is most appropriate?",
        options: ["Monitor coagulation more closely because corticosteroids can alter warfarin response", "Stop warfarin permanently because all steroids are absolutely contraindicated", "Check digoxin levels because steroids always cause digoxin toxicity", "Only monitor if the steroid is oral rather than IV", "Switch warfarin to clopidogrel because steroids do not interact with it"],
        answer: "Monitor coagulation more closely because corticosteroids can alter warfarin response",
        explanation: "Corticosteroids can change warfarin response, so coagulation indices such as INR should be monitored more frequently when the drugs are combined.",
        objective: .interaction,
        relatedDrugIds: ["d164"],
        tags: ["warfarin", "INR", "interaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_024",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient taking prednisone says, 'I feel wired, I cannot sleep, and my mood is all over the place.' Which adverse effect category best fits this complaint?",
        options: ["Behavioral and mood disturbances from systemic corticosteroids", "Classic beta-blocker withdrawal", "Serotonin syndrome from all steroids", "Cholinergic excess due to hydrocortisone", "Statin-associated myopathy"],
        answer: "Behavioral and mood disturbances from systemic corticosteroids",
        explanation: "Systemic corticosteroids can cause insomnia, euphoria, mood swings, personality changes, depression, and even psychosis. Mood symptoms are a high-yield counseling pearl for this class.",
        objective: .adverseEffect,
        relatedDrugIds: ["d163", "d165", "d164", "d166"],
        tags: ["mood changes", "insomnia", "adverse effect"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_025",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient expected to stay on chronic prednisone for months asks why the team keeps mentioning DEXA scans and bone protection. What long-term adverse effect are they trying to prevent?",
        options: ["Osteoporosis from decreased bone formation and increased bone resorption", "Acute pancreatitis from direct pancreatic toxicity", "Severe neutropenia unique to prednisone", "Irreversible hypothyroidism", "Permanent nephrogenic diabetes insipidus"],
        answer: "Osteoporosis from decreased bone formation and increased bone resorption",
        explanation: "Long-term systemic corticosteroid therapy can lower bone density and contribute to osteoporosis and fractures. Bone protection and monitoring matter during prolonged therapy.",
        objective: .adverseEffect,
        relatedDrugIds: ["d163"],
        tags: ["osteoporosis", "bone density", "long-term toxicity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_026",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient has been on systemic corticosteroids for more than 6 weeks. Which eye-related monitoring concern is specifically high yield with prolonged therapy?",
        options: ["Monitor for increased intraocular pressure, glaucoma, and cataracts", "Monitor for retinal detachment from direct sodium retention", "Monitor only for color blindness because steroids damage the optic chiasm", "No eye monitoring is needed with any systemic steroid", "Only hydrocortisone causes ocular complications"],
        answer: "Monitor for increased intraocular pressure, glaucoma, and cataracts",
        explanation: "Prolonged corticosteroid use can raise intraocular pressure and contribute to glaucoma and cataracts. That is why eye symptoms and prolonged courses deserve attention.",
        objective: .monitoring,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["ophthalmic", "glaucoma", "cataracts"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_027",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient receiving immunosuppressive-dose prednisone asks whether they can receive a live attenuated vaccine this week. Which answer is best?",
        options: ["Live or live attenuated vaccines should generally be avoided during immunosuppressive corticosteroid dosing", "Live vaccines are required because steroids weaken immunity", "Only dexamethasone interferes with live vaccines", "Hydrocortisone and prednisone both improve live-vaccine response", "Live vaccines are safe, but inactivated vaccines are contraindicated"],
        answer: "Live or live attenuated vaccines should generally be avoided during immunosuppressive corticosteroid dosing",
        explanation: "Live or live attenuated vaccines are generally contraindicated during immunosuppressive corticosteroid treatment. Replacement doses are a different situation from high anti-inflammatory or immunosuppressive doses.",
        objective: .contraindication,
        relatedDrugIds: ["d163"],
        tags: ["vaccines", "live vaccine", "contraindication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_028",
        subsectionId: "3f",
        difficulty: .hard,
        question: "Which statement correctly contrasts steroid replacement therapy with immunosuppressive steroid therapy for vaccination questions?",
        options: ["Replacement therapy such as physiologic hydrocortisone for Addison disease is different from high-dose immunosuppressive steroid therapy, so routine immunization rules are not the same", "All corticosteroid use, even physiologic replacement, absolutely prohibits all vaccines", "Only dexamethasone counts as immunosuppressive; hydrocortisone never does", "Inactivated vaccines are always contraindicated during any steroid use", "Vaccines matter only with topical steroids, not systemic ones"],
        answer: "Replacement therapy such as physiologic hydrocortisone for Addison disease is different from high-dose immunosuppressive steroid therapy, so routine immunization rules are not the same",
        explanation: "The vaccine warning focuses on immunosuppressive corticosteroid doses. Patients taking replacement hydrocortisone for adrenal insufficiency are a distinct situation from patients on high-dose prednisone bursts or chronic immunosuppression.",
        objective: .pearl,
        relatedDrugIds: ["d166", "d163"],
        tags: ["vaccines", "replacement therapy", "Addison disease"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_029",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Among the steroids in this subsection, which one is most likely to cause sodium and water retention that can worsen edema or blood pressure because of its salt-retaining activity?",
        options: ["Hydrocortisone", "Dexamethasone", "Methylprednisolone", "Prednisone", "Semaglutide"],
        answer: "Hydrocortisone",
        explanation: "Hydrocortisone has the most meaningful salt-retaining activity among the core steroids in this subsection. That is useful for adrenal replacement but can be a downside when edema or blood pressure is a concern.",
        objective: .adverseEffect,
        relatedDrugIds: ["d166"],
        tags: ["salt retention", "fluid retention", "hydrocortisone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_030",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Which drug in this subsection is least likely to contribute to sodium retention when used at equipotent anti-inflammatory doses?",
        options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Methylprednisolone", "Pioglitazone"],
        answer: "Dexamethasone",
        explanation: "Dexamethasone almost completely lacks the sodium-retaining property of hydrocortisone. That distinction is why dexamethasone and hydrocortisone often show up together in comparison questions.",
        objective: .pearl,
        relatedDrugIds: ["d165", "d166"],
        tags: ["minimal sodium retention", "dexamethasone", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_031",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient with a metastatic brain tumor develops headache and neurologic symptoms from cerebral edema. Which corticosteroid from this subsection most directly matches that indication?",
        options: ["Dexamethasone", "Prednisone", "Hydrocortisone", "Methylprednisolone", "Liothyronine"],
        answer: "Dexamethasone",
        explanation: "Dexamethasone is a classic choice for cerebral edema associated with brain tumors or craniotomy. It is a hallmark indication that helps distinguish dexamethasone from replacement-focused hydrocortisone.",
        objective: .indication,
        relatedDrugIds: ["d165"],
        tags: ["cerebral edema", "brain tumor", "dexamethasone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_032",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient with Addison disease needs a steroid for physiologic replacement, not just broad anti-inflammatory activity. Which drug is best suited to that goal?",
        options: ["Hydrocortisone", "Dexamethasone", "Prednisone", "Methylprednisolone", "Sitagliptin"],
        answer: "Hydrocortisone",
        explanation: "Hydrocortisone is preferred for physiologic replacement in adrenal insufficiency. Dexamethasone is a strong anti-inflammatory steroid but lacks the salt-retaining effect that often matters in Addison disease.",
        objective: .indication,
        relatedDrugIds: ["d166", "d165"],
        tags: ["Addison disease", "adrenal insufficiency", "replacement"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_033",
        subsectionId: "3f",
        difficulty: .hard,
        question: "When oral therapy is not feasible and very rapid high blood levels are required, which injectable product in this subsection is specifically described as particularly useful for immediate IV administration?",
        options: ["Solu-Cortef (hydrocortisone sodium succinate)", "Deltasone (prednisone)", "Medrol tablets", "Ozempic", "Tapazole"],
        answer: "Solu-Cortef (hydrocortisone sodium succinate)",
        explanation: "Solu-Cortef is formulated for IV or IM use and is particularly useful when rapid high blood levels are needed. That is one reason hydrocortisone remains central in acute adrenal-insufficiency settings.",
        objective: .pearl,
        relatedDrugIds: ["d166"],
        tags: ["Solu-Cortef", "IV", "acute care"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_034",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Which oral-to-injectable corticosteroid pair is most associated with acute inflammatory hospital use, where the IV form is often chosen because oral therapy is not feasible and onset is fast?",
        options: ["Methylprednisolone → Medrol / Solu-Medrol", "Prednisone → Deltasone / Humalog", "Hydrocortisone → Cortef / Januvia", "Dexamethasone → Decadron / Eliquis", "Pioglitazone → Actos / Solu-Medrol"],
        answer: "Methylprednisolone → Medrol / Solu-Medrol",
        explanation: "Methylprednisolone pairs with Medrol orally and Solu-Medrol by injection. That brand/formulation pairing is especially high yield in acute inflammatory flare questions.",
        objective: .pearl,
        relatedDrugIds: ["d164"],
        tags: ["Medrol", "Solu-Medrol", "brand pair"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_035",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient on chronic corticosteroids is heading to surgery after months of treatment. Which dosing concept is most important because prior steroid use can blunt the normal stress response?",
        options: ["Stress-dose corticosteroids may be needed before, during, and after major stress", "Abruptly stop the steroid the night before surgery", "Add methimazole to prevent steroid-induced tachycardia", "Only blood-pressure medications need adjustment", "Give live vaccines the day before surgery to boost immunity"],
        answer: "Stress-dose corticosteroids may be needed before, during, and after major stress",
        explanation: "Patients with recent or chronic corticosteroid exposure may need increased rapidly acting corticosteroids during unusual stress such as surgery. This is a classic adrenal-suppression pearl.",
        objective: .dosing,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["stress dosing", "surgery", "adrenal suppression"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_036",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient takes prednisone daily and also uses naproxen frequently for pain. Which complication becomes more concerning because of this drug combination?",
        options: ["Gastrointestinal irritation, ulceration, bleeding, or even perforation risk", "Severe hypoglycemia from additive insulin release", "Bradycardia from dual AV-node blockade", "Profound hyponatremia from dual sodium wasting", "Myxedema coma from thyroid suppression"],
        answer: "Gastrointestinal irritation, ulceration, bleeding, or even perforation risk",
        explanation: "Systemic corticosteroids already carry GI risk, and NSAIDs can further raise the chance of ulceration or bleeding. This combination deserves counseling and caution, especially in high-risk patients.",
        objective: .interaction,
        relatedDrugIds: ["d163"],
        tags: ["NSAIDs", "GI bleed", "interaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_037",
        subsectionId: "3f",
        difficulty: .hard,
        question: "A patient on systemic corticosteroids reports black stools and new abdominal pain, but the exam is not dramatically peritoneal. Which steroid warning explains why clinicians still worry about perforation or bleeding?",
        options: ["Corticosteroids can increase GI risk and may mask the usual signs of perforation", "Steroids directly cause bowel obstruction in every patient", "This finding is specific to hydrocortisone replacement doses", "Steroids eliminate all acid production, so GI disease is unlikely", "The symptom pattern is more typical of SGLT2 inhibitors than steroids"],
        answer: "Corticosteroids can increase GI risk and may mask the usual signs of perforation",
        explanation: "Systemic corticosteroids can increase GI risk and may blunt the usual inflammatory signs of perforation or serious abdominal pathology. That is why black stools or severe abdominal symptoms on steroids deserve prompt evaluation.",
        objective: .contraindication,
        relatedDrugIds: ["d163"],
        tags: ["GI perforation", "masked symptoms", "warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_038",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Which shared warning best applies to prednisone, methylprednisolone, dexamethasone, and hydrocortisone in a patient with untreated systemic fungal infection?",
        options: ["Systemic corticosteroids may worsen or disseminate fungal infection and should generally be avoided unless needed to control a drug reaction", "These steroids are first-line antifungals and should be started immediately", "Only dexamethasone is problematic; the others are safe", "Hydrocortisone is contraindicated only if the fungus is topical", "Steroids eradicate fungal infection by suppressing inflammation"],
        answer: "Systemic corticosteroids may worsen or disseminate fungal infection and should generally be avoided unless needed to control a drug reaction",
        explanation: "Systemic corticosteroids can worsen systemic fungal infections because they suppress immunity. That class-wide warning is a classic contraindication pearl.",
        objective: .contraindication,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["systemic fungal infection", "contraindication", "infection risk"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_039",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Which drug in this subsection is the naturally occurring glucocorticoid rather than a mainly synthetic analog used mostly for anti-inflammatory effect?",
        options: ["Hydrocortisone", "Prednisone", "Methylprednisolone", "Dexamethasone", "Empagliflozin"],
        answer: "Hydrocortisone",
        explanation: "Hydrocortisone is the naturally occurring glucocorticoid in this group. That fact helps explain why it is so central in physiologic replacement questions.",
        objective: .classId,
        relatedDrugIds: ["d166"],
        tags: ["naturally occurring", "hydrocortisone", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_040",
        subsectionId: "3f",
        difficulty: .hard,
        question: "Which steroid in this subsection best fits the phrase 'strong anti-inflammatory effect per milligram with minimal mineralocorticoid effect,' making it a poor solo choice when salt-retaining replacement is needed?",
        options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Methylprednisolone", "Metformin"],
        answer: "Dexamethasone",
        explanation: "Dexamethasone is highly potent per milligram and has very little sodium-retaining activity. That makes it useful for anti-inflammatory situations like cerebral edema but not the best standalone replacement steroid when mineralocorticoid effect matters.",
        objective: .pearl,
        relatedDrugIds: ["d165", "d166"],
        tags: ["potency", "minimal mineralocorticoid", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_041",
        subsectionId: "3f",
        difficulty: .hard,
        question: "A clinician wants to use a single corticosteroid as the main glucocorticoid replacement in primary adrenal insufficiency. Which option from this subsection would be least appropriate as a stand-alone choice if mineralocorticoid effect is important?",
        options: ["Dexamethasone", "Hydrocortisone", "All of these are equally ideal", "Prednisone", "Methylprednisolone"],
        answer: "Dexamethasone",
        explanation: "Dexamethasone lacks meaningful sodium-retaining activity, so it is a poor stand-alone choice when mineralocorticoid effect matters in primary adrenal insufficiency. Hydrocortisone is the classic first-choice replacement steroid.",
        objective: .contraindication,
        relatedDrugIds: ["d165", "d166"],
        tags: ["adrenal insufficiency", "replacement", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_042",
        subsectionId: "3f",
        difficulty: .expert,
        question: "A patient is receiving very high-dose IV hydrocortisone for an emergency, but the team now expects therapy to continue beyond 48 to 72 hours. Which steroid from this subsection may be preferred next because it causes little or no sodium retention?",
        options: ["Methylprednisolone", "Hydrocortisone", "Prednisone", "Dexamethasone", "Liothyronine"],
        answer: "Methylprednisolone",
        explanation: "When prolonged very high-dose hydrocortisone is expected, hypernatremia can become a concern because of sodium retention. In that situation, switching to methylprednisolone is a classic hospital pearl.",
        objective: .pearl,
        relatedDrugIds: ["d166", "d164"],
        tags: ["hypernatremia", "sodium retention", "hospital pearl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_043",
        subsectionId: "3f",
        difficulty: .medium,
        question: "Which set of changes most strongly suggests chronic systemic steroid excess or Cushingoid effects rather than a simple viral illness?",
        options: ["Weight gain, elevated blood glucose, fluid retention, and rising blood pressure", "Dry cough, angioedema, and hyperkalemia", "Bradycardia, fatigue, and AV block", "Severe diarrhea, steatorrhea, and B12 deficiency", "Urinary frequency, genital yeast infection, and ketonuria"],
        answer: "Weight gain, elevated blood glucose, fluid retention, and rising blood pressure",
        explanation: "Systemic steroid excess commonly causes Cushingoid changes such as weight gain, hyperglycemia, fluid retention, and increased blood pressure. That cluster is much more steroid-like than the distractor patterns.",
        objective: .adverseEffect,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["Cushingoid", "hyperglycemia", "fluid retention"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_044",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A child is started on prolonged systemic corticosteroid therapy for a chronic inflammatory disorder. Which long-term monitoring issue is especially important in pediatric patients?",
        options: ["Growth and development should be monitored carefully", "Only LDL cholesterol matters", "No monitoring is needed unless the child takes dexamethasone", "Steroids accelerate growth, so only final adult height matters", "Monitor TSH weekly because steroids directly destroy the thyroid"],
        answer: "Growth and development should be monitored carefully",
        explanation: "Long-term systemic corticosteroid exposure can negatively affect growth and development in children. Pediatric monitoring is a classic steroid safety pearl.",
        objective: .monitoring,
        relatedDrugIds: ["d163", "d164", "d165", "d166"],
        tags: ["pediatrics", "growth", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q3f_add_045",
        subsectionId: "3f",
        difficulty: .medium,
        question: "A patient is picking up a 3-week prednisone taper after a severe inflammatory flare. Which counseling point is the most important single takeaway?",
        options: ["Follow the taper exactly and do not stop early or abruptly without medical guidance", "Take the whole taper dose at bedtime to reduce insomnia", "Skip meals while taking it to improve absorption", "Get a live vaccine while the dose is highest", "Avoid checking glucose because steroids do not affect blood sugar"],
        answer: "Follow the taper exactly and do not stop early or abruptly without medical guidance",
        explanation: "For multiweek steroid courses, taper instructions matter. The safest counseling pearl is to follow the taper exactly and not stop abruptly without guidance because adrenal suppression and flare rebound can occur.",
        objective: .dosing,
        relatedDrugIds: ["d163"],
        tags: ["prednisone taper", "counseling", "dosing"],
        source: .curated
    )

    ]
}