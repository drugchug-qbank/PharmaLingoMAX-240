// PharmaLingo — Module 8d (Antispasmodics)
// Curated Add-On Question Pack (45 questions)
// IDs: q8d_add_001 ... q8d_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 8d exists, then append:
//
//    if bank["8d"] == nil { bank["8d"] = [] }
//    bank["8d"]?.append(contentsOf: Self.curatedAddOnQuestions_8d)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo ID:
//   d261 (Dicyclomine / Bentyl).
//
// Generated on: 2026-03-09

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8d: [Question] = [
    .multipleChoice(
        id: "q8d_add_001",
        subsectionId: "8d",
        difficulty: .easy,
        question: "Bentyl is the classic anticholinergic antispasmodic used for irritable bowel syndrome when abdominal cramping is a major complaint. What is the generic name of Bentyl?",
        options: ["Dicyclomine", "Dicycloverine", "Docusate sodium", "Diphenoxylate/Atropine", "Dexlansoprazole"],
        answer: "Dicyclomine",
        explanation: "Bentyl is the brand name for dicyclomine, an anticholinergic antispasmodic used for functional bowel/irritable bowel syndrome.",
        objective: .brandGeneric,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_002",
        subsectionId: "8d",
        difficulty: .easy,
        question: "Dicyclomine is the antispasmodic in this subsection that reduces GI smooth-muscle spasm rather than suppressing acid or stopping diarrhea. Which brand name matches dicyclomine?",
        options: ["Bentyl", "Linzess", "Carafate", "Zofran", "Pepcid"],
        answer: "Bentyl",
        explanation: "Dicyclomine is marketed as Bentyl.",
        objective: .genericBrand,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_003",
        subsectionId: "8d",
        difficulty: .easy,
        question: "Dicyclomine is not a laxative or an acid suppressor. It is primarily used when a patient with functional bowel disease complains of painful intestinal spasm. What is its main indication?",
        options: ["Functional bowel/irritable bowel syndrome", "Gastroesophageal reflux disease", "Acute infectious diarrhea", "Ulcerative colitis maintenance", "Nausea and vomiting prevention"],
        answer: "Functional bowel/irritable bowel syndrome",
        explanation: "Dicyclomine is indicated for functional bowel/irritable bowel syndrome, especially when cramping or spasm is prominent.",
        objective: .indication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "ibs", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_004",
        subsectionId: "8d",
        difficulty: .easy,
        question: "A student sees dicyclomine on a med list and wants to classify it correctly. Which drug class best describes dicyclomine?",
        options: ["Anticholinergic antispasmodic", "Proton pump inhibitor", "5-HT3 antagonist", "Opioid antidiarrheal", "Guanylate cyclase-C agonist"],
        answer: "Anticholinergic antispasmodic",
        explanation: "Dicyclomine is an anticholinergic (antimuscarinic) antispasmodic.",
        objective: .classId,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_005",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Dicyclomine helps IBS cramping by reducing parasympathetic signaling to the gut. Which mechanism best explains this effect?",
        options: ["Muscarinic receptor blockade in the GI tract", "Irreversible proton pump inhibition", "Peripheral mu-opioid receptor agonism", "Serotonin 5-HT3 blockade", "Direct stimulation of GI motility"],
        answer: "Muscarinic receptor blockade in the GI tract",
        explanation: "Dicyclomine works primarily as an antimuscarinic agent, decreasing GI smooth-muscle spasm.",
        objective: .moa,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "moa", "antimuscarinic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_006",
        subsectionId: "8d",
        difficulty: .medium,
        question: "High-yield pharmacology pearl: dicyclomine is not only antimuscarinic. The label also notes a second way it helps bowel spasm. What is that second mechanism?",
        options: ["Direct smooth-muscle (musculotropic) antispasmodic effect", "Stimulation of gastric acid secretion", "Inhibition of cyclooxygenase", "Activation of guanylate cyclase-C", "Bile acid sequestration"],
        answer: "Direct smooth-muscle (musculotropic) antispasmodic effect",
        explanation: "Dicyclomine relieves GI spasm through antimuscarinic activity and a direct smooth-muscle antispasmodic effect.",
        objective: .moa,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "moa", "dual-mechanism"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_007",
        subsectionId: "8d",
        difficulty: .easy,
        question: "A patient with IBS asks what symptom dicyclomine is meant to improve most directly. Which symptom is the highest-yield target?",
        options: ["Abdominal cramping from bowel spasm", "Heartburn after meals", "Bloody diarrhea from active IBD", "Persistent vomiting", "Severe constipation requiring bowel prep"],
        answer: "Abdominal cramping from bowel spasm",
        explanation: "Dicyclomine is mainly used to reduce painful bowel spasm and cramping in IBS.",
        objective: .indication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "symptom-target"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_008",
        subsectionId: "8d",
        difficulty: .easy,
        question: "Because dicyclomine is strongly anticholinergic, one of its most common adverse effects is reduced salivary secretion. Which complaint best fits that effect?",
        options: ["Dry mouth", "Tinnitus", "Cough", "Diaphoresis", "Diarrhea"],
        answer: "Dry mouth",
        explanation: "Dry mouth is one of the most common anticholinergic adverse effects of dicyclomine.",
        objective: .adverseEffect,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "dry-mouth"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_009",
        subsectionId: "8d",
        difficulty: .easy,
        question: "A patient starts dicyclomine for IBS and then reports trouble focusing and sensitivity to light. Which adverse effect best explains this?",
        options: ["Blurred vision from anticholinergic eye effects", "Permanent retinal toxicity", "Optic neuritis", "Color blindness", "Night blindness from vitamin deficiency"],
        answer: "Blurred vision from anticholinergic eye effects",
        explanation: "Dicyclomine can cause mydriasis, cycloplegia, and blurred vision because of its anticholinergic effects.",
        objective: .adverseEffect,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "vision"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_010",
        subsectionId: "8d",
        difficulty: .easy,
        question: "Dicyclomine decreases GI tone and motility while relieving spasm. Which common adverse effect follows logically from that mechanism?",
        options: ["Constipation", "Productive cough", "Hypoglycemia", "Peripheral edema", "Tremor"],
        answer: "Constipation",
        explanation: "By reducing GI motility, dicyclomine can cause constipation.",
        objective: .adverseEffect,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "constipation"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_011",
        subsectionId: "8d",
        difficulty: .medium,
        question: "An older man with IBS and BPH starts dicyclomine and soon has trouble starting his urine stream. Which medication-related adverse effect is most likely?",
        options: ["Urinary retention", "Ototoxicity", "Hyperreflexia", "Tendon rupture", "Photosensitivity"],
        answer: "Urinary retention",
        explanation: "Dicyclomine can worsen urinary retention because of its anticholinergic effects, especially in patients with prostatic enlargement.",
        objective: .adverseEffect,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "urinary-retention"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_012",
        subsectionId: "8d",
        difficulty: .medium,
        question: "A good counseling point for dicyclomine is that it may cause drowsiness, dizziness, or blurred vision. What should patients be warned about?",
        options: ["Use caution with driving or hazardous tasks until they know how it affects them", "Always take it with an antacid to improve absorption", "Use it only as a rescue drug for diarrhea", "Double the dose in hot weather", "Stop their bowel regimen immediately"],
        answer: "Use caution with driving or hazardous tasks until they know how it affects them",
        explanation: "Dicyclomine may cause drowsiness, dizziness, and blurred vision, so patients should use caution with driving or other hazardous activities.",
        objective: .pearl,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "driving", "counseling"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_013",
        subsectionId: "8d",
        difficulty: .medium,
        question: "A patient taking dicyclomine spends hours outside on a hot summer day and develops fever and weakness. Which counseling pearl best explains why this drug may contribute?",
        options: ["Anticholinergic decreased sweating can contribute to heat prostration", "It directly lowers serum sodium", "It causes profound vasodilation in heat", "It sharply lowers glucose during exercise", "It blocks cortisol production in heat stress"],
        answer: "Anticholinergic decreased sweating can contribute to heat prostration",
        explanation: "Dicyclomine can decrease sweating and contribute to heat prostration or heat stroke in high environmental temperatures.",
        objective: .pearl,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "heat-prostration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_014",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Which patient is an absolute no-go for dicyclomine based on labeled contraindications?",
        options: ["A 4-month-old infant with colicky abdominal symptoms", "A 27-year-old adult with IBS-D", "A 38-year-old with mild heartburn", "A 49-year-old with hemorrhoids", "A 55-year-old with occasional nausea"],
        answer: "A 4-month-old infant with colicky abdominal symptoms",
        explanation: "Dicyclomine is contraindicated in infants younger than 6 months of age.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "infants"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_015",
        subsectionId: "8d",
        difficulty: .hard,
        question: "A postpartum patient with IBS asks whether she can use dicyclomine while breastfeeding. What is the best answer?",
        options: ["No—dicyclomine is contraindicated during breastfeeding", "Yes—it is preferred during breastfeeding", "Yes—but only if taken with food", "Yes—but only with an H2 blocker", "Only if combined with loperamide"],
        answer: "No—dicyclomine is contraindicated during breastfeeding",
        explanation: "Dicyclomine is contraindicated in breastfeeding because it is excreted in human milk and may cause serious adverse reactions in the infant.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "breastfeeding"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_016",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Because anticholinergics can increase intraocular pressure and worsen visual symptoms, which condition is a classic contraindication to dicyclomine?",
        options: ["Glaucoma", "Hypothyroidism", "Iron deficiency anemia", "Migraine without aura", "Type 2 diabetes"],
        answer: "Glaucoma",
        explanation: "Dicyclomine is contraindicated in patients with glaucoma.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "glaucoma"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_017",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Dicyclomine should generally not be used in patients with which neuromuscular disorder because anticholinergic effects can worsen weakness and overdosage can resemble neuromuscular blockade?",
        options: ["Myasthenia gravis", "Parkinson disease", "Trigeminal neuralgia", "Multiple sclerosis", "Tourette syndrome"],
        answer: "Myasthenia gravis",
        explanation: "Dicyclomine is contraindicated in myasthenia gravis.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "myasthenia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_018",
        subsectionId: "8d",
        difficulty: .hard,
        question: "A patient with functional bowel syndrome also has obstructive uropathy. Why is dicyclomine a poor choice?",
        options: ["Its anticholinergic effects can worsen urinary obstruction and retention", "It irreversibly injures the kidneys", "It causes urinary glucose wasting", "It alkalinizes the urine", "It causes direct bladder contraction"],
        answer: "Its anticholinergic effects can worsen urinary obstruction and retention",
        explanation: "Dicyclomine is contraindicated in obstructive uropathy because it can worsen urinary retention.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "uropathy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_019",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Diarrhea can sometimes be an early clue to partial intestinal obstruction rather than simple IBS. Why would dicyclomine be inappropriate in that setting?",
        options: ["It can further slow GI motility and be harmful in obstruction", "It would immediately cause GI bleeding", "It converts diarrhea into vomiting only", "It neutralizes gastric acid but not bowel spasm", "It triggers opioid withdrawal"],
        answer: "It can further slow GI motility and be harmful in obstruction",
        explanation: "Dicyclomine is contraindicated in obstructive GI disease because its anticholinergic effects reduce GI motility and can worsen the problem.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "gi-obstruction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_020",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Which GI condition is especially important to screen for before starting dicyclomine because large doses can suppress motility and contribute to toxic megacolon?",
        options: ["Severe ulcerative colitis", "Mild lactose intolerance", "Simple dyspepsia", "Uncomplicated GERD", "Peptic ulcer disease"],
        answer: "Severe ulcerative colitis",
        explanation: "Dicyclomine is contraindicated in severe ulcerative colitis and can aggravate toxic megacolon risk by suppressing GI motility.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "ulcerative-colitis"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_021",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Why should dicyclomine be used cautiously in older adults, even when IBS symptoms seem appropriate for treatment?",
        options: ["They may be more susceptible to anticholinergic adverse effects such as confusion, constipation, and urinary retention", "It becomes a proton pump inhibitor in older adults", "It always causes hypokalemia in older adults", "Its absorption stops completely after age 65", "It is contraindicated in all adults over 65"],
        answer: "They may be more susceptible to anticholinergic adverse effects such as confusion, constipation, and urinary retention",
        explanation: "Older adults can be more sensitive to anticholinergic adverse effects, so dicyclomine should be used cautiously.",
        objective: .pearl,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "elderly"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_022",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Before starting dicyclomine, which comorbidity deserves extra caution because anticholinergic effects may accelerate heart rate and worsen symptoms?",
        options: ["Tachyarrhythmia", "Hypocalcemia", "Hypothyroidism", "Chronic constipation alone", "Migraine"],
        answer: "Tachyarrhythmia",
        explanation: "Dicyclomine should be used cautiously in patients with tachyarrhythmias and certain cardiovascular conditions because it can increase heart rate.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "cardiac-caution"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_023",
        subsectionId: "8d",
        difficulty: .medium,
        question: "A patient plans to take dicyclomine at the same time as an antacid after every meal. Why is that not ideal?",
        options: ["Antacids can interfere with dicyclomine absorption", "Antacids convert dicyclomine into a stimulant laxative", "Antacids sharply raise dicyclomine half-life through CYP inhibition", "Antacids reverse its antimuscarinic activity completely", "Antacids make dicyclomine nephrotoxic"],
        answer: "Antacids can interfere with dicyclomine absorption",
        explanation: "Antacids can interfere with absorption of anticholinergic agents like dicyclomine, so simultaneous use should be avoided.",
        objective: .interaction,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "antacids"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_024",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Which concomitant GI drug may have its prokinetic effect opposed by dicyclomine because the two drugs push GI motility in opposite directions?",
        options: ["Metoclopramide", "Ondansetron", "Promethazine", "Famotidine", "Sucralfate"],
        answer: "Metoclopramide",
        explanation: "Dicyclomine can antagonize the effects of GI motility drugs such as metoclopramide.",
        objective: .interaction,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "metoclopramide"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_025",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Which additional medication would most likely increase anticholinergic side effects if taken with dicyclomine?",
        options: ["Diphenhydramine", "Loperamide", "Pantoprazole", "Mesalamine", "Ondansetron"],
        answer: "Diphenhydramine",
        explanation: "Diphenhydramine has anticholinergic activity and can add to the dry mouth, blurred vision, constipation, and urinary retention caused by dicyclomine.",
        objective: .interaction,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "anticholinergic-burden"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_026",
        subsectionId: "8d",
        difficulty: .hard,
        question: "A pharmacist reviews a patient taking a slowly dissolving oral digoxin product and newly prescribed dicyclomine. Which interaction pearl is most relevant?",
        options: ["Dicyclomine can increase serum digoxin concentration by altering GI motility and absorption", "Dicyclomine completely blocks digoxin absorption", "Digoxin prevents dicyclomine from working", "The combination causes serotonin syndrome", "The combination is required to prevent constipation"],
        answer: "Dicyclomine can increase serum digoxin concentration by altering GI motility and absorption",
        explanation: "Anticholinergic effects on GI motility can alter absorption of some drugs, and slowly dissolving digoxin dosage forms may show increased serum digoxin concentrations.",
        objective: .interaction,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "digoxin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_027",
        subsectionId: "8d",
        difficulty: .medium,
        question: "What is the usual recommended initial adult oral dose of dicyclomine for IBS according to the label?",
        options: ["20 mg four times daily", "10 mg once daily", "40 mg once daily", "80 mg once daily", "20 mg at bedtime only"],
        answer: "20 mg four times daily",
        explanation: "The labeled adult starting dose is 20 mg by mouth four times daily.",
        objective: .dosing,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "dosing", "initial-dose"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_028",
        subsectionId: "8d",
        difficulty: .medium,
        question: "If dicyclomine is tolerated after about one week but symptoms are still not controlled, what dose escalation does the label allow?",
        options: ["Increase to 40 mg four times daily", "Increase to 80 mg four times daily", "Increase to 60 mg once daily", "Switch automatically to rectal therapy", "Double only the bedtime dose"],
        answer: "Increase to 40 mg four times daily",
        explanation: "After one week at the initial dose, dicyclomine may be increased to 40 mg four times daily if adverse effects do not limit titration.",
        objective: .dosing,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "dosing", "titration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_029",
        subsectionId: "8d",
        difficulty: .hard,
        question: "A patient can only tolerate a total daily dicyclomine dose below 80 mg because of side effects. What does the label recommend if that lower dose is required or if efficacy is not achieved within 2 weeks?",
        options: ["Discontinue dicyclomine", "Continue indefinitely at any tolerated dose", "Add an antacid and continue", "Use only on weekends", "Automatically switch to lactulose"],
        answer: "Discontinue dicyclomine",
        explanation: "The label recommends discontinuing dicyclomine if efficacy is not achieved within 2 weeks or if side effects require doses below 80 mg/day.",
        objective: .dosing,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "dosing", "discontinue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_030",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Which statement about higher-dose dicyclomine safety is most accurate?",
        options: ["Documented safety data are not available for doses above 80 mg/day for longer than 2 weeks", "Any dose above 40 mg/day is absolutely contraindicated", "The drug can be safely escalated without limit if dry mouth is absent", "Long-term safety is best established at 160 mg/day indefinitely", "The label recommends 600 mg/day in refractory IBS"],
        answer: "Documented safety data are not available for doses above 80 mg/day for longer than 2 weeks",
        explanation: "The label notes that documented safety data are not available for doses above 80 mg/day for periods longer than 2 weeks.",
        objective: .dosing,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "dosing", "max-documented"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_031",
        subsectionId: "8d",
        difficulty: .easy,
        question: "A test item asks you to pair dicyclomine with a labeled oral strength. Which pairing is correct?",
        options: ["10 mg capsule and 20 mg tablet", "5 mg chewable tablet and 50 mg capsule", "25 mg patch and 10 mg syrup only", "100 mg tablet only", "2 mg injection only for home IBS therapy"],
        answer: "10 mg capsule and 20 mg tablet",
        explanation: "Dicyclomine is supplied as 10 mg capsules and 20 mg tablets in the labeling used for this pack.",
        objective: .dosing,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "dosage-forms"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_032",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Which esophageal condition appears on the labeled contraindication list for dicyclomine?",
        options: ["Reflux esophagitis", "Eosinophilic esophagitis", "Achalasia after myotomy", "Barrett esophagus alone", "Esophageal candidiasis"],
        answer: "Reflux esophagitis",
        explanation: "Reflux esophagitis is listed among the contraindications for dicyclomine.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "reflux-esophagitis"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_033",
        subsectionId: "8d",
        difficulty: .medium,
        question: "A patient who is pregnant asks about dicyclomine for severe IBS cramping. Which response best matches the label?",
        options: ["Use only if clearly needed", "It is preferred in every trimester", "It is contraindicated in all pregnancy", "It is required with every prenatal vitamin", "It should only be used during labor"],
        answer: "Use only if clearly needed",
        explanation: "The label advises using dicyclomine during pregnancy only if clearly needed.",
        objective: .pearl,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "pregnancy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_034",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Which statement about pediatric use of dicyclomine is most accurate?",
        options: ["Safety and effectiveness are not established in pediatric patients, and it is contraindicated in infants under 6 months", "It is first-line for all children with abdominal pain", "It is approved for neonatal colic", "It is preferred over hydration in pediatric diarrhea", "It is used to speed bowel motility in infants"],
        answer: "Safety and effectiveness are not established in pediatric patients, and it is contraindicated in infants under 6 months",
        explanation: "Dicyclomine has not established safety/effectiveness in pediatric patients and is contraindicated in infants younger than 6 months.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "pediatrics"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_035",
        subsectionId: "8d",
        difficulty: .medium,
        question: "A clinician starts dicyclomine and wants a practical follow-up question for safety. Which is most appropriate?",
        options: ["Any new dry mouth, blurry vision, constipation, confusion, or trouble urinating?", "Any black stools from GI bleeding?", "Any tendon pain after exercise?", "Any tooth discoloration from chelation?", "Any ringing in the ears after each dose?"],
        answer: "Any new dry mouth, blurry vision, constipation, confusion, or trouble urinating?",
        explanation: "Patients on dicyclomine should be assessed for anticholinergic adverse effects such as dry mouth, blurred vision, constipation, confusion, and urinary retention.",
        objective: .monitoring,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_036",
        subsectionId: "8d",
        difficulty: .hard,
        question: "An older adult develops agitation, confusion, and visual hallucinations soon after starting dicyclomine. Which explanation is most likely?",
        options: ["Anticholinergic CNS toxicity", "Opioid withdrawal", "Serotonin syndrome from 5-HT3 blockade", "Acute iron poisoning", "Bile acid malabsorption"],
        answer: "Anticholinergic CNS toxicity",
        explanation: "Sensitive patients, especially older adults, can develop anticholinergic CNS effects such as confusion, delirium, and hallucinations on dicyclomine.",
        objective: .adverseEffect,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "cns", "elderly"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_037",
        subsectionId: "8d",
        difficulty: .easy,
        question: "A patient says, “I feel like I need to urinate, but I can’t get started,” a few days after beginning dicyclomine. Which adverse effect should you suspect first?",
        options: ["Urinary hesitancy/retention from anticholinergic activity", "Acute kidney stone dissolution", "Excess bile secretion", "Profound diuresis", "Immune thrombocytopenia"],
        answer: "Urinary hesitancy/retention from anticholinergic activity",
        explanation: "Dicyclomine can cause urinary hesitancy or retention because of its anticholinergic effects.",
        objective: .adverseEffect,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "urinary-hesitancy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_038",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Which patient is the best match for dicyclomine therapy?",
        options: ["A patient with IBS and post-meal cramping", "A patient with active ulcerative colitis flare and bloody diarrhea", "A patient needing acid suppression for GERD", "A patient with acute vomiting after chemotherapy", "A patient with C. difficile diarrhea"],
        answer: "A patient with IBS and post-meal cramping",
        explanation: "Dicyclomine is best matched to functional bowel/IBS with cramping, not inflammatory, infectious, or acid-related conditions.",
        objective: .indication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "not-for-ibd"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_039",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Which counseling statement is best for a patient who takes dicyclomine and works outdoors in summer?",
        options: ["If you develop fever, overheating, or feel unable to sweat normally, stop the medication and seek medical advice", "Take an extra dose before long shifts in the heat", "Always combine it with pseudoephedrine to offset sedation", "It improves heat tolerance because it dries secretions", "Use it to prevent dehydration during heavy exercise"],
        answer: "If you develop fever, overheating, or feel unable to sweat normally, stop the medication and seek medical advice",
        explanation: "Dicyclomine can reduce sweating and contribute to heat prostration, so patients should stop it and seek advice if heat illness symptoms develop.",
        objective: .pearl,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "heat-counseling"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_040",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Which patient characteristic makes extra caution reasonable because dicyclomine has not been well studied in this setting and toxic reactions may be more likely?",
        options: ["Renal impairment", "Seasonal allergies", "Prior appendectomy", "Well-controlled hypothyroidism", "Myopia"],
        answer: "Renal impairment",
        explanation: "Dicyclomine should be used cautiously in renal impairment because toxic reactions may be more likely.",
        objective: .monitoring,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "renal-hepatic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_041",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Which additional comorbidity also warrants caution when dicyclomine is prescribed?",
        options: ["Hepatic impairment", "A history of heartburn relieved by antacids", "Controlled eczema", "Stable migraine without aura", "Isolated hyperlipidemia"],
        answer: "Hepatic impairment",
        explanation: "Dicyclomine should also be used cautiously in hepatic impairment.",
        objective: .monitoring,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "hepatic-impairment"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_042",
        subsectionId: "8d",
        difficulty: .medium,
        question: "A patient is already taking multiple medications with anticholinergic effects. Why does adding dicyclomine deserve extra thought?",
        options: ["Additive anticholinergic burden can worsen dry mouth, constipation, urinary retention, and confusion", "It will neutralize all other anticholinergics", "It turns every antihistamine into a bronchodilator", "It prevents all CNS effects from sedatives", "It eliminates the need to monitor hydration"],
        answer: "Additive anticholinergic burden can worsen dry mouth, constipation, urinary retention, and confusion",
        explanation: "Combining dicyclomine with other anticholinergic drugs can increase adverse effects.",
        objective: .interaction,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "anticholinergic-cluster"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_043",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Why can the same mechanism that relieves IBS spasm also create constipation in some patients taking dicyclomine?",
        options: ["It reduces GI tone and motility while blocking muscarinic receptors", "It causes osmotic water loss into the stool", "It stimulates intestinal chloride secretion", "It inhibits pancreatic enzymes", "It blocks bile acid reabsorption"],
        answer: "It reduces GI tone and motility while blocking muscarinic receptors",
        explanation: "Dicyclomine relieves cramping by reducing muscarinic signaling and GI motility, which can also cause constipation.",
        objective: .moa,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "motility"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_044",
        subsectionId: "8d",
        difficulty: .medium,
        question: "Dicyclomine is meant for functional bowel spasm, not structural obstruction. Which scenario best shows that distinction?",
        options: ["IBS-related cramping without mechanical blockage is appropriate; bowel obstruction is not", "Any abdominal pain with vomiting is appropriate", "Bloody diarrhea from severe colitis is the best indication", "It should be used first in obstructed bowel to decrease pain", "It is only used after colonoscopy prep fails"],
        answer: "IBS-related cramping without mechanical blockage is appropriate; bowel obstruction is not",
        explanation: "Dicyclomine fits functional bowel spasm such as IBS, but it is inappropriate and potentially harmful in bowel obstruction.",
        objective: .contraindication,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "functional-vs-structural"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8d_add_045",
        subsectionId: "8d",
        difficulty: .hard,
        question: "Which summary statement about dicyclomine is most accurate and high-yield?",
        options: ["It is Bentyl, an anticholinergic antispasmodic for IBS cramping that can cause dry mouth, blurred vision, constipation, urinary retention, and should be avoided in infants under 6 months and during breastfeeding", "It is a proton pump inhibitor for GERD that mainly causes diarrhea and hypomagnesemia", "It is an opioid antidiarrheal best used for C. difficile infection", "It is a prokinetic agent that increases GI motility and is preferred in bowel obstruction", "It is an antiemetic patch for motion sickness that is safe in glaucoma"],
        answer: "It is Bentyl, an anticholinergic antispasmodic for IBS cramping that can cause dry mouth, blurred vision, constipation, urinary retention, and should be avoided in infants under 6 months and during breastfeeding",
        explanation: "That summary captures the highest-yield points: Bentyl = dicyclomine, used for IBS cramping, with classic anticholinergic adverse effects and important contraindications in infants under 6 months and breastfeeding.",
        objective: .mixedReview,
        relatedDrugIds: ["d261"],
        tags: ["8d", "dicyclomine", "high-yield-summary"],
        source: .curated
    )

    ]
}
