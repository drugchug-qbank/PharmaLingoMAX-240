
// PharmaLingo — Module 8c (Laxatives & Antidiarrheals)
// Curated Add-On Question Pack (45 questions)
// IDs: q8c_add_001 ... q8c_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 8c exists, then append:
//
//    if bank["8c"] == nil { bank["8c"] = [] }
//    bank["8c"]?.append(contentsOf: Self.curatedAddOnQuestions_8c)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d143 (Bisacodyl / Dulcolax), d255 (Diphenoxylate/Atropine / Lomotil),
//   d142 (Docusate sodium / Colace), d256 (Lactulose / Kristalose),
//   d257 (Linaclotide / Linzess), d258 (Loperamide / Imodium),
//   d141 (Polyethylene glycol / MiraLAX), d259 (Polyethylene glycol w/ electrolytes / GoLYTELY),
//   d260 (Senna/Docusate / Senokot-S).
//
// Generated on: 2026-03-09

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8c: [Question] = [
.multipleChoice(
    id: "q8c_add_001",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Dulcolax is a stimulant laxative commonly used for occasional constipation, and students should remember that the oral tablet and rectal suppository have different onset times. What is the generic name of Dulcolax?",
    options: ["Bisacodyl", "Docusate sodium", "Lactulose", "Loperamide", "Linaclotide"],
    answer: "Bisacodyl",
    explanation: "Dulcolax is the brand name for bisacodyl, a stimulant laxative used for occasional constipation and sometimes bowel prep.",
    objective: .brandGeneric,
    relatedDrugIds: ["d143"],
    tags: ["8c", "bisacodyl", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_002",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Bisacodyl is the stimulant laxative from this subsection that speeds bowel movement rather than softening stool or drawing water into the lumen. Which brand name matches bisacodyl?",
    options: ["Dulcolax", "Colace", "Linzess", "Imodium", "MiraLAX"],
    answer: "Dulcolax",
    explanation: "Bisacodyl is marketed as Dulcolax.",
    objective: .genericBrand,
    relatedDrugIds: ["d143"],
    tags: ["8c", "bisacodyl", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_003",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Lomotil is an antidiarrheal that combines an opioid-like agent with atropine, and the atropine is mainly there to discourage intentional misuse. What is the generic name of Lomotil?",
    options: ["Diphenoxylate/Atropine", "Loperamide", "Lactulose", "Bisacodyl", "Linaclotide"],
    answer: "Diphenoxylate/Atropine",
    explanation: "Lomotil is the brand name for diphenoxylate/atropine.",
    objective: .brandGeneric,
    relatedDrugIds: ["d255"],
    tags: ["8c", "diphenoxylate-atropine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_004",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Diphenoxylate/atropine is the prescription antidiarrheal from this subsection that should be paired with fluid and electrolyte replacement rather than used as a stand-alone rescue. Which brand name matches diphenoxylate/atropine?",
    options: ["Lomotil", "Imodium", "Colace", "GoLYTELY", "Senokot-S"],
    answer: "Lomotil",
    explanation: "Diphenoxylate/atropine is sold as Lomotil.",
    objective: .genericBrand,
    relatedDrugIds: ["d255"],
    tags: ["8c", "diphenoxylate-atropine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_005",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Colace is the classic stool softener that students should connect more with prevention and easier stool passage than with rapid bowel evacuation. What is the generic name of Colace?",
    options: ["Docusate sodium", "Bisacodyl", "Polyethylene glycol", "Senna/Docusate", "Lactulose"],
    answer: "Docusate sodium",
    explanation: "Colace is the brand name for docusate sodium, a stool softener.",
    objective: .brandGeneric,
    relatedDrugIds: ["d142"],
    tags: ["8c", "docusate", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_006",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Docusate sodium is the surfactant stool softener in this subsection and is often chosen when straining should be minimized. Which brand name matches docusate sodium?",
    options: ["Colace", "Dulcolax", "Kristalose", "Linzess", "Imodium"],
    answer: "Colace",
    explanation: "Docusate sodium is marketed as Colace.",
    objective: .genericBrand,
    relatedDrugIds: ["d142"],
    tags: ["8c", "docusate", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_007",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Kristalose is an osmotic laxative, but it is also high yield because it is used in hepatic encephalopathy to help lower ammonia. What is the generic name of Kristalose?",
    options: ["Lactulose", "Linaclotide", "Loperamide", "Polyethylene glycol", "Docusate sodium"],
    answer: "Lactulose",
    explanation: "Kristalose is the brand name for lactulose.",
    objective: .brandGeneric,
    relatedDrugIds: ["d256"],
    tags: ["8c", "lactulose", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_008",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Lactulose is the sweet osmotic laxative from this subsection that also appears in hepatic encephalopathy questions because it helps reduce ammonia absorption. Which brand name matches lactulose?",
    options: ["Kristalose", "Linzess", "MiraLAX", "Colace", "Dulcolax"],
    answer: "Kristalose",
    explanation: "Lactulose is sold as Kristalose.",
    objective: .genericBrand,
    relatedDrugIds: ["d256"],
    tags: ["8c", "lactulose", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_009",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Linzess is not a laxative powder or stimulant tablet; it is a guanylate cyclase-C agonist used for constipation-predominant disorders. What is the generic name of Linzess?",
    options: ["Linaclotide", "Lactulose", "Loperamide", "Bisacodyl", "Docusate sodium"],
    answer: "Linaclotide",
    explanation: "Linzess is the brand name for linaclotide.",
    objective: .brandGeneric,
    relatedDrugIds: ["d257"],
    tags: ["8c", "linaclotide", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_010",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Linaclotide is the constipation drug from this subsection that works through GC-C activation and should be taken on an empty stomach before the first meal. Which brand name matches linaclotide?",
    options: ["Linzess", "Kristalose", "MiraLAX", "GoLYTELY", "Imodium"],
    answer: "Linzess",
    explanation: "Linaclotide is marketed as Linzess.",
    objective: .genericBrand,
    relatedDrugIds: ["d257"],
    tags: ["8c", "linaclotide", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_011",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Imodium is the familiar OTC antidiarrheal that slows gut motility and is commonly used for acute diarrhea and travelers’ diarrhea. What is the generic name of Imodium?",
    options: ["Loperamide", "Diphenoxylate/Atropine", "Lactulose", "Linaclotide", "Bisacodyl"],
    answer: "Loperamide",
    explanation: "Imodium is the brand name for loperamide.",
    objective: .brandGeneric,
    relatedDrugIds: ["d258"],
    tags: ["8c", "loperamide", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_012",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Loperamide is the peripheral opioid antidiarrheal in this subsection that is usually safe OTC when taken correctly, but dangerous cardiac effects can occur with misuse or overdose. Which brand name matches loperamide?",
    options: ["Imodium", "Lomotil", "Linzess", "Dulcolax", "GoLYTELY"],
    answer: "Imodium",
    explanation: "Loperamide is sold as Imodium.",
    objective: .genericBrand,
    relatedDrugIds: ["d258"],
    tags: ["8c", "loperamide", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_013",
    subsectionId: "8c",
    difficulty: .easy,
    question: "MiraLAX is the osmotic powder that is mixed into liquid and is commonly used for occasional constipation, often producing a bowel movement in 1 to 3 days. What is the generic name of MiraLAX?",
    options: ["Polyethylene glycol", "Polyethylene glycol w/ electrolytes", "Lactulose", "Docusate sodium", "Linaclotide"],
    answer: "Polyethylene glycol",
    explanation: "MiraLAX is the brand name for polyethylene glycol 3350.",
    objective: .brandGeneric,
    relatedDrugIds: ["d141"],
    tags: ["8c", "polyethylene-glycol", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_014",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Polyethylene glycol is the osmotic laxative powder from this subsection that students often recognize as a first-line OTC-style constipation option rather than a stimulant. Which brand name matches polyethylene glycol?",
    options: ["MiraLAX", "GoLYTELY", "Kristalose", "Colace", "Dulcolax"],
    answer: "MiraLAX",
    explanation: "Polyethylene glycol 3350 is marketed as MiraLAX.",
    objective: .genericBrand,
    relatedDrugIds: ["d141"],
    tags: ["8c", "polyethylene-glycol", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_015",
    subsectionId: "8c",
    difficulty: .easy,
    question: "GoLYTELY is the large-volume polyethylene glycol solution used to clean out the bowel before colonoscopy rather than for everyday constipation relief. What is the generic name of GoLYTELY?",
    options: ["Polyethylene glycol w/ electrolytes", "Polyethylene glycol", "Lactulose", "Linaclotide", "Bisacodyl"],
    answer: "Polyethylene glycol w/ electrolytes",
    explanation: "GoLYTELY is the brand name for polyethylene glycol with electrolytes.",
    objective: .brandGeneric,
    relatedDrugIds: ["d259"],
    tags: ["8c", "peg-electrolytes", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_016",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Polyethylene glycol with electrolytes is a bowel-cleansing preparation rather than a simple OTC laxative powder, and it is high yield for colonoscopy-prep counseling. Which brand name matches this product?",
    options: ["GoLYTELY", "MiraLAX", "Linzess", "Imodium", "Senokot-S"],
    answer: "GoLYTELY",
    explanation: "Polyethylene glycol with electrolytes is sold as GoLYTELY.",
    objective: .genericBrand,
    relatedDrugIds: ["d259"],
    tags: ["8c", "peg-electrolytes", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_017",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Senokot-S combines a stimulant laxative with a stool softener, making it a classic “opioid constipation” teaching drug. What is the generic name of Senokot-S?",
    options: ["Senna/Docusate", "Docusate sodium", "Bisacodyl", "Polyethylene glycol", "Lactulose"],
    answer: "Senna/Docusate",
    explanation: "Senokot-S is the brand name for the senna/docusate combination.",
    objective: .brandGeneric,
    relatedDrugIds: ["d260"],
    tags: ["8c", "senna-docusate", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_018",
    subsectionId: "8c",
    difficulty: .easy,
    question: "Senna/docusate is the combination product from this subsection that adds stimulant activity to stool-softening effects. Which brand name matches senna/docusate?",
    options: ["Senokot-S", "Colace", "Dulcolax", "MiraLAX", "Lomotil"],
    answer: "Senokot-S",
    explanation: "Senna/docusate is marketed as Senokot-S.",
    objective: .genericBrand,
    relatedDrugIds: ["d260"],
    tags: ["8c", "senna-docusate", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_019",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A patient asks for something that stimulates bowel contractions rather than simply softening stool or pulling water into the gut. Which drug from this subsection is the stimulant laxative?",
    options: ["Bisacodyl", "Docusate sodium", "Polyethylene glycol", "Lactulose", "Linaclotide"],
    answer: "Bisacodyl",
    explanation: "Bisacodyl is a stimulant laxative.",
    objective: .classId,
    relatedDrugIds: ["d143"],
    tags: ["8c", "bisacodyl", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_020",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A clinician wants a bowel regimen that softens stool and reduces straining but does not directly stimulate the bowel wall. Which option is the stool softener from this subsection?",
    options: ["Docusate sodium", "Bisacodyl", "Loperamide", "Linaclotide", "Polyethylene glycol w/ electrolytes"],
    answer: "Docusate sodium",
    explanation: "Docusate sodium is the stool softener in this subsection.",
    objective: .classId,
    relatedDrugIds: ["d142"],
    tags: ["8c", "docusate", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_021",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A patient with cirrhosis becomes confused, and the team wants an oral agent that lowers blood ammonia while also acting as a laxative. Which drug from this subsection best fits that role?",
    options: ["Lactulose", "Linaclotide", "Polyethylene glycol", "Bisacodyl", "Loperamide"],
    answer: "Lactulose",
    explanation: "Lactulose is used for constipation and is also high yield for lowering ammonia in hepatic encephalopathy.",
    objective: .indication,
    relatedDrugIds: ["d256"],
    tags: ["8c", "lactulose", "hepatic-encephalopathy"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_022",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Which constipation medication in this subsection works as a guanylate cyclase-C agonist rather than as a stimulant laxative, stool softener, or osmotic powder?",
    options: ["Linaclotide", "Lactulose", "Bisacodyl", "Docusate sodium", "Polyethylene glycol"],
    answer: "Linaclotide",
    explanation: "Linaclotide is a guanylate cyclase-C agonist that acts locally in the intestinal lumen.",
    objective: .moa,
    relatedDrugIds: ["d257"],
    tags: ["8c", "linaclotide", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_023",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Which antidiarrheal in this subsection is an opioid-receptor agonist that acts mainly in the gut and usually does not cross the blood-brain barrier at normal doses?",
    options: ["Loperamide", "Diphenoxylate/Atropine", "Lactulose", "Linaclotide", "Docusate sodium"],
    answer: "Loperamide",
    explanation: "Loperamide is the peripheral opioid antidiarrheal in this subsection.",
    objective: .classId,
    relatedDrugIds: ["d258"],
    tags: ["8c", "loperamide", "class"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_024",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Students often ask why atropine is paired with diphenoxylate in Lomotil. What is the main teaching pearl?",
    options: ["Atropine is added mainly to discourage intentional overuse or abuse", "Atropine is added to make the product work as a stool softener", "Atropine is added to lower ammonia in hepatic encephalopathy", "Atropine is added so the product can be used for bowel prep", "Atropine is added to make the drug safe in young children"],
    answer: "Atropine is added mainly to discourage intentional overuse or abuse",
    explanation: "In diphenoxylate/atropine, the atropine component is primarily an abuse-deterrent pearl.",
    objective: .pearl,
    relatedDrugIds: ["d255"],
    tags: ["8c", "diphenoxylate-atropine", "abuse-deterrent"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_025",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A patient is not being treated for everyday constipation; instead, the goal is to cleanse the bowel before colonoscopy. Which option from this subsection is designed for that job?",
    options: ["Polyethylene glycol w/ electrolytes", "Polyethylene glycol", "Docusate sodium", "Bisacodyl tablet only", "Linaclotide"],
    answer: "Polyethylene glycol w/ electrolytes",
    explanation: "Polyethylene glycol with electrolytes is the bowel-cleansing preparation used before colonoscopy.",
    objective: .indication,
    relatedDrugIds: ["d259"],
    tags: ["8c", "peg-electrolytes", "colonoscopy"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_026",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A patient starting scheduled opioid therapy is given a bowel regimen that combines a stimulant laxative with a stool softener rather than either strategy alone. Which product from this subsection best fits that classic teaching approach?",
    options: ["Senna/Docusate", "Docusate sodium", "Bisacodyl", "Polyethylene glycol", "Lactulose"],
    answer: "Senna/Docusate",
    explanation: "Senna/docusate is a classic stimulant-plus-softener combination commonly used for opioid-associated constipation.",
    objective: .pearl,
    relatedDrugIds: ["d260"],
    tags: ["8c", "senna-docusate", "opioid-constipation"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_027",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Which option is the osmotic powder mixed into a beverage that generally produces a bowel movement in 1 to 3 days and is commonly used for occasional constipation?",
    options: ["Polyethylene glycol", "Polyethylene glycol w/ electrolytes", "Lactulose", "Linaclotide", "Bisacodyl"],
    answer: "Polyethylene glycol",
    explanation: "Polyethylene glycol 3350 is the osmotic laxative powder that typically works in 1 to 3 days.",
    objective: .indication,
    relatedDrugIds: ["d141"],
    tags: ["8c", "polyethylene-glycol", "constipation"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_028",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which counseling point is correct for delayed-release bisacodyl tablets used for occasional constipation?",
    options: ["Do not chew or crush the tablets, and do not take them within 1 hour of milk or an antacid", "Take them with milk to protect the stomach and speed onset", "Crush them before swallowing so the stimulant effect begins sooner", "Use them every day long term as first-line maintenance therapy", "They should be taken only after the watery stool has already started"],
    answer: "Do not chew or crush the tablets, and do not take them within 1 hour of milk or an antacid",
    explanation: "Bisacodyl delayed-release tablets should not be chewed or crushed, and they should not be taken within 1 hour of milk or an antacid.",
    objective: .interaction,
    relatedDrugIds: ["d143"],
    tags: ["8c", "bisacodyl", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_029",
    subsectionId: "8c",
    difficulty: .hard,
    question: "A patient needs relatively fast rectal relief today, not an overnight oral effect. Which statement best distinguishes the two common bisacodyl formulations?",
    options: ["The suppository often works in 15 minutes to 1 hour, whereas the oral tablet commonly works in 6 to 12 hours", "The oral tablet works in 15 minutes to 1 hour, whereas the suppository takes 12 to 24 hours", "Both oral and rectal bisacodyl reliably take 2 to 3 days to work", "Only the oral tablet is approved for constipation; the suppository is not a laxative", "Neither formulation should ever be used for bowel prep"],
    answer: "The suppository often works in 15 minutes to 1 hour, whereas the oral tablet commonly works in 6 to 12 hours",
    explanation: "Bisacodyl suppositories act faster than the oral tablets, making the rectal product the higher-yield “rapid relief” option.",
    objective: .dosing,
    relatedDrugIds: ["d143"],
    tags: ["8c", "bisacodyl", "onset"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_030",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Which warning is most important to remember for docusate sodium when counseling a patient who self-treats constipation?",
    options: ["Do not use it while taking mineral oil unless a clinician says to do so", "Never take it with water because it loses effect", "Always combine it with loperamide to prevent cramping", "It is contraindicated in all patients with hepatic encephalopathy", "It should only be given rectally, not orally"],
    answer: "Do not use it while taking mineral oil unless a clinician says to do so",
    explanation: "Docusate products carry an important warning to avoid use with mineral oil unless directed by a clinician.",
    objective: .interaction,
    relatedDrugIds: ["d142"],
    tags: ["8c", "docusate", "mineral-oil"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_031",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A patient wants immediate constipation relief within a few hours, but the pharmacist recommends against expecting that from docusate. Which teaching point is most accurate?",
    options: ["Docusate is a stool softener that may take 12 to 72 hours and is better for prevention than for rapid evacuation", "Docusate is the fastest laxative in this module and usually works in under 30 minutes", "Docusate is used mainly for acute infectious diarrhea, not constipation", "Docusate is the preferred bowel prep before colonoscopy", "Docusate lowers ammonia in hepatic encephalopathy"],
    answer: "Docusate is a stool softener that may take 12 to 72 hours and is better for prevention than for rapid evacuation",
    explanation: "Docusate is better understood as a stool-softening prevention option than as a rapid “clean-out” agent.",
    objective: .pearl,
    relatedDrugIds: ["d142"],
    tags: ["8c", "docusate", "onset"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_032",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Why does lactulose show up in hepatic encephalopathy questions even though it is also a constipation medication?",
    options: ["It acidifies the colonic contents and helps trap ammonia in the gut, lowering blood ammonia", "It blocks opioid receptors in the bowel to stop diarrhea", "It directly stimulates enteric nerves like a stimulant laxative", "It works as a GC-C agonist that raises cGMP", "It coats stool with a surfactant film without changing ammonia handling"],
    answer: "It acidifies the colonic contents and helps trap ammonia in the gut, lowering blood ammonia",
    explanation: "Lactulose is metabolized by colonic bacteria to acids that help trap ammonia and reduce systemic absorption, which is why it is high yield in hepatic encephalopathy.",
    objective: .moa,
    relatedDrugIds: ["d256"],
    tags: ["8c", "lactulose", "ammonia"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_033",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A patient newly started on lactulose for chronic constipation calls about bloating and gas. Which adverse-effect pattern best matches lactulose?",
    options: ["Bloating, flatulence, and diarrhea", "Severe hypertension and bradycardia", "Dry cough and angioedema", "Tremor and QT prolongation at normal doses", "Oral candidiasis and hoarseness"],
    answer: "Bloating, flatulence, and diarrhea",
    explanation: "Lactulose commonly causes bloating, flatulence, and diarrhea because of its osmotic action and colonic bacterial metabolism.",
    objective: .adverseEffect,
    relatedDrugIds: ["d256"],
    tags: ["8c", "lactulose", "gi-effects"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_034",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which patient-specific issue is a labeled contraindication for lactulose solution or powder?",
    options: ["A required low-galactose diet", "A history of occasional hemorrhoids", "A need for bowel prep before colonoscopy", "Mild lactose intolerance alone", "Taking the medication on an empty stomach"],
    answer: "A required low-galactose diet",
    explanation: "Lactulose products contain galactose and are contraindicated in patients who require a low-galactose diet.",
    objective: .contraindication,
    relatedDrugIds: ["d256"],
    tags: ["8c", "lactulose", "galactose"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_035",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Which counseling point is correct for linaclotide used for IBS-C or chronic idiopathic constipation?",
    options: ["Take it once daily on an empty stomach at least 30 minutes before the first meal", "Take it only at bedtime with a high-fat snack", "Crush the capsule and mix it into warm milk to reduce diarrhea", "Use it only as needed on days when constipation is severe", "Take it immediately after meals to improve absorption"],
    answer: "Take it once daily on an empty stomach at least 30 minutes before the first meal",
    explanation: "Linaclotide should be taken once daily on an empty stomach at least 30 minutes before a meal.",
    objective: .dosing,
    relatedDrugIds: ["d257"],
    tags: ["8c", "linaclotide", "administration"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_036",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which pediatric warning is most important to remember for linaclotide?",
    options: ["It is contraindicated in children younger than 2 years because of the risk of serious dehydration", "It is contraindicated in all patients younger than 18 years because of liver failure", "It is preferred in neonates because it rarely causes diarrhea", "It is the only constipation drug in this subsection approved for infants", "It should be doubled in dose for children because intestinal transit is faster"],
    answer: "It is contraindicated in children younger than 2 years because of the risk of serious dehydration",
    explanation: "Linaclotide carries a boxed warning and contraindication for patients younger than 2 years because of serious dehydration risk.",
    objective: .contraindication,
    relatedDrugIds: ["d257"],
    tags: ["8c", "linaclotide", "boxed-warning"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_037",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which patient should not receive linaclotide because of a labeled contraindication unrelated to age?",
    options: ["A patient with known or suspected mechanical gastrointestinal obstruction", "A patient whose constipation is associated with IBS-C", "A patient who prefers morning dosing", "A patient who drinks coffee with breakfast", "A patient with occasional bloating at baseline"],
    answer: "A patient with known or suspected mechanical gastrointestinal obstruction",
    explanation: "Linaclotide is contraindicated in patients with known or suspected mechanical gastrointestinal obstruction.",
    objective: .contraindication,
    relatedDrugIds: ["d257"],
    tags: ["8c", "linaclotide", "obstruction"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_038",
    subsectionId: "8c",
    difficulty: .medium,
    question: "A patient starts linaclotide and develops significant diarrhea within the first 2 weeks. Which high-yield pearl is most accurate?",
    options: ["Diarrhea is the most common adverse effect; if it is severe, stop the drug and rehydrate", "Diarrhea means the drug is working perfectly, so the dose should always be doubled", "Linaclotide should be taken with loperamide every day to prevent this expected effect", "Severe diarrhea is unique to GoLYTELY, not linaclotide", "Linaclotide usually causes constipation rather than diarrhea"],
    answer: "Diarrhea is the most common adverse effect; if it is severe, stop the drug and rehydrate",
    explanation: "Diarrhea is the most common adverse effect of linaclotide and can be severe, so severe diarrhea should prompt holding the drug and rehydration.",
    objective: .adverseEffect,
    relatedDrugIds: ["d257"],
    tags: ["8c", "linaclotide", "diarrhea"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_039",
    subsectionId: "8c",
    difficulty: .hard,
    question: "A student assumes OTC loperamide is harmless at any dose, but that is incorrect. Which safety issue becomes especially important when loperamide is taken in higher-than-recommended amounts?",
    options: ["Serious cardiac adverse reactions including QT prolongation, torsades, and even death", "Severe neutropenia requiring weekly CBC checks", "Immediate hepatotoxicity after one dose in most adults", "Permanent tooth discoloration in children", "Profound hypoglycemia after meals"],
    answer: "Serious cardiac adverse reactions including QT prolongation, torsades, and even death",
    explanation: "Higher-than-recommended loperamide doses can cause life-threatening cardiac toxicity, including QT prolongation and torsades de pointes.",
    objective: .adverseEffect,
    relatedDrugIds: ["d258"],
    tags: ["8c", "loperamide", "cardiac-toxicity"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_040",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which diarrhea scenario should make you pause before reaching for loperamide as the main treatment?",
    options: ["Bloody stool with high fever suggesting acute dysentery", "Watery travelers’ diarrhea without alarm features", "Loose stool during a stressful exam week", "Mild short-lived diarrhea after eating spicy food", "Occasional diarrhea with ileostomy output reduction goals"],
    answer: "Bloody stool with high fever suggesting acute dysentery",
    explanation: "Loperamide should not be used as the primary therapy in acute dysentery or other invasive infectious diarrhea scenarios marked by blood in the stool and high fever.",
    objective: .contraindication,
    relatedDrugIds: ["d258"],
    tags: ["8c", "loperamide", "infectious-diarrhea"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_041",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which pediatric age warning is most important for diphenoxylate/atropine tablets?",
    options: ["It is contraindicated in children younger than 6 years because of severe respiratory and CNS depression risk", "It is contraindicated in anyone younger than 18 years because of hepatotoxicity", "It is preferred in toddlers because atropine prevents overdose", "It is safe in all ages if the diarrhea is severe enough", "It is only restricted in neonates younger than 1 month"],
    answer: "It is contraindicated in children younger than 6 years because of severe respiratory and CNS depression risk",
    explanation: "Diphenoxylate/atropine is contraindicated in children younger than 6 years because of severe respiratory and CNS depression risk.",
    objective: .contraindication,
    relatedDrugIds: ["d255"],
    tags: ["8c", "diphenoxylate-atropine", "pediatrics"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_042",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which patient is a poor candidate for diphenoxylate/atropine because slowing the gut could worsen the disease course?",
    options: ["A patient with diarrhea from Clostridioides difficile or another enterotoxin-producing infection", "A patient with uncomplicated travelers’ diarrhea and no fever", "A patient with occasional functional diarrhea after stress", "A patient with an ileostomy who needs lower output", "A patient who needs adjunctive therapy plus fluids for noninvasive diarrhea"],
    answer: "A patient with diarrhea from Clostridioides difficile or another enterotoxin-producing infection",
    explanation: "Diphenoxylate/atropine is contraindicated in C. difficile-associated or other enterotoxin-mediated infectious diarrhea because of serious GI complication risk, including sepsis.",
    objective: .contraindication,
    relatedDrugIds: ["d255"],
    tags: ["8c", "diphenoxylate-atropine", "infectious-diarrhea"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_043",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Which statement best matches the proper role of diphenoxylate/atropine in diarrhea management?",
    options: ["It should be used as adjunctive therapy with appropriate fluid and electrolyte replacement, not as a substitute for rehydration", "It replaces the need for oral or IV fluids because it fully corrects dehydration", "It is the preferred treatment for constipation-predominant IBS", "It is mainly a bowel-cleansing drug before colonoscopy", "It is used to lower ammonia in hepatic encephalopathy"],
    answer: "It should be used as adjunctive therapy with appropriate fluid and electrolyte replacement, not as a substitute for rehydration",
    explanation: "Diphenoxylate/atropine is an adjunct for diarrhea management and should be paired with appropriate fluid and electrolyte therapy when indicated.",
    objective: .pearl,
    relatedDrugIds: ["d255"],
    tags: ["8c", "diphenoxylate-atropine", "adjunctive-therapy"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_044",
    subsectionId: "8c",
    difficulty: .hard,
    question: "Which counseling point is correct for polyethylene glycol with electrolytes used as a bowel prep?",
    options: ["Reconstitute it with water, avoid solid food shortly before the prep, and continue until the watery stool is clear", "Take the dry powder without mixing because water weakens the electrolytes", "Use it as the preferred daily maintenance therapy for opioid-induced constipation", "Stop after the first loose stool even if solid stool is still present", "Take oral medications together with the prep so absorption is guaranteed"],
    answer: "Reconstitute it with water, avoid solid food shortly before the prep, and continue until the watery stool is clear",
    explanation: "PEG with electrolytes is reconstituted with water and continued until the stool is clear; it is a bowel-cleansing prep, not a routine daily laxative.",
    objective: .dosing,
    relatedDrugIds: ["d259"],
    tags: ["8c", "peg-electrolytes", "prep-counseling"],
    source: .curated
),

.multipleChoice(
    id: "q8c_add_045",
    subsectionId: "8c",
    difficulty: .medium,
    question: "Which statement best distinguishes senna/docusate from docusate alone in a bowel regimen?",
    options: ["Senna/docusate adds a stimulant laxative to stool-softening effects and commonly produces a bowel movement in about 6 to 12 hours", "Senna/docusate is purely a stool softener with no stimulant component", "Senna/docusate is mainly an antidiarrheal for travelers’ diarrhea", "Senna/docusate is the preferred colonoscopy cleansing solution", "Senna/docusate lowers ammonia in hepatic encephalopathy"],
    answer: "Senna/docusate adds a stimulant laxative to stool-softening effects and commonly produces a bowel movement in about 6 to 12 hours",
    explanation: "Senna/docusate combines a stool softener with a stimulant laxative, making it more active than docusate alone and useful in opioid-related constipation regimens.",
    objective: .pearl,
    relatedDrugIds: ["d260"],
    tags: ["8c", "senna-docusate", "counseling"],
    source: .curated
)
    ]
}
