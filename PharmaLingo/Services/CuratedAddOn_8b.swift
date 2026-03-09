// PharmaLingo — Module 8b (Antiemetics)
// Curated Add-On Question Pack (45 questions)
// IDs: q8b_add_001 ... q8b_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 8b exists, then append:
//
//    if bank["8b"] == nil { bank["8b"] = [] }
//    bank["8b"]?.append(contentsOf: Self.curatedAddOnQuestions_8b)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d140 (Aprepitant / Emend), d138 (Metoclopramide / Reglan),
//   d136 (Ondansetron / Zofran), d137 (Promethazine / Phenergan),
//   d139 (Scopolamine / Transderm Scop).
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8b: [Question] = [
.multipleChoice(
    id: "q8b_add_001",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Emend is not a serotonin blocker; it is an NK1 receptor antagonist added to a 5-HT3 antagonist plus dexamethasone for highly emetogenic chemotherapy. What is the generic name of Emend?",
    options: ["Aprepitant", "Metoclopramide", "Ondansetron", "Promethazine", "Scopolamine"],
    answer: "Aprepitant",
    explanation: "Emend is the brand name for aprepitant, an NK1 receptor antagonist used in combination antiemetic regimens.",
    objective: .brandGeneric,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_002",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Aprepitant is the antiemetic from this subsection that blocks substance P/neurokinin-1 receptors and is commonly reserved for higher-emetic-risk chemotherapy regimens. Which brand name matches aprepitant?",
    options: ["Emend", "Reglan", "Zofran", "Phenergan", "Transderm Scop"],
    answer: "Emend",
    explanation: "Aprepitant is marketed as Emend.",
    objective: .genericBrand,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_003",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Reglan is high yield because it is both an antiemetic and a prokinetic, making it useful when nausea is tied to delayed gastric emptying. What is the generic name of Reglan?",
    options: ["Metoclopramide", "Ondansetron", "Promethazine", "Aprepitant", "Scopolamine"],
    answer: "Metoclopramide",
    explanation: "Reglan is the brand name for metoclopramide, a dopamine antagonist with prokinetic activity.",
    objective: .brandGeneric,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_004",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Metoclopramide is the dopamine antagonist/prokinetic antiemetic that students should connect with gastroparesis, nausea, and a boxed warning for tardive dyskinesia. Which brand name matches metoclopramide?",
    options: ["Reglan", "Zofran", "Emend", "Phenergan", "Transderm Scop"],
    answer: "Reglan",
    explanation: "Metoclopramide is sold as Reglan.",
    objective: .genericBrand,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_005",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Zofran is the classic “-setron” antiemetic used for chemotherapy-related, postoperative, and many everyday nausea scenarios. What is the generic name of Zofran?",
    options: ["Ondansetron", "Promethazine", "Scopolamine", "Aprepitant", "Metoclopramide"],
    answer: "Ondansetron",
    explanation: "Zofran is the brand name for ondansetron, a 5-HT3 receptor antagonist.",
    objective: .brandGeneric,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_006",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Ondansetron is the widely used 5-HT3 antagonist that students remember for headache, constipation, and QT prolongation. Which brand name matches ondansetron?",
    options: ["Zofran", "Reglan", "Emend", "Phenergan", "Transderm Scop"],
    answer: "Zofran",
    explanation: "Ondansetron is marketed as Zofran.",
    objective: .genericBrand,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_007",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Phenergan is a phenothiazine antiemetic that can help with nausea and motion sickness, but it is also known for prominent sedation and important pediatric safety warnings. What is the generic name of Phenergan?",
    options: ["Promethazine", "Ondansetron", "Metoclopramide", "Scopolamine", "Aprepitant"],
    answer: "Promethazine",
    explanation: "Phenergan is the brand name for promethazine.",
    objective: .brandGeneric,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_008",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Promethazine is the sedating phenothiazine antiemetic from this section and is also used for motion sickness. Which brand name matches promethazine?",
    options: ["Phenergan", "Zofran", "Reglan", "Emend", "Transderm Scop"],
    answer: "Phenergan",
    explanation: "Promethazine is marketed as Phenergan.",
    objective: .genericBrand,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_009",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Transderm Scop is the antiemetic patch that is placed behind the ear for motion sickness prevention and teaches classic anticholinergic adverse effects. What is the generic name of Transderm Scop?",
    options: ["Scopolamine", "Promethazine", "Ondansetron", "Metoclopramide", "Aprepitant"],
    answer: "Scopolamine",
    explanation: "Transderm Scop is the brand name for scopolamine.",
    objective: .brandGeneric,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_010",
    subsectionId: "8b",
    difficulty: .easy,
    question: "Scopolamine is the anticholinergic antiemetic delivered as a transdermal system rather than a tablet, and it is especially high yield for motion sickness questions. Which brand name matches scopolamine?",
    options: ["Transderm Scop", "Phenergan", "Emend", "Reglan", "Zofran"],
    answer: "Transderm Scop",
    explanation: "Scopolamine is sold as Transderm Scop.",
    objective: .genericBrand,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_011",
    subsectionId: "8b",
    difficulty: .medium,
    question: "A patient receiving cisplatin gets dexamethasone plus ondansetron, and the oncologist adds a third antiemetic that blocks substance P/neurokinin-1 receptors to improve delayed-phase control. Which drug is this?",
    options: ["Aprepitant", "Metoclopramide", "Ondansetron", "Promethazine", "Scopolamine"],
    answer: "Aprepitant",
    explanation: "Aprepitant is the NK1 receptor antagonist used in combination regimens for highly emetogenic chemotherapy.",
    objective: .classId,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_012",
    subsectionId: "8b",
    difficulty: .medium,
    question: "A nauseated patient with diabetic gastroparesis needs an antiemetic that also speeds gastric emptying rather than simply blocking serotonin. Which option is the dopamine antagonist/prokinetic from this section?",
    options: ["Metoclopramide", "Ondansetron", "Promethazine", "Scopolamine", "Aprepitant"],
    answer: "Metoclopramide",
    explanation: "Metoclopramide is the dopamine antagonist/prokinetic antiemetic in this subsection.",
    objective: .classId,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_013",
    subsectionId: "8b",
    difficulty: .medium,
    question: "The suffix “-setron” helps students remember a serotonin-based antiemetic class used widely for chemotherapy and postoperative nausea. Which drug from this subsection fits that suffix?",
    options: ["Ondansetron", "Promethazine", "Metoclopramide", "Aprepitant", "Scopolamine"],
    answer: "Ondansetron",
    explanation: "Ondansetron ends in “-setron,” the high-yield suffix for 5-HT3 receptor antagonists.",
    objective: .suffixId,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "suffix"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_014",
    subsectionId: "8b",
    difficulty: .medium,
    question: "One antiemetic here is a phenothiazine that is useful for nausea and motion sickness but is also notably sedating. Which drug is it?",
    options: ["Promethazine", "Scopolamine", "Ondansetron", "Aprepitant", "Metoclopramide"],
    answer: "Promethazine",
    explanation: "Promethazine is a sedating phenothiazine antiemetic commonly used for nausea and motion sickness.",
    objective: .classId,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_015",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which option is the anticholinergic antiemetic delivered as a transdermal patch rather than a tablet, orally disintegrating tablet, or chemotherapy capsule?",
    options: ["Scopolamine", "Promethazine", "Ondansetron", "Metoclopramide", "Aprepitant"],
    answer: "Scopolamine",
    explanation: "Scopolamine is the anticholinergic patch used for motion sickness and postoperative nausea prevention.",
    objective: .classId,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_016",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Aprepitant teaches a different mechanism than metoclopramide or ondansetron. Which receptor does aprepitant primarily block to help prevent nausea and vomiting?",
    options: ["Neurokinin-1 (NK1) receptor", "Dopamine D2 receptor", "Serotonin 5-HT3 receptor", "Histamine H2 receptor", "Muscarinic M3 receptor"],
    answer: "Neurokinin-1 (NK1) receptor",
    explanation: "Aprepitant works by blocking substance P at NK1 receptors.",
    objective: .moa,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_017",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which mechanism best explains why metoclopramide can reduce nausea while also helping a patient with delayed gastric emptying?",
    options: ["Dopamine D2 antagonism with prokinetic effects", "Selective 5-HT3 receptor blockade only", "NK1 receptor antagonism", "Peripheral mu-opioid receptor agonism", "Proton pump inhibition"],
    answer: "Dopamine D2 antagonism with prokinetic effects",
    explanation: "Metoclopramide is a dopamine antagonist that also promotes gastric emptying, which is why it is useful in gastroparesis-associated nausea.",
    objective: .moa,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_018",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which mechanism best describes ondansetron, the classic “Zofran = first-line antiemetic” drug?",
    options: ["5-HT3 receptor antagonism", "Dopamine D2 antagonism with prokinetic action", "Muscarinic receptor antagonism", "NK1 receptor antagonism", "GABA-A receptor potentiation"],
    answer: "5-HT3 receptor antagonism",
    explanation: "Ondansetron blocks serotonin 5-HT3 receptors, which is why it is grouped with the “-setron” antiemetics.",
    objective: .moa,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_019",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which mechanism best explains why scopolamine can reduce motion-induced nausea while also causing dry mouth and blurred vision?",
    options: ["Muscarinic receptor antagonism", "5-HT3 receptor antagonism", "NK1 receptor antagonism", "Dopamine D2 receptor antagonism", "Cyclooxygenase inhibition"],
    answer: "Muscarinic receptor antagonism",
    explanation: "Scopolamine is an anticholinergic drug, so its antiemetic effect and its classic dry mouth/blurred vision side effects both fit muscarinic blockade.",
    objective: .moa,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_020",
    subsectionId: "8b",
    difficulty: .medium,
    question: "One reason promethazine is easy to identify on exams is that drowsiness is a very prominent CNS effect. Which antiemetic from this subsection is most limited by sedation?",
    options: ["Promethazine", "Ondansetron", "Aprepitant", "Scopolamine", "Metoclopramide"],
    answer: "Promethazine",
    explanation: "Promethazine is notably sedating compared with ondansetron or aprepitant.",
    objective: .adverseEffect,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "sedation"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_021",
    subsectionId: "8b",
    difficulty: .medium,
    question: "A patient with long-standing diabetes has early satiety, bloating, and nausea from delayed gastric emptying. Which antiemetic is most high yield because it can treat nausea while also acting as a prokinetic?",
    options: ["Metoclopramide", "Ondansetron", "Promethazine", "Scopolamine", "Aprepitant"],
    answer: "Metoclopramide",
    explanation: "Metoclopramide is especially useful when nausea is tied to diabetic gastroparesis because it promotes gastric emptying.",
    objective: .indication,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "gastroparesis"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_022",
    subsectionId: "8b",
    difficulty: .medium,
    question: "A patient undergoing chemotherapy wants a first-line serotonin antagonist that is also commonly used for postoperative nausea and is available as an orally disintegrating tablet. Which drug best fits?",
    options: ["Ondansetron", "Aprepitant", "Metoclopramide", "Promethazine", "Scopolamine"],
    answer: "Ondansetron",
    explanation: "Ondansetron is the classic 5-HT3 antagonist used for chemotherapy-related and postoperative nausea and vomiting, and ODT formulations are available.",
    objective: .indication,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_023",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Someone with recurrent motion sickness wants prevention before boarding a multi-day cruise and prefers not to keep redosing tablets. Which option best fits that use case?",
    options: ["Scopolamine", "Ondansetron", "Metoclopramide", "Aprepitant", "Promethazine"],
    answer: "Scopolamine",
    explanation: "Scopolamine is the transdermal antiemetic best known for motion sickness prevention.",
    objective: .indication,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "motion-sickness"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_024",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which drug is most associated with prevention of acute and delayed nausea and vomiting from highly emetogenic chemotherapy when used as part of combination therapy rather than as a stand-alone everyday antiemetic?",
    options: ["Aprepitant", "Ondansetron", "Promethazine", "Metoclopramide", "Scopolamine"],
    answer: "Aprepitant",
    explanation: "Aprepitant is usually added to other antiemetics for high-emetic-risk chemotherapy regimens.",
    objective: .indication,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "chemo"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_025",
    subsectionId: "8b",
    difficulty: .medium,
    question: "A patient has nausea plus motion sickness, and the clinician is comfortable choosing a sedating option instead of a serotonin blocker or a transdermal patch. Which drug from this section fits that role?",
    options: ["Promethazine", "Ondansetron", "Aprepitant", "Metoclopramide", "Scopolamine"],
    answer: "Promethazine",
    explanation: "Promethazine is commonly used for nausea and motion sickness, but sedation is a major tradeoff.",
    objective: .indication,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "motion-sickness"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_026",
    subsectionId: "8b",
    difficulty: .hard,
    question: "When aprepitant capsules are used for chemotherapy-induced nausea and vomiting, they are classically taught as part of a multi-day regimen rather than a single rescue dose. Which schedule matches the adult oral pattern?",
    options: ["125 mg orally 1 hour before chemotherapy on Day 1, then 80 mg each morning on Days 2 and 3", "40 mg once nightly for 5 nights after chemotherapy", "16 mg once daily only on the day of chemotherapy", "One transdermal dose changed every 72 hours", "10 mg four times daily with meals and at bedtime for 12 weeks"],
    answer: "125 mg orally 1 hour before chemotherapy on Day 1, then 80 mg each morning on Days 2 and 3",
    explanation: "The classic adult oral aprepitant CINV regimen is 125 mg on Day 1 before chemotherapy, then 80 mg on Days 2 and 3 as part of combination therapy.",
    objective: .dosing,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_027",
    subsectionId: "8b",
    difficulty: .hard,
    question: "For prevention of postoperative nausea and vomiting in adults, the high-yield pearl is that oral aprepitant can be given as a single pre-op dose rather than the 3-day chemotherapy regimen. Which timing is correct?",
    options: ["40 mg within 3 hours before induction of anesthesia", "125 mg the evening after surgery only", "80 mg once daily for 3 days after discharge", "Apply one dose behind the ear at least 4 hours before travel", "10 mg 30 minutes before meals and at bedtime"],
    answer: "40 mg within 3 hours before induction of anesthesia",
    explanation: "For adult PONV prophylaxis, aprepitant capsules are given as a single 40 mg dose within 3 hours before induction of anesthesia.",
    objective: .dosing,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "PONV"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_028",
    subsectionId: "8b",
    difficulty: .hard,
    question: "Which counseling point is correct for the scopolamine patch used for motion sickness prevention?",
    options: ["Apply one patch behind one ear at least 4 hours before it is needed; it can stay on for up to 3 days", "Chew one tablet at the first sign of nausea and repeat every 2 hours", "Apply two patches at once if symptoms are severe", "Place the patch on the abdomen because absorption is faster there", "Cut the patch in half if dry mouth develops"],
    answer: "Apply one patch behind one ear at least 4 hours before it is needed; it can stay on for up to 3 days",
    explanation: "Scopolamine is applied as one patch to the hairless area behind the ear at least 4 hours before effect is needed and is worn for up to 3 days.",
    objective: .dosing,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "patch-counseling"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_029",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Metoclopramide can help nausea related to impaired gastric emptying, but its duration matters. Which high-yield restriction should students remember?",
    options: ["Avoid treatment longer than 12 weeks except in rare situations", "Take it only once monthly because of liver toxicity", "Never use it with food because absorption fails", "Use it only by patch for long-term therapy", "It must always be combined with a 5-HT3 antagonist"],
    answer: "Avoid treatment longer than 12 weeks except in rare situations",
    explanation: "Metoclopramide should generally be avoided beyond 12 weeks because longer exposure raises the risk of tardive dyskinesia.",
    objective: .dosing,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "duration"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_030",
    subsectionId: "8b",
    difficulty: .medium,
    question: "A patient develops lip smacking and involuntary tongue movements after prolonged antiemetic therapy. Which drug from this subsection carries the boxed warning most associated with that problem?",
    options: ["Metoclopramide", "Ondansetron", "Scopolamine", "Aprepitant", "Promethazine"],
    answer: "Metoclopramide",
    explanation: "Metoclopramide carries a boxed warning for tardive dyskinesia, especially with longer duration and higher cumulative exposure.",
    objective: .adverseEffect,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "black-box"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_031",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which antiemetic is contraindicated in children younger than 2 years because of potentially fatal respiratory depression?",
    options: ["Promethazine", "Ondansetron", "Metoclopramide", "Aprepitant", "Scopolamine"],
    answer: "Promethazine",
    explanation: "Promethazine is contraindicated in pediatric patients younger than 2 years because of the risk of fatal respiratory depression.",
    objective: .contraindication,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "pediatrics"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_032",
    subsectionId: "8b",
    difficulty: .medium,
    question: "An antiemetic injection is notorious because extravasation or unintended arterial exposure can cause severe tissue injury and even gangrene. Which drug is this?",
    options: ["Promethazine", "Ondansetron", "Aprepitant", "Metoclopramide", "Scopolamine"],
    answer: "Promethazine",
    explanation: "Promethazine injection can cause severe tissue injury, including necrosis and gangrene, especially when given incorrectly or when extravasation occurs.",
    objective: .adverseEffect,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "tissue-injury"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_033",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which antiemetic is most classically tied to headache, constipation, and QT prolongation rather than anticholinergic dryness or a tardive dyskinesia boxed warning?",
    options: ["Ondansetron", "Scopolamine", "Promethazine", "Metoclopramide", "Aprepitant"],
    answer: "Ondansetron",
    explanation: "Ondansetron is well known for headache, constipation, and QT prolongation risk.",
    objective: .adverseEffect,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "QT"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_034",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which antiemetic most strongly points toward dry mouth, blurred vision, urinary retention, and anticholinergic confusion as high-yield side effects?",
    options: ["Scopolamine", "Ondansetron", "Metoclopramide", "Aprepitant", "Promethazine"],
    answer: "Scopolamine",
    explanation: "Scopolamine is an anticholinergic drug, so its side effects fit the classic anticholinergic pattern.",
    objective: .adverseEffect,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "anticholinergic"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_035",
    subsectionId: "8b",
    difficulty: .hard,
    question: "A patient with Parkinson disease on carbidopa/levodopa needs nausea treatment. Which option should raise the most concern for worsening parkinsonian symptoms because of dopamine blockade?",
    options: ["Metoclopramide", "Ondansetron", "Aprepitant", "Scopolamine", "Promethazine"],
    answer: "Metoclopramide",
    explanation: "Metoclopramide can worsen parkinsonian symptoms because it blocks dopamine receptors.",
    objective: .contraindication,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "parkinson"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_036",
    subsectionId: "8b",
    difficulty: .hard,
    question: "A patient taking sertraline asks which antiemetic from this list has a labeled serotonin-syndrome warning when combined with other serotonergic drugs. Which one is it?",
    options: ["Ondansetron", "Scopolamine", "Promethazine", "Aprepitant", "Metoclopramide"],
    answer: "Ondansetron",
    explanation: "Ondansetron carries a serotonin-syndrome warning when used with other serotonergic drugs such as SSRIs and SNRIs.",
    objective: .interaction,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "serotonin-syndrome"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_037",
    subsectionId: "8b",
    difficulty: .medium,
    question: "Which antiemetic is especially associated with hiccups and fatigue and is usually reserved for higher-emetic-risk settings rather than routine stomach-virus nausea?",
    options: ["Aprepitant", "Ondansetron", "Promethazine", "Scopolamine", "Metoclopramide"],
    answer: "Aprepitant",
    explanation: "Aprepitant is used in higher-risk antiemetic regimens, and fatigue and hiccups are classic pearls associated with it.",
    objective: .adverseEffect,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "adverse-effects"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_038",
    subsectionId: "8b",
    difficulty: .hard,
    question: "If promethazine must be given parenterally, what route is preferred because intravenous use carries hazard and subcutaneous administration is contraindicated?",
    options: ["Deep intramuscular injection", "Subcutaneous injection", "Intra-arterial injection", "Transdermal application", "Rectal insertion"],
    answer: "Deep intramuscular injection",
    explanation: "Because of the risk of severe tissue injury with promethazine injection, the preferred parenteral route is deep intramuscular injection, and subcutaneous use is contraindicated.",
    objective: .pearl,
    relatedDrugIds: ["d137"],
    tags: ["8b", "promethazine", "administration"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_039",
    subsectionId: "8b",
    difficulty: .hard,
    question: "A young adult takes a hormonal contraceptive and is prescribed aprepitant for chemotherapy-associated nausea prevention. Which counseling point is most important?",
    options: ["Use effective backup or alternative contraception during treatment and for 28 days after the last dose", "Double the contraceptive dose while taking aprepitant", "Stop all contraception permanently because aprepitant causes infertility", "There is no relevant interaction with hormonal contraception", "Only the morning-after pill is affected; routine contraception is not"],
    answer: "Use effective backup or alternative contraception during treatment and for 28 days after the last dose",
    explanation: "Aprepitant can reduce the effectiveness of hormonal contraceptives, so backup or alternative contraception is recommended during therapy and for 28 days after the last dose.",
    objective: .interaction,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "contraception"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_040",
    subsectionId: "8b",
    difficulty: .hard,
    question: "A patient on warfarin receives aprepitant as part of antiemetic prophylaxis. Which monitoring pearl is highest yield?",
    options: ["Check INR because it can decrease", "Check digoxin level because it always rises", "Check thyroid-stimulating hormone because it often falls", "Check lithium level because it predictably spikes", "Check amylase because pancreatitis is the main concern"],
    answer: "Check INR because it can decrease",
    explanation: "Aprepitant can lower INR in patients taking warfarin, so INR monitoring is an important pearl.",
    objective: .monitoring,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "warfarin"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_041",
    subsectionId: "8b",
    difficulty: .hard,
    question: "Which antiemetic is contraindicated with pimozide because CYP3A4 inhibition can raise pimozide levels and provoke serious or life-threatening reactions?",
    options: ["Aprepitant", "Ondansetron", "Metoclopramide", "Promethazine", "Scopolamine"],
    answer: "Aprepitant",
    explanation: "Aprepitant is contraindicated with pimozide because it can raise pimozide exposure through CYP3A4 effects.",
    objective: .contraindication,
    relatedDrugIds: ["d140"],
    tags: ["8b", "aprepitant", "pimozide"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_042",
    subsectionId: "8b",
    difficulty: .hard,
    question: "Which antiemetic is specifically contraindicated with apomorphine because the combination has caused profound hypotension and loss of consciousness?",
    options: ["Ondansetron", "Promethazine", "Scopolamine", "Aprepitant", "Metoclopramide"],
    answer: "Ondansetron",
    explanation: "Ondansetron is contraindicated with apomorphine because the combination can cause profound hypotension and loss of consciousness.",
    objective: .contraindication,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "apomorphine"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_043",
    subsectionId: "8b",
    difficulty: .hard,
    question: "When stimulation of gastrointestinal motility could be dangerous, such as bowel obstruction, bleeding, or perforation, which antiemetic/prokinetic should be avoided?",
    options: ["Metoclopramide", "Ondansetron", "Scopolamine", "Aprepitant", "Promethazine"],
    answer: "Metoclopramide",
    explanation: "Metoclopramide should be avoided when increasing GI motility could worsen the patient’s condition, such as in obstruction, hemorrhage, or perforation.",
    objective: .contraindication,
    relatedDrugIds: ["d138"],
    tags: ["8b", "metoclopramide", "obstruction"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_044",
    subsectionId: "8b",
    difficulty: .hard,
    question: "Which antiemetic patch is contraindicated in angle-closure glaucoma because its mydriatic anticholinergic effects can raise intraocular pressure?",
    options: ["Scopolamine", "Ondansetron", "Promethazine", "Aprepitant", "Metoclopramide"],
    answer: "Scopolamine",
    explanation: "Scopolamine is contraindicated in angle-closure glaucoma because its anticholinergic effects can precipitate an acute rise in intraocular pressure.",
    objective: .contraindication,
    relatedDrugIds: ["d139"],
    tags: ["8b", "scopolamine", "glaucoma"],
    source: .curated
),

.multipleChoice(
    id: "q8b_add_045",
    subsectionId: "8b",
    difficulty: .hard,
    question: "A patient with hypokalemia, bradyarrhythmia, and other QT-prolonging medications needs an antiemetic. Which drug from this subsection most strongly raises concern for ECG monitoring because of QT prolongation risk?",
    options: ["Ondansetron", "Scopolamine", "Aprepitant", "Promethazine", "Metoclopramide"],
    answer: "Ondansetron",
    explanation: "Ondansetron can prolong the QT interval, so added caution and ECG monitoring are important in patients with electrolyte abnormalities, bradyarrhythmias, or other QT risks.",
    objective: .monitoring,
    relatedDrugIds: ["d136"],
    tags: ["8b", "ondansetron", "ECG"],
    source: .curated
)

    ]
}