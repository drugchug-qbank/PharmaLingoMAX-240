// PharmaLingo — Module 6d (Sulfonamides & Other Common Antibiotics)
// Curated Add-On Question Pack (45 questions)
// IDs: q6d_add_001 ... q6d_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 6d exists, then append:
//
//    if bank["6d"] == nil { bank["6d"] = [] }
//    bank["6d"]?.append(contentsOf: Self.curatedAddOnQuestions_6d)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs: d109 (TMP/SMX), d110 (Vancomycin IV),
//   d111 (Vancomycin oral), d112 (Linezolid), d113 (Daptomycin).
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_6d: [Question] = [
    .multipleChoice(
        id: "q6d_add_001",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Bactrim is the classic sulfonamide combination students remember for uncomplicated UTIs, some community-acquired MRSA skin infections, and Pneumocystis jirovecii prophylaxis. What is the generic name of Bactrim?",
        options: ["Trimethoprim/Sulfamethoxazole", "Linezolid", "Daptomycin", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Trimethoprim/Sulfamethoxazole",
        explanation: "Bactrim is the brand name for trimethoprim/sulfamethoxazole. It is the high-yield sulfonamide combination in this subsection.",
        objective: .brandGeneric,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_002",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Trimethoprim/sulfamethoxazole combines 2 folate-pathway inhibitors and is high yield for UTI, outpatient MRSA skin coverage, and PJP prophylaxis. Which brand name matches trimethoprim/sulfamethoxazole?",
        options: ["Bactrim", "Zyvox", "Cubicin", "Vancocin", "Levaquin"],
        answer: "Bactrim",
        explanation: "Trimethoprim/sulfamethoxazole is sold as Bactrim. Pairing Bactrim with TMP/SMX helps separate it from Zyvox and Cubicin, which cover resistant gram-positive infections.",
        objective: .genericBrand,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_003",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Zyvox is the oxazolidinone students often associate with VRE, MRSA pneumonia, weekly CBC monitoring, and serotonin-syndrome questions. What is the generic name of Zyvox?",
        options: ["Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Linezolid",
        explanation: "Zyvox is the brand name for linezolid. It is the oxazolidinone in this subsection and is famous for myelosuppression and MAOI-like interaction pearls.",
        objective: .brandGeneric,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_004",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Linezolid is the resistant gram-positive antibiotic that can cover VRE and MRSA pneumonia and is notable for serotonin-syndrome and thrombocytopenia teaching pearls. Which brand name matches linezolid?",
        options: ["Zyvox", "Cubicin", "Bactrim", "Vancocin", "Rocephin"],
        answer: "Zyvox",
        explanation: "Linezolid is sold as Zyvox. That brand-generic pair is worth knowing because linezolid questions often hinge on CBC monitoring and serotonergic drug interactions.",
        objective: .genericBrand,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_005",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Cubicin is the lipopeptide best remembered for MRSA bacteremia, weekly CPK checks, and the rule that it should not be used for primary bacterial pneumonia. What is the generic name of Cubicin?",
        options: ["Daptomycin", "Linezolid", "Trimethoprim/Sulfamethoxazole", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Daptomycin",
        explanation: "Cubicin is the brand name for daptomycin. Daptomycin is the membrane-active lipopeptide in this subsection.",
        objective: .brandGeneric,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_006",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Daptomycin is the membrane-depolarizing gram-positive agent linked to myopathy, eosinophilic pneumonia, and the “not for pneumonia” pearl. Which brand name matches daptomycin?",
        options: ["Cubicin", "Zyvox", "Bactrim", "Vancocin", "Maxipime"],
        answer: "Cubicin",
        explanation: "Daptomycin is sold as Cubicin. Remembering Cubicin helps distinguish daptomycin from Zyvox, which is linezolid.",
        objective: .genericBrand,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_007",
        subsectionId: "6d",
        difficulty: .easy,
        question: "In your drug list, vancomycin appears as separate IV and oral entries because route completely changes what the drug is used for. Which route-specific entry is intended to stay in the gut lumen for C. difficile colitis rather than treat bacteremia?",
        options: ["Vancomycin (oral)", "Vancomycin (IV)", "Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole"],
        answer: "Vancomycin (oral)",
        explanation: "Vancomycin (oral) is the route-specific entry used for C. difficile colitis. It is used in the gut, not as systemic MRSA therapy.",
        objective: .indication,
        relatedDrugIds: ["d111"],
        tags: ["6d", "vancomycin-oral", "route", "c-diff"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_008",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Your module also lists a systemic vancomycin formulation for serious gram-positive infections such as MRSA bacteremia. Which route-specific entry represents that formulation?",
        options: ["Vancomycin (IV)", "Vancomycin (oral)", "Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole"],
        answer: "Vancomycin (IV)",
        explanation: "Vancomycin (IV) is the systemic formulation used for serious gram-positive infections. Route is everything with vancomycin questions.",
        objective: .indication,
        relatedDrugIds: ["d110"],
        tags: ["6d", "vancomycin-iv", "route", "systemic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_009",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Both IV vancomycin and oral vancomycin are the same antibiotic given by different routes for different clinical goals. Which antibiotic class do they belong to?",
        options: ["Glycopeptides", "Oxazolidinones", "Lipopeptides", "Sulfonamide combinations", "Fluoroquinolones"],
        answer: "Glycopeptides",
        explanation: "Vancomycin is a glycopeptide antibiotic. The route changes the use, but the class stays the same.",
        objective: .classId,
        relatedDrugIds: ["d110", "d111"],
        tags: ["6d", "vancomycin", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_010",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Linezolid is separated from the beta-lactams and vancomycin because it belongs to a different resistant gram-positive class with ribosomal activity. What class is linezolid?",
        options: ["Oxazolidinone", "Glycopeptide", "Lipopeptide", "Sulfonamide combination", "Macrolide"],
        answer: "Oxazolidinone",
        explanation: "Linezolid is an oxazolidinone. This class distinction helps explain its unique ribosomal mechanism and myelosuppression profile.",
        objective: .classId,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_011",
        subsectionId: "6d",
        difficulty: .easy,
        question: "Daptomycin stands out from the other drugs in this subsection because it kills bacteria by disrupting the cell membrane rather than working at the ribosome or folate pathway. What class is daptomycin?",
        options: ["Lipopeptide", "Oxazolidinone", "Glycopeptide", "Sulfonamide combination", "Tetracycline"],
        answer: "Lipopeptide",
        explanation: "Daptomycin is a lipopeptide. It is the membrane-active anti-MRSA agent associated with weekly CPK monitoring.",
        objective: .classId,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_012",
        subsectionId: "6d",
        difficulty: .easy,
        question: "TMP/SMX is not a cell-wall agent like vancomycin and not a protein-synthesis inhibitor like linezolid. How is trimethoprim/sulfamethoxazole best classified in this subsection?",
        options: ["Sulfonamide combination", "Glycopeptide", "Lipopeptide", "Oxazolidinone", "Carbapenem"],
        answer: "Sulfonamide combination",
        explanation: "Trimethoprim/sulfamethoxazole is the sulfonamide combination in this subsection. It is best remembered as a sequential folate-pathway inhibitor.",
        objective: .classId,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_013",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Linezolid treats resistant gram-positive infections by shutting down bacterial protein synthesis in a distinctive way. Which target best explains its mechanism?",
        options: ["50S ribosomal subunit and initiation-complex formation", "30S ribosomal subunit and tRNA binding", "Bacterial DNA gyrase", "Dihydropteroate synthase plus dihydrofolate reductase", "D-Ala-D-Ala cell-wall binding"],
        answer: "50S ribosomal subunit and initiation-complex formation",
        explanation: "Linezolid acts at the 50S ribosomal subunit and prevents formation of the 70S initiation complex. That separates it from TMP/SMX, vancomycin, and daptomycin mechanistically.",
        objective: .moa,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "moa", "50S"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_014",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Daptomycin is often taught as the anti-MRSA drug that does not work by hitting the cell wall or ribosome. Which mechanism best describes daptomycin?",
        options: ["Rapid depolarization of the bacterial cell membrane", "Sequential blockade of folate synthesis", "Irreversible inhibition of 50S peptide translocation", "Binding penicillin-binding proteins to block cross-linking", "Inhibition of topoisomerase IV and DNA gyrase"],
        answer: "Rapid depolarization of the bacterial cell membrane",
        explanation: "Daptomycin depolarizes the bacterial membrane, leading to loss of membrane potential and cell death. That membrane effect is the key mechanism pearl.",
        objective: .moa,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "moa", "membrane"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_015",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Trimethoprim/sulfamethoxazole is more than just a “sulfa antibiotic” because it combines 2 antibacterial mechanisms in sequence. Which description best matches TMP/SMX?",
        options: ["Sequential inhibition of bacterial folate synthesis", "Direct disruption of the bacterial cell membrane", "Binding to D-Ala-D-Ala to block cell-wall synthesis", "Inhibition of the 50S initiation complex", "Inhibition of bacterial RNA polymerase"],
        answer: "Sequential inhibition of bacterial folate synthesis",
        explanation: "TMP/SMX works by sequentially blocking folate synthesis, with sulfamethoxazole acting upstream and trimethoprim acting downstream. That combined mechanism is a classic exam pearl.",
        objective: .moa,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "moa", "folate"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_016",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Whether given orally for C. difficile or intravenously for systemic MRSA infection, vancomycin keeps the same core antibacterial mechanism. Which mechanism best describes vancomycin?",
        options: ["Binding D-Ala-D-Ala to inhibit cell-wall synthesis", "Blocking the 30S ribosomal subunit", "Depolarizing the bacterial membrane", "Blocking folate synthesis at 2 steps", "Inhibiting DNA gyrase"],
        answer: "Binding D-Ala-D-Ala to inhibit cell-wall synthesis",
        explanation: "Vancomycin binds the D-Ala-D-Ala terminus of cell-wall precursors and inhibits cell-wall synthesis. Route changes use, not mechanism.",
        objective: .moa,
        relatedDrugIds: ["d110", "d111"],
        tags: ["6d", "vancomycin", "moa", "cell-wall"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_017",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A patient has profuse antibiotic-associated diarrhea and a positive C. difficile test. The goal is to deliver antibiotic activity inside the colon rather than the bloodstream. Which drug from this subsection is the best match?",
        options: ["Vancomycin (oral)", "Vancomycin (IV)", "Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole"],
        answer: "Vancomycin (oral)",
        explanation: "Oral vancomycin is used for C. difficile colitis because it acts within the GI tract. IV vancomycin is not the treatment for C. difficile colitis.",
        objective: .indication,
        relatedDrugIds: ["d111"],
        tags: ["6d", "vancomycin-oral", "indication", "c-diff"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_018",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A hospitalized patient has MRSA bacteremia and needs systemic therapy that reaches the bloodstream. Which route-specific drug from this subsection best matches that role?",
        options: ["Vancomycin (IV)", "Vancomycin (oral)", "Linezolid", "Trimethoprim/Sulfamethoxazole", "Doxycycline"],
        answer: "Vancomycin (IV)",
        explanation: "IV vancomycin is the systemic glycopeptide option for serious gram-positive infections such as MRSA bacteremia. Oral vancomycin is not used for bloodstream infection.",
        objective: .indication,
        relatedDrugIds: ["d110"],
        tags: ["6d", "vancomycin-iv", "indication", "mrsa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_019",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which drug in this subsection is the classic answer for vancomycin-resistant Enterococcus coverage and is also high yield for MRSA pneumonia questions?",
        options: ["Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Linezolid",
        explanation: "Linezolid is the classic VRE drug in this subsection and is also a major option in MRSA pneumonia teaching questions.",
        objective: .indication,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "indication", "vre"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_020",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which drug is best remembered for MRSA bacteremia and right-sided endocarditis but comes with the equally important rule that it should not be used for primary bacterial pneumonia?",
        options: ["Daptomycin", "Linezolid", "Trimethoprim/Sulfamethoxazole", "Vancomycin (oral)", "Clarithromycin"],
        answer: "Daptomycin",
        explanation: "Daptomycin is the bacteremia and endocarditis pearl drug. It should not be used for primary bacterial pneumonia.",
        objective: .indication,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "indication", "bacteremia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_021",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which drug from this subsection is the classic oral option for uncomplicated UTI and is also high yield for Pneumocystis jirovecii prophylaxis?",
        options: ["Trimethoprim/Sulfamethoxazole", "Linezolid", "Daptomycin", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Trimethoprim/Sulfamethoxazole",
        explanation: "TMP/SMX is the classic oral UTI drug in this subsection and is also the key PJP prophylaxis agent.",
        objective: .indication,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "indication", "uti"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_022",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which route-specific antibiotic in this subsection would be a poor choice for bacteremia or pneumonia because it is intended for luminal GI infection rather than reliable systemic exposure?",
        options: ["Vancomycin (oral)", "Vancomycin (IV)", "Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole"],
        answer: "Vancomycin (oral)",
        explanation: "Oral vancomycin is intended for infections within the GI tract, especially C. difficile. It is not the route used for systemic MRSA infection.",
        objective: .pearl,
        relatedDrugIds: ["d111"],
        tags: ["6d", "vancomycin-oral", "pearl", "not-systemic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_023",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A hospitalized patient improves on IV therapy for MRSA pneumonia and the team wants an oral step-down option that still provides dependable systemic exposure. Which drug from this subsection is most famous for that IV-to-PO flexibility?",
        options: ["Linezolid", "Vancomycin (oral)", "Vancomycin (IV)", "Daptomycin", "Trimethoprim/Sulfamethoxazole"],
        answer: "Linezolid",
        explanation: "Linezolid has excellent oral bioavailability, which makes IV-to-PO conversion a classic teaching pearl when systemic therapy is still needed.",
        objective: .pearl,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "pearl", "iv-po"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_024",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which drug in this subsection requires weekly creatine phosphokinase monitoring because myopathy and rhabdomyolysis are high-yield concerns?",
        options: ["Daptomycin", "Linezolid", "Trimethoprim/Sulfamethoxazole", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Daptomycin",
        explanation: "Weekly CPK monitoring is a classic daptomycin pearl. Muscle toxicity is one of the first adverse effects students should associate with this drug.",
        objective: .monitoring,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "monitoring", "cpk"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_025",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A patient started on daptomycin for MRSA bacteremia now reports new diffuse muscle pain and weakness. Which lab is the most important to check right away?",
        options: ["Creatine phosphokinase (CPK)", "Platelet count", "International normalized ratio (INR)", "Thyroid-stimulating hormone (TSH)", "Total bilirubin"],
        answer: "Creatine phosphokinase (CPK)",
        explanation: "Daptomycin can cause myopathy and rhabdomyolysis, so CPK is the high-yield lab to check when muscle symptoms appear.",
        objective: .adverseEffect,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "adverse-effect", "cpk"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_026",
        subsectionId: "6d",
        difficulty: .hard,
        question: "After a few weeks of daptomycin, a patient develops fever, dyspnea, hypoxia, and new diffuse pulmonary infiltrates. Which high-yield toxicity should be suspected?",
        options: ["Eosinophilic pneumonia", "Serotonin syndrome", "Red man syndrome", "Optic neuropathy", "C. difficile colitis"],
        answer: "Eosinophilic pneumonia",
        explanation: "Daptomycin can cause eosinophilic pneumonia. New respiratory symptoms and infiltrates during therapy should prompt urgent evaluation and discontinuation.",
        objective: .adverseEffect,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "adverse-effect", "eosinophilic-pneumonia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_027",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which drug requires weekly CBC monitoring, especially when treatment goes beyond 2 weeks, because myelosuppression and thrombocytopenia can develop?",
        options: ["Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Linezolid",
        explanation: "Weekly CBC monitoring is a classic linezolid requirement because myelosuppression, including thrombocytopenia, can occur.",
        objective: .monitoring,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "monitoring", "cbc"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_028",
        subsectionId: "6d",
        difficulty: .hard,
        question: "Which complication is most strongly associated with prolonged linezolid therapy beyond the usual maximum duration and should trigger visual or neurologic concern?",
        options: ["Peripheral or optic neuropathy", "Red man syndrome", "Tendon rupture", "Eosinophilic pneumonia", "Hyperuricemia"],
        answer: "Peripheral or optic neuropathy",
        explanation: "Prolonged linezolid therapy is associated with peripheral and optic neuropathy. Visual symptoms on linezolid deserve prompt attention.",
        objective: .adverseEffect,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "adverse-effect", "neuropathy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_029",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A patient taking sertraline is prescribed an antibiotic from this subsection that behaves as a weak MAOI. Which drug creates the classic serotonin-syndrome interaction concern?",
        options: ["Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Linezolid",
        explanation: "Linezolid has MAOI-like properties, so combining it with serotonergic drugs such as SSRIs can increase the risk of serotonin syndrome.",
        objective: .interaction,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "interaction", "serotonin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_030",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A patient stable on warfarin is started on TMP/SMX for a UTI. Which interaction outcome is the most high yield to anticipate?",
        options: ["INR may rise and bleeding risk may increase", "INR will reliably fall and clot risk will rise", "Warfarin becomes ineffective only if taken with food", "The combination causes red man syndrome", "No meaningful interaction should be expected"],
        answer: "INR may rise and bleeding risk may increase",
        explanation: "TMP/SMX can increase the anticoagulant effect of warfarin, so INR can rise and bleeding risk can increase.",
        objective: .interaction,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "interaction", "warfarin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_031",
        subsectionId: "6d",
        difficulty: .medium,
        question: "An older adult on lisinopril is prescribed TMP/SMX. Which electrolyte problem becomes especially important to watch for with this combination?",
        options: ["Hyperkalemia", "Hypokalemia", "Hypercalcemia", "Hypophosphatemia", "Hypernatremia"],
        answer: "Hyperkalemia",
        explanation: "TMP/SMX can increase potassium, and the risk becomes more important in patients with renal impairment or those already taking drugs that raise potassium such as ACE inhibitors.",
        objective: .interaction,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "interaction", "hyperkalemia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_032",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which drug from this subsection is most associated with sulfonamide hypersensitivity, including severe rash reactions such as Stevens-Johnson syndrome or toxic epidermal necrolysis?",
        options: ["Trimethoprim/Sulfamethoxazole", "Linezolid", "Daptomycin", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Trimethoprim/Sulfamethoxazole",
        explanation: "TMP/SMX is the sulfonamide combination in this subsection and is the classic answer for severe sulfa-type cutaneous reactions.",
        objective: .adverseEffect,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "adverse-effect", "sjs"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_033",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which formulation in this subsection is most associated with flushing, pruritus, and erythema of the face, neck, and upper torso when infused too rapidly?",
        options: ["Vancomycin (IV)", "Vancomycin (oral)", "Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole"],
        answer: "Vancomycin (IV)",
        explanation: "Rapid IV vancomycin administration can cause infusion-related reactions, classically called red man syndrome.",
        objective: .adverseEffect,
        relatedDrugIds: ["d110"],
        tags: ["6d", "vancomycin-iv", "adverse-effect", "infusion-reaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_034",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Rapid infusion of IV vancomycin most classically causes which reaction that can often be reduced by slowing the infusion?",
        options: ["Red man syndrome", "Serotonin syndrome", "Anaphylaxis from every dose", "Tendon rupture", "Drug-induced lupus"],
        answer: "Red man syndrome",
        explanation: "Red man syndrome is the classic infusion-related vancomycin reaction. A key administration pearl is to infuse the drug over at least 60 minutes.",
        objective: .dosing,
        relatedDrugIds: ["d110"],
        tags: ["6d", "vancomycin-iv", "dosing", "red-man"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_035",
        subsectionId: "6d",
        difficulty: .hard,
        question: "Which antibiotic-and-monitoring pair is correctly matched?",
        options: ["Daptomycin — weekly CPK", "Linezolid — weekly TSH", "Vancomycin (IV) — weekly INR", "Trimethoprim/Sulfamethoxazole — routine troponin levels", "Vancomycin (oral) — weekly CPK"],
        answer: "Daptomycin — weekly CPK",
        explanation: "Daptomycin is the antibiotic most classically matched with weekly CPK monitoring because of myopathy and rhabdomyolysis risk.",
        objective: .mixedReview,
        relatedDrugIds: ["d113", "d112", "d110"],
        tags: ["6d", "monitoring", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_036",
        subsectionId: "6d",
        difficulty: .hard,
        question: "Students often learn that oral vancomycin is not systemically absorbed, but there is one important nuance. Which formulation may still occasionally lead to measurable serum concentrations in severe active C. difficile colitis, especially when renal impairment is present?",
        options: ["Vancomycin (oral)", "Vancomycin (IV)", "Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole"],
        answer: "Vancomycin (oral)",
        explanation: "Oral vancomycin is intended to stay in the GI tract, but measurable serum concentrations can occur in some patients with severe active colitis, particularly when renal impairment is present.",
        objective: .monitoring,
        relatedDrugIds: ["d111"],
        tags: ["6d", "vancomycin-oral", "monitoring", "renal"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_037",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A patient taking a high-intensity statin now needs daptomycin for MRSA bacteremia. Why does this combination deserve extra attention?",
        options: ["Both are linked to muscle toxicity, so CPK monitoring becomes even more important", "The statin blocks daptomycin absorption from the gut", "The combination specifically causes serotonin syndrome", "The statin makes daptomycin ineffective in pneumonia", "The combination predictably lowers INR"],
        answer: "Both are linked to muscle toxicity, so CPK monitoring becomes even more important",
        explanation: "Daptomycin already carries a myopathy/rhabdomyolysis signal, and concomitant statins can increase concern for muscle toxicity, making CPK monitoring especially important.",
        objective: .interaction,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "interaction", "statin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_038",
        subsectionId: "6d",
        difficulty: .medium,
        question: "Which drug from this subsection should be avoided for primary bacterial pneumonia because pulmonary surfactant inactivates it?",
        options: ["Daptomycin", "Linezolid", "Vancomycin (IV)", "Trimethoprim/Sulfamethoxazole", "Vancomycin (oral)"],
        answer: "Daptomycin",
        explanation: "Daptomycin is not used for primary bacterial pneumonia because pulmonary surfactant inactivates it. This is one of the most tested pearls in the entire subsection.",
        objective: .pearl,
        relatedDrugIds: ["d113"],
        tags: ["6d", "daptomycin", "pearl", "pneumonia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_039",
        subsectionId: "6d",
        difficulty: .hard,
        question: "A student says, “Vancomycin is vancomycin, so the IV and oral products can be swapped freely.” Which correction is best?",
        options: ["Route determines the site of action: oral vancomycin is for GI infection like C. difficile, while IV vancomycin is for systemic infections", "The oral and IV products are interchangeable because both reliably treat bacteremia", "IV vancomycin is preferred for C. difficile because it reaches the colon through the bloodstream", "Oral vancomycin is the better choice for MRSA endocarditis because it is safer", "Both routes should always be given together for pneumonia"],
        answer: "Route determines the site of action: oral vancomycin is for GI infection like C. difficile, while IV vancomycin is for systemic infections",
        explanation: "The route distinction is the single most important vancomycin teaching pearl in this subsection. Oral vancomycin is for luminal GI infection; IV vancomycin is for systemic infection.",
        objective: .pearl,
        relatedDrugIds: ["d110", "d111"],
        tags: ["6d", "vancomycin", "route", "pearl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_040",
        subsectionId: "6d",
        difficulty: .hard,
        question: "Which drug in this subsection carries the classic sulfonamide concern for kernicterus and is generally avoided late in pregnancy and in very young infants?",
        options: ["Trimethoprim/Sulfamethoxazole", "Linezolid", "Daptomycin", "Vancomycin (IV)", "Vancomycin (oral)"],
        answer: "Trimethoprim/Sulfamethoxazole",
        explanation: "TMP/SMX carries classic sulfonamide pregnancy and newborn concerns, including kernicterus risk, making it a high-yield caution point.",
        objective: .contraindication,
        relatedDrugIds: ["d109"],
        tags: ["6d", "tmp-smx", "pregnancy", "kernicterus"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_041",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A patient on prolonged IV vancomycin for MRSA osteomyelitis needs safety follow-up. Which monitoring focus is most important to reduce the risk of accumulation and nephrotoxicity?",
        options: ["Renal function and vancomycin serum concentrations", "CBC and platelet count only", "CPK only", "INR only", "Serum uric acid only"],
        answer: "Renal function and vancomycin serum concentrations",
        explanation: "IV vancomycin monitoring centers on kidney function and drug exposure. Those are the classic high-yield safety checks for systemic vancomycin therapy.",
        objective: .monitoring,
        relatedDrugIds: ["d110"],
        tags: ["6d", "vancomycin-iv", "monitoring", "renal"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_042",
        subsectionId: "6d",
        difficulty: .hard,
        question: "A patient with MRSA pneumonia has a documented history of severe vancomycin infusion reactions despite slow administration. Which drug from this subsection is the best single alternative if the team also wants a route that can later be switched to oral therapy?",
        options: ["Linezolid", "Daptomycin", "Trimethoprim/Sulfamethoxazole", "Vancomycin (oral)", "Ceftriaxone"],
        answer: "Linezolid",
        explanation: "Linezolid is a strong alternative in MRSA pneumonia and has excellent oral bioavailability, making later IV-to-PO conversion feasible. Daptomycin is not used for primary bacterial pneumonia.",
        objective: .mixedReview,
        relatedDrugIds: ["d112", "d110"],
        tags: ["6d", "mrsa-pneumonia", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_043",
        subsectionId: "6d",
        difficulty: .hard,
        question: "A patient has vancomycin-resistant Enterococcus bacteremia. Which drug in this subsection most directly matches the classic VRE teaching pearl?",
        options: ["Linezolid", "Vancomycin (IV)", "Vancomycin (oral)", "Trimethoprim/Sulfamethoxazole", "Daptomycin"],
        answer: "Linezolid",
        explanation: "Linezolid is the classic VRE answer in this subsection. Vancomycin would not be the choice for vancomycin-resistant Enterococcus.",
        objective: .mixedReview,
        relatedDrugIds: ["d112"],
        tags: ["6d", "linezolid", "vre", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_044",
        subsectionId: "6d",
        difficulty: .medium,
        question: "A patient has confirmed C. difficile colitis after a recent course of clindamycin. Which option from this subsection best targets the infection at the site where it lives?",
        options: ["Vancomycin (oral)", "Trimethoprim/Sulfamethoxazole", "Daptomycin", "Vancomycin (IV)", "Linezolid"],
        answer: "Vancomycin (oral)",
        explanation: "For C. difficile colitis, oral vancomycin delivers therapy to the colon. IV vancomycin does not replace the oral route for this purpose.",
        objective: .mixedReview,
        relatedDrugIds: ["d111", "d109"],
        tags: ["6d", "c-diff", "comparison"],
        source: .curated
    ),

    .multipleChoice(
        id: "q6d_add_045",
        subsectionId: "6d",
        difficulty: .hard,
        question: "A patient with MRSA pneumonia also takes sertraline and already has baseline thrombocytopenia. Looking only at the drugs in this subsection, which option best avoids both the linezolid serotonin/myelosuppression issues and the daptomycin “not for pneumonia” problem?",
        options: ["Vancomycin (IV)", "Linezolid", "Daptomycin", "Vancomycin (oral)", "Trimethoprim/Sulfamethoxazole"],
        answer: "Vancomycin (IV)",
        explanation: "IV vancomycin is the best fit here. Linezolid raises serotonin-syndrome and thrombocytopenia concerns, while daptomycin should not be used for primary bacterial pneumonia.",
        objective: .mixedReview,
        relatedDrugIds: ["d110", "d112", "d113"],
        tags: ["6d", "comparison", "adverse-effect"],
        source: .curated
    )

    ]
}