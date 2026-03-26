// PharmaLingo — Module 7c (Inhaled Corticosteroids & Combos)
// Curated Add-On Question Pack (45 questions)
// IDs: q7c_add_001 ... q7c_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 7c exists, then append:
//
//    if bank["7c"] == nil { bank["7c"] = [] }
//    bank["7c"]?.append(contentsOf: Self.curatedAddOnQuestions_7c)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d115 (Budesonide inhaled / Pulmicort), d117 (Budesonide/Formoterol / Symbicort),
//   d114 (Fluticasone inhaled / Flovent HFA), d116 (Fluticasone/Salmeterol / Advair),
//   d119 (Mometasone/Formoterol / Dulera), d118 (Salmeterol / Serevent).
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7c: [Question] = [
    .multipleChoice(
        id: "q7c_add_001",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Pulmicort is a steroid controller inhaler students should associate with daily asthma maintenance rather than quick symptom relief. What is the generic name of Pulmicort?",
        options: ["Budesonide (inhaled)", "Fluticasone (inhaled)", "Budesonide/Formoterol", "Fluticasone/Salmeterol", "Mometasone/Formoterol"],
        answer: "Budesonide (inhaled)",
        explanation: "Pulmicort is the brand name for inhaled budesonide. Budesonide is an inhaled corticosteroid used for long-term asthma control, not rapid rescue.",
        objective: .brandGeneric,
        relatedDrugIds: ["d115"],
        tags: ["7c", "budesonide", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_002",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Budesonide is an inhaled corticosteroid commonly used as a daily controller for persistent asthma. Which brand name matches inhaled budesonide in this subsection?",
        options: ["Pulmicort", "Flovent HFA", "Symbicort", "Advair", "Dulera"],
        answer: "Pulmicort",
        explanation: "Inhaled budesonide is sold as Pulmicort. That brand-generic link is high yield because budesonide is one of the prototype inhaled corticosteroid controllers.",
        objective: .genericBrand,
        relatedDrugIds: ["d115"],
        tags: ["7c", "budesonide", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_003",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Symbicort is a combination inhaler that teaches students the step-up idea of pairing an inhaled corticosteroid with a long-acting bronchodilator. What is the generic name of Symbicort?",
        options: ["Budesonide/Formoterol", "Fluticasone/Salmeterol", "Mometasone/Formoterol", "Budesonide (inhaled)", "Salmeterol"],
        answer: "Budesonide/Formoterol",
        explanation: "Symbicort contains budesonide and formoterol. It is an ICS/LABA combination inhaler used for maintenance control.",
        objective: .brandGeneric,
        relatedDrugIds: ["d117"],
        tags: ["7c", "symbicort", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_004",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Budesonide/formoterol combines an inhaled corticosteroid with the LABA formoterol in a single controller inhaler. Which brand name matches budesonide/formoterol?",
        options: ["Symbicort", "Advair", "Dulera", "Serevent", "Pulmicort"],
        answer: "Symbicort",
        explanation: "Budesonide/formoterol is sold as Symbicort. The pairing matters because Symbicort is a classic ICS/LABA maintenance inhaler.",
        objective: .genericBrand,
        relatedDrugIds: ["d117"],
        tags: ["7c", "symbicort", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_005",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Flovent HFA is a steroid-only controller inhaler that learners should remember is not a rescue bronchodilator. What is the generic name of Flovent HFA?",
        options: ["Fluticasone (inhaled)", "Budesonide (inhaled)", "Fluticasone/Salmeterol", "Budesonide/Formoterol", "Salmeterol"],
        answer: "Fluticasone (inhaled)",
        explanation: "Flovent HFA is the brand name for inhaled fluticasone. It is an inhaled corticosteroid controller used regularly to reduce airway inflammation.",
        objective: .brandGeneric,
        relatedDrugIds: ["d114"],
        tags: ["7c", "fluticasone", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_006",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Fluticasone is an inhaled corticosteroid used as long-term anti-inflammatory asthma therapy. Which brand name matches inhaled fluticasone in this subsection?",
        options: ["Flovent HFA", "Pulmicort", "Advair", "Serevent", "Dulera"],
        answer: "Flovent HFA",
        explanation: "Inhaled fluticasone is sold as Flovent HFA in this subsection. Students should separate Flovent, a steroid-only controller, from Advair, which also contains a LABA.",
        objective: .genericBrand,
        relatedDrugIds: ["d114"],
        tags: ["7c", "fluticasone", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_007",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Advair is a controller inhaler that combines an inhaled corticosteroid with the same LABA found in Serevent. What is the generic name of Advair?",
        options: ["Fluticasone/Salmeterol", "Budesonide/Formoterol", "Mometasone/Formoterol", "Fluticasone (inhaled)", "Salmeterol"],
        answer: "Fluticasone/Salmeterol",
        explanation: "Advair contains fluticasone and salmeterol. It is an ICS/LABA combination inhaler used for maintenance therapy, not sudden rescue.",
        objective: .brandGeneric,
        relatedDrugIds: ["d116"],
        tags: ["7c", "advair", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_008",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Fluticasone/salmeterol pairs an inhaled corticosteroid with salmeterol in a single maintenance inhaler for asthma and COPD teaching stems. Which brand name matches fluticasone/salmeterol?",
        options: ["Advair", "Symbicort", "Dulera", "Serevent", "Flovent HFA"],
        answer: "Advair",
        explanation: "Fluticasone/salmeterol is sold as Advair. A high-yield pearl is that Advair contains the same LABA ingredient as Serevent.",
        objective: .genericBrand,
        relatedDrugIds: ["d116"],
        tags: ["7c", "advair", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_009",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Dulera is an asthma controller inhaler that combines mometasone with a LABA. What is the generic name of Dulera?",
        options: ["Mometasone/Formoterol", "Budesonide/Formoterol", "Fluticasone/Salmeterol", "Budesonide (inhaled)", "Salmeterol"],
        answer: "Mometasone/Formoterol",
        explanation: "Dulera contains mometasone and formoterol. It is an ICS/LABA combination inhaler used for maintenance control.",
        objective: .brandGeneric,
        relatedDrugIds: ["d119"],
        tags: ["7c", "dulera", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_010",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Mometasone/formoterol combines a steroid with formoterol in one inhaler for maintenance treatment. Which brand name matches mometasone/formoterol?",
        options: ["Dulera", "Symbicort", "Advair", "Serevent", "Pulmicort"],
        answer: "Dulera",
        explanation: "Mometasone/formoterol is sold as Dulera. Remembering Dulera helps distinguish it from Symbicort, which uses budesonide instead of mometasone.",
        objective: .genericBrand,
        relatedDrugIds: ["d119"],
        tags: ["7c", "dulera", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_011",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Serevent is the inhaler in this subsection that most strongly teaches the rule that a LABA should not be used alone in asthma. What is the generic name of Serevent?",
        options: ["Salmeterol", "Formoterol", "Fluticasone", "Budesonide", "Tiotropium"],
        answer: "Salmeterol",
        explanation: "Serevent is the brand name for salmeterol. Salmeterol is a long-acting beta2 agonist and should not be used as monotherapy in asthma.",
        objective: .brandGeneric,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_012",
        subsectionId: "7c",
        difficulty: .easy,
        question: "Salmeterol is a long-acting beta2 agonist used for maintenance bronchodilation and is famous for the 'never alone in asthma' pearl. Which brand name matches salmeterol?",
        options: ["Serevent", "Advair", "Symbicort", "Dulera", "Flovent HFA"],
        answer: "Serevent",
        explanation: "Salmeterol is sold as Serevent. That pairing is worth memorizing because salmeterol is the standalone LABA in this subsection.",
        objective: .genericBrand,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_013",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A clinician wants a daily controller that is an inhaled corticosteroid only, without adding a LABA yet. Which option from this subsection best fits that role?",
        options: ["Budesonide (inhaled)", "Symbicort", "Advair", "Dulera", "Serevent"],
        answer: "Budesonide (inhaled)",
        explanation: "Inhaled budesonide is a pure inhaled corticosteroid. Symbicort, Advair, and Dulera are ICS/LABA combinations, while Serevent is a LABA alone.",
        objective: .classId,
        relatedDrugIds: ["d115"],
        tags: ["7c", "budesonide", "ics"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_014",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Flovent HFA is used as a daily anti-inflammatory controller for asthma. How should Flovent HFA be classified?",
        options: ["Inhaled corticosteroid", "Long-acting beta2 agonist", "ICS/LABA combination", "Short-acting beta2 agonist", "Leukotriene receptor antagonist"],
        answer: "Inhaled corticosteroid",
        explanation: "Flovent HFA is inhaled fluticasone, an inhaled corticosteroid. It reduces airway inflammation over time rather than providing immediate rescue bronchodilation.",
        objective: .classId,
        relatedDrugIds: ["d114"],
        tags: ["7c", "fluticasone", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_015",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Symbicort is often used when a patient needs more than steroid-only control and is ready for a combination inhaler. Which class best describes Symbicort?",
        options: ["ICS/LABA combination", "Inhaled corticosteroid only", "LABA only", "LAMA/LABA combination", "Biologic monoclonal antibody"],
        answer: "ICS/LABA combination",
        explanation: "Symbicort combines budesonide, an inhaled corticosteroid, with formoterol, a LABA. That makes it an ICS/LABA combination inhaler.",
        objective: .classId,
        relatedDrugIds: ["d117"],
        tags: ["7c", "symbicort", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_016",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Serevent provides long-acting bronchodilation but does not contain a steroid. Which class best describes Serevent?",
        options: ["Long-acting beta2 agonist", "Inhaled corticosteroid", "ICS/LABA combination", "Short-acting beta2 agonist", "Intranasal corticosteroid"],
        answer: "Long-acting beta2 agonist",
        explanation: "Serevent is salmeterol, a LABA. It is a bronchodilator, not a corticosteroid-containing controller by itself.",
        objective: .classId,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "class"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_017",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A stem says the drug's main job is to decrease airway inflammation and reduce future symptoms rather than provide immediate bronchodilation. Which mechanism best matches inhaled budesonide and inhaled fluticasone?",
        options: ["Local glucocorticoid anti-inflammatory activity in the airways", "Long-acting beta2 stimulation of bronchial smooth muscle", "Muscarinic receptor blockade", "IgE neutralization", "Leukotriene receptor blockade"],
        answer: "Local glucocorticoid anti-inflammatory activity in the airways",
        explanation: "Budesonide and fluticasone are inhaled corticosteroids. Their value comes from reducing airway inflammation and exacerbation risk over time.",
        objective: .moa,
        relatedDrugIds: ["d115", "d114"],
        tags: ["7c", "ics", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_018",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which mechanism best matches salmeterol, the standalone bronchodilator in this subsection that should not be used alone in asthma?",
        options: ["Long-acting beta2 agonism causing maintenance bronchodilation", "Inhibition of inflammatory cytokine transcription", "M3 receptor antagonism", "PDE-4 inhibition", "Leukotriene receptor blockade"],
        answer: "Long-acting beta2 agonism causing maintenance bronchodilation",
        explanation: "Salmeterol is a LABA. It works by stimulating beta2 receptors for prolonged bronchodilation, but it does not replace inhaled steroid therapy in asthma.",
        objective: .moa,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_019",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A patient on a steroid-containing inhaler develops white patches in the mouth and a sore throat after several weeks of therapy. Which adverse effect is most likely?",
        options: ["Oropharyngeal candidiasis", "Tendon rupture", "Hyperuricemia", "Blue-gray skin discoloration", "Red man syndrome"],
        answer: "Oropharyngeal candidiasis",
        explanation: "Steroid-containing inhalers can cause local Candida overgrowth in the mouth and throat. This is the classic inhaled corticosteroid 'thrush' pearl.",
        objective: .adverseEffect,
        relatedDrugIds: ["d115", "d114", "d116", "d117", "d119"],
        tags: ["7c", "ics", "thrush"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_020",
        subsectionId: "7c",
        difficulty: .medium,
        question: "What counseling point most directly lowers the risk of thrush after Pulmicort, Flovent HFA, Symbicort, Advair, or Dulera?",
        options: ["Rinse the mouth with water after each use and spit it out", "Take the inhaler only with food", "Avoid dairy for 2 hours after each puff", "Refrigerate the inhaler after opening", "Double the next dose if a dose is missed"],
        answer: "Rinse the mouth with water after each use and spit it out",
        explanation: "Rinsing the mouth after steroid-containing inhalers helps reduce local steroid exposure in the mouth and lowers the risk of oropharyngeal candidiasis.",
        objective: .pearl,
        relatedDrugIds: ["d115", "d114", "d116", "d117", "d119"],
        tags: ["7c", "ics", "mouth-rinse"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_021",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Besides thrush, which local side effect is classically associated with inhaled corticosteroid-containing inhalers?",
        options: ["Hoarseness or dysphonia", "Gingival hyperplasia", "Nephrolithiasis", "Tinnitus", "Constipation"],
        answer: "Hoarseness or dysphonia",
        explanation: "Hoarseness or dysphonia is another classic local adverse effect of inhaled corticosteroids. It is commonly taught alongside thrush and mouth-rinsing counseling.",
        objective: .adverseEffect,
        relatedDrugIds: ["d115", "d114", "d116", "d117", "d119"],
        tags: ["7c", "ics", "dysphonia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_022",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A child is maintained for months on inhaled corticosteroid therapy. What should be monitored over time as a high-yield safety pearl?",
        options: ["Growth velocity or height", "INR", "Serum uric acid", "Digoxin level", "Visual color discrimination"],
        answer: "Growth velocity or height",
        explanation: "Chronic inhaled corticosteroid use can slightly slow growth velocity in pediatric patients. Monitoring height over time is a classic safety pearl.",
        objective: .monitoring,
        relatedDrugIds: ["d115", "d114", "d117"],
        tags: ["7c", "ics", "growth"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_023",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A college student has sudden wheezing during a workout and reaches for Flovent HFA. Why is that a poor rescue choice?",
        options: ["Flovent HFA is a controller inhaled corticosteroid, not a rapid bronchodilator", "Flovent HFA must be refrigerated before each use", "Flovent HFA is only available as an oral tablet", "Flovent HFA works only if paired with pseudoephedrine", "Flovent HFA is indicated only for pneumonia"],
        answer: "Flovent HFA is a controller inhaled corticosteroid, not a rapid bronchodilator",
        explanation: "Fluticasone inhaled is used for long-term control, not immediate symptom relief. Acute bronchospasm still needs a fast rescue bronchodilator such as albuterol.",
        objective: .pearl,
        relatedDrugIds: ["d114"],
        tags: ["7c", "fluticasone", "not-rescue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_024",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which drug most strongly teaches the rule that a LABA should not be used without an inhaled corticosteroid in asthma?",
        options: ["Salmeterol", "Budesonide (inhaled)", "Fluticasone (inhaled)", "Tiotropium", "Montelukast"],
        answer: "Salmeterol",
        explanation: "Salmeterol is the standalone LABA in this subsection. LABA monotherapy in asthma is a classic high-yield warning because it increases serious asthma-related risk.",
        objective: .contraindication,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "monotherapy-warning"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_025",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which inhaler contains the same corticosteroid molecule found in Pulmicort plus a long-acting bronchodilator in the same device?",
        options: ["Symbicort", "Advair", "Dulera", "Serevent", "Spiriva"],
        answer: "Symbicort",
        explanation: "Pulmicort contains budesonide, and Symbicort contains budesonide plus formoterol. That comparison helps students connect the steroid-only inhaler with the steroid-plus-LABA combo.",
        objective: .pearl,
        relatedDrugIds: ["d115", "d117"],
        tags: ["7c", "symbicort", "budesonide"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_026",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which inhaler contains the same LABA ingredient found in Serevent but pairs it with an inhaled corticosteroid?",
        options: ["Advair", "Symbicort", "Dulera", "Pulmicort", "Flovent HFA"],
        answer: "Advair",
        explanation: "Serevent contains salmeterol, and Advair contains fluticasone plus salmeterol. This is a high-yield composition pearl.",
        objective: .pearl,
        relatedDrugIds: ["d116", "d118"],
        tags: ["7c", "advair", "salmeterol"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_027",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which combination inhaler specifically contains mometasone rather than budesonide or fluticasone?",
        options: ["Dulera", "Advair", "Symbicort", "Serevent", "Pulmicort"],
        answer: "Dulera",
        explanation: "Dulera contains mometasone plus formoterol. Symbicort contains budesonide plus formoterol, while Advair contains fluticasone plus salmeterol.",
        objective: .pearl,
        relatedDrugIds: ["d119"],
        tags: ["7c", "dulera", "mometasone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_028",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A patient with persistent asthma remains uncontrolled on daily Pulmicort alone. Which fixed-dose combination would be a logical step-up if the plan is to keep budesonide and add a LABA?",
        options: ["Symbicort", "Advair", "Dulera", "Serevent", "Flovent HFA"],
        answer: "Symbicort",
        explanation: "Symbicort contains budesonide plus formoterol, so it keeps the budesonide steroid while adding a long-acting beta2 agonist for step-up controller therapy.",
        objective: .indication,
        relatedDrugIds: ["d115", "d117"],
        tags: ["7c", "symbicort", "step-up"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_029",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A patient already taking Advair asks to add Serevent for extra control. Why is that usually a bad idea?",
        options: ["Advair already contains salmeterol, so this would duplicate LABA therapy", "Advair already contains montelukast, so this would duplicate leukotriene blockade", "Combining them causes acetaminophen toxicity", "Serevent blocks steroid absorption from Advair", "Both are rescue inhalers and should always be alternated every hour"],
        answer: "Advair already contains salmeterol, so this would duplicate LABA therapy",
        explanation: "Advair already includes salmeterol. Adding Serevent would stack a second dose of the same LABA and increase the risk of beta-agonist adverse effects without solving the core control issue.",
        objective: .interaction,
        relatedDrugIds: ["d116", "d118"],
        tags: ["7c", "advair", "duplicate-laba"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_030",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which product from this subsection does NOT contain an inhaled corticosteroid?",
        options: ["Serevent", "Symbicort", "Advair", "Dulera", "Pulmicort"],
        answer: "Serevent",
        explanation: "Serevent is salmeterol alone, a LABA. The others listed either are steroid-only inhalers or combinations that include an inhaled corticosteroid.",
        objective: .classId,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "no-steroid"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_031",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Which answer choice lists the two products in this subsection that both contain formoterol as their long-acting bronchodilator?",
        options: ["Symbicort and Dulera", "Advair and Serevent", "Pulmicort and Flovent HFA", "Advair and Symbicort", "Dulera and Serevent"],
        answer: "Symbicort and Dulera",
        explanation: "Symbicort contains budesonide/formoterol and Dulera contains mometasone/formoterol. Formoterol is the shared LABA in those two products.",
        objective: .pearl,
        relatedDrugIds: ["d117", "d119"],
        tags: ["7c", "formoterol", "pair"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_032",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Which answer choice lists the two pure inhaled corticosteroid controllers in this subsection, without a LABA?",
        options: ["Pulmicort and Flovent HFA", "Symbicort and Dulera", "Advair and Serevent", "Flovent HFA and Advair", "Pulmicort and Serevent"],
        answer: "Pulmicort and Flovent HFA",
        explanation: "Pulmicort is inhaled budesonide and Flovent HFA is inhaled fluticasone. Both are steroid-only controller inhalers.",
        objective: .classId,
        relatedDrugIds: ["d115", "d114"],
        tags: ["7c", "ics-only", "pair"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_033",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Which answer choice lists the products that both contain salmeterol?",
        options: ["Advair and Serevent", "Symbicort and Dulera", "Pulmicort and Symbicort", "Flovent HFA and Dulera", "Pulmicort and Advair"],
        answer: "Advair and Serevent",
        explanation: "Advair contains fluticasone plus salmeterol, while Serevent is salmeterol alone. That shared ingredient is a classic comparison point.",
        objective: .pearl,
        relatedDrugIds: ["d116", "d118"],
        tags: ["7c", "salmeterol", "pair"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_034",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A student is learning the central idea of persistent asthma therapy before combo inhalers are introduced. Which drugs from this subsection best represent the daily anti-inflammatory controller concept?",
        options: ["Budesonide (inhaled) and Fluticasone (inhaled)", "Salmeterol and Albuterol", "Tiotropium and Ipratropium", "Montelukast and Roflumilast", "Omalizumab and Dupilumab"],
        answer: "Budesonide (inhaled) and Fluticasone (inhaled)",
        explanation: "Inhaled corticosteroids are the core anti-inflammatory controller drugs in asthma. Budesonide and fluticasone are the steroid-only controller examples in this subsection.",
        objective: .mixedReview,
        relatedDrugIds: ["d115", "d114"],
        tags: ["7c", "controller-logic", "ics"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_035",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A patient with chronic asthma asks whether Advair replaces albuterol for sudden chest tightness. Which reply is best?",
        options: ["No. Advair is a controller ICS/LABA inhaler, while acute symptoms still need a fast rescue bronchodilator.", "Yes. Advair should be used every few minutes until symptoms stop.", "Yes. Advair works faster than albuterol for rescue.", "No. Advair can only be used in COPD and never in asthma.", "No. Advair is an oral medication rather than an inhaler."],
        answer: "No. Advair is a controller ICS/LABA inhaler, while acute symptoms still need a fast rescue bronchodilator.",
        explanation: "Advair is used for maintenance control, not immediate relief of acute bronchospasm. Rescue symptoms still require a rapid-acting bronchodilator such as albuterol.",
        objective: .pearl,
        relatedDrugIds: ["d116"],
        tags: ["7c", "advair", "not-rescue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_036",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A patient using Symbicort develops oral thrush. Which ingredient class in Symbicort is most responsible for that complication?",
        options: ["The inhaled corticosteroid component", "The LABA component", "An anticholinergic component", "A decongestant component", "An antihistamine component"],
        answer: "The inhaled corticosteroid component",
        explanation: "Thrush is the classic local adverse effect of the steroid component in inhalers like Symbicort. In Symbicort, that steroid is budesonide.",
        objective: .adverseEffect,
        relatedDrugIds: ["d117"],
        tags: ["7c", "symbicort", "thrush"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_037",
        subsectionId: "7c",
        difficulty: .medium,
        question: "A patient using Serevent complains of tremor and palpitations. Which pharmacologic action best explains those symptoms?",
        options: ["Beta2 agonism", "Glucocorticoid receptor activation", "Muscarinic blockade", "Leukotriene blockade", "IgE neutralization"],
        answer: "Beta2 agonism",
        explanation: "Salmeterol is a LABA, and beta2 agonists can cause tremor and palpitations. Those symptoms are classic beta-agonist adverse effects.",
        objective: .adverseEffect,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "tremor"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_038",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which option is most appropriate when the goal is long-term airway inflammation control in asthma while avoiding LABA exposure at the start?",
        options: ["Fluticasone (inhaled)", "Salmeterol", "Tiotropium", "Albuterol", "Umeclidinium/Vilanterol"],
        answer: "Fluticasone (inhaled)",
        explanation: "Inhaled fluticasone is a steroid-only controller that targets airway inflammation. Salmeterol and umeclidinium/vilanterol are bronchodilator-based maintenance options rather than pure anti-inflammatory steroid starts.",
        objective: .indication,
        relatedDrugIds: ["d114"],
        tags: ["7c", "fluticasone", "controller"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_039",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which product best matches the teaching pearl 'same steroid as Pulmicort, but combined with formoterol in one inhaler'?",
        options: ["Symbicort", "Advair", "Dulera", "Serevent", "Flovent HFA"],
        answer: "Symbicort",
        explanation: "Pulmicort contains budesonide, and Symbicort contains budesonide plus formoterol. That shared steroid ingredient makes Symbicort the correct step-up comparison.",
        objective: .pearl,
        relatedDrugIds: ["d117"],
        tags: ["7c", "symbicort", "composition"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_040",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which combination inhaler from this subsection is most specifically taught as an asthma controller rather than the asthma-plus-COPD framing commonly attached to Symbicort and Advair?",
        options: ["Dulera", "Symbicort", "Advair", "Serevent", "Anoro Ellipta"],
        answer: "Dulera",
        explanation: "Dulera is the mometasone/formoterol inhaler in this subsection and is taught primarily as an asthma controller. Symbicort and Advair are more commonly tied to both asthma and COPD teaching stems.",
        objective: .indication,
        relatedDrugIds: ["d119"],
        tags: ["7c", "dulera", "asthma"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_041",
        subsectionId: "7c",
        difficulty: .medium,
        question: "Which drug best matches the pearl 'twice-daily LABA maintenance inhaler that should never be the only asthma controller'?",
        options: ["Serevent", "Pulmicort", "Flovent HFA", "Dulera", "Budesonide/Formoterol"],
        answer: "Serevent",
        explanation: "Serevent is salmeterol, a standalone LABA. It is the classic example used to teach that LABA monotherapy is inappropriate in asthma.",
        objective: .contraindication,
        relatedDrugIds: ["d118"],
        tags: ["7c", "salmeterol", "never-alone"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_042",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Which statement about inhaled corticosteroids is most accurate?",
        options: ["They reduce airway inflammation over time and are used for control, not immediate rescue.", "They provide the fastest relief of acute bronchospasm.", "They are primarily used to reverse opioid overdose.", "They are first-line monotherapy for acute anaphylaxis.", "They have no effect on exacerbation prevention."],
        answer: "They reduce airway inflammation over time and are used for control, not immediate rescue.",
        explanation: "Inhaled corticosteroids work as controller therapy by decreasing airway inflammation and helping prevent exacerbations. They are not rapid rescue bronchodilators.",
        objective: .moa,
        relatedDrugIds: ["d115", "d114"],
        tags: ["7c", "ics", "core-concept"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_043",
        subsectionId: "7c",
        difficulty: .hard,
        question: "Which statement about ICS/LABA combination inhalers is most accurate?",
        options: ["They pair an anti-inflammatory steroid with a long-acting bronchodilator for maintenance control.", "They contain no bronchodilator component at all.", "They are intended only for immediate rescue during attacks.", "They are safest when the steroid is skipped and the LABA is used alone.", "They should always be combined with a second LABA inhaler."],
        answer: "They pair an anti-inflammatory steroid with a long-acting bronchodilator for maintenance control.",
        explanation: "Combination products like Symbicort, Advair, and Dulera combine an inhaled corticosteroid with a LABA. The steroid controls inflammation while the LABA provides longer bronchodilation.",
        objective: .classId,
        relatedDrugIds: ["d117", "d116", "d119"],
        tags: ["7c", "ics-laba", "core-concept"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_044",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A child uses inhaled budesonide daily and now has good control. Why is the clinician still instructed to use the lowest effective dose?",
        options: ["Inhaled corticosteroids can have systemic effects such as slowed growth at higher exposure.", "Budesonide inevitably causes kidney failure at maintenance doses.", "Budesonide is always severely sedating if the dose is not reduced.", "Tolerance develops unless the dose is increased every month.", "All inhaled steroids cause permanent tachyphylaxis within days."],
        answer: "Inhaled corticosteroids can have systemic effects such as slowed growth at higher exposure.",
        explanation: "Even inhaled corticosteroids can have systemic effects, especially with higher or prolonged exposure. Using the lowest effective dose helps balance asthma control with safety.",
        objective: .monitoring,
        relatedDrugIds: ["d115"],
        tags: ["7c", "budesonide", "lowest-effective-dose"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7c_add_045",
        subsectionId: "7c",
        difficulty: .hard,
        question: "A patient with frequent daytime symptoms is relying on albuterol several times per day. Which addition from this subsection most directly targets the underlying airway inflammation driving poor control?",
        options: ["Fluticasone (inhaled)", "Salmeterol", "Ipratropium", "Tiotropium", "Pseudoephedrine"],
        answer: "Fluticasone (inhaled)",
        explanation: "If poor control reflects ongoing airway inflammation, adding an inhaled corticosteroid such as fluticasone addresses the underlying inflammatory process better than simply adding more bronchodilation.",
        objective: .indication,
        relatedDrugIds: ["d114"],
        tags: ["7c", "fluticasone", "inflammation"],
        source: .curated
    )

    ]
}