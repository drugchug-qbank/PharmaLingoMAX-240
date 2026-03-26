// PharmaLingo — Module 7d (Leukotriene Modifiers & Other Controllers)
// Curated Add-On Question Pack (45 questions)
// IDs: q7d_add_001 ... q7d_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 7d exists, then append:
//
//    if bank["7d"] == nil { bank["7d"] = [] }
//    bank["7d"]?.append(contentsOf: Self.curatedAddOnQuestions_7d)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d127 (Dupilumab / Dupixent), d125 (Montelukast / Singulair),
//   d126 (Omalizumab / Xolair), d128 (Roflumilast / Daliresp),
//   d129 (Theophylline / Theo-24).
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7d: [Question] = [
    .multipleChoice(
        id: "q7d_add_001",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Dupixent is a biologic controller students should associate with eosinophilic asthma and other type 2 inflammatory diseases rather than quick rescue. What is the generic name of Dupixent?",
        options: ["Dupilumab", "Omalizumab", "Montelukast", "Roflumilast", "Theophylline"],
        answer: "Dupilumab",
        explanation: "Dupixent is the brand name for dupilumab. In respiratory pharmacology, dupilumab is an add-on maintenance biologic, not a rescue medication.",
        objective: .brandGeneric,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_002",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Dupilumab is an IL-4/IL-13 pathway biologic used as add-on maintenance therapy for selected patients with moderate-to-severe asthma. Which brand name matches dupilumab?",
        options: ["Dupixent", "Xolair", "Singulair", "Daliresp", "Theo-24"],
        answer: "Dupixent",
        explanation: "Dupilumab is marketed as Dupixent. Remembering that brand helps separate it from Xolair, which targets IgE instead.",
        objective: .genericBrand,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_003",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Singulair is an oral controller that works through the leukotriene pathway and is often discussed in asthma plus allergic rhinitis stems. What is the generic name of Singulair?",
        options: ["Montelukast", "Omalizumab", "Dupilumab", "Roflumilast", "Theophylline"],
        answer: "Montelukast",
        explanation: "Singulair is the brand name for montelukast. Montelukast is an oral leukotriene receptor antagonist used for chronic control, not rapid bronchodilation.",
        objective: .brandGeneric,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_004",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Montelukast is the oral leukotriene receptor antagonist in this subsection and is commonly tested for asthma, allergic rhinitis, and exercise-induced bronchoconstriction pearls. Which brand name matches montelukast?",
        options: ["Singulair", "Dupixent", "Xolair", "Daliresp", "Theo-24"],
        answer: "Singulair",
        explanation: "Montelukast is sold as Singulair. That pairing is high yield because montelukast is the best-known oral leukotriene modifier.",
        objective: .genericBrand,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_005",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Xolair is a biologic controller famous for its anaphylaxis warning and its role in allergic asthma. What is the generic name of Xolair?",
        options: ["Omalizumab", "Dupilumab", "Montelukast", "Roflumilast", "Theophylline"],
        answer: "Omalizumab",
        explanation: "Xolair is the brand name for omalizumab. Omalizumab is the anti-IgE monoclonal antibody in this subsection.",
        objective: .brandGeneric,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_006",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Omalizumab is the anti-IgE monoclonal antibody used as add-on therapy for selected allergic asthma patients. Which brand name matches omalizumab?",
        options: ["Xolair", "Dupixent", "Singulair", "Daliresp", "Theo-24"],
        answer: "Xolair",
        explanation: "Omalizumab is marketed as Xolair. Students should connect Xolair with IgE-mediated disease and anaphylaxis monitoring.",
        objective: .genericBrand,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_007",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Daliresp is not a bronchodilator; instead, it is an oral controller used to reduce COPD exacerbations in a specific high-risk population. What is the generic name of Daliresp?",
        options: ["Roflumilast", "Theophylline", "Montelukast", "Omalizumab", "Dupilumab"],
        answer: "Roflumilast",
        explanation: "Daliresp is the brand name for roflumilast. Roflumilast is a PDE4 inhibitor used for severe COPD with chronic bronchitis and a history of exacerbations.",
        objective: .brandGeneric,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_008",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Roflumilast is an oral PDE4 inhibitor used to reduce COPD exacerbations rather than to give immediate symptom relief. Which brand name matches roflumilast?",
        options: ["Daliresp", "Theo-24", "Singulair", "Xolair", "Dupixent"],
        answer: "Daliresp",
        explanation: "Roflumilast is sold as Daliresp. The brand is worth knowing because Daliresp is a classic board-style COPD controller pearl.",
        objective: .genericBrand,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_009",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Theo-24 is the older controller students should remember for its narrow therapeutic index, many interactions, and need for serum level monitoring. What is the generic name of Theo-24?",
        options: ["Theophylline", "Roflumilast", "Montelukast", "Omalizumab", "Dupilumab"],
        answer: "Theophylline",
        explanation: "Theo-24 is a brand of theophylline. Theophylline is a methylxanthine that is now used far less often because of toxicity and interaction concerns.",
        objective: .brandGeneric,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_010",
        subsectionId: "7d",
        difficulty: .easy,
        question: "Theophylline is the older methylxanthine controller whose narrow therapeutic index makes it far more dangerous than modern asthma controllers. Which brand name matches theophylline in this subsection?",
        options: ["Theo-24", "Daliresp", "Singulair", "Xolair", "Dupixent"],
        answer: "Theo-24",
        explanation: "Theophylline is sold as Theo-24 in this subsection. That brand association is useful because Theo-24 signals extended-release theophylline.",
        objective: .genericBrand,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_011",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A patient wants an oral asthma controller that works through leukotrienes rather than through beta receptors or steroids. How should montelukast be classified?",
        options: ["Leukotriene receptor antagonist", "Anti-IgE monoclonal antibody", "PDE4 inhibitor", "Methylxanthine", "Inhaled corticosteroid"],
        answer: "Leukotriene receptor antagonist",
        explanation: "Montelukast is a leukotriene receptor antagonist. It works as an oral controller and should not be confused with biologics or bronchodilators.",
        objective: .classId,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_012",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A student sees Xolair in an allergic asthma treatment plan and wants to identify its drug class. How should omalizumab be classified?",
        options: ["Anti-IgE monoclonal antibody", "Anti-IL-4/IL-13 monoclonal antibody", "Leukotriene receptor antagonist", "PDE4 inhibitor", "Methylxanthine"],
        answer: "Anti-IgE monoclonal antibody",
        explanation: "Omalizumab is an anti-IgE monoclonal antibody. It is a biologic add-on controller used in selected allergic asthma patients.",
        objective: .classId,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_013",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Dupixent is a biologic, but it is not the anti-IgE product in this subsection. How should dupilumab be classified?",
        options: ["Anti-IL-4/IL-13 monoclonal antibody", "Anti-IgE monoclonal antibody", "Leukotriene receptor antagonist", "PDE4 inhibitor", "Methylxanthine"],
        answer: "Anti-IL-4/IL-13 monoclonal antibody",
        explanation: "Dupilumab is an anti-IL-4/IL-13 pathway biologic. Its target separates it from omalizumab, which binds IgE.",
        objective: .classId,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_014",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Daliresp is used in COPD but is not a beta agonist, antimuscarinic inhaler, or steroid. How should roflumilast be classified?",
        options: ["PDE4 inhibitor", "Leukotriene receptor antagonist", "Anti-IgE monoclonal antibody", "Methylxanthine", "LABA"],
        answer: "PDE4 inhibitor",
        explanation: "Roflumilast is a phosphodiesterase-4 inhibitor. It is an oral anti-inflammatory controller used to reduce COPD exacerbations in a specific population.",
        objective: .classId,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_015",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Theo-24 is the older oral controller with serum level monitoring and caffeine-like toxicity. How should theophylline be classified?",
        options: ["Methylxanthine", "PDE4 inhibitor", "Leukotriene receptor antagonist", "Anti-IgE monoclonal antibody", "Anti-IL-4/IL-13 monoclonal antibody"],
        answer: "Methylxanthine",
        explanation: "Theophylline is a methylxanthine. That class association helps explain its stimulant-like adverse effects and narrow therapeutic window.",
        objective: .classId,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_016",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Montelukast improves chronic asthma control by targeting leukotriene signaling in the airways. Which mechanism best matches montelukast?",
        options: ["Blocks cysteinyl leukotriene receptors", "Binds free IgE", "Inhibits IL-4 and IL-13 signaling", "Inhibits PDE4 to raise cAMP", "Relaxes airway smooth muscle by beta2 stimulation"],
        answer: "Blocks cysteinyl leukotriene receptors",
        explanation: "Montelukast blocks airway cysteinyl leukotriene receptors. That is why it is called a leukotriene receptor antagonist.",
        objective: .moa,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_017",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Xolair works upstream in allergic disease rather than directly relaxing bronchial smooth muscle. Which mechanism best matches omalizumab?",
        options: ["Binds free IgE and lowers free IgE levels", "Blocks cysteinyl leukotriene receptors", "Inhibits IL-4 and IL-13 signaling", "Inhibits PDE4 to raise cAMP", "Antagonizes muscarinic receptors"],
        answer: "Binds free IgE and lowers free IgE levels",
        explanation: "Omalizumab binds IgE and lowers free IgE levels. That mechanism makes it the anti-IgE biologic in respiratory pharmacology.",
        objective: .moa,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_018",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Dupilumab is not an anti-IgE drug; instead, it blocks a cytokine receptor shared by two type 2 inflammatory pathways. Which mechanism best matches dupilumab?",
        options: ["Inhibits IL-4 and IL-13 signaling via IL-4Rα", "Binds free IgE and lowers free IgE levels", "Blocks cysteinyl leukotriene receptors", "Inhibits PDE4 to raise cAMP", "Nonselectively inhibits phosphodiesterase and adenosine receptors"],
        answer: "Inhibits IL-4 and IL-13 signaling via IL-4Rα",
        explanation: "Dupilumab inhibits IL-4 and IL-13 signaling by targeting the IL-4 receptor alpha subunit. That is the core mechanistic pearl that distinguishes Dupixent from Xolair.",
        objective: .moa,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_019",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Roflumilast is used as an oral anti-inflammatory COPD controller rather than as a rescue bronchodilator. Which mechanism best matches roflumilast?",
        options: ["Selective PDE4 inhibition leading to increased intracellular cAMP", "Blocks cysteinyl leukotriene receptors", "Binds free IgE and lowers free IgE levels", "Inhibits IL-4 and IL-13 signaling", "Antagonizes H1 receptors"],
        answer: "Selective PDE4 inhibition leading to increased intracellular cAMP",
        explanation: "Roflumilast and its active metabolite selectively inhibit PDE4, which increases intracellular cAMP. This is the defining mechanism of Daliresp.",
        objective: .moa,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_020",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A patient with severe COPD, chronic bronchitis, and repeated exacerbations is already using inhaled bronchodilators but still flares often. Which 7d medication best matches that add-on indication?",
        options: ["Roflumilast", "Montelukast", "Omalizumab", "Dupilumab", "Theophylline"],
        answer: "Roflumilast",
        explanation: "Roflumilast is used to reduce COPD exacerbations in patients with severe COPD associated with chronic bronchitis and a history of exacerbations. It is not used as a rescue inhaler.",
        objective: .indication,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "copd"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_021",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A patient has moderate-to-severe persistent allergic asthma, positive perennial allergen reactivity, and poor control despite inhaled corticosteroids. Which 7d drug best fits that high-yield indication?",
        options: ["Omalizumab", "Dupilumab", "Montelukast", "Roflumilast", "Theophylline"],
        answer: "Omalizumab",
        explanation: "Omalizumab is indicated for selected patients with moderate-to-severe persistent allergic asthma inadequately controlled with inhaled corticosteroids. The allergy/IgE connection points to Xolair.",
        objective: .indication,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "allergic-asthma"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_022",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A patient with moderate-to-severe eosinophilic asthma continues to need frequent oral steroid bursts despite standard controller therapy. Which 7d medication best fits this add-on maintenance role?",
        options: ["Dupilumab", "Omalizumab", "Montelukast", "Roflumilast", "Theophylline"],
        answer: "Dupilumab",
        explanation: "Dupilumab is used as add-on maintenance treatment for moderate-to-severe asthma characterized by an eosinophilic phenotype or oral corticosteroid dependence.",
        objective: .indication,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "eosinophilic-asthma"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_023",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A learner remembers that montelukast can help allergic rhinitis, but also that its risks changed how casually it should be prescribed. Which counseling pearl is most accurate?",
        options: ["Reserve montelukast for allergic rhinitis when alternatives fail or are not tolerated because of serious neuropsychiatric risk", "Use montelukast first-line for every seasonal allergy patient because it has fewer warnings than antihistamines", "Choose montelukast for immediate relief of acute wheezing during an asthma attack", "Prefer montelukast over albuterol when the goal is rapid bronchodilation", "Avoid montelukast in asthma because it has no role in chronic control"],
        answer: "Reserve montelukast for allergic rhinitis when alternatives fail or are not tolerated because of serious neuropsychiatric risk",
        explanation: "Montelukast carries a boxed warning for serious neuropsychiatric events, so its use for allergic rhinitis is generally reserved for patients who do not respond to or cannot tolerate alternative therapies.",
        objective: .contraindication,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "boxed-warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_024",
        subsectionId: "7d",
        difficulty: .hard,
        question: "Xolair has a boxed warning that shapes how therapy is started. Which statement best captures that high-yield safety issue?",
        options: ["Because anaphylaxis can occur after the first dose or even later in therapy, treatment should begin in a healthcare setting prepared to manage anaphylaxis", "Because severe liver failure is the main concern, Xolair must always be started in a hepatology clinic", "Because seizure risk is extreme, routine EEG monitoring is required after every dose", "Because Xolair causes profound hypokalemia, potassium must be replaced before each injection", "Because it is a rescue bronchodilator, patients should self-administer the first dose during an acute asthma attack"],
        answer: "Because anaphylaxis can occur after the first dose or even later in therapy, treatment should begin in a healthcare setting prepared to manage anaphylaxis",
        explanation: "Omalizumab carries a boxed warning for anaphylaxis. Anaphylaxis has occurred after the first dose and also beyond 1 year after treatment initiation, so initial dosing and observation require an appropriate healthcare setting.",
        objective: .adverseEffect,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "anaphylaxis"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_025",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Dupixent can improve long-term control in selected asthma phenotypes, but it is not the drug to reach for during sudden wheezing in the exam room. Which statement is most accurate?",
        options: ["Dupilumab is add-on maintenance therapy and should not be used for acute bronchospasm or status asthmaticus", "Dupilumab is a rescue bronchodilator used in place of albuterol for acute attacks", "Dupilumab should be used as the first treatment for every mild intermittent asthma flare", "Dupilumab is indicated only for immediate reversal of exercise-induced bronchospasm", "Dupilumab should be given only by nebulizer during acute COPD exacerbations"],
        answer: "Dupilumab is add-on maintenance therapy and should not be used for acute bronchospasm or status asthmaticus",
        explanation: "Dupilumab is a controller biologic, not a rescue therapy. Patients still need rapid-relief medication for acute bronchospasm.",
        objective: .pearl,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "not-rescue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_026",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A patient asks whether Daliresp can replace a rescue inhaler because it helps reduce COPD exacerbations. What is the best response?",
        options: ["No—roflumilast is not a bronchodilator and is not indicated for relief of acute bronchospasm", "Yes—roflumilast is the preferred first-line rescue medication for acute dyspnea", "Yes—roflumilast works like albuterol but lasts longer", "Yes—roflumilast rapidly reverses status asthmaticus", "No—roflumilast is only for allergic rhinitis"],
        answer: "No—roflumilast is not a bronchodilator and is not indicated for relief of acute bronchospasm",
        explanation: "Roflumilast reduces exacerbation risk in a selected COPD population, but it does not function as a rescue bronchodilator.",
        objective: .pearl,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "not-bronchodilator"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_027",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient without daily controller therapy wants help preventing exercise-induced bronchoconstriction before a long run. Which montelukast instruction is correct?",
        options: ["Take a single dose at least 2 hours before exercise and do not take an extra dose within 24 hours", "Take montelukast only after exercise if wheezing starts", "Use montelukast every 4 hours during exercise as a rescue medication", "Take montelukast immediately before exercise and repeat every hour as needed", "Montelukast cannot be used for exercise-induced bronchoconstriction prevention"],
        answer: "Take a single dose at least 2 hours before exercise and do not take an extra dose within 24 hours",
        explanation: "For prevention of exercise-induced bronchoconstriction, montelukast should be taken at least 2 hours before exercise. Patients should not take an additional dose within 24 hours of a previous dose.",
        objective: .dosing,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "eib"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_028",
        subsectionId: "7d",
        difficulty: .medium,
        question: "For chronic asthma control, montelukast is usually taken on a simple daily schedule that students should know cold. Which instruction best matches standard adult asthma use?",
        options: ["Take once daily in the evening", "Take only during an acute attack", "Take every 6 hours around the clock", "Take once weekly with food", "Take only on exercise days"],
        answer: "Take once daily in the evening",
        explanation: "For chronic asthma treatment, montelukast is taken once daily in the evening. That schedule is a classic teaching pearl for Singulair.",
        objective: .dosing,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "evening-dose"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_029",
        subsectionId: "7d",
        difficulty: .hard,
        question: "When a clinician calculates an asthma dose of omalizumab, which two variables are the key high-yield inputs?",
        options: ["Pretreatment serum total IgE and body weight", "Creatinine clearance and QT interval", "FEV1 and respiratory rate", "AST/ALT and serum potassium", "Age and resting heart rate only"],
        answer: "Pretreatment serum total IgE and body weight",
        explanation: "Omalizumab dosing for asthma is based on pretreatment serum total IgE level and body weight. That is a classic Xolair test pearl.",
        objective: .dosing,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "dosing"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_030",
        subsectionId: "7d",
        difficulty: .medium,
        question: "A student is trying to remember the common asthma-side adverse effects emphasized for dupilumab. Which cluster fits best?",
        options: ["Injection site reactions, oropharyngeal pain, and eosinophilia", "Tendon rupture, dysglycemia, and gingival hyperplasia", "Severe bradycardia, tinnitus, and constipation", "Hemorrhagic cystitis, pancreatitis, and nephrolithiasis", "Ototoxicity, photosensitivity, and orange secretions"],
        answer: "Injection site reactions, oropharyngeal pain, and eosinophilia",
        explanation: "In asthma studies, dupilumab commonly caused injection site reactions, oropharyngeal pain, and eosinophilia. Those are useful adverse-effect anchors for Dupixent stems.",
        objective: .adverseEffect,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "adverse-effects"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_031",
        subsectionId: "7d",
        difficulty: .hard,
        question: "Which counseling point is most important when starting roflumilast in a patient with COPD and a history of depression plus unintentional weight loss?",
        options: ["Roflumilast can worsen psychiatric symptoms and cause further weight loss, so mood and weight should be monitored closely", "Roflumilast mainly causes hyperkalemia, so mood and weight are not important", "Roflumilast is a rescue bronchodilator, so adverse effects matter only during an acute attack", "Roflumilast commonly causes hypoglycemia, so mood symptoms are unrelated", "Roflumilast is inhaled locally and has no meaningful systemic adverse effects"],
        answer: "Roflumilast can worsen psychiatric symptoms and cause further weight loss, so mood and weight should be monitored closely",
        explanation: "Roflumilast is associated with psychiatric adverse reactions, including suicidality, and with clinically significant weight loss. Those risks make mood and weight monitoring high yield.",
        objective: .monitoring,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "monitoring"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_032",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Which patient would have the clearest reason to avoid roflumilast before it is even prescribed?",
        options: ["A patient with moderate-to-severe liver impairment", "A patient with seasonal allergies", "A patient with well-controlled hypertension", "A patient using an inhaled corticosteroid", "A patient with mild constipation"],
        answer: "A patient with moderate-to-severe liver impairment",
        explanation: "Roflumilast is contraindicated in moderate to severe liver impairment. That liver pearl is one of the easiest ways to distinguish Daliresp from most inhaled controllers.",
        objective: .contraindication,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "liver"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_033",
        subsectionId: "7d",
        difficulty: .hard,
        question: "One reason theophylline has fallen out of favor is that its dose cannot be managed casually. Which statement best captures that issue?",
        options: ["Theophylline has a narrow therapeutic index and requires serum concentration monitoring", "Theophylline has no oral absorption, so serum monitoring is impossible", "Theophylline is completely free of drug interactions, so serum levels do not matter", "Theophylline is used only topically, so systemic toxicity is irrelevant", "Theophylline works only if its concentration exceeds 40 mcg/mL"],
        answer: "Theophylline has a narrow therapeutic index and requires serum concentration monitoring",
        explanation: "Theophylline is a narrow-therapeutic-index drug. Serum concentration monitoring is central because both underdosing and toxicity are common problems.",
        objective: .monitoring,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "narrow-ti"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_034",
        subsectionId: "7d",
        difficulty: .hard,
        question: "When clinicians aim for a practical theophylline maintenance range that balances benefit and safety, which peak serum concentration range is the best test-day answer?",
        options: ["10 to 15 mcg/mL", "0 to 2 mcg/mL", "3 to 5 mcg/mL", "20 to 25 mcg/mL", "30 to 40 mcg/mL"],
        answer: "10 to 15 mcg/mL",
        explanation: "Theophylline has a broader therapeutic range of about 10 to 20 mcg/mL, but maintaining peak concentrations around 10 to 15 mcg/mL is a classic safety-oriented pearl to capture benefit while minimizing toxicity.",
        objective: .monitoring,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "serum-range"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_035",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient on theophylline develops persistent vomiting, palpitations, and then a seizure after a dose increase. Which interpretation is most accurate?",
        options: ["Theophylline toxicity can cause arrhythmias and seizures, especially when serum concentrations rise above about 20 mcg/mL", "This is the classic benign adverse-effect pattern expected from any therapeutic theophylline level", "Theophylline toxicity causes only rash and dry mouth, not cardiac or neurologic problems", "These findings prove the patient needs a higher theophylline dose", "Theophylline overdose is harmless if the formulation is extended-release"],
        answer: "Theophylline toxicity can cause arrhythmias and seizures, especially when serum concentrations rise above about 20 mcg/mL",
        explanation: "When theophylline concentrations climb too high, severe toxicity can include persistent vomiting, cardiac arrhythmias, and intractable seizures. This is why serum monitoring matters so much.",
        objective: .adverseEffect,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "toxicity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_036",
        subsectionId: "7d",
        difficulty: .medium,
        question: "At lower but still clinically relevant theophylline concentrations, which adverse-effect cluster best reflects its classic caffeine-like toxicity?",
        options: ["Nausea, headache, and insomnia", "Weight gain, edema, and bradycardia", "Constipation, urinary retention, and blurred vision", "Thrush, dysphonia, and oral candidiasis", "Tendon rupture, neuropathy, and photosensitivity"],
        answer: "Nausea, headache, and insomnia",
        explanation: "Theophylline commonly causes caffeine-like effects such as nausea, headache, and insomnia. Those milder symptoms can appear before more dangerous toxicity develops.",
        objective: .adverseEffect,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "caffeine-like"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_037",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient has been stable on theophylline for months and then quits smoking. If the dose is left unchanged, what pharmacokinetic change is most likely?",
        options: ["Theophylline clearance falls, so serum levels can rise and toxicity risk increases", "Theophylline clearance rises dramatically, so toxicity becomes impossible", "Smoking status has no effect on theophylline metabolism", "Theophylline becomes inactive after smoking cessation", "Quitting smoking causes theophylline to convert into montelukast"],
        answer: "Theophylline clearance falls, so serum levels can rise and toxicity risk increases",
        explanation: "Tobacco smoking increases theophylline clearance. When a patient stops smoking, clearance can drop and the same dose may produce higher levels and more toxicity.",
        objective: .interaction,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "smoking"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_038",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A clinician prescribes ciprofloxacin for a patient who already takes theophylline. Why should this combination raise concern?",
        options: ["Ciprofloxacin can increase theophylline exposure and toxicity risk, so levels and symptoms should be monitored", "Ciprofloxacin completely blocks montelukast receptors", "Ciprofloxacin makes roflumilast a rescue bronchodilator", "Ciprofloxacin prevents omalizumab from binding IgE", "Ciprofloxacin reliably lowers theophylline levels to zero"],
        answer: "Ciprofloxacin can increase theophylline exposure and toxicity risk, so levels and symptoms should be monitored",
        explanation: "Ciprofloxacin can raise theophylline exposure and increase CNS and other adverse reactions. This is one of the classic interaction pearls that makes theophylline tricky to use safely.",
        objective: .interaction,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "ciprofloxacin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_039",
        subsectionId: "7d",
        difficulty: .medium,
        question: "In a modern asthma lecture, theophylline is often presented more as a historical cautionary drug than as a preferred controller. Which reason best explains that reputation?",
        options: ["It has a narrow therapeutic index and many clinically important interactions", "It is ineffective for any airway disease", "It can only be given intravenously in the ICU", "It is contraindicated in all adults over age 18", "It has no measurable pharmacologic effect on the lungs"],
        answer: "It has a narrow therapeutic index and many clinically important interactions",
        explanation: "Theophylline is rarely used now because safer controllers are available. Its narrow therapeutic index and wide interaction burden make routine use much less attractive.",
        objective: .pearl,
        relatedDrugIds: ["d129"],
        tags: ["7d", "theophylline", "rarely-used"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_040",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient is starting Daliresp and asks why the prescription begins with 250 mcg before moving to 500 mcg daily. Which answer is most accurate?",
        options: ["The 250 mcg dose is a 4-week starting dose to improve tolerability and is not the therapeutic maintenance dose", "The 250 mcg dose is the long-term therapeutic target for all patients", "The 500 mcg dose is only for acute rescue use during bronchospasm", "The 250 mcg dose is used because roflumilast has no oral bioavailability at higher doses", "The 250 mcg dose is required because roflumilast causes immediate hypoglycemia at 500 mcg"],
        answer: "The 250 mcg dose is a 4-week starting dose to improve tolerability and is not the therapeutic maintenance dose",
        explanation: "For roflumilast, 250 mcg daily is a starting dose used for the first 4 weeks only. The usual maintenance dose is 500 mcg daily.",
        objective: .dosing,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "starter-dose"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_041",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient with steroid-dependent asthma improves after starting dupilumab and wants to stop all steroids that same day. What is the best response?",
        options: ["Do not stop systemic, inhaled, or topical corticosteroids abruptly when starting dupilumab; any reduction should be gradual", "Yes—dupilumab immediately replaces all steroids, so abrupt discontinuation is recommended", "Only inhaled steroids must be stopped abruptly; oral steroids should continue", "Dupilumab has no interaction with steroid tapering decisions", "Abrupt steroid withdrawal is preferred to prevent eosinophilia"],
        answer: "Do not stop systemic, inhaled, or topical corticosteroids abruptly when starting dupilumab; any reduction should be gradual",
        explanation: "When dupilumab is started, corticosteroids should not be stopped abruptly. If steroid reduction is appropriate, it should be done gradually under supervision.",
        objective: .pearl,
        relatedDrugIds: ["d127"],
        tags: ["7d", "dupilumab", "steroid-taper"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_042",
        subsectionId: "7d",
        difficulty: .hard,
        question: "A patient on Xolair later develops fever, arthralgia, and rash. Which high-yield warning best matches this pattern?",
        options: ["Serum sickness-like reaction", "Tendon rupture", "Ototoxicity", "Stevens-Johnson syndrome from sulfonamides", "Red man syndrome"],
        answer: "Serum sickness-like reaction",
        explanation: "Omalizumab labeling warns about fever, arthralgia, and rash consistent with a serum sickness-like reaction. That pearl is less common than the boxed warning but still highly testable.",
        objective: .adverseEffect,
        relatedDrugIds: ["d126"],
        tags: ["7d", "omalizumab", "serum-sickness"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_043",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Two biologics appear in this subsection. Which one works by binding free IgE rather than by blocking IL-4/IL-13 signaling?",
        options: ["Omalizumab", "Dupilumab", "Montelukast", "Roflumilast", "Theophylline"],
        answer: "Omalizumab",
        explanation: "Omalizumab is the anti-IgE biologic. Dupilumab instead targets IL-4Rα and blocks IL-4/IL-13 signaling.",
        objective: .mixedReview,
        relatedDrugIds: ["d126", "d127"],
        tags: ["7d", "biologics", "compare"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_044",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Which 7d controller is oral, non-biologic, associated with a boxed warning for serious neuropsychiatric events, and also has a role in allergic rhinitis?",
        options: ["Montelukast", "Omalizumab", "Dupilumab", "Roflumilast", "Theophylline"],
        answer: "Montelukast",
        explanation: "Montelukast is the oral leukotriene receptor antagonist that also has an allergic rhinitis indication. Its boxed neuropsychiatric warning is the key distinguishing safety pearl.",
        objective: .mixedReview,
        relatedDrugIds: ["d125"],
        tags: ["7d", "montelukast", "compare"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7d_add_045",
        subsectionId: "7d",
        difficulty: .medium,
        question: "Which 7d controller is an oral PDE4 inhibitor used to reduce COPD exacerbations in severe chronic-bronchitis patients, yet should never be mistaken for a rescue bronchodilator?",
        options: ["Roflumilast", "Montelukast", "Omalizumab", "Dupilumab", "Theophylline"],
        answer: "Roflumilast",
        explanation: "Roflumilast is the oral PDE4 inhibitor used to reduce COPD exacerbations in selected patients. It is not a bronchodilator and should not be used for acute symptom relief.",
        objective: .mixedReview,
        relatedDrugIds: ["d128"],
        tags: ["7d", "roflumilast", "compare"],
        source: .curated
    )
    ]
}
