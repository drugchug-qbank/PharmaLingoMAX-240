// PharmaLingo — Module 6e (Antifungals & Antivirals)
// Curated Add-On Question Pack (45 questions)
// IDs: q6e_add_001 ... q6e_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 6e exists, then append:
//
//    if bank["6e"] == nil { bank["6e"] = [] }
//    bank["6e"]?.append(contentsOf: Self.curatedAddOnQuestions_6e)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs: d226 (Acyclovir), d227 (Cefdinir),
//   d228 (Cefuroxime), d229 (Clindamycin), d230 (Erythromycin), d231 (Fluconazole),
//   d232 (Ketoconazole), d233 (Metronidazole), d234 (Moxifloxacin), d235 (Nirmatrelvir/Ritonavir),
//   d236 (Nitrofurantoin), d237 (Nystatin), d238 (Ofloxacin), d239 (Oseltamivir),
//   d240 (Penicillin V), d241 (Polymyxin B/Trimethoprim), d242 (Terbinafine),
//   d243 (Tobramycin), d244 (Valacyclovir).
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_6e: [Question] = [
        .multipleChoice(
            id: "q6e_add_001",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Zovirax is the classic nucleoside-analog antiviral students associate with HSV, shingles, and renal-dose-adjustment questions. What is the generic name of Zovirax?",
            options: ["Acyclovir", "Valacyclovir", "Oseltamivir", "Nirmatrelvir/Ritonavir", "Fluconazole"],
            answer: "Acyclovir",
            explanation: "Zovirax is the brand name for acyclovir. Acyclovir is the classic oral herpes antiviral in this subsection.",
            objective: .brandGeneric,
            relatedDrugIds: ["d226"],
            tags: ["6e", "acyclovir", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_002",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Valacyclovir is the oral prodrug of acyclovir that treats HSV and shingles with better oral bioavailability and usually less frequent dosing. Which brand name matches valacyclovir?",
            options: ["Valtrex", "Zovirax", "Tamiflu", "Diflucan", "Macrobid"],
            answer: "Valtrex",
            explanation: "Valacyclovir is sold as Valtrex. Linking Valtrex to valacyclovir helps separate it from Zovirax, which is acyclovir.",
            objective: .genericBrand,
            relatedDrugIds: ["d244"],
            tags: ["6e", "valacyclovir", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_003",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Omnicef is a common pediatric cephalosporin students remember for otitis and the harmless red-stool-with-iron pearl. What is the generic name of Omnicef?",
            options: ["Cefdinir", "Cefuroxime", "Clindamycin", "Penicillin V", "Moxifloxacin"],
            answer: "Cefdinir",
            explanation: "Omnicef is the brand name for cefdinir. Cefdinir is the 3rd-generation cephalosporin in this subsection.",
            objective: .brandGeneric,
            relatedDrugIds: ["d227"],
            tags: ["6e", "cefdinir", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_004",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Cefuroxime is the 2nd-generation cephalosporin here that can show up in sinusitis, otitis, UTI, and early Lyme disease questions. Which brand name matches cefuroxime?",
            options: ["Ceftin", "Omnicef", "Cleocin", "Pen VK", "Avelox"],
            answer: "Ceftin",
            explanation: "Cefuroxime is sold as Ceftin. That pair is worth knowing because cefuroxime is the early Lyme cephalosporin in this subsection.",
            objective: .genericBrand,
            relatedDrugIds: ["d228"],
            tags: ["6e", "cefuroxime", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_005",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Clindamycin is the lincosamide that covers anaerobes and some community skin infections but is infamous for C. difficile risk. Which brand name matches clindamycin?",
            options: ["Cleocin", "Ceftin", "Ery-Tab", "Polytrim", "Nizoral"],
            answer: "Cleocin",
            explanation: "Clindamycin is sold as Cleocin. Cleocin should make you think of anaerobe coverage and C. difficile-associated diarrhea risk.",
            objective: .genericBrand,
            relatedDrugIds: ["d229"],
            tags: ["6e", "clindamycin", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_006",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Diflucan is the oral azole students connect with Candida treatment, QT questions, and liver-monitoring pearls. What is the generic name of Diflucan?",
            options: ["Fluconazole", "Ketoconazole", "Terbinafine", "Nystatin", "Valacyclovir"],
            answer: "Fluconazole",
            explanation: "Diflucan is the brand name for fluconazole. Fluconazole is the azole in this subsection most often tied to systemic Candida treatment questions.",
            objective: .brandGeneric,
            relatedDrugIds: ["d231"],
            tags: ["6e", "fluconazole", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_007",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Metronidazole is the nitroimidazole remembered for anaerobes, trichomoniasis, metallic taste, and strict alcohol counseling. Which brand name matches metronidazole?",
            options: ["Flagyl", "Diflucan", "Macrobid", "Tamiflu", "Pen VK"],
            answer: "Flagyl",
            explanation: "Metronidazole is sold as Flagyl. Flagyl should immediately bring to mind anaerobes and alcohol-avoidance counseling.",
            objective: .genericBrand,
            relatedDrugIds: ["d233"],
            tags: ["6e", "metronidazole", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_008",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Paxlovid is the oral COVID-19 antiviral combo whose ritonavir component creates major drug-interaction questions. What is the generic name of Paxlovid?",
            options: ["Nirmatrelvir/Ritonavir", "Oseltamivir", "Acyclovir/Valacyclovir", "Fluconazole/Metronidazole", "Polymyxin B/Trimethoprim"],
            answer: "Nirmatrelvir/Ritonavir",
            explanation: "Paxlovid is the brand name for nirmatrelvir/ritonavir. The ritonavir piece is the reason interaction screening matters so much.",
            objective: .brandGeneric,
            relatedDrugIds: ["d235"],
            tags: ["6e", "paxlovid", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_009",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Nitrofurantoin is the bladder-focused antibiotic students remember for uncomplicated cystitis rather than pyelonephritis or systemic infection. Which brand name matches nitrofurantoin?",
            options: ["Macrobid", "Tamiflu", "Valtrex", "Pen VK", "Avelox"],
            answer: "Macrobid",
            explanation: "Nitrofurantoin is sold as Macrobid. Macrobid should cue uncomplicated lower UTI, not kidney infection.",
            objective: .genericBrand,
            relatedDrugIds: ["d236"],
            tags: ["6e", "nitrofurantoin", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_010",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Oseltamivir is the neuraminidase inhibitor used for influenza treatment and post-exposure prophylaxis when started early. Which brand name matches oseltamivir?",
            options: ["Tamiflu", "Paxlovid", "Valtrex", "Zovirax", "Macrobid"],
            answer: "Tamiflu",
            explanation: "Oseltamivir is sold as Tamiflu. Tamiflu questions usually hinge on early influenza treatment or prophylaxis timing.",
            objective: .genericBrand,
            relatedDrugIds: ["d239"],
            tags: ["6e", "oseltamivir", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_011",
            subsectionId: "6e",
            difficulty: .medium,
            question: "A patient is starting erythromycin and already takes several chronic medications. Which statement is most accurate about erythromycin?",
            options: ["It can prolong QT and has meaningful CYP3A4 interaction potential, so medication review matters.", "It has no meaningful interaction risk and does not affect QT.", "It is preferred when a patient takes colchicine because it lowers colchicine levels.", "It is mainly used because it avoids all cardiac rhythm concerns seen with other macrolides.", "Its most important counseling point is to take it with alcohol to reduce nausea."],
            answer: "It can prolong QT and has meaningful CYP3A4 interaction potential, so medication review matters.",
            explanation: "Erythromycin is high yield for both QT prolongation and CYP3A4-mediated interactions. It is not an interaction-free macrolide.",
            objective: .interaction,
            relatedDrugIds: ["d230"],
            tags: ["6e", "erythromycin", "interaction", "qt"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_012",
            subsectionId: "6e",
            difficulty: .easy,
            question: "This subsection includes 2 antivirals that are grouped together because they both target herpes viruses rather than influenza or COVID-19. Which pair best fits HSV and VZV treatment?",
            options: ["Acyclovir and Valacyclovir", "Oseltamivir and Nirmatrelvir/Ritonavir", "Fluconazole and Nystatin", "Moxifloxacin and Ofloxacin", "Cefdinir and Cefuroxime"],
            answer: "Acyclovir and Valacyclovir",
            explanation: "Acyclovir and valacyclovir are the herpes-virus antivirals here. Oseltamivir is for influenza and nirmatrelvir/ritonavir is for COVID-19.",
            objective: .indication,
            relatedDrugIds: ["d226", "d244"],
            tags: ["6e", "herpes", "acyclovir", "valacyclovir"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_013",
            subsectionId: "6e",
            difficulty: .medium,
            question: "When adherence matters, clinicians often prefer valacyclovir over acyclovir for oral outpatient therapy. Why?",
            options: ["Valacyclovir is a prodrug of acyclovir with better oral bioavailability and usually less frequent dosing.", "Valacyclovir is the only one of the 2 that works against HSV.", "Valacyclovir does not require renal dose adjustment.", "Valacyclovir has no headache or nausea risk.", "Valacyclovir is given only intravenously for severe disease."],
            answer: "Valacyclovir is a prodrug of acyclovir with better oral bioavailability and usually less frequent dosing.",
            explanation: "Valacyclovir is the oral prodrug of acyclovir. Its better bioavailability often allows simpler dosing than acyclovir.",
            objective: .pearl,
            relatedDrugIds: ["d244", "d226"],
            tags: ["6e", "valacyclovir", "prodrug", "bioavailability"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_014",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Acyclovir and valacyclovir treat herpes viruses by interfering with viral replication. Which mechanism best explains this class pair?",
            options: ["They act as nucleoside analogs that ultimately inhibit viral DNA polymerase.", "They inhibit neuraminidase and block viral release from infected cells.", "They inhibit fungal ergosterol synthesis at 14-alpha-demethylase.", "They bind the bacterial 50S ribosomal subunit.", "They inhibit CYP3A to boost antiviral levels."],
            answer: "They act as nucleoside analogs that ultimately inhibit viral DNA polymerase.",
            explanation: "Acyclovir and valacyclovir are anti-herpes nucleoside analogs. Their key high-yield mechanism is inhibition of viral DNA polymerase after intracellular activation.",
            objective: .moa,
            relatedDrugIds: ["d226", "d244"],
            tags: ["6e", "acyclovir", "valacyclovir", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_015",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Tamiflu is separated from the herpes antivirals because it targets influenza in a different way. Which mechanism best explains oseltamivir?",
            options: ["It inhibits influenza neuraminidase.", "It inhibits viral DNA polymerase.", "It blocks fungal squalene epoxidase.", "It binds the 30S bacterial ribosomal subunit.", "It inhibits bacterial DNA gyrase."],
            answer: "It inhibits influenza neuraminidase.",
            explanation: "Oseltamivir is a neuraminidase inhibitor. That is why it is linked to influenza rather than HSV or VZV treatment.",
            objective: .moa,
            relatedDrugIds: ["d239"],
            tags: ["6e", "oseltamivir", "moa"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_016",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Fluconazole is an azole antifungal used for many Candida infections. Which mechanism best explains its antifungal effect?",
            options: ["It inhibits fungal 14-alpha-demethylase and reduces ergosterol synthesis.", "It inhibits neuraminidase and viral release.", "It irreversibly binds the 50S ribosomal subunit.", "It inhibits bacterial folate synthesis.", "It depolarizes the bacterial cell membrane."],
            answer: "It inhibits fungal 14-alpha-demethylase and reduces ergosterol synthesis.",
            explanation: "Fluconazole is an azole antifungal. Azoles block fungal ergosterol synthesis by inhibiting 14-alpha-demethylase.",
            objective: .moa,
            relatedDrugIds: ["d231"],
            tags: ["6e", "fluconazole", "moa", "azole"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_017",
            subsectionId: "6e",
            difficulty: .medium,
            question: "A patient with onychomycosis needs the oral antifungal in this subsection that is not an azole and instead blocks squalene epoxidase. Which drug is it?",
            options: ["Terbinafine", "Fluconazole", "Ketoconazole", "Nystatin", "Valacyclovir"],
            answer: "Terbinafine",
            explanation: "Terbinafine inhibits squalene epoxidase. It is the classic first-line oral option for onychomycosis questions.",
            objective: .moa,
            relatedDrugIds: ["d242"],
            tags: ["6e", "terbinafine", "moa", "onychomycosis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_018",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Metronidazole is the anaerobe-focused drug that also appears in trichomoniasis and H. pylori discussions. What class is metronidazole?",
            options: ["Nitroimidazole", "Macrolide", "Lincosamide", "Azole antifungal", "Neuraminidase inhibitor"],
            answer: "Nitroimidazole",
            explanation: "Metronidazole belongs to the nitroimidazole class. That class identification helps separate it from clindamycin, macrolides, and antifungals.",
            objective: .classId,
            relatedDrugIds: ["d233"],
            tags: ["6e", "metronidazole", "class"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_019",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Among the cephalosporins listed in 6e, which one is the 2nd-generation agent that can be used for early Lyme disease in addition to sinusitis, otitis, and some UTIs?",
            options: ["Cefuroxime", "Cefdinir", "Penicillin V", "Clindamycin", "Nitrofurantoin"],
            answer: "Cefuroxime",
            explanation: "Cefuroxime is the 2nd-generation cephalosporin in this subsection and is a high-yield oral option for early Lyme disease.",
            objective: .indication,
            relatedDrugIds: ["d228"],
            tags: ["6e", "cefuroxime", "lyme", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_020",
            subsectionId: "6e",
            difficulty: .medium,
            question: "A child taking cefdinir with an iron-containing supplement develops brick-red stools but otherwise feels well. Which explanation is most accurate?",
            options: ["Cefdinir can form a harmless nonabsorbable complex with iron that discolors stool.", "This proves cefdinir caused a lower GI bleed.", "This finding is a classic sign of C. difficile colitis.", "Cefdinir always causes hemolysis when taken with iron.", "The stool color change means cefdinir stopped being absorbed and should never be used again."],
            answer: "Cefdinir can form a harmless nonabsorbable complex with iron that discolors stool.",
            explanation: "Cefdinir can cause red-tinged stools when taken with iron. That pearl is high yield because it looks dramatic but is usually harmless.",
            objective: .pearl,
            relatedDrugIds: ["d227"],
            tags: ["6e", "cefdinir", "iron", "pearl"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_021",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Which drug in this subsection is the lincosamide especially remembered for anaerobe coverage and some community skin-infection use?",
            options: ["Clindamycin", "Erythromycin", "Penicillin V", "Moxifloxacin", "Nitrofurantoin"],
            answer: "Clindamycin",
            explanation: "Clindamycin is the lincosamide in this subsection. It is high yield for anaerobes, skin infections, and C. difficile risk.",
            objective: .classId,
            relatedDrugIds: ["d229"],
            tags: ["6e", "clindamycin", "class", "anaerobes"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_022",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Erythromycin treats susceptible bacteria through a protein-synthesis mechanism rather than cell-wall disruption. Which target best explains erythromycin?",
            options: ["50S ribosomal subunit", "30S ribosomal subunit", "DNA gyrase", "Viral neuraminidase", "Fungal squalene epoxidase"],
            answer: "50S ribosomal subunit",
            explanation: "Erythromycin is a macrolide that inhibits bacterial protein synthesis by binding the 50S ribosomal subunit.",
            objective: .moa,
            relatedDrugIds: ["d230"],
            tags: ["6e", "erythromycin", "moa", "50S"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_023",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Which drug in this subsection is the respiratory fluoroquinolone that is often remembered for QT issues, tendon warnings, and the pearl that no renal dose adjustment is usually needed?",
            options: ["Moxifloxacin", "Ofloxacin", "Nitrofurantoin", "Cefdinir", "Penicillin V"],
            answer: "Moxifloxacin",
            explanation: "Moxifloxacin is the respiratory fluoroquinolone here. A common high-yield pearl is that it typically does not require renal dose adjustment.",
            objective: .pearl,
            relatedDrugIds: ["d234"],
            tags: ["6e", "moxifloxacin", "fluoroquinolone", "renal"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_024",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Which drug is best remembered as a bladder-focused antibiotic for uncomplicated cystitis rather than a good option for systemic infection?",
            options: ["Nitrofurantoin", "Moxifloxacin", "Clindamycin", "Cefuroxime", "Fluconazole"],
            answer: "Nitrofurantoin",
            explanation: "Nitrofurantoin concentrates in the urine and is mainly used for uncomplicated lower UTIs. It is not a systemic go-to agent.",
            objective: .indication,
            relatedDrugIds: ["d236"],
            tags: ["6e", "nitrofurantoin", "uti", "bladder"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_025",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Which antifungal in this subsection is the classic swish-and-swallow option for oral thrush because gastrointestinal absorption is insignificant?",
            options: ["Nystatin", "Fluconazole", "Terbinafine", "Ketoconazole", "Valacyclovir"],
            answer: "Nystatin",
            explanation: "Nystatin is the classic local therapy for oral thrush. Because it is not significantly absorbed, it is used for local Candida infections rather than systemic ones.",
            objective: .indication,
            relatedDrugIds: ["d237"],
            tags: ["6e", "nystatin", "thrush", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_026",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Your outline lists ofloxacin specifically as an otic/ophthalmic high-yield entry. Which formulation concept best matches that entry?",
            options: ["A topical ear/eye fluoroquinolone", "An oral anti-herpes antiviral", "An oral nitroimidazole for anaerobes", "A systemic azole for candidemia", "An oral penicillin for strep pharyngitis"],
            answer: "A topical ear/eye fluoroquinolone",
            explanation: "In this subsection, ofloxacin is being tested as a topical ear/eye fluoroquinolone rather than as a systemic oral antibiotic.",
            objective: .pearl,
            relatedDrugIds: ["d238"],
            tags: ["6e", "ofloxacin", "route", "topical"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_027",
            subsectionId: "6e",
            difficulty: .easy,
            question: "A common first-line eye drop combines polymyxin B with trimethoprim for bacterial pink eye. Which drug from this subsection is that combination?",
            options: ["Polymyxin B/Trimethoprim", "Ofloxacin", "Tobramycin", "Erythromycin", "Nystatin"],
            answer: "Polymyxin B/Trimethoprim",
            explanation: "Polymyxin B/trimethoprim is the combination ophthalmic antibiotic commonly used for bacterial conjunctivitis. The brand name is Polytrim.",
            objective: .indication,
            relatedDrugIds: ["d241"],
            tags: ["6e", "polytrim", "conjunctivitis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_028",
            subsectionId: "6e",
            difficulty: .easy,
            question: "In this module, tobramycin is being tested in its ophthalmic form rather than its inhaled CF role. Which infection type best matches this subsection's tobramycin entry?",
            options: ["External bacterial eye infections", "Influenza A and B", "HSV cold sores", "Candidemia", "Acute cystitis"],
            answer: "External bacterial eye infections",
            explanation: "Tobramycin in this subsection refers to ophthalmic treatment of bacterial eye infections, not influenza, HSV, or systemic fungal disease.",
            objective: .indication,
            relatedDrugIds: ["d243"],
            tags: ["6e", "tobramycin", "ophthalmic", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_029",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Which oral narrow-spectrum antibiotic in this subsection remains a classic first-line option for streptococcal pharyngitis?",
            options: ["Penicillin V", "Clindamycin", "Moxifloxacin", "Nitrofurantoin", "Fluconazole"],
            answer: "Penicillin V",
            explanation: "Penicillin V is the classic oral penicillin tied to strep pharyngitis. It is much narrower than many of the other drugs in this subsection.",
            objective: .indication,
            relatedDrugIds: ["d240"],
            tags: ["6e", "penicillin-v", "strep", "indication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_030",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Which antifungal here is remembered both for Candida treatment and for the pearl that it has good CNS penetration for cryptococcal meningitis questions?",
            options: ["Fluconazole", "Nystatin", "Terbinafine", "Ketoconazole", "Acyclovir"],
            answer: "Fluconazole",
            explanation: "Fluconazole is the azole most often linked to systemic Candida treatment and useful CNS penetration pearls.",
            objective: .indication,
            relatedDrugIds: ["d231"],
            tags: ["6e", "fluconazole", "candida", "cns"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_031",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Which statement best captures why ketoconazole in this subsection is mostly remembered as topical or shampoo rather than a go-to oral systemic antifungal?",
            options: ["Oral ketoconazole carries serious hepatotoxicity, adrenal-suppression, and drug-interaction concerns, so topical use is preferred when appropriate.", "Oral ketoconazole is preferred first-line for uncomplicated oral thrush because it has no interaction issues.", "Ketoconazole is the antiviral of choice for shingles because it concentrates in dorsal root ganglia.", "Ketoconazole is used mainly because it avoids liver toxicity seen with all other azoles.", "Ketoconazole is the best option when rapid influenza prophylaxis is needed after exposure."],
            answer: "Oral ketoconazole carries serious hepatotoxicity, adrenal-suppression, and drug-interaction concerns, so topical use is preferred when appropriate.",
            explanation: "Ketoconazole is high yield because oral systemic use is limited by serious toxicity and interaction concerns. That is why topical formulations are emphasized more often.",
            objective: .contraindication,
            relatedDrugIds: ["d232"],
            tags: ["6e", "ketoconazole", "hepatotoxicity", "topical"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_032",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Which drug should be started as soon as possible and within 5 days of symptom onset for eligible high-risk outpatients with mild-to-moderate COVID-19?",
            options: ["Nirmatrelvir/Ritonavir", "Oseltamivir", "Acyclovir", "Fluconazole", "Nitrofurantoin"],
            answer: "Nirmatrelvir/Ritonavir",
            explanation: "Nirmatrelvir/ritonavir is the oral COVID-19 antiviral in this subsection. The high-yield timing pearl is to start it within 5 days of symptom onset.",
            objective: .dosing,
            relatedDrugIds: ["d235"],
            tags: ["6e", "paxlovid", "covid", "timing"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_033",
            subsectionId: "6e",
            difficulty: .medium,
            question: "A patient has fever, flank pain, and concern for pyelonephritis. Which drug from this subsection is a poor choice because it is not indicated for pyelonephritis and mainly works in the bladder?",
            options: ["Nitrofurantoin", "Moxifloxacin", "Cefuroxime", "Clindamycin", "Penicillin V"],
            answer: "Nitrofurantoin",
            explanation: "Nitrofurantoin is high yield for uncomplicated cystitis but not pyelonephritis. It is a poor choice when infection extends beyond the lower urinary tract.",
            objective: .contraindication,
            relatedDrugIds: ["d236"],
            tags: ["6e", "nitrofurantoin", "pyelonephritis", "contraindication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_034",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Tamiflu works best when used early and can also be used after exposure. Which timing pearl is most accurate?",
            options: ["Start treatment within 48 hours of symptom onset, and post-exposure prophylaxis is also started within 48 hours after close contact.", "It must be started within 5 days of symptoms, and it cannot be used for prophylaxis.", "It should be delayed until fever has lasted at least 72 hours.", "It is only useful after influenza PCR has been positive for more than 1 week.", "It should never be used outside the hospital."],
            answer: "Start treatment within 48 hours of symptom onset, and post-exposure prophylaxis is also started within 48 hours after close contact.",
            explanation: "Oseltamivir is most effective when started early. It is also high yield because it can be used for post-exposure prophylaxis.",
            objective: .dosing,
            relatedDrugIds: ["d239"],
            tags: ["6e", "oseltamivir", "timing", "prophylaxis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_035",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Which counseling point is most important when dispensing metronidazole?",
            options: ["Avoid alcohol and products containing propylene glycol during therapy and for at least 3 days after finishing.", "Take it with iron to improve absorption.", "Drink alcohol with each dose to prevent metallic taste.", "It is safe to restart alcohol the same evening as the last dose.", "Alcohol only matters if metronidazole is given intravenously."],
            answer: "Avoid alcohol and products containing propylene glycol during therapy and for at least 3 days after finishing.",
            explanation: "Metronidazole is a classic alcohol-interaction question. The high-yield counseling pearl is to avoid alcohol during therapy and for at least 3 days afterward.",
            objective: .interaction,
            relatedDrugIds: ["d233"],
            tags: ["6e", "metronidazole", "alcohol", "interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_036",
            subsectionId: "6e",
            difficulty: .easy,
            question: "A patient taking clindamycin develops significant diarrhea. Which adverse effect must be considered first?",
            options: ["Clostridioides difficile-associated colitis", "Nephrolithiasis from crystal deposition", "Tendon rupture", "Red-stool discoloration from iron complexes", "Acute adrenal crisis"],
            answer: "Clostridioides difficile-associated colitis",
            explanation: "Clindamycin is one of the classic antibiotics associated with C. difficile-associated diarrhea and colitis.",
            objective: .adverseEffect,
            relatedDrugIds: ["d229"],
            tags: ["6e", "clindamycin", "c-diff", "adverse-effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_037",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Before starting oral terbinafine for onychomycosis, which monitoring step is most high yield?",
            options: ["Check baseline liver function tests.", "Check weekly INR only.", "Check an ANC every 7 days.", "Obtain a vancomycin trough.", "Measure a digoxin level after the first dose."],
            answer: "Check baseline liver function tests.",
            explanation: "Oral terbinafine is high yield for hepatotoxicity questions. Baseline liver function testing is an important monitoring pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d242"],
            tags: ["6e", "terbinafine", "monitoring", "lfts"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_038",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Acyclovir questions often pair HSV treatment with renal precautions. Which counseling point is most appropriate?",
            options: ["Maintain good hydration and remember that renal dose adjustment may be needed.", "Take it with alcohol to improve antiviral effect.", "It is preferred in renal failure because it never needs dose adjustment.", "Avoid all fluids for 2 hours after each dose.", "Stop it immediately if a mild headache occurs because that confirms allergy."],
            answer: "Maintain good hydration and remember that renal dose adjustment may be needed.",
            explanation: "Acyclovir is high yield for renal toxicity and renal dose adjustment. Good hydration is a classic counseling pearl.",
            objective: .monitoring,
            relatedDrugIds: ["d226"],
            tags: ["6e", "acyclovir", "renal", "hydration"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_039",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Why is valacyclovir often easier for patients to take than acyclovir in the outpatient setting?",
            options: ["It has better oral bioavailability, which usually allows less frequent dosing.", "It is topical only, so pills are unnecessary.", "It avoids all renal concerns seen with acyclovir.", "It is the only one of the 2 that treats shingles.", "It is a neuraminidase inhibitor rather than a nucleoside analog."],
            answer: "It has better oral bioavailability, which usually allows less frequent dosing.",
            explanation: "Valacyclovir is the prodrug of acyclovir with better oral bioavailability. That often translates into simpler dosing schedules.",
            objective: .pearl,
            relatedDrugIds: ["d244", "d226"],
            tags: ["6e", "valacyclovir", "bioavailability", "pearl"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_040",
            subsectionId: "6e",
            difficulty: .medium,
            question: "A patient taking amiodarone develops a Candida infection. Which drug from this subsection raises a clear extra concern for QT prolongation and also deserves liver-function caution?",
            options: ["Fluconazole", "Nystatin", "Terbinafine", "Acyclovir", "Penicillin V"],
            answer: "Fluconazole",
            explanation: "Fluconazole is high yield for both QT-prolongation concerns and hepatic-injury counseling. That combination matters when other QT-risk drugs are already onboard.",
            objective: .interaction,
            relatedDrugIds: ["d231"],
            tags: ["6e", "fluconazole", "qt", "hepatotoxicity"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_041",
            subsectionId: "6e",
            difficulty: .hard,
            question: "Which statement about moxifloxacin is most accurate?",
            options: ["It is a fluoroquinolone with serious class warnings, including tendon injury and worsening of myasthenia gravis.", "It is the preferred fluoroquinolone because it carries no major class warnings.", "It is mainly used because it has no QT concerns at all.", "It treats influenza by inhibiting neuraminidase.", "It should always be combined with iron to improve absorption."],
            answer: "It is a fluoroquinolone with serious class warnings, including tendon injury and worsening of myasthenia gravis.",
            explanation: "Moxifloxacin shares the serious fluoroquinolone warning profile. The myasthenia gravis exacerbation pearl is especially high yield.",
            objective: .contraindication,
            relatedDrugIds: ["d234"],
            tags: ["6e", "moxifloxacin", "boxed-warning", "mg"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_042",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Which drug in this subsection is high yield because the otic formulation can be used in chronic suppurative otitis media with a perforated tympanic membrane?",
            options: ["Ofloxacin", "Tobramycin", "Polymyxin B/Trimethoprim", "Erythromycin", "Nitrofurantoin"],
            answer: "Ofloxacin",
            explanation: "Ofloxacin otic is a high-yield topical fluoroquinolone because it can be used in certain patients with perforated tympanic membranes.",
            objective: .pearl,
            relatedDrugIds: ["d238"],
            tags: ["6e", "ofloxacin", "otic", "perforated-tm"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_043",
            subsectionId: "6e",
            difficulty: .medium,
            question: "A patient with candidemia should not receive nystatin suspension as sole therapy for a simple reason. Which is it?",
            options: ["Nystatin is not significantly absorbed from the GI tract and is ineffective for systemic mycoses.", "Nystatin has no antifungal activity against Candida.", "Nystatin is reserved only for influenza prophylaxis.", "Nystatin works only when given intramuscularly.", "Nystatin is contraindicated solely because it always prolongs QT."],
            answer: "Nystatin is not significantly absorbed from the GI tract and is ineffective for systemic mycoses.",
            explanation: "Nystatin is useful for local Candida infections like oral thrush, not systemic fungal infections, because absorption is insignificant.",
            objective: .contraindication,
            relatedDrugIds: ["d237"],
            tags: ["6e", "nystatin", "systemic-mycoses", "contraindication"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_044",
            subsectionId: "6e",
            difficulty: .hard,
            question: "Why is medication reconciliation mandatory before starting Paxlovid?",
            options: ["Because ritonavir is a strong CYP3A inhibitor that can create potentially severe or even life-threatening drug interactions.", "Because nirmatrelvir blocks iron absorption and makes most antibiotics ineffective.", "Because Paxlovid is only safe if taken with alcohol-containing products.", "Because ritonavir eliminates all renal dosing issues for other medicines.", "Because the combination is contraindicated with all antihypertensives without exception."],
            answer: "Because ritonavir is a strong CYP3A inhibitor that can create potentially severe or even life-threatening drug interactions.",
            explanation: "Paxlovid interaction screening is mandatory because ritonavir strongly inhibits CYP3A. That can raise concentrations of many concomitant drugs.",
            objective: .interaction,
            relatedDrugIds: ["d235"],
            tags: ["6e", "paxlovid", "interaction", "cyp3a"],
            source: .curated
        ),

        .multipleChoice(
            id: "q6e_add_045",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Which antibiotic in this subsection is also remembered for an off-label prokinetic pearl in gastroparesis because it can stimulate GI motility?",
            options: ["Erythromycin", "Clindamycin", "Penicillin V", "Moxifloxacin", "Fluconazole"],
            answer: "Erythromycin",
            explanation: "Erythromycin is a macrolide, but it is also high yield for its prokinetic association in gastroparesis discussions.",
            objective: .pearl,
            relatedDrugIds: ["d230"],
            tags: ["6e", "erythromycin", "prokinetic", "pearl"],
            source: .curated
        )
    ]
}
