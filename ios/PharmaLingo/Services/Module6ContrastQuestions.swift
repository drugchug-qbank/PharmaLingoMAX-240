import Foundation

extension DrugDataService {
    static let module6ContrastQuestions: [Question] = [

        // MARK: - Amoxicillin vs Amoxicillin/Clavulanate (6b)

        .multipleChoice(
            id: "q6_ctr_001",
            subsectionId: "6b",
            difficulty: .easy,
            question: "A patient needs oral beta-lactam therapy for otitis media. The clinician picks the plain aminopenicillin without a beta-lactamase inhibitor. Which drug is that?",
            options: ["Amoxicillin", "Amoxicillin/Clavulanate", "Cephalexin", "Ceftriaxone", "Piperacillin/Tazobactam"],
            answer: "Amoxicillin",
            explanation: "Amoxicillin is the plain aminopenicillin. Amoxicillin/clavulanate adds the beta-lactamase inhibitor clavulanate.",
            objective: .classId,
            relatedDrugIds: ["d98", "d99"],
            tags: ["contrast-pair", "amox-vs-amoxclav", "family-recognition"]
        ),

        .multipleChoice(
            id: "q6_ctr_002",
            subsectionId: "6b",
            difficulty: .medium,
            question: "Which distinguishing fact best separates amoxicillin/clavulanate from plain amoxicillin?",
            options: [
                "Clavulanate inhibits beta-lactamases, broadening coverage but often increasing GI upset",
                "Clavulanate converts amoxicillin into a cephalosporin",
                "Amoxicillin/clavulanate is IV-only while amoxicillin is oral-only",
                "Amoxicillin has broader coverage than amoxicillin/clavulanate",
                "Clavulanate removes all risk of allergic reaction"
            ],
            answer: "Clavulanate inhibits beta-lactamases, broadening coverage but often increasing GI upset",
            explanation: "The clavulanate component protects amoxicillin from beta-lactamase enzymes. The trade-off is more diarrhea/GI upset.",
            objective: .pearl,
            relatedDrugIds: ["d98", "d99"],
            tags: ["contrast-pair", "amox-vs-amoxclav", "differentiator"]
        ),

        .trueFalse(
            id: "q6_ctr_003",
            subsectionId: "6b",
            difficulty: .easy,
            question: "Amoxicillin and amoxicillin/clavulanate are both combination products containing a beta-lactamase inhibitor.",
            answer: false,
            explanation: "Only amoxicillin/clavulanate is a combination product. Plain amoxicillin does not contain a beta-lactamase inhibitor.",
            objective: .classId,
            relatedDrugIds: ["d98", "d99"],
            tags: ["contrast-pair", "amox-vs-amoxclav", "combo-vs-single"]
        ),

        // MARK: - Ceftriaxone vs Cephalexin (6b)

        .multipleChoice(
            id: "q6_ctr_004",
            subsectionId: "6b",
            difficulty: .easy,
            question: "One of these cephalosporins is oral and first-generation; the other is parenteral and third-generation. Which one is the oral first-generation agent?",
            options: ["Cephalexin", "Ceftriaxone", "Cefepime", "Cefdinir", "Cefuroxime"],
            answer: "Cephalexin",
            explanation: "Cephalexin is the oral 1st-gen cephalosporin. Ceftriaxone is parenteral 3rd-gen.",
            objective: .classId,
            relatedDrugIds: ["d101", "d102"],
            tags: ["contrast-pair", "ceftriaxone-vs-cephalexin", "family-recognition"]
        ),

        .multipleChoice(
            id: "q6_ctr_005",
            subsectionId: "6b",
            difficulty: .medium,
            question: "Which route/site fact best differentiates ceftriaxone from cephalexin?",
            options: [
                "Ceftriaxone is IM/IV for serious infections; cephalexin is oral for outpatient skin infections",
                "Both are oral-only agents used interchangeably",
                "Cephalexin is IV-only for meningitis",
                "Ceftriaxone is topical for ear infections",
                "Both are first-generation cephalosporins"
            ],
            answer: "Ceftriaxone is IM/IV for serious infections; cephalexin is oral for outpatient skin infections",
            explanation: "Route and generation are the key distinguishers: ceftriaxone is parenteral 3rd-gen; cephalexin is oral 1st-gen.",
            objective: .pearl,
            relatedDrugIds: ["d101", "d102"],
            tags: ["contrast-pair", "ceftriaxone-vs-cephalexin", "route-distinction"]
        ),

        // MARK: - Ciprofloxacin vs Levofloxacin (6c)

        .multipleChoice(
            id: "q6_ctr_006",
            subsectionId: "6c",
            difficulty: .easy,
            question: "Both are fluoroquinolones, but one is the 'UTI/Pseudomonas' FQ and the other is the 'respiratory' FQ. Which one is most associated with respiratory infections?",
            options: ["Levofloxacin", "Ciprofloxacin", "Moxifloxacin", "Azithromycin", "Doxycycline"],
            answer: "Levofloxacin",
            explanation: "Levofloxacin is the respiratory fluoroquinolone. Ciprofloxacin is more associated with UTIs and Pseudomonas.",
            objective: .classId,
            relatedDrugIds: ["d104", "d105"],
            tags: ["contrast-pair", "cipro-vs-levo", "family-recognition"]
        ),

        .multipleChoice(
            id: "q6_ctr_007",
            subsectionId: "6c",
            difficulty: .medium,
            question: "Which statement best differentiates ciprofloxacin from levofloxacin?",
            options: [
                "Ciprofloxacin is the classic UTI/Pseudomonas FQ; levofloxacin is the respiratory FQ",
                "Ciprofloxacin is a macrolide; levofloxacin is a fluoroquinolone",
                "Levofloxacin has no tendon warnings because it is newer",
                "Ciprofloxacin is IV-only while levofloxacin is oral-only",
                "Both have identical clinical roles with no meaningful differences"
            ],
            answer: "Ciprofloxacin is the classic UTI/Pseudomonas FQ; levofloxacin is the respiratory FQ",
            explanation: "The clinical role distinction is the key differentiator. Both share FQ class warnings (tendon, QT, neuropathy).",
            objective: .pearl,
            relatedDrugIds: ["d104", "d105"],
            tags: ["contrast-pair", "cipro-vs-levo", "differentiator"]
        ),

        // MARK: - Cipro vs Levo vs Moxi (6c + 6e)

        .multipleChoice(
            id: "q6_ctr_008",
            subsectionId: "6c",
            difficulty: .hard,
            question: "Among ciprofloxacin, levofloxacin, and moxifloxacin, which one typically does NOT require renal dose adjustment?",
            options: ["Moxifloxacin", "Ciprofloxacin", "Levofloxacin", "All three require renal adjustment", "None of the three require renal adjustment"],
            answer: "Moxifloxacin",
            explanation: "Moxifloxacin typically does not require renal dose adjustment, unlike ciprofloxacin and levofloxacin.",
            objective: .pearl,
            relatedDrugIds: ["d104", "d105", "d234"],
            tags: ["contrast-pair", "cipro-vs-levo-vs-moxi", "differentiator", "route-distinction"]
        ),

        // MARK: - Azithromycin vs Clarithromycin (6c)

        .multipleChoice(
            id: "q6_ctr_009",
            subsectionId: "6c",
            difficulty: .easy,
            question: "Both are macrolides, but one is the Z-Pack drug and the other is the H. pylori macrolide. Which is the Z-Pack?",
            options: ["Azithromycin", "Clarithromycin", "Erythromycin", "Doxycycline", "Levofloxacin"],
            answer: "Azithromycin",
            explanation: "Azithromycin is the Z-Pack macrolide. Clarithromycin is the H. pylori macrolide with stronger CYP3A4 interactions.",
            objective: .classId,
            relatedDrugIds: ["d106", "d107"],
            tags: ["contrast-pair", "azithro-vs-clarithro", "family-recognition"]
        ),

        .multipleChoice(
            id: "q6_ctr_010",
            subsectionId: "6c",
            difficulty: .medium,
            question: "Which fact best separates clarithromycin from azithromycin?",
            options: [
                "Clarithromycin is a strong CYP3A4 inhibitor and is used in H. pylori regimens; azithromycin has fewer drug interactions",
                "Azithromycin is the stronger CYP3A4 inhibitor",
                "Clarithromycin is a tetracycline while azithromycin is a macrolide",
                "Azithromycin is used only for H. pylori",
                "Both have identical interaction profiles"
            ],
            answer: "Clarithromycin is a strong CYP3A4 inhibitor and is used in H. pylori regimens; azithromycin has fewer drug interactions",
            explanation: "Clarithromycin's CYP3A4 inhibition and H. pylori role are the key differentiators from azithromycin.",
            objective: .interaction,
            relatedDrugIds: ["d106", "d107"],
            tags: ["contrast-pair", "azithro-vs-clarithro", "differentiator"]
        ),

        // MARK: - Vancomycin IV vs Oral (6d)

        .multipleChoice(
            id: "q6_ctr_011",
            subsectionId: "6d",
            difficulty: .easy,
            question: "The same drug is listed twice in this subsection because route completely changes its clinical role. Which version treats C. difficile in the gut?",
            options: ["Vancomycin (oral)", "Vancomycin (IV)", "Linezolid", "Daptomycin", "TMP/SMX"],
            answer: "Vancomycin (oral)",
            explanation: "Oral vancomycin stays in the GI tract for C. difficile. IV vancomycin is for systemic MRSA infections.",
            objective: .indication,
            relatedDrugIds: ["d110", "d111"],
            tags: ["contrast-pair", "vanco-routes", "route-distinction"]
        ),

        .multipleChoice(
            id: "q6_ctr_012",
            subsectionId: "6d",
            difficulty: .medium,
            question: "Which statement best explains the route distinction for vancomycin?",
            options: [
                "IV = systemic MRSA infections; oral = GI luminal C. difficile — they are NOT interchangeable",
                "Both routes treat bacteremia equally well",
                "Oral vancomycin is absorbed systemically and treats MRSA skin infections",
                "IV vancomycin is the preferred route for C. difficile",
                "Route makes no difference for vancomycin"
            ],
            answer: "IV = systemic MRSA infections; oral = GI luminal C. difficile — they are NOT interchangeable",
            explanation: "Route determines site of action. Oral vancomycin is not systemically absorbed enough for bloodstream infections.",
            objective: .pearl,
            relatedDrugIds: ["d110", "d111"],
            tags: ["contrast-pair", "vanco-routes", "differentiator", "route-distinction"]
        ),

        .trueFalse(
            id: "q6_ctr_013",
            subsectionId: "6d",
            difficulty: .easy,
            question: "Oral vancomycin can replace IV vancomycin for MRSA bacteremia.",
            answer: false,
            explanation: "Oral vancomycin is not reliably absorbed systemically. It cannot be used for bloodstream infections.",
            objective: .contraindication,
            relatedDrugIds: ["d110", "d111"],
            tags: ["contrast-pair", "vanco-routes", "route-distinction"]
        ),

        // MARK: - Linezolid vs Daptomycin (6d)

        .multipleChoice(
            id: "q6_ctr_014",
            subsectionId: "6d",
            difficulty: .medium,
            question: "Both cover resistant gram-positive infections, but one cannot be used for pneumonia. Which drug should NOT be used for primary bacterial pneumonia?",
            options: ["Daptomycin", "Linezolid", "Vancomycin (IV)", "TMP/SMX", "Ceftriaxone"],
            answer: "Daptomycin",
            explanation: "Daptomycin is inactivated by pulmonary surfactant. Linezolid is an option for MRSA pneumonia.",
            objective: .contraindication,
            relatedDrugIds: ["d112", "d113"],
            tags: ["contrast-pair", "linezolid-vs-daptomycin", "differentiator"]
        ),

        .multipleChoice(
            id: "q6_ctr_015",
            subsectionId: "6d",
            difficulty: .medium,
            question: "Which monitoring pair correctly matches these two resistant gram-positive drugs?",
            options: [
                "Linezolid = weekly CBC; Daptomycin = weekly CPK",
                "Linezolid = weekly CPK; Daptomycin = weekly CBC",
                "Both require weekly TSH",
                "Neither requires routine lab monitoring",
                "Both require weekly INR"
            ],
            answer: "Linezolid = weekly CBC; Daptomycin = weekly CPK",
            explanation: "Linezolid causes myelosuppression (monitor CBC). Daptomycin causes myopathy (monitor CPK).",
            objective: .monitoring,
            relatedDrugIds: ["d112", "d113"],
            tags: ["contrast-pair", "linezolid-vs-daptomycin", "differentiator"]
        ),

        .multipleChoice(
            id: "q6_ctr_016",
            subsectionId: "6d",
            difficulty: .hard,
            question: "A patient with MRSA pneumonia also takes sertraline. Between linezolid and daptomycin, which drug creates a serotonin-syndrome risk and which is contraindicated for pneumonia?",
            options: [
                "Linezolid has MAOI-like serotonin risk; daptomycin cannot treat pneumonia",
                "Daptomycin causes serotonin syndrome; linezolid cannot treat pneumonia",
                "Both are safe with sertraline and both treat pneumonia",
                "Neither has serotonin risk; both treat pneumonia equally",
                "Only vancomycin has serotonin risk"
            ],
            answer: "Linezolid has MAOI-like serotonin risk; daptomycin cannot treat pneumonia",
            explanation: "Linezolid is a weak MAOI (serotonin risk with SSRIs). Daptomycin is inactivated by surfactant (not for pneumonia).",
            objective: .interaction,
            relatedDrugIds: ["d112", "d113"],
            tags: ["contrast-pair", "linezolid-vs-daptomycin", "mini-case", "capstone"]
        ),

        // MARK: - TMP/SMX vs Nitrofurantoin (6d + 6e)

        .multipleChoice(
            id: "q6_ctr_017",
            subsectionId: "6d",
            difficulty: .easy,
            question: "Both are used for uncomplicated UTIs, but one is bladder-only while the other also has systemic uses (PJP prophylaxis, MRSA skin). Which one is bladder-only?",
            options: ["Nitrofurantoin", "TMP/SMX", "Vancomycin (oral)", "Linezolid", "Daptomycin"],
            answer: "Nitrofurantoin",
            explanation: "Nitrofurantoin concentrates in the urine and is not useful for systemic infections or pyelonephritis.",
            objective: .indication,
            relatedDrugIds: ["d109", "d236"],
            tags: ["contrast-pair", "tmpsmx-vs-nitrofurantoin", "site-distinction"]
        ),

        .multipleChoice(
            id: "q6_ctr_018",
            subsectionId: "6d",
            difficulty: .medium,
            question: "A patient has a UTI and also needs PJP prophylaxis. Which drug from these two covers both needs?",
            options: ["TMP/SMX", "Nitrofurantoin", "Vancomycin (oral)", "Daptomycin", "Nystatin"],
            answer: "TMP/SMX",
            explanation: "TMP/SMX treats UTIs and provides PJP prophylaxis. Nitrofurantoin is bladder-only.",
            objective: .indication,
            relatedDrugIds: ["d109", "d236"],
            tags: ["contrast-pair", "tmpsmx-vs-nitrofurantoin", "differentiator"]
        ),

        // MARK: - Acyclovir vs Valacyclovir (6e)

        .multipleChoice(
            id: "q6_ctr_019",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Both treat HSV and VZV, but one is a prodrug with better oral bioavailability. Which is the prodrug?",
            options: ["Valacyclovir", "Acyclovir", "Oseltamivir", "Fluconazole", "Terbinafine"],
            answer: "Valacyclovir",
            explanation: "Valacyclovir is the prodrug of acyclovir with better oral bioavailability and simpler dosing.",
            objective: .pearl,
            relatedDrugIds: ["d226", "d244"],
            tags: ["contrast-pair", "acyclovir-vs-valacyclovir", "differentiator"]
        ),

        .trueFalse(
            id: "q6_ctr_020",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Valacyclovir and acyclovir treat entirely different virus families.",
            answer: false,
            explanation: "Both treat the same viruses (HSV, VZV). Valacyclovir is simply a prodrug of acyclovir with improved oral absorption.",
            objective: .indication,
            relatedDrugIds: ["d226", "d244"],
            tags: ["contrast-pair", "acyclovir-vs-valacyclovir"]
        ),

        // MARK: - Fluconazole vs Ketoconazole (6e)

        .multipleChoice(
            id: "q6_ctr_021",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Both are azole antifungals, but one is used systemically for Candida while the other is mostly limited to topical use. Which is the systemic Candida azole?",
            options: ["Fluconazole", "Ketoconazole", "Nystatin", "Terbinafine", "Acyclovir"],
            answer: "Fluconazole",
            explanation: "Fluconazole is the systemic azole for Candida. Ketoconazole is mostly topical due to hepatotoxicity and interaction concerns.",
            objective: .indication,
            relatedDrugIds: ["d231", "d232"],
            tags: ["contrast-pair", "fluconazole-vs-ketoconazole", "route-distinction"]
        ),

        .multipleChoice(
            id: "q6_ctr_022",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Why is oral ketoconazole mostly avoided in favor of topical formulations?",
            options: [
                "Serious hepatotoxicity, adrenal suppression, and drug interaction concerns limit systemic use",
                "Ketoconazole has no antifungal activity when taken orally",
                "Ketoconazole is a macrolide, not an antifungal",
                "Oral ketoconazole causes tendon rupture like fluoroquinolones",
                "Ketoconazole is only effective against bacteria, not fungi"
            ],
            answer: "Serious hepatotoxicity, adrenal suppression, and drug interaction concerns limit systemic use",
            explanation: "Oral ketoconazole carries serious toxicity risks. Topical use avoids most of these systemic concerns.",
            objective: .contraindication,
            relatedDrugIds: ["d231", "d232"],
            tags: ["contrast-pair", "fluconazole-vs-ketoconazole", "differentiator"]
        ),

        // MARK: - Route/Site-Specific Questions

        .multipleChoice(
            id: "q6_ctr_023",
            subsectionId: "6e",
            difficulty: .easy,
            question: "In this module, ofloxacin is tested as a topical preparation. What site does this formulation target?",
            options: ["Ear and/or eye", "Lungs", "Bladder", "Gut lumen", "Systemic bloodstream"],
            answer: "Ear and/or eye",
            explanation: "Ofloxacin in this module refers to otic/ophthalmic topical use, not systemic therapy.",
            objective: .pearl,
            relatedDrugIds: ["d238"],
            tags: ["route-distinction", "site-of-use", "topical"]
        ),

        .multipleChoice(
            id: "q6_ctr_024",
            subsectionId: "6e",
            difficulty: .easy,
            question: "Which of these eye drops is the combination product containing polymyxin B and trimethoprim?",
            options: ["Polytrim", "Tobramycin drops", "Ofloxacin drops", "Nystatin suspension", "Fluconazole"],
            answer: "Polytrim",
            explanation: "Polymyxin B/trimethoprim (Polytrim) is the combination ophthalmic antibiotic for bacterial conjunctivitis.",
            objective: .brandGeneric,
            relatedDrugIds: ["d241"],
            tags: ["route-distinction", "topical", "combo-vs-single"]
        ),

        .matching(
            id: "q6_ctr_025",
            subsectionId: "6e",
            difficulty: .medium,
            question: "Match each drug to its primary site of use in this module:",
            pairs: [
                MatchingPair(left: "Ofloxacin", right: "Ear/Eye (topical)"),
                MatchingPair(left: "Nitrofurantoin", right: "Bladder only"),
                MatchingPair(left: "Nystatin", right: "Oral mucosa (swish & swallow)"),
                MatchingPair(left: "Vancomycin oral", right: "GI lumen (C. diff)")
            ],
            explanation: "Route and site of use are critical for these drugs: each one concentrates at a specific location rather than providing systemic coverage.",
            objective: .pearl,
            relatedDrugIds: ["d238", "d236", "d237", "d111"],
            tags: ["route-distinction", "site-of-use", "matching"]
        ),

        // MARK: - Family Recognition Matching

        .matching(
            id: "q6_ctr_026",
            subsectionId: "6b",
            difficulty: .medium,
            question: "Match each beta-lactam to its subclass:",
            pairs: [
                MatchingPair(left: "Amoxicillin", right: "Aminopenicillin"),
                MatchingPair(left: "Cephalexin", right: "1st-gen cephalosporin"),
                MatchingPair(left: "Ceftriaxone", right: "3rd-gen cephalosporin"),
                MatchingPair(left: "Cefepime", right: "4th-gen cephalosporin")
            ],
            explanation: "Beta-lactam subclass recognition is a foundation skill. Each drug sits in a distinct generation or subclass.",
            objective: .classId,
            relatedDrugIds: ["d98", "d101", "d102", "d103"],
            tags: ["family-recognition", "matching", "contrast-class"]
        ),

        .matching(
            id: "q6_ctr_027",
            subsectionId: "6d",
            difficulty: .medium,
            question: "Match each drug to its antibiotic class:",
            pairs: [
                MatchingPair(left: "TMP/SMX", right: "Sulfonamide combination"),
                MatchingPair(left: "Vancomycin", right: "Glycopeptide"),
                MatchingPair(left: "Linezolid", right: "Oxazolidinone"),
                MatchingPair(left: "Daptomycin", right: "Lipopeptide")
            ],
            explanation: "Each drug in 6d belongs to a distinct antibiotic class with a unique mechanism.",
            objective: .classId,
            relatedDrugIds: ["d109", "d110", "d112", "d113"],
            tags: ["family-recognition", "matching", "contrast-class"]
        ),

        .matching(
            id: "q6_ctr_028",
            subsectionId: "6d",
            difficulty: .hard,
            question: "Match each drug to its key monitoring requirement:",
            pairs: [
                MatchingPair(left: "Linezolid", right: "Weekly CBC"),
                MatchingPair(left: "Daptomycin", right: "Weekly CPK"),
                MatchingPair(left: "Vancomycin IV", right: "Renal function + trough levels"),
                MatchingPair(left: "TMP/SMX", right: "Potassium + renal function")
            ],
            explanation: "Monitoring varies dramatically across these resistant gram-positive and sulfonamide drugs.",
            objective: .monitoring,
            relatedDrugIds: ["d112", "d113", "d110", "d109"],
            tags: ["contrast-pair", "monitoring", "matching"]
        ),

        // MARK: - Beta-Lactam BLI Pairs

        .multipleChoice(
            id: "q6_ctr_029",
            subsectionId: "6b",
            difficulty: .medium,
            question: "This module has two beta-lactam + beta-lactamase inhibitor combinations. Which is the IV inpatient version?",
            options: ["Piperacillin/Tazobactam", "Amoxicillin/Clavulanate", "Cephalexin", "Ceftriaxone", "Cefepime"],
            answer: "Piperacillin/Tazobactam",
            explanation: "Piperacillin/tazobactam (Zosyn) is the IV BLI combination. Amoxicillin/clavulanate (Augmentin) is the oral BLI combination.",
            objective: .classId,
            relatedDrugIds: ["d99", "d100"],
            tags: ["contrast-pair", "beta-lactam-bli", "route-distinction", "combo-vs-single"]
        ),

        // MARK: - Capstone / Mini-Case Questions

        .multipleChoice(
            id: "q6_ctr_030",
            subsectionId: "6d",
            difficulty: .hard,
            question: "A patient has MRSA bacteremia. Vancomycin IV is started but trough levels are supratherapeutic with rising creatinine. The team considers alternatives. Which option correctly identifies the best substitute and why?",
            options: [
                "Daptomycin — covers MRSA bacteremia and avoids nephrotoxicity of vancomycin",
                "Vancomycin oral — same drug, just switch the route",
                "Daptomycin — because it also treats the patient's concurrent pneumonia",
                "Linezolid — because it is always first-line for bacteremia over daptomycin",
                "Nitrofurantoin — broad gram-positive systemic coverage"
            ],
            answer: "Daptomycin — covers MRSA bacteremia and avoids nephrotoxicity of vancomycin",
            explanation: "Daptomycin is a key MRSA bacteremia alternative. Oral vancomycin is NOT for systemic infection. Daptomycin does NOT treat pneumonia.",
            objective: .mixedReview,
            relatedDrugIds: ["d110", "d113", "d111"],
            tags: ["mini-case", "capstone", "contrast-pair", "vanco-routes"]
        ),

        .multipleChoice(
            id: "q6_ctr_031",
            subsectionId: "6b",
            difficulty: .hard,
            question: "A child with recurrent otitis media fails amoxicillin. The clinician steps up to a beta-lactam with a beta-lactamase inhibitor. Which is the best oral choice?",
            options: [
                "Amoxicillin/Clavulanate",
                "Piperacillin/Tazobactam",
                "Ceftriaxone",
                "Cefepime",
                "Vancomycin (oral)"
            ],
            answer: "Amoxicillin/Clavulanate",
            explanation: "Augmentin is the oral step-up from plain amoxicillin. Zosyn is IV-only. Ceftriaxone is parenteral.",
            objective: .indication,
            relatedDrugIds: ["d98", "d99"],
            tags: ["mini-case", "capstone", "amox-vs-amoxclav", "contrast-pair"]
        ),

        .multipleChoice(
            id: "q6_ctr_032",
            subsectionId: "6c",
            difficulty: .hard,
            question: "A patient with community-acquired pneumonia and CKD needs a fluoroquinolone. The team wants the option that typically does NOT require renal dose adjustment. Which drug fits best?",
            options: ["Moxifloxacin", "Levofloxacin", "Ciprofloxacin", "Azithromycin", "Doxycycline"],
            answer: "Moxifloxacin",
            explanation: "Moxifloxacin typically does not need renal dose adjustment, unlike levofloxacin and ciprofloxacin.",
            objective: .pearl,
            relatedDrugIds: ["d234", "d105", "d104"],
            tags: ["mini-case", "capstone", "cipro-vs-levo-vs-moxi"]
        ),

        .multipleChoice(
            id: "q6_ctr_033",
            subsectionId: "6e",
            difficulty: .hard,
            question: "A patient with genital herpes asks about the easiest outpatient regimen. Between acyclovir and valacyclovir, which offers simpler dosing and why?",
            options: [
                "Valacyclovir — prodrug with better bioavailability, usually less frequent dosing",
                "Acyclovir — it is the newer prodrug with once-daily dosing",
                "Both are identical in dosing frequency",
                "Valacyclovir — because it does not need renal dose adjustment",
                "Acyclovir — because it is only available IV, simplifying oral choices"
            ],
            answer: "Valacyclovir — prodrug with better bioavailability, usually less frequent dosing",
            explanation: "Valacyclovir is acyclovir's prodrug. Better absorption allows simpler dosing schedules.",
            objective: .pearl,
            relatedDrugIds: ["d226", "d244"],
            tags: ["mini-case", "capstone", "acyclovir-vs-valacyclovir"]
        ),

        // MARK: - Select-All (advanced only, strong data)

        .selectAll(
            id: "q6_ctr_034",
            subsectionId: "6d",
            difficulty: .hard,
            question: "Which of these drugs can be used for MRSA infections? (Select all that apply)",
            options: ["Vancomycin (IV)", "Linezolid", "Daptomycin", "TMP/SMX", "Vancomycin (oral)"],
            correctAnswers: ["Vancomycin (IV)", "Linezolid", "Daptomycin", "TMP/SMX"],
            explanation: "IV vancomycin, linezolid, daptomycin, and TMP/SMX all have roles in MRSA management. Oral vancomycin is for C. difficile, not systemic MRSA.",
            objective: .indication,
            relatedDrugIds: ["d110", "d112", "d113", "d109", "d111"],
            tags: ["contrast-pair", "select-all", "vanco-routes"]
        ),

        .selectAll(
            id: "q6_ctr_035",
            subsectionId: "6b",
            difficulty: .hard,
            question: "Which of these beta-lactams are combination products that include a beta-lactamase inhibitor? (Select all that apply)",
            options: ["Amoxicillin/Clavulanate", "Piperacillin/Tazobactam", "Amoxicillin", "Cephalexin", "Ceftriaxone"],
            correctAnswers: ["Amoxicillin/Clavulanate", "Piperacillin/Tazobactam"],
            explanation: "Augmentin (amox/clav) and Zosyn (pip/tazo) are the two BLI combinations. The others are single-agent beta-lactams.",
            objective: .classId,
            relatedDrugIds: ["d99", "d100", "d98", "d101", "d102"],
            tags: ["contrast-pair", "select-all", "combo-vs-single"]
        ),
    ]
}
