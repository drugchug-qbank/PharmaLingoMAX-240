// PharmaLingo — Module 8e (IBD)
// Curated Add-On Question Pack (45 questions)
// IDs: q8e_add_001 ... q8e_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 8e exists, then append:
//
//    if bank["8e"] == nil { bank["8e"] = [] }
//    bank["8e"]?.append(contentsOf: Self.curatedAddOnQuestions_8e)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d145 (Infliximab / Remicade), d144 (Mesalamine / Asacol/Lialda).
//
// Generated on: 2026-03-09

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8e: [Question] = [
    .multipleChoice(
        id: "q8e_add_001",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Asacol and Lialda are high-yield brand names for the same 5-ASA drug used in ulcerative colitis. What is the generic name of Asacol/Lialda?",
        options: ["Mesalamine", "Metoclopramide", "Mesna", "Mercaptopurine", "Methylprednisolone"],
        answer: "Mesalamine",
        explanation: "Asacol and Lialda are brand names for mesalamine, a 5-aminosalicylic acid drug used for ulcerative colitis.",
        objective: .brandGeneric,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_002",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Mesalamine is the colon-focused anti-inflammatory drug in this subsection that is often used before stepping up to biologic therapy in ulcerative colitis. Which brand name matches mesalamine?",
        options: ["Asacol/Lialda", "Remicade", "Linzess", "Carafate", "Reglan"],
        answer: "Asacol/Lialda",
        explanation: "Mesalamine corresponds to the brands Asacol and Lialda.",
        objective: .genericBrand,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_003",
        subsectionId: "8e",
        difficulty: .easy,
        question: "A student wants to classify mesalamine correctly instead of confusing it with a steroid or biologic. Which drug class best describes mesalamine?",
        options: ["5-aminosalicylic acid (5-ASA) anti-inflammatory", "TNF-alpha monoclonal antibody", "Systemic corticosteroid", "Anticholinergic antispasmodic", "Proton pump inhibitor"],
        answer: "5-aminosalicylic acid (5-ASA) anti-inflammatory",
        explanation: "Mesalamine is a 5-ASA anti-inflammatory used mainly in ulcerative colitis.",
        objective: .classId,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_004",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Mesalamine works locally in the bowel rather than suppressing the entire immune system. Which condition is its most classic high-yield indication in this subsection?",
        options: ["Ulcerative colitis", "Motion sickness", "Acute bacterial pneumonia", "Heart failure with reduced ejection fraction", "Parkinson disease"],
        answer: "Ulcerative colitis",
        explanation: "Mesalamine is most classically associated with ulcerative colitis.",
        objective: .indication,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "indication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_005",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Mesalamine is not primarily thought of as a systemic immunosuppressant. Which mechanism best explains its therapeutic role in ulcerative colitis?",
        options: ["Topical anti-inflammatory effect on colonic epithelial cells", "Irreversible TNF-alpha depletion from circulation", "Complete blockade of intestinal motility", "Neutralization of gastric acid in the stomach", "Direct opioid agonism in the gut"],
        answer: "Topical anti-inflammatory effect on colonic epithelial cells",
        explanation: "Mesalamine appears to work mainly as a topical anti-inflammatory agent on colonic epithelial cells.",
        objective: .moa,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_006",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A high-yield pearl is that mesalamine may decrease inflammatory mediators in the colon. Which statement best fits that effect?",
        options: ["It can reduce prostaglandin production in the colon", "It permanently destroys circulating B cells", "It blocks muscarinic receptors in the bowel wall", "It inhibits the proton pump on parietal cells", "It raises stool water by osmotic action"],
        answer: "It can reduce prostaglandin production in the colon",
        explanation: "Mesalamine may diminish inflammation in the colon in part by blocking cyclooxygenase and reducing prostaglandin production.",
        objective: .moa,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "moa", "cox"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_007",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Before starting mesalamine, the clinician orders kidney labs rather than TB testing. Why is this monitoring step high yield?",
        options: ["Mesalamine can cause renal impairment, so renal function should be checked before and during therapy", "Mesalamine predictably causes severe hyperkalemia within days", "Mesalamine commonly causes agranulocytosis requiring weekly ANC checks", "Mesalamine always prolongs QT, so baseline ECG is mandatory", "Mesalamine causes osteoporosis, so DEXA must be obtained first"],
        answer: "Mesalamine can cause renal impairment, so renal function should be checked before and during therapy",
        explanation: "Renal impairment is an important mesalamine warning, so renal function should be assessed before starting and periodically during treatment.",
        objective: .monitoring,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "renal-monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_008",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient on mesalamine is doing well symptomatically. Which follow-up parameter is still especially important to monitor over time?",
        options: ["Renal function", "Latent TB testing every infusion visit", "INR", "Serum digoxin level", "Absolute neutrophil count every week"],
        answer: "Renal function",
        explanation: "Even when symptoms improve, mesalamine still warrants renal monitoring because nephrotoxicity can occur.",
        objective: .monitoring,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "labs"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_009",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Mesalamine is generally well tolerated, but one organ system deserves special respect because interstitial nephritis and even renal failure have been reported. Which organ system is it?",
        options: ["Kidneys", "Lungs", "Thyroid", "Inner ear", "Bone marrow"],
        answer: "Kidneys",
        explanation: "Mesalamine-related renal impairment, including interstitial nephritis, is a classic high-yield safety issue.",
        objective: .adverseEffect,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "renal-toxicity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_010",
        subsectionId: "8e",
        difficulty: .hard,
        question: "A patient starts mesalamine for ulcerative colitis and then develops cramping, abdominal pain, bloody diarrhea, fever, and malaise. Which mesalamine-specific warning best explains why this can be mistaken for a disease flare?",
        options: ["Mesalamine-induced acute intolerance syndrome", "Cushing syndrome from steroid exposure", "Serotonin syndrome", "Immune thrombocytopenia", "Tardive dyskinesia"],
        answer: "Mesalamine-induced acute intolerance syndrome",
        explanation: "Mesalamine can cause an acute intolerance syndrome that may mimic worsening ulcerative colitis, with cramping, abdominal pain, bloody diarrhea, fever, and malaise.",
        objective: .adverseEffect,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "acute-intolerance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_011",
        subsectionId: "8e",
        difficulty: .hard,
        question: "Why is mesalamine-induced acute intolerance syndrome such a high-yield test concept in ulcerative colitis?",
        options: ["It can look like a worsening colitis flare and should prompt reassessment or discontinuation", "It proves the patient needs immediate anticoagulation", "It means the patient has developed C. difficile every time", "It indicates iron deficiency from chronic bleeding", "It confirms toxic megacolon without further evaluation"],
        answer: "It can look like a worsening colitis flare and should prompt reassessment or discontinuation",
        explanation: "The key pearl is that acute intolerance from mesalamine can resemble an ulcerative colitis flare, so worsening symptoms after initiation should be evaluated carefully.",
        objective: .pearl,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "flare-vs-intolerance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_012",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Mesalamine is a 5-ASA product, so which history is the clearest labeled contraindication?",
        options: ["Known hypersensitivity to salicylates or aminosalicylates", "Seasonal allergic rhinitis", "Remote history of appendectomy", "Controlled hypertension", "Migraine without aura"],
        answer: "Known hypersensitivity to salicylates or aminosalicylates",
        explanation: "Mesalamine is contraindicated in patients with known or suspected hypersensitivity to salicylates or aminosalicylates.",
        objective: .contraindication,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "contraindication"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_013",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient with ulcerative colitis takes mesalamine and asks about daily ibuprofen for knee pain. Why should the clinician pause?",
        options: ["NSAIDs can increase the risk of mesalamine-related nephrotoxicity", "NSAIDs always make mesalamine ineffective within 24 hours", "NSAIDs convert mesalamine into a TNF blocker", "NSAIDs block mesalamine absorption so completely that it should never be combined with food", "NSAIDs cause dangerous hypercalcemia when combined with mesalamine"],
        answer: "NSAIDs can increase the risk of mesalamine-related nephrotoxicity",
        explanation: "Concurrent nephrotoxic drugs, including NSAIDs, can raise the risk of mesalamine-related kidney injury.",
        objective: .interaction,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "nsaids"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_014",
        subsectionId: "8e",
        difficulty: .hard,
        question: "A patient with ulcerative colitis is taking azathioprine and now begins mesalamine. Which monitoring issue becomes more important?",
        options: ["Blood dyscrasias, so CBC and platelet monitoring should be watched closely", "Profound hypoglycemia, so fingersticks every hour are required", "Ototoxicity, so serial audiograms are mandatory", "Rhabdomyolysis, so CK must be checked weekly", "Corneal deposits, so slit-lamp exams are required"],
        answer: "Blood dyscrasias, so CBC and platelet monitoring should be watched closely",
        explanation: "Mesalamine used with azathioprine or 6-mercaptopurine can increase the risk of blood disorders.",
        objective: .interaction,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "azathioprine", "6mp"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_015",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Mesalamine has an unusual urinary adverse-effect pearl that rewards careful reading. Which problem has been reported and should prompt hydration counseling?",
        options: ["Nephrolithiasis", "Hemorrhagic cystitis", "Torsades de pointes", "Acute angle-closure glaucoma", "Pancreatic necrosis"],
        answer: "Nephrolithiasis",
        explanation: "Mesalamine-associated kidney stones have been reported, so adequate fluid intake is an important counseling point.",
        objective: .adverseEffect,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "stones"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_016",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A clinician counsels a patient on mesalamine to keep up with fluids even though it is not a diuretic. What is the best reason?",
        options: ["Adequate hydration may help reduce the risk of mesalamine-related kidney stones", "Hydration prevents live-vaccine complications", "Hydration is required to prevent infusion reactions", "Hydration is needed because mesalamine always causes diarrhea", "Hydration is necessary to prevent opioid withdrawal"],
        answer: "Adequate hydration may help reduce the risk of mesalamine-related kidney stones",
        explanation: "Hydration is emphasized because mesalamine-associated nephrolithiasis has been reported.",
        objective: .pearl,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "hydration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_017",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient on mesalamine develops rash, fever, and concern for organ involvement. Which high-yield interpretation is most appropriate?",
        options: ["Consider mesalamine hypersensitivity and evaluate promptly", "This is the classic first sign of therapeutic success", "This proves the patient has latent TB", "This is expected and never requires action", "This is the normal effect of topical anti-inflammatory therapy"],
        answer: "Consider mesalamine hypersensitivity and evaluate promptly",
        explanation: "Mesalamine can cause hypersensitivity reactions, sometimes with internal organ involvement, and warrants prompt evaluation.",
        objective: .adverseEffect,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "rash", "hypersensitivity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_018",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Why should liver history still matter even though mesalamine is not primarily known as a hepatotoxic immunosuppressant?",
        options: ["Hepatic failure has been reported, especially in patients with pre-existing liver disease", "Mesalamine is contraindicated in anyone with any prior AST elevation", "Mesalamine is completely metabolized by the liver and always requires dose halving in mild hepatic impairment", "Mesalamine causes portal vein thrombosis as a routine class effect", "Mesalamine requires weekly ammonia levels in all patients"],
        answer: "Hepatic failure has been reported, especially in patients with pre-existing liver disease",
        explanation: "Reports of hepatic failure exist, so caution is warranted in patients with pre-existing liver disease.",
        objective: .adverseEffect,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "liver"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_019",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Compared with infliximab, mesalamine is the option patients usually associate with daily outpatient anti-inflammatory therapy rather than infusion-center biologic treatment. Which route best fits the mesalamine products listed in this subsection?",
        options: ["Oral", "Intravenous infusion", "Subcutaneous injection", "Topical ophthalmic", "Transdermal patch"],
        answer: "Oral",
        explanation: "The mesalamine products listed here are oral ulcerative colitis therapies, unlike infliximab which is given by IV infusion.",
        objective: .pearl,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "route"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_020",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient with ulcerative colitis wants to know which 8e drug is more aligned with a bowel-focused, non-biologic anti-inflammatory approach rather than anti-TNF therapy. Which answer fits best?",
        options: ["Mesalamine", "Infliximab", "Both are anti-TNF biologics", "Neither is used in ulcerative colitis", "Only infliximab is bowel-focused rather than immune-focused"],
        answer: "Mesalamine",
        explanation: "Mesalamine is the bowel-focused 5-ASA anti-inflammatory, whereas infliximab is a systemic anti-TNF biologic.",
        objective: .pearl,
        relatedDrugIds: ["d144"],
        tags: ["8e", "mesalamine", "step-therapy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_021",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Remicade is the classic infusion-center biologic in this IBD subsection. What is the generic name of Remicade?",
        options: ["Infliximab", "Ixekizumab", "Indomethacin", "Ipratropium", "Insulin glargine"],
        answer: "Infliximab",
        explanation: "Remicade is the brand name for infliximab.",
        objective: .brandGeneric,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_022",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Infliximab is the anti-TNF monoclonal antibody used in moderate to severe inflammatory bowel disease. Which brand name matches infliximab?",
        options: ["Remicade", "Lialda", "Zofran", "Entyvio", "Reglan"],
        answer: "Remicade",
        explanation: "Infliximab is marketed as Remicade.",
        objective: .genericBrand,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_023",
        subsectionId: "8e",
        difficulty: .easy,
        question: "A learner should not confuse infliximab with a 5-ASA or steroid. Which class best describes infliximab?",
        options: ["TNF-alpha monoclonal antibody", "5-ASA anti-inflammatory", "Glucocorticoid receptor agonist", "Motility stimulant", "Antacid"],
        answer: "TNF-alpha monoclonal antibody",
        explanation: "Infliximab is an anti-TNF monoclonal antibody biologic.",
        objective: .classId,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_024",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Infliximab helps control inflammatory bowel disease by targeting a key inflammatory cytokine. Which target does it bind?",
        options: ["Tumor necrosis factor alpha (TNF-alpha)", "Interleukin-5", "Cyclooxygenase-1 only", "The gastric proton pump", "Muscarinic M3 receptors"],
        answer: "Tumor necrosis factor alpha (TNF-alpha)",
        explanation: "Infliximab works by binding TNF-alpha and reducing downstream inflammatory signaling.",
        objective: .moa,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_025",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Infliximab is much more than a simple symptomatic bowel drug. Which Crohn disease scenario is especially high yield for infliximab?",
        options: ["Moderately to severely active Crohn disease with inadequate response to conventional therapy", "Occasional heartburn after spicy food", "Simple constipation without inflammation", "Short-term treatment of viral gastroenteritis", "Motion sickness during travel"],
        answer: "Moderately to severely active Crohn disease with inadequate response to conventional therapy",
        explanation: "Infliximab is indicated for moderate to severe Crohn disease after inadequate response to conventional therapy.",
        objective: .indication,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "crohns"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_026",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Infliximab is also a major escalation option in ulcerative colitis. Which description fits its high-yield role?",
        options: ["Moderately to severely active ulcerative colitis after inadequate response to conventional therapy", "Mild heartburn controlled by diet", "Routine treatment of IBS cramping", "Short-term bowel prep before colonoscopy", "Travel prophylaxis for nausea"],
        answer: "Moderately to severely active ulcerative colitis after inadequate response to conventional therapy",
        explanation: "Infliximab is used for moderate to severe ulcerative colitis when conventional therapy is inadequate.",
        objective: .indication,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "uc"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_027",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A stem describes Crohn disease with draining fistulas rather than simple mild mucosal irritation. Which 8e drug is most strongly associated with this escalation-level scenario?",
        options: ["Infliximab", "Mesalamine", "Sucralfate", "Dicyclomine", "Famotidine"],
        answer: "Infliximab",
        explanation: "Infliximab is a high-yield biologic for more advanced Crohn disease scenarios, including fistulizing disease.",
        objective: .indication,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "fistulas"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_028",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Mesalamine is usually taken by mouth, but infliximab belongs to a very different administration style. How is infliximab given?",
        options: ["Intravenous infusion", "Sublingual tablet", "Topical rectal foam only", "Transdermal patch", "Inhalation"],
        answer: "Intravenous infusion",
        explanation: "Infliximab is given by IV infusion.",
        objective: .pearl,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "route"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_029",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient starting infliximab for ulcerative colitis asks why the first few visits are closer together before maintenance begins. Which induction/maintenance schedule is the classic high-yield pattern?",
        options: ["Weeks 0, 2, and 6, then every 8 weeks", "Daily for 14 days, then stop", "Weekly for 4 weeks, then every day as needed", "Once monthly only with no induction", "Every 12 hours for 5 days"],
        answer: "Weeks 0, 2, and 6, then every 8 weeks",
        explanation: "Infliximab classically uses induction at weeks 0, 2, and 6 followed by maintenance every 8 weeks for IBD.",
        objective: .dosing,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_030",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Infliximab carries one of the most important biologic boxed-warning themes in pharmacology. Which pair best captures it?",
        options: ["Serious infections and malignancy", "Severe hypoglycemia and pancreatitis", "Tardive dyskinesia and priapism", "Osteonecrosis and tendon rupture", "Stevens-Johnson syndrome and nephrolithiasis"],
        answer: "Serious infections and malignancy",
        explanation: "The boxed warning for infliximab highlights serious infections and malignancy.",
        objective: .adverseEffect,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "boxed-warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_031",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Before a patient receives the first infliximab infusion, what infection screening step is especially high yield?",
        options: ["Test for latent tuberculosis before starting therapy", "Check for H. pylori before every dose", "Obtain a rapid strep test", "Screen for C. difficile in every patient regardless of symptoms", "Order a malaria smear"],
        answer: "Test for latent tuberculosis before starting therapy",
        explanation: "Patients should be screened for latent TB before starting infliximab, and monitored for active TB during treatment.",
        objective: .monitoring,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "tb"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_032",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Infliximab suppresses inflammatory pathways enough that one chronic viral infection must be checked before treatment because reactivation can be severe or fatal. Which infection is that?",
        options: ["Hepatitis B virus", "Influenza A", "Rhinovirus", "Norovirus", "Epstein-Barr virus mononucleosis"],
        answer: "Hepatitis B virus",
        explanation: "HBV testing before infliximab is high yield because hepatitis B reactivation has been reported and can be serious.",
        objective: .monitoring,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "hbv"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_033",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient develops dyspnea, urticaria, facial swelling, and hypotension shortly after receiving infliximab. Which adverse effect best fits this presentation?",
        options: ["Infusion reaction", "Mesalamine-induced acute intolerance syndrome", "Osmotic diarrhea", "Anticholinergic toxidrome", "Serotonin withdrawal"],
        answer: "Infusion reaction",
        explanation: "Infliximab can cause infusion reactions, and dyspnea, urticaria, facial edema, and hypotension are classic clues.",
        objective: .adverseEffect,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "infusion-reaction"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_034",
        subsectionId: "8e",
        difficulty: .medium,
        question: "An IBD patient also has moderate to severe heart failure. Which infliximab safety pearl is most important?",
        options: ["Higher infliximab doses are contraindicated and heart failure can worsen", "Infliximab is the preferred therapy because it improves ejection fraction", "Heart failure only matters with mesalamine, not infliximab", "Infliximab is contraindicated solely because of kidney stones", "The main issue is severe constipation from infliximab"],
        answer: "Higher infliximab doses are contraindicated and heart failure can worsen",
        explanation: "Infliximab can worsen heart failure, and doses above 5 mg/kg are contraindicated in moderate to severe heart failure.",
        objective: .contraindication,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "heart-failure"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_035",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient on infliximab asks whether live vaccines are okay during therapy. Which response is most accurate?",
        options: ["Live vaccines should generally not be given concurrently with infliximab", "Live vaccines are preferred because infliximab weakens their side effects", "Only oral vaccines are avoided; all injectable live vaccines are fine", "Vaccination timing never matters with biologics", "Live vaccines are required before each infusion"],
        answer: "Live vaccines should generally not be given concurrently with infliximab",
        explanation: "Live vaccines should not be given concurrently with infliximab because of infection risk.",
        objective: .interaction,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "live-vaccines"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_036",
        subsectionId: "8e",
        difficulty: .hard,
        question: "A pregnant patient received infliximab during pregnancy and later asks about infant vaccines. Which high-yield counseling point stands out?",
        options: ["Infants exposed in utero should avoid live vaccines for at least 6 months after birth", "All routine vaccines should be avoided for the first 5 years", "No vaccines of any kind can ever be given", "Only influenza vaccine is allowed for life", "This issue applies only to mesalamine, not infliximab"],
        answer: "Infants exposed in utero should avoid live vaccines for at least 6 months after birth",
        explanation: "A classic infliximab counseling pearl is that infants exposed in utero should avoid live vaccines for at least 6 months after birth.",
        objective: .pearl,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "pregnancy", "live-vaccines"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_037",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient on infliximab develops fever and cough. Why is this more concerning than the same call from a patient taking simple acid-suppression therapy?",
        options: ["Infliximab increases the risk of serious infection and may need to be held if a serious infection develops", "Infliximab always causes benign fever after every dose", "Fever proves the drug is working and should be ignored", "Cough is expected because infliximab is inhaled", "The main concern is only kidney stones"],
        answer: "Infliximab increases the risk of serious infection and may need to be held if a serious infection develops",
        explanation: "Infliximab carries a boxed warning for serious infections and should be discontinued if a serious infection or sepsis develops.",
        objective: .adverseEffect,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "infection"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_038",
        subsectionId: "8e",
        difficulty: .medium,
        question: "Why is combining infliximab with another biologic used for the same inflammatory condition generally avoided?",
        options: ["It can increase the risk of serious infections", "It always causes immediate liver failure", "It blocks all oral drug absorption", "It makes TB testing falsely negative forever", "It universally causes mesalamine intolerance syndrome"],
        answer: "It can increase the risk of serious infections",
        explanation: "Concurrent use of infliximab with other biologic products for the same condition is generally not recommended because infection risk increases.",
        objective: .interaction,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "other-biologics"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_039",
        subsectionId: "8e",
        difficulty: .hard,
        question: "A high-yield malignancy pearl for infliximab is especially important in young patients with IBD receiving combination immunosuppression. Which malignancy is classically emphasized?",
        options: ["Hepatosplenic T-cell lymphoma", "Basal cell carcinoma only", "Papillary thyroid carcinoma", "Osteosarcoma", "Acute promyelocytic leukemia"],
        answer: "Hepatosplenic T-cell lymphoma",
        explanation: "Postmarketing cases of hepatosplenic T-cell lymphoma have been reported with TNF blockers, especially in IBD patients also receiving azathioprine or 6-mercaptopurine.",
        objective: .adverseEffect,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "lymphoma", "hstcl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_040",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Which statement best captures infliximab compared with symptomatic GI medications?",
        options: ["It is a biologic disease-modifying therapy, not a quick symptomatic rescue drug", "It is mainly a stool softener used as needed", "It is an antacid for post-meal reflux", "It is an opioid-like antidiarrheal for travel", "It is an antihistamine for nausea"],
        answer: "It is a biologic disease-modifying therapy, not a quick symptomatic rescue drug",
        explanation: "Infliximab is a biologic disease-modifying therapy used for more significant inflammatory disease, not a quick symptomatic rescue medicine.",
        objective: .pearl,
        relatedDrugIds: ["d145"],
        tags: ["8e", "infliximab", "controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_041",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Which 8e drug is the anti-TNF biologic rather than the 5-ASA anti-inflammatory?",
        options: ["Infliximab", "Mesalamine", "Both are 5-ASA drugs", "Neither has immune effects", "Both are acid suppressors"],
        answer: "Infliximab",
        explanation: "Infliximab is the anti-TNF biologic; mesalamine is the 5-ASA anti-inflammatory.",
        objective: .classId,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "comparison", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_042",
        subsectionId: "8e",
        difficulty: .easy,
        question: "A pre-treatment checklist asks whether the patient needs TB and HBV screening or mostly renal monitoring. Which drug matches the TB/HBV part of that decision?",
        options: ["Infliximab", "Mesalamine", "Sucralfate", "Famotidine", "Dicyclomine"],
        answer: "Infliximab",
        explanation: "Infliximab requires infectious screening such as latent TB and hepatitis B testing before treatment; mesalamine is more associated with renal monitoring.",
        objective: .monitoring,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "comparison", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_043",
        subsectionId: "8e",
        difficulty: .easy,
        question: "Which 8e drug is the one most classically linked to baseline and periodic renal function monitoring?",
        options: ["Mesalamine", "Infliximab", "Both equally because both are nephrotoxic biologics", "Neither because monitoring is never needed", "Only infliximab because it is infused"],
        answer: "Mesalamine",
        explanation: "Mesalamine is the IBD drug most classically associated with renal monitoring because nephrotoxicity can occur.",
        objective: .monitoring,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "comparison", "renal-monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_044",
        subsectionId: "8e",
        difficulty: .easy,
        question: "One 8e drug is taken orally as a bowel-focused anti-inflammatory, while the other is given by IV infusion as a biologic. Which oral drug fits the first description?",
        options: ["Mesalamine", "Infliximab", "Both are IV infusions", "Neither; both are inhaled", "Both are rectal suspensions only"],
        answer: "Mesalamine",
        explanation: "Mesalamine is the oral bowel-focused anti-inflammatory in this subsection, whereas infliximab is an IV biologic.",
        objective: .pearl,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "comparison", "route"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8e_add_045",
        subsectionId: "8e",
        difficulty: .medium,
        question: "A patient with ulcerative colitis asks why mesalamine and infliximab are not interchangeable even though both can be used in IBD. Which explanation is best?",
        options: ["Mesalamine is a 5-ASA anti-inflammatory often used in more limited disease, whereas infliximab is an anti-TNF biologic used when disease is more severe or conventional therapy is inadequate", "Mesalamine and infliximab are just two brand names for the same molecule", "Infliximab is used only for constipation and mesalamine only for Crohn disease fistulas", "Mesalamine is always stronger than infliximab in severe fistulizing Crohn disease", "The difference is only that infliximab tastes worse than mesalamine"],
        answer: "Mesalamine is a 5-ASA anti-inflammatory often used in more limited disease, whereas infliximab is an anti-TNF biologic used when disease is more severe or conventional therapy is inadequate",
        explanation: "The high-yield distinction is that mesalamine is a 5-ASA bowel anti-inflammatory, while infliximab is an escalation anti-TNF biologic for more severe disease or inadequate response to conventional therapy.",
        objective: .mixedReview,
        relatedDrugIds: ["d144", "d145"],
        tags: ["8e", "comparison", "therapy-selection"],
        source: .curated
    )
    ]
}
