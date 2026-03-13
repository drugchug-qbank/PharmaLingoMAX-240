// PharmaLingo — Module 10a (BPH + Overactive Bladder + Urinary Analgesics)
// Curated Add-On Question Pack (45 questions)
// IDs: q10a_add_001 ... q10a_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 10a exists, then append:
//
//    if bank["10a"] == nil { bank["10a"] = [] }
//    bank["10a"]?.append(contentsOf: Self.curatedAddOnQuestions_10a)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d188 (Tamsulosin / Flomax)
//   d189 (Finasteride / Proscar-Propecia)
//   d190 (Dutasteride / Avodart)
//   d191 (Oxybutynin / Ditropan)
//   d192 (Mirabegron / Myrbetriq)
//   d193 (Sildenafil / Viagra)
//   d194 (Tadalafil / Cialis)
//   d274 (Phenazopyridine / Pyridium)
//   d275 (Solifenacin / Vesicare)
//
// Generated on: 2026-03-10

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_10a: [Question] = [
        .multipleChoice(
            id: "q10a_add_001",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Flomax is the classic uroselective alpha-1 blocker used to improve urinary flow in benign prostatic hyperplasia. What is the generic name of Flomax?",
            options: ["Tamsulosin", "Finasteride", "Dutasteride", "Tadalafil", "Solifenacin"],
            answer: "Tamsulosin",
            explanation: "Flomax is the brand name for tamsulosin, an alpha-1 blocker used to improve BPH symptoms by relaxing smooth muscle in the prostate and bladder neck.",
            objective: .brandGeneric,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_002",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Tamsulosin is often started when a patient has BPH symptoms such as hesitancy, weak stream, and incomplete bladder emptying. Which brand name matches tamsulosin?",
            options: ["Flomax", "Avodart", "Myrbetriq", "Viagra", "Pyridium"],
            answer: "Flomax",
            explanation: "Tamsulosin corresponds to the brand name Flomax.",
            objective: .genericBrand,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_003",
            subsectionId: "10a",
            difficulty: .easy,
            question: "A student sees the suffix in tamsulosin and wants to place it in the right BPH drug bucket. Which drug class best describes tamsulosin?",
            options: ["Alpha-1 blocker", "5-alpha reductase inhibitor", "Beta-3 agonist", "Urinary analgesic", "PDE-5 inhibitor"],
            answer: "Alpha-1 blocker",
            explanation: "Tamsulosin is an alpha-1 blocker used for symptomatic relief of BPH.",
            objective: .classId,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "class"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_004",
            subsectionId: "10a",
            difficulty: .medium,
            question: "Tamsulosin helps men with BPH urinate more easily, not by shrinking the prostate, but by relaxing smooth muscle. Where does this high-yield mechanism primarily help?",
            options: ["Prostate and bladder neck smooth muscle", "Detrusor beta-3 receptors", "Testosterone synthesis in the testes", "Urinary tract mucosal pain fibers", "Renal proximal tubule sodium transport"],
            answer: "Prostate and bladder neck smooth muscle",
            explanation: "Tamsulosin improves BPH symptoms by relaxing alpha-1 mediated smooth muscle in the prostate and bladder neck rather than by shrinking prostate tissue.",
            objective: .moa,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "moa"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_005",
            subsectionId: "10a",
            difficulty: .medium,
            question: "A patient wants relatively quick symptomatic relief from BPH while longer-term prostate-shrinking options are still being considered. Which drug best fits that goal?",
            options: ["Tamsulosin", "Finasteride", "Dutasteride", "Phenazopyridine", "Mirabegron"],
            answer: "Tamsulosin",
            explanation: "Tamsulosin is used for symptomatic relief of BPH and generally works faster than 5-alpha reductase inhibitors, which take months to reduce prostate size.",
            objective: .indication,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "indication"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_006",
            subsectionId: "10a",
            difficulty: .medium,
            question: "A man newly started on tamsulosin for BPH says he feels dizzy when he stands up quickly. Which high-yield adverse effect best explains this?",
            options: ["Orthostatic hypotension", "Orange-red urine", "Hypertension", "Severe dry mouth", "Blue-tinged vision"],
            answer: "Orthostatic hypotension",
            explanation: "Tamsulosin can cause postural dizziness and orthostatic hypotension, especially when treatment is first started or doses are changed.",
            objective: .adverseEffect,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "orthostasis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_007",
            subsectionId: "10a",
            difficulty: .hard,
            question: "Tamsulosin is usually dosed once daily for BPH, but the meal timing matters. Which instruction is best?",
            options: ["Take it about 30 minutes after the same meal each day", "Take it only on an empty stomach at bedtime", "Take it with nitrates to prevent dizziness", "Take it every morning before breakfast and double the dose if symptoms persist after 2 days", "Take it as needed when urinary hesitancy flares"],
            answer: "Take it about 30 minutes after the same meal each day",
            explanation: "Tamsulosin is typically taken once daily about 30 minutes after the same meal each day to keep absorption more consistent.",
            objective: .dosing,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_008",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A patient taking tamsulosin is scheduled for cataract surgery. Which counseling point is most important?",
            options: ["Tell the eye surgeon about current or prior tamsulosin use because of floppy iris risk", "Stop all fluids for 48 hours before surgery", "Take an extra capsule the morning of surgery", "Switch to phenazopyridine before surgery", "Double the dose after surgery to avoid urinary retention"],
            answer: "Tell the eye surgeon about current or prior tamsulosin use because of floppy iris risk",
            explanation: "Tamsulosin has been associated with intraoperative floppy iris syndrome, so the ophthalmologist should know about current or prior use before cataract surgery.",
            objective: .pearl,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "ifis", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_009",
            subsectionId: "10a",
            difficulty: .medium,
            question: "A man treated with tamsulosin for BPH reports that orgasm feels different because semen seems to go backward instead of out. Which adverse effect is most consistent with this complaint?",
            options: ["Abnormal or retrograde ejaculation", "Gynecomastia", "Methemoglobinemia", "Urinary staining", "Severe diarrhea"],
            answer: "Abnormal or retrograde ejaculation",
            explanation: "Abnormal ejaculation, often described as retrograde ejaculation or decreased ejaculate, is a classic high-yield adverse effect of tamsulosin.",
            objective: .adverseEffect,
            relatedDrugIds: ["d188"],
            tags: ["10a", "tamsulosin", "ejaculation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_010",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Proscar is a 5-alpha reductase inhibitor used in BPH, while Propecia is the lower-dose hair-loss brand of the same generic. What is that generic?",
            options: ["Finasteride", "Dutasteride", "Tamsulosin", "Tadalafil", "Sildenafil"],
            answer: "Finasteride",
            explanation: "Finasteride is the generic behind both Proscar for BPH and Propecia for male pattern hair loss.",
            objective: .brandGeneric,
            relatedDrugIds: ["d189"],
            tags: ["10a", "finasteride", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_011",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Finasteride is not an alpha blocker and does not work like tadalafil. Which drug class best describes finasteride?",
            options: ["5-alpha reductase inhibitor", "Alpha-1 blocker", "PDE-5 inhibitor", "Beta-3 agonist", "Urinary analgesic"],
            answer: "5-alpha reductase inhibitor",
            explanation: "Finasteride belongs to the 5-alpha reductase inhibitor class.",
            objective: .classId,
            relatedDrugIds: ["d189"],
            tags: ["10a", "finasteride", "class"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_012",
            subsectionId: "10a",
            difficulty: .medium,
            question: "Finasteride improves BPH over time by lowering dihydrotestosterone rather than by relaxing smooth muscle immediately. Which mechanism best describes it?",
            options: ["Blocks conversion of testosterone to dihydrotestosterone", "Stimulates beta-3 receptors in the detrusor", "Directly blocks pain sensation in the urinary tract", "Inhibits phosphodiesterase-5 to increase cGMP", "Relaxes the bladder neck by alpha-1 blockade"],
            answer: "Blocks conversion of testosterone to dihydrotestosterone",
            explanation: "Finasteride inhibits 5-alpha reductase, reducing conversion of testosterone to dihydrotestosterone and gradually shrinking the prostate.",
            objective: .moa,
            relatedDrugIds: ["d189"],
            tags: ["10a", "finasteride", "moa"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_013",
            subsectionId: "10a",
            difficulty: .medium,
            question: "Not every BPH medication is also used for androgen-related hair loss. Which drug in this subsection is also associated with male pattern baldness treatment?",
            options: ["Finasteride", "Tamsulosin", "Mirabegron", "Phenazopyridine", "Solifenacin"],
            answer: "Finasteride",
            explanation: "Finasteride is also used for male pattern hair loss, which helps students remember the Proscar versus Propecia brand distinction.",
            objective: .indication,
            relatedDrugIds: ["d189"],
            tags: ["10a", "finasteride", "hairloss"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_014",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A patient has been taking finasteride for several months and now needs PSA interpretation. Which lab pearl is most accurate?",
            options: ["Finasteride can lower PSA by about 50%, so PSA results need contextual interpretation", "Finasteride reliably doubles PSA and confirms prostate cancer", "Finasteride makes PSA useless and it should never be checked again", "Finasteride raises PSA only during the first week of treatment", "Finasteride has no meaningful effect on PSA"],
            answer: "Finasteride can lower PSA by about 50%, so PSA results need contextual interpretation",
            explanation: "Finasteride commonly lowers PSA by about 50%, so clinicians must interpret PSA values in that context rather than reading them as if the patient were untreated.",
            objective: .monitoring,
            relatedDrugIds: ["d189"],
            tags: ["10a", "finasteride", "psa", "monitoring"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_015",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A pregnant staff member asks whether she can handle a split finasteride tablet while filling medications. What is the best answer?",
            options: ["She should avoid handling crushed or broken finasteride tablets because of risk to a male fetus", "It is safe as long as gloves are not worn", "She should dissolve the tablet before handling it", "The warning applies only to tadalafil", "There is no pregnancy-related handling concern with finasteride"],
            answer: "She should avoid handling crushed or broken finasteride tablets because of risk to a male fetus",
            explanation: "Pregnant women or women who may become pregnant should not handle crushed or broken finasteride tablets because exposure may harm a developing male fetus.",
            objective: .contraindication,
            relatedDrugIds: ["d189"],
            tags: ["10a", "finasteride", "pregnancy", "handling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_016",
            subsectionId: "10a",
            difficulty: .medium,
            question: "The suffix -steride should push you toward which high-yield drug class in BPH pharmacology?",
            options: ["5-alpha reductase inhibitors", "Alpha-1 blockers", "Beta-3 agonists", "PDE-5 inhibitors", "Urinary analgesics"],
            answer: "5-alpha reductase inhibitors",
            explanation: "Drugs ending in -steride, such as finasteride and dutasteride, are 5-alpha reductase inhibitors.",
            objective: .suffixId,
            relatedDrugIds: ["d189", "d190"],
            tags: ["10a", "suffix", "steride"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_017",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Avodart is another 5-alpha reductase inhibitor used for BPH. What is the generic name of Avodart?",
            options: ["Dutasteride", "Finasteride", "Tamsulosin", "Tadalafil", "Oxybutynin"],
            answer: "Dutasteride",
            explanation: "Avodart is the brand name for dutasteride.",
            objective: .brandGeneric,
            relatedDrugIds: ["d190"],
            tags: ["10a", "dutasteride", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_018",
            subsectionId: "10a",
            difficulty: .hard,
            question: "Dutasteride and finasteride are in the same drug class, but dutasteride is often remembered as the broader enzyme blocker. Which description best fits dutasteride?",
            options: ["It inhibits both type 1 and type 2 5-alpha reductase", "It selectively blocks alpha-1A receptors in the prostate", "It activates beta-3 receptors in the detrusor", "It inhibits PDE-5 to increase cGMP", "It directly anesthetizes the urinary epithelium"],
            answer: "It inhibits both type 1 and type 2 5-alpha reductase",
            explanation: "A classic pearl is that dutasteride inhibits both type 1 and type 2 5-alpha reductase, whereas finasteride is more selective.",
            objective: .moa,
            relatedDrugIds: ["d190"],
            tags: ["10a", "dutasteride", "moa"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_019",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A man taking dutasteride asks when he can donate blood again after stopping therapy. Which answer is best?",
            options: ["Wait at least 6 months after the last dose", "He can donate the next day", "He should never donate blood again", "He only needs to wait 48 hours", "He only needs to wait until urinary symptoms improve"],
            answer: "Wait at least 6 months after the last dose",
            explanation: "Patients are counseled not to donate blood during dutasteride therapy or for 6 months after stopping it to avoid exposing a pregnant transfusion recipient.",
            objective: .pearl,
            relatedDrugIds: ["d190"],
            tags: ["10a", "dutasteride", "blood_donation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_020",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A pharmacy technician notices that a dutasteride capsule is leaking. Which statement is most accurate?",
            options: ["Pregnant women should not handle leaking dutasteride capsules because the drug can be absorbed through the skin", "The medication becomes inactive once the capsule leaks", "Only men with BPH need to avoid touching it", "The main problem is urine discoloration", "Leaking capsules are safe to handle if they are cut in half"],
            answer: "Pregnant women should not handle leaking dutasteride capsules because the drug can be absorbed through the skin",
            explanation: "Dutasteride can be absorbed through the skin, so pregnant women should avoid handling leaking capsules because of fetal risk to a male fetus.",
            objective: .contraindication,
            relatedDrugIds: ["d190"],
            tags: ["10a", "dutasteride", "pregnancy", "handling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_021",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A patient took tadalafil yesterday and now presents with chest pain. Which nitrate-related pearl is most important before giving nitroglycerin?",
            options: ["Nitrates are contraindicated within 48 hours of tadalafil use", "Nitrates are safe 2 hours after tadalafil", "Tadalafil must be combined with nitrates for best effect", "The only concern is orange urine discoloration", "Nitrates interact with sildenafil but not tadalafil"],
            answer: "Nitrates are contraindicated within 48 hours of tadalafil use",
            explanation: "Tadalafil has a longer duration than sildenafil, and nitrates are contraindicated within 48 hours after the last tadalafil dose because of hypotension risk.",
            objective: .contraindication,
            relatedDrugIds: ["d194"],
            tags: ["10a", "tadalafil", "nitrates", "48_hours"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_022",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Mirabegron is the non-anticholinergic overactive bladder drug in this subsection that works through beta-3 stimulation. Which brand name matches mirabegron?",
            options: ["Myrbetriq", "Ditropan", "Vesicare", "Flomax", "Cialis"],
            answer: "Myrbetriq",
            explanation: "Mirabegron corresponds to the brand name Myrbetriq.",
            objective: .genericBrand,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_023",
            subsectionId: "10a",
            difficulty: .easy,
            question: "A patient wants to know why mirabegron is often discussed separately from oxybutynin and solifenacin in overactive bladder treatment. Which class best describes mirabegron?",
            options: ["Beta-3 agonist", "Anticholinergic", "PDE-5 inhibitor", "Alpha-1 blocker", "5-alpha reductase inhibitor"],
            answer: "Beta-3 agonist",
            explanation: "Mirabegron is a beta-3 agonist, not an anticholinergic.",
            objective: .classId,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "class"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_024",
            subsectionId: "10a",
            difficulty: .medium,
            question: "Mirabegron improves overactive bladder symptoms by helping the bladder hold urine better during the storage phase. Which mechanism best explains this?",
            options: ["Beta-3 stimulation relaxes the detrusor muscle", "Muscarinic blockade contracts the detrusor muscle", "Alpha-1 blockade shrinks the prostate", "PDE-5 inhibition reduces DHT", "Local urinary analgesia numbs the urethra"],
            answer: "Beta-3 stimulation relaxes the detrusor muscle",
            explanation: "Mirabegron activates beta-3 receptors, which relaxes the detrusor during bladder filling and helps reduce urgency and frequency.",
            objective: .moa,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "moa"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_025",
            subsectionId: "10a",
            difficulty: .medium,
            question: "Which description best matches the labeled adult use of mirabegron?",
            options: ["Overactive bladder with urgency, frequency, and urge urinary incontinence", "Stress urinary incontinence from pelvic floor weakness", "Acute bacterial cystitis as an antibiotic", "Benign prostatic hyperplasia as monotherapy for prostate shrinkage", "Erectile dysfunction after nitrate exposure"],
            answer: "Overactive bladder with urgency, frequency, and urge urinary incontinence",
            explanation: "Mirabegron is indicated for adult overactive bladder symptoms such as urgency, frequency, and urge urinary incontinence.",
            objective: .indication,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "oab"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_026",
            subsectionId: "10a",
            difficulty: .hard,
            question: "Mirabegron is often chosen when anticholinergic burden is a concern, but it brings a different monitoring issue. What should be watched closely?",
            options: ["Blood pressure", "PSA suppression", "Urine color", "Visual blue tint", "A1C"],
            answer: "Blood pressure",
            explanation: "Mirabegron can increase blood pressure, so blood pressure monitoring is a high-yield safety pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "bp", "monitoring"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_027",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A patient on metoprolol is started on mirabegron for overactive bladder. Which interaction pearl is most accurate?",
            options: ["Mirabegron is a moderate CYP2D6 inhibitor and can raise exposure to CYP2D6 substrates", "Mirabegron makes nitrates unsafe for 48 hours", "Mirabegron blocks digoxin absorption from the gut", "Mirabegron irreversibly lowers PSA by 50%", "Mirabegron turns the urine orange-red"],
            answer: "Mirabegron is a moderate CYP2D6 inhibitor and can raise exposure to CYP2D6 substrates",
            explanation: "Mirabegron is a moderate CYP2D6 inhibitor, so exposure to drugs such as metoprolol may rise and monitoring or dose adjustment may be needed.",
            objective: .interaction,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "cyp2d6"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_028",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A patient taking digoxin is started on mirabegron. Which management approach is most consistent with the label?",
            options: ["Start with the lowest digoxin dose and monitor serum digoxin concentrations", "Double the digoxin dose because mirabegron lowers levels", "Stop mirabegron permanently because the combination is absolutely contraindicated", "Separate the drugs by 12 hours to prevent urine staining", "No monitoring or dose consideration is needed"],
            answer: "Start with the lowest digoxin dose and monitor serum digoxin concentrations",
            explanation: "When mirabegron is combined with digoxin, the lowest digoxin dose should be considered initially and digoxin levels should be monitored.",
            objective: .interaction,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "digoxin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_029",
            subsectionId: "10a",
            difficulty: .medium,
            question: "An older adult with overactive bladder already has dry mouth, constipation, and mild cognitive complaints from other medications. Which bladder drug in this section is often attractive because it avoids adding classic anticholinergic burden?",
            options: ["Mirabegron", "Oxybutynin", "Solifenacin", "Phenazopyridine", "Tamsulosin"],
            answer: "Mirabegron",
            explanation: "Mirabegron is often favored when clinicians want to avoid additional anticholinergic burden from drugs such as oxybutynin or solifenacin.",
            objective: .pearl,
            relatedDrugIds: ["d192"],
            tags: ["10a", "mirabegron", "anticholinergic_burden"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_030",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Oxybutynin is a classic antimuscarinic used for overactive bladder. Which brand name matches oxybutynin?",
            options: ["Ditropan", "Myrbetriq", "Vesicare", "Flomax", "Avodart"],
            answer: "Ditropan",
            explanation: "Oxybutynin corresponds to the brand name Ditropan.",
            objective: .genericBrand,
            relatedDrugIds: ["d191"],
            tags: ["10a", "oxybutynin", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_031",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Oxybutynin improves urge symptoms in overactive bladder, but it is notorious for drying patients out. Which class best describes oxybutynin?",
            options: ["Anticholinergic (antimuscarinic)", "Beta-3 agonist", "Alpha-1 blocker", "PDE-5 inhibitor", "Urinary analgesic"],
            answer: "Anticholinergic (antimuscarinic)",
            explanation: "Oxybutynin is an anticholinergic antimuscarinic used for overactive bladder.",
            objective: .classId,
            relatedDrugIds: ["d191"],
            tags: ["10a", "oxybutynin", "class"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_032",
            subsectionId: "10a",
            difficulty: .medium,
            question: "Which mechanism best explains how oxybutynin helps overactive bladder symptoms?",
            options: ["It blocks muscarinic receptors and reduces involuntary bladder contractions", "It stimulates beta-3 receptors to relax the detrusor during storage", "It inhibits 5-alpha reductase to lower DHT", "It blocks alpha-1 receptors in the prostate", "It locally anesthetizes the bladder mucosa"],
            answer: "It blocks muscarinic receptors and reduces involuntary bladder contractions",
            explanation: "Oxybutynin works primarily through antimuscarinic effects that reduce involuntary bladder contractions; it also has direct antispasmodic activity on smooth muscle.",
            objective: .moa,
            relatedDrugIds: ["d191"],
            tags: ["10a", "oxybutynin", "moa"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_033",
            subsectionId: "10a",
            difficulty: .medium,
            question: "A patient started on oxybutynin for urgency develops dry mouth, constipation, blurred vision, and feels more mentally foggy. Which explanation is best?",
            options: ["These are classic anticholinergic adverse effects of oxybutynin", "The patient is experiencing PDE-5 inhibition", "This pattern suggests PSA suppression from a 5-alpha reductase inhibitor", "These effects are expected only with alpha-1 blockers", "Orange urine staining is the usual explanation"],
            answer: "These are classic anticholinergic adverse effects of oxybutynin",
            explanation: "Dry mouth, constipation, blurred vision, and cognitive adverse effects are classic anticholinergic problems with oxybutynin.",
            objective: .adverseEffect,
            relatedDrugIds: ["d191"],
            tags: ["10a", "oxybutynin", "adverse_effects"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_034",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A patient taking oxybutynin plans to spend the weekend doing intense outdoor work in hot weather. Which counseling point is most important?",
            options: ["Oxybutynin can reduce sweating and increase risk of heat prostration", "Oxybutynin turns sweat orange-red", "Oxybutynin must be taken with nitrates during heat exposure", "Oxybutynin prevents dehydration because it causes urinary retention", "There is no temperature-related concern with oxybutynin"],
            answer: "Oxybutynin can reduce sweating and increase risk of heat prostration",
            explanation: "Anticholinergic drugs such as oxybutynin can reduce sweating and increase the risk of heat prostration or heat stroke in hot environments.",
            objective: .pearl,
            relatedDrugIds: ["d191"],
            tags: ["10a", "oxybutynin", "heat"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_035",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Vesicare is another bladder antimuscarinic used for urgency and urge incontinence. What is the generic name of Vesicare?",
            options: ["Solifenacin", "Mirabegron", "Oxybutynin", "Phenazopyridine", "Tadalafil"],
            answer: "Solifenacin",
            explanation: "Vesicare is the brand name for solifenacin.",
            objective: .brandGeneric,
            relatedDrugIds: ["d275"],
            tags: ["10a", "solifenacin", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_036",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A patient with overactive bladder is taking ketoconazole and is being considered for solifenacin. Which pearl is most accurate?",
            options: ["With potent CYP3A4 inhibitors such as ketoconazole, solifenacin doses above 5 mg daily are not recommended", "Ketoconazole makes solifenacin a beta-3 agonist", "The combination is safe because solifenacin has no CYP-related issues", "Solifenacin must be doubled when used with ketoconazole", "Ketoconazole only interacts with tamsulosin, not solifenacin"],
            answer: "With potent CYP3A4 inhibitors such as ketoconazole, solifenacin doses above 5 mg daily are not recommended",
            explanation: "Solifenacin exposure increases with potent CYP3A4 inhibitors, so doses above 5 mg daily are not recommended with drugs such as ketoconazole.",
            objective: .interaction,
            relatedDrugIds: ["d275"],
            tags: ["10a", "solifenacin", "cyp3a4"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_037",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Phenazopyridine is the urinary analgesic patients often know by the brand Pyridium. Which brand name matches phenazopyridine?",
            options: ["Pyridium", "Vesicare", "Revatio", "Flomax", "Proscar"],
            answer: "Pyridium",
            explanation: "Phenazopyridine corresponds to the brand name Pyridium.",
            objective: .genericBrand,
            relatedDrugIds: ["d274"],
            tags: ["10a", "phenazopyridine", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_038",
            subsectionId: "10a",
            difficulty: .easy,
            question: "A patient with burning urination wants symptom relief while the antibiotic starts working. Which class best describes phenazopyridine?",
            options: ["Urinary analgesic", "Antibiotic beta-lactam", "Alpha-1 blocker", "Beta-3 agonist", "PDE-5 inhibitor"],
            answer: "Urinary analgesic",
            explanation: "Phenazopyridine is a urinary analgesic used for short-term symptomatic relief of dysuria.",
            objective: .classId,
            relatedDrugIds: ["d274"],
            tags: ["10a", "phenazopyridine", "class"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_039",
            subsectionId: "10a",
            difficulty: .medium,
            question: "A patient with a urinary tract infection thinks phenazopyridine is the medicine actually killing the bacteria because the symptoms feel better. Which response is best?",
            options: ["Phenazopyridine only relieves urinary pain symptoms; it is not an antibiotic", "Phenazopyridine is the main antibiotic and the other prescription is optional", "Phenazopyridine sterilizes the urine after one dose", "Phenazopyridine shrinks the prostate to cure the infection", "Phenazopyridine works by lowering bladder blood pressure"],
            answer: "Phenazopyridine only relieves urinary pain symptoms; it is not an antibiotic",
            explanation: "Phenazopyridine provides symptomatic relief of urinary burning and discomfort but does not treat the underlying infection.",
            objective: .pearl,
            relatedDrugIds: ["d274"],
            tags: ["10a", "phenazopyridine", "not_antibiotic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_040",
            subsectionId: "10a",
            difficulty: .easy,
            question: "A patient takes phenazopyridine for dysuria and then becomes alarmed that the urine looks orange-red. Which explanation is most accurate?",
            options: ["This is a classic expected discoloration from phenazopyridine", "This always means severe hematuria", "This proves the antibiotic is failing", "This indicates prostate cancer", "This shows tadalafil was taken too recently"],
            answer: "This is a classic expected discoloration from phenazopyridine",
            explanation: "Phenazopyridine commonly causes orange-red discoloration of the urine and can also stain fabrics or contact lenses.",
            objective: .adverseEffect,
            relatedDrugIds: ["d274"],
            tags: ["10a", "phenazopyridine", "urine_color"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_041",
            subsectionId: "10a",
            difficulty: .hard,
            question: "Phenazopyridine may help a patient feel better quickly, but how long should it usually be used when given along with an antibacterial for a UTI?",
            options: ["No more than 2 days", "At least 10 days", "Until the urine becomes clear again, even if that takes weeks", "Only as a once-monthly maintenance drug", "Indefinitely because it prevents recurrence"],
            answer: "No more than 2 days",
            explanation: "Phenazopyridine is generally limited to short-term use; when used with an antibacterial for a UTI, treatment should not exceed 2 days.",
            objective: .dosing,
            relatedDrugIds: ["d274"],
            tags: ["10a", "phenazopyridine", "2_days"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_042",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Viagra is the classic phosphodiesterase-5 inhibitor used for erectile dysfunction. What is the generic name of Viagra?",
            options: ["Sildenafil", "Tadalafil", "Tamsulosin", "Finasteride", "Mirabegron"],
            answer: "Sildenafil",
            explanation: "Viagra is the brand name for sildenafil.",
            objective: .brandGeneric,
            relatedDrugIds: ["d193"],
            tags: ["10a", "sildenafil", "brand->generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_043",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A man wants sildenafil for erectile dysfunction but he also uses nitroglycerin for angina. Which answer is best?",
            options: ["Sildenafil should not be combined with nitrates because severe hypotension can occur", "Sildenafil is preferred with nitrates because both increase perfusion", "Sildenafil is only contraindicated with antibiotics", "Sildenafil can be taken safely if he drinks extra water", "Sildenafil should be replaced with phenazopyridine"],
            answer: "Sildenafil should not be combined with nitrates because severe hypotension can occur",
            explanation: "Sildenafil and other PDE-5 inhibitors should not be combined with nitrates because potentially dangerous hypotension can result.",
            objective: .contraindication,
            relatedDrugIds: ["d193"],
            tags: ["10a", "sildenafil", "nitrates"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_044",
            subsectionId: "10a",
            difficulty: .easy,
            question: "Tadalafil is the longer-acting PDE-5 inhibitor in this section and is also used in men with BPH. Which brand name matches tadalafil?",
            options: ["Cialis", "Viagra", "Flomax", "Avodart", "Myrbetriq"],
            answer: "Cialis",
            explanation: "Tadalafil corresponds to the brand name Cialis.",
            objective: .genericBrand,
            relatedDrugIds: ["d194"],
            tags: ["10a", "tadalafil", "generic->brand"],
            source: .curated
        ),
        .multipleChoice(
            id: "q10a_add_045",
            subsectionId: "10a",
            difficulty: .hard,
            question: "A man has both erectile dysfunction and bothersome BPH symptoms and asks whether one medication might help both problems. Which option from this subsection best fits that goal?",
            options: ["Tadalafil", "Sildenafil", "Phenazopyridine", "Solifenacin", "Mirabegron"],
            answer: "Tadalafil",
            explanation: "Tadalafil is a PDE-5 inhibitor with a labeled role in erectile dysfunction and BPH, making it a classic one-drug option when those problems coexist.",
            objective: .mixedReview,
            relatedDrugIds: ["d194"],
            tags: ["10a", "tadalafil", "bph", "ed", "mixed_review"],
            source: .curated
        )
    ]
}
