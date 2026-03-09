// PharmaLingo — Module 7b (Inhaled Bronchodilators)
// Curated Add-On Question Pack (45 questions)
// IDs: q7b_add_001 ... q7b_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 7b exists, then append:
//
//    if bank["7b"] == nil { bank["7b"] = [] }
//    bank["7b"]?.append(contentsOf: Self.curatedAddOnQuestions_7b)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs: d120 (Albuterol), d121 (Levalbuterol),
//   d122 (Ipratropium), d123 (Tiotropium), d124 (Umeclidinium/Vilanterol).
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7b: [Question] = [
    .multipleChoice(
        id: "q7b_add_001",
        subsectionId: "7b",
        difficulty: .easy,
        question: "ProAir and Ventolin are brand names students should instantly connect to the classic short-acting rescue inhaler used for rapid bronchospasm relief and prevention of exercise-induced bronchospasm. What is the generic name?",
        options: ["Albuterol", "Levalbuterol", "Ipratropium", "Tiotropium", "Umeclidinium/Vilanterol"],
        answer: "Albuterol",
        explanation: "ProAir and Ventolin are brands of albuterol. Albuterol is the classic SABA rescue inhaler for acute symptoms and pre-exercise use.",
        objective: .brandGeneric,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_002",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Albuterol is the prototype short-acting beta2 agonist that learners see in acute wheeze, asthma rescue, and pre-exercise prevention questions. Which brand pairing matches albuterol?",
        options: ["ProAir/Ventolin", "Xopenex", "Atrovent", "Spiriva", "Anoro Ellipta"],
        answer: "ProAir/Ventolin",
        explanation: "Albuterol is sold under brand names such as ProAir and Ventolin. That pairing is worth memorizing because albuterol is the most tested rescue inhaler.",
        objective: .genericBrand,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_003",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Xopenex is the rescue bronchodilator often taught as the R-enantiomer version of albuterol. What is the generic name of Xopenex?",
        options: ["Levalbuterol", "Albuterol", "Ipratropium", "Tiotropium", "Salmeterol"],
        answer: "Levalbuterol",
        explanation: "Xopenex is the brand name for levalbuterol. Levalbuterol is a SABA and is the R-enantiomer of albuterol.",
        objective: .brandGeneric,
        relatedDrugIds: ["d121"],
        tags: ["7b", "levalbuterol", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_004",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Levalbuterol is a short-acting beta2 agonist used as a rescue inhaler and is commonly remembered as the R-enantiomer of albuterol. Which brand name matches levalbuterol?",
        options: ["Xopenex", "Ventolin", "Atrovent", "Spiriva", "Anoro Ellipta"],
        answer: "Xopenex",
        explanation: "Levalbuterol is sold as Xopenex. Pairing Xopenex with levalbuterol helps distinguish it from Ventolin, which is albuterol.",
        objective: .genericBrand,
        relatedDrugIds: ["d121"],
        tags: ["7b", "levalbuterol", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_005",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Atrovent HFA is an inhaled anticholinergic most often associated with COPD bronchodilation rather than the classic first-line asthma rescue role. What is the generic name of Atrovent?",
        options: ["Ipratropium", "Tiotropium", "Albuterol", "Levalbuterol", "Umeclidinium/Vilanterol"],
        answer: "Ipratropium",
        explanation: "Atrovent is the brand name for ipratropium. Ipratropium is a short-acting anticholinergic bronchodilator.",
        objective: .brandGeneric,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_006",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Ipratropium is the short-acting muscarinic antagonist learners often see in COPD and DuoNeb-style bronchodilator questions. Which brand name matches ipratropium?",
        options: ["Atrovent", "Spiriva", "Ventolin", "Xopenex", "Dulera"],
        answer: "Atrovent",
        explanation: "Ipratropium is sold as Atrovent. That brand-generic link is high yield because ipratropium is the short-acting inhaled anticholinergic in this subsection.",
        objective: .genericBrand,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_007",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Spiriva is the once-daily long-acting muscarinic antagonist students should associate with COPD maintenance and asthma add-on therapy, not acute rescue. What is the generic name of Spiriva?",
        options: ["Tiotropium", "Ipratropium", "Albuterol", "Levalbuterol", "Montelukast"],
        answer: "Tiotropium",
        explanation: "Spiriva is the brand name for tiotropium. Tiotropium is the LAMA in this subsection and is used for maintenance, not immediate symptom relief.",
        objective: .brandGeneric,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_008",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Tiotropium is a long-acting inhaled anticholinergic used once daily for maintenance bronchodilation. Which brand name matches tiotropium?",
        options: ["Spiriva", "Atrovent", "Ventolin", "Xopenex", "Anoro Ellipta"],
        answer: "Spiriva",
        explanation: "Tiotropium is sold as Spiriva. Remembering Spiriva = tiotropium helps separate the long-acting LAMA from short-acting ipratropium.",
        objective: .genericBrand,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_009",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Anoro Ellipta is a dual bronchodilator used for COPD maintenance and combines a LAMA with a LABA. What is the generic name of Anoro Ellipta?",
        options: ["Umeclidinium/Vilanterol", "Tiotropium", "Ipratropium", "Fluticasone/Salmeterol", "Budesonide/Formoterol"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Anoro Ellipta contains umeclidinium and vilanterol. It is a LAMA/LABA COPD maintenance inhaler rather than a rescue medication.",
        objective: .brandGeneric,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "brand->generic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_010",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Umeclidinium/vilanterol is the inhaler students should think of when they hear LAMA/LABA COPD maintenance without an inhaled steroid. Which brand matches umeclidinium/vilanterol?",
        options: ["Anoro Ellipta", "Spiriva", "Atrovent", "Symbicort", "Advair"],
        answer: "Anoro Ellipta",
        explanation: "Umeclidinium/vilanterol is sold as Anoro Ellipta. It provides dual bronchodilation for COPD maintenance.",
        objective: .genericBrand,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "generic->brand"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_011",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A student with asthma develops sudden wheezing and chest tightness between classes. Which drug from this subsection is the best rapid-relief rescue inhaler?",
        options: ["Albuterol", "Tiotropium", "Ipratropium", "Montelukast", "Umeclidinium/Vilanterol"],
        answer: "Albuterol",
        explanation: "Albuterol is the classic rapid-onset SABA rescue inhaler used for acute bronchospasm. The others are maintenance agents or slower controllers.",
        objective: .indication,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "rescue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_012",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient with exercise-induced bronchospasm wants a medication to use shortly before running to prevent symptoms. Which option from this subsection best fits that role?",
        options: ["Albuterol", "Tiotropium", "Ipratropium", "Budesonide (inhaled)", "Roflumilast"],
        answer: "Albuterol",
        explanation: "Albuterol is the high-yield pre-exercise rescue choice for preventing exercise-induced bronchospasm because it acts quickly.",
        objective: .dosing,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "exercise-induced bronchospasm"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_013",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A stem says a bronchodilator works by stimulating beta2 receptors and relaxing bronchial smooth muscle within minutes. Which drug best matches that mechanism and timing?",
        options: ["Albuterol", "Ipratropium", "Tiotropium", "Montelukast", "Umeclidinium/Vilanterol"],
        answer: "Albuterol",
        explanation: "Albuterol is a short-acting beta2 agonist. Its fast bronchodilator effect makes it the prototype rescue inhaler.",
        objective: .moa,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_014",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which bronchodilator is most often tested as the R-enantiomer of albuterol while still serving as a rescue SABA?",
        options: ["Levalbuterol", "Ipratropium", "Tiotropium", "Salmeterol", "Umeclidinium/Vilanterol"],
        answer: "Levalbuterol",
        explanation: "Levalbuterol is the R-enantiomer of albuterol and remains a short-acting beta2 agonist used for rescue bronchodilation.",
        objective: .pearl,
        relatedDrugIds: ["d121"],
        tags: ["7b", "levalbuterol", "r-enantiomer"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_015",
        subsectionId: "7b",
        difficulty: .medium,
        question: "In acute COPD bronchodilator teaching, DuoNeb-style therapy often pairs a short-acting anticholinergic with a short-acting beta2 agonist. Which drug is the anticholinergic partner commonly combined with albuterol?",
        options: ["Ipratropium", "Tiotropium", "Levalbuterol", "Salmeterol", "Montelukast"],
        answer: "Ipratropium",
        explanation: "Ipratropium is the short-acting anticholinergic commonly paired with albuterol in DuoNeb-type treatment.",
        objective: .indication,
        relatedDrugIds: ["d122", "d120"],
        tags: ["7b", "ipratropium", "duoneb"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_016",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which bronchodilator fits this label-style teaching pearl: used for maintenance treatment of bronchospasm associated with COPD, but not indicated as the initial treatment of acute episodes where rapid rescue is required?",
        options: ["Ipratropium", "Albuterol", "Levalbuterol", "Tiotropium", "Fluticasone/Salmeterol"],
        answer: "Ipratropium",
        explanation: "Atrovent HFA teaches that ipratropium is a bronchodilator for COPD maintenance and is not the first choice when immediate rescue is needed.",
        objective: .contraindication,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "maintenance-only"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_017",
        subsectionId: "7b",
        difficulty: .medium,
        question: "An older patient with COPD starts a short-acting anticholinergic inhaler and then reports dry mouth and trouble urinating. Which drug from this subsection best fits that adverse-effect pattern?",
        options: ["Ipratropium", "Albuterol", "Levalbuterol", "Montelukast", "Budesonide (inhaled)"],
        answer: "Ipratropium",
        explanation: "Ipratropium is a short-acting inhaled anticholinergic, so dry mouth and urinary retention fit its mechanism.",
        objective: .adverseEffect,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "anticholinergic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_018",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A question stem describes bronchodilation produced by blocking muscarinic receptors in the airways rather than stimulating beta receptors. Which short-acting inhaler from this subsection best matches that mechanism?",
        options: ["Ipratropium", "Albuterol", "Levalbuterol", "Salmeterol", "Roflumilast"],
        answer: "Ipratropium",
        explanation: "Ipratropium is a short-acting muscarinic antagonist. It bronchodilates by reducing cholinergic bronchoconstriction.",
        objective: .moa,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "moa"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_019",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient with COPD needs a once-daily maintenance bronchodilator, and an asthma question mentions the same drug as an add-on controller rather than a rescue medication. Which drug best fits both clues?",
        options: ["Tiotropium", "Albuterol", "Levalbuterol", "Ipratropium", "Montelukast"],
        answer: "Tiotropium",
        explanation: "Tiotropium is a once-daily LAMA used for COPD maintenance and can be used as an add-on maintenance agent in asthma.",
        objective: .indication,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "maintenance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_020",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient reaches for their daily LAMA inhaler during an acute asthma flare. Which drug from this subsection is inappropriate for immediate symptom relief because it is a maintenance inhaler, not a rescue inhaler?",
        options: ["Tiotropium", "Albuterol", "Levalbuterol", "Budesonide/Formoterol", "Umeclidinium/Vilanterol"],
        answer: "Tiotropium",
        explanation: "Tiotropium is a maintenance LAMA and should not be used as rescue therapy during an acute attack. A rapid-acting beta2 agonist is preferred for immediate relief.",
        objective: .pearl,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "not-rescue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_021",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient says, “I swallowed my Spiriva capsule this morning.” Which generic drug does that administration error most strongly point to?",
        options: ["Tiotropium", "Ipratropium", "Albuterol", "Levalbuterol", "Umeclidinium/Vilanterol"],
        answer: "Tiotropium",
        explanation: "Spiriva HandiHaler capsules are for inhalation through the device, not for swallowing. That pearl is tied to tiotropium.",
        objective: .dosing,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "administration"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_022",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A patient had a prior immediate hypersensitivity reaction to ipratropium. Which maintenance bronchodilator from this subsection carries a label-based hypersensitivity contraindication that makes that history especially important?",
        options: ["Tiotropium", "Albuterol", "Levalbuterol", "Montelukast", "Budesonide (inhaled)"],
        answer: "Tiotropium",
        explanation: "Tiotropium labeling warns about hypersensitivity in patients with allergy to tiotropium or ipratropium. That cross-reactivity pearl is high yield.",
        objective: .contraindication,
        relatedDrugIds: ["d123", "d122"],
        tags: ["7b", "tiotropium", "ipratropium-hypersensitivity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_023",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which once-daily bronchodilator should be used cautiously in patients with narrow-angle glaucoma or urinary retention because of anticholinergic effects?",
        options: ["Tiotropium", "Albuterol", "Levalbuterol", "Montelukast", "Fluticasone (inhaled)"],
        answer: "Tiotropium",
        explanation: "Tiotropium is a LAMA and can worsen narrow-angle glaucoma or urinary retention because of its anticholinergic effects.",
        objective: .contraindication,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "glaucoma-urinary-retention"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_024",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Which inhaler from this subsection is a pure long-acting muscarinic antagonist rather than a SABA, SAMA, or LAMA/LABA combination?",
        options: ["Tiotropium", "Albuterol", "Ipratropium", "Levalbuterol", "Umeclidinium/Vilanterol"],
        answer: "Tiotropium",
        explanation: "Tiotropium is the pure LAMA in this subsection. It provides long-acting anticholinergic bronchodilation.",
        objective: .classId,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "LAMA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_025",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient with COPD is already using a rescue inhaler but now needs dual maintenance bronchodilation from one device without an inhaled corticosteroid. Which option from this subsection best fits?",
        options: ["Umeclidinium/Vilanterol", "Tiotropium", "Ipratropium", "Albuterol", "Montelukast"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Umeclidinium/vilanterol provides LAMA plus LABA maintenance bronchodilation for COPD. It is not a rescue inhaler.",
        objective: .indication,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "copd-maintenance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_026",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Which medication in this subsection is a LAMA/LABA combination rather than a single-agent bronchodilator?",
        options: ["Umeclidinium/Vilanterol", "Tiotropium", "Ipratropium", "Albuterol", "Levalbuterol"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Umeclidinium/vilanterol combines an anticholinergic (LAMA) with a long-acting beta2 agonist (LABA).",
        objective: .classId,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "LAMA-LABA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_027",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which bronchodilator from this subsection is specifically not indicated for asthma and should make you think “COPD maintenance only, not an asthma controller or rescue inhaler”?",
        options: ["Umeclidinium/Vilanterol", "Tiotropium", "Albuterol", "Levalbuterol", "Budesonide/Formoterol"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Umeclidinium/vilanterol (Anoro Ellipta) is used for COPD maintenance and is not indicated for asthma.",
        objective: .contraindication,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "not-for-asthma"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_028",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient with worsening shortness of breath during an acute flare asks whether they can take extra doses of their Anoro inhaler for quick relief. Which answer best identifies the drug and its high-yield limitation?",
        options: ["Umeclidinium/Vilanterol — it is maintenance therapy and not a rescue inhaler", "Albuterol — it should never be used for acute symptoms", "Levalbuterol — it is only for nightly maintenance", "Ipratropium — it is the first-line asthma rescue inhaler", "Tiotropium — it should be used every few minutes during an attack"],
        answer: "Umeclidinium/Vilanterol — it is maintenance therapy and not a rescue inhaler",
        explanation: "Anoro Ellipta is umeclidinium/vilanterol, a COPD maintenance inhaler. It should not be used for acute symptom relief.",
        objective: .pearl,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "not-rescue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_029",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A patient with severe milk protein allergy needs COPD therapy. Which dry-powder inhaler from this subsection should raise the greatest concern because that allergy is a label-based contraindication?",
        options: ["Umeclidinium/Vilanterol", "Albuterol", "Ipratropium", "Tiotropium Respimat", "Levalbuterol"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Anoro Ellipta contains lactose-containing powder and is contraindicated in severe milk protein allergy.",
        objective: .contraindication,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "milk-protein-allergy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_030",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A COPD patient is already using salmeterol from another inhaler and now wants to start Anoro Ellipta. Which product in this subsection creates the clearest “do not add another LABA-containing therapy” warning?",
        options: ["Umeclidinium/Vilanterol", "Tiotropium", "Ipratropium", "Albuterol", "Levalbuterol"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Anoro contains vilanterol, a LABA, so it should not be used together with another LABA-containing regimen because of overdose and cardiovascular risk concerns.",
        objective: .interaction,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "additional-laba"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_031",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Which drug from this subsection is best identified as a short-acting muscarinic antagonist (SAMA)?",
        options: ["Ipratropium", "Tiotropium", "Albuterol", "Levalbuterol", "Umeclidinium/Vilanterol"],
        answer: "Ipratropium",
        explanation: "Ipratropium is the short-acting anticholinergic bronchodilator in this subsection.",
        objective: .classId,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "SAMA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_032",
        subsectionId: "7b",
        difficulty: .easy,
        question: "Which drug from this subsection is a short-acting beta2 agonist but is specifically remembered as the R-enantiomer rather than the standard racemic rescue inhaler?",
        options: ["Levalbuterol", "Ipratropium", "Tiotropium", "Umeclidinium/Vilanterol", "Montelukast"],
        answer: "Levalbuterol",
        explanation: "Levalbuterol is a SABA and is remembered as the R-enantiomer of albuterol.",
        objective: .classId,
        relatedDrugIds: ["d121"],
        tags: ["7b", "levalbuterol", "SABA"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_033",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A patient takes repeated puffs from the classic rescue inhaler and then develops tremor, palpitations, and mild tachycardia. Which drug most strongly fits that beta2-agonist adverse-effect pattern?",
        options: ["Albuterol", "Ipratropium", "Tiotropium", "Montelukast", "Budesonide (inhaled)"],
        answer: "Albuterol",
        explanation: "Albuterol is the classic rescue beta2 agonist, and tremor plus tachycardia are high-yield beta-agonist adverse effects.",
        objective: .adverseEffect,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "tremor-tachycardia"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_034",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A patient says they now need more puffs of their rescue inhaler than usual just to get through the day. Which medication does that clue most directly point to, and why is it important?",
        options: ["Albuterol — increasing use can signal worsening asthma control and need for reassessment", "Tiotropium — extra doses are encouraged during acute attacks", "Ipratropium — frequent use proves long-term control is excellent", "Levalbuterol — rising use means inhaled steroids should be stopped", "Umeclidinium/Vilanterol — more frequent use is the main rescue strategy"],
        answer: "Albuterol — increasing use can signal worsening asthma control and need for reassessment",
        explanation: "Increasing albuterol use can be a marker of deteriorating asthma control and should prompt reassessment of therapy, often including anti-inflammatory management.",
        objective: .monitoring,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "worsening-control"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_035",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which option correctly matches the bronchodilator to its most testable role?",
        options: ["Albuterol — rapid rescue bronchodilator", "Tiotropium — first choice for immediate asthma relief", "Ipratropium — inhaled corticosteroid controller", "Umeclidinium/Vilanterol — asthma rescue SABA", "Levalbuterol — once-daily LAMA maintenance"],
        answer: "Albuterol — rapid rescue bronchodilator",
        explanation: "Albuterol is the rapid rescue bronchodilator in this subsection. The other pairings incorrectly assign maintenance or controller roles.",
        objective: .mixedReview,
        relatedDrugIds: ["d120", "d123"],
        tags: ["7b", "comparison", "rescue-vs-maintenance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_036",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which answer choice correctly matches the drug to a high-yield teaching pearl?",
        options: ["Tiotropium — once-daily LAMA maintenance inhaler", "Ipratropium — long-acting muscarinic antagonist", "Levalbuterol — dual bronchodilator for COPD", "Albuterol — COPD-only LAMA/LABA combination", "Umeclidinium/Vilanterol — R-enantiomer rescue SABA"],
        answer: "Tiotropium — once-daily LAMA maintenance inhaler",
        explanation: "Tiotropium is the once-daily LAMA maintenance inhaler. The other choices mix up class or indication.",
        objective: .mixedReview,
        relatedDrugIds: ["d123"],
        tags: ["7b", "comparison", "tiotropium-role"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_037",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which inhaler below provides maintenance bronchodilation without containing any beta-agonist component?",
        options: ["Tiotropium", "Albuterol", "Levalbuterol", "Umeclidinium/Vilanterol", "Budesonide/Formoterol"],
        answer: "Tiotropium",
        explanation: "Tiotropium is a pure anticholinergic LAMA and contains no beta-agonist component. Anoro and Symbicort both include LABAs.",
        objective: .classId,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "no-beta-agonist"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_038",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which medication contains both an anticholinergic bronchodilator and a beta2 agonist in the same device?",
        options: ["Umeclidinium/Vilanterol", "Tiotropium", "Ipratropium", "Albuterol", "Levalbuterol"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Umeclidinium/vilanterol combines a LAMA with a LABA, so it provides dual bronchodilator mechanisms in one inhaler.",
        objective: .classId,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "dual-mechanism"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_039",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A question asks for the bronchodilator most pharmacologically similar to albuterol because it is also a short-acting beta2 agonist rescue inhaler. Which answer is best?",
        options: ["Levalbuterol", "Ipratropium", "Tiotropium", "Umeclidinium/Vilanterol", "Montelukast"],
        answer: "Levalbuterol",
        explanation: "Levalbuterol is the best match because both albuterol and levalbuterol are SABAs used for rescue bronchodilation.",
        objective: .mixedReview,
        relatedDrugIds: ["d121", "d120"],
        tags: ["7b", "comparison", "levalbuterol-vs-albuterol"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_040",
        subsectionId: "7b",
        difficulty: .hard,
        question: "A teen with asthma asks to use a family member’s COPD inhaler during sudden chest tightness. Which drug from this subsection is the worst choice because it is not indicated for asthma and is not for rescue treatment?",
        options: ["Umeclidinium/Vilanterol", "Albuterol", "Levalbuterol", "Budesonide/Formoterol", "Montelukast"],
        answer: "Umeclidinium/Vilanterol",
        explanation: "Umeclidinium/vilanterol is a COPD maintenance LAMA/LABA inhaler. It is not indicated for asthma and is not a rescue inhaler.",
        objective: .contraindication,
        relatedDrugIds: ["d124"],
        tags: ["7b", "anoro", "asthma-vs-copd"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_041",
        subsectionId: "7b",
        difficulty: .medium,
        question: "An older patient with COPD is using albuterol only as needed but now needs a longer-acting daily maintenance bronchodilator from this subsection. Which single-agent option is the best fit?",
        options: ["Tiotropium", "Ipratropium", "Levalbuterol", "Montelukast", "Fluticasone (inhaled)"],
        answer: "Tiotropium",
        explanation: "Tiotropium is the single-agent long-acting maintenance bronchodilator in this subsection. Ipratropium is shorter acting, and albuterol/levalbuterol are rescue agents.",
        objective: .indication,
        relatedDrugIds: ["d123"],
        tags: ["7b", "tiotropium", "copd-maintenance"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_042",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which medication should come to mind when the exam clue is “short-acting anticholinergic bronchodilator used mainly in COPD questions” rather than “first-line SABA rescue inhaler”?",
        options: ["Ipratropium", "Albuterol", "Levalbuterol", "Tiotropium", "Umeclidinium/Vilanterol"],
        answer: "Ipratropium",
        explanation: "Ipratropium is the short-acting anticholinergic bronchodilator. It contrasts with albuterol and levalbuterol, which are beta2 agonist rescue inhalers.",
        objective: .indication,
        relatedDrugIds: ["d122"],
        tags: ["7b", "ipratropium", "short-acting-anticholinergic"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_043",
        subsectionId: "7b",
        difficulty: .medium,
        question: "Which inhaler from this subsection is most strongly associated with the phrase “first-line rescue inhaler” rather than “maintenance bronchodilator”?",
        options: ["Albuterol", "Tiotropium", "Ipratropium", "Umeclidinium/Vilanterol", "Montelukast"],
        answer: "Albuterol",
        explanation: "Albuterol is the classic first-line rescue inhaler. The others are maintenance bronchodilators or non-bronchodilator controllers.",
        objective: .indication,
        relatedDrugIds: ["d120"],
        tags: ["7b", "albuterol", "first-line-rescue"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_044",
        subsectionId: "7b",
        difficulty: .medium,
        question: "A stem says, “Choose the rescue inhaler that is not the usual racemic product but instead the R-enantiomer.” Which answer is correct?",
        options: ["Levalbuterol", "Albuterol", "Ipratropium", "Tiotropium", "Umeclidinium/Vilanterol"],
        answer: "Levalbuterol",
        explanation: "Levalbuterol is the R-enantiomer SABA. Albuterol is the more familiar racemic rescue inhaler.",
        objective: .pearl,
        relatedDrugIds: ["d121"],
        tags: ["7b", "levalbuterol", "r-enantiomer-pearl"],
        source: .curated
    ),

    .multipleChoice(
        id: "q7b_add_045",
        subsectionId: "7b",
        difficulty: .hard,
        question: "Which drug-pearl match is fully correct?",
        options: ["Umeclidinium/Vilanterol — COPD maintenance dual bronchodilator that is not rescue therapy", "Tiotropium — swallow the capsule to get the full dose", "Ipratropium — prototype pre-exercise SABA", "Levalbuterol — long-acting muscarinic antagonist", "Albuterol — COPD-only inhaler not indicated for exercise-induced bronchospasm"],
        answer: "Umeclidinium/Vilanterol — COPD maintenance dual bronchodilator that is not rescue therapy",
        explanation: "Umeclidinium/vilanterol is the COPD maintenance LAMA/LABA combination and is not rescue therapy. The other pairings intentionally mismatch drug and pearl.",
        objective: .mixedReview,
        relatedDrugIds: ["d124", "d123", "d120"],
        tags: ["7b", "comparison", "matching-pearl"],
        source: .curated
    )
    ]
}
