
// PharmaLingo — Mastering GI & Hepatic
// Curated Add-On Question Pack (45 questions)
// IDs: q8f_add_001 ... q8f_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 8f is a review-only mastery subsection in the outline and current repo.
// - These questions should be appended AFTER the app auto-builds the mastery pool in DrugDataService.init().
// - This pack mirrors the integration pattern used for earlier mastery sections.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) In DrugDataService.init(), inside the mastery-generation loop:
//        for sub in mod.subsections where sub.isMasteryQuiz { ... }
//    immediately after:
//        bank[sub.id] = mastery
//    append:
//        if sub.id == Self.masteringGiHepaticSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_8fMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 8a–8e with a few earlier-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-09

import Foundation

extension DrugDataService {
    static let masteringGiHepaticSubsectionId: String = "8f"

    static let curatedAddOnQuestions_8fMastery: [Question] = [

        .multipleChoice(
            id: "q8f_add_001",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient with recent coronary stenting takes clopidogrel and now needs daily acid suppression for GERD. Which GI drug is the best PPI choice because it does not have a clinically important effect on clopidogrel at approved doses?",
            options: ["Pantoprazole", "Omeprazole", "Esomeprazole", "Famotidine", "Sucralfate"],
            answer: "Pantoprazole",
            explanation: "Pantoprazole is the high-yield PPI choice when clopidogrel is on board because approved-dose pantoprazole does not have a clinically important effect on clopidogrel activation.",
            objective: .interaction,
            relatedDrugIds: ["d132", "d39"],
            tags: ["Mastery", "8f", "PPI", "clopidogrel"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_002",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "Prevacid is one of the -prazole drugs that suppresses acid by blocking the gastric proton pump. What is the generic name of Prevacid?",
            options: ["Lansoprazole", "Omeprazole", "Esomeprazole", "Famotidine", "Sucralfate"],
            answer: "Lansoprazole",
            explanation: "Prevacid is lansoprazole, a proton pump inhibitor in the -prazole family.",
            objective: .brandGeneric,
            relatedDrugIds: ["d133"],
            tags: ["Mastery", "8f", "Prevacid", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_003",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient wants the strongest oral acid suppression and is told to take the medication before meals rather than only at bedtime as needed. Which module 8 drug best fits that controller-style acid suppression role?",
            options: ["Omeprazole", "Famotidine", "Sucralfate", "Scopolamine", "Dicyclomine"],
            answer: "Omeprazole",
            explanation: "Omeprazole is a proton pump inhibitor used for stronger acid suppression and is typically taken before meals.",
            objective: .indication,
            relatedDrugIds: ["d130"],
            tags: ["Mastery", "8f", "GERD", "before meals"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_004",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Pepcid is often used when faster, less potent acid suppression is acceptable, but dose reduction matters in renal impairment because CNS effects and QT issues can emerge. What is the generic name of Pepcid?",
            options: ["Famotidine", "Pantoprazole", "Lansoprazole", "Omeprazole", "Sucralfate"],
            answer: "Famotidine",
            explanation: "Pepcid is famotidine, an H2 blocker that needs renal dosing adjustment in moderate to severe renal impairment.",
            objective: .monitoring,
            relatedDrugIds: ["d134"],
            tags: ["Mastery", "8f", "Pepcid", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_005",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A patient with duodenal ulcer needs a drug that coats the ulcer rather than directly turning off acid secretion. Which module 8 drug is the mucosal protectant?",
            options: ["Sucralfate", "Famotidine", "Omeprazole", "Aprepitant", "Mesalamine"],
            answer: "Sucralfate",
            explanation: "Sucralfate is a mucosal protectant that forms a barrier over the ulcer rather than primarily suppressing acid production.",
            objective: .classId,
            relatedDrugIds: ["d135"],
            tags: ["Mastery", "8f", "Carafate", "mucosal-protectant"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_006",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient on dialysis asks whether Carafate is completely harmless because it is not absorbed much. Which concern is most important?",
            options: ["Aluminum accumulation and toxicity in renal impairment", "Severe hyperkalemia", "Marked QT prolongation", "Agranulocytosis", "Serotonin syndrome"],
            answer: "Aluminum accumulation and toxicity in renal impairment",
            explanation: "Sucralfate contains aluminum, so aluminum accumulation and toxicity are important concerns in significant renal impairment.",
            objective: .contraindication,
            relatedDrugIds: ["d135"],
            tags: ["Mastery", "8f", "sucralfate", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_007",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .hard,
            question: "A patient takes levothyroxine, ciprofloxacin, and digoxin and wants to add Carafate for an ulcer. Which counseling point is most important?",
            options: ["Sucralfate can bind other medications, so administration should be separated", "Take sucralfate with an antacid at the exact same time for synergy", "Crush sucralfate tablets into milk for best absorption", "Take sucralfate only at bedtime with a full meal", "Stop sucralfate because it is contraindicated in GERD"],
            answer: "Sucralfate can bind other medications, so administration should be separated",
            explanation: "Sucralfate can reduce absorption of several oral drugs, so spacing administration is a high-yield counseling pearl.",
            objective: .interaction,
            relatedDrugIds: ["d135"],
            tags: ["Mastery", "8f", "sucralfate", "spacing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_008",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .hard,
            question: "A patient needs chronic ibuprofen for inflammatory pain and is considered at risk for NSAID-associated gastric ulcer. Which acid-suppressing drug from module 8 has specific risk-reduction labeling for NSAID-associated gastric ulcers?",
            options: ["Esomeprazole", "Famotidine", "Sucralfate", "Scopolamine", "Dicyclomine"],
            answer: "Esomeprazole",
            explanation: "Esomeprazole is a PPI with labeling for reduction of NSAID-associated gastric ulcer risk in appropriate at-risk patients.",
            objective: .mixedReview,
            relatedDrugIds: ["d131", "d152"],
            tags: ["Mastery", "8f", "NSAID", "ulcer-risk"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_009",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "Highly emetogenic chemotherapy often uses a 3-drug antiemetic plan: a 5-HT3 blocker, dexamethasone, and an NK1 antagonist. Which module 8 drug is the NK1 agent in that trio?",
            options: ["Aprepitant", "Ondansetron", "Promethazine", "Scopolamine", "Metoclopramide"],
            answer: "Aprepitant",
            explanation: "Aprepitant is the NK1 receptor antagonist commonly added for highly emetogenic chemotherapy regimens.",
            objective: .classId,
            relatedDrugIds: ["d140"],
            tags: ["Mastery", "8f", "aprepitant", "NK1"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_010",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A young woman taking oral contraceptives receives Emend as part of a CINV regimen. Which counseling point is highest yield?",
            options: ["Use backup nonhormonal contraception during treatment and for 28 days after the last dose", "Stop all hormonal contraception permanently", "Double the oral contraceptive dose", "There is no contraceptive interaction with aprepitant", "The only interaction concern is grapefruit juice"],
            answer: "Use backup nonhormonal contraception during treatment and for 28 days after the last dose",
            explanation: "Aprepitant can reduce hormonal contraceptive efficacy, so backup contraception is recommended during therapy and for 28 days after the last dose.",
            objective: .interaction,
            relatedDrugIds: ["d140"],
            tags: ["Mastery", "8f", "aprepitant", "contraception"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_011",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient on chronic warfarin is given aprepitant for nausea prevention around chemotherapy. Which lab requires extra follow-up after starting the antiemetic?",
            options: ["INR", "CBC", "TSH", "Troponin", "A1c"],
            answer: "INR",
            explanation: "Aprepitant can affect warfarin response, so INR monitoring is a high-yield follow-up step.",
            objective: .monitoring,
            relatedDrugIds: ["d140", "d41"],
            tags: ["Mastery", "8f", "aprepitant", "warfarin"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_012",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A patient with longstanding diabetes has early satiety, nausea, and delayed gastric emptying. Which antiemetic from this module is especially useful because it is also prokinetic?",
            options: ["Metoclopramide", "Ondansetron", "Scopolamine", "Promethazine", "Aprepitant"],
            answer: "Metoclopramide",
            explanation: "Metoclopramide is a dopamine antagonist that also has prokinetic activity, making it especially useful in gastroparesis.",
            objective: .indication,
            relatedDrugIds: ["d138"],
            tags: ["Mastery", "8f", "gastroparesis", "prokinetic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_013",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A resident wants to continue Reglan indefinitely for chronic nausea. Which boxed-warning toxicity makes that poor practice?",
            options: ["Tardive dyskinesia", "Agranulocytosis", "Pancreatitis", "Pulmonary fibrosis", "Retinal detachment"],
            answer: "Tardive dyskinesia",
            explanation: "Metoclopramide carries a boxed warning for tardive dyskinesia, especially with longer duration and higher cumulative exposure.",
            objective: .adverseEffect,
            relatedDrugIds: ["d138"],
            tags: ["Mastery", "8f", "Reglan", "boxed-warning"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_014",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .hard,
            question: "A patient with Parkinson disease uses apomorphine and asks for an antiemetic after a procedure. Which common antiemetic should be avoided because the combination is contraindicated?",
            options: ["Ondansetron", "Scopolamine", "Promethazine", "Aprepitant", "Famotidine"],
            answer: "Ondansetron",
            explanation: "Ondansetron is contraindicated with apomorphine because the combination can cause profound hypotension and loss of consciousness.",
            objective: .interaction,
            relatedDrugIds: ["d136"],
            tags: ["Mastery", "8f", "ondansetron", "apomorphine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_015",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .hard,
            question: "A patient on linezolid and sertraline develops nausea. Which common antiemetic deserves extra caution because its label warns about serotonin syndrome with serotonergic drugs?",
            options: ["Ondansetron", "Scopolamine", "Bisacodyl", "Sucralfate", "Famotidine"],
            answer: "Ondansetron",
            explanation: "Ondansetron has a serotonin syndrome warning when used with serotonergic drugs, so it deserves extra caution in that setting.",
            objective: .interaction,
            relatedDrugIds: ["d136", "d112"],
            tags: ["Mastery", "8f", "ondansetron", "serotonin-syndrome"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_016",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Phenergan can be tempting for nausea in children, but one age group should not receive it because of potentially fatal respiratory depression. Which answer is correct?",
            options: ["Children younger than 2 years", "Adults older than 65 years", "Children older than 12 years", "Children with eczema only", "Anyone with GERD"],
            answer: "Children younger than 2 years",
            explanation: "Promethazine is contraindicated in children younger than 2 years because of the risk of respiratory depression.",
            objective: .contraindication,
            relatedDrugIds: ["d137"],
            tags: ["Mastery", "8f", "promethazine", "pediatrics"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_017",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "During a difficult ED shift, someone reaches for IV promethazine without thinking about local toxicity. Which serious administration complication makes this drug memorable?",
            options: ["Severe tissue injury or necrosis including gangrene", "Permanent ototoxicity", "Nephrogenic diabetes insipidus", "Achilles tendon rupture", "Red-man syndrome"],
            answer: "Severe tissue injury or necrosis including gangrene",
            explanation: "Promethazine injection is memorable for severe tissue injury risk, including necrosis and gangrene, if administration goes badly.",
            objective: .pearl,
            relatedDrugIds: ["d137"],
            tags: ["Mastery", "8f", "promethazine", "tissue-injury"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_018",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A cruise passenger wants an antiemetic that goes behind the ear before travel and works for up to 3 days. Which drug fits best?",
            options: ["Scopolamine", "Ondansetron", "Aprepitant", "Metoclopramide", "Promethazine"],
            answer: "Scopolamine",
            explanation: "Scopolamine is the classic transdermal patch used for motion sickness prevention and lasts up to about 3 days per patch.",
            objective: .indication,
            relatedDrugIds: ["d139"],
            tags: ["Mastery", "8f", "motion-sickness", "scopolamine"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_019",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Which counseling point about Transderm Scop is most important for a patient with a history of eye pain from narrow-angle glaucoma?",
            options: ["It can precipitate acute angle-closure glaucoma and should be avoided or used with great caution", "It will reliably lower eye pressure", "It is the safest antinausea choice in glaucoma", "It causes ototoxicity rather than eye problems", "It only works if placed on the abdomen"],
            answer: "It can precipitate acute angle-closure glaucoma and should be avoided or used with great caution",
            explanation: "Scopolamine can increase intraocular pressure and may precipitate acute angle-closure glaucoma.",
            objective: .contraindication,
            relatedDrugIds: ["d139"],
            tags: ["Mastery", "8f", "scopolamine", "glaucoma"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_020",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A patient with chronic constipation wants the common OTC powder that is first-line for many adults and works osmotically by holding water in the stool. Which drug is best?",
            options: ["Polyethylene glycol", "Docusate sodium", "Bisacodyl", "Loperamide", "Dicyclomine"],
            answer: "Polyethylene glycol",
            explanation: "Polyethylene glycol (MiraLAX) is a common first-line osmotic laxative for chronic constipation.",
            objective: .indication,
            relatedDrugIds: ["d141"],
            tags: ["Mastery", "8f", "MiraLAX", "constipation"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_021",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A cirrhotic patient becomes sleepy and confused from hepatic encephalopathy. Which bowel drug from module 8 is high yield because it lowers ammonia by acidifying the colon and trapping ammonium?",
            options: ["Lactulose", "Loperamide", "Polyethylene glycol", "Bisacodyl", "Scopolamine"],
            answer: "Lactulose",
            explanation: "Lactulose is used in hepatic encephalopathy because bacterial metabolism acidifies the colon and helps trap ammonia as ammonium.",
            objective: .moa,
            relatedDrugIds: ["d256"],
            tags: ["Mastery", "8f", "lactulose", "hepatic-encephalopathy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_022",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient with IBS-C is prescribed Linzess. Which administration instruction is the most high yield?",
            options: ["Take it on an empty stomach at least 30 minutes before the first meal", "Take it with a high-fat bedtime snack", "Chew it immediately after dinner", "Use it only as needed when pain starts", "Take it with antacids for better absorption"],
            answer: "Take it on an empty stomach at least 30 minutes before the first meal",
            explanation: "Linaclotide is classically taken on an empty stomach, at least 30 minutes before the first meal of the day.",
            objective: .dosing,
            relatedDrugIds: ["d257"],
            tags: ["Mastery", "8f", "linaclotide", "empty-stomach"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_023",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "Which constipation medication in this module carries a boxed warning for risk of serious dehydration in patients younger than 2 years?",
            options: ["Linaclotide", "Docusate sodium", "Bisacodyl", "Polyethylene glycol", "Lactulose"],
            answer: "Linaclotide",
            explanation: "Linaclotide carries a boxed warning and is contraindicated in children younger than 2 years because of the risk of serious dehydration.",
            objective: .contraindication,
            relatedDrugIds: ["d257"],
            tags: ["Mastery", "8f", "linaclotide", "boxed-warning"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_024",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient with fever and bloody diarrhea asks whether OTC Imodium is a good idea. Which response is best?",
            options: ["Avoid loperamide because slowing the gut can be dangerous in dysentery with blood or high fever", "Use a double dose immediately", "Combine it with diphenhydramine", "Take it together with senna/docusate", "Use it only if pregnant"],
            answer: "Avoid loperamide because slowing the gut can be dangerous in dysentery with blood or high fever",
            explanation: "Loperamide should be avoided in acute dysentery and certain invasive or inflammatory diarrheal illnesses because slowing transit can worsen the situation.",
            objective: .contraindication,
            relatedDrugIds: ["d258"],
            tags: ["Mastery", "8f", "loperamide", "dysentery"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_025",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A student learns that Imodium is safe at labeled doses but dangerous when abused in very high amounts. Which toxicity best captures that danger?",
            options: ["QT prolongation, torsades, and other serious ventricular arrhythmias", "Severe neutropenia", "Acute angle-closure glaucoma", "Pulmonary edema", "Stevens-Johnson syndrome"],
            answer: "QT prolongation, torsades, and other serious ventricular arrhythmias",
            explanation: "High-dose loperamide misuse has been linked to QT prolongation, torsades, cardiac arrest, and other serious arrhythmias.",
            objective: .adverseEffect,
            relatedDrugIds: ["d258"],
            tags: ["Mastery", "8f", "loperamide", "arrhythmia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_026",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Lomotil contains an opioid-like antidiarrheal plus a tiny amount of atropine. Why is atropine included?",
            options: ["To discourage abuse and intentional overuse", "To speed gastric emptying", "To prevent QT prolongation", "To coat ulcers", "To lower ammonia"],
            answer: "To discourage abuse and intentional overuse",
            explanation: "Atropine is included in diphenoxylate/atropine mainly to discourage abuse because unpleasant anticholinergic effects appear at higher doses.",
            objective: .pearl,
            relatedDrugIds: ["d255"],
            tags: ["Mastery", "8f", "Lomotil", "abuse-deterrent"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_027",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A postoperative patient wants something gentle because straining hurts. Which drug in module 8 works mainly as a stool softener and is better for prevention than fast rescue?",
            options: ["Docusate sodium", "Bisacodyl", "Loperamide", "Scopolamine", "Ondansetron"],
            answer: "Docusate sodium",
            explanation: "Docusate is a stool softener used more for prevention and softening than for rapid relief of severe constipation.",
            objective: .classId,
            relatedDrugIds: ["d142"],
            tags: ["Mastery", "8f", "docusate", "softener"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_028",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient starting hydrocodone/acetaminophen for several days after dental surgery wants to prevent opioid constipation rather than wait for it to happen. Which GI medication from module 8 is the classic prophylactic choice?",
            options: ["Senna/Docusate", "Loperamide", "Ondansetron", "Scopolamine", "Sucralfate"],
            answer: "Senna/Docusate",
            explanation: "Senna/docusate is a classic bowel-regimen choice when starting short-term opioid therapy because it combines a stimulant laxative with a softener.",
            objective: .mixedReview,
            relatedDrugIds: ["d260", "d148"],
            tags: ["Mastery", "8f", "opioid-constipation", "Senokot-S"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_029",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A colonoscopy patient is handed a large jug of PEG with electrolytes and told the whole point is to cleanse the bowel, not to serve as everyday constipation therapy. Which product is this?",
            options: ["Polyethylene glycol with electrolytes", "Polyethylene glycol", "Docusate sodium", "Lactulose", "Linaclotide"],
            answer: "Polyethylene glycol with electrolytes",
            explanation: "PEG with electrolytes is the large-volume bowel preparation product used before colonoscopy.",
            objective: .indication,
            relatedDrugIds: ["d259"],
            tags: ["Mastery", "8f", "GoLYTELY", "bowel-prep"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_030",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient wants overnight help from Dulcolax but plans to take it with milk and an antacid. Which counseling point is most important?",
            options: ["Avoid taking oral bisacodyl within about 1 hour of milk or antacids", "Always take it with mineral oil", "It must be chewed before swallowing", "It should only be taken with food", "It is safe only by IV route"],
            answer: "Avoid taking oral bisacodyl within about 1 hour of milk or antacids",
            explanation: "Milk or antacids can dissolve the enteric coating of oral bisacodyl too early, so they should not be taken close together.",
            objective: .interaction,
            relatedDrugIds: ["d143"],
            tags: ["Mastery", "8f", "bisacodyl", "antacid"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_031",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A patient with IBS keeps describing crampy abdominal pain rather than inflammatory diarrhea. Which drug from module 8 is the classic anticholinergic antispasmodic for that symptom pattern?",
            options: ["Dicyclomine", "Mesalamine", "Loperamide", "Famotidine", "Scopolamine"],
            answer: "Dicyclomine",
            explanation: "Dicyclomine is the classic anticholinergic antispasmodic used for IBS-related cramping pain.",
            objective: .indication,
            relatedDrugIds: ["d261"],
            tags: ["Mastery", "8f", "dicyclomine", "IBS"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_032",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Which patient should definitely not receive dicyclomine based on labeled contraindications?",
            options: ["A 4-month-old infant with colic", "An adult with seasonal allergies", "A teenager with motion sickness", "An adult with GERD", "A healthy traveler with nausea"],
            answer: "A 4-month-old infant with colic",
            explanation: "Dicyclomine is contraindicated in infants younger than 6 months.",
            objective: .contraindication,
            relatedDrugIds: ["d261"],
            tags: ["Mastery", "8f", "dicyclomine", "infants"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_033",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "An older man with narrow-angle glaucoma and urinary retention asks for Bentyl because his friend uses it for IBS cramps. Why is that a poor fit?",
            options: ["Dicyclomine's anticholinergic effects can worsen glaucoma and urinary retention", "It is only a topical medication", "It always causes bleeding", "It is a laxative rather than an antispasmodic", "It lowers blood glucose too much"],
            answer: "Dicyclomine's anticholinergic effects can worsen glaucoma and urinary retention",
            explanation: "Because dicyclomine is anticholinergic, it can worsen narrow-angle glaucoma and urinary retention.",
            objective: .contraindication,
            relatedDrugIds: ["d261"],
            tags: ["Mastery", "8f", "dicyclomine", "glaucoma"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_034",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Which counseling point best fits dicyclomine on a hot summer day?",
            options: ["Anticholinergic drugs can impair sweating and contribute to heat-related illness", "It will prevent dehydration", "It should be taken only with alcohol", "It improves exercise tolerance in heat", "It must be refrigerated against light"],
            answer: "Anticholinergic drugs can impair sweating and contribute to heat-related illness",
            explanation: "Dicyclomine's anticholinergic effects can reduce sweating, which can increase risk of heat-related illness.",
            objective: .pearl,
            relatedDrugIds: ["d261"],
            tags: ["Mastery", "8f", "dicyclomine", "heat"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_035",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "A patient with mild to moderate ulcerative colitis wants a colon-directed anti-inflammatory before moving to IV biologic therapy. Which drug from module 8 best fits that first step?",
            options: ["Mesalamine", "Infliximab", "Scopolamine", "Loperamide", "Dicyclomine"],
            answer: "Mesalamine",
            explanation: "Mesalamine is the classic 5-ASA option for mild to moderate ulcerative colitis before escalation to biologic therapy.",
            objective: .indication,
            relatedDrugIds: ["d144"],
            tags: ["Mastery", "8f", "mesalamine", "UC"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_036",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "Asacol and Lialda are high-yield brand names tied to the same 5-ASA drug used in ulcerative colitis. What is the generic name?",
            options: ["Mesalamine", "Metoclopramide", "Methimazole", "Meloxicam", "Mesna"],
            answer: "Mesalamine",
            explanation: "Asacol and Lialda are brand names for mesalamine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d144"],
            tags: ["Mastery", "8f", "Asacol", "Lialda"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_037",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A clinician orders baseline kidney labs before starting a 5-ASA for ulcerative colitis. Which drug is being monitored this way?",
            options: ["Mesalamine", "Scopolamine", "Ondansetron", "Promethazine", "Bisacodyl"],
            answer: "Mesalamine",
            explanation: "Mesalamine can impair renal function, so renal assessment before and during therapy is a high-yield monitoring point.",
            objective: .monitoring,
            relatedDrugIds: ["d144"],
            tags: ["Mastery", "8f", "mesalamine", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_038",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .hard,
            question: "Soon after starting mesalamine, a patient reports cramping, abdominal pain, bloody diarrhea, fever, headache, and rash. Which explanation is most likely?",
            options: ["Mesalamine-induced acute intolerance syndrome that can mimic a UC flare", "Expected mild constipation from treatment", "Classic serotonin syndrome", "Benign motion sickness", "Opioid withdrawal"],
            answer: "Mesalamine-induced acute intolerance syndrome that can mimic a UC flare",
            explanation: "Mesalamine can cause an acute intolerance syndrome with GI symptoms, fever, headache, and rash that may resemble worsening ulcerative colitis.",
            objective: .adverseEffect,
            relatedDrugIds: ["d144"],
            tags: ["Mastery", "8f", "mesalamine", "acute-intolerance"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_039",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .easy,
            question: "Remicade is the IV anti-TNF biologic in this subsection used for Crohn disease and ulcerative colitis when disease is more severe or refractory. What is the generic name of Remicade?",
            options: ["Infliximab", "Mesalamine", "Adalimumab", "Etanercept", "Hydroxychloroquine"],
            answer: "Infliximab",
            explanation: "Remicade is infliximab, an IV anti-TNF biologic.",
            objective: .brandGeneric,
            relatedDrugIds: ["d145"],
            tags: ["Mastery", "8f", "Remicade", "brand-generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_040",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Which boxed warning pair should students most strongly associate with infliximab?",
            options: ["Serious infections and malignancy", "Hepatotoxicity and pancreatitis", "Torsades and sudden death", "Tardive dyskinesia and neuroleptic malignant syndrome", "Fetal malformations and nephrolithiasis"],
            answer: "Serious infections and malignancy",
            explanation: "Infliximab's boxed warnings emphasize serious infections and malignancy.",
            objective: .contraindication,
            relatedDrugIds: ["d145"],
            tags: ["Mastery", "8f", "infliximab", "boxed-warning"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_041",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "Before the first infliximab infusion, what screening step is most important?",
            options: ["Test for latent TB and review hepatitis B status before therapy", "Check INR only", "Obtain colonoscopy every week", "Give live vaccines first", "Start high-dose loperamide"],
            answer: "Test for latent TB and review hepatitis B status before therapy",
            explanation: "Before infliximab, clinicians should screen for latent TB and assess hepatitis B risk because serious infection and reactivation are major concerns.",
            objective: .monitoring,
            relatedDrugIds: ["d145"],
            tags: ["Mastery", "8f", "infliximab", "TB"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_042",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "A patient with Crohn disease is starting infliximab and asks how the schedule begins before stretching out. Which dosing pattern is correct?",
            options: ["Infusions at weeks 0, 2, and 6, then about every 8 weeks", "Daily oral dosing for 14 days", "Weekly self-injections forever", "A one-time dose only", "Every 12 hours for 3 days"],
            answer: "Infusions at weeks 0, 2, and 6, then about every 8 weeks",
            explanation: "Infliximab is classically started with induction infusions at weeks 0, 2, and 6, followed by maintenance about every 8 weeks.",
            objective: .dosing,
            relatedDrugIds: ["d145"],
            tags: ["Mastery", "8f", "infliximab", "schedule"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_043",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .medium,
            question: "During a Remicade infusion, a patient develops flushing, chest tightness, and dyspnea. Which explanation is highest yield?",
            options: ["Infliximab can cause infusion reactions and the infusion should be assessed immediately", "Mesalamine stone formation is occurring", "Scopolamine withdrawal is causing the symptoms", "Bisacodyl overdose is the culprit", "Famotidine renal toxicity is most likely"],
            answer: "Infliximab can cause infusion reactions and the infusion should be assessed immediately",
            explanation: "Infliximab is well known for infusion reactions, so new flushing, chest symptoms, or dyspnea during infusion should prompt immediate assessment.",
            objective: .adverseEffect,
            relatedDrugIds: ["d145"],
            tags: ["Mastery", "8f", "infliximab", "infusion-reaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_044",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .hard,
            question: "A patient with mild ulcerative colitis asks whether to start with a colon-directed 5-ASA or jump straight to IV anti-TNF therapy. Which choice is most appropriate for an initial mild-to-moderate UC approach?",
            options: ["Mesalamine before infliximab", "Infliximab before mesalamine", "Scopolamine patch", "Loperamide at high dose", "Dicyclomine plus promethazine"],
            answer: "Mesalamine before infliximab",
            explanation: "For mild to moderate ulcerative colitis, mesalamine is the more classic initial colon-directed choice before escalation to an IV biologic like infliximab.",
            objective: .mixedReview,
            relatedDrugIds: ["d144", "d145"],
            tags: ["Mastery", "8f", "UC", "step-up-logic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q8f_add_045",
            subsectionId: DrugDataService.masteringGiHepaticSubsectionId,
            difficulty: .hard,
            question: "A patient on Plavix wants OTC heartburn relief and grabs Prilosec because it is familiar. Which counseling point is most important?",
            options: ["Avoid omeprazole because it can reduce clopidogrel activation and antiplatelet effect", "Take omeprazole and clopidogrel together for synergy", "Switch clopidogrel to loperamide", "Add sucralfate to increase clopidogrel activation", "Replace clopidogrel with famotidine"],
            answer: "Avoid omeprazole because it can reduce clopidogrel activation and antiplatelet effect",
            explanation: "Omeprazole can reduce clopidogrel activation through CYP2C19 interaction, so it is a classic combination to avoid.",
            objective: .interaction,
            relatedDrugIds: ["d130", "d39"],
            tags: ["Mastery", "8f", "omeprazole", "Plavix"],
            source: .curated
        )

    ]
}
