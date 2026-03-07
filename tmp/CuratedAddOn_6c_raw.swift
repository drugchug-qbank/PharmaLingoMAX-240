// PharmaLingo — Module 6c (Macrolides, Fluoroquinolones, Tetracyclines)
// Curated Add-On Question Pack (45 questions)
// IDs: q6c_add_001 ... q6c_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 6c exists, then append:
//
//    if bank["6c"] == nil { bank["6c"] = [] }
//    bank["6c"]?.append(contentsOf: Self.curatedAddOnQuestions_6c)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs: d104 (Ciprofloxacin), d105 (Levofloxacin),
//   d106 (Azithromycin), d107 (Clarithromycin), d108 (Doxycycline).
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_6c: [Question] = [
.multipleChoice(
    id: "q6c_add_001",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Zithromax, often dispensed as a Z-Pack for short outpatient courses, is a macrolide students commonly associate with atypical respiratory coverage. What is the generic name of Zithromax?",
    options: ["Azithromycin", "Clarithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Azithromycin",
    explanation: "Zithromax is the brand name for azithromycin. The Z-Pack association is a useful anchor for remembering azithromycin specifically, not clarithromycin.",
    objective: .brandGeneric,
    relatedDrugIds: ["d106"],
    tags: ["6c", "azithromycin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_002",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Azithromycin is the once-daily macrolide best known for the classic Z-Pack teaching pearl and for common outpatient respiratory use. Which brand name matches azithromycin?",
    options: ["Zithromax/Z-Pack", "Biaxin", "Vibramycin", "Levaquin", "Cipro"],
    answer: "Zithromax/Z-Pack",
    explanation: "Azithromycin is sold as Zithromax, and the familiar short-course packaging is commonly called a Z-Pack.",
    objective: .genericBrand,
    relatedDrugIds: ["d106"],
    tags: ["6c", "azithromycin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_003",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Cipro is the classic oral fluoroquinolone students often connect with UTIs, some Pseudomonas coverage, and major interaction counseling. What is the generic name of Cipro?",
    options: ["Ciprofloxacin", "Levofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline"],
    answer: "Ciprofloxacin",
    explanation: "Cipro is the brand name for ciprofloxacin. It is the fluoroquinolone in this subsection most strongly linked to UTI and Pseudomonas teaching pearls.",
    objective: .brandGeneric,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_004",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Ciprofloxacin is the fluoroquinolone that often comes up for UTIs and for its high-yield tizanidine interaction. Which brand name matches ciprofloxacin?",
    options: ["Cipro", "Levaquin", "Zithromax/Z-Pack", "Biaxin", "Vibramycin"],
    answer: "Cipro",
    explanation: "Ciprofloxacin is sold as Cipro. Pairing Cipro with ciprofloxacin helps students separate it from Levaquin, the respiratory fluoroquinolone.",
    objective: .genericBrand,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_005",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Biaxin is the macrolide in this subsection that students often remember for H. pylori regimens and stronger drug-interaction risk than azithromycin. What is the generic name of Biaxin?",
    options: ["Clarithromycin", "Azithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Clarithromycin",
    explanation: "Biaxin is the brand name for clarithromycin. It is the H. pylori-associated macrolide and the one with especially important CYP-mediated interaction pearls.",
    objective: .brandGeneric,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_006",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Clarithromycin is the macrolide often tied to H. pylori therapy and to clinically important CYP3A4 interaction questions. Which brand name matches clarithromycin?",
    options: ["Biaxin", "Zithromax/Z-Pack", "Vibramycin", "Levaquin", "Cipro"],
    answer: "Biaxin",
    explanation: "Clarithromycin is sold as Biaxin. Remembering Biaxin helps keep clarithromycin separate from azithromycin, the Z-Pack macrolide.",
    objective: .genericBrand,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_007",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Vibramycin is the tetracycline in this subsection that is high yield for acne, Lyme disease, photosensitivity counseling, and esophageal irritation pearls. What is the generic name of Vibramycin?",
    options: ["Doxycycline", "Azithromycin", "Clarithromycin", "Levofloxacin", "Ciprofloxacin"],
    answer: "Doxycycline",
    explanation: "Vibramycin is the brand name for doxycycline. Its counseling pearls are especially memorable: sun sensitivity and taking the dose with plenty of water while staying upright.",
    objective: .brandGeneric,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_008",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Doxycycline is the -cycline drug in this subsection and is frequently tested for acne, chlamydia, Lyme disease, and sunlight counseling. Which brand name matches doxycycline?",
    options: ["Vibramycin", "Biaxin", "Zithromax/Z-Pack", "Cipro", "Levaquin"],
    answer: "Vibramycin",
    explanation: "Doxycycline is sold as Vibramycin. The -cycline suffix is a strong clue that you are looking at a tetracycline.",
    objective: .genericBrand,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_009",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Levaquin is the respiratory fluoroquinolone in this subsection and often appears in CAP questions plus major boxed-warning counseling. What is the generic name of Levaquin?",
    options: ["Levofloxacin", "Ciprofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline"],
    answer: "Levofloxacin",
    explanation: "Levaquin is the brand name for levofloxacin. Students often remember it as the respiratory fluoroquinolone.",
    objective: .brandGeneric,
    relatedDrugIds: ["d105"],
    tags: ["6c", "levofloxacin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_010",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Levofloxacin is the fluoroquinolone most often remembered for respiratory indications like community-acquired pneumonia. Which brand name matches levofloxacin?",
    options: ["Levaquin", "Cipro", "Biaxin", "Zithromax/Z-Pack", "Vibramycin"],
    answer: "Levaquin",
    explanation: "Levofloxacin is sold as Levaquin. Keeping the Levaquin = respiratory fluoroquinolone link helps distinguish it from Cipro.",
    objective: .genericBrand,
    relatedDrugIds: ["d105"],
    tags: ["6c", "levofloxacin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_011",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Azithromycin and clarithromycin are grouped together in this subsection for a reason. Which antibiotic class do they share?",
    options: ["Macrolides", "Fluoroquinolones", "Tetracyclines", "Sulfonamides", "Glycopeptides"],
    answer: "Macrolides",
    explanation: "Azithromycin and clarithromycin are macrolides. That shared class helps explain why both are associated with atypical respiratory coverage and QT-prolongation cautions.",
    objective: .classId,
    relatedDrugIds: ["d106", "d107"],
    tags: ["6c", "macrolide", "class"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_012",
    subsectionId: "6c",
    difficulty: .easy,
    question: "When a drug name ends in -floxacin, which antibiotic class should immediately come to mind?",
    options: ["Fluoroquinolone", "Macrolide", "Tetracycline", "Penicillin", "Cephalosporin"],
    answer: "Fluoroquinolone",
    explanation: "The -floxacin suffix is the classic clue for a fluoroquinolone. In this subsection, ciprofloxacin and levofloxacin both follow that rule.",
    objective: .suffixId,
    relatedDrugIds: ["d104", "d105"],
    tags: ["6c", "fluoroquinolone", "suffix"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_013",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Doxycycline is the only -cycline drug in this subsection. That suffix most strongly points to which antibiotic class?",
    options: ["Tetracycline", "Macrolide", "Fluoroquinolone", "Carbapenem", "Lincosamide"],
    answer: "Tetracycline",
    explanation: "The -cycline suffix points to the tetracycline class. Doxycycline is the tetracycline anchor drug in this subsection.",
    objective: .suffixId,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "suffix"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_014",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Macrolides like azithromycin and clarithromycin suppress bacterial protein synthesis. Which target best explains that mechanism?",
    options: ["50S ribosomal subunit", "30S ribosomal subunit", "DNA gyrase/topoisomerase IV", "Peptidoglycan cross-linking enzymes", "Folate synthesis enzymes"],
    answer: "50S ribosomal subunit",
    explanation: "Macrolides inhibit protein synthesis at the 50S ribosomal subunit. This is a classic mechanism distinction from tetracyclines, which act at 30S.",
    objective: .moa,
    relatedDrugIds: ["d106", "d107"],
    tags: ["6c", "macrolide", "50S", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_015",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Doxycycline is the tetracycline workhorse in this subsection. Its antibacterial effect comes from binding which target?",
    options: ["30S ribosomal subunit", "50S ribosomal subunit", "DNA gyrase/topoisomerase IV", "Bacterial cell wall transpeptidases", "Fungal ergosterol"],
    answer: "30S ribosomal subunit",
    explanation: "Doxycycline works by binding the 30S ribosomal subunit and impairing bacterial protein synthesis. That is the classic tetracycline mechanism.",
    objective: .moa,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "30S", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_016",
    subsectionId: "6c",
    difficulty: .medium,
    question: "The respiratory fluoroquinolone in this subsection interferes with bacterial DNA replication by inhibiting DNA gyrase and topoisomerase IV. Which drug fits that description?",
    options: ["Levofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline", "Amoxicillin"],
    answer: "Levofloxacin",
    explanation: "Levofloxacin is a fluoroquinolone, so it works through DNA gyrase/topoisomerase IV inhibition rather than ribosomal protein-synthesis blockade.",
    objective: .moa,
    relatedDrugIds: ["d105"],
    tags: ["6c", "levofloxacin", "dna-gyrase", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_017",
    subsectionId: "6c",
    difficulty: .medium,
    question: "A student wants the classic short-course outpatient antibiotic for community-acquired pneumonia with atypical coverage and immediately thinks of a Z-Pack. Which drug best fits that teaching pearl?",
    options: ["Azithromycin", "Clarithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Azithromycin",
    explanation: "Azithromycin is the classic Z-Pack macrolide associated with atypical respiratory coverage in outpatient CAP teaching scenarios.",
    objective: .indication,
    relatedDrugIds: ["d106"],
    tags: ["6c", "azithromycin", "cap", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_018",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Which drug from this subsection is most classically associated with H. pylori combination regimens?",
    options: ["Clarithromycin", "Azithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Clarithromycin",
    explanation: "Clarithromycin is the macrolide most strongly linked to H. pylori regimens. That association is far stronger than for azithromycin or doxycycline.",
    objective: .indication,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "h-pylori", "indication"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_019",
    subsectionId: "6c",
    difficulty: .medium,
    question: "A drug in this subsection is especially high yield for acne, Lyme disease, and many tick-borne infections. Which one is it?",
    options: ["Doxycycline", "Azithromycin", "Clarithromycin", "Levofloxacin", "Ciprofloxacin"],
    answer: "Doxycycline",
    explanation: "Doxycycline is the tetracycline students commonly connect with acne and tick-borne disease treatment, including Lyme disease.",
    objective: .indication,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "lyme", "acne"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_020",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Which drug in this subsection is the classic oral fluoroquinolone linked to UTIs and Pseudomonas coverage rather than the “respiratory fluoroquinolone” label?",
    options: ["Ciprofloxacin", "Levofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline"],
    answer: "Ciprofloxacin",
    explanation: "Ciprofloxacin is the classic UTI/Pseudomonas-associated fluoroquinolone. Levofloxacin is the one more often remembered for respiratory use.",
    objective: .indication,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "uti", "pseudomonas"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_021",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Which drug in this subsection is most commonly remembered as the “respiratory fluoroquinolone” and is often chosen when a fluoroquinolone is needed for community-acquired pneumonia?",
    options: ["Levofloxacin", "Ciprofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline"],
    answer: "Levofloxacin",
    explanation: "Levofloxacin is the respiratory fluoroquinolone. That label helps separate it from ciprofloxacin, which is more strongly associated with UTIs and Pseudomonas.",
    objective: .indication,
    relatedDrugIds: ["d105"],
    tags: ["6c", "levofloxacin", "respiratory-fluoroquinolone"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_022",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Both macrolides in this subsection share an important cardiac caution. Which pair is most associated with QT prolongation risk?",
    options: ["Azithromycin and clarithromycin", "Ciprofloxacin and levofloxacin", "Doxycycline and azithromycin", "Clarithromycin and doxycycline", "Azithromycin and ciprofloxacin"],
    answer: "Azithromycin and clarithromycin",
    explanation: "Azithromycin and clarithromycin are the two macrolides in this subsection, and both carry high-yield QT-prolongation cautions.",
    objective: .adverseEffect,
    relatedDrugIds: ["d106", "d107"],
    tags: ["6c", "macrolide", "qt"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_023",
    subsectionId: "6c",
    difficulty: .medium,
    question: "A patient treated for Lyme disease is warned that the medication can cause an exaggerated sunburn reaction. Which drug was most likely prescribed?",
    options: ["Doxycycline", "Azithromycin", "Clarithromycin", "Ciprofloxacin", "Levofloxacin"],
    answer: "Doxycycline",
    explanation: "Doxycycline is classically associated with photosensitivity. Sun protection counseling is one of its most testable pearls.",
    objective: .adverseEffect,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "photosensitivity"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_024",
    subsectionId: "6c",
    difficulty: .medium,
    question: "A patient says, “This antibiotic feels like it burns in my chest when I take it before bed.” Which drug from this subsection is the classic culprit because of esophageal irritation and ulceration risk?",
    options: ["Doxycycline", "Azithromycin", "Clarithromycin", "Levofloxacin", "Ciprofloxacin"],
    answer: "Doxycycline",
    explanation: "Doxycycline is well known for esophageal irritation if it is taken with too little water or right before lying down.",
    objective: .adverseEffect,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "esophagitis"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_025",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Which antibiotic in this subsection is generally avoided during tooth development because tetracyclines can discolor teeth and affect bone growth?",
    options: ["Doxycycline", "Azithromycin", "Clarithromycin", "Levofloxacin", "Ciprofloxacin"],
    answer: "Doxycycline",
    explanation: "Doxycycline is a tetracycline, and tetracyclines are classically avoided during tooth development because of tooth discoloration and effects on bone growth.",
    objective: .contraindication,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "children", "pregnancy"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_026",
    subsectionId: "6c",
    difficulty: .medium,
    question: "A patient taking ciprofloxacin calls because of sudden Achilles pain. Which serious fluoroquinolone toxicity should be on your radar first?",
    options: ["Tendinitis/tendon rupture", "Red-man syndrome", "Gingival hyperplasia", "Ototoxicity", "Urine discoloration"],
    answer: "Tendinitis/tendon rupture",
    explanation: "Fluoroquinolones such as ciprofloxacin carry boxed warnings for tendinitis and tendon rupture. New tendon pain should never be brushed off as trivial.",
    objective: .adverseEffect,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "tendon-rupture", "boxed-warning"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_027",
    subsectionId: "6c",
    difficulty: .hard,
    question: "A patient with myasthenia gravis is accidentally prescribed the respiratory fluoroquinolone from this subsection. Which drug is that?",
    options: ["Levofloxacin", "Ciprofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline"],
    answer: "Levofloxacin",
    explanation: "Levofloxacin is the respiratory fluoroquinolone, and fluoroquinolones can exacerbate muscle weakness in patients with myasthenia gravis.",
    objective: .contraindication,
    relatedDrugIds: ["d105"],
    tags: ["6c", "levofloxacin", "myasthenia-gravis"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_028",
    subsectionId: "6c",
    difficulty: .hard,
    question: "Tizanidine is contraindicated with which antibiotic in this subsection because the antibiotic acts as a potent CYP1A2 inhibitor and can cause profound hypotension and sedation?",
    options: ["Ciprofloxacin", "Levofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline"],
    answer: "Ciprofloxacin",
    explanation: "Ciprofloxacin is the classic antibiotic interaction to remember with tizanidine. This combination is contraindicated because ciprofloxacin markedly raises tizanidine exposure.",
    objective: .interaction,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "tizanidine", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_029",
    subsectionId: "6c",
    difficulty: .hard,
    question: "A patient takes ciprofloxacin with magnesium/aluminum antacids and an iron supplement every morning. Which counseling point is most accurate?",
    options: ["Take ciprofloxacin at least 2 hours before or 6 hours after those products", "Take ciprofloxacin and the supplements together with breakfast to improve absorption", "Only dairy matters; antacids and iron do not affect ciprofloxacin", "Take the antacid 6 hours before and the iron 6 hours after, but no other spacing matters", "Crush ciprofloxacin and mix it into yogurt to overcome the interaction"],
    answer: "Take ciprofloxacin at least 2 hours before or 6 hours after those products",
    explanation: "Ciprofloxacin chelates with multivalent cations. Patients should separate it from products containing magnesium, aluminum, calcium, iron, or zinc so absorption is not impaired.",
    objective: .interaction,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "chelation", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_030",
    subsectionId: "6c",
    difficulty: .hard,
    question: "A patient on simvastatin starts triple therapy for H. pylori. Which antibiotic from this subsection deserves the most interaction caution because it strongly inhibits CYP3A4?",
    options: ["Clarithromycin", "Azithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Clarithromycin",
    explanation: "Clarithromycin is the macrolide in this subsection most strongly associated with major CYP3A4 interaction questions. That makes it much more interaction-prone than azithromycin.",
    objective: .interaction,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "cyp3a4", "interaction"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_031",
    subsectionId: "6c",
    difficulty: .hard,
    question: "Which macrolide in this subsection has a specific contraindication with colchicine in patients who have renal or hepatic impairment?",
    options: ["Clarithromycin", "Azithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Clarithromycin",
    explanation: "Clarithromycin has a high-yield colchicine interaction warning. In patients with renal or hepatic impairment, the combination is contraindicated because colchicine toxicity can be severe.",
    objective: .contraindication,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "colchicine", "contraindication"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_032",
    subsectionId: "6c",
    difficulty: .hard,
    question: "A patient previously developed cholestatic jaundice while taking Biaxin. Which antibiotic should now be avoided because that history is a listed contraindication?",
    options: ["Clarithromycin", "Azithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Clarithromycin",
    explanation: "A history of cholestatic jaundice or hepatic dysfunction associated with prior clarithromycin use is a contraindication to clarithromycin.",
    objective: .contraindication,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "hepatic-dysfunction"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_033",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Which drug in this subsection is most associated with dysgeusia or a “metallic/taste-perversion” complaint?",
    options: ["Clarithromycin", "Azithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Clarithromycin",
    explanation: "Taste perversion or metallic taste is a classic clarithromycin pearl and can help students distinguish it from azithromycin.",
    objective: .adverseEffect,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "dysgeusia"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_034",
    subsectionId: "6c",
    difficulty: .medium,
    question: "Which drug in this subsection is most strongly associated with the familiar adult 5-day “Z-Pack” pattern of 500 mg on day 1 followed by 250 mg daily on days 2 through 5?",
    options: ["Azithromycin", "Clarithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Azithromycin",
    explanation: "The classic Z-Pack schedule belongs to azithromycin. That short-course dosing pearl is one of the easiest ways to recognize the drug.",
    objective: .dosing,
    relatedDrugIds: ["d106"],
    tags: ["6c", "azithromycin", "z-pack", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_035",
    subsectionId: "6c",
    difficulty: .medium,
    question: "An older patient with baseline long-QT syndrome and bradyarrhythmia asks whether a Z-Pack is automatically safe because it is “common.” Which risk is the key reason for caution with azithromycin?",
    options: ["QT prolongation and torsades risk", "Severe ototoxicity", "Profound nephrotoxicity", "Bone marrow aplasia", "Warfarin skin necrosis"],
    answer: "QT prolongation and torsades risk",
    explanation: "Azithromycin is commonly prescribed, but it still carries an important QT-prolongation warning. “Common” does not mean free of serious risk.",
    objective: .adverseEffect,
    relatedDrugIds: ["d106"],
    tags: ["6c", "azithromycin", "qt-prolongation"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_036",
    subsectionId: "6c",
    difficulty: .hard,
    question: "Because fluoroquinolones can cause serious adverse effects, which antibiotic in this subsection is specifically one that labeling says should be reserved when other options exist for uncomplicated sinusitis, bronchitis, or cystitis?",
    options: ["Ciprofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline", "Cephalexin"],
    answer: "Ciprofloxacin",
    explanation: "Ciprofloxacin is a fluoroquinolone, and that class has enough serious toxicity that uncomplicated infections should be treated with alternatives when reasonable options exist.",
    objective: .pearl,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "reserve-use", "boxed-warning"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_037",
    subsectionId: "6c",
    difficulty: .medium,
    question: "A patient gets stomach upset with doxycycline and asks whether food is allowed. Which teaching point is best?",
    options: ["Doxycycline may be taken with food or milk if gastric irritation occurs", "Doxycycline must always be taken fasting because food completely blocks absorption", "Taking doxycycline at bedtime on an empty stomach is preferred to prevent nausea", "Doxycycline should be taken together with iron to reduce stomach upset", "If nausea occurs, the best fix is to lie down immediately after the dose"],
    answer: "Doxycycline may be taken with food or milk if gastric irritation occurs",
    explanation: "Although students often overgeneralize tetracyclines and dairy, doxycycline may be taken with food or milk if stomach irritation occurs. The bigger counseling pearl is avoiding esophageal irritation.",
    objective: .pearl,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "food", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_038",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Which pair from this subsection shares the suffix clue and class identity of the macrolides?",
    options: ["Azithromycin and clarithromycin", "Ciprofloxacin and levofloxacin", "Doxycycline and azithromycin", "Clarithromycin and doxycycline", "Azithromycin and ciprofloxacin"],
    answer: "Azithromycin and clarithromycin",
    explanation: "Azithromycin and clarithromycin are the two macrolides here. Their shared class helps explain overlapping QT and atypical-coverage teaching points.",
    objective: .classId,
    relatedDrugIds: ["d106", "d107"],
    tags: ["6c", "macrolide", "pair-id"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_039",
    subsectionId: "6c",
    difficulty: .medium,
    question: "A patient with acne says, “I usually take my medicine right before I lie down.” Which drug from this subsection should trigger the strongest counseling to take it with a full glass of water and stay upright?",
    options: ["Doxycycline", "Azithromycin", "Clarithromycin", "Levofloxacin", "Ciprofloxacin"],
    answer: "Doxycycline",
    explanation: "Doxycycline is the classic drug for upright-position and full-glass-of-water counseling because of esophageal irritation and ulceration risk.",
    objective: .pearl,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "upright", "counseling"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_040",
    subsectionId: "6c",
    difficulty: .hard,
    question: "One drug in this subsection stands out because it is also labeled for malaria prophylaxis, a pearl that helps separate it from the macrolides and fluoroquinolones. Which drug is it?",
    options: ["Doxycycline", "Azithromycin", "Clarithromycin", "Levofloxacin", "Ciprofloxacin"],
    answer: "Doxycycline",
    explanation: "Doxycycline has a malaria-prophylaxis indication, which is a useful differentiator when students are sorting through these non-beta-lactam antibiotics.",
    objective: .indication,
    relatedDrugIds: ["d108"],
    tags: ["6c", "doxycycline", "malaria-prophylaxis"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_041",
    subsectionId: "6c",
    difficulty: .hard,
    question: "Which drug in this subsection is the classic oral fluoroquinolone associated with inhalational anthrax post-exposure prophylaxis?",
    options: ["Ciprofloxacin", "Levofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline"],
    answer: "Ciprofloxacin",
    explanation: "Ciprofloxacin is a classic anthrax-associated antibiotic pearl. That association is much stronger for ciprofloxacin than for the macrolides in this subsection.",
    objective: .indication,
    relatedDrugIds: ["d104"],
    tags: ["6c", "ciprofloxacin", "anthrax"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_042",
    subsectionId: "6c",
    difficulty: .hard,
    question: "An older adult with community-acquired pneumonia and reduced creatinine clearance is prescribed the respiratory fluoroquinolone from this subsection. Which drug should prompt a renal-dose review?",
    options: ["Levofloxacin", "Azithromycin", "Clarithromycin", "Doxycycline", "Amoxicillin"],
    answer: "Levofloxacin",
    explanation: "Levofloxacin is the respiratory fluoroquinolone in this subsection, and renal function review is important when dosing it in older adults or patients with impaired kidney function.",
    objective: .monitoring,
    relatedDrugIds: ["d105"],
    tags: ["6c", "levofloxacin", "renal-dose"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_043",
    subsectionId: "6c",
    difficulty: .easy,
    question: "Which pair from this subsection belongs to the fluoroquinolone class?",
    options: ["Ciprofloxacin and levofloxacin", "Azithromycin and clarithromycin", "Doxycycline and azithromycin", "Clarithromycin and doxycycline", "Azithromycin and levofloxacin"],
    answer: "Ciprofloxacin and levofloxacin",
    explanation: "Ciprofloxacin and levofloxacin are the two fluoroquinolones in this subsection. The -floxacin suffix is the biggest clue.",
    objective: .classId,
    relatedDrugIds: ["d104", "d105"],
    tags: ["6c", "fluoroquinolone", "pair-id"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_044",
    subsectionId: "6c",
    difficulty: .hard,
    question: "A patient on a fluoroquinolone reports new burning, tingling, and numbness in the feet. Which serious class warning best matches that complaint?",
    options: ["Peripheral neuropathy", "Agranulocytosis", "Pancreatitis", "Tardive dyskinesia", "Hemolytic anemia"],
    answer: "Peripheral neuropathy",
    explanation: "Peripheral neuropathy is one of the serious fluoroquinolone warnings. New sensory symptoms while taking ciprofloxacin or levofloxacin should raise concern immediately.",
    objective: .adverseEffect,
    relatedDrugIds: ["d104", "d105"],
    tags: ["6c", "fluoroquinolone", "peripheral-neuropathy"],
    source: .curated
),

.multipleChoice(
    id: "q6c_add_045",
    subsectionId: "6c",
    difficulty: .hard,
    question: "A patient with chronic kidney disease takes colchicine and is being considered for an H. pylori regimen. Which antibiotic from this subsection is the worst fit because of a high-yield contraindicated interaction?",
    options: ["Clarithromycin", "Azithromycin", "Doxycycline", "Levofloxacin", "Ciprofloxacin"],
    answer: "Clarithromycin",
    explanation: "Clarithromycin is the H. pylori-associated macrolide, but it is the wrong choice here because concomitant colchicine becomes especially dangerous in renal impairment.",
    objective: .interaction,
    relatedDrugIds: ["d107"],
    tags: ["6c", "clarithromycin", "colchicine", "ckd"],
    source: .curated
),

    ]
}