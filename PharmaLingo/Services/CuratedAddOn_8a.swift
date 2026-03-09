// PharmaLingo — Module 8a (Acid Suppression)
// Curated Add-On Question Pack (45 questions)
// IDs: q8a_add_001 ... q8a_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 8a exists, then append:
//
//    if bank["8a"] == nil { bank["8a"] = [] }
//    bank["8a"]?.append(contentsOf: Self.curatedAddOnQuestions_8a)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d131 (Esomeprazole / Nexium), d134 (Famotidine / Pepcid),
//   d133 (Lansoprazole / Prevacid), d130 (Omeprazole / Prilosec),
//   d132 (Pantoprazole / Protonix), d135 (Sucralfate / Carafate).
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8a: [Question] = [
.multipleChoice(
    id: "q8a_add_001",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Nexium is a proton pump inhibitor used for GERD and erosive esophagitis, so it belongs in the same \"-prazole\" family as omeprazole and pantoprazole. What is the generic name of Nexium?",
    options: ["Esomeprazole", "Omeprazole", "Lansoprazole", "Pantoprazole", "Famotidine"],
    answer: "Esomeprazole",
    explanation: "Nexium is the brand name for esomeprazole, a proton pump inhibitor (PPI).",
    objective: .brandGeneric,
    relatedDrugIds: ["d131"],
    tags: ["8a", "esomeprazole", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_002",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Esomeprazole is a proton pump inhibitor used to suppress gastric acid and is often taught as the S-enantiomer of omeprazole. Which brand name matches esomeprazole?",
    options: ["Nexium", "Prilosec", "Prevacid", "Protonix", "Pepcid"],
    answer: "Nexium",
    explanation: "Esomeprazole is marketed as Nexium. It is closely related to omeprazole but is not the same generic drug.",
    objective: .genericBrand,
    relatedDrugIds: ["d131"],
    tags: ["8a", "esomeprazole", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_003",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Pepcid is a commonly used H2 blocker for heartburn, peptic ulcer disease, and GERD when a student needs to separate H2 blockers from the more potent PPIs. What is the generic name of Pepcid?",
    options: ["Famotidine", "Sucralfate", "Pantoprazole", "Omeprazole", "Lansoprazole"],
    answer: "Famotidine",
    explanation: "Pepcid is the brand name for famotidine, an H2 receptor antagonist.",
    objective: .brandGeneric,
    relatedDrugIds: ["d134"],
    tags: ["8a", "famotidine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_004",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Famotidine competitively blocks histamine-2 receptors and is often chosen for meal-triggered heartburn or nighttime acid symptoms. Which brand name matches famotidine?",
    options: ["Pepcid", "Carafate", "Nexium", "Prilosec", "Protonix"],
    answer: "Pepcid",
    explanation: "Famotidine is sold as Pepcid. It is an H2 blocker, not a PPI.",
    objective: .genericBrand,
    relatedDrugIds: ["d134"],
    tags: ["8a", "famotidine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_005",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Prevacid is a proton pump inhibitor used for GERD and peptic ulcer disease, and students often remember that this one also has an orally disintegrating formulation. What is the generic name of Prevacid?",
    options: ["Lansoprazole", "Omeprazole", "Esomeprazole", "Pantoprazole", "Famotidine"],
    answer: "Lansoprazole",
    explanation: "Prevacid is the brand name for lansoprazole, a proton pump inhibitor.",
    objective: .brandGeneric,
    relatedDrugIds: ["d133"],
    tags: ["8a", "lansoprazole", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_006",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Lansoprazole is a proton pump inhibitor from the \"-prazole\" family that is used for GERD and ulcer disease and is notable for a SoluTab formulation. Which brand name matches lansoprazole?",
    options: ["Prevacid", "Prilosec", "Nexium", "Pepcid", "Carafate"],
    answer: "Prevacid",
    explanation: "Lansoprazole is marketed as Prevacid. The Prevacid SoluTab pearl is a classic differentiator.",
    objective: .genericBrand,
    relatedDrugIds: ["d133"],
    tags: ["8a", "lansoprazole", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_007",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Prilosec is a proton pump inhibitor that students should connect with GERD, peptic ulcer disease, and H. pylori regimens. What is the generic name of Prilosec?",
    options: ["Omeprazole", "Esomeprazole", "Pantoprazole", "Famotidine", "Sucralfate"],
    answer: "Omeprazole",
    explanation: "Prilosec is the brand name for omeprazole, one of the classic PPIs.",
    objective: .brandGeneric,
    relatedDrugIds: ["d130"],
    tags: ["8a", "omeprazole", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_008",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Omeprazole is a proton pump inhibitor commonly used before meals for GERD and ulcer disease, and it is especially high yield because of its interaction with clopidogrel. Which brand name matches omeprazole?",
    options: ["Prilosec", "Nexium", "Prevacid", "Protonix", "Pepcid"],
    answer: "Prilosec",
    explanation: "Omeprazole is marketed as Prilosec. It is a PPI and a classic teaching drug for CYP2C19-related interaction questions.",
    objective: .genericBrand,
    relatedDrugIds: ["d130"],
    tags: ["8a", "omeprazole", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_009",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Protonix is a proton pump inhibitor often recognized in hospital practice and in acid-suppression questions involving patients who also take clopidogrel. What is the generic name of Protonix?",
    options: ["Pantoprazole", "Omeprazole", "Esomeprazole", "Famotidine", "Sucralfate"],
    answer: "Pantoprazole",
    explanation: "Protonix is the brand name for pantoprazole, a PPI commonly used for GERD and inpatient acid suppression.",
    objective: .brandGeneric,
    relatedDrugIds: ["d132"],
    tags: ["8a", "pantoprazole", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_010",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Pantoprazole is a proton pump inhibitor that students often remember as the PPI with less clopidogrel concern than omeprazole or esomeprazole. Which brand name matches pantoprazole?",
    options: ["Protonix", "Prilosec", "Nexium", "Pepcid", "Carafate"],
    answer: "Protonix",
    explanation: "Pantoprazole is sold as Protonix. It is still a PPI, but its clopidogrel interaction profile is different from omeprazole and esomeprazole.",
    objective: .genericBrand,
    relatedDrugIds: ["d132"],
    tags: ["8a", "pantoprazole", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_011",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Carafate is not a proton pump inhibitor or H2 blocker. Instead, it is used for duodenal ulcer healing by coating the ulcer surface. What is the generic name of Carafate?",
    options: ["Sucralfate", "Famotidine", "Pantoprazole", "Omeprazole", "Lansoprazole"],
    answer: "Sucralfate",
    explanation: "Carafate is the brand name for sucralfate, a mucosal protectant with primarily local action.",
    objective: .brandGeneric,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_012",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Sucralfate is a mucosal protectant that forms a protective barrier over an ulcer and is taken on an empty stomach rather than simply lowering acid production. Which brand name matches sucralfate?",
    options: ["Carafate", "Pepcid", "Nexium", "Prilosec", "Protonix"],
    answer: "Carafate",
    explanation: "Sucralfate is marketed as Carafate. It is a mucosal protectant, not a PPI or H2 blocker.",
    objective: .genericBrand,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_013",
    subsectionId: "8a",
    difficulty: .easy,
    question: "A patient wants an acid reducer for heartburn, but the prescriber chooses a histamine-2 receptor antagonist instead of a proton pump inhibitor. Which drug from this subsection fits that class?",
    options: ["Famotidine", "Omeprazole", "Pantoprazole", "Esomeprazole", "Lansoprazole"],
    answer: "Famotidine",
    explanation: "Famotidine is the H2 receptor antagonist in this subsection. The others listed are PPIs.",
    objective: .classId,
    relatedDrugIds: ["d134"],
    tags: ["8a", "famotidine", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_014",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Not every acid-related drug works by decreasing gastric acid secretion. Which option is the mucosal protectant that physically coats the ulcer surface instead?",
    options: ["Sucralfate", "Famotidine", "Omeprazole", "Pantoprazole", "Esomeprazole"],
    answer: "Sucralfate",
    explanation: "Sucralfate is a mucosal protectant with local barrier action rather than pump or receptor blockade.",
    objective: .classId,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_015",
    subsectionId: "8a",
    difficulty: .easy,
    question: "A drug stem ending in \"-prazole\" should immediately make a medical student think of which acid-suppression class?",
    options: ["Proton Pump Inhibitor", "H2 Receptor Antagonist", "Mucosal Protectant", "Antiemetic", "Antispasmodic"],
    answer: "Proton Pump Inhibitor",
    explanation: "The \"-prazole\" suffix points to the proton pump inhibitor class.",
    objective: .suffixId,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "suffix"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_016",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient taking clopidogrel needs a proton pump inhibitor for significant acid suppression. Which option from this subsection is usually favored over omeprazole or esomeprazole because it has less clinically important effect on clopidogrel activity?",
    options: ["Pantoprazole", "Omeprazole", "Esomeprazole", "Lansoprazole", "Sucralfate"],
    answer: "Pantoprazole",
    explanation: "Pantoprazole is the usual PPI answer in clopidogrel stems because approved doses do not have a clinically important effect on clopidogrel, unlike omeprazole and esomeprazole.",
    objective: .indication,
    relatedDrugIds: ["d132", "d130", "d131"],
    tags: ["8a", "pantoprazole", "clopidogrel", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_017",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A question stem mentions acid suppression as part of combination therapy to eradicate H. pylori and reduce the risk of duodenal ulcer recurrence. Which drug from this subsection most classically fits that role?",
    options: ["Omeprazole", "Famotidine", "Sucralfate", "Pantoprazole", "Lansoprazole"],
    answer: "Omeprazole",
    explanation: "Omeprazole is the classic PPI from this subsection associated with H. pylori regimens and duodenal-ulcer recurrence reduction.",
    objective: .indication,
    relatedDrugIds: ["d130"],
    tags: ["8a", "omeprazole", "h pylori", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_018",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient has an active duodenal ulcer and the goal is to coat the ulcer surface locally rather than rely only on receptor or pump inhibition. Which drug best matches that teaching stem?",
    options: ["Sucralfate", "Famotidine", "Pantoprazole", "Esomeprazole", "Lansoprazole"],
    answer: "Sucralfate",
    explanation: "Sucralfate is indicated for short-term treatment of active duodenal ulcer and works by local mucosal protection.",
    objective: .indication,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "duodenal ulcer", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_019",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient wants an acid reducer that can relieve or prevent meal-triggered heartburn and does not specifically need the strongest long-term acid suppression that PPIs provide. Which option fits best?",
    options: ["Famotidine", "Omeprazole", "Pantoprazole", "Esomeprazole", "Sucralfate"],
    answer: "Famotidine",
    explanation: "Famotidine is the H2 blocker in this subsection and is commonly used for heartburn relief or prevention.",
    objective: .indication,
    relatedDrugIds: ["d134"],
    tags: ["8a", "famotidine", "heartburn", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_020",
    subsectionId: "8a",
    difficulty: .medium,
    question: "In hospital-style questions, Protonix often appears as the inpatient acid-suppression option for GERD or stress-ulcer prophylaxis situations. Which generic drug is being described?",
    options: ["Pantoprazole", "Omeprazole", "Famotidine", "Sucralfate", "Lansoprazole"],
    answer: "Pantoprazole",
    explanation: "Protonix is pantoprazole. In many inpatient stems, pantoprazole is the proton-pump inhibitor that appears in hospital acid-suppression workflows.",
    objective: .indication,
    relatedDrugIds: ["d132"],
    tags: ["8a", "pantoprazole", "stress ulcer", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_021",
    subsectionId: "8a",
    difficulty: .medium,
    question: "The PPIs in this subsection all produce powerful acid suppression by targeting the final common pathway of acid secretion. Which mechanism best describes omeprazole, esomeprazole, lansoprazole, and pantoprazole?",
    options: ["Irreversible inhibition of the gastric H+/K+-ATPase proton pump", "Competitive blockade of histamine-2 receptors", "Formation of a local protective barrier over ulcers", "Direct neutralization of acid already in the lumen", "Muscarinic receptor blockade in the gut"],
    answer: "Irreversible inhibition of the gastric H+/K+-ATPase proton pump",
    explanation: "PPIs work by irreversibly inhibiting the gastric proton pump, which is why they are more potent acid suppressors than H2 blockers.",
    objective: .moa,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_022",
    subsectionId: "8a",
    difficulty: .medium,
    question: "Famotidine lowers gastric acid production, but it does not inhibit the proton pump itself. What is famotidine's mechanism of action?",
    options: ["Competitive inhibition of histamine-2 receptors on gastric parietal cells", "Irreversible inhibition of the H+/K+-ATPase proton pump", "Coating of the ulcer base with a protective barrier", "Direct activation of prostaglandin receptors", "Dopamine receptor blockade with prokinetic activity"],
    answer: "Competitive inhibition of histamine-2 receptors on gastric parietal cells",
    explanation: "Famotidine is an H2 receptor antagonist. It reduces gastric secretion by blocking histamine-2 receptors, not the proton pump.",
    objective: .moa,
    relatedDrugIds: ["d134"],
    tags: ["8a", "famotidine", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_023",
    subsectionId: "8a",
    difficulty: .medium,
    question: "Sucralfate is easy to confuse with acid reducers, but its key teaching point is that it acts mostly at the ulcer surface rather than systemically. Which mechanism best matches sucralfate?",
    options: ["Local formation of a protective barrier over an ulcer with minimal systemic absorption", "Competitive H2 receptor blockade", "Irreversible proton-pump inhibition", "Direct bicarbonate release from the pancreas", "Neutralization of acid by magnesium and aluminum salts"],
    answer: "Local formation of a protective barrier over an ulcer with minimal systemic absorption",
    explanation: "Sucralfate works locally by forming a protective barrier over the ulcer surface and is only minimally absorbed.",
    objective: .moa,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_024",
    subsectionId: "8a",
    difficulty: .medium,
    question: "One classic pharmacology pearl helps students separate Nexium from Prilosec. Which statement about esomeprazole is accurate?",
    options: ["It is the S-enantiomer of omeprazole", "It is the active metabolite of famotidine", "It is the IV-only form of pantoprazole", "It is a mucosal protectant, not a PPI", "It is the generic name for Protonix"],
    answer: "It is the S-enantiomer of omeprazole",
    explanation: "Esomeprazole is the S-enantiomer of omeprazole, which is a classic brand/generic/pharmacology pearl.",
    objective: .pearl,
    relatedDrugIds: ["d131", "d130"],
    tags: ["8a", "esomeprazole", "omeprazole", "pearl"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_025",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient is starting omeprazole for GERD. Which administration instruction is most appropriate for classic PPI counseling?",
    options: ["Take it before a meal, often before the first meal of the day", "Take it only after meals to maximize absorption", "Use it only as needed at bedtime for instant relief", "Chew the delayed-release capsule contents for faster effect", "Take it with clopidogrel to simplify the regimen"],
    answer: "Take it before a meal, often before the first meal of the day",
    explanation: "Omeprazole is typically taken before meals. This is a high-yield counseling point for PPI stems.",
    objective: .dosing,
    relatedDrugIds: ["d130"],
    tags: ["8a", "omeprazole", "before meals", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_026",
    subsectionId: "8a",
    difficulty: .medium,
    question: "Esomeprazole delayed-release capsules are most appropriately taken using which timing instruction?",
    options: ["At least 1 hour before a meal", "At bedtime only after a large meal", "Only when symptoms begin", "Immediately after antacids", "With rilpivirine to improve absorption"],
    answer: "At least 1 hour before a meal",
    explanation: "Esomeprazole delayed-release capsules should be taken at least 1 hour before meals.",
    objective: .dosing,
    relatedDrugIds: ["d131"],
    tags: ["8a", "esomeprazole", "before meals", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_027",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A student is trying to remember which PPI has a well-known orally disintegrating formulation that helps separate it from omeprazole and pantoprazole. Which drug fits that pearl?",
    options: ["Lansoprazole", "Famotidine", "Sucralfate", "Pantoprazole", "Esomeprazole"],
    answer: "Lansoprazole",
    explanation: "Lansoprazole is associated with the Prevacid SoluTab orally disintegrating formulation.",
    objective: .pearl,
    relatedDrugIds: ["d133"],
    tags: ["8a", "lansoprazole", "solutab", "pearl"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_028",
    subsectionId: "8a",
    difficulty: .medium,
    question: "Carafate is most effective when it can coat the ulcer surface without competing with a recent meal. How should sucralfate usually be taken?",
    options: ["On an empty stomach", "Only with high-fat meals", "Crushed into dairy products", "Only with antacids", "At the same time as other oral medications"],
    answer: "On an empty stomach",
    explanation: "Sucralfate should be administered on an empty stomach so it can coat the ulcer surface effectively.",
    objective: .dosing,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "empty stomach", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_029",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A resident wants a PPI tablet that the label allows to be swallowed whole with or without food, making it a little different from the classic before-breakfast counseling used for some other PPIs. Which drug fits best?",
    options: ["Pantoprazole", "Omeprazole", "Esomeprazole", "Lansoprazole", "Sucralfate"],
    answer: "Pantoprazole",
    explanation: "Pantoprazole delayed-release tablets may be swallowed whole with or without food, which is a useful differentiating pearl.",
    objective: .dosing,
    relatedDrugIds: ["d132"],
    tags: ["8a", "pantoprazole", "dosing", "food"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_030",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient on sucralfate asks whether antacids can be taken at the same moment for extra symptom relief. Which counseling point is most accurate?",
    options: ["Avoid taking antacids within 30 minutes before or after sucralfate", "Antacids must be taken at the same time to activate sucralfate", "Antacids are absolutely contraindicated with sucralfate", "Sucralfate only works if it is dissolved in antacid first", "Antacids should replace sucralfate after the first dose"],
    answer: "Avoid taking antacids within 30 minutes before or after sucralfate",
    explanation: "Antacids can be used if needed, but they should not be taken within 30 minutes before or after sucralfate.",
    objective: .interaction,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "antacid", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_031",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient has been on long-term proton pump inhibitor therapy and now develops an electrolyte abnormality that can present with cramps, arrhythmias, or seizures in severe cases. Which abnormality is most associated with prolonged PPI use?",
    options: ["Hypomagnesemia", "Hypercalcemia", "Hypernatremia", "Hyperphosphatemia", "Polycythemia"],
    answer: "Hypomagnesemia",
    explanation: "Long-term PPI therapy is associated with hypomagnesemia, which is a classic monitoring pearl.",
    objective: .adverseEffect,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "hypomagnesemia", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_032",
    subsectionId: "8a",
    difficulty: .medium,
    question: "When teaching the long-term safety profile of PPIs, which skeletal risk should be on the student's radar, especially with prolonged or high-dose therapy?",
    options: ["Osteoporosis-related fractures", "Avascular necrosis of the femoral head", "Acute gout flares", "Hyperostosis of the spine", "Bone marrow suppression"],
    answer: "Osteoporosis-related fractures",
    explanation: "Long-term or multiple-daily-dose PPI therapy has been associated with an increased risk of osteoporosis-related fractures.",
    objective: .adverseEffect,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "fracture", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_033",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A board-style stem mentions a patient on chronic PPI therapy whose endoscopy incidentally shows a class-associated gastric finding that becomes more likely after long-term use beyond a year. What finding fits best?",
    options: ["Fundic gland polyps", "Esophageal varices", "Mallory-Weiss tears", "Pseudomembranous plaques", "Achalasia"],
    answer: "Fundic gland polyps",
    explanation: "PPI labeling notes an increased risk of fundic gland polyps with long-term use, especially beyond one year.",
    objective: .adverseEffect,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "fundic gland polyps", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_034",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A hospitalized patient develops significant diarrhea after prolonged strong acid suppression, and the team reviews a class warning linked to reduced gastric acidity. Which adverse-effect association is most classic for PPIs?",
    options: ["Clostridioides difficile-associated diarrhea", "Pancreatitis from pancreatic enzyme depletion", "Pulmonary fibrosis", "Ototoxicity", "Tardive dyskinesia"],
    answer: "Clostridioides difficile-associated diarrhea",
    explanation: "PPI labeling warns about Clostridioides difficile-associated diarrhea as a serious adverse reaction.",
    objective: .adverseEffect,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "c diff", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_035",
    subsectionId: "8a",
    difficulty: .easy,
    question: "Carafate is often tolerated reasonably well, but one very classic side effect appears over and over in teaching questions. Which side effect is most associated with sucralfate?",
    options: ["Constipation", "Severe diarrhea", "QT prolongation", "Dry cough", "Bronchospasm"],
    answer: "Constipation",
    explanation: "Constipation is the classic side effect associated with sucralfate.",
    objective: .adverseEffect,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "constipation", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_036",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient with moderate to severe renal impairment is prescribed famotidine. What is the most important medication-management principle for this H2 blocker?",
    options: ["Dose adjustment is often needed because famotidine clearance falls in renal impairment", "Dose escalation is required because famotidine is dialyzed too quickly", "No change is ever needed because famotidine is hepatically cleared", "The drug should only be given intravenously in renal disease", "Famotidine must be taken with sucralfate to avoid toxicity"],
    answer: "Dose adjustment is often needed because famotidine clearance falls in renal impairment",
    explanation: "Famotidine is cleared substantially by the kidneys, so moderate to severe renal impairment often requires dosage adjustment.",
    objective: .monitoring,
    relatedDrugIds: ["d134"],
    tags: ["8a", "famotidine", "renal adjustment", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_037",
    subsectionId: "8a",
    difficulty: .hard,
    question: "Why is renal dosing of famotidine more than just a bookkeeping issue in moderate to severe renal impairment?",
    options: ["Accumulation can increase CNS adverse reactions and prolonged QT risk", "Accumulation causes irreversible bone marrow aplasia", "It rapidly triggers serotonin syndrome", "It reliably causes pancreatitis", "It blocks vitamin K recycling"],
    answer: "Accumulation can increase CNS adverse reactions and prolonged QT risk",
    explanation: "In moderate to severe renal impairment, famotidine accumulation increases the risk of CNS adverse reactions and prolonged QT.",
    objective: .monitoring,
    relatedDrugIds: ["d134"],
    tags: ["8a", "famotidine", "renal impairment", "qt", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_038",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient has been taking a PPI long term and also uses a diuretic. Which monitoring idea is especially reasonable because of a known class warning?",
    options: ["Check magnesium periodically", "Check INR weekly because all PPIs raise warfarin levels the same way", "Check ANC monthly", "Check amylase before each refill", "Check peak and trough serum levels of the PPI"],
    answer: "Check magnesium periodically",
    explanation: "For prolonged PPI therapy, especially with drugs like diuretics or digoxin, magnesium monitoring is a reasonable high-yield safety pearl.",
    objective: .monitoring,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "magnesium", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_039",
    subsectionId: "8a",
    difficulty: .medium,
    question: "A patient has been on long-term acid suppression with a proton pump inhibitor and now develops a deficiency that can contribute to neuropathy or macrocytic anemia over time. Which deficiency is classically associated with prolonged PPI use?",
    options: ["Vitamin B12 deficiency", "Vitamin C deficiency", "Iron overload", "Copper excess", "Folate excess"],
    answer: "Vitamin B12 deficiency",
    explanation: "Long-term PPI therapy can contribute to vitamin B12 deficiency, which is a classic chronic-use pearl.",
    objective: .adverseEffect,
    relatedDrugIds: ["d130", "d131", "d133", "d132"],
    tags: ["8a", "ppi", "vitamin b12", "adverse effect"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_040",
    subsectionId: "8a",
    difficulty: .hard,
    question: "A patient with coronary stent placement takes clopidogrel and is started on a PPI. Which option should most strongly raise concern because it can reduce clopidogrel activation through CYP2C19 inhibition?",
    options: ["Omeprazole", "Pantoprazole", "Famotidine", "Sucralfate", "Lansoprazole"],
    answer: "Omeprazole",
    explanation: "Omeprazole can reduce clopidogrel activation through CYP2C19 inhibition and should generally be avoided with clopidogrel.",
    objective: .interaction,
    relatedDrugIds: ["d130"],
    tags: ["8a", "omeprazole", "clopidogrel", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_041",
    subsectionId: "8a",
    difficulty: .hard,
    question: "A similar interaction warning applies to another PPI in this subsection. Which drug also has official labeling advising avoidance with clopidogrel because it can lower clopidogrel's antiplatelet activity?",
    options: ["Esomeprazole", "Pantoprazole", "Famotidine", "Sucralfate", "Lansoprazole"],
    answer: "Esomeprazole",
    explanation: "Esomeprazole, like omeprazole, can reduce clopidogrel activity and should generally be avoided in that pairing.",
    objective: .interaction,
    relatedDrugIds: ["d131"],
    tags: ["8a", "esomeprazole", "clopidogrel", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_042",
    subsectionId: "8a",
    difficulty: .hard,
    question: "A prescriber wants to continue clopidogrel and still use a PPI. Which statement best matches the official teaching pearl for pantoprazole?",
    options: ["Approved doses of pantoprazole do not require clopidogrel dose adjustment", "Pantoprazole is absolutely contraindicated with clopidogrel", "Pantoprazole increases clopidogrel activity and causes major bleeding", "Pantoprazole must be separated from clopidogrel by 12 hours", "Pantoprazole works only if clopidogrel is discontinued"],
    answer: "Approved doses of pantoprazole do not require clopidogrel dose adjustment",
    explanation: "Pantoprazole is the classic PPI answer when clopidogrel must be continued because approved doses do not have a clinically important effect on clopidogrel.",
    objective: .interaction,
    relatedDrugIds: ["d132", "d130", "d131"],
    tags: ["8a", "pantoprazole", "clopidogrel", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_043",
    subsectionId: "8a",
    difficulty: .hard,
    question: "Which group of drugs in this subsection is classically contraindicated with rilpivirine-containing HIV regimens because raising gastric pH can lower rilpivirine exposure?",
    options: ["The proton pump inhibitors", "Only famotidine", "Only sucralfate", "Only pantoprazole tablets, but not other PPIs", "No acid-suppression therapy has this issue"],
    answer: "The proton pump inhibitors",
    explanation: "PPIs as a class are contraindicated with rilpivirine-containing products because they can reduce rilpivirine exposure.",
    objective: .contraindication,
    relatedDrugIds: ["d131", "d133", "d130", "d132"],
    tags: ["8a", "ppi", "rilpivirine", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_044",
    subsectionId: "8a",
    difficulty: .hard,
    question: "Sucralfate can quietly interfere with other medications not by metabolism, but by reducing their absorption in the GI tract. Which interaction pearl is most accurate?",
    options: ["It can reduce absorption of drugs like fluoroquinolones, levothyroxine, tetracyclines, digoxin, and phenytoin when taken together", "It strongly inhibits CYP2C19 and lowers clopidogrel activity", "It is contraindicated with all PPIs because of serotonin syndrome", "It induces warfarin metabolism through CYP3A4", "It should always be mixed with magnesium-containing antacids to improve absorption"],
    answer: "It can reduce absorption of drugs like fluoroquinolones, levothyroxine, tetracyclines, digoxin, and phenytoin when taken together",
    explanation: "Sucralfate can bind or interfere with absorption of several oral medications, so spacing is an important counseling point.",
    objective: .interaction,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "absorption", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q8a_add_045",
    subsectionId: "8a",
    difficulty: .hard,
    question: "A dialysis patient has ulcer symptoms and someone suggests sucralfate because it acts locally. Which caution makes that answer less straightforward in significant renal impairment?",
    options: ["Aluminum can accumulate and cause toxicity in patients with chronic renal failure", "Sucralfate is a strong CYP2C19 inhibitor", "Sucralfate is absolutely contraindicated in GERD", "Sucralfate causes major neutropenia in kidney disease", "Sucralfate has a boxed warning for torsades de pointes"],
    answer: "Aluminum can accumulate and cause toxicity in patients with chronic renal failure",
    explanation: "Sucralfate contains aluminum, and aluminum accumulation or toxicity has been described in patients with renal impairment, so caution is needed.",
    objective: .contraindication,
    relatedDrugIds: ["d135"],
    tags: ["8a", "sucralfate", "renal impairment", "aluminum", "contraindication"],
    source: .curated
)
]
}
