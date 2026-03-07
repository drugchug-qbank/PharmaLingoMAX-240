// PharmaLingo — Module 5d (DMARDs & Biologics + Immunosuppressants)
// Curated Add-On Question Pack (45 questions)
// IDs: q5d_add_001 ... q5d_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 5d exists, then append:
//
//    if bank["5d"] == nil { bank["5d"] = [] }
//    bank["5d"]?.append(contentsOf: Self.curatedAddOnQuestions_5d)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs: d167 (Methotrexate), d168 (Hydroxychloroquine),
//   d169 (Adalimumab), d170 (Etanercept), d178 (Tacrolimus), d179 (Cyclosporine),
//   d180 (Mycophenolate mofetil), d181 (Azathioprine).

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5d: [Question] = [
.multipleChoice(
    id: "q5d_add_001",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Humira is a TNF-blocking biologic used across rheumatoid arthritis, psoriasis, Crohn's disease, and ulcerative colitis, so the brand comes up in several specialties. What is the generic name of Humira?",
    options: ["Adalimumab", "Etanercept", "Methotrexate", "Tacrolimus", "Mycophenolate mofetil"],
    answer: "Adalimumab",
    explanation: "Humira is the brand name for adalimumab. Pairing the brand with its generic helps students connect the same TNF blocker across rheumatology, dermatology, and gastroenterology.",
    objective: .brandGeneric,
    relatedDrugIds: ["d169"],
    tags: ["Humira", "adalimumab", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_002",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Adalimumab is a subcutaneous anti-TNF biologic used for inflammatory autoimmune disease and remembered for serious infection and TB screening warnings. Which brand name matches adalimumab?",
    options: ["Humira", "Enbrel", "Plaquenil", "CellCept", "Prograf"],
    answer: "Humira",
    explanation: "Adalimumab is marketed as Humira. This is one of the highest-yield brand-generic pairs in immunology and rheumatology.",
    objective: .genericBrand,
    relatedDrugIds: ["d169"],
    tags: ["adalimumab", "Humira", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_003",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Enbrel is a TNF-blocking biologic used for rheumatoid arthritis and psoriasis, so recognizing the generic helps distinguish it from Humira and other injectables. What is the generic name of Enbrel?",
    options: ["Etanercept", "Adalimumab", "Azathioprine", "Cyclosporine", "Hydroxychloroquine"],
    answer: "Etanercept",
    explanation: "Enbrel is the brand name for etanercept. Students should learn Enbrel and Humira as different anti-TNF options, not interchangeable names for the same drug.",
    objective: .brandGeneric,
    relatedDrugIds: ["d170"],
    tags: ["Enbrel", "etanercept", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_004",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Etanercept is the anti-TNF biologic that is actually a receptor fusion protein rather than a monoclonal antibody. Which brand name matches etanercept?",
    options: ["Enbrel", "Humira", "Imuran", "Trexall", "Neoral / Sandimmune"],
    answer: "Enbrel",
    explanation: "Etanercept is sold as Enbrel. Remembering this pair helps separate etanercept from adalimumab, another TNF blocker in the same subsection.",
    objective: .genericBrand,
    relatedDrugIds: ["d170"],
    tags: ["etanercept", "Enbrel", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_005",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Plaquenil is a conventional DMARD with antimalarial roots that is commonly used in rheumatoid arthritis and lupus but requires long-term eye monitoring. What is the generic name of Plaquenil?",
    options: ["Hydroxychloroquine", "Methotrexate", "Azathioprine", "Tacrolimus", "Mycophenolate mofetil"],
    answer: "Hydroxychloroquine",
    explanation: "Plaquenil is the brand name for hydroxychloroquine. This pair is especially high yield because retinal toxicity monitoring is tied to hydroxychloroquine use.",
    objective: .brandGeneric,
    relatedDrugIds: ["d168"],
    tags: ["Plaquenil", "hydroxychloroquine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_006",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Hydroxychloroquine is the slower-onset DMARD often used in RA and SLE and remembered for retinal toxicity screening rather than broad immunosuppression. Which brand name matches hydroxychloroquine?",
    options: ["Plaquenil", "Trexall / Rheumatrex", "Humira", "Enbrel", "CellCept"],
    answer: "Plaquenil",
    explanation: "Hydroxychloroquine is marketed as Plaquenil. Linking the generic and brand helps anchor the eye-exam counseling pearl.",
    objective: .genericBrand,
    relatedDrugIds: ["d168"],
    tags: ["hydroxychloroquine", "Plaquenil", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_007",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Trexall and Rheumatrex are brand names tied to the classic weekly RA anchor drug that also needs folic acid counseling and pregnancy avoidance. What is the generic name of Trexall / Rheumatrex?",
    options: ["Methotrexate", "Hydroxychloroquine", "Azathioprine", "Tacrolimus", "Cyclosporine"],
    answer: "Methotrexate",
    explanation: "Trexall and Rheumatrex are brand names for methotrexate. Methotrexate is the classic anchor DMARD for RA and is famous for being dosed weekly, not daily.",
    objective: .brandGeneric,
    relatedDrugIds: ["d167"],
    tags: ["Trexall", "Rheumatrex", "methotrexate", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_008",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Methotrexate is the conventional DMARD most students associate with weekly dosing, folic acid, liver monitoring, and embryo-fetal toxicity. Which brand name pair matches methotrexate?",
    options: ["Trexall / Rheumatrex", "Plaquenil", "Imuran", "CellCept", "Prograf"],
    answer: "Trexall / Rheumatrex",
    explanation: "Methotrexate is marketed as Trexall and Rheumatrex. Knowing both brand names helps avoid missing the drug when it appears outside a simple generic list.",
    objective: .genericBrand,
    relatedDrugIds: ["d167"],
    tags: ["methotrexate", "Trexall", "Rheumatrex", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_009",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Imuran is an oral immunosuppressant used in transplant medicine and autoimmune disease, and it becomes especially important when studying TPMT and allopurinol interactions. What is the generic name of Imuran?",
    options: ["Azathioprine", "Mycophenolate mofetil", "Tacrolimus", "Cyclosporine", "Methotrexate"],
    answer: "Azathioprine",
    explanation: "Imuran is the brand name for azathioprine. This pair is high yield because azathioprine questions often test bone marrow suppression and drug interactions.",
    objective: .brandGeneric,
    relatedDrugIds: ["d181"],
    tags: ["Imuran", "azathioprine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_010",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Azathioprine is a thiopurine immunosuppressant that requires attention to bone marrow toxicity and TPMT-related risk. Which brand name matches azathioprine?",
    options: ["Imuran", "CellCept", "Prograf", "Humira", "Enbrel"],
    answer: "Imuran",
    explanation: "Azathioprine is sold as Imuran. Connecting azathioprine with Imuran helps keep it separate from other transplant immunosuppressants like tacrolimus and mycophenolate.",
    objective: .genericBrand,
    relatedDrugIds: ["d181"],
    tags: ["azathioprine", "Imuran", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_011",
    subsectionId: "5d",
    difficulty: .easy,
    question: "CellCept is an antimetabolite immunosuppressant used in transplant medicine and lupus nephritis and is remembered for strong pregnancy prevention counseling. What is the generic name of CellCept?",
    options: ["Mycophenolate mofetil", "Azathioprine", "Tacrolimus", "Cyclosporine", "Hydroxychloroquine"],
    answer: "Mycophenolate mofetil",
    explanation: "CellCept is the brand name for mycophenolate mofetil. It is especially memorable because of its boxed warnings for embryo-fetal toxicity, malignancies, and serious infections.",
    objective: .brandGeneric,
    relatedDrugIds: ["d180"],
    tags: ["CellCept", "mycophenolate mofetil", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_012",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Mycophenolate mofetil is the transplant and lupus-nephritis immunosuppressant that students often remember as a major teratogen. Which brand name matches mycophenolate mofetil?",
    options: ["CellCept", "Imuran", "Plaquenil", "Enbrel", "Neoral / Sandimmune"],
    answer: "CellCept",
    explanation: "Mycophenolate mofetil is marketed as CellCept. The brand is worth memorizing because it appears often in transplant and nephrology settings.",
    objective: .genericBrand,
    relatedDrugIds: ["d180"],
    tags: ["mycophenolate mofetil", "CellCept", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_013",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Prograf is a narrow-therapeutic-index transplant immunosuppressant famous for trough monitoring, nephrotoxicity, tremor, and grapefruit counseling. What is the generic name of Prograf?",
    options: ["Tacrolimus", "Cyclosporine", "Azathioprine", "Methotrexate", "Etanercept"],
    answer: "Tacrolimus",
    explanation: "Prograf is the brand name for tacrolimus. Tacrolimus is one of the highest-yield transplant drugs because its monitoring and interaction pearls are so testable.",
    objective: .brandGeneric,
    relatedDrugIds: ["d178"],
    tags: ["Prograf", "tacrolimus", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_014",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Tacrolimus is the calcineurin inhibitor more associated with tremor, hyperglycemia, and hyperkalemia than with hirsutism or gingival hyperplasia. Which brand name matches tacrolimus?",
    options: ["Prograf", "CellCept", "Imuran", "Humira", "Enbrel"],
    answer: "Prograf",
    explanation: "Tacrolimus is sold as Prograf. Knowing the brand helps distinguish it from cyclosporine, the other major calcineurin inhibitor in this subsection.",
    objective: .genericBrand,
    relatedDrugIds: ["d178"],
    tags: ["tacrolimus", "Prograf", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_015",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Neoral and Sandimmune are two brand names linked to the older calcineurin inhibitor that is notorious for nephrotoxicity, hypertension, gum overgrowth, and hirsutism. What is the generic name of Neoral / Sandimmune?",
    options: ["Cyclosporine", "Tacrolimus", "Azathioprine", "Mycophenolate mofetil", "Methotrexate"],
    answer: "Cyclosporine",
    explanation: "Neoral and Sandimmune are brand names for cyclosporine. Students should keep cyclosporine separate from tacrolimus because the adverse-effect patterns are similar but not identical.",
    objective: .brandGeneric,
    relatedDrugIds: ["d179"],
    tags: ["Neoral", "Sandimmune", "cyclosporine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_016",
    subsectionId: "5d",
    difficulty: .easy,
    question: "Cyclosporine is the calcineurin inhibitor classmate of tacrolimus, but it is more famous for gingival hyperplasia and hirsutism. Which brand name pair matches cyclosporine?",
    options: ["Neoral / Sandimmune", "Prograf", "CellCept", "Plaquenil", "Trexall / Rheumatrex"],
    answer: "Neoral / Sandimmune",
    explanation: "Cyclosporine is marketed as Neoral and Sandimmune. Learning both brand names prevents confusion when the same drug appears under different product labels.",
    objective: .genericBrand,
    relatedDrugIds: ["d179"],
    tags: ["cyclosporine", "Neoral", "Sandimmune", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_017",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Methotrexate is the classic conventional RA anchor drug and is very different from biologic TNF blockers or transplant calcineurin inhibitors. Which class best describes methotrexate?",
    options: ["Conventional DMARD / antimetabolite", "Anti-TNF biologic", "Calcineurin inhibitor", "Antimalarial-only agent", "Corticosteroid"],
    answer: "Conventional DMARD / antimetabolite",
    explanation: "Methotrexate is a conventional DMARD and antimetabolite. That class identity explains why it is an oral or injectable anchor drug for chronic inflammatory disease rather than a targeted biologic.",
    objective: .classId,
    relatedDrugIds: ["d167"],
    tags: ["methotrexate", "class", "DMARD"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_018",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Hydroxychloroquine comes from an antimalarial lineage but is used in rheumatology because it acts as a milder conventional DMARD. Which class best describes hydroxychloroquine?",
    options: ["DMARD with antimalarial roots", "Anti-TNF biologic", "Calcineurin inhibitor", "Thiopurine antimetabolite", "Opioid analgesic"],
    answer: "DMARD with antimalarial roots",
    explanation: "Hydroxychloroquine is a conventional DMARD with antimalarial origins. It is commonly used in RA and SLE and is remembered clinically for retinal monitoring rather than profound global immunosuppression.",
    objective: .classId,
    relatedDrugIds: ["d168"],
    tags: ["hydroxychloroquine", "class", "DMARD"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_019",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Adalimumab and etanercept reduce inflammatory signaling by targeting tumor necrosis factor rather than by blocking folate metabolism or calcineurin. Which class do both drugs belong to?",
    options: ["Anti-TNF biologics", "Calcineurin inhibitors", "Antimetabolites", "Antimalarials", "Topical immunomodulators"],
    answer: "Anti-TNF biologics",
    explanation: "Adalimumab and etanercept are anti-TNF biologics. This explains their infection, TB-screening, and live-vaccine counseling pearls.",
    objective: .classId,
    relatedDrugIds: ["d169", "d170"],
    tags: ["adalimumab", "etanercept", "class", "anti-TNF"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_020",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Azathioprine suppresses the immune system through thiopurine-like antimetabolite effects rather than TNF blockade or calcineurin inhibition. Which class best describes azathioprine?",
    options: ["Thiopurine antimetabolite immunosuppressant", "Calcineurin inhibitor", "Anti-TNF biologic", "Antimalarial DMARD", "Bisphosphonate"],
    answer: "Thiopurine antimetabolite immunosuppressant",
    explanation: "Azathioprine is a thiopurine antimetabolite immunosuppressant. That helps explain why bone marrow suppression and metabolism-related interactions are such high-yield issues.",
    objective: .classId,
    relatedDrugIds: ["d181"],
    tags: ["azathioprine", "class", "antimetabolite"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_021",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Mycophenolate mofetil decreases lymphocyte proliferation and is used in transplant medicine and lupus nephritis. Which class best describes mycophenolate mofetil?",
    options: ["Antimetabolite immunosuppressant", "Calcineurin inhibitor", "Anti-TNF biologic", "Antimalarial DMARD", "NSAID"],
    answer: "Antimetabolite immunosuppressant",
    explanation: "Mycophenolate mofetil is an antimetabolite immunosuppressant. It is not a calcineurin inhibitor like tacrolimus or cyclosporine.",
    objective: .classId,
    relatedDrugIds: ["d180"],
    tags: ["mycophenolate mofetil", "class", "antimetabolite"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_022",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Tacrolimus and cyclosporine share a transplant-focused class defined by calcineurin blockade and reduced T-cell activation. Which class is this?",
    options: ["Calcineurin inhibitor", "Anti-TNF biologic", "Antimetabolite", "Antimalarial DMARD", "Loop diuretic"],
    answer: "Calcineurin inhibitor",
    explanation: "Tacrolimus and cyclosporine are calcineurin inhibitors. Their shared class explains why both require renal monitoring and attention to drug interactions.",
    objective: .classId,
    relatedDrugIds: ["d178", "d179"],
    tags: ["tacrolimus", "cyclosporine", "class", "calcineurin inhibitor"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_023",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Methotrexate earns its anchor-drug status in RA because it acts as a folate antagonist that slows immune-cell proliferation. Which mechanism best describes methotrexate?",
    options: ["Inhibits folate-dependent pathways to reduce inflammatory cell proliferation", "Binds TNF-alpha and blocks cytokine signaling", "Inhibits calcineurin to reduce IL-2 transcription", "Inhibits IMPDH to block guanosine synthesis", "Blocks muscarinic receptors"],
    answer: "Inhibits folate-dependent pathways to reduce inflammatory cell proliferation",
    explanation: "Methotrexate is an antimetabolite and folate antagonist. That is why folic acid supplementation and monitoring for mouth sores, liver injury, and myelosuppression are so important.",
    objective: .moa,
    relatedDrugIds: ["d167"],
    tags: ["methotrexate", "mechanism", "folate antagonist"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_024",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Adalimumab improves autoimmune inflammation by binding a cytokine that drives synovial and intestinal inflammation. Which mechanism best describes adalimumab?",
    options: ["Binds TNF-alpha and blocks its inflammatory signaling", "Inhibits dihydrofolate reductase", "Inhibits calcineurin and IL-2 transcription", "Blocks inosine monophosphate dehydrogenase", "Blocks cyclooxygenase"],
    answer: "Binds TNF-alpha and blocks its inflammatory signaling",
    explanation: "Adalimumab is a TNF blocker. It does not work through folate antagonism, calcineurin blockade, or purine synthesis inhibition.",
    objective: .moa,
    relatedDrugIds: ["d169"],
    tags: ["adalimumab", "mechanism", "TNF blocker"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_025",
    subsectionId: "5d",
    difficulty: .hard,
    question: "Etanercept is not a monoclonal antibody like adalimumab, which makes its structure a favorite teaching pearl. Which description best matches etanercept?",
    options: ["A TNF receptor fusion protein", "A folate antagonist", "A calcineurin inhibitor", "An IL-6 receptor blocker", "A purine analog prodrug"],
    answer: "A TNF receptor fusion protein",
    explanation: "Etanercept is a TNF blocker, but structurally it is a TNF receptor fusion protein. That pearl helps distinguish it from adalimumab, a monoclonal antibody TNF blocker.",
    objective: .moa,
    relatedDrugIds: ["d170"],
    tags: ["etanercept", "mechanism", "fusion protein"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_026",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Tacrolimus prevents rejection by reducing T-cell activation rather than by blocking TNF or folate metabolism. Which mechanism best explains tacrolimus?",
    options: ["Calcineurin inhibition leading to reduced IL-2 transcription", "TNF-alpha blockade at the cytokine level", "Folate antagonism with weekly dosing", "IMPDH inhibition in lymphocytes", "Cyclooxygenase inhibition"],
    answer: "Calcineurin inhibition leading to reduced IL-2 transcription",
    explanation: "Tacrolimus inhibits calcineurin, which reduces IL-2 signaling and T-cell activation. This is why it is a core transplant immunosuppressant rather than a rheumatology biologic.",
    objective: .moa,
    relatedDrugIds: ["d178"],
    tags: ["tacrolimus", "mechanism", "calcineurin"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_027",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Mycophenolate mofetil reduces lymphocyte growth by targeting purine synthesis rather than TNF or calcineurin. Which mechanism best describes mycophenolate mofetil?",
    options: ["Inhibits inosine monophosphate dehydrogenase (IMPDH)", "Blocks TNF-alpha receptors", "Inhibits calcineurin", "Acts as a folate antagonist", "Blocks sodium channels"],
    answer: "Inhibits inosine monophosphate dehydrogenase (IMPDH)",
    explanation: "Mycophenolate inhibits IMPDH and thereby limits de novo purine synthesis in lymphocytes. That mechanism helps explain its strong immunosuppressive effects and infection risk.",
    objective: .moa,
    relatedDrugIds: ["d180"],
    tags: ["mycophenolate mofetil", "mechanism", "IMPDH"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_028",
    subsectionId: "5d",
    difficulty: .medium,
    question: "A patient with mild rheumatoid arthritis or lupus needs a conventional DMARD that is slower acting than NSAIDs and requires ophthalmology monitoring instead of trough levels. Which drug best fits that description?",
    options: ["Hydroxychloroquine", "Tacrolimus", "Methotrexate", "Adalimumab", "Cyclosporine"],
    answer: "Hydroxychloroquine",
    explanation: "Hydroxychloroquine is commonly used in RA and SLE and is classically tied to retinal monitoring. It is not a transplant drug and does not require trough concentration monitoring.",
    objective: .indication,
    relatedDrugIds: ["d168"],
    tags: ["hydroxychloroquine", "indication", "RA", "SLE"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_029",
    subsectionId: "5d",
    difficulty: .medium,
    question: "A patient with rheumatoid arthritis is planning pregnancy and asks which medication from this subsection is most clearly contraindicated because it can cause embryo-fetal toxicity and is used weekly for RA. Which drug should be avoided?",
    options: ["Methotrexate", "Hydroxychloroquine", "Etanercept", "Adalimumab", "Cyclosporine"],
    answer: "Methotrexate",
    explanation: "Methotrexate is contraindicated in pregnancy for non-oncology uses like RA and psoriasis because it can cause fetal harm. This is one of the highest-yield contraindications in rheumatology pharmacology.",
    objective: .contraindication,
    relatedDrugIds: ["d167"],
    tags: ["methotrexate", "pregnancy", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_030",
    subsectionId: "5d",
    difficulty: .medium,
    question: "A transplant patient is prescribed an oral immunosuppressant with a narrow therapeutic index, nephrotoxicity risk, and routine trough monitoring. Which drug best matches that profile?",
    options: ["Tacrolimus", "Hydroxychloroquine", "Methotrexate", "Etanercept", "Azathioprine"],
    answer: "Tacrolimus",
    explanation: "Tacrolimus is a transplant immunosuppressant with trough-level monitoring, nephrotoxicity risk, and many interaction pearls. That profile is much more specific than the broader autoimmune uses of methotrexate or hydroxychloroquine.",
    objective: .indication,
    relatedDrugIds: ["d178"],
    tags: ["tacrolimus", "indication", "transplant"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_031",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Before starting adalimumab or etanercept, which screening step is especially high yield because TNF blockers can reactivate a latent infection and cause severe infectious complications?",
    options: ["Test for latent tuberculosis", "Obtain a baseline retinal OCT", "Check an INR", "Measure serum uric acid", "Order a DXA scan"],
    answer: "Test for latent tuberculosis",
    explanation: "Latent TB screening is essential before starting anti-TNF therapy. TNF blockers are linked to serious infections and malignancy warnings, so infection risk assessment matters before the first dose.",
    objective: .monitoring,
    relatedDrugIds: ["d169", "d170"],
    tags: ["adalimumab", "etanercept", "TB screening"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_032",
    subsectionId: "5d",
    difficulty: .medium,
    question: "A patient receiving adalimumab or etanercept asks about vaccinations and mentions wanting the live intranasal influenza vaccine. What is the best counseling point?",
    options: ["Live vaccines are generally avoided during anti-TNF therapy unless the prescriber specifically says otherwise", "Live vaccines are preferred because biologics weaken immune memory", "Live vaccines are fine if taken on the same day as folic acid", "Only methotrexate patients need vaccine counseling", "The only vaccine that matters is hepatitis B"],
    answer: "Live vaccines are generally avoided during anti-TNF therapy unless the prescriber specifically says otherwise",
    explanation: "Patients on anti-TNF biologics are generally counseled to avoid live vaccines during therapy. This is a practical safety pearl that often appears in counseling-style questions.",
    objective: .interaction,
    relatedDrugIds: ["d169", "d170"],
    tags: ["adalimumab", "etanercept", "live vaccines"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_033",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Plaquenil is often viewed as one of the gentler DMARDs, but one toxicity can permanently threaten vision and is why long-term ophthalmic follow-up matters. Which adverse effect is most classically associated with hydroxychloroquine?",
    options: ["Retinal toxicity", "Gingival hyperplasia", "Severe hirsutism", "Interstitial nephritis", "Tendon rupture"],
    answer: "Retinal toxicity",
    explanation: "Hydroxychloroquine is classically associated with retinal toxicity. That is why baseline and periodic eye monitoring are central parts of safe long-term use.",
    objective: .adverseEffect,
    relatedDrugIds: ["d168"],
    tags: ["hydroxychloroquine", "retinal toxicity"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_034",
    subsectionId: "5d",
    difficulty: .medium,
    question: "A patient taking weekly methotrexate for RA reports painful mouth sores and asks whether anything can reduce that risk without changing the whole treatment strategy. Which teaching point is most appropriate?",
    options: ["Folic acid supplementation helps reduce some methotrexate toxicity such as mouth sores", "Grapefruit juice lowers methotrexate levels and prevents stomatitis", "A low-vitamin K diet is the key counseling point", "Take methotrexate every day in divided doses", "Hydroxychloroquine is the antidote to methotrexate stomatitis"],
    answer: "Folic acid supplementation helps reduce some methotrexate toxicity such as mouth sores",
    explanation: "Folic acid supplementation is a classic methotrexate pearl because it can reduce mucositis and some other adverse effects. Students should also remember that RA dosing is weekly, not daily.",
    objective: .pearl,
    relatedDrugIds: ["d167"],
    tags: ["methotrexate", "folic acid", "mouth sores"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_035",
    subsectionId: "5d",
    difficulty: .hard,
    question: "A patient on methotrexate develops a new dry, nonproductive cough and progressive shortness of breath that cannot be explained by heart failure or infection. Which serious toxicity should be suspected?",
    options: ["Methotrexate-induced pneumonitis", "Hydroxychloroquine retinopathy", "Cyclosporine gingival hyperplasia", "Azathioprine-related gout flare", "Tacrolimus withdrawal syndrome"],
    answer: "Methotrexate-induced pneumonitis",
    explanation: "Methotrexate can cause interstitial pneumonitis, and a new dry cough or dyspnea is a red-flag presentation. This pearl is important because the reaction can be serious and requires prompt evaluation.",
    objective: .adverseEffect,
    relatedDrugIds: ["d167"],
    tags: ["methotrexate", "pneumonitis", "dry cough"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_036",
    subsectionId: "5d",
    difficulty: .hard,
    question: "Azathioprine can cause severe bone marrow suppression, and some patients are at especially high risk because of how they metabolize thiopurines. Which safety concept is most associated with azathioprine?",
    options: ["TPMT activity or genotype can help identify risk for myelotoxicity", "Annual retinal exams prevent its worst toxicity", "Trough levels are the primary way to prevent leukopenia", "Live-virus challenge testing is required before starting it", "The main risk is only nephrotoxicity, not bone marrow toxicity"],
    answer: "TPMT activity or genotype can help identify risk for myelotoxicity",
    explanation: "TPMT deficiency or reduced activity is a high-yield azathioprine safety concept because it raises the risk of severe myelosuppression. CBC monitoring is also important during therapy.",
    objective: .monitoring,
    relatedDrugIds: ["d181"],
    tags: ["azathioprine", "TPMT", "myelosuppression"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_037",
    subsectionId: "5d",
    difficulty: .medium,
    question: "One immunosuppressant in this subsection carries boxed warnings for embryo-fetal toxicity, malignancies, and serious infections, making pregnancy counseling especially important. Which drug is it?",
    options: ["Mycophenolate mofetil", "Hydroxychloroquine", "Adalimumab", "Methotrexate", "Etanercept"],
    answer: "Mycophenolate mofetil",
    explanation: "Mycophenolate mofetil carries boxed warnings for embryo-fetal toxicity, malignancies, and serious infections. That is why pregnancy prevention and infection counseling are so prominent with CellCept.",
    objective: .contraindication,
    relatedDrugIds: ["d180"],
    tags: ["mycophenolate mofetil", "boxed warning", "pregnancy"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_038",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Tacrolimus and cyclosporine have different side-effect patterns, but there is one organ system both can injure so reliably that kidney function monitoring is central for both. Which shared adverse effect is that?",
    options: ["Nephrotoxicity", "Retinal toxicity", "Tendon rupture", "Severe hypoglycemia", "Ototoxicity"],
    answer: "Nephrotoxicity",
    explanation: "Both calcineurin inhibitors can cause nephrotoxicity. That shared risk is one reason serum creatinine and other renal parameters are followed closely during therapy.",
    objective: .adverseEffect,
    relatedDrugIds: ["d178", "d179"],
    tags: ["tacrolimus", "cyclosporine", "nephrotoxicity"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_039",
    subsectionId: "5d",
    difficulty: .medium,
    question: "A transplant patient develops hypertension, tremor, gum overgrowth, and increased hair growth after starting an immunosuppressant. Which drug best matches this pattern?",
    options: ["Cyclosporine", "Tacrolimus", "Methotrexate", "Hydroxychloroquine", "Adalimumab"],
    answer: "Cyclosporine",
    explanation: "Cyclosporine is the calcineurin inhibitor classically associated with hypertension, gingival hyperplasia, and hirsutism. These features help distinguish it from tacrolimus.",
    objective: .adverseEffect,
    relatedDrugIds: ["d179"],
    tags: ["cyclosporine", "gingival hyperplasia", "hirsutism"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_040",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Another transplant patient develops tremor, rising creatinine, hyperglycemia, and hyperkalemia after starting a calcineurin inhibitor. Which drug is most classic for this pattern?",
    options: ["Tacrolimus", "Cyclosporine", "Hydroxychloroquine", "Methotrexate", "Etanercept"],
    answer: "Tacrolimus",
    explanation: "Tacrolimus is strongly associated with tremor, nephrotoxicity, hyperglycemia, and hyperkalemia. These features help separate it from cyclosporine, which is more famous for hirsutism and gingival hyperplasia.",
    objective: .adverseEffect,
    relatedDrugIds: ["d178"],
    tags: ["tacrolimus", "tremor", "hyperglycemia", "hyperkalemia"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_041",
    subsectionId: "5d",
    difficulty: .hard,
    question: "Which drug interaction is especially dangerous because it can markedly increase azathioprine exposure and raise the risk of profound myelosuppression?",
    options: ["Allopurinol", "Folic acid", "Vitamin D", "Acetaminophen", "Levothyroxine"],
    answer: "Allopurinol",
    explanation: "Allopurinol inhibits xanthine oxidase metabolism of azathioprine, which can greatly increase azathioprine exposure and toxicity. This is one of the most classic immunosuppressant interaction questions.",
    objective: .interaction,
    relatedDrugIds: ["d181"],
    tags: ["azathioprine", "allopurinol", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_042",
    subsectionId: "5d",
    difficulty: .medium,
    question: "A patient starting tacrolimus or cyclosporine asks whether any foods or beverages are worth avoiding. Which counseling point is most important because it can increase calcineurin-inhibitor concentrations?",
    options: ["Avoid grapefruit and grapefruit juice", "Avoid leafy green vegetables", "Avoid dairy products", "Avoid all protein-rich foods", "Avoid vitamin C"],
    answer: "Avoid grapefruit and grapefruit juice",
    explanation: "Grapefruit can raise calcineurin-inhibitor concentrations and increase toxicity risk. This is a classic counseling point for both tacrolimus and cyclosporine.",
    objective: .interaction,
    relatedDrugIds: ["d178", "d179"],
    tags: ["tacrolimus", "cyclosporine", "grapefruit"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_043",
    subsectionId: "5d",
    difficulty: .medium,
    question: "Which monitoring bundle is most appropriate for a patient receiving methotrexate long term for rheumatoid arthritis?",
    options: ["CBC, liver enzymes, and renal function", "INR and aPTT", "Serum digoxin level and thyroid tests", "Creatine kinase only", "Troponin and BNP"],
    answer: "CBC, liver enzymes, and renal function",
    explanation: "Methotrexate can cause myelosuppression, hepatotoxicity, and toxicity that is worsened by impaired renal clearance. That is why CBC, liver enzymes, and renal function are key monitoring labs.",
    objective: .monitoring,
    relatedDrugIds: ["d167"],
    tags: ["methotrexate", "CBC", "LFTs", "renal monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_044",
    subsectionId: "5d",
    difficulty: .hard,
    question: "Long-term hydroxychloroquine therapy requires ophthalmic monitoring because retinopathy risk rises with cumulative exposure and higher daily dosing. Which statement is most accurate?",
    options: ["Baseline and periodic eye exams are important, and annual screening may begin earlier in high-risk patients but can often wait until 5 years in lower-risk patients", "Every patient on hydroxychloroquine needs weekly retinal scans from day 1", "Only serum drug levels matter; eye exams are optional", "Eye exams are only needed if the patient also takes methotrexate", "Hydroxychloroquine retinopathy is fully reversible if found late"],
    answer: "Baseline and periodic eye exams are important, and annual screening may begin earlier in high-risk patients but can often wait until 5 years in lower-risk patients",
    explanation: "Hydroxychloroquine retinal monitoring is based on baseline assessment and periodic follow-up, with earlier annual screening for higher-risk patients. Risk increases with longer use and higher daily dosing.",
    objective: .monitoring,
    relatedDrugIds: ["d168"],
    tags: ["hydroxychloroquine", "eye exam", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q5d_add_045",
    subsectionId: "5d",
    difficulty: .hard,
    question: "Tacrolimus and cyclosporine are both calcineurin inhibitors, but what high-yield coadministration rule should students remember?",
    options: ["Tacrolimus should not be used simultaneously with cyclosporine", "Cyclosporine should always be taken with grapefruit juice", "Methotrexate reverses calcineurin toxicity if given weekly", "Hydroxychloroquine prevents calcineurin nephrotoxicity", "Etanercept must always be co-started with both"],
    answer: "Tacrolimus should not be used simultaneously with cyclosporine",
    explanation: "Tacrolimus should not be used simultaneously with cyclosporine. When switching between them, spacing and clinical monitoring matter because both can raise toxicity risk.",
    objective: .interaction,
    relatedDrugIds: ["d178", "d179"],
    tags: ["tacrolimus", "cyclosporine", "coadministration"],
    source: .curated
)

    ]
}