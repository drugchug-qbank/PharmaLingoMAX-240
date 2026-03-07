// PharmaLingo — Antibiotic Strategy & Big Buckets
// Curated Add-On Question Pack (45 questions)
// IDs: q6a_add_001 ... q6a_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 6a is a review-only strategy/mastery subsection in the outline.
// - These questions should be appended AFTER the app auto-builds the mastery pool in DrugDataService.init().
// - This pack mirrors the integration pattern used for earlier mastery-style sections.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) In DrugDataService.init(), inside the mastery-generation loop:
//        for sub in mod.subsections where sub.isMasteryQuiz { ... }
//    immediately after:
//        bank[sub.id] = mastery
//    append:
//        if sub.id == Self.antibioticStrategySubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_6aStrategy)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across Module 6 with a few earlier-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    static let antibioticStrategySubsectionId: String = "6a"

    static let curatedAddOnQuestions_6aStrategy: [Question] = [
        .multipleChoice(
            id: "q6a_add_001",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "When learners see amoxicillin, penicillin V, or piperacillin/tazobactam, they should place them in the beta-lactam bucket. What shared mechanism best explains that bucket?",
            options: ["Inhibition of bacterial cell wall synthesis", "Binding the 50S ribosomal subunit", "Inhibition of DNA gyrase/topoisomerase", "Sequential blockade of folate synthesis", "Inhibition of fungal ergosterol synthesis"],
            answer: "Inhibition of bacterial cell wall synthesis",
            explanation: "Beta-lactams all work by interfering with bacterial cell wall synthesis, which is why penicillins and cephalosporins are grouped together as the classic cell-wall antibiotics.",
            objective: .moa,
            relatedDrugIds: ["d98", "d100", "d240"],
            tags: ["Mastery", "6a", "beta-lactam", "cell wall"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_002",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Augmentin is high yield because it pairs an aminopenicillin with a beta-lactamase inhibitor, making it more useful for bite wounds and beta-lactamase-producing organisms. What is the generic name of Augmentin?",
            options: ["Amoxicillin/Clavulanate", "Piperacillin/Tazobactam", "Trimethoprim/Sulfamethoxazole", "Amoxicillin", "Cefuroxime"],
            answer: "Amoxicillin/Clavulanate",
            explanation: "Augmentin is the brand name for amoxicillin/clavulanate. The clavulanate piece is the beta-lactamase inhibitor that expands amoxicillin's usefulness.",
            objective: .brandGeneric,
            relatedDrugIds: ["d99"],
            tags: ["Mastery", "6a", "Augmentin", "amoxicillin-clavulanate"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_003",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "In amoxicillin/clavulanate, what is the main job of clavulanate?",
            options: ["It inhibits bacterial beta-lactamases", "It blocks the 30S ribosomal subunit", "It prevents renal excretion of amoxicillin", "It directly kills C. difficile in the colon", "It reverses penicillin allergy"],
            answer: "It inhibits bacterial beta-lactamases",
            explanation: "Clavulanate is a beta-lactamase inhibitor. It is added to protect amoxicillin from enzymatic destruction rather than to serve as the main antibiotic by itself.",
            objective: .moa,
            relatedDrugIds: ["d99"],
            tags: ["Mastery", "6a", "clavulanate", "beta-lactamase"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_004",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "A hospitalized patient with suspected intra-abdominal sepsis needs a broad IV beta-lactam that also covers Pseudomonas. Which brand corresponds to piperacillin/tazobactam?",
            options: ["Zosyn", "Augmentin", "Rocephin", "Keflex", "Maxipime"],
            answer: "Zosyn",
            explanation: "Piperacillin/tazobactam is Zosyn, the broad IV penicillin/beta-lactamase-inhibitor combination classically associated with hospital infections and Pseudomonas coverage.",
            objective: .genericBrand,
            relatedDrugIds: ["d100"],
            tags: ["Mastery", "6a", "Zosyn", "piperacillin-tazobactam"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_005",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Cephalexin is a first-generation cephalosporin often used when you want strong outpatient gram-positive skin coverage with simple oral dosing. Which brand name matches cephalexin?",
            options: ["Keflex", "Ceftin", "Omnicef", "Rocephin", "Biaxin"],
            answer: "Keflex",
            explanation: "Cephalexin is sold as Keflex. It is the classic oral first-generation cephalosporin remembered for skin infections, uncomplicated UTI, and strep pharyngitis.",
            objective: .genericBrand,
            relatedDrugIds: ["d101"],
            tags: ["Mastery", "6a", "cephalexin", "Keflex"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_006",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Ceftriaxone is remembered as the IM/IV cephalosporin used for meningitis, pneumonia, and uncomplicated gonorrhea, often with once-daily dosing. Which brand is ceftriaxone?",
            options: ["Rocephin", "Maxipime", "Ceftin", "Omnicef", "Vancocin"],
            answer: "Rocephin",
            explanation: "Ceftriaxone is Rocephin. It is a high-yield third-generation cephalosporin with common use in meningitis, gonorrhea, and other serious community infections.",
            objective: .genericBrand,
            relatedDrugIds: ["d102"],
            tags: ["Mastery", "6a", "ceftriaxone", "Rocephin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_007",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "Ceftriaxone teaches an important neonatal caution. In which patient should it be avoided because of precipitation risk with calcium-containing IV solutions?",
            options: ["A neonate who requires calcium-containing IV fluids", "An adult with sulfa allergy", "A teenager with acne", "An adult with bacterial conjunctivitis", "A patient taking an iron supplement by mouth"],
            answer: "A neonate who requires calcium-containing IV fluids",
            explanation: "Ceftriaxone is high yield for its neonatal calcium warning. The classic patient to avoid it in is a neonate who needs calcium-containing IV solutions because of precipitation risk.",
            objective: .contraindication,
            relatedDrugIds: ["d102"],
            tags: ["Mastery", "6a", "ceftriaxone", "neonate", "calcium"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_008",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "Cefepime is a fourth-generation cephalosporin chosen when you need serious gram-negative coverage including Pseudomonas, but dosing mistakes can cause a classic toxicity. Which toxicity is most associated with cefepime, especially in renal impairment?",
            options: ["Neurotoxicity with encephalopathy or seizures", "Ototoxicity after a single dose", "Permanent tooth discoloration", "A disulfiram-like reaction with alcohol", "Red man syndrome during infusion"],
            answer: "Neurotoxicity with encephalopathy or seizures",
            explanation: "Cefepime is high yield for neurotoxicity, particularly when renal dysfunction leads to unadjusted dosing. Learners should immediately connect cefepime plus renal impairment with encephalopathy or seizures.",
            objective: .adverseEffect,
            relatedDrugIds: ["d103"],
            tags: ["Mastery", "6a", "cefepime", "neurotoxicity", "renal"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_009",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "A five-day Z-Pack teaches two pearls at once: azithromycin is a macrolide, and its long tissue half-life allows short-course dosing. What is the generic name of Zithromax?",
            options: ["Azithromycin", "Clarithromycin", "Erythromycin", "Levofloxacin", "Doxycycline"],
            answer: "Azithromycin",
            explanation: "Zithromax, often remembered as the Z-Pack, is azithromycin. The short course helps students remember its long tissue half-life.",
            objective: .brandGeneric,
            relatedDrugIds: ["d106"],
            tags: ["Mastery", "6a", "azithromycin", "Z-Pack"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_010",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Macrolides such as azithromycin, clarithromycin, and erythromycin are grouped together partly because they share the same ribosomal target. Which mechanism best describes that class?",
            options: ["They bind the 50S ribosomal subunit and inhibit protein synthesis", "They inhibit bacterial cell wall synthesis", "They inhibit DNA gyrase and topoisomerase", "They block folate synthesis in sequence", "They disrupt fungal cell membranes by binding ergosterol"],
            answer: "They bind the 50S ribosomal subunit and inhibit protein synthesis",
            explanation: "Macrolides are the classic 50S protein-synthesis inhibitors in this module. That mechanism helps connect azithromycin, clarithromycin, and erythromycin into one therapeutic bucket.",
            objective: .moa,
            relatedDrugIds: ["d106", "d107", "d230"],
            tags: ["Mastery", "6a", "macrolide", "50S"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_011",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "Clarithromycin shows up in H. pylori regimens and teaches a memorable adverse-effect and interaction pattern. Which statement is most accurate?",
            options: ["It can cause a metallic taste and is a strong CYP3A4 inhibitor", "It has no meaningful drug interactions because it is not hepatically metabolized", "It is the safest macrolide to combine with simvastatin", "It is the first-line drug for uncomplicated cystitis because it concentrates in urine", "It is used orally to treat C. difficile because it stays in the gut"],
            answer: "It can cause a metallic taste and is a strong CYP3A4 inhibitor",
            explanation: "Clarithromycin is high yield for two reasons: metallic taste and clinically important CYP3A4 inhibition. Those interaction problems are often more testable than the infection itself.",
            objective: .interaction,
            relatedDrugIds: ["d107"],
            tags: ["Mastery", "6a", "clarithromycin", "CYP3A4", "metallic taste"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_012",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Doxycycline is a tetracycline used for acne, Lyme disease, chlamydia, and some MRSA skin infections. Which counseling point best reduces the risk of pill esophagitis?",
            options: ["Take it with a full glass of water and stay upright after the dose", "Crush it and take it right before lying down", "Take it only with milk to protect the stomach", "Avoid all fluids for 30 minutes after dosing", "Take it together with an iron supplement for better absorption"],
            answer: "Take it with a full glass of water and stay upright after the dose",
            explanation: "Doxycycline can irritate the esophagus. The classic teaching pearl is to take it with plenty of water and remain upright rather than swallowing it and going straight to bed.",
            objective: .pearl,
            relatedDrugIds: ["d108"],
            tags: ["Mastery", "6a", "doxycycline", "esophagitis", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_013",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Tetracyclines are famous for a developmental toxicity that helps explain why they are generally avoided during tooth development. What is that toxicity?",
            options: ["Permanent tooth discoloration", "Tendon rupture", "Red man syndrome", "Severe hyperkalemia", "Bile precipitation with calcium"],
            answer: "Permanent tooth discoloration",
            explanation: "Doxycycline and other tetracyclines are classically associated with tooth discoloration during tooth development. That pearl is one of the fastest ways to identify the tetracycline class.",
            objective: .contraindication,
            relatedDrugIds: ["d108"],
            tags: ["Mastery", "6a", "doxycycline", "tooth discoloration"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_014",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Fluoroquinolones such as ciprofloxacin, levofloxacin, and moxifloxacin are grouped together because they attack the same bacterial target. Which mechanism is correct?",
            options: ["Inhibition of DNA gyrase and topoisomerase", "Inhibition of bacterial cell wall synthesis", "Binding the 50S ribosomal subunit", "Sequential blockade of folate synthesis", "Binding D-Ala-D-Ala on peptidoglycan precursors"],
            answer: "Inhibition of DNA gyrase and topoisomerase",
            explanation: "Fluoroquinolones work by inhibiting bacterial DNA replication through DNA gyrase and topoisomerase. That mechanism is the core pharmacology bucket for ciprofloxacin, levofloxacin, and moxifloxacin.",
            objective: .moa,
            relatedDrugIds: ["d104", "d105", "d234"],
            tags: ["Mastery", "6a", "fluoroquinolone", "DNA gyrase"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_015",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Ciprofloxacin is often chosen for certain gram-negative UTIs and Pseudomonas, but oral absorption is easy to sabotage with one common outpatient mistake. What is that mistake?",
            options: ["Taking it with calcium, iron, or antacids at the same time", "Taking it with food", "Taking it in the morning", "Taking it with a full glass of water", "Taking it after exercise"],
            answer: "Taking it with calcium, iron, or antacids at the same time",
            explanation: "Ciprofloxacin chelates with divalent and trivalent cations. Antacids, calcium, iron, and similar products can markedly reduce absorption if taken too close to the dose.",
            objective: .interaction,
            relatedDrugIds: ["d104"],
            tags: ["Mastery", "6a", "ciprofloxacin", "chelation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_016",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "Moxifloxacin is a respiratory fluoroquinolone that also brings anaerobic coverage, which is why it sometimes stands out from ciprofloxacin. Which pearl best matches moxifloxacin?",
            options: ["It usually does not require renal dose adjustment", "It is preferred for uncomplicated cystitis because of very high urinary levels", "It has no QT prolongation risk", "It is the safest fluoroquinolone in myasthenia gravis", "It is the best oral agent for thrush"],
            answer: "It usually does not require renal dose adjustment",
            explanation: "Moxifloxacin stands out among common fluoroquinolones because it is a respiratory fluoroquinolone with anaerobic coverage and generally does not need renal dose adjustment.",
            objective: .pearl,
            relatedDrugIds: ["d234"],
            tags: ["Mastery", "6a", "moxifloxacin", "renal dosing"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_017",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "Levofloxacin is useful for CAP and other infections, but the boxed warning still highlights one neuromuscular contraindication. Which history makes levofloxacin a poor choice?",
            options: ["Myasthenia gravis", "Iron deficiency anemia", "Hypothyroidism", "Seasonal allergies", "Open-angle glaucoma"],
            answer: "Myasthenia gravis",
            explanation: "Fluoroquinolones, including levofloxacin, may worsen muscle weakness in myasthenia gravis. That is a classic boxed-warning style contraindication pearl for the class.",
            objective: .contraindication,
            relatedDrugIds: ["d105"],
            tags: ["Mastery", "6a", "levofloxacin", "myasthenia gravis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_018",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Bactrim is a high-yield outpatient antibiotic because it covers uncomplicated UTI, some MRSA skin infections, and PJP prophylaxis. Which generic name corresponds to Bactrim?",
            options: ["Trimethoprim/Sulfamethoxazole", "Nitrofurantoin", "Linezolid", "Amoxicillin/Clavulanate", "Doxycycline"],
            answer: "Trimethoprim/Sulfamethoxazole",
            explanation: "Bactrim is trimethoprim/sulfamethoxazole, the classic sulfonamide combination remembered for UTI, MRSA skin coverage, PJP prophylaxis, rash risk, and hyperkalemia.",
            objective: .brandGeneric,
            relatedDrugIds: ["d109"],
            tags: ["Mastery", "6a", "Bactrim", "TMP-SMX"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_019",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Trimethoprim/sulfamethoxazole is memorable because its two components block folate synthesis sequentially. Which mechanism best describes that strategy?",
            options: ["Sequential inhibition of bacterial folate synthesis", "Binding the 50S ribosomal subunit", "Disruption of fungal ergosterol synthesis", "Direct inhibition of peptidoglycan cross-linking", "Inactivation of bacterial DNA by free radicals only in anaerobes"],
            answer: "Sequential inhibition of bacterial folate synthesis",
            explanation: "TMP/SMX combines two drugs that hit folate synthesis at different steps. That sequential folate blockade is the defining mechanism of the combination.",
            objective: .moa,
            relatedDrugIds: ["d109"],
            tags: ["Mastery", "6a", "TMP-SMX", "folate"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_020",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "A patient already taking lisinopril and spironolactone is started on Bactrim for an uncomplicated UTI. Which laboratory problem should you worry about most?",
            options: ["Hyperkalemia", "Severe hypocalcemia", "Metabolic alkalosis", "Hypernatremia", "Hypophosphatemia"],
            answer: "Hyperkalemia",
            explanation: "Trimethoprim can push potassium up, so Bactrim becomes especially risky in a patient already taking other potassium-raising drugs such as lisinopril and spironolactone.",
            objective: .interaction,
            relatedDrugIds: ["d109", "d1", "d20"],
            tags: ["Mastery", "6a", "Bactrim", "hyperkalemia", "lisinopril", "spironolactone"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_021",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "IV vancomycin remains a workhorse for serious MRSA and other resistant gram-positive infections, but the infusion itself can trigger a classic reaction. Which adverse effect fits rapid IV vancomycin infusion?",
            options: ["Red man syndrome with flushing and pruritus", "Tendon rupture", "Permanent tooth discoloration", "Disulfiram-like reaction with alcohol", "Esophageal ulceration"],
            answer: "Red man syndrome with flushing and pruritus",
            explanation: "Rapid IV vancomycin infusion can cause red man syndrome, classically remembered as upper-body flushing and pruritus that improve when the infusion is slowed.",
            objective: .adverseEffect,
            relatedDrugIds: ["d110"],
            tags: ["Mastery", "6a", "vancomycin IV", "red man"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_022",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Students often confuse the two vancomycin routes. Which statement best teaches the difference?",
            options: ["Oral vancomycin is for C. difficile colitis because it stays in the gut, whereas IV vancomycin is used for systemic MRSA infections", "Oral vancomycin is preferred for bacteremia because it reaches higher serum levels", "IV vancomycin is first-line for uncomplicated cystitis because it concentrates in urine", "Both oral and IV vancomycin are interchangeable for pneumonia", "Oral vancomycin is mainly used for viral gastroenteritis"],
            answer: "Oral vancomycin is for C. difficile colitis because it stays in the gut, whereas IV vancomycin is used for systemic MRSA infections",
            explanation: "The route distinction is one of the most important vancomycin pearls in pharmacology. Oral vancomycin stays in the GI tract, while IV vancomycin is for systemic infections.",
            objective: .pearl,
            relatedDrugIds: ["d110", "d111"],
            tags: ["Mastery", "6a", "vancomycin", "route distinction"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_023",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Zyvox is useful because it covers VRE and can also be used for MRSA pneumonia when you need an alternative to vancomycin. What is the generic name of Zyvox?",
            options: ["Linezolid", "Daptomycin", "Vancomycin", "Clindamycin", "Ciprofloxacin"],
            answer: "Linezolid",
            explanation: "Zyvox is linezolid, the oxazolidinone class drug remembered for VRE coverage, MRSA pneumonia use, myelosuppression, and serotonin syndrome risk.",
            objective: .brandGeneric,
            relatedDrugIds: ["d112"],
            tags: ["Mastery", "6a", "linezolid", "Zyvox"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_024",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Linezolid can suppress the bone marrow, especially with longer courses. What monitoring pearl is highest yield?",
            options: ["Check a CBC weekly", "Check serum uric acid daily", "Monitor INR only", "Check TSH monthly", "Check amylase after each dose"],
            answer: "Check a CBC weekly",
            explanation: "Because linezolid can cause thrombocytopenia and other blood-count problems, weekly CBC monitoring is the classic high-yield monitoring pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d112"],
            tags: ["Mastery", "6a", "linezolid", "CBC"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_025",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "A patient taking sertraline is prescribed linezolid for a resistant infection. Which complication should immediately come to mind?",
            options: ["Serotonin syndrome", "Tendon rupture", "Red man syndrome", "Nephrolithiasis", "Severe hypoglycemia"],
            answer: "Serotonin syndrome",
            explanation: "Linezolid has weak MAOI activity, so combining it with serotonergic drugs such as sertraline can precipitate serotonin syndrome. That interaction is tested constantly because it crosses modules.",
            objective: .interaction,
            relatedDrugIds: ["d112", "d74"],
            tags: ["Mastery", "6a", "linezolid", "sertraline", "serotonin syndrome"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_026",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Daptomycin is powerful for MRSA bacteremia and right-sided endocarditis, but there is one infection site where it should not be used. Which is it?",
            options: ["Pneumonia", "Cellulitis", "Bacteremia", "Right-sided endocarditis", "Complicated skin infection"],
            answer: "Pneumonia",
            explanation: "Daptomycin is not used for pneumonia. That \"not for pneumonia\" pearl is one of the fastest ways to distinguish it from linezolid or vancomycin.",
            objective: .contraindication,
            relatedDrugIds: ["d113"],
            tags: ["Mastery", "6a", "daptomycin", "pneumonia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_027",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "A patient taking rosuvastatin is started on daptomycin for MRSA bacteremia. Which monitoring issue becomes especially important?",
            options: ["CPK and muscle symptoms", "TSH", "INR", "Serum bicarbonate", "Amylase"],
            answer: "CPK and muscle symptoms",
            explanation: "Daptomycin can injure muscle, and the risk matters even more when the patient is also taking a statin. Weekly CPK monitoring and counseling about muscle pain are high yield.",
            objective: .monitoring,
            relatedDrugIds: ["d113", "d28"],
            tags: ["Mastery", "6a", "daptomycin", "CPK", "rosuvastatin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_028",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Clindamycin is valued for anaerobic coverage and good bone penetration, but it is also famous for one high-yield complication. Which complication is it?",
            options: ["Clostridioides difficile colitis", "Optic neuritis", "Severe hyperkalemia", "Tendon rupture", "Biliary precipitation"],
            answer: "Clostridioides difficile colitis",
            explanation: "Clindamycin is one of the classic antibiotics associated with C. difficile-associated diarrhea, which is why many learners remember it as the \"great anaerobe with the great C. diff risk.\"",
            objective: .adverseEffect,
            relatedDrugIds: ["d229"],
            tags: ["Mastery", "6a", "clindamycin", "C diff"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_029",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Flagyl is a classic anaerobe drug that students remember because one simple counseling point can prevent a miserable reaction. What is that point?",
            options: ["Avoid alcohol during treatment and for at least 3 days after", "Take it only with dairy products", "Avoid all sunlight for one month", "Separate it from calcium by four hours", "Stop all fluids for 30 minutes after each dose"],
            answer: "Avoid alcohol during treatment and for at least 3 days after",
            explanation: "Metronidazole is high yield for the alcohol interaction pearl. Patients should avoid alcohol during treatment and for at least three days after finishing therapy.",
            objective: .interaction,
            relatedDrugIds: ["d233"],
            tags: ["Mastery", "6a", "metronidazole", "alcohol"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_030",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Nitrofurantoin is a great example of a drug whose usefulness depends on where it concentrates in the body. Which infection is it best suited to treat?",
            options: ["Acute uncomplicated cystitis confined to the bladder", "Pyelonephritis with flank pain and fever", "Meningitis", "Community-acquired pneumonia", "Bacteremia"],
            answer: "Acute uncomplicated cystitis confined to the bladder",
            explanation: "Nitrofurantoin concentrates in the urine and is best for uncomplicated cystitis. It is not the right choice for tissue-invasive infection such as pyelonephritis or bacteremia.",
            objective: .indication,
            relatedDrugIds: ["d236"],
            tags: ["Mastery", "6a", "nitrofurantoin", "cystitis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_031",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Macrobid is high yield because it is commonly used for uncomplicated cystitis but not for tissue-invasive infection. What is the generic name of Macrobid?",
            options: ["Nitrofurantoin", "Trimethoprim/Sulfamethoxazole", "Ciprofloxacin", "Cefdinir", "Oseltamivir"],
            answer: "Nitrofurantoin",
            explanation: "Macrobid is nitrofurantoin, the nitrofuran class agent that is classically remembered as a bladder-focused antibiotic rather than a systemic one.",
            objective: .brandGeneric,
            relatedDrugIds: ["d236"],
            tags: ["Mastery", "6a", "Macrobid", "nitrofurantoin"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_032",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Nystatin teaches a route pearl every pharmacy learner should know. Which instruction best matches oral nystatin for thrush?",
            options: ["Swish it in the mouth before swallowing because it acts locally and is not meaningfully absorbed systemically", "Swallow one tablet weekly with a fatty meal", "Infuse it IV slowly over at least one hour", "Take it with alcohol to improve oral absorption", "Avoid drinking any water for 12 hours after the dose"],
            answer: "Swish it in the mouth before swallowing because it acts locally and is not meaningfully absorbed systemically",
            explanation: "Nystatin is high yield for its local action. For oral thrush, the suspension is used in the mouth so it can directly contact the Candida rather than relying on systemic absorption.",
            objective: .pearl,
            relatedDrugIds: ["d237"],
            tags: ["Mastery", "6a", "nystatin", "oral thrush"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_033",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Diflucan is an azole antifungal commonly chosen for candidiasis and remembered for good oral bioavailability and CNS penetration. Which generic name is Diflucan?",
            options: ["Fluconazole", "Ketoconazole", "Terbinafine", "Nystatin", "Metronidazole"],
            answer: "Fluconazole",
            explanation: "Diflucan is fluconazole, the azole most learners remember for Candida infections, oral therapy, and good CNS penetration.",
            objective: .brandGeneric,
            relatedDrugIds: ["d231"],
            tags: ["Mastery", "6a", "Diflucan", "fluconazole"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_034",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "A patient on warfarin develops oral candidiasis and is given fluconazole. Which anticoagulation problem is most likely?",
            options: ["The INR rises and bleeding risk increases", "The INR falls dramatically and thrombosis becomes the main concern", "Warfarin is neutralized immediately so bridging is mandatory", "Heparin-induced thrombocytopenia develops", "Red man syndrome becomes likely"],
            answer: "The INR rises and bleeding risk increases",
            explanation: "Fluconazole is a classic interaction drug with warfarin. The practical concern is a rising INR and increased bleeding risk, so close monitoring or dose adjustment is often needed.",
            objective: .interaction,
            relatedDrugIds: ["d231", "d41"],
            tags: ["Mastery", "6a", "fluconazole", "warfarin", "INR"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_035",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Terbinafine is usually the oral first-line drug for onychomycosis, which makes one lab-based counseling point especially high yield. What should be monitored?",
            options: ["Liver function tests", "Serum potassium", "INR daily", "TSH", "CPK weekly"],
            answer: "Liver function tests",
            explanation: "Oral terbinafine is high yield for onychomycosis and for hepatotoxicity counseling, which is why liver monitoring is a common pearl tied to this drug.",
            objective: .monitoring,
            relatedDrugIds: ["d242"],
            tags: ["Mastery", "6a", "terbinafine", "onychomycosis", "LFT"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_036",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Acyclovir is a go-to antiviral for HSV and VZV, but a classic precaution helps reduce kidney injury. Which counseling point fits best?",
            options: ["Maintain good hydration", "Take it with calcium-rich meals", "Avoid all sunlight", "Never take it with food", "Drink grapefruit juice with every dose"],
            answer: "Maintain good hydration",
            explanation: "Acyclovir can precipitate kidney injury, especially with dehydration or rapid IV administration. Adequate hydration is one of the classic pearls attached to the drug.",
            objective: .pearl,
            relatedDrugIds: ["d226"],
            tags: ["Mastery", "6a", "acyclovir", "hydration", "renal"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_037",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Valacyclovir is essentially an oral delivery upgrade for acyclovir. What is the key practical advantage?",
            options: ["Better oral bioavailability, so dosing can be less frequent", "It is topical only, so it avoids systemic effects", "It has no renal considerations at all", "It is first-line for bacterial conjunctivitis", "It lacks activity against varicella-zoster virus"],
            answer: "Better oral bioavailability, so dosing can be less frequent",
            explanation: "Valacyclovir is the prodrug of acyclovir. The high-yield practical difference is better oral bioavailability and therefore less frequent dosing.",
            objective: .pearl,
            relatedDrugIds: ["d244", "d226"],
            tags: ["Mastery", "6a", "valacyclovir", "acyclovir", "bioavailability"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_038",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .easy,
            question: "Tamiflu is most useful when started early in influenza. What time window is classically taught for greatest benefit?",
            options: ["Within 48 hours of symptom onset", "Within 12 hours only", "After 7 days of symptoms", "Only after antibiotics fail", "Timing does not matter"],
            answer: "Within 48 hours of symptom onset",
            explanation: "Oseltamivir works best when started early. The classic teaching pearl is to begin treatment within 48 hours of symptom onset whenever possible.",
            objective: .dosing,
            relatedDrugIds: ["d239"],
            tags: ["Mastery", "6a", "oseltamivir", "Tamiflu", "48 hours"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_039",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Bacterial conjunctivitis is often treated with a topical antibiotic so exposure stays where the infection is. Which ophthalmic drug in this module is commonly used first-line for bacterial pink eye?",
            options: ["Polymyxin B/Trimethoprim", "Nitrofurantoin", "Vancomycin (oral)", "Nystatin", "Oseltamivir"],
            answer: "Polymyxin B/Trimethoprim",
            explanation: "Polymyxin B/trimethoprim ophthalmic solution is the classic Polytrim \"pink eye\" drug in this bank, which makes it a useful route-and-indication pairing to remember.",
            objective: .indication,
            relatedDrugIds: ["d241"],
            tags: ["Mastery", "6a", "Polytrim", "conjunctivitis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_040",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "When the tympanic membrane is perforated, some otic antibiotics are avoided because of ototoxicity concerns. Which fluoroquinolone drop is remembered as safe in that situation?",
            options: ["Ofloxacin", "Tobramycin", "Polymyxin B/Trimethoprim", "Clindamycin", "Cefdinir"],
            answer: "Ofloxacin",
            explanation: "Ofloxacin otic is high yield because it is remembered as a fluoroquinolone drop that can be used when the tympanic membrane is perforated.",
            objective: .pearl,
            relatedDrugIds: ["d238"],
            tags: ["Mastery", "6a", "ofloxacin", "otic", "perforated TM"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_041",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "A parent notices brick-red stools after a child starts cefdinir for otitis media and is also taking iron. Which explanation is best?",
            options: ["Cefdinir can form a harmless nonabsorbable complex with iron that turns stools red", "The child has GI bleeding until proven otherwise", "Cefdinir always causes hematuria instead of stool color change", "This proves Clostridioides difficile colitis", "Iron completely inactivates cefdinir so the dose should be doubled"],
            answer: "Cefdinir can form a harmless nonabsorbable complex with iron that turns stools red",
            explanation: "Cefdinir plus iron is a classic pediatric counseling pearl. The red stool color can look alarming but is usually due to a harmless complex in the GI tract.",
            objective: .interaction,
            relatedDrugIds: ["d227"],
            tags: ["Mastery", "6a", "cefdinir", "iron", "red stools"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_042",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "Paxlovid is brand-name nirmatrelvir/ritonavir, and ritonavir turns it into an interaction minefield. Which medication from earlier modules would raise the biggest immediate concern because of strong CYP3A inhibition?",
            options: ["Simvastatin", "Levothyroxine", "Aspirin", "Nitroglycerin sublingual", "Metformin"],
            answer: "Simvastatin",
            explanation: "Ritonavir is a strong CYP3A inhibitor, so simvastatin is a classic \"stop and think\" interaction. This is exactly the type of cross-module medication-review pearl students should know.",
            objective: .interaction,
            relatedDrugIds: ["d235", "d29"],
            tags: ["Mastery", "6a", "Paxlovid", "simvastatin", "CYP3A4"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_043",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "A patient on simvastatin is prescribed clarithromycin for H. pylori. Why is this combination high yield to flag?",
            options: ["Clarithromycin can raise simvastatin levels and increase myopathy or rhabdomyolysis risk", "Clarithromycin reverses the LDL-lowering effect of statins after one dose", "The combination causes red man syndrome", "The combination blocks folate synthesis and causes megaloblastic anemia", "The combination causes permanent tooth discoloration"],
            answer: "Clarithromycin can raise simvastatin levels and increase myopathy or rhabdomyolysis risk",
            explanation: "Clarithromycin is a strong CYP3A4 inhibitor, so simvastatin exposure can rise substantially. The board-style consequence is myopathy or rhabdomyolysis risk.",
            objective: .interaction,
            relatedDrugIds: ["d107", "d29"],
            tags: ["Mastery", "6a", "clarithromycin", "simvastatin", "rhabdomyolysis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_044",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .hard,
            question: "A patient taking amiodarone needs an antibiotic, and you want to avoid stacking QT risk. Which option from Module 6 is the one most associated with meaningful QT prolongation concern?",
            options: ["Azithromycin", "Amoxicillin", "Cephalexin", "Penicillin V", "Nitrofurantoin"],
            answer: "Azithromycin",
            explanation: "Azithromycin is one of the classic outpatient antibiotics associated with QT prolongation concern, so it deserves extra caution in a patient already taking a QT-prolonging antiarrhythmic such as amiodarone.",
            objective: .interaction,
            relatedDrugIds: ["d106", "d68"],
            tags: ["Mastery", "6a", "azithromycin", "QT", "amiodarone"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6a_add_045",
            subsectionId: DrugDataService.antibioticStrategySubsectionId,
            difficulty: .medium,
            question: "Antibiotic strategy is often about choosing the narrowest reasonable agent once the bug and site are clear. In an otherwise healthy adult with confirmed strep pharyngitis and no allergy, which option is the most appropriately narrow oral choice?",
            options: ["Penicillin V", "Cefepime", "Linezolid", "Piperacillin/Tazobactam", "Moxifloxacin"],
            answer: "Penicillin V",
            explanation: "Penicillin V is the classic narrow oral choice for confirmed strep pharyngitis in a patient without allergy. This question reinforces the \"narrow when you can\" stewardship mindset rather than always reaching for broad-spectrum agents.",
            objective: .mixedReview,
            relatedDrugIds: ["d240"],
            tags: ["Mastery", "6a", "penicillin V", "stewardship", "strep pharyngitis"],
            source: .curated
        ),
    ]
}
