// PharmaLingo — Mastering Respiratory & Allergy
// Curated Add-On Question Pack (45 questions)
// IDs: q7f_add_001 ... q7f_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 7f is a review-only mastery subsection in the outline and current repo.
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
//        if sub.id == Self.masteringRespiratoryAllergySubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_7fMastery)
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
    /// Target subsection for the Module 7 mastery quiz.
    static let masteringRespiratoryAllergySubsectionId: String = "7f"

    static let curatedAddOnQuestions_7fMastery: [Question] = [

        .multipleChoice(
            id: "q7f_add_001",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "A student with asthma develops sudden wheezing while walking across campus. This is a quick-relief problem, not a controller problem. Which medication from Module 7 is the best first choice for rapid symptom relief?",
            options: ["Albuterol", "Budesonide (inhaled)", "Tiotropium", "Montelukast", "Roflumilast"],
            answer: "Albuterol",
            explanation: "Albuterol is the classic rescue inhaler because it is a short-acting beta2 agonist that works within minutes for acute bronchospasm.",
            objective: .indication,
            relatedDrugIds: ["d120"],
            tags: ["Mastery", "7f", "rescue", "acute bronchospasm"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_002",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A runner with exercise-induced bronchospasm wants to prevent symptoms before a 5K. Which drug from this module is classically used shortly before exercise for that purpose?",
            options: ["Albuterol", "Tiotropium", "Fluticasone (inhaled)", "Omalizumab", "Pseudoephedrine"],
            answer: "Albuterol",
            explanation: "Albuterol is the high-yield pre-exercise option for exercise-induced bronchospasm because it provides rapid bronchodilation when used before activity.",
            objective: .dosing,
            relatedDrugIds: ["d120"],
            tags: ["Mastery", "7f", "exercise-induced bronchospasm", "pre-exercise"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_003",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Xopenex is often taught next to albuterol because it is the R-enantiomer version of a rescue bronchodilator. What is the generic name of Xopenex?",
            options: ["Levalbuterol", "Albuterol", "Salmeterol", "Ipratropium", "Tiotropium"],
            answer: "Levalbuterol",
            explanation: "Xopenex is levalbuterol, the R-enantiomer rescue bronchodilator that students commonly compare with albuterol.",
            objective: .brandGeneric,
            relatedDrugIds: ["d121"],
            tags: ["Mastery", "7f", "Xopenex", "R-enantiomer"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_004",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A hospitalized patient with a COPD flare receives a DuoNeb-style treatment that pairs a short-acting muscarinic antagonist with albuterol. Which anticholinergic drug fits that role?",
            options: ["Ipratropium", "Tiotropium", "Umeclidinium/Vilanterol", "Montelukast", "Salmeterol"],
            answer: "Ipratropium",
            explanation: "Ipratropium is the short-acting inhaled anticholinergic commonly paired with albuterol for acute bronchodilator treatment, especially in COPD exacerbations.",
            objective: .pearl,
            relatedDrugIds: ["d122", "d120"],
            tags: ["Mastery", "7f", "DuoNeb", "ipratropium", "acute COPD"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_005",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient keeps reaching for Spiriva when they suddenly feel short of breath. Which description best teaches why that is the wrong role for this medication?",
            options: ["It is a once-daily LAMA maintenance inhaler, not a rescue inhaler", "It is a nasal steroid for allergic rhinitis", "It is a leukotriene blocker taken at bedtime", "It is a short-acting beta2 agonist", "It is an anti-IgE biologic used by injection"],
            answer: "It is a once-daily LAMA maintenance inhaler, not a rescue inhaler",
            explanation: "Tiotropium (Spiriva) is a long-acting muscarinic antagonist used for maintenance bronchodilation, not for immediate relief of acute bronchospasm.",
            objective: .classId,
            relatedDrugIds: ["d123"],
            tags: ["Mastery", "7f", "Spiriva", "LAMA", "maintenance"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_006",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Anoro Ellipta is the dual bronchodilator students should associate with COPD maintenance and no inhaled steroid. What is the generic name of Anoro Ellipta?",
            options: ["Umeclidinium/Vilanterol", "Fluticasone/Salmeterol", "Budesonide/Formoterol", "Tiotropium", "Ipratropium"],
            answer: "Umeclidinium/Vilanterol",
            explanation: "Anoro Ellipta is umeclidinium/vilanterol, a LAMA/LABA combination used for COPD maintenance without an inhaled corticosteroid component.",
            objective: .brandGeneric,
            relatedDrugIds: ["d124"],
            tags: ["Mastery", "7f", "Anoro", "LAMA/LABA", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_007",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "Which inhaler would be a poor choice for a patient with asthma who needs anti-inflammatory control because it provides bronchodilation without any inhaled corticosteroid and is meant for COPD maintenance?",
            options: ["Umeclidinium/Vilanterol", "Budesonide/Formoterol", "Fluticasone/Salmeterol", "Mometasone/Formoterol", "Budesonide (inhaled)"],
            answer: "Umeclidinium/Vilanterol",
            explanation: "Umeclidinium/vilanterol is a COPD LAMA/LABA inhaler without an inhaled steroid, so it does not fill the controller role that asthma usually requires.",
            objective: .contraindication,
            relatedDrugIds: ["d124", "d118", "d117", "d116", "d119"],
            tags: ["Mastery", "7f", "asthma vs COPD", "Anoro", "controller logic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_008",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient is using albuterol more and more often each week. That pattern teaches that airway inflammation is not adequately controlled. Which option below is a steroid-only inhaler that would better fit a controller role?",
            options: ["Fluticasone (inhaled)", "Albuterol", "Pseudoephedrine", "Diphenhydramine", "Tiotropium"],
            answer: "Fluticasone (inhaled)",
            explanation: "Inhaled fluticasone is a controller corticosteroid that treats airway inflammation, whereas albuterol is only for quick relief.",
            objective: .mixedReview,
            relatedDrugIds: ["d114", "d120"],
            tags: ["Mastery", "7f", "step-up", "controller", "ICS"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_009",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A child uses Pulmicort every day for asthma control and then develops hoarseness and oral thrush because the mouth is not being rinsed after use. Which generic drug is Pulmicort?",
            options: ["Budesonide (inhaled)", "Fluticasone (inhaled)", "Salmeterol", "Montelukast", "Levalbuterol"],
            answer: "Budesonide (inhaled)",
            explanation: "Pulmicort is inhaled budesonide, an inhaled corticosteroid whose local steroid effects can cause thrush and dysphonia if mouth rinsing is skipped.",
            objective: .adverseEffect,
            relatedDrugIds: ["d115"],
            tags: ["Mastery", "7f", "Pulmicort", "thrush", "rinse mouth"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_010",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Symbicort is a classic asthma/COPD controller combo and a high-yield inhaler for learning steroid + formoterol pairings. What is the generic name of Symbicort?",
            options: ["Budesonide/Formoterol", "Fluticasone/Salmeterol", "Mometasone/Formoterol", "Umeclidinium/Vilanterol", "Budesonide (inhaled)"],
            answer: "Budesonide/Formoterol",
            explanation: "Symbicort is budesonide/formoterol, an ICS/LABA combination inhaler used for maintenance control.",
            objective: .brandGeneric,
            relatedDrugIds: ["d117"],
            tags: ["Mastery", "7f", "Symbicort", "ICS/LABA", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_011",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "Advair teaches two important facts at once: it is an ICS/LABA controller, and its LABA component is the same drug marketed alone as Serevent. Which LABA is shared by Advair and Serevent?",
            options: ["Salmeterol", "Formoterol", "Albuterol", "Vilanterol", "Tiotropium"],
            answer: "Salmeterol",
            explanation: "Advair contains fluticasone plus salmeterol, and Serevent is the brand name for salmeterol alone.",
            objective: .genericBrand,
            relatedDrugIds: ["d116", "d118"],
            tags: ["Mastery", "7f", "Advair", "Serevent", "salmeterol"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_012",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "A patient with asthma wants to stop their inhaled steroid and continue only Serevent because it seems simpler. Which teaching point is most important?",
            options: ["Salmeterol should not be used alone in asthma because LABA monotherapy increases serious asthma risk", "Salmeterol is the best rescue drug for sudden wheeze", "Salmeterol works by blocking leukotrienes", "Salmeterol is mainly used for nasal congestion", "Salmeterol must be swallowed rather than inhaled"],
            answer: "Salmeterol should not be used alone in asthma because LABA monotherapy increases serious asthma risk",
            explanation: "Salmeterol is a LABA, and LABA monotherapy is unsafe in asthma because it does not address airway inflammation and is associated with serious asthma-related risk.",
            objective: .contraindication,
            relatedDrugIds: ["d118"],
            tags: ["Mastery", "7f", "LABA monotherapy", "asthma warning", "Serevent"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_013",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Dulera is an asthma controller inhaler that combines a corticosteroid with formoterol. What is the generic name of Dulera?",
            options: ["Mometasone/Formoterol", "Budesonide/Formoterol", "Fluticasone/Salmeterol", "Umeclidinium/Vilanterol", "Fluticasone (inhaled)"],
            answer: "Mometasone/Formoterol",
            explanation: "Dulera is mometasone/formoterol, an ICS/LABA combination inhaler used for asthma maintenance.",
            objective: .brandGeneric,
            relatedDrugIds: ["d119"],
            tags: ["Mastery", "7f", "Dulera", "ICS/LABA", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_014",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient in the middle of an asthma attack reaches for Advair instead of their rescue inhaler. Which counseling point is best?",
            options: ["Advair is a controller and is not the right inhaler for immediate symptom relief", "Advair is interchangeable with albuterol for rescue use", "Advair is a decongestant for nasal congestion", "Advair is an oral leukotriene antagonist", "Advair is mainly used for hives"],
            answer: "Advair is a controller and is not the right inhaler for immediate symptom relief",
            explanation: "Advair is an ICS/LABA controller inhaler. It helps long-term control but is not the classic go-to product for immediate rescue relief like albuterol.",
            objective: .pearl,
            relatedDrugIds: ["d116"],
            tags: ["Mastery", "7f", "Advair", "not rescue", "controller"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_015",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "A patient wants an oral asthma controller taken at bedtime, but you also want them to remember the boxed warning about mood and behavior changes. Which drug best fits that description?",
            options: ["Montelukast", "Roflumilast", "Theophylline", "Pseudoephedrine", "Cetirizine"],
            answer: "Montelukast",
            explanation: "Montelukast is the oral leukotriene receptor antagonist often taken in the evening and is high yield because of its boxed warning for serious neuropsychiatric events.",
            objective: .adverseEffect,
            relatedDrugIds: ["d125"],
            tags: ["Mastery", "7f", "montelukast", "boxed warning", "bedtime"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_016",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "A patient with mild seasonal allergic rhinitis asks to start Singulair even though standard allergy options are available. Why is prescribers’ enthusiasm more limited than it used to be?",
            options: ["Montelukast carries a boxed warning for serious neuropsychiatric events", "Montelukast commonly causes nephrotoxicity requiring weekly creatinine checks", "Montelukast is contraindicated because it always causes bronchospasm", "Montelukast must be injected in a monitored setting", "Montelukast is a rescue bronchodilator that wears off in minutes"],
            answer: "Montelukast carries a boxed warning for serious neuropsychiatric events",
            explanation: "Because of the boxed warning for serious neuropsychiatric events, montelukast is usually not the first thing people reach for when safer standard allergic rhinitis options are adequate.",
            objective: .pearl,
            relatedDrugIds: ["d125"],
            tags: ["Mastery", "7f", "Singulair", "allergic rhinitis", "neuropsychiatric"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_017",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Xolair is the biologic students should associate with allergic asthma and a memorable anaphylaxis warning. What is the generic name of Xolair?",
            options: ["Omalizumab", "Dupilumab", "Montelukast", "Roflumilast", "Theophylline"],
            answer: "Omalizumab",
            explanation: "Xolair is omalizumab, the anti-IgE monoclonal antibody tied to allergic asthma and anaphylaxis counseling.",
            objective: .brandGeneric,
            relatedDrugIds: ["d126"],
            tags: ["Mastery", "7f", "Xolair", "brand-generic", "anaphylaxis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_018",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "A learner is trying to remember which asthma biologic is dosed using pretreatment IgE and body weight and is started with observation because of anaphylaxis risk. Which drug is it?",
            options: ["Omalizumab", "Dupilumab", "Montelukast", "Theophylline", "Tiotropium"],
            answer: "Omalizumab",
            explanation: "Omalizumab is the anti-IgE biologic whose dosing uses pretreatment IgE and body weight, and it is high yield for monitored administration because of anaphylaxis risk.",
            objective: .monitoring,
            relatedDrugIds: ["d126"],
            tags: ["Mastery", "7f", "omalizumab", "IgE", "observation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_019",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Dupixent is a biologic controller that often appears on both asthma and eczema medication lists. What is the generic name of Dupixent?",
            options: ["Dupilumab", "Omalizumab", "Montelukast", "Roflumilast", "Theophylline"],
            answer: "Dupilumab",
            explanation: "Dupixent is dupilumab, a biologic that blocks the IL-4/IL-13 pathway and is used across several type 2 inflammatory diseases.",
            objective: .brandGeneric,
            relatedDrugIds: ["d127"],
            tags: ["Mastery", "7f", "Dupixent", "brand-generic", "biologic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_020",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "A patient already taking Dupixent asks whether it can replace their rescue inhaler during an acute attack. What is the best response?",
            options: ["No; dupilumab is a maintenance biologic and should not be used for acute bronchospasm", "Yes; dupilumab is the fastest rescue drug in the module", "Yes; dupilumab works just like albuterol within minutes", "No; dupilumab is only used for bacterial pneumonia", "Yes; dupilumab is the nasal steroid used for epistaxis-prone rhinitis"],
            answer: "No; dupilumab is a maintenance biologic and should not be used for acute bronchospasm",
            explanation: "Dupilumab is a controller biologic for selected patients, not a rescue medication for sudden bronchospasm or status asthmaticus.",
            objective: .contraindication,
            relatedDrugIds: ["d127"],
            tags: ["Mastery", "7f", "dupilumab", "not rescue", "acute symptoms"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_021",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient with severe COPD and chronic bronchitis keeps having exacerbations despite inhaled bronchodilators. Which drug from this module is specifically used to reduce exacerbations rather than to provide immediate bronchodilation?",
            options: ["Roflumilast", "Albuterol", "Ipratropium", "Tiotropium", "Levalbuterol"],
            answer: "Roflumilast",
            explanation: "Roflumilast is the PDE-4 inhibitor used to reduce exacerbations in selected high-risk COPD patients, especially with chronic bronchitis. It is not a rescue bronchodilator.",
            objective: .indication,
            relatedDrugIds: ["d128"],
            tags: ["Mastery", "7f", "roflumilast", "COPD exacerbations", "chronic bronchitis"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_022",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "Which COPD controller should make you think of weight loss and psychiatric adverse effects in addition to the teaching point that it is not a bronchodilator?",
            options: ["Roflumilast", "Montelukast", "Albuterol", "Budesonide/Formoterol", "Pseudoephedrine"],
            answer: "Roflumilast",
            explanation: "Roflumilast is high yield for psychiatric symptoms and weight loss. It reduces COPD exacerbations but does not act as a rescue bronchodilator.",
            objective: .adverseEffect,
            relatedDrugIds: ["d128"],
            tags: ["Mastery", "7f", "roflumilast", "weight loss", "psychiatric"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_023",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Theo-24 is the older asthma/COPD controller that students remember because of serum drug levels and toxicity questions. What is the generic name of Theo-24?",
            options: ["Theophylline", "Roflumilast", "Montelukast", "Salmeterol", "Diphenhydramine"],
            answer: "Theophylline",
            explanation: "Theo-24 is the brand name for theophylline, the older methylxanthine with a narrow therapeutic index.",
            objective: .brandGeneric,
            relatedDrugIds: ["d129"],
            tags: ["Mastery", "7f", "Theo-24", "brand-generic", "methylxanthine"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_024",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "A patient taking theophylline is prescribed ciprofloxacin and later develops nausea, tremor, and palpitations. What high-yield principle does this scenario teach?",
            options: ["Theophylline has a narrow therapeutic index and important drug interactions that can raise toxicity risk", "Theophylline is a rescue inhaler and should be taken every few minutes during attacks", "Theophylline is a nasal steroid associated with epistaxis", "Theophylline is the anti-IgE biologic monitored for anaphylaxis", "Theophylline is a decongestant that should not be used in hypertension"],
            answer: "Theophylline has a narrow therapeutic index and important drug interactions that can raise toxicity risk",
            explanation: "Theophylline is infamous for a narrow therapeutic index and interaction-driven toxicity, so nausea, tremor, arrhythmias, and seizures are classic concerns when levels rise.",
            objective: .interaction,
            relatedDrugIds: ["d129"],
            tags: ["Mastery", "7f", "theophylline", "ciprofloxacin", "toxicity"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_025",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Astelin is a nasal spray students should associate with allergic rhinitis, bitter taste, and possible drowsiness. What is the generic name of Astelin?",
            options: ["Azelastine (nasal)", "Fluticasone (nasal)", "Mometasone (nasal)", "Cetirizine", "Diphenhydramine"],
            answer: "Azelastine (nasal)",
            explanation: "Astelin is azelastine nasal spray, an intranasal antihistamine used for allergic rhinitis.",
            objective: .brandGeneric,
            relatedDrugIds: ["d245"],
            tags: ["Mastery", "7f", "Astelin", "intranasal antihistamine", "bitter taste"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_026",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Benadryl is the classic first-generation antihistamine that treats allergy symptoms but also causes plenty of sedation and anticholinergic effects. What is the generic name of Benadryl?",
            options: ["Diphenhydramine", "Cetirizine", "Fexofenadine", "Loratadine", "Levocetirizine"],
            answer: "Diphenhydramine",
            explanation: "Benadryl is diphenhydramine, the prototypical first-generation antihistamine known for sedation and anticholinergic burden.",
            objective: .brandGeneric,
            relatedDrugIds: ["d247"],
            tags: ["Mastery", "7f", "Benadryl", "sedation", "first-gen"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_027",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient says they take Allegra every morning with orange juice because it seems healthy. Which counseling point is most accurate?",
            options: ["Fruit juices can reduce fexofenadine absorption, so water is the better choice", "Orange juice prevents drowsiness from fexofenadine and is recommended", "Fexofenadine must always be taken with food to work", "Fexofenadine should be paired with pseudoephedrine for safety", "Fruit juice is required to activate fexofenadine"],
            answer: "Fruit juices can reduce fexofenadine absorption, so water is the better choice",
            explanation: "Fexofenadine is high yield for the fruit-juice interaction. Apple, orange, and grapefruit juices can reduce absorption and make the antihistamine less effective.",
            objective: .interaction,
            relatedDrugIds: ["d248"],
            tags: ["Mastery", "7f", "fexofenadine", "fruit juice", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_028",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Flonase is the intranasal corticosteroid many students learn as a first-line option for allergic rhinitis with congestion. What is the generic name of Flonase?",
            options: ["Fluticasone (nasal)", "Mometasone (nasal)", "Azelastine (nasal)", "Loratadine", "Pseudoephedrine"],
            answer: "Fluticasone (nasal)",
            explanation: "Flonase is fluticasone nasal spray, an intranasal corticosteroid used for allergic rhinitis and nasal congestion.",
            objective: .brandGeneric,
            relatedDrugIds: ["d249"],
            tags: ["Mastery", "7f", "Flonase", "brand-generic", "nasal steroid"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_029",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Nasonex is another intranasal corticosteroid, and students often remember it because it also comes up in nasal-polyp conversations. What is the generic name of Nasonex?",
            options: ["Mometasone (nasal)", "Fluticasone (nasal)", "Azelastine (nasal)", "Cetirizine", "Loratadine"],
            answer: "Mometasone (nasal)",
            explanation: "Nasonex is mometasone nasal spray, an intranasal corticosteroid used for allergic rhinitis and also associated with nasal-polyp indications.",
            objective: .brandGeneric,
            relatedDrugIds: ["d253"],
            tags: ["Mastery", "7f", "Nasonex", "brand-generic", "nasal polyps"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_030",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "Xyzal is often taught as a close relative of Zyrtec. Which statement best explains that relationship?",
            options: ["Levocetirizine is the active enantiomer of cetirizine", "Cetirizine is the nasal-spray version of levocetirizine", "Levocetirizine is a decongestant added to cetirizine", "Cetirizine and levocetirizine are first-generation antihistamines", "Levocetirizine is an inhaled corticosteroid"],
            answer: "Levocetirizine is the active enantiomer of cetirizine",
            explanation: "Levocetirizine is the active enantiomer of cetirizine, which is why students often learn the two drugs together.",
            objective: .pearl,
            relatedDrugIds: ["d250", "d246"],
            tags: ["Mastery", "7f", "Xyzal", "cetirizine", "enantiomer"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_031",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Claritin-D is the allergy product that adds a decongestant to loratadine for patients whose rhinitis includes significant congestion. What is the generic name of Claritin-D?",
            options: ["Loratadine/Pseudoephedrine", "Loratadine", "Cetirizine/Pseudoephedrine", "Fexofenadine/Pseudoephedrine", "Diphenhydramine/Pseudoephedrine"],
            answer: "Loratadine/Pseudoephedrine",
            explanation: "Claritin-D combines loratadine with pseudoephedrine, giving antihistamine relief plus a decongestant effect.",
            objective: .brandGeneric,
            relatedDrugIds: ["d252"],
            tags: ["Mastery", "7f", "Claritin-D", "combo", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_032",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Sudafed is the classic behind-the-counter oral decongestant students remember for insomnia, tachycardia, and blood-pressure concerns. What is the generic name of Sudafed?",
            options: ["Pseudoephedrine", "Phenylephrine", "Diphenhydramine", "Loratadine", "Cetirizine"],
            answer: "Pseudoephedrine",
            explanation: "Sudafed is pseudoephedrine, the high-yield oral decongestant associated with stimulation and blood-pressure elevation.",
            objective: .brandGeneric,
            relatedDrugIds: ["d254"],
            tags: ["Mastery", "7f", "Sudafed", "decongestant", "brand-generic"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_033",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient wants an oral antihistamine for daytime use and is especially worried about sleepiness because they drive for work. Which option from this module is classically remembered as the least sedating choice?",
            options: ["Fexofenadine", "Diphenhydramine", "Cetirizine", "Hydroxyzine", "Levocetirizine"],
            answer: "Fexofenadine",
            explanation: "Fexofenadine is the classic least-sedating oral antihistamine choice among the common allergy agents in this module.",
            objective: .pearl,
            relatedDrugIds: ["d248", "d246", "d251", "d247"],
            tags: ["Mastery", "7f", "least sedating", "daytime allergy", "fexofenadine"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_034",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient wants a second-generation antihistamine for allergic rhinitis but is told that one of them can still cause a bit more drowsiness than loratadine or fexofenadine. Which drug best fits that teaching pearl?",
            options: ["Cetirizine", "Fexofenadine", "Loratadine", "Pseudoephedrine", "Fluticasone (nasal)"],
            answer: "Cetirizine",
            explanation: "Cetirizine is still considered second generation, but it can cause a bit more drowsiness than loratadine or fexofenadine.",
            objective: .adverseEffect,
            relatedDrugIds: ["d246", "d251", "d248"],
            tags: ["Mastery", "7f", "cetirizine", "mild drowsiness", "second-gen"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_035",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .easy,
            question: "Claritin is the classic non-sedating OTC antihistamine many patients use for daytime spring allergies. What is the generic name of Claritin?",
            options: ["Loratadine", "Cetirizine", "Fexofenadine", "Levocetirizine", "Diphenhydramine"],
            answer: "Loratadine",
            explanation: "Claritin is loratadine, a second-generation antihistamine associated with low sedation and OTC availability.",
            objective: .brandGeneric,
            relatedDrugIds: ["d251"],
            tags: ["Mastery", "7f", "Claritin", "brand-generic", "daytime allergy"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_036",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "A patient with asthma notices more wheezing after starting a nonselective beta blocker from an earlier cardiovascular module. Which drug should immediately make you worry about blocking beta2-mediated bronchodilation and blunting albuterol response?",
            options: ["Propranolol", "Metoprolol succinate", "Amlodipine", "Losartan", "Furosemide"],
            answer: "Propranolol",
            explanation: "Propranolol is a nonselective beta blocker, so it can worsen bronchospasm and oppose the beta2 effects of rescue bronchodilators like albuterol.",
            objective: .interaction,
            relatedDrugIds: ["d18", "d120"],
            tags: ["Mastery", "7f", "crossover", "propranolol", "bronchospasm"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_037",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient with an asthma flare is sent home on a short burst of an oral systemic steroid from an earlier module to quickly calm airway inflammation. Which drug is the classic answer?",
            options: ["Prednisone", "Montelukast", "Tiotropium", "Cetirizine", "Roflumilast"],
            answer: "Prednisone",
            explanation: "Prednisone is the classic oral systemic corticosteroid used for short bursts during asthma exacerbations to rapidly reduce inflammation.",
            objective: .indication,
            relatedDrugIds: ["d163"],
            tags: ["Mastery", "7f", "crossover", "prednisone", "asthma exacerbation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_038",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A child with croup receives a long-acting systemic corticosteroid from an earlier endocrine/steroid module. Which drug is the classic high-yield choice?",
            options: ["Dexamethasone", "Prednisone", "Hydrocortisone", "Methylprednisolone", "Montelukast"],
            answer: "Dexamethasone",
            explanation: "Dexamethasone is the classic high-yield systemic corticosteroid associated with croup because of its strong potency and long half-life.",
            objective: .pearl,
            relatedDrugIds: ["d165"],
            tags: ["Mastery", "7f", "crossover", "dexamethasone", "croup"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_039",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient using Spiriva HandiHaler says they swallow the capsule whole each morning with coffee. What is the most important correction?",
            options: ["The capsule is for inhalation through the device and should not be swallowed", "The capsule should be chewed for faster onset", "The capsule should be dissolved in juice before use", "The capsule is a bedtime oral leukotriene blocker", "The capsule is a rescue treatment for acute attacks"],
            answer: "The capsule is for inhalation through the device and should not be swallowed",
            explanation: "Tiotropium HandiHaler capsules are inhaled through the device. Swallowing the capsule is a classic counseling mistake students should recognize.",
            objective: .pearl,
            relatedDrugIds: ["d123"],
            tags: ["Mastery", "7f", "Spiriva", "HandiHaler", "counseling"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_040",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "An older patient with COPD reports dry mouth and trouble urinating after starting an inhaled anticholinergic. Which respiratory drug class most strongly explains that pattern?",
            options: ["Muscarinic antagonists such as tiotropium or ipratropium", "Leukotriene receptor antagonists such as montelukast", "Inhaled corticosteroids such as budesonide", "Anti-IgE biologics such as omalizumab", "Second-generation antihistamines such as loratadine"],
            answer: "Muscarinic antagonists such as tiotropium or ipratropium",
            explanation: "Inhaled anticholinergics can cause dry mouth and urinary retention, so muscarinic antagonists like tiotropium and ipratropium are the best fit.",
            objective: .contraindication,
            relatedDrugIds: ["d123", "d122"],
            tags: ["Mastery", "7f", "anticholinergic", "urinary retention", "dry mouth"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_041",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "Which controller inhaler from this module is most associated with the teaching pearl that one inhaler may be used for both maintenance and reliever therapy in selected asthma regimens?",
            options: ["Budesonide/Formoterol", "Fluticasone/Salmeterol", "Mometasone/Formoterol", "Umeclidinium/Vilanterol", "Salmeterol"],
            answer: "Budesonide/Formoterol",
            explanation: "Budesonide/formoterol (Symbicort) is the classic inhaler tied to the SMART-style pearl because it combines an inhaled corticosteroid with formoterol.",
            objective: .pearl,
            relatedDrugIds: ["d117"],
            tags: ["Mastery", "7f", "SMART", "Symbicort", "maintenance and reliever"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_042",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient’s biggest allergy complaint is nasal congestion with inflamed swollen passages rather than isolated itching. Which class from this module is generally the strongest everyday controller option for allergic rhinitis?",
            options: ["Intranasal corticosteroids such as fluticasone or mometasone", "First-generation antihistamines such as diphenhydramine", "Short-acting beta2 agonists such as albuterol", "Biologics such as omalizumab", "Methylxanthines such as theophylline"],
            answer: "Intranasal corticosteroids such as fluticasone or mometasone",
            explanation: "Intranasal corticosteroids are the most effective everyday controller class for allergic rhinitis, especially when congestion and nasal inflammation are prominent.",
            objective: .indication,
            relatedDrugIds: ["d249", "d253"],
            tags: ["Mastery", "7f", "allergic rhinitis", "nasal congestion", "intranasal steroid"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_043",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A patient using Flonase for seasonal allergies calls because of recurrent nosebleeds and irritation. Which counseling pearl best matches this medication?",
            options: ["Fluticasone nasal can cause local nasal irritation and epistaxis", "Fluticasone nasal frequently causes severe hypoglycemia", "Fluticasone nasal is mainly limited by kidney stones", "Fluticasone nasal is a rescue bronchodilator for asthma attacks", "Fluticasone nasal should be taken only with fruit juice"],
            answer: "Fluticasone nasal can cause local nasal irritation and epistaxis",
            explanation: "Local irritation and epistaxis are classic counseling points for intranasal corticosteroids such as fluticasone nasal spray.",
            objective: .adverseEffect,
            relatedDrugIds: ["d249"],
            tags: ["Mastery", "7f", "Flonase", "epistaxis", "nasal irritation"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_044",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .medium,
            question: "A learner is trying to separate the two major asthma biologics in this module. Which drug should be classified as the anti-IgE monoclonal antibody rather than the IL-4/IL-13 pathway blocker?",
            options: ["Omalizumab", "Dupilumab", "Montelukast", "Roflumilast", "Theophylline"],
            answer: "Omalizumab",
            explanation: "Omalizumab is the anti-IgE monoclonal antibody. Dupilumab is the IL-4/IL-13 pathway biologic.",
            objective: .classId,
            relatedDrugIds: ["d126", "d127"],
            tags: ["Mastery", "7f", "anti-IgE", "biologics", "comparison"],
            source: .curated
        ),
        .multipleChoice(
            id: "q7f_add_045",
            subsectionId: DrugDataService.masteringRespiratoryAllergySubsectionId,
            difficulty: .hard,
            question: "A patient with asthma but no COPD asks which inhaler from this module they should avoid using as a substitute for their steroid-containing asthma controller because it is a COPD LAMA/LABA product without an ICS. Which inhaler fits that warning?",
            options: ["Anoro Ellipta", "Symbicort", "Advair", "Pulmicort", "Albuterol"],
            answer: "Anoro Ellipta",
            explanation: "Anoro Ellipta is umeclidinium/vilanterol, a COPD LAMA/LABA inhaler without an inhaled corticosteroid. It does not replace steroid-containing asthma controller therapy.",
            objective: .mixedReview,
            relatedDrugIds: ["d124", "d120", "d117", "d116"],
            tags: ["Mastery", "7f", "Anoro", "COPD-only logic", "avoid in asthma"],
            source: .curated
        )
    ]
}