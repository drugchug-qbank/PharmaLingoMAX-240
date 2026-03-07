// PharmaLingo — Module 6b (Beta-Lactams (Penicillins + Cephalosporins))
// Curated Add-On Question Pack (45 questions)
// IDs: q6b_add_001 ... q6b_add_045
//
// Integration:
// 1) Add this file to your project.
// 2) In DrugDataService.populateCuratedBank(_:), ensure subsection 6b exists, then append:
//
//    if bank["6b"] == nil { bank["6b"] = [] }
//    bank["6b"]?.append(contentsOf: Self.curatedAddOnQuestions_6b)
//
// Notes:
// - All questions are single-best-answer multiple choice with 5 choices.
// - Stems are written in a teaching style and designed to avoid exact duplicates
//   of the current generated templates.
// - relatedDrugIds use the uploaded repo IDs: d98 (Amoxicillin), d99 (Amoxicillin/Clavulanate),
//   d100 (Piperacillin/Tazobactam), d101 (Cephalexin), d102 (Ceftriaxone), d103 (Cefepime).
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_6b: [Question] = [
.multipleChoice(
    id: "q6b_add_001",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Amoxil is the classic oral aminopenicillin used for common community infections like otitis media, sinusitis, and strep pharyngitis. What is the generic name of Amoxil?",
    options: ["Amoxicillin", "Amoxicillin/Clavulanate", "Cephalexin", "Ceftriaxone", "Piperacillin/Tazobactam"],
    answer: "Amoxicillin",
    explanation: "Amoxil is the brand name for amoxicillin. Keeping this pair straight helps students separate plain amoxicillin from Augmentin, which adds a beta-lactamase inhibitor.",
    objective: .brandGeneric,
    relatedDrugIds: ["d98"],
    tags: ["6b", "amoxicillin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_002",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Amoxicillin is the plain oral aminopenicillin in this subsection, often chosen when you want common respiratory-pathogen coverage without a beta-lactamase inhibitor. Which brand name matches amoxicillin?",
    options: ["Amoxil", "Augmentin", "Keflex", "Rocephin", "Maxipime"],
    answer: "Amoxil",
    explanation: "Amoxicillin is marketed as Amoxil. It is the plain oral aminopenicillin, while Augmentin is amoxicillin combined with clavulanate.",
    objective: .genericBrand,
    relatedDrugIds: ["d98"],
    tags: ["6b", "amoxicillin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_003",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Augmentin is remembered as the oral amoxicillin product that adds beta-lactamase inhibition and is commonly used for sinusitis, otitis media, and bite wounds. What is the generic name of Augmentin?",
    options: ["Amoxicillin/Clavulanate", "Amoxicillin", "Piperacillin/Tazobactam", "Cephalexin", "Cefepime"],
    answer: "Amoxicillin/Clavulanate",
    explanation: "Augmentin is the brand name for amoxicillin/clavulanate. The clavulanate component is why the combination is broader than plain amoxicillin.",
    objective: .brandGeneric,
    relatedDrugIds: ["d99"],
    tags: ["6b", "augmentin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_004",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Amoxicillin/clavulanate is the oral beta-lactam combination that expands amoxicillin coverage by blocking some beta-lactamases. Which brand name matches amoxicillin/clavulanate?",
    options: ["Augmentin", "Amoxil", "Zosyn", "Keflex", "Rocephin"],
    answer: "Augmentin",
    explanation: "Amoxicillin/clavulanate is sold as Augmentin. It is the high-yield oral penicillin-plus-inhibitor combination in this subsection.",
    objective: .genericBrand,
    relatedDrugIds: ["d99"],
    tags: ["6b", "amoxicillin-clavulanate", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_005",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Zosyn is the broad IV hospital beta-lactam that combines an extended-spectrum penicillin with a beta-lactamase inhibitor and is often chosen for intra-abdominal or nosocomial infections. What is the generic name of Zosyn?",
    options: ["Piperacillin/Tazobactam", "Amoxicillin/Clavulanate", "Cefepime", "Ceftriaxone", "Amoxicillin"],
    answer: "Piperacillin/Tazobactam",
    explanation: "Zosyn is the brand name for piperacillin/tazobactam. This is the classic broad inpatient penicillin plus beta-lactamase inhibitor combination.",
    objective: .brandGeneric,
    relatedDrugIds: ["d100"],
    tags: ["6b", "zosyn", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_006",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Piperacillin/tazobactam is the IV antipseudomonal beta-lactam combination that students commonly associate with broad empiric hospital coverage. Which brand name matches piperacillin/tazobactam?",
    options: ["Zosyn", "Augmentin", "Maxipime", "Rocephin", "Keflex"],
    answer: "Zosyn",
    explanation: "Piperacillin/tazobactam is marketed as Zosyn. It is a broad inpatient choice and should not be confused with the oral amoxicillin/clavulanate combination.",
    objective: .genericBrand,
    relatedDrugIds: ["d100"],
    tags: ["6b", "piperacillin-tazobactam", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_007",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Keflex is the classic oral first-generation cephalosporin often used for uncomplicated skin infections, streptococcal pharyngitis, and some uncomplicated UTIs. What is the generic name of Keflex?",
    options: ["Cephalexin", "Ceftriaxone", "Cefepime", "Amoxicillin", "Piperacillin/Tazobactam"],
    answer: "Cephalexin",
    explanation: "Keflex is the brand name for cephalexin. It is the high-yield oral first-generation cephalosporin in this subsection.",
    objective: .brandGeneric,
    relatedDrugIds: ["d101"],
    tags: ["6b", "keflex", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_008",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Cephalexin is the oral first-generation cephalosporin remembered for strong outpatient gram-positive coverage. Which brand name matches cephalexin?",
    options: ["Keflex", "Rocephin", "Maxipime", "Amoxil", "Augmentin"],
    answer: "Keflex",
    explanation: "Cephalexin is sold as Keflex. Students should quickly connect cephalexin with oral first-generation cephalosporin coverage.",
    objective: .genericBrand,
    relatedDrugIds: ["d101"],
    tags: ["6b", "cephalexin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_009",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Rocephin is the parenteral third-generation cephalosporin that comes up repeatedly for meningitis, pneumonia, and gonorrhea. What is the generic name of Rocephin?",
    options: ["Ceftriaxone", "Cefepime", "Cephalexin", "Amoxicillin", "Piperacillin/Tazobactam"],
    answer: "Ceftriaxone",
    explanation: "Rocephin is the brand name for ceftriaxone. It is a key third-generation cephalosporin for serious community infections and STI treatment.",
    objective: .brandGeneric,
    relatedDrugIds: ["d102"],
    tags: ["6b", "rocephin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_010",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Ceftriaxone is the IM/IV cephalosporin often remembered for once-daily dosing and high-yield uses like meningitis and uncomplicated gonorrhea. Which brand name matches ceftriaxone?",
    options: ["Rocephin", "Maxipime", "Keflex", "Zosyn", "Amoxil"],
    answer: "Rocephin",
    explanation: "Ceftriaxone is marketed as Rocephin. Remembering this pair helps anchor its parenteral, third-generation cephalosporin profile.",
    objective: .genericBrand,
    relatedDrugIds: ["d102"],
    tags: ["6b", "ceftriaxone", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_011",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Maxipime is the fourth-generation cephalosporin that is high yield for serious gram-negative infections including Pseudomonas. What is the generic name of Maxipime?",
    options: ["Cefepime", "Ceftriaxone", "Cephalexin", "Amoxicillin/Clavulanate", "Piperacillin/Tazobactam"],
    answer: "Cefepime",
    explanation: "Maxipime is the brand name for cefepime. It is the antipseudomonal fourth-generation cephalosporin in this subsection.",
    objective: .brandGeneric,
    relatedDrugIds: ["d103"],
    tags: ["6b", "maxipime", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_012",
    subsectionId: "6b",
    difficulty: .easy,
    question: "Cefepime is the fourth-generation cephalosporin often selected for febrile neutropenia or other serious hospital infections. Which brand name matches cefepime?",
    options: ["Maxipime", "Rocephin", "Keflex", "Augmentin", "Zosyn"],
    answer: "Maxipime",
    explanation: "Cefepime is sold as Maxipime. Students should pair cefepime with fourth-generation cephalosporin and antipseudomonal coverage.",
    objective: .genericBrand,
    relatedDrugIds: ["d103"],
    tags: ["6b", "cefepime", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_013",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Even though this subsection mixes penicillins and cephalosporins, they all sit in the beta-lactam bucket. What shared mechanism best explains that bucket?",
    options: ["Inhibition of bacterial cell wall synthesis", "Binding the 50S ribosomal subunit", "Inhibition of DNA gyrase and topoisomerase", "Sequential blockade of folate synthesis", "Disruption of fungal cell membranes"],
    answer: "Inhibition of bacterial cell wall synthesis",
    explanation: "Beta-lactams work by interfering with bacterial cell wall synthesis. That is the unifying mechanism linking amoxicillin, cephalexin, ceftriaxone, cefepime, and the inhibitor combinations.",
    objective: .moa,
    relatedDrugIds: ["d98", "d99", "d100", "d101", "d102", "d103"],
    tags: ["6b", "beta-lactam", "moa"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_014",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Augmentin is not just “stronger amoxicillin.” The clavulanate component changes what the combination can handle. What is clavulanate primarily doing?",
    options: ["Inhibiting bacterial beta-lactamases", "Blocking the 30S ribosomal subunit", "Preventing renal clearance of amoxicillin", "Directly killing anaerobes on its own", "Reducing allergic reactions to penicillins"],
    answer: "Inhibiting bacterial beta-lactamases",
    explanation: "Clavulanate is a beta-lactamase inhibitor. It protects amoxicillin from enzymatic destruction rather than serving as the main antibacterial component by itself.",
    objective: .moa,
    relatedDrugIds: ["d99"],
    tags: ["6b", "clavulanate", "beta-lactamase"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_015",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Zosyn combines piperacillin with tazobactam. Why is tazobactam included in that product?",
    options: ["It inhibits beta-lactamases and protects piperacillin", "It provides the main antipseudomonal effect by itself", "It converts piperacillin into a cephalosporin", "It prevents diarrhea caused by piperacillin", "It makes the drug safe in penicillin anaphylaxis"],
    answer: "It inhibits beta-lactamases and protects piperacillin",
    explanation: "Tazobactam is a beta-lactamase inhibitor. Its role is to shield piperacillin from certain bacterial beta-lactamases and broaden the combination’s utility.",
    objective: .moa,
    relatedDrugIds: ["d100"],
    tags: ["6b", "tazobactam", "beta-lactamase"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_016",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Which drug in this subsection is best classified as the oral first-generation cephalosporin used heavily for outpatient gram-positive infections?",
    options: ["Cephalexin", "Ceftriaxone", "Cefepime", "Amoxicillin", "Piperacillin/Tazobactam"],
    answer: "Cephalexin",
    explanation: "Cephalexin is the oral first-generation cephalosporin. It is high yield for uncomplicated skin and soft-tissue infections and streptococcal pharyngitis.",
    objective: .classId,
    relatedDrugIds: ["d101"],
    tags: ["6b", "cephalexin", "first-generation"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_017",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Which listed drug is the third-generation cephalosporin that students most often associate with IM/IV therapy for meningitis and gonorrhea?",
    options: ["Ceftriaxone", "Cephalexin", "Cefepime", "Amoxicillin", "Amoxicillin/Clavulanate"],
    answer: "Ceftriaxone",
    explanation: "Ceftriaxone is the third-generation cephalosporin in this subsection. Its meningitis and gonorrhea uses make it one of the highest-yield cephalosporins to recognize.",
    objective: .classId,
    relatedDrugIds: ["d102"],
    tags: ["6b", "ceftriaxone", "third-generation"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_018",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Which listed drug is the fourth-generation cephalosporin remembered for serious gram-negative coverage including Pseudomonas?",
    options: ["Cefepime", "Ceftriaxone", "Cephalexin", "Amoxicillin", "Amoxicillin/Clavulanate"],
    answer: "Cefepime",
    explanation: "Cefepime is the fourth-generation cephalosporin in this subsection. The Pseudomonas and febrile-neutropenia association makes it a classic hospital antibiotic.",
    objective: .classId,
    relatedDrugIds: ["d103"],
    tags: ["6b", "cefepime", "fourth-generation"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_019",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Which drug in this subsection is the plain oral aminopenicillin without a beta-lactamase inhibitor attached?",
    options: ["Amoxicillin", "Amoxicillin/Clavulanate", "Piperacillin/Tazobactam", "Cephalexin", "Ceftriaxone"],
    answer: "Amoxicillin",
    explanation: "Amoxicillin is the plain oral aminopenicillin. Amoxicillin/clavulanate adds clavulanate, while piperacillin/tazobactam is a broader IV penicillin combination.",
    objective: .classId,
    relatedDrugIds: ["d98"],
    tags: ["6b", "amoxicillin", "aminopenicillin"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_020",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which answer choice correctly names the TWO products in this subsection that pair a beta-lactam with a beta-lactamase inhibitor?",
    options: ["Amoxicillin/Clavulanate and Piperacillin/Tazobactam", "Amoxicillin and Cephalexin", "Ceftriaxone and Cefepime", "Amoxicillin and Ceftriaxone", "Cephalexin and Piperacillin/Tazobactam"],
    answer: "Amoxicillin/Clavulanate and Piperacillin/Tazobactam",
    explanation: "The two inhibitor combinations here are amoxicillin/clavulanate and piperacillin/tazobactam. Clavulanate and tazobactam are the beta-lactamase inhibitors.",
    objective: .mixedReview,
    relatedDrugIds: ["d99", "d100"],
    tags: ["6b", "beta-lactamase-inhibitor", "compare"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_021",
    subsectionId: "6b",
    difficulty: .medium,
    question: "A patient is being treated as an outpatient after a dog bite, so you want oral beta-lactam therapy with better anaerobic and beta-lactamase coverage than plain amoxicillin. Which drug best fits that need?",
    options: ["Amoxicillin/Clavulanate", "Amoxicillin", "Cephalexin", "Ceftriaxone", "Cefepime"],
    answer: "Amoxicillin/Clavulanate",
    explanation: "Amoxicillin/clavulanate is the classic oral choice for bite wounds. The clavulanate expands coverage beyond what plain amoxicillin would provide.",
    objective: .indication,
    relatedDrugIds: ["d99"],
    tags: ["6b", "bite-wound", "augmentin"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_022",
    subsectionId: "6b",
    difficulty: .medium,
    question: "For uncomplicated cellulitis or streptococcal pharyngitis in a patient who can take oral medication, which beta-lactam from this subsection is most associated with strong outpatient gram-positive coverage?",
    options: ["Cephalexin", "Ceftriaxone", "Cefepime", "Piperacillin/Tazobactam", "Amoxicillin/Clavulanate"],
    answer: "Cephalexin",
    explanation: "Cephalexin is the oral first-generation cephalosporin classically tied to outpatient gram-positive infections such as uncomplicated skin infections and strep throat.",
    objective: .indication,
    relatedDrugIds: ["d101"],
    tags: ["6b", "cephalexin", "skin-infection"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_023",
    subsectionId: "6b",
    difficulty: .medium,
    question: "A clinician wants the parenteral cephalosporin in this subsection that is high yield for meningitis and also comes up in uncomplicated gonorrhea treatment. Which drug is it?",
    options: ["Ceftriaxone", "Cephalexin", "Cefepime", "Amoxicillin", "Piperacillin/Tazobactam"],
    answer: "Ceftriaxone",
    explanation: "Ceftriaxone is the classic parenteral third-generation cephalosporin tied to both meningitis and gonorrhea in medical training.",
    objective: .indication,
    relatedDrugIds: ["d102"],
    tags: ["6b", "ceftriaxone", "meningitis"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_024",
    subsectionId: "6b",
    difficulty: .medium,
    question: "A neutropenic inpatient needs empiric beta-lactam coverage that includes Pseudomonas. Which cephalosporin in this subsection is most associated with that scenario?",
    options: ["Cefepime", "Ceftriaxone", "Cephalexin", "Amoxicillin", "Amoxicillin/Clavulanate"],
    answer: "Cefepime",
    explanation: "Cefepime is the fourth-generation cephalosporin high yield for febrile neutropenia and other serious hospital infections where Pseudomonas is a concern.",
    objective: .indication,
    relatedDrugIds: ["d103"],
    tags: ["6b", "cefepime", "febrile-neutropenia"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_025",
    subsectionId: "6b",
    difficulty: .medium,
    question: "A hospitalized patient with suspected intra-abdominal sepsis needs broad IV beta-lactam therapy that also covers Pseudomonas. Which option from this subsection best fits?",
    options: ["Piperacillin/Tazobactam", "Amoxicillin", "Cephalexin", "Ceftriaxone", "Amoxicillin/Clavulanate"],
    answer: "Piperacillin/Tazobactam",
    explanation: "Piperacillin/tazobactam is the broad IV inpatient beta-lactam combination in this subsection and is classically associated with intra-abdominal and nosocomial infections.",
    objective: .indication,
    relatedDrugIds: ["d100"],
    tags: ["6b", "zosyn", "intra-abdominal"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_026",
    subsectionId: "6b",
    difficulty: .medium,
    question: "When a patient has a common community respiratory infection such as otitis media, sinusitis, or strep pharyngitis and a plain oral aminopenicillin is enough, which drug is the most classic choice from this subsection?",
    options: ["Amoxicillin", "Amoxicillin/Clavulanate", "Cephalexin", "Cefepime", "Piperacillin/Tazobactam"],
    answer: "Amoxicillin",
    explanation: "Amoxicillin is the classic plain oral aminopenicillin for common community infections. It is narrower than the inhibitor combinations and usually used outside the hospital.",
    objective: .indication,
    relatedDrugIds: ["d98"],
    tags: ["6b", "amoxicillin", "respiratory"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_027",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Which beta-lactam in this subsection is also commonly remembered as part of combination therapy for Helicobacter pylori?",
    options: ["Amoxicillin", "Cephalexin", "Ceftriaxone", "Cefepime", "Piperacillin/Tazobactam"],
    answer: "Amoxicillin",
    explanation: "Amoxicillin is the high-yield beta-lactam from this subsection that commonly appears in H. pylori treatment regimens.",
    objective: .indication,
    relatedDrugIds: ["d98"],
    tags: ["6b", "amoxicillin", "H.pylori"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_028",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Cephalexin, ceftriaxone, and cefepime are all different generations, but they still belong to the same antibiotic family. What family is that?",
    options: ["Cephalosporins", "Aminoglycosides", "Macrolides", "Fluoroquinolones", "Sulfonamides"],
    answer: "Cephalosporins",
    explanation: "Cephalexin, ceftriaxone, and cefepime are all cephalosporins. The generation changes their spectrum, but the family identity stays the same.",
    objective: .classId,
    relatedDrugIds: ["d101", "d102", "d103"],
    tags: ["6b", "cephalosporin", "family"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_029",
    subsectionId: "6b",
    difficulty: .hard,
    question: "A patient with infectious mononucleosis receives an aminopenicillin and then develops a diffuse erythematous rash. Which drug from this subsection is classically linked to that teaching pearl?",
    options: ["Amoxicillin", "Cephalexin", "Ceftriaxone", "Cefepime", "Piperacillin/Tazobactam"],
    answer: "Amoxicillin",
    explanation: "Amoxicillin is classically associated with an erythematous rash in patients with mononucleosis. This is one of the most tested penicillin pearls.",
    objective: .contraindication,
    relatedDrugIds: ["d98"],
    tags: ["6b", "amoxicillin", "mononucleosis"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_030",
    subsectionId: "6b",
    difficulty: .medium,
    question: "Compared with plain amoxicillin, which drug in this subsection is more likely to cause bothersome diarrhea because it includes clavulanate?",
    options: ["Amoxicillin/Clavulanate", "Amoxicillin", "Cephalexin", "Ceftriaxone", "Cefepime"],
    answer: "Amoxicillin/Clavulanate",
    explanation: "Amoxicillin/clavulanate is well known for causing more GI upset, especially diarrhea, than plain amoxicillin because of the clavulanate component.",
    objective: .adverseEffect,
    relatedDrugIds: ["d99", "d98"],
    tags: ["6b", "augmentin", "diarrhea"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_031",
    subsectionId: "6b",
    difficulty: .hard,
    question: "A patient previously developed cholestatic jaundice and hepatic dysfunction after taking a beta-lactam from this subsection. Which agent should be avoided because that history is a labeled contraindication?",
    options: ["Amoxicillin/Clavulanate", "Amoxicillin", "Cephalexin", "Ceftriaxone", "Cefepime"],
    answer: "Amoxicillin/Clavulanate",
    explanation: "A prior history of cholestatic jaundice or hepatic dysfunction associated with amoxicillin/clavulanate is a contraindication to using that product again.",
    objective: .contraindication,
    relatedDrugIds: ["d99"],
    tags: ["6b", "augmentin", "hepatotoxicity"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_032",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which beta-lactam in this subsection should be avoided in neonates who require calcium-containing IV solutions because of precipitation risk?",
    options: ["Ceftriaxone", "Cephalexin", "Cefepime", "Amoxicillin", "Amoxicillin/Clavulanate"],
    answer: "Ceftriaxone",
    explanation: "Ceftriaxone has a high-yield neonatal calcium warning. In neonates requiring calcium-containing IV solutions, it should be avoided because of precipitation risk.",
    objective: .contraindication,
    relatedDrugIds: ["d102"],
    tags: ["6b", "ceftriaxone", "neonate"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_033",
    subsectionId: "6b",
    difficulty: .hard,
    question: "A patient on prolonged ceftriaxone develops right upper quadrant discomfort and imaging suggests biliary precipitation. Which adverse effect should you think of first?",
    options: ["Biliary sludging or pseudolithiasis", "Permanent tendon rupture", "Severe photosensitivity", "Ototoxicity", "Torsades de pointes"],
    answer: "Biliary sludging or pseudolithiasis",
    explanation: "Ceftriaxone is high yield for biliary sludging or pseudolithiasis. It is a classic adverse-effect pearl tied specifically to this cephalosporin.",
    objective: .adverseEffect,
    relatedDrugIds: ["d102"],
    tags: ["6b", "ceftriaxone", "biliary"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_034",
    subsectionId: "6b",
    difficulty: .hard,
    question: "A renally impaired ICU patient becomes confused and develops myoclonus after receiving an antipseudomonal cephalosporin. Which drug in this subsection is the classic culprit?",
    options: ["Cefepime", "Ceftriaxone", "Cephalexin", "Amoxicillin", "Amoxicillin/Clavulanate"],
    answer: "Cefepime",
    explanation: "Cefepime is the cephalosporin classically linked to neurotoxicity, especially when renal dysfunction leads to inadequate dose adjustment.",
    objective: .adverseEffect,
    relatedDrugIds: ["d103"],
    tags: ["6b", "cefepime", "neurotoxicity"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_035",
    subsectionId: "6b",
    difficulty: .hard,
    question: "What is the best practical monitoring step to lower the risk of cefepime-related encephalopathy or seizures during therapy?",
    options: ["Check renal function and adjust the dose appropriately", "Give the drug with food to improve absorption", "Co-administer clavulanate with every dose", "Monitor thyroid function weekly", "Separate the dose from dairy products"],
    answer: "Check renal function and adjust the dose appropriately",
    explanation: "Because cefepime neurotoxicity is strongly tied to renal impairment and unadjusted dosing, checking kidney function and adjusting the dose is the key safety step.",
    objective: .monitoring,
    relatedDrugIds: ["d103"],
    tags: ["6b", "cefepime", "renal-monitoring"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_036",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which broad IV beta-lactam from this subsection is especially worth remembering for sodium load and possible hypokalemia in vulnerable hospitalized patients?",
    options: ["Piperacillin/Tazobactam", "Amoxicillin", "Amoxicillin/Clavulanate", "Cephalexin", "Ceftriaxone"],
    answer: "Piperacillin/Tazobactam",
    explanation: "Piperacillin/tazobactam contains a meaningful sodium load and can contribute to hypokalemia, which matters in patients with salt restriction or low potassium reserves.",
    objective: .adverseEffect,
    relatedDrugIds: ["d100"],
    tags: ["6b", "zosyn", "electrolytes"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_037",
    subsectionId: "6b",
    difficulty: .hard,
    question: "A patient receiving piperacillin/tazobactam is also on a loop diuretic and already has low potassium reserves. Which lab is especially worth following during treatment?",
    options: ["Serum potassium", "Serum calcium", "TSH", "Serum uric acid", "Vitamin B12 level"],
    answer: "Serum potassium",
    explanation: "Piperacillin/tazobactam can contribute to hypokalemia, so serum potassium deserves attention, especially when other risk factors for potassium loss are present.",
    objective: .monitoring,
    relatedDrugIds: ["d100"],
    tags: ["6b", "zosyn", "potassium"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_038",
    subsectionId: "6b",
    difficulty: .hard,
    question: "During a long inpatient course of a broad IV penicillin/beta-lactamase inhibitor combination, which drug from this subsection is worth remembering for thrombocytopenia or leukopenia on CBC monitoring?",
    options: ["Piperacillin/Tazobactam", "Amoxicillin", "Cephalexin", "Ceftriaxone", "Amoxicillin/Clavulanate"],
    answer: "Piperacillin/Tazobactam",
    explanation: "Piperacillin/tazobactam is worth remembering for hematologic effects such as thrombocytopenia or leukopenia during therapy, especially in hospitalized patients receiving longer courses.",
    objective: .monitoring,
    relatedDrugIds: ["d100"],
    tags: ["6b", "zosyn", "cbc"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_039",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which statement about ceftriaxone is most accurate?",
    options: ["It is a parenteral third-generation cephalosporin remembered for meningitis and gonorrhea and often given once daily", "It is the oral first-generation cephalosporin used for uncomplicated cellulitis", "It is the fourth-generation cephalosporin best known for febrile neutropenia", "It is the plain oral aminopenicillin used for strep pharyngitis", "It is the oral penicillin plus beta-lactamase inhibitor used for bite wounds"],
    answer: "It is a parenteral third-generation cephalosporin remembered for meningitis and gonorrhea and often given once daily",
    explanation: "Ceftriaxone stands out as the parenteral third-generation cephalosporin with high-yield use in meningitis and gonorrhea, plus a once-daily-dosing pearl in many settings.",
    objective: .pearl,
    relatedDrugIds: ["d102"],
    tags: ["6b", "ceftriaxone", "once-daily"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_040",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which statement about cephalexin is most accurate?",
    options: ["It is an oral first-generation cephalosporin used for uncomplicated gram-positive outpatient infections and it is not the antipseudomonal cephalosporin", "It is the broad IV penicillin plus tazobactam used for intra-abdominal sepsis", "It is the cephalosporin with a neonatal calcium contraindication", "It is the inhibitor combination used for bite wounds because of clavulanate", "It is the fourth-generation cephalosporin high yield for febrile neutropenia"],
    answer: "It is an oral first-generation cephalosporin used for uncomplicated gram-positive outpatient infections and it is not the antipseudomonal cephalosporin",
    explanation: "Cephalexin is the oral first-generation cephalosporin here. It is great for common outpatient gram-positive infections, but it is not the cephalosporin remembered for Pseudomonas.",
    objective: .pearl,
    relatedDrugIds: ["d101"],
    tags: ["6b", "cephalexin", "outpatient"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_041",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which statement about cefepime is most accurate?",
    options: ["It is a fourth-generation cephalosporin with antipseudomonal activity and a neurotoxicity concern when renal dosing is not adjusted", "It is an oral first-generation cephalosporin mainly used for strep pharyngitis", "It is the beta-lactam classically tied to bite wounds because of clavulanate", "It should be chosen in neonates receiving calcium-containing IV solutions", "It is the plain oral aminopenicillin most used for otitis media"],
    answer: "It is a fourth-generation cephalosporin with antipseudomonal activity and a neurotoxicity concern when renal dosing is not adjusted",
    explanation: "Cefepime is the fourth-generation cephalosporin in this section, and the renal-dose-related neurotoxicity pearl is one of its most testable safety features.",
    objective: .pearl,
    relatedDrugIds: ["d103"],
    tags: ["6b", "cefepime", "compare"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_042",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which statement best distinguishes amoxicillin from amoxicillin/clavulanate?",
    options: ["Amoxicillin/clavulanate keeps the amoxicillin backbone but adds a beta-lactamase inhibitor, which broadens coverage and often increases GI upset", "Amoxicillin/clavulanate is a cephalosporin, while amoxicillin is a penicillin", "Amoxicillin treats only hospital infections, while amoxicillin/clavulanate is only for meningitis", "Amoxicillin has antipseudomonal activity, while amoxicillin/clavulanate does not", "Amoxicillin/clavulanate avoids rash in mononucleosis better than amoxicillin"],
    answer: "Amoxicillin/clavulanate keeps the amoxicillin backbone but adds a beta-lactamase inhibitor, which broadens coverage and often increases GI upset",
    explanation: "The key distinction is that Augmentin adds clavulanate to plain amoxicillin. That expands usefulness against some beta-lactamase producers but often causes more diarrhea.",
    objective: .mixedReview,
    relatedDrugIds: ["d98", "d99"],
    tags: ["6b", "amoxicillin", "augmentin"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_043",
    subsectionId: "6b",
    difficulty: .hard,
    question: "A patient reports a true immediate anaphylactic reaction to penicillin. Which counseling statement is most accurate before starting a cephalosporin such as cefepime or ceftriaxone?",
    options: ["Cross-hypersensitivity among beta-lactam antibiotics can occur, so the allergy history still matters", "Cephalosporins automatically reverse penicillin allergy because they are a different family", "Only oral beta-lactams matter; IV cephalosporins are exempt from allergy concerns", "Adding tazobactam removes all beta-lactam allergy risk", "If the reaction happened years ago, all beta-lactam allergy warnings can be ignored"],
    answer: "Cross-hypersensitivity among beta-lactam antibiotics can occur, so the allergy history still matters",
    explanation: "Beta-lactam cross-hypersensitivity is a key safety pearl. A serious penicillin allergy does not mean every cephalosporin is absolutely forbidden, but it definitely means the allergy history matters.",
    objective: .contraindication,
    relatedDrugIds: ["d98", "d101", "d102", "d103"],
    tags: ["6b", "beta-lactam-allergy", "cross-reactivity"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_044",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which answer choice gives the best example of a plain beta-lactam and its beta-lactamase-inhibitor combination “cousin” from this subsection?",
    options: ["Amoxicillin and Amoxicillin/Clavulanate", "Cephalexin and Ceftriaxone", "Ceftriaxone and Cefepime", "Cefepime and Piperacillin/Tazobactam", "Cephalexin and Amoxicillin"],
    answer: "Amoxicillin and Amoxicillin/Clavulanate",
    explanation: "Amoxicillin is the plain drug, while amoxicillin/clavulanate is the combination version with a beta-lactamase inhibitor added. That pair is a very high-yield compare-and-contrast anchor.",
    objective: .mixedReview,
    relatedDrugIds: ["d98", "d99"],
    tags: ["6b", "compare", "beta-lactamase-inhibitor"],
    source: .curated
),

.multipleChoice(
    id: "q6b_add_045",
    subsectionId: "6b",
    difficulty: .hard,
    question: "Which generation mapping is correct for the three cephalosporins in this subsection?",
    options: ["Cephalexin = first generation, Ceftriaxone = third generation, Cefepime = fourth generation", "Cephalexin = third generation, Ceftriaxone = first generation, Cefepime = second generation", "Cephalexin = fourth generation, Ceftriaxone = second generation, Cefepime = first generation", "Cephalexin = first generation, Ceftriaxone = fourth generation, Cefepime = third generation", "Cephalexin = second generation, Ceftriaxone = third generation, Cefepime = first generation"],
    answer: "Cephalexin = first generation, Ceftriaxone = third generation, Cefepime = fourth generation",
    explanation: "The generation ladder here is high yield: cephalexin is first generation, ceftriaxone is third generation, and cefepime is fourth generation.",
    objective: .mixedReview,
    relatedDrugIds: ["d101", "d102", "d103"],
    tags: ["6b", "cephalosporin-generation", "compare"],
    source: .curated
)
    ]
}
