// PharmaLingo — Mastering Infectious Disease
// Curated Add-On Question Pack (45 questions)
// IDs: q6f_add_001 ... q6f_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 6f is a review-only mastery subsection in the outline and current repo.
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
//        if sub.id == Self.masteringInfectiousDiseaseSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_6fMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 6a–6e with a few earlier-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 6 mastery quiz.
    static let masteringInfectiousDiseaseSubsectionId: String = "6f"

    static let curatedAddOnQuestions_6fMastery: [Question] = [
        .multipleChoice(
            id: "q6f_add_001",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "A patient comes in after a dog bite. You want an oral beta-lactam that teaches why adding a beta-lactamase inhibitor matters for bite wounds. Which drug best fits?",
            options: ["Amoxicillin", "Amoxicillin/Clavulanate", "Cephalexin", "Penicillin V", "Cefdinir"],
            answer: "Amoxicillin/Clavulanate",
            explanation: "Amoxicillin/clavulanate is the classic oral choice that teaches how clavulanate expands amoxicillin coverage by inhibiting beta-lactamases, which matters for many bite-wound organisms.",
            objective: .indication,
            relatedDrugIds: ["d99", "d98"],
            tags: ["Mastery", "6f", "Augmentin", "bite wound", "beta-lactamase inhibitor"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_002",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Augmentin is often used when amoxicillin alone might be too narrow. Which ingredient in Augmentin is the beta-lactamase inhibitor?",
            options: ["Amoxicillin", "Clavulanate", "Tazobactam", "Cefuroxime", "Doxycycline"],
            answer: "Clavulanate",
            explanation: "Clavulanate is the beta-lactamase inhibitor paired with amoxicillin in Augmentin. It protects the aminopenicillin from enzymatic breakdown and broadens practical coverage.",
            objective: .moa,
            relatedDrugIds: ["d99"],
            tags: ["Mastery", "6f", "Augmentin", "clavulanate", "BLI"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_003",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "A teenager with infectious mononucleosis is given an aminopenicillin and then develops a diffuse rash. Which drug from this module is the classic teaching example?",
            options: ["Cephalexin", "Azithromycin", "Amoxicillin", "Nitrofurantoin", "Penicillin V"],
            answer: "Amoxicillin",
            explanation: "Amoxicillin is the classic high-yield example of a diffuse rash appearing when it is given to a patient with Epstein-Barr virus infectious mononucleosis.",
            objective: .adverseEffect,
            relatedDrugIds: ["d98"],
            tags: ["Mastery", "6f", "amoxicillin", "mononucleosis", "rash"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_004",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "A student is trying to separate outpatient skin antibiotics from broader hospital agents. Which drug below is the first-generation cephalosporin most associated with uncomplicated cellulitis, strep pharyngitis, and gram-positive coverage?",
            options: ["Cefepime", "Ceftriaxone", "Cephalexin", "Piperacillin/Tazobactam", "Cefuroxime"],
            answer: "Cephalexin",
            explanation: "Cephalexin is the classic first-generation cephalosporin used for common outpatient skin and strep infections, making it a good anchor for “stronger gram-positive than gram-negative” thinking.",
            objective: .classId,
            relatedDrugIds: ["d101"],
            tags: ["Mastery", "6f", "cephalexin", "first-gen ceph", "skin infections"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_005",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which cephalosporin best teaches the combination of once-daily IM/IV use, gonorrhea treatment, and empiric meningitis coverage?",
            options: ["Cefdinir", "Cefuroxime", "Ceftriaxone", "Cephalexin", "Cefepime"],
            answer: "Ceftriaxone",
            explanation: "Ceftriaxone is the high-yield third-generation cephalosporin tied to gonorrhea treatment and empiric meningitis coverage. It is commonly given IM or IV and is often remembered as a once-daily hospital staple.",
            objective: .indication,
            relatedDrugIds: ["d102"],
            tags: ["Mastery", "6f", "ceftriaxone", "gonorrhea", "meningitis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_006",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "A renally impaired patient receiving a broad antipseudomonal cephalosporin develops encephalopathy, myoclonus, and seizures. Which drug should immediately come to mind?",
            options: ["Ceftriaxone", "Cephalexin", "Cefepime", "Azithromycin", "Amoxicillin"],
            answer: "Cefepime",
            explanation: "Cefepime is a classic mastery pearl because it covers Pseudomonas and febrile neutropenia, but unadjusted dosing in renal impairment can lead to serious neurotoxicity.",
            objective: .adverseEffect,
            relatedDrugIds: ["d103"],
            tags: ["Mastery", "6f", "cefepime", "neurotoxicity", "renal impairment"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_007",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "An ICU patient with a severe intra-abdominal infection needs a broad IV beta-lactam that teaches antipseudomonal coverage plus a beta-lactamase inhibitor. Which agent fits best?",
            options: ["Amoxicillin/Clavulanate", "Piperacillin/Tazobactam", "Cephalexin", "Penicillin V", "Cefdinir"],
            answer: "Piperacillin/Tazobactam",
            explanation: "Piperacillin/tazobactam is the broad IV hospital workhorse that teaches antipseudomonal coverage plus beta-lactamase inhibition for serious polymicrobial and intra-abdominal infections.",
            objective: .indication,
            relatedDrugIds: ["d100"],
            tags: ["Mastery", "6f", "Zosyn", "Pseudomonas", "intra-abdominal"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_008",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "A learner wants a suffix clue for spotting fluoroquinolones quickly on an exam. Which suffix is the best clue?",
            options: ["-mycin", "-cycline", "-floxacin", "-conazole", "-cillin"],
            answer: "-floxacin",
            explanation: "The suffix -floxacin is the classic clue for fluoroquinolones such as ciprofloxacin, levofloxacin, and moxifloxacin.",
            objective: .suffixId,
            relatedDrugIds: ["d104", "d105", "d234"],
            tags: ["Mastery", "6f", "fluoroquinolone", "suffix"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_009",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "A patient swallows Cipro at the same time as a magnesium-aluminum antacid and then asks why the antibiotic might fail. What is the best explanation?",
            options: ["Ciprofloxacin is destroyed by gastric acid and must be enteric-coated", "Ciprofloxacin chelates with polyvalent cations, reducing absorption", "Ciprofloxacin needs vitamin C to be absorbed", "Ciprofloxacin should always be taken with grapefruit juice", "Ciprofloxacin only works if taken at bedtime"],
            answer: "Ciprofloxacin chelates with polyvalent cations, reducing absorption",
            explanation: "Ciprofloxacin is a classic chelation counseling drug. Antacids, iron, calcium, and similar cation-containing products can bind it and reduce absorption if timing is not separated.",
            objective: .interaction,
            relatedDrugIds: ["d104"],
            tags: ["Mastery", "6f", "ciprofloxacin", "chelation", "antacids"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_010",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "Levofloxacin is often remembered as a respiratory fluoroquinolone, but what extra warning should make you pause in a patient with myasthenia gravis?",
            options: ["It can trigger agranulocytosis", "It may worsen muscle weakness and should generally be avoided", "It is contraindicated because it raises INR like warfarin", "It always causes nephrolithiasis", "It must be given only by the IV route"],
            answer: "It may worsen muscle weakness and should generally be avoided",
            explanation: "Fluoroquinolones, including levofloxacin, can exacerbate myasthenia gravis and are a classic “avoid if possible” drug class in that setting.",
            objective: .contraindication,
            relatedDrugIds: ["d105"],
            tags: ["Mastery", "6f", "levofloxacin", "myasthenia gravis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_011",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which drug best teaches the counseling triad of “take with plenty of water, stay upright, and watch for photosensitivity” when treating Lyme disease, acne, or chlamydia?",
            options: ["Doxycycline", "Azithromycin", "Cefuroxime", "Nitrofurantoin", "Penicillin V"],
            answer: "Doxycycline",
            explanation: "Doxycycline is the classic tetracycline teaching drug for photosensitivity and esophageal irritation, so patients should take it with water and remain upright afterward.",
            objective: .pearl,
            relatedDrugIds: ["d108"],
            tags: ["Mastery", "6f", "doxycycline", "photosensitivity", "esophagitis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_012",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "A “Z-Pack” is convenient because of a long tissue half-life and short course, but it still shares a class tendency to prolong the QT interval. Which drug is it?",
            options: ["Clarithromycin", "Erythromycin", "Azithromycin", "Doxycycline", "Cefdinir"],
            answer: "Azithromycin",
            explanation: "Azithromycin is the Z-Pack macrolide most students memorize first. It is popular for short courses, but it still carries the high-yield macrolide QT-prolongation pearl.",
            objective: .brandGeneric,
            relatedDrugIds: ["d106"],
            tags: ["Mastery", "6f", "azithromycin", "Z-Pack", "QT"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_013",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which macrolide should make you think of H. pylori regimens, a metallic taste complaint, and strong CYP3A4 inhibition?",
            options: ["Azithromycin", "Clarithromycin", "Erythromycin", "Doxycycline", "Moxifloxacin"],
            answer: "Clarithromycin",
            explanation: "Clarithromycin is the macrolide strongly associated with H. pylori regimens and CYP3A4 inhibition, so it becomes an important interaction drug in mastery review.",
            objective: .interaction,
            relatedDrugIds: ["d107"],
            tags: ["Mastery", "6f", "clarithromycin", "H. pylori", "CYP3A4"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_014",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which macrolide is the classic “extra pearl” drug because it can also be used as a prokinetic agent for gastroparesis?",
            options: ["Azithromycin", "Clindamycin", "Erythromycin", "Linezolid", "Fluconazole"],
            answer: "Erythromycin",
            explanation: "Erythromycin is the classic macrolide tied to GI motilin effects and off-label prokinetic use, in addition to its anti-infective role.",
            objective: .pearl,
            relatedDrugIds: ["d230"],
            tags: ["Mastery", "6f", "erythromycin", "prokinetic", "gastroparesis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_015",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "A patient with MRSA bacteremia improves on therapy, but the team reminds students that this agent should never be chosen for pneumonia because lung surfactant inactivates it. Which drug is this?",
            options: ["Linezolid", "Daptomycin", "IV Vancomycin", "TMP/SMX", "Cefepime"],
            answer: "Daptomycin",
            explanation: "Daptomycin is a major infectious-disease pearl: excellent for certain serious gram-positive bloodstream infections, but not for pneumonia because pulmonary surfactant inactivates it.",
            objective: .contraindication,
            relatedDrugIds: ["d113"],
            tags: ["Mastery", "6f", "daptomycin", "pneumonia", "surfactant"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_016",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "Which antibiotic best teaches the combination of MRSA/VRE activity, weak MAOI behavior, weekly CBC monitoring, and neuropathy risk with prolonged therapy?",
            options: ["Daptomycin", "Linezolid", "Vancomycin (IV)", "Clindamycin", "Azithromycin"],
            answer: "Linezolid",
            explanation: "Linezolid is the oxazolidinone students should connect to VRE or resistant gram-positive infections, weekly CBC monitoring for myelosuppression, and serotonin-syndrome risk because of MAOI-like activity.",
            objective: .monitoring,
            relatedDrugIds: ["d112"],
            tags: ["Mastery", "6f", "linezolid", "weekly CBC", "serotonin syndrome"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_017",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which antibiotic from this module should make you think of UTI treatment, MRSA skin coverage, PJP prophylaxis, and high-yield risks like hyperkalemia and severe sulfonamide reactions?",
            options: ["Nitrofurantoin", "TMP/SMX", "Cephalexin", "Clindamycin", "Penicillin V"],
            answer: "TMP/SMX",
            explanation: "TMP/SMX is a versatile high-yield drug used for UTIs, community MRSA skin infections, and PJP prophylaxis, but it also teaches hyperkalemia and sulfonamide hypersensitivity risk.",
            objective: .indication,
            relatedDrugIds: ["d109"],
            tags: ["Mastery", "6f", "Bactrim", "hyperkalemia", "PJP"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_018",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "A patient receiving an infusion for MRSA develops flushing and pruritus during administration. Slowing the infusion rate is the classic fix. Which drug is most likely responsible?",
            options: ["Oral Vancomycin", "IV Vancomycin", "Linezolid", "Daptomycin", "Ceftriaxone"],
            answer: "IV Vancomycin",
            explanation: "IV vancomycin is the classic cause of infusion-related flushing and pruritus often called red man syndrome. Slowing the infusion helps reduce the reaction.",
            objective: .adverseEffect,
            relatedDrugIds: ["d110"],
            tags: ["Mastery", "6f", "IV vancomycin", "red man syndrome", "infusion"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_019",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "Which drug is given orally specifically because you want the antibiotic to stay in the gut lumen for C. difficile colitis rather than distribute systemically?",
            options: ["IV Vancomycin", "Oral Vancomycin", "Nitrofurantoin", "Nystatin", "Metronidazole"],
            answer: "Oral Vancomycin",
            explanation: "Oral vancomycin is the route-specific C. difficile drug in this bank. Its local gut effect is exactly why it works for colitis but not routine systemic infections.",
            objective: .pearl,
            relatedDrugIds: ["d111"],
            tags: ["Mastery", "6f", "oral vancomycin", "C. difficile", "gut lumen"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_020",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "Which anti-infective is a great teaching example of a “bladder-only” drug that is useful for uncomplicated cystitis but not for pyelonephritis?",
            options: ["Ciprofloxacin", "Nitrofurantoin", "TMP/SMX", "Cefuroxime", "Amoxicillin/Clavulanate"],
            answer: "Nitrofurantoin",
            explanation: "Nitrofurantoin concentrates in the urine and is ideal for uncomplicated cystitis, but it is not appropriate for pyelonephritis or other infections requiring deeper tissue penetration.",
            objective: .indication,
            relatedDrugIds: ["d236"],
            tags: ["Mastery", "6f", "nitrofurantoin", "cystitis", "not pyelonephritis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_021",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which antifungal best teaches candidiasis treatment, good CNS penetration, and the need to watch for hepatotoxicity and QT prolongation?",
            options: ["Nystatin", "Terbinafine", "Fluconazole", "Ketoconazole", "Acyclovir"],
            answer: "Fluconazole",
            explanation: "Fluconazole is the azole students should link to many Candida infections and good CNS penetration, while still remembering hepatic and QT-related adverse-effect counseling.",
            objective: .indication,
            relatedDrugIds: ["d231"],
            tags: ["Mastery", "6f", "fluconazole", "Candida", "QT"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_022",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which azole is now remembered more for topical use than systemic use because oral therapy has major hepatotoxicity and adrenal suppression concerns?",
            options: ["Fluconazole", "Ketoconazole", "Terbinafine", "Metronidazole", "Nystatin"],
            answer: "Ketoconazole",
            explanation: "Ketoconazole is a useful mastery pearl because topical products remain common, while systemic use is much less favored due to serious toxicity concerns including hepatotoxicity and adrenal suppression.",
            objective: .adverseEffect,
            relatedDrugIds: ["d232"],
            tags: ["Mastery", "6f", "ketoconazole", "topical preferred", "adrenal suppression"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_023",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "A patient with oral thrush is prescribed a medication to swish and swallow, and the teaching point is that it is not meaningfully absorbed systemically. Which drug is this?",
            options: ["Fluconazole", "Nystatin", "Terbinafine", "Valacyclovir", "Penicillin V"],
            answer: "Nystatin",
            explanation: "Nystatin is the classic local antifungal for oral thrush. It works at the mucosal surface rather than by meaningful systemic absorption.",
            objective: .pearl,
            relatedDrugIds: ["d237"],
            tags: ["Mastery", "6f", "nystatin", "oral thrush", "not systemic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_024",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which oral antifungal is the first-line choice for onychomycosis and should make you think about liver tests and possible taste disturbance?",
            options: ["Terbinafine", "Nystatin", "Fluconazole", "Ketoconazole", "Metronidazole"],
            answer: "Terbinafine",
            explanation: "Terbinafine is the classic oral drug for onychomycosis. Its high-yield counseling points include hepatotoxicity monitoring and taste disturbance.",
            objective: .monitoring,
            relatedDrugIds: ["d242"],
            tags: ["Mastery", "6f", "terbinafine", "onychomycosis", "LFTs"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_025",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which drug best teaches the triad of anaerobe coverage, a metallic taste, and “no alcohol during treatment and for 3 days after the last dose” counseling?",
            options: ["Clindamycin", "Metronidazole", "Doxycycline", "Nitrofurantoin", "Azithromycin"],
            answer: "Metronidazole",
            explanation: "Metronidazole is the classic anti-anaerobic drug tied to metallic taste and alcohol-avoidance counseling because of its disulfiram-like reaction risk.",
            objective: .interaction,
            relatedDrugIds: ["d233"],
            tags: ["Mastery", "6f", "metronidazole", "alcohol", "anaerobes"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_026",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "A patient with shingles and chronic kidney disease needs an antiviral that teaches “hydrate well and adjust the dose for renal function.” Which drug is the classic example?",
            options: ["Acyclovir", "Valacyclovir", "Oseltamivir", "Paxlovid", "Fluconazole"],
            answer: "Acyclovir",
            explanation: "Acyclovir is a key antiviral pearl because crystalluria and nephrotoxicity can occur, so hydration and renal dose adjustment matter.",
            objective: .monitoring,
            relatedDrugIds: ["d226"],
            tags: ["Mastery", "6f", "acyclovir", "renal dosing", "hydration"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_027",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "Which drug is best remembered as the oral prodrug of acyclovir, giving better bioavailability and often less frequent dosing for HSV or shingles?",
            options: ["Acyclovir", "Valacyclovir", "Oseltamivir", "Fluconazole", "Nitrofurantoin"],
            answer: "Valacyclovir",
            explanation: "Valacyclovir is the prodrug of acyclovir and is remembered for better oral bioavailability and more convenient dosing schedules.",
            objective: .moa,
            relatedDrugIds: ["d244", "d226"],
            tags: ["Mastery", "6f", "valacyclovir", "prodrug", "bioavailability"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_028",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which antiviral for influenza is most effective when started early and is also used for post-exposure prophylaxis when begun within 48 hours of a close contact?",
            options: ["Valacyclovir", "Acyclovir", "Paxlovid", "Oseltamivir", "Nystatin"],
            answer: "Oseltamivir",
            explanation: "Oseltamivir is the neuraminidase inhibitor students should associate with early influenza treatment and prophylaxis after exposure when started promptly.",
            objective: .dosing,
            relatedDrugIds: ["d239"],
            tags: ["Mastery", "6f", "oseltamivir", "influenza", "48 hours"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_029",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "A high-risk outpatient is on day 3 of COVID symptoms. Which oral antiviral must be started within 5 days of symptom onset and is famous for major CYP3A-mediated drug interactions?",
            options: ["Oseltamivir", "Acyclovir", "Nirmatrelvir/Ritonavir", "Metronidazole", "Fluconazole"],
            answer: "Nirmatrelvir/Ritonavir",
            explanation: "Nirmatrelvir/ritonavir (Paxlovid) is the high-yield COVID antiviral that must be started early and requires an interaction review because ritonavir strongly inhibits CYP3A.",
            objective: .interaction,
            relatedDrugIds: ["d235"],
            tags: ["Mastery", "6f", "Paxlovid", "COVID", "CYP3A"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_030",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "Which fluoroquinolone is a favorite exam comparison point because it covers respiratory pathogens, has some anaerobic coverage, and usually does not require renal dose adjustment?",
            options: ["Ciprofloxacin", "Levofloxacin", "Moxifloxacin", "Doxycycline", "Azithromycin"],
            answer: "Moxifloxacin",
            explanation: "Moxifloxacin is the respiratory fluoroquinolone in this bank that adds anaerobic coverage and stands out because it typically does not need renal dose adjustment.",
            objective: .pearl,
            relatedDrugIds: ["d234"],
            tags: ["Mastery", "6f", "moxifloxacin", "no renal adjustment", "respiratory FQ"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_031",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which antibiotic best teaches the combination of oral MRSA or anaerobic coverage, good bone penetration, and a major risk of C. difficile colitis?",
            options: ["Clindamycin", "Cefuroxime", "Azithromycin", "Nitrofurantoin", "Oseltamivir"],
            answer: "Clindamycin",
            explanation: "Clindamycin is remembered for useful skin and anaerobic coverage plus bone penetration, but it is also one of the classic antibiotics linked to C. difficile.",
            objective: .adverseEffect,
            relatedDrugIds: ["d229"],
            tags: ["Mastery", "6f", "clindamycin", "C. difficile", "bone penetration"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_032",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "Which oral natural penicillin remains a high-yield classic for strep pharyngitis and many dental infections?",
            options: ["Amoxicillin/Clavulanate", "Penicillin V", "Cephalexin", "Cefdinir", "Azithromycin"],
            answer: "Penicillin V",
            explanation: "Penicillin V is the classic oral natural penicillin tied to strep pharyngitis and dental infection teaching.",
            objective: .indication,
            relatedDrugIds: ["d240"],
            tags: ["Mastery", "6f", "penicillin V", "strep", "dental"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_033",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "A parent is alarmed that a child taking Omnicef with an iron supplement now has reddish stools. Which explanation is best?",
            options: ["This proves occult GI bleeding and the drug must always be stopped", "Cefdinir can cause harmless red-tinged stools when taken with iron", "The child is developing vancomycin-induced red man syndrome", "This is the classic sign of metronidazole toxicity", "It means the antibiotic is not being absorbed at all"],
            answer: "Cefdinir can cause harmless red-tinged stools when taken with iron",
            explanation: "Cefdinir can produce a harmless red stool discoloration when it interacts with iron in the GI tract, which is a favorite pediatric counseling pearl.",
            objective: .pearl,
            relatedDrugIds: ["d227"],
            tags: ["Mastery", "6f", "cefdinir", "iron", "red stools"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_034",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which cephalosporin from this module is a second-generation agent commonly used for sinusitis or otitis but is also worth remembering for Lyme disease treatment?",
            options: ["Ceftriaxone", "Cephalexin", "Cefuroxime", "Cefepime", "Cefdinir"],
            answer: "Cefuroxime",
            explanation: "Cefuroxime is the second-generation cephalosporin in this bank and is useful to remember for common respiratory infections as well as Lyme disease.",
            objective: .indication,
            relatedDrugIds: ["d228"],
            tags: ["Mastery", "6f", "cefuroxime", "second-gen", "Lyme"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_035",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "Which drug is a common ophthalmic first-line option for bacterial conjunctivitis rather than an oral antibiotic?",
            options: ["Polytrim", "Penicillin V", "Fluconazole", "Nitrofurantoin", "Metronidazole"],
            answer: "Polytrim",
            explanation: "Polytrim is the ophthalmic polymyxin B/trimethoprim combination commonly used for bacterial conjunctivitis, making it a useful “local eye therapy” anchor.",
            objective: .brandGeneric,
            relatedDrugIds: ["d241"],
            tags: ["Mastery", "6f", "Polytrim", "ophthalmic", "conjunctivitis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_036",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which fluoroquinolone product is especially memorable in ENT review because the otic formulation is safe even when the tympanic membrane is perforated?",
            options: ["Tobramycin", "Ofloxacin", "Polytrim", "Erythromycin", "Nystatin"],
            answer: "Ofloxacin",
            explanation: "Ofloxacin is a high-yield ear pearl because the otic formulation is considered safe with a perforated tympanic membrane.",
            objective: .pearl,
            relatedDrugIds: ["d238"],
            tags: ["Mastery", "6f", "ofloxacin", "otic", "perforated TM"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_037",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .easy,
            question: "Tobrex is a local anti-infective used for eye infections. What is the generic name?",
            options: ["Tobramycin", "Ofloxacin", "Polymyxin B/Trimethoprim", "Acyclovir", "Cefuroxime"],
            answer: "Tobramycin",
            explanation: "Tobrex is the brand name for tobramycin, an aminoglycoside ophthalmic product often used for bacterial eye infections.",
            objective: .genericBrand,
            relatedDrugIds: ["d243"],
            tags: ["Mastery", "6f", "Tobrex", "tobramycin", "ophthalmic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_038",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "A patient on sertraline from Module 4 is admitted with a resistant gram-positive infection. Which antibiotic from Module 6 should make you worry about serotonin syndrome because of MAOI-like activity?",
            options: ["Daptomycin", "Linezolid", "IV Vancomycin", "Cefepime", "Nitrofurantoin"],
            answer: "Linezolid",
            explanation: "Linezolid has MAOI-like properties, so combining it with serotonergic drugs such as sertraline raises the high-yield risk of serotonin syndrome.",
            objective: .interaction,
            relatedDrugIds: ["d112", "d74"],
            tags: ["Mastery", "6f", "cross-module", "linezolid", "sertraline"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_039",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which route-and-use pairing is correct for the two vancomycin entries in this course?",
            options: ["IV vancomycin for C. difficile colitis; oral vancomycin for MRSA bacteremia", "IV vancomycin for serious systemic gram-positive infections; oral vancomycin for C. difficile colitis", "Both IV and oral vancomycin are interchangeable for pneumonia", "Both IV and oral vancomycin are primarily antivirals", "Oral vancomycin is the preferred route for meningitis"],
            answer: "IV vancomycin for serious systemic gram-positive infections; oral vancomycin for C. difficile colitis",
            explanation: "The route distinction is a major mastery point: IV vancomycin is used for systemic serious gram-positive infections, while oral vancomycin is used for C. difficile colitis because it acts in the gut.",
            objective: .mixedReview,
            relatedDrugIds: ["d110", "d111"],
            tags: ["Mastery", "6f", "vancomycin", "route matters", "systemic vs gut"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_040",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "A patient on warfarin from Module 2 suddenly has a supratherapeutic INR after starting an antibiotic for a UTI. Which Module 6 drug is the classic culprit?",
            options: ["Nitrofurantoin", "TMP/SMX", "Cephalexin", "Penicillin V", "Doxycycline"],
            answer: "TMP/SMX",
            explanation: "TMP/SMX is a classic warfarin interaction drug and can substantially raise INR, so it is a favorite cross-module safety question.",
            objective: .interaction,
            relatedDrugIds: ["d109", "d41"],
            tags: ["Mastery", "6f", "cross-module", "warfarin", "Bactrim"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_041",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "A patient taking colchicine for gout develops pneumonia and is prescribed Biaxin. Which drug from this Module 6 question set is responsible for the dangerous interaction because it strongly inhibits CYP3A4?",
            options: ["Azithromycin", "Clarithromycin", "Erythromycin", "Doxycycline", "Cefuroxime"],
            answer: "Clarithromycin",
            explanation: "Clarithromycin is a strong CYP3A4 inhibitor, so combining it with colchicine can raise colchicine exposure and toxicity risk.",
            objective: .interaction,
            relatedDrugIds: ["d107", "d157"],
            tags: ["Mastery", "6f", "cross-module", "clarithromycin", "colchicine"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_042",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .hard,
            question: "A transplant patient from Module 5 is stable on tacrolimus and then tests positive for COVID-19. Which antiviral from Module 6 should immediately trigger an intense interaction review because ritonavir can dramatically raise tacrolimus levels?",
            options: ["Oseltamivir", "Valacyclovir", "Nirmatrelvir/Ritonavir", "Acyclovir", "Fluconazole"],
            answer: "Nirmatrelvir/Ritonavir",
            explanation: "Paxlovid contains ritonavir, a strong CYP3A inhibitor, so tacrolimus exposure can rise dramatically unless the interaction is actively managed.",
            objective: .interaction,
            relatedDrugIds: ["d235", "d178"],
            tags: ["Mastery", "6f", "cross-module", "Paxlovid", "tacrolimus"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_043",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which statement best compares amoxicillin and amoxicillin/clavulanate in a way that helps with real-world prescribing?",
            options: ["Amoxicillin/clavulanate is narrower than amoxicillin alone", "Amoxicillin is the preferred choice when beta-lactamase coverage is needed", "Amoxicillin/clavulanate broadens amoxicillin by adding a beta-lactamase inhibitor", "Neither drug belongs to the beta-lactam family", "Both are used only by the IV route"],
            answer: "Amoxicillin/clavulanate broadens amoxicillin by adding a beta-lactamase inhibitor",
            explanation: "This comparison is a core infectious-disease concept: amoxicillin/clavulanate expands amoxicillin’s practical coverage by adding clavulanate, a beta-lactamase inhibitor.",
            objective: .mixedReview,
            relatedDrugIds: ["d98", "d99"],
            tags: ["Mastery", "6f", "amoxicillin", "Augmentin", "compare"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_044",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which drug-class match is correct?",
            options: ["Daptomycin — oxazolidinone", "Linezolid — glycopeptide", "Vancomycin — lipopeptide", "Daptomycin — lipopeptide", "TMP/SMX — macrolide"],
            answer: "Daptomycin — lipopeptide",
            explanation: "Daptomycin is the lipopeptide in this module. Linezolid is the oxazolidinone, vancomycin is the glycopeptide, and TMP/SMX is a sulfonamide combination.",
            objective: .classId,
            relatedDrugIds: ["d113", "d112", "d110", "d109"],
            tags: ["Mastery", "6f", "drug class", "daptomycin", "linezolid"],
            source: .curated
        ),
        .multipleChoice(
            id: "q6f_add_045",
            subsectionId: DrugDataService.masteringInfectiousDiseaseSubsectionId,
            difficulty: .medium,
            question: "Which drug-device or route pairing is most accurately matched to a local rather than systemic anti-infective use?",
            options: ["Polytrim — oral treatment for streptococcal pharyngitis", "Tobramycin — topical eye therapy for bacterial conjunctivitis or corneal infection", "Nitrofurantoin — IV treatment for pyelonephritis", "Oral vancomycin — first-line systemic treatment for MRSA bacteremia", "Nystatin — IV therapy for disseminated candidemia"],
            answer: "Tobramycin — topical eye therapy for bacterial conjunctivitis or corneal infection",
            explanation: "Tobramycin in this course is an ophthalmic/local therapy. Several infectious-disease questions become much easier when students separate site-limited local therapies from truly systemic drugs.",
            objective: .mixedReview,
            relatedDrugIds: ["d243", "d241", "d237", "d111", "d236"],
            tags: ["Mastery", "6f", "local therapy", "ophthalmic", "mastery"],
            source: .curated
        )
    ]
}
