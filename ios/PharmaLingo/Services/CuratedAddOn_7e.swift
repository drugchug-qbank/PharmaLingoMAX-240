// PharmaLingo — Module 7e (Antihistamines & Nasal Steroids)
// Curated Add-On Question Pack (45 questions)
// IDs: q7e_add_001 ... q7e_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 7e exists, then append:
//
//    if bank["7e"] == nil { bank["7e"] = [] }
//    bank["7e"]?.append(contentsOf: Self.curatedAddOnQuestions_7e)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs:
//   d245 (Azelastine nasal / Astelin), d246 (Cetirizine / Zyrtec),
//   d247 (Diphenhydramine / Benadryl), d248 (Fexofenadine / Allegra),
//   d249 (Fluticasone nasal / Flonase), d250 (Levocetirizine / Xyzal),
//   d251 (Loratadine / Claritin), d252 (Loratadine/Pseudoephedrine / Claritin-D),
//   d253 (Mometasone nasal / Nasonex), d254 (Pseudoephedrine / Sudafed).
//
// Generated on: 2026-03-08

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_7e: [Question] = [
.multipleChoice(
    id: "q7e_add_001",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Astelin is an intranasal antihistamine used for allergic rhinitis and is often chosen when a patient wants local nasal treatment rather than another oral tablet. What is the generic name of Astelin?",
    options: ["Azelastine (nasal)", "Cetirizine", "Fluticasone (nasal)", "Loratadine", "Mometasone (nasal)"],
    answer: "Azelastine (nasal)",
    explanation: "Astelin is the brand name for intranasal azelastine. It is a nasal antihistamine, not a nasal steroid.",
    objective: .brandGeneric,
    relatedDrugIds: ["d245"],
    tags: ["7e", "azelastine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_002",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Azelastine nasal spray is an intranasal antihistamine that can help allergic rhinitis symptoms but may leave a bitter taste or cause some drowsiness. Which brand name matches azelastine (nasal)?",
    options: ["Astelin", "Flonase", "Nasonex", "Zyrtec", "Benadryl"],
    answer: "Astelin",
    explanation: "Azelastine (nasal) is sold as Astelin. That pairing helps separate it from Flonase and Nasonex, which are intranasal corticosteroids.",
    objective: .genericBrand,
    relatedDrugIds: ["d245"],
    tags: ["7e", "azelastine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_003",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Zyrtec is a second-generation antihistamine commonly used for allergic rhinitis and urticaria when a patient wants a once-daily oral option. What is the generic name of Zyrtec?",
    options: ["Cetirizine", "Levocetirizine", "Loratadine", "Fexofenadine", "Diphenhydramine"],
    answer: "Cetirizine",
    explanation: "Zyrtec is the brand name for cetirizine. Cetirizine is second generation, although some patients still notice mild drowsiness.",
    objective: .brandGeneric,
    relatedDrugIds: ["d246"],
    tags: ["7e", "cetirizine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_004",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Cetirizine is a second-generation antihistamine that relieves sneezing, runny nose, and hives without the heavy anticholinergic burden of older allergy drugs. Which brand name matches cetirizine?",
    options: ["Zyrtec", "Xyzal", "Claritin", "Allegra", "Benadryl"],
    answer: "Zyrtec",
    explanation: "Cetirizine is marketed as Zyrtec. Students often compare Zyrtec with Xyzal because the two are closely related antihistamines.",
    objective: .genericBrand,
    relatedDrugIds: ["d246"],
    tags: ["7e", "cetirizine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_005",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Benadryl is the classic first-generation antihistamine that can treat allergic symptoms but is also famous for sedation and anticholinergic effects. What is the generic name of Benadryl?",
    options: ["Diphenhydramine", "Cetirizine", "Fexofenadine", "Loratadine", "Pseudoephedrine"],
    answer: "Diphenhydramine",
    explanation: "Benadryl is the brand name for diphenhydramine. Diphenhydramine is much more sedating than the newer second-generation antihistamines.",
    objective: .brandGeneric,
    relatedDrugIds: ["d247"],
    tags: ["7e", "diphenhydramine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_006",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Diphenhydramine is a first-generation antihistamine that students should associate with sedation, dry mouth, and motion-sickness or sleep-aid type stems. Which brand name matches diphenhydramine?",
    options: ["Benadryl", "Zyrtec", "Claritin", "Allegra", "Sudafed"],
    answer: "Benadryl",
    explanation: "Diphenhydramine is sold as Benadryl. In allergy comparisons, it is the old, strongly sedating option.",
    objective: .genericBrand,
    relatedDrugIds: ["d247"],
    tags: ["7e", "diphenhydramine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_007",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Allegra is a second-generation antihistamine often chosen when a patient wants daytime allergy relief with minimal sedation. What is the generic name of Allegra?",
    options: ["Fexofenadine", "Loratadine", "Levocetirizine", "Cetirizine", "Diphenhydramine"],
    answer: "Fexofenadine",
    explanation: "Allegra is the brand name for fexofenadine. It is commonly remembered as one of the least sedating oral antihistamines.",
    objective: .brandGeneric,
    relatedDrugIds: ["d248"],
    tags: ["7e", "fexofenadine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_008",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Fexofenadine is a second-generation antihistamine that is useful for allergic rhinitis and hives, but patients should avoid taking it with fruit juice. Which brand name matches fexofenadine?",
    options: ["Allegra", "Claritin", "Benadryl", "Astelin", "Sudafed"],
    answer: "Allegra",
    explanation: "Fexofenadine is marketed as Allegra. The fruit-juice counseling pearl is one reason this drug is easy to test.",
    objective: .genericBrand,
    relatedDrugIds: ["d248"],
    tags: ["7e", "fexofenadine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_009",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Flonase is an intranasal corticosteroid used as a controller-style option for allergic rhinitis, especially when nasal congestion is a major symptom. What is the generic name of Flonase?",
    options: ["Fluticasone (nasal)", "Mometasone (nasal)", "Azelastine (nasal)", "Loratadine", "Cetirizine"],
    answer: "Fluticasone (nasal)",
    explanation: "Flonase is the brand name for nasal fluticasone. Intranasal corticosteroids are among the most effective classes for allergic rhinitis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d249"],
    tags: ["7e", "fluticasone nasal", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_010",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Fluticasone nasal spray is an intranasal corticosteroid that helps reduce allergic inflammation and is used for ongoing rhinitis control rather than instant decongestion. Which brand name matches fluticasone (nasal)?",
    options: ["Flonase", "Nasonex", "Astelin", "Claritin", "Benadryl"],
    answer: "Flonase",
    explanation: "Fluticasone (nasal) is marketed as Flonase. It should be separated from Flovent, which is inhaled fluticasone for asthma.",
    objective: .genericBrand,
    relatedDrugIds: ["d249"],
    tags: ["7e", "fluticasone nasal", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_011",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Xyzal is a second-generation antihistamine often discussed as a close relative of cetirizine and used for allergic rhinitis or urticaria. What is the generic name of Xyzal?",
    options: ["Levocetirizine", "Cetirizine", "Fexofenadine", "Loratadine", "Diphenhydramine"],
    answer: "Levocetirizine",
    explanation: "Xyzal is the brand name for levocetirizine. Levocetirizine is the active enantiomer closely related to cetirizine.",
    objective: .brandGeneric,
    relatedDrugIds: ["d250"],
    tags: ["7e", "levocetirizine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_012",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Levocetirizine is a second-generation antihistamine used for allergic rhinitis and hives, but it still can cause some drowsiness and needs renal-dose awareness. Which brand name matches levocetirizine?",
    options: ["Xyzal", "Zyrtec", "Claritin", "Allegra", "Benadryl"],
    answer: "Xyzal",
    explanation: "Levocetirizine is sold as Xyzal. It is commonly tested next to cetirizine because the two are so closely linked.",
    objective: .genericBrand,
    relatedDrugIds: ["d250"],
    tags: ["7e", "levocetirizine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_013",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Claritin is a second-generation antihistamine commonly chosen for daytime allergy symptoms because it is much less sedating than first-generation options. What is the generic name of Claritin?",
    options: ["Loratadine", "Fexofenadine", "Cetirizine", "Levocetirizine", "Diphenhydramine"],
    answer: "Loratadine",
    explanation: "Claritin is the brand name for loratadine. It is one of the classic non-drowsy daytime allergy options.",
    objective: .brandGeneric,
    relatedDrugIds: ["d251"],
    tags: ["7e", "loratadine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_014",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Loratadine is a second-generation antihistamine used for sneezing, runny nose, and itchy watery eyes without the strong sedation seen with diphenhydramine. Which brand name matches loratadine?",
    options: ["Claritin", "Allegra", "Zyrtec", "Benadryl", "Sudafed"],
    answer: "Claritin",
    explanation: "Loratadine is marketed as Claritin. It is one of the best-known OTC daytime antihistamines.",
    objective: .genericBrand,
    relatedDrugIds: ["d251"],
    tags: ["7e", "loratadine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_015",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Claritin-D combines an antihistamine with a decongestant, so it is more likely to show up when allergy symptoms include nasal congestion. What is the generic name of Claritin-D?",
    options: ["Loratadine/Pseudoephedrine", "Loratadine", "Pseudoephedrine", "Cetirizine", "Fexofenadine"],
    answer: "Loratadine/Pseudoephedrine",
    explanation: "Claritin-D is the combination of loratadine plus pseudoephedrine. The pseudoephedrine component is what adds the decongestant effect and stimulant-like cautions.",
    objective: .brandGeneric,
    relatedDrugIds: ["d252"],
    tags: ["7e", "loratadine/pseudoephedrine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_016",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Loratadine/pseudoephedrine is the combination product that pairs a second-generation antihistamine with a decongestant for patients whose allergies come with significant nasal stuffiness. Which brand name matches loratadine/pseudoephedrine?",
    options: ["Claritin-D", "Claritin", "Sudafed", "Allegra", "Zyrtec"],
    answer: "Claritin-D",
    explanation: "Loratadine/pseudoephedrine is marketed as Claritin-D. The “D” signals the decongestant component.",
    objective: .genericBrand,
    relatedDrugIds: ["d252"],
    tags: ["7e", "loratadine/pseudoephedrine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_017",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Nasonex is an intranasal corticosteroid used for allergic rhinitis and also appears in stems involving nasal polyps. What is the generic name of Nasonex?",
    options: ["Mometasone (nasal)", "Fluticasone (nasal)", "Azelastine (nasal)", "Cetirizine", "Pseudoephedrine"],
    answer: "Mometasone (nasal)",
    explanation: "Nasonex is the brand name for mometasone nasal spray. Like other intranasal steroids, it treats local inflammation rather than acting as an oral antihistamine.",
    objective: .brandGeneric,
    relatedDrugIds: ["d253"],
    tags: ["7e", "mometasone nasal", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_018",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Mometasone nasal spray is an intranasal corticosteroid that can be used for allergic rhinitis and is also worth remembering for the nasal polyps pearl. Which brand name matches mometasone (nasal)?",
    options: ["Nasonex", "Flonase", "Astelin", "Claritin-D", "Benadryl"],
    answer: "Nasonex",
    explanation: "Mometasone (nasal) is sold as Nasonex. Nasonex and Flonase belong to the same broad intranasal steroid class.",
    objective: .genericBrand,
    relatedDrugIds: ["d253"],
    tags: ["7e", "mometasone nasal", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_019",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Sudafed is a decongestant students should associate with nasal stuffiness, stimulant-like side effects, and blood pressure caution rather than histamine blockade. What is the generic name of Sudafed?",
    options: ["Pseudoephedrine", "Loratadine", "Diphenhydramine", "Cetirizine", "Azelastine (nasal)"],
    answer: "Pseudoephedrine",
    explanation: "Sudafed is the brand name for pseudoephedrine. Pseudoephedrine is a decongestant, not an antihistamine.",
    objective: .brandGeneric,
    relatedDrugIds: ["d254"],
    tags: ["7e", "pseudoephedrine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_020",
    subsectionId: "7e",
    difficulty: .easy,
    question: "Pseudoephedrine is the oral decongestant used when congestion is the dominant symptom, but it can worsen insomnia, tachycardia, and hypertension. Which brand name matches pseudoephedrine?",
    options: ["Sudafed", "Claritin", "Benadryl", "Allegra", "Nasonex"],
    answer: "Sudafed",
    explanation: "Pseudoephedrine is marketed as Sudafed. It is also the “D” component in products such as Claritin-D.",
    objective: .genericBrand,
    relatedDrugIds: ["d254"],
    tags: ["7e", "pseudoephedrine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_021",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A patient wants local allergy treatment sprayed into the nose but does not want an intranasal steroid. Which class best describes azelastine (nasal)?",
    options: ["Intranasal antihistamine", "Intranasal corticosteroid", "Oral decongestant", "First-generation antihistamine", "Leukotriene receptor antagonist"],
    answer: "Intranasal antihistamine",
    explanation: "Azelastine (nasal) is an intranasal antihistamine. It treats allergy symptoms locally and is different from steroid sprays such as fluticasone and mometasone.",
    objective: .classId,
    relatedDrugIds: ["d245"],
    tags: ["7e", "azelastine", "class"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_022",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A student sees diphenhydramine in a stem with sedation, dry mouth, and possible motion-sickness use. How should diphenhydramine be classified?",
    options: ["First-generation antihistamine", "Second-generation antihistamine", "Decongestant", "Intranasal corticosteroid", "Intranasal antihistamine"],
    answer: "First-generation antihistamine",
    explanation: "Diphenhydramine is a first-generation antihistamine. Its central sedation and anticholinergic effects are why it stands apart from the newer allergy agents.",
    objective: .classId,
    relatedDrugIds: ["d247"],
    tags: ["7e", "diphenhydramine", "class"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_023",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A patient wants an oral allergy medication with minimal sedation for daytime use. How should fexofenadine be classified?",
    options: ["Second-generation antihistamine", "First-generation antihistamine", "Decongestant", "Intranasal corticosteroid", "Antihistamine/decongestant combination"],
    answer: "Second-generation antihistamine",
    explanation: "Fexofenadine is a second-generation antihistamine. This class is generally preferred over first-generation agents for routine daytime allergic rhinitis.",
    objective: .classId,
    relatedDrugIds: ["d248"],
    tags: ["7e", "fexofenadine", "class"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_024",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Flonase helps allergic rhinitis by reducing local nasal inflammation rather than by acting as a stimulant or directly blocking histamine after oral absorption. How should fluticasone (nasal) be classified?",
    options: ["Intranasal corticosteroid", "Intranasal antihistamine", "Second-generation antihistamine", "Decongestant", "Antihistamine/decongestant combination"],
    answer: "Intranasal corticosteroid",
    explanation: "Fluticasone (nasal) is an intranasal corticosteroid. Intranasal steroids are among the most effective medication classes for allergic rhinitis.",
    objective: .classId,
    relatedDrugIds: ["d249"],
    tags: ["7e", "fluticasone nasal", "class"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_025",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Claritin-D is often chosen when sneezing and rhinorrhea come with prominent congestion. How should loratadine/pseudoephedrine be classified?",
    options: ["Antihistamine/decongestant combination", "Second-generation antihistamine", "Intranasal corticosteroid", "Intranasal antihistamine", "First-generation antihistamine"],
    answer: "Antihistamine/decongestant combination",
    explanation: "Loratadine/pseudoephedrine combines a second-generation antihistamine with a sympathomimetic decongestant. The combination is more stimulating than plain loratadine.",
    objective: .classId,
    relatedDrugIds: ["d252"],
    tags: ["7e", "loratadine/pseudoephedrine", "class"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_026",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Second-generation oral antihistamines like cetirizine, fexofenadine, levocetirizine, and loratadine improve allergic rhinitis primarily by doing what?",
    options: ["Blocking peripheral H1 histamine receptors", "Stimulating alpha receptors in nasal blood vessels", "Inhibiting leukotriene synthesis", "Reducing nasal corticosteroid receptor breakdown", "Blocking IgE from binding mast cells directly"],
    answer: "Blocking peripheral H1 histamine receptors",
    explanation: "Oral antihistamines mainly work by blocking H1 receptors. That is why they help sneezing, itching, and rhinorrhea more than severe congestion.",
    objective: .moa,
    relatedDrugIds: ["d246", "d248", "d251", "d250"],
    tags: ["7e", "antihistamines", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_027",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Pseudoephedrine is used when congestion is the key complaint because its main effect is best described as which of the following?",
    options: ["Sympathomimetic vasoconstriction that shrinks swollen nasal mucosa", "Peripheral H1 blockade that reduces itching", "Local steroid action that suppresses nasal inflammation", "Muscarinic blockade that dries secretions", "IgE neutralization in allergic pathways"],
    answer: "Sympathomimetic vasoconstriction that shrinks swollen nasal mucosa",
    explanation: "Pseudoephedrine is a decongestant with sympathomimetic vasoconstrictive effects. That mechanism explains both its benefit for congestion and its insomnia or blood-pressure cautions.",
    objective: .moa,
    relatedDrugIds: ["d254", "d252"],
    tags: ["7e", "pseudoephedrine", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_028",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Fluticasone and mometasone nasal sprays are high-yield because they treat allergic rhinitis through what broad mechanism?",
    options: ["Local corticosteroid anti-inflammatory effect in nasal mucosa", "Direct bronchodilation of airway smooth muscle", "Central sedation to reduce perception of symptoms", "Sympathomimetic stimulation of beta receptors", "Direct mast-cell degranulation blockade used acutely"],
    answer: "Local corticosteroid anti-inflammatory effect in nasal mucosa",
    explanation: "Intranasal corticosteroids work by reducing local inflammatory signaling in nasal tissue. They are controller-style therapy rather than instant stimulants or sedatives.",
    objective: .moa,
    relatedDrugIds: ["d249", "d253"],
    tags: ["7e", "nasal steroids", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_029",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A student wants to remember why levocetirizine and cetirizine are often taught together. Which pearl is correct?",
    options: ["Levocetirizine is the active enantiomer closely related to cetirizine", "Levocetirizine is a first-generation antihistamine while cetirizine is second generation", "Levocetirizine is a decongestant combination product while cetirizine is plain antihistamine", "Levocetirizine is a nasal steroid while cetirizine is oral", "Levocetirizine is only used for nasal polyps while cetirizine is only used for hives"],
    answer: "Levocetirizine is the active enantiomer closely related to cetirizine",
    explanation: "Levocetirizine is commonly remembered as the active enantiomer related to cetirizine. That is why the two drugs are often compared side-by-side.",
    objective: .pearl,
    relatedDrugIds: ["d250", "d246"],
    tags: ["7e", "levocetirizine", "pearl"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_030",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A patient has persistent seasonal allergic rhinitis with prominent nasal congestion day after day. Which class from this subsection is generally the most effective medication class for ongoing allergic rhinitis control?",
    options: ["Intranasal corticosteroids such as fluticasone or mometasone", "First-generation antihistamines such as diphenhydramine", "Pure decongestants such as pseudoephedrine alone", "Intranasal antihistamines only", "No medication class has a consistent advantage"],
    answer: "Intranasal corticosteroids such as fluticasone or mometasone",
    explanation: "Intranasal corticosteroids are classically the most effective medication class for allergic rhinitis, especially when congestion is prominent and symptoms are persistent.",
    objective: .indication,
    relatedDrugIds: ["d249", "d253"],
    tags: ["7e", "nasal steroids", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_031",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A patient says, “My main allergy problem is that my nose is stuffed shut.” Which drug from this subsection most directly targets congestion rather than histamine-mediated itching and sneezing?",
    options: ["Pseudoephedrine", "Loratadine", "Cetirizine", "Fexofenadine", "Diphenhydramine"],
    answer: "Pseudoephedrine",
    explanation: "Pseudoephedrine is the decongestant in this subsection. It is used when congestion is the major symptom, though its stimulant-like adverse effects limit use in some patients.",
    objective: .indication,
    relatedDrugIds: ["d254"],
    tags: ["7e", "pseudoephedrine", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_032",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Which product is most appropriate when a patient needs both an oral second-generation antihistamine and a built-in decongestant for allergic rhinitis with congestion?",
    options: ["Loratadine/Pseudoephedrine", "Loratadine", "Fexofenadine", "Diphenhydramine", "Mometasone (nasal)"],
    answer: "Loratadine/Pseudoephedrine",
    explanation: "Loratadine/pseudoephedrine combines an oral antihistamine with a decongestant. It is more targeted to allergy-plus-congestion stems than plain loratadine alone.",
    objective: .indication,
    relatedDrugIds: ["d252", "d251", "d254"],
    tags: ["7e", "claritin-d", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_033",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Most drugs in this subsection are used for allergic rhinitis, but one intranasal steroid is also worth remembering for the nasal polyps pearl. Which drug is it?",
    options: ["Mometasone (nasal)", "Cetirizine", "Pseudoephedrine", "Diphenhydramine", "Fexofenadine"],
    answer: "Mometasone (nasal)",
    explanation: "Mometasone (nasal) is the intranasal corticosteroid in this subsection that is also associated with nasal polyps.",
    objective: .indication,
    relatedDrugIds: ["d253"],
    tags: ["7e", "mometasone nasal", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_034",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A stem mentions allergy symptoms plus a desire for a medicine that can also be sedating enough to make sleep more likely. Which drug from this subsection best fits that description?",
    options: ["Diphenhydramine", "Fexofenadine", "Loratadine", "Fluticasone (nasal)", "Pseudoephedrine"],
    answer: "Diphenhydramine",
    explanation: "Diphenhydramine is strongly sedating compared with the second-generation antihistamines. That sedation is why it can appear in insomnia or nighttime allergy stems.",
    objective: .indication,
    relatedDrugIds: ["d247"],
    tags: ["7e", "diphenhydramine", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_035",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A patient prefers a nasal spray but does not want a steroid. Which drug from this subsection best matches that request?",
    options: ["Azelastine (nasal)", "Fluticasone (nasal)", "Mometasone (nasal)", "Pseudoephedrine", "Loratadine"],
    answer: "Azelastine (nasal)",
    explanation: "Azelastine is the intranasal antihistamine option. Fluticasone and mometasone are both intranasal corticosteroids instead.",
    objective: .indication,
    relatedDrugIds: ["d245", "d249", "d253"],
    tags: ["7e", "azelastine", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_036",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A truck driver needs daytime allergy relief and specifically wants the option in this subsection most associated with minimal sedation. Which drug is the best fit?",
    options: ["Fexofenadine", "Diphenhydramine", "Cetirizine", "Levocetirizine", "Pseudoephedrine"],
    answer: "Fexofenadine",
    explanation: "Fexofenadine is commonly remembered as one of the least sedating antihistamines, making it a classic daytime-use pearl.",
    objective: .indication,
    relatedDrugIds: ["d248"],
    tags: ["7e", "fexofenadine", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_037",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A patient starts Astelin nasal spray and says, “This leaves a weird taste in my mouth after I use it.” Which adverse effect is classically associated with azelastine nasal spray?",
    options: ["Bitter taste", "Tendon rupture", "Severe hypoglycemia", "Constipation from anticholinergic overload", "Photosensitivity"],
    answer: "Bitter taste",
    explanation: "Azelastine nasal spray is famous for causing a bitter taste. Somnolence can also occur, which is why it is more than just a “local only” medication pearl.",
    objective: .adverseEffect,
    relatedDrugIds: ["d245"],
    tags: ["7e", "azelastine", "adverse"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_038",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Which adverse-effect profile is most typical of diphenhydramine and helps explain why it is usually avoided as a routine daytime allergy option in older adults?",
    options: ["Sedation and anticholinergic effects such as dry mouth", "Epistaxis and nasal ulceration", "Tachycardia from alpha agonism only", "Injection-site reactions", "Myelosuppression"],
    answer: "Sedation and anticholinergic effects such as dry mouth",
    explanation: "Diphenhydramine is a first-generation antihistamine with sedating and anticholinergic effects. Those properties make it much less desirable in many older patients.",
    objective: .adverseEffect,
    relatedDrugIds: ["d247"],
    tags: ["7e", "diphenhydramine", "adverse"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_039",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Which counseling point is especially important for fexofenadine because it can reduce drug absorption and make the antihistamine work less well?",
    options: ["Avoid taking it with fruit juice", "Avoid all dairy products permanently", "Take it only at bedtime", "Do not use it with intranasal steroids", "Always crush the tablet before use"],
    answer: "Avoid taking it with fruit juice",
    explanation: "Fruit juices can reduce fexofenadine absorption, so patients are counseled not to take it with juice. This is one of the most testable fexofenadine pearls.",
    objective: .interaction,
    relatedDrugIds: ["d248"],
    tags: ["7e", "fexofenadine", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_040",
    subsectionId: "7e",
    difficulty: .medium,
    question: "A patient using Flonase for allergic rhinitis reports small nosebleeds after repeated use. Which adverse effect is classically associated with intranasal corticosteroids such as fluticasone and mometasone?",
    options: ["Epistaxis and local nasal irritation", "Severe sedation and confusion", "Urinary retention from anticholinergic activity", "Marked rebound hypertension", "Ototoxicity"],
    answer: "Epistaxis and local nasal irritation",
    explanation: "Intranasal corticosteroids commonly cause local nasal effects such as irritation and epistaxis. Good spray technique helps reduce irritation of the nasal septum.",
    objective: .adverseEffect,
    relatedDrugIds: ["d249", "d253"],
    tags: ["7e", "nasal steroids", "adverse"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_041",
    subsectionId: "7e",
    difficulty: .medium,
    question: "Which patient should make you most cautious about recommending pseudoephedrine or products like Claritin-D?",
    options: ["A patient with uncontrolled hypertension and troublesome palpitations", "A patient with urticaria and daytime itch", "A patient with seasonal sneezing but normal blood pressure", "A patient who dislikes nasal sprays", "A patient who wants a less sedating oral antihistamine"],
    answer: "A patient with uncontrolled hypertension and troublesome palpitations",
    explanation: "Pseudoephedrine can raise heart rate and blood pressure, so it is a poor fit for patients with uncontrolled hypertension or stimulant-sensitive palpitations.",
    objective: .contraindication,
    relatedDrugIds: ["d254", "d252"],
    tags: ["7e", "pseudoephedrine", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_042",
    subsectionId: "7e",
    difficulty: .hard,
    question: "A patient taking an MAOI asks for a decongestant because allergy season has made nasal congestion miserable. Which drug from this subsection should be specifically avoided because of the decongestant interaction concern?",
    options: ["Pseudoephedrine", "Cetirizine", "Loratadine", "Fluticasone (nasal)", "Mometasone (nasal)"],
    answer: "Pseudoephedrine",
    explanation: "Pseudoephedrine is the sympathomimetic decongestant in this subsection. MAOI use is a high-yield reason to avoid decongestant-containing products.",
    objective: .contraindication,
    relatedDrugIds: ["d254", "d252"],
    tags: ["7e", "pseudoephedrine", "maoi"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_043",
    subsectionId: "7e",
    difficulty: .hard,
    question: "Which oral antihistamine in this subsection deserves extra attention to renal function because both dose and dosing frequency may need reduction when kidney function declines?",
    options: ["Levocetirizine", "Pseudoephedrine", "Diphenhydramine", "Fluticasone (nasal)", "Azelastine (nasal)"],
    answer: "Levocetirizine",
    explanation: "Levocetirizine requires renal-dose adjustment. That makes it a useful comparison point against other OTC allergy options that are usually discussed more for sedation than dosing intervals.",
    objective: .monitoring,
    relatedDrugIds: ["d250"],
    tags: ["7e", "levocetirizine", "monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_044",
    subsectionId: "7e",
    difficulty: .hard,
    question: "A student asks why intranasal corticosteroids sometimes seem “weaker” on day 1 than an oral decongestant. Which pearl best explains this difference?",
    options: ["They are controller-style anti-inflammatory therapies and may take several days of consistent use for fuller benefit", "They only work if combined with an oral antibiotic", "They are designed for instant vasoconstriction within minutes", "They are rescue drugs intended only for acute anaphylaxis", "They are first-generation antihistamines repackaged as sprays"],
    answer: "They are controller-style anti-inflammatory therapies and may take several days of consistent use for fuller benefit",
    explanation: "Intranasal steroids work best when used consistently. Their strength is sustained anti-inflammatory control, not the immediate stimulant-like decongestion seen with pseudoephedrine.",
    objective: .pearl,
    relatedDrugIds: ["d249", "d253"],
    tags: ["7e", "nasal steroids", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q7e_add_045",
    subsectionId: "7e",
    difficulty: .hard,
    question: "A patient wants allergy treatment that covers congestion well but is also worried about insomnia and elevated blood pressure. Which option best avoids the stimulant-like decongestant problem while still targeting allergic rhinitis with a high-yield effective class?",
    options: ["Fluticasone (nasal)", "Pseudoephedrine", "Loratadine/Pseudoephedrine", "Diphenhydramine", "Plain pseudoephedrine plus diphenhydramine"],
    answer: "Fluticasone (nasal)",
    explanation: "Fluticasone nasal spray avoids the stimulant effects of pseudoephedrine and belongs to the intranasal corticosteroid class, which is highly effective for allergic rhinitis control.",
    objective: .mixedReview,
    relatedDrugIds: ["d248", "d254", "d247", "d249"],
    tags: ["7e", "mixed-review", "allergy"],
    source: .curated
)
    ]
}
