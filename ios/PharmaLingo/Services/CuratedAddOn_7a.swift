// PharmaLingo — Asthma/COPD Overview (Stepwise Logic)
// Curated Add-On Question Pack (45 questions)
// IDs: q7a_add_001 ... q7a_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 7a is a review-only strategy/mastery subsection in the outline and current repo.
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
//        if sub.id == Self.asthmaCopdOverviewSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_7aOverview)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 7b–7e with a few earlier-module crossover questions.
// - No clinical-trial questions.
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 7 strategy/mastery quiz.
    static let asthmaCopdOverviewSubsectionId: String = "7a"

    static let curatedAddOnQuestions_7aOverview: [Question] = [
        .multipleChoice(
            id: "q7a_add_001",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "A college student with asthma develops sudden wheeze and chest tightness while walking to class. Stepwise logic says they need a quick-relief inhaler that works within minutes, not a daily controller. Which drug best fits that role?",
            options: ["Albuterol", "Fluticasone (inhaled)", "Tiotropium", "Montelukast", "Roflumilast"],
            answer: "Albuterol",
            explanation: "Albuterol is the classic short-acting beta2 agonist rescue inhaler used for sudden bronchospasm. The other options are controllers or maintenance agents rather than first-line rapid relief.",
            objective: .indication,
            relatedDrugIds: ["d120"],
            tags: ["Mastery", "7a", "rescue inhaler", "acute bronchospasm"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_002",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "ProAir and Ventolin are brand names for the short-acting beta2 agonist most students memorize as the classic rescue inhaler. What is the generic name?",
            options: ["Albuterol", "Levalbuterol", "Salmeterol", "Ipratropium", "Tiotropium"],
            answer: "Albuterol",
            explanation: "ProAir and Ventolin are brand names for albuterol. This is the high-yield rescue inhaler students should immediately recognize in asthma and exercise-induced bronchospasm.",
            objective: .brandGeneric,
            relatedDrugIds: ["d120"],
            tags: ["Mastery", "7a", "ProAir", "Ventolin", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_003",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A runner with exercise-induced bronchospasm wants something to use shortly before activity to prevent symptoms. Which medication from this module is the classic pre-exercise option?",
            options: ["Albuterol", "Tiotropium", "Budesonide (inhaled)", "Montelukast", "Omalizumab"],
            answer: "Albuterol",
            explanation: "Albuterol is commonly used before exercise for quick prevention of exercise-induced bronchospasm because it acts rapidly. The other choices are longer-term controllers or specialty agents.",
            objective: .indication,
            relatedDrugIds: ["d120"],
            tags: ["Mastery", "7a", "exercise-induced bronchospasm", "pre-exercise"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_004",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Xopenex is often taught next to albuterol because it is the R-enantiomer of that rescue bronchodilator. What is the generic name of Xopenex?",
            options: ["Levalbuterol", "Albuterol", "Salmeterol", "Tiotropium", "Montelukast"],
            answer: "Levalbuterol",
            explanation: "Xopenex is the brand name for levalbuterol, the R-enantiomer of albuterol. It is still a rescue bronchodilator, but students should not confuse it with long-acting maintenance inhalers.",
            objective: .brandGeneric,
            relatedDrugIds: ["d121"],
            tags: ["Mastery", "7a", "Xopenex", "R-enantiomer"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_005",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient now needs albuterol several times each week. Stepwise asthma logic says frequent rescue use usually means airway inflammation is not adequately controlled and an ICS-containing controller should be added. Which option is an inhaled corticosteroid controller?",
            options: ["Fluticasone (inhaled)", "Pseudoephedrine", "Albuterol", "Diphenhydramine", "Tiotropium"],
            answer: "Fluticasone (inhaled)",
            explanation: "Inhaled corticosteroids are controller medications that target airway inflammation. Fluticasone inhaled is a pure ICS, whereas albuterol is rescue and the others do not fill the same anti-inflammatory controller role.",
            objective: .mixedReview,
            relatedDrugIds: ["d114", "d120"],
            tags: ["Mastery", "7a", "step-up therapy", "controller"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_006",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient with COPD needs a once-daily maintenance bronchodilator and keeps trying to use it like a rescue inhaler. Which drug is a long-acting muscarinic antagonist used for maintenance, not sudden symptom relief?",
            options: ["Tiotropium", "Albuterol", "Diphenhydramine", "Montelukast", "Theophylline"],
            answer: "Tiotropium",
            explanation: "Tiotropium is a long-acting muscarinic antagonist used for maintenance treatment, especially in COPD. It is not a rescue inhaler for acute bronchospasm.",
            objective: .classId,
            relatedDrugIds: ["d123"],
            tags: ["Mastery", "7a", "LAMA", "maintenance"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_007",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "Spiriva is a once-daily LAMA often used as a COPD maintenance cornerstone and sometimes as an add-on in asthma. What is the generic name of Spiriva?",
            options: ["Tiotropium", "Ipratropium", "Albuterol", "Levalbuterol", "Salmeterol"],
            answer: "Tiotropium",
            explanation: "Spiriva is the brand name for tiotropium. Remembering Spiriva = tiotropium helps students quickly identify a long-acting anticholinergic maintenance inhaler.",
            objective: .brandGeneric,
            relatedDrugIds: ["d123"],
            tags: ["Mastery", "7a", "Spiriva", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_008",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Atrovent HFA teaches an important COPD pearl: it is an inhaled anticholinergic used for maintenance treatment of bronchospasm associated with COPD, not the first choice when a patient needs rapid rescue in an acute attack. What is the generic name of Atrovent?",
            options: ["Ipratropium", "Tiotropium", "Albuterol", "Salmeterol", "Montelukast"],
            answer: "Ipratropium",
            explanation: "Atrovent is ipratropium, a short-acting anticholinergic. It is more of a maintenance/adjunct bronchodilator in COPD teaching than the classic first-line rapid-rescue inhaler role filled by albuterol.",
            objective: .brandGeneric,
            relatedDrugIds: ["d122"],
            tags: ["Mastery", "7a", "Atrovent", "SAMA"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_009",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient using an inhaled anticholinergic complains of dry mouth and urinary retention. Which medication from this module best fits that adverse-effect pattern?",
            options: ["Ipratropium", "Albuterol", "Montelukast", "Salmeterol", "Budesonide (inhaled)"],
            answer: "Ipratropium",
            explanation: "Ipratropium is an anticholinergic bronchodilator, so dry mouth and urinary retention fit its mechanism. The other options have different adverse-effect patterns.",
            objective: .adverseEffect,
            relatedDrugIds: ["d122"],
            tags: ["Mastery", "7a", "dry mouth", "urinary retention"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_010",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Anoro Ellipta teaches COPD logic because it combines a LAMA with a LABA for maintenance, but it is not indicated for asthma. What is the generic name of Anoro Ellipta?",
            options: ["Umeclidinium/Vilanterol", "Budesonide/Formoterol", "Fluticasone/Salmeterol", "Mometasone/Formoterol", "Tiotropium"],
            answer: "Umeclidinium/Vilanterol",
            explanation: "Anoro Ellipta is umeclidinium/vilanterol, a LAMA/LABA combination for COPD maintenance. Because it contains a LABA without an ICS, it is not used as an asthma treatment.",
            objective: .brandGeneric,
            relatedDrugIds: ["d124"],
            tags: ["Mastery", "7a", "Anoro", "LAMA/LABA", "COPD"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_011",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "Symbicort is an ICS/LABA combination often used when asthma control needs more than ICS alone. Which generic combination corresponds to Symbicort?",
            options: ["Budesonide/Formoterol", "Fluticasone/Salmeterol", "Mometasone/Formoterol", "Umeclidinium/Vilanterol", "Fluticasone (inhaled)"],
            answer: "Budesonide/Formoterol",
            explanation: "Symbicort is the brand name for budesonide/formoterol. It is an ICS/LABA combination rather than a pure rescue inhaler.",
            objective: .brandGeneric,
            relatedDrugIds: ["d117"],
            tags: ["Mastery", "7a", "Symbicort", "ICS/LABA"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_012",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "Advair is another high-yield ICS/LABA inhaler. Which generic ingredients make up Advair?",
            options: ["Fluticasone/Salmeterol", "Budesonide/Formoterol", "Mometasone/Formoterol", "Umeclidinium/Vilanterol", "Fluticasone (inhaled)"],
            answer: "Fluticasone/Salmeterol",
            explanation: "Advair is fluticasone/salmeterol. It teaches the classic inhaled steroid plus LABA pairing used for maintenance rather than quick relief.",
            objective: .brandGeneric,
            relatedDrugIds: ["d116"],
            tags: ["Mastery", "7a", "Advair", "ICS/LABA"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_013",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A learner remembers that LABAs help with maintenance but should not be used alone in asthma because monotherapy increases serious asthma-related risk. Which option is the single-agent LABA from this module that teaches that rule?",
            options: ["Salmeterol", "Fluticasone (inhaled)", "Tiotropium", "Montelukast", "Theophylline"],
            answer: "Salmeterol",
            explanation: "Salmeterol is a single-agent LABA. The key high-yield pearl is that LABA monotherapy should not be used in asthma without an inhaled corticosteroid.",
            objective: .contraindication,
            relatedDrugIds: ["d118"],
            tags: ["Mastery", "7a", "LABA monotherapy", "asthma warning"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_014",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Which inhaler below is a pure inhaled corticosteroid controller rather than a LABA or an ICS/LABA combination?",
            options: ["Fluticasone (inhaled)", "Salmeterol", "Budesonide/Formoterol", "Umeclidinium/Vilanterol", "Albuterol"],
            answer: "Fluticasone (inhaled)",
            explanation: "Fluticasone inhaled is a pure ICS controller. The other choices are a LABA alone, combination inhalers, or a rescue SABA.",
            objective: .classId,
            relatedDrugIds: ["d114"],
            tags: ["Mastery", "7a", "ICS", "controller"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_015",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "A patient develops hoarseness and oral thrush after starting an inhaled steroid. Which counseling point best teaches how to lower that risk with fluticasone or budesonide inhalers?",
            options: ["Rinse the mouth after each use", "Use it only during an acute attack", "Take it with fruit juice", "Use it before bed and lie flat", "Combine it with diphenhydramine"],
            answer: "Rinse the mouth after each use",
            explanation: "Rinsing the mouth after inhaled corticosteroid use helps lower the risk of local candidiasis and dysphonia. It is one of the most important counseling pearls for ICS inhalers.",
            objective: .pearl,
            relatedDrugIds: ["d114", "d115"],
            tags: ["Mastery", "7a", "oral thrush", "rinse mouth"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_016",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "Pulmicort is commonly taught as an inhaled corticosteroid maintenance medication, and its nebulized form is useful in younger children. What is the generic name of Pulmicort?",
            options: ["Budesonide (inhaled)", "Fluticasone (inhaled)", "Budesonide/Formoterol", "Mometasone/Formoterol", "Montelukast"],
            answer: "Budesonide (inhaled)",
            explanation: "Pulmicort is the brand name for inhaled budesonide. It is an ICS controller rather than a quick-relief bronchodilator.",
            objective: .brandGeneric,
            relatedDrugIds: ["d115"],
            tags: ["Mastery", "7a", "Pulmicort", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_017",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient with persistent asthma is still symptomatic on an ICS alone. Stepwise logic often moves next to an ICS/LABA inhaler. Which option is an example of that kind of step-up inhaler?",
            options: ["Symbicort", "Spiriva", "Singulair", "Sudafed", "Benadryl"],
            answer: "Symbicort",
            explanation: "Symbicort is an ICS/LABA inhaler, so it fits a common step-up pattern when an ICS alone is not enough. The distractors represent different classes or non-controller allergy medications.",
            objective: .mixedReview,
            relatedDrugIds: ["d117", "d114"],
            tags: ["Mastery", "7a", "stepwise logic", "ICS/LABA"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_018",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Dulera is an asthma maintenance inhaler that pairs an inhaled corticosteroid with formoterol. What is the generic combination in Dulera?",
            options: ["Mometasone/Formoterol", "Budesonide/Formoterol", "Fluticasone/Salmeterol", "Umeclidinium/Vilanterol", "Fluticasone (inhaled)"],
            answer: "Mometasone/Formoterol",
            explanation: "Dulera is mometasone/formoterol. It is another way to test whether the learner can separate pure ICS inhalers from ICS/LABA combinations.",
            objective: .brandGeneric,
            relatedDrugIds: ["d119"],
            tags: ["Mastery", "7a", "Dulera", "combination inhaler"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_019",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Montelukast is easy to remember because it is oral and can help both asthma and allergic rhinitis, but it carries a high-yield boxed warning. Which warning is most important?",
            options: ["Serious neuropsychiatric events", "Tendon rupture", "Agranulocytosis", "Ototoxicity", "Anaphylaxis after first inhalation"],
            answer: "Serious neuropsychiatric events",
            explanation: "Montelukast carries a boxed warning for serious neuropsychiatric events, including mood and behavior changes and suicidal thinking. That warning is one of the most tested facts about this drug.",
            objective: .adverseEffect,
            relatedDrugIds: ["d125"],
            tags: ["Mastery", "7a", "boxed warning", "neuropsychiatric"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_020",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "Which drug is an oral leukotriene receptor antagonist often taken in the evening and used as a non-inhaled controller option for asthma and allergic rhinitis?",
            options: ["Montelukast", "Albuterol", "Omalizumab", "Theophylline", "Tiotropium"],
            answer: "Montelukast",
            explanation: "Montelukast is an oral leukotriene receptor antagonist. It is a useful review contrast with inhaled controllers and with biologics.",
            objective: .classId,
            relatedDrugIds: ["d125"],
            tags: ["Mastery", "7a", "LTRA", "oral controller"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_021",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient with moderate-to-severe allergic asthma is starting a biologic that binds free IgE, but the clinic reminds them it must be started where anaphylaxis can be managed. Which drug is this?",
            options: ["Omalizumab", "Dupilumab", "Montelukast", "Roflumilast", "Theophylline"],
            answer: "Omalizumab",
            explanation: "Omalizumab is the anti-IgE biologic used for allergic asthma and some patients with chronic urticaria. The major high-yield warning is anaphylaxis, so initiation and observation matter.",
            objective: .moa,
            relatedDrugIds: ["d126"],
            tags: ["Mastery", "7a", "anti-IgE", "anaphylaxis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_022",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "Dupixent teaches a different biologic target than Xolair. Which mechanism best describes dupilumab?",
            options: ["Blocks IL-4 and IL-13 signaling", "Binds free IgE", "Blocks leukotriene receptors", "Inhibits PDE-4", "Stimulates beta2 receptors"],
            answer: "Blocks IL-4 and IL-13 signaling",
            explanation: "Dupilumab is an interleukin-4 receptor alpha antagonist, which blocks IL-4 and IL-13 signaling. That is why it is taught separately from anti-IgE therapy such as omalizumab.",
            objective: .moa,
            relatedDrugIds: ["d127"],
            tags: ["Mastery", "7a", "IL-4", "IL-13", "biologic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_023",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient with severe COPD, chronic bronchitis, and repeated exacerbations despite inhalers may be considered for an oral PDE-4 inhibitor. Which drug fits that niche?",
            options: ["Roflumilast", "Albuterol", "Montelukast", "Fluticasone (nasal)", "Fexofenadine"],
            answer: "Roflumilast",
            explanation: "Roflumilast is the oral PDE-4 inhibitor used to reduce COPD exacerbations in selected patients with severe COPD associated with chronic bronchitis and a history of exacerbations.",
            objective: .indication,
            relatedDrugIds: ["d128"],
            tags: ["Mastery", "7a", "PDE-4 inhibitor", "COPD exacerbations"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_024",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Daliresp is not a rescue bronchodilator. It is roflumilast, and the counseling pearl students should remember is that it can cause weight loss and psychiatric symptoms. Which generic drug matches Daliresp?",
            options: ["Roflumilast", "Montelukast", "Theophylline", "Tiotropium", "Salmeterol"],
            answer: "Roflumilast",
            explanation: "Daliresp is the brand name for roflumilast. It is an oral controller-type COPD medication, not a rapid bronchodilator, and adverse-effect counseling often includes weight loss and psychiatric symptoms.",
            objective: .brandGeneric,
            relatedDrugIds: ["d128"],
            tags: ["Mastery", "7a", "Daliresp", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_025",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "Theo-24 is rarely used now because it has a narrow therapeutic index. What is the key monitoring pearl for theophylline?",
            options: ["Monitor serum theophylline concentrations", "Monitor INR weekly", "Monitor ANC", "Monitor TSH", "Monitor uric acid goal"],
            answer: "Monitor serum theophylline concentrations",
            explanation: "Theophylline requires serum concentration monitoring because its therapeutic window is narrow. That is a major reason it is used far less often than modern inhaled therapies.",
            objective: .monitoring,
            relatedDrugIds: ["d129"],
            tags: ["Mastery", "7a", "Theo-24", "drug levels"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_026",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient on theophylline develops nausea, tachycardia, and a seizure after a drug interaction. Those findings fit which high-yield risk of theophylline?",
            options: ["Toxicity from a narrow therapeutic index", "Oral thrush from local steroid effect", "Rebound congestion", "Asthma-related death from LABA monotherapy", "Red man syndrome"],
            answer: "Toxicity from a narrow therapeutic index",
            explanation: "Theophylline toxicity can present with gastrointestinal symptoms, tachyarrhythmias, and seizures. That pattern reflects its narrow therapeutic index and interaction sensitivity.",
            objective: .adverseEffect,
            relatedDrugIds: ["d129"],
            tags: ["Mastery", "7a", "toxicity", "seizures"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_027",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient with allergic rhinitis says congestion is the main problem. Which class is usually the strongest daily anti-inflammatory option rather than just an oral symptom reliever?",
            options: ["Intranasal corticosteroids", "First-generation antihistamines", "Oral decongestants", "Methylxanthines", "LABAs"],
            answer: "Intranasal corticosteroids",
            explanation: "Intranasal corticosteroids directly treat nasal inflammation and are the key daily controller-style therapy for congestion-dominant allergic rhinitis. Oral antihistamines and decongestants are not the same anti-inflammatory backbone.",
            objective: .classId,
            relatedDrugIds: ["d249", "d253"],
            tags: ["Mastery", "7a", "allergic rhinitis", "nasal steroids"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_028",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Flonase is used for allergic rhinitis, but patients should not expect instant relief after one spray because regular use over several days may be needed. What is the generic name of Flonase?",
            options: ["Fluticasone (nasal)", "Mometasone (nasal)", "Azelastine (nasal)", "Loratadine", "Pseudoephedrine"],
            answer: "Fluticasone (nasal)",
            explanation: "Flonase is fluticasone nasal. It teaches both an important brand-generic pair and the pearl that nasal steroids work best with regular use rather than one-time dosing.",
            objective: .brandGeneric,
            relatedDrugIds: ["d249"],
            tags: ["Mastery", "7a", "Flonase", "regular use"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_029",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Nasonex is an intranasal corticosteroid used for allergic rhinitis and often taught alongside nasal polyps. What is the generic name of Nasonex?",
            options: ["Mometasone (nasal)", "Fluticasone (nasal)", "Azelastine (nasal)", "Fexofenadine", "Cetirizine"],
            answer: "Mometasone (nasal)",
            explanation: "Nasonex is the brand name for mometasone nasal. Students should remember both allergic rhinitis and nasal polyps as common teaching points.",
            objective: .brandGeneric,
            relatedDrugIds: ["d253"],
            tags: ["Mastery", "7a", "Nasonex", "nasal polyps"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_030",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient complains that a nasal allergy spray leaves a bitter taste in the mouth. Which drug is the classic teaching example, and what pearl can reduce that taste?",
            options: ["Azelastine (nasal)", "Montelukast", "Fluticasone (nasal)", "Pseudoephedrine", "Tiotropium"],
            answer: "Azelastine (nasal)",
            explanation: "Azelastine nasal spray is classically associated with a bitter taste. Counseling often includes keeping the head tilted slightly downward during spraying to reduce that problem.",
            objective: .adverseEffect,
            relatedDrugIds: ["d245"],
            tags: ["Mastery", "7a", "bitter taste", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_031",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Allegra is often the least sedating of the common second-generation antihistamines, but it has an interaction pearl many students miss. Which counseling point is correct?",
            options: ["Avoid taking it with fruit juice", "Rinse the mouth after each dose", "Use it only at bedtime because it is very sedating", "Avoid all dairy for 24 hours", "It must be started in clinic because of anaphylaxis risk"],
            answer: "Avoid taking it with fruit juice",
            explanation: "Fexofenadine should not be taken with fruit juice because juice can reduce its absorption. That is one of the highest-yield counseling pearls for Allegra.",
            objective: .interaction,
            relatedDrugIds: ["d248"],
            tags: ["Mastery", "7a", "Allegra", "fruit juice"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_032",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Xyzal is often remembered as the active enantiomer of cetirizine. What is the generic name of Xyzal?",
            options: ["Levocetirizine", "Cetirizine", "Loratadine", "Fexofenadine", "Diphenhydramine"],
            answer: "Levocetirizine",
            explanation: "Xyzal is the brand name for levocetirizine. Pairing it with cetirizine helps students remember the enantiomer relationship and the second-generation antihistamine bucket.",
            objective: .brandGeneric,
            relatedDrugIds: ["d250", "d246"],
            tags: ["Mastery", "7a", "Xyzal", "enantiomer"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_033",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "An older adult wants something for allergy symptoms and sleep, but you want to avoid heavy sedation and anticholinergic burden. Which medication from this module is the classic agent to avoid?",
            options: ["Diphenhydramine", "Fexofenadine", "Loratadine", "Mometasone (nasal)", "Fluticasone (nasal)"],
            answer: "Diphenhydramine",
            explanation: "Diphenhydramine is a first-generation antihistamine with strong sedating and anticholinergic effects. That makes it a classic medication to avoid or use cautiously in older adults.",
            objective: .contraindication,
            relatedDrugIds: ["d247"],
            tags: ["Mastery", "7a", "Benadryl", "elderly"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_034",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "Zyrtec is a second-generation antihistamine, but it is not perfectly non-sedating. What is the generic name of Zyrtec?",
            options: ["Cetirizine", "Levocetirizine", "Fexofenadine", "Loratadine", "Diphenhydramine"],
            answer: "Cetirizine",
            explanation: "Zyrtec is the brand name for cetirizine. It is a second-generation antihistamine, but mild drowsiness can still occur in some patients.",
            objective: .brandGeneric,
            relatedDrugIds: ["d246"],
            tags: ["Mastery", "7a", "Zyrtec", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_035",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Claritin-D is popular when allergic rhinitis comes with congestion because it combines a non-sedating antihistamine with a decongestant kept behind the counter. What is the generic combination in Claritin-D?",
            options: ["Loratadine/Pseudoephedrine", "Cetirizine/Pseudoephedrine", "Fexofenadine/Pseudoephedrine", "Loratadine/Montelukast", "Diphenhydramine/Pseudoephedrine"],
            answer: "Loratadine/Pseudoephedrine",
            explanation: "Claritin-D is loratadine/pseudoephedrine. The pseudoephedrine piece explains why it is used when congestion is prominent and why behind-the-counter rules apply.",
            objective: .brandGeneric,
            relatedDrugIds: ["d252"],
            tags: ["Mastery", "7a", "Claritin-D", "decongestant"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_036",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "Pseudoephedrine can be useful for congestion, but it is the wrong choice for some patients. Which counseling warning is most high yield?",
            options: ["It can worsen insomnia, tachycardia, and hypertension", "It is the best choice in uncontrolled hypertension", "It commonly causes oral thrush", "It must always be paired with an ICS in asthma", "It is a biologic that requires clinic observation"],
            answer: "It can worsen insomnia, tachycardia, and hypertension",
            explanation: "Pseudoephedrine is a sympathomimetic decongestant, so insomnia, tachycardia, and elevated blood pressure are classic concerns. It is also avoided with MAOIs and used cautiously in patients with hypertension.",
            objective: .contraindication,
            relatedDrugIds: ["d254"],
            tags: ["Mastery", "7a", "Sudafed", "hypertension", "insomnia"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_037",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "Claritin is a popular OTC second-generation antihistamine marketed as non-drowsy when taken as directed. What is the generic name of Claritin?",
            options: ["Loratadine", "Fexofenadine", "Cetirizine", "Levocetirizine", "Diphenhydramine"],
            answer: "Loratadine",
            explanation: "Claritin is loratadine. This is one of the most recognizable brand-generic pairs in the allergy section.",
            objective: .brandGeneric,
            relatedDrugIds: ["d251"],
            tags: ["Mastery", "7a", "Claritin", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_038",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient says, “My nose is always stuffed up, and the oral antihistamine is not cutting it.” In allergic rhinitis, which option is the better congestion-focused daily controller to teach first?",
            options: ["Fluticasone (nasal)", "Diphenhydramine", "Fexofenadine", "Pseudoephedrine", "Theophylline"],
            answer: "Fluticasone (nasal)",
            explanation: "Fluticasone nasal is an intranasal corticosteroid, which directly treats nasal inflammation and congestion better than simply adding a sedating antihistamine or repeatedly relying on a decongestant.",
            objective: .indication,
            relatedDrugIds: ["d249"],
            tags: ["Mastery", "7a", "congestion", "first-line"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_039",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .easy,
            question: "A patient wakes up wheezing and grabs Flovent HFA for immediate relief. What is the best correction?",
            options: ["Flovent is maintenance, not rescue; use a quick-relief inhaler such as albuterol for sudden bronchospasm", "Flovent works faster than albuterol and should be doubled during attacks", "Flovent should be swallowed for faster effect", "Flovent should be replaced with diphenhydramine for nighttime wheeze", "Flovent should only be used once monthly"],
            answer: "Flovent is maintenance, not rescue; use a quick-relief inhaler such as albuterol for sudden bronchospasm",
            explanation: "Fluticasone inhaled is a controller medication, not a rescue inhaler. For acute symptoms, the high-yield correction is to use a rapid bronchodilator such as albuterol.",
            objective: .pearl,
            relatedDrugIds: ["d114", "d120"],
            tags: ["Mastery", "7a", "rescue vs controller", "Flovent"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_040",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient with allergic asthma also has chronic spontaneous urticaria that remains active despite antihistamines. Which biologic from this module is most aligned with both problems?",
            options: ["Omalizumab", "Dupilumab", "Theophylline", "Pseudoephedrine", "Tiotropium"],
            answer: "Omalizumab",
            explanation: "Omalizumab is used for allergic asthma and also for chronic spontaneous urticaria in appropriate patients. That overlap makes it a classic mastery-level selection question.",
            objective: .indication,
            relatedDrugIds: ["d126"],
            tags: ["Mastery", "7a", "urticaria", "allergic asthma"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_041",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "A patient with moderate-to-severe asthma also has atopic dermatitis and nasal polyps. Which drug from this module best teaches how one biologic can overlap these conditions?",
            options: ["Dupilumab", "Omalizumab", "Montelukast", "Ipratropium", "Fexofenadine"],
            answer: "Dupilumab",
            explanation: "Dupilumab is an add-on maintenance biologic for selected asthma patients and is also used in atopic dermatitis and nasal polyps. That multi-indication overlap is one of its most useful teaching pearls.",
            objective: .indication,
            relatedDrugIds: ["d127"],
            tags: ["Mastery", "7a", "eczema", "nasal polyps"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_042",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Which prior drug from your cardiovascular module is the clearest example of a nonselective beta blocker that can worsen bronchospasm in asthma?",
            options: ["Propranolol", "Metoprolol succinate", "Lisinopril", "Losartan", "Amlodipine"],
            answer: "Propranolol",
            explanation: "Propranolol is a nonselective beta blocker that blocks beta2 receptors in the lungs and can worsen bronchospasm. It is the classic cross-module medication to avoid in asthma.",
            objective: .contraindication,
            relatedDrugIds: ["d18"],
            tags: ["Mastery", "7a", "crossover", "beta blocker"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_043",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "A patient with hypertension and chronic cough thinks their “asthma is worse,” but the cough is dry and began after a new RAAS drug. Which prior medication is the best clue?",
            options: ["Lisinopril", "Losartan", "Hydrochlorothiazide", "Amlodipine", "Aspirin"],
            answer: "Lisinopril",
            explanation: "Lisinopril can cause a dry cough because of bradykinin accumulation. That cough can be confused with respiratory disease if the medication history is missed.",
            objective: .adverseEffect,
            relatedDrugIds: ["d1"],
            tags: ["Mastery", "7a", "crossover", "ACE inhibitor cough"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_044",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .medium,
            question: "Which prior endocrine/rheum drug is commonly used as a short systemic steroid burst for an asthma exacerbation, in contrast to daily inhaled controllers like fluticasone or budesonide?",
            options: ["Prednisone", "Levothyroxine", "Metformin", "Spironolactone", "Warfarin"],
            answer: "Prednisone",
            explanation: "Prednisone is a systemic corticosteroid often used short-term for asthma exacerbations. It is different from inhaled corticosteroids, which are used for longer-term controller therapy.",
            objective: .indication,
            relatedDrugIds: ["d163"],
            tags: ["Mastery", "7a", "crossover", "exacerbation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7a_add_045",
            subsectionId: DrugDataService.asthmaCopdOverviewSubsectionId,
            difficulty: .hard,
            question: "If a learner mixes up Atrovent and Spiriva, which pairing best restores the core distinction?",
            options: ["Ipratropium = short-acting anticholinergic; Tiotropium = long-acting anticholinergic", "Ipratropium = inhaled corticosteroid; Tiotropium = leukotriene antagonist", "Ipratropium = LABA; Tiotropium = SABA", "Ipratropium = anti-IgE biologic; Tiotropium = anti-IL-4/IL-13 biologic", "Ipratropium = oral decongestant; Tiotropium = intranasal steroid"],
            answer: "Ipratropium = short-acting anticholinergic; Tiotropium = long-acting anticholinergic",
            explanation: "Atrovent is ipratropium, a short-acting muscarinic antagonist, while Spiriva is tiotropium, a long-acting muscarinic antagonist. That short-acting versus long-acting distinction is high yield in COPD and asthma maintenance logic.",
            objective: .classId,
            relatedDrugIds: ["d122", "d123"],
            tags: ["Mastery", "7a", "Atrovent", "Spiriva", "SAMA vs LAMA"],
            source: .curated
        ),
    ]
}
