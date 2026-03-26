import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_6e_supplement: [Question] = [

.multipleChoice(
    id: "q6e_sup_001",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Ery-Tab is the macrolide in this subsection that is also remembered for its off-label prokinetic use in gastroparesis. What is the generic name of Ery-Tab?",
    options: ["Erythromycin", "Azithromycin", "Clarithromycin", "Clindamycin", "Doxycycline"],
    answer: "Erythromycin",
    explanation: "Ery-Tab is the brand name for erythromycin. In addition to treating infections, erythromycin is known for stimulating GI motility.",
    objective: .brandGeneric,
    relatedDrugIds: ["d230"],
    tags: ["6e", "erythromycin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_002",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Erythromycin is a macrolide antibiotic that also has prokinetic properties. Which brand name matches erythromycin?",
    options: ["Ery-Tab", "Biaxin", "Zithromax", "Cleocin", "Flagyl"],
    answer: "Ery-Tab",
    explanation: "Erythromycin is sold as Ery-Tab. It is the macrolide in this subsection with a well-known off-label gastroparesis pearl.",
    objective: .genericBrand,
    relatedDrugIds: ["d230"],
    tags: ["6e", "erythromycin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_003",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Nizoral is the azole antifungal in this subsection that is now mostly remembered for topical use because of systemic toxicity concerns. What is the generic name of Nizoral?",
    options: ["Ketoconazole", "Fluconazole", "Terbinafine", "Nystatin", "Metronidazole"],
    answer: "Ketoconazole",
    explanation: "Nizoral is the brand name for ketoconazole. Systemic ketoconazole is limited by hepatotoxicity and adrenal suppression concerns.",
    objective: .brandGeneric,
    relatedDrugIds: ["d232"],
    tags: ["6e", "ketoconazole", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_004",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Ketoconazole is an azole antifungal most commonly used topically as a shampoo for seborrheic dermatitis. Which brand name matches ketoconazole?",
    options: ["Nizoral", "Diflucan", "Lamisil", "Mycostatin", "Flagyl"],
    answer: "Nizoral",
    explanation: "Ketoconazole is sold as Nizoral. The shampoo formulation is commonly used for dandruff and seborrheic dermatitis.",
    objective: .genericBrand,
    relatedDrugIds: ["d232"],
    tags: ["6e", "ketoconazole", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_005",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Avelox is the respiratory fluoroquinolone in this subsection that adds anaerobic coverage and typically does not require renal dose adjustment. What is the generic name of Avelox?",
    options: ["Moxifloxacin", "Ciprofloxacin", "Levofloxacin", "Ofloxacin", "Doxycycline"],
    answer: "Moxifloxacin",
    explanation: "Avelox is the brand name for moxifloxacin. It is the respiratory fluoroquinolone with anaerobic coverage in this subsection.",
    objective: .brandGeneric,
    relatedDrugIds: ["d234"],
    tags: ["6e", "moxifloxacin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_006",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Moxifloxacin is the fluoroquinolone in this subsection remembered for respiratory and anaerobic coverage without needing renal dose adjustment. Which brand name matches moxifloxacin?",
    options: ["Avelox", "Cipro", "Levaquin", "Floxin Otic", "Vibramycin"],
    answer: "Avelox",
    explanation: "Moxifloxacin is sold as Avelox. It stands out among fluoroquinolones for its anaerobic coverage.",
    objective: .genericBrand,
    relatedDrugIds: ["d234"],
    tags: ["6e", "moxifloxacin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_007",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Mycostatin is the polyene antifungal used locally for oral thrush by swishing and swallowing. What is the generic name of Mycostatin?",
    options: ["Nystatin", "Fluconazole", "Ketoconazole", "Terbinafine", "Acyclovir"],
    answer: "Nystatin",
    explanation: "Mycostatin is the brand name for nystatin. It works locally in the mouth and is not significantly absorbed systemically.",
    objective: .brandGeneric,
    relatedDrugIds: ["d237"],
    tags: ["6e", "nystatin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_008",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Nystatin is the polyene antifungal that works locally for oral thrush and cutaneous candidiasis. Which brand name matches nystatin?",
    options: ["Mycostatin", "Diflucan", "Nizoral", "Lamisil", "Zovirax"],
    answer: "Mycostatin",
    explanation: "Nystatin is sold as Mycostatin. It is used for local Candida infections because systemic absorption is insignificant.",
    objective: .genericBrand,
    relatedDrugIds: ["d237"],
    tags: ["6e", "nystatin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_009",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Pen VK is the natural penicillin used for strep pharyngitis and dental infections. What is the generic name of Pen VK?",
    options: ["Penicillin V", "Amoxicillin", "Cephalexin", "Clindamycin", "Azithromycin"],
    answer: "Penicillin V",
    explanation: "Pen VK is the brand name for penicillin V. It is the narrowest oral penicillin and remains first-line for strep pharyngitis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d240"],
    tags: ["6e", "penicillin-v", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_010",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Penicillin V is the oral natural penicillin still considered first-line for confirmed strep pharyngitis. Which brand name matches penicillin V?",
    options: ["Pen VK", "Amoxil", "Keflex", "Augmentin", "Cleocin"],
    answer: "Pen VK",
    explanation: "Penicillin V is sold as Pen VK. It remains the narrowest appropriate choice for confirmed strep pharyngitis.",
    objective: .genericBrand,
    relatedDrugIds: ["d240"],
    tags: ["6e", "penicillin-v", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_011",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Lamisil is the allylamine antifungal that is first-line for onychomycosis and requires LFT monitoring. What is the generic name of Lamisil?",
    options: ["Terbinafine", "Fluconazole", "Ketoconazole", "Nystatin", "Metronidazole"],
    answer: "Terbinafine",
    explanation: "Lamisil is the brand name for terbinafine. It inhibits squalene epoxidase and is the oral drug of choice for nail fungus.",
    objective: .brandGeneric,
    relatedDrugIds: ["d242"],
    tags: ["6e", "terbinafine", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_012",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Terbinafine is the allylamine antifungal remembered for onychomycosis and hepatotoxicity monitoring. Which brand name matches terbinafine?",
    options: ["Lamisil", "Diflucan", "Nizoral", "Mycostatin", "Flagyl"],
    answer: "Lamisil",
    explanation: "Terbinafine is sold as Lamisil. Baseline and periodic LFTs are a high-yield monitoring pearl.",
    objective: .genericBrand,
    relatedDrugIds: ["d242"],
    tags: ["6e", "terbinafine", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_013",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Tobrex is the aminoglycoside ophthalmic product used for bacterial eye infections. What is the generic name of Tobrex?",
    options: ["Tobramycin", "Ofloxacin", "Polymyxin B/Trimethoprim", "Erythromycin", "Ciprofloxacin"],
    answer: "Tobramycin",
    explanation: "Tobrex is the brand name for tobramycin ophthalmic. It is also available as an inhaled formulation for cystic fibrosis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d243"],
    tags: ["6e", "tobramycin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_014",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Tobramycin is the aminoglycoside in this subsection used as an ophthalmic antibiotic. Which brand name matches tobramycin?",
    options: ["Tobrex", "Polytrim", "Floxin Otic", "Ery-Tab", "Cleocin"],
    answer: "Tobrex",
    explanation: "Tobramycin is sold as Tobrex. In this subsection, it is tested as a local eye therapy rather than a systemic aminoglycoside.",
    objective: .genericBrand,
    relatedDrugIds: ["d243"],
    tags: ["6e", "tobramycin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_015",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Floxin Otic is the fluoroquinolone otic/ophthalmic product remembered for being safe in perforated tympanic membranes. What is the generic name of Floxin Otic?",
    options: ["Ofloxacin", "Ciprofloxacin", "Moxifloxacin", "Tobramycin", "Polymyxin B/Trimethoprim"],
    answer: "Ofloxacin",
    explanation: "Floxin Otic is the brand name for ofloxacin otic. The perforated TM safety pearl is one of its most tested features.",
    objective: .brandGeneric,
    relatedDrugIds: ["d238"],
    tags: ["6e", "ofloxacin", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_016",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Ofloxacin is the fluoroquinolone in this subsection used as an otic and ophthalmic topical product. Which brand name matches ofloxacin?",
    options: ["Floxin Otic", "Cipro", "Avelox", "Tobrex", "Polytrim"],
    answer: "Floxin Otic",
    explanation: "Ofloxacin is sold as Floxin Otic. It is a topical fluoroquinolone rather than a systemic oral antibiotic in this context.",
    objective: .genericBrand,
    relatedDrugIds: ["d238"],
    tags: ["6e", "ofloxacin", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_017",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Polytrim is the combination ophthalmic antibiotic commonly used as first-line for bacterial pink eye. What is the generic name of Polytrim?",
    options: ["Polymyxin B/Trimethoprim", "Tobramycin", "Ofloxacin", "Erythromycin", "Ciprofloxacin"],
    answer: "Polymyxin B/Trimethoprim",
    explanation: "Polytrim is polymyxin B/trimethoprim ophthalmic solution. It is one of the most commonly prescribed eye drops for bacterial conjunctivitis.",
    objective: .brandGeneric,
    relatedDrugIds: ["d241"],
    tags: ["6e", "polytrim", "brand->generic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_018",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Polymyxin B/Trimethoprim is the ophthalmic combination antibiotic for bacterial conjunctivitis. Which brand name matches it?",
    options: ["Polytrim", "Tobrex", "Floxin Otic", "Ery-Tab", "Macrobid"],
    answer: "Polytrim",
    explanation: "Polymyxin B/Trimethoprim is sold as Polytrim. It is a topical eye therapy, not an oral or IV antibiotic.",
    objective: .genericBrand,
    relatedDrugIds: ["d241"],
    tags: ["6e", "polytrim", "generic->brand"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_019",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Zovirax is the nucleoside-analog antiviral used for HSV and VZV infections. What is the generic name of Zovirax?",
    options: ["Acyclovir", "Valacyclovir", "Oseltamivir", "Fluconazole", "Metronidazole"],
    answer: "Acyclovir",
    explanation: "Zovirax is the brand name for acyclovir. It is the classic herpes antiviral with important renal hydration counseling.",
    objective: .brandGeneric,
    relatedDrugIds: ["d226"],
    tags: ["6e", "acyclovir", "brand->generic", "supplement"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_020",
    subsectionId: "6e",
    difficulty: .easy,
    question: "Acyclovir is the nucleoside analog antiviral that treats HSV and VZV and requires good hydration to prevent renal toxicity. Which brand name matches acyclovir?",
    options: ["Zovirax", "Valtrex", "Tamiflu", "Diflucan", "Paxlovid"],
    answer: "Zovirax",
    explanation: "Acyclovir is sold as Zovirax. Keeping Zovirax linked to acyclovir helps separate it from Valtrex, which is valacyclovir.",
    objective: .genericBrand,
    relatedDrugIds: ["d226"],
    tags: ["6e", "acyclovir", "generic->brand", "supplement"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_021",
    subsectionId: "6e",
    difficulty: .medium,
    question: "A patient with seborrheic dermatitis is prescribed an antifungal shampoo. Which drug from this subsection is the classic choice for that indication?",
    options: ["Ketoconazole", "Fluconazole", "Terbinafine", "Nystatin", "Acyclovir"],
    answer: "Ketoconazole",
    explanation: "Ketoconazole shampoo is the classic topical treatment for seborrheic dermatitis and dandruff. Systemic ketoconazole is largely avoided due to toxicity.",
    objective: .indication,
    relatedDrugIds: ["d232"],
    tags: ["6e", "ketoconazole", "indication", "seborrheic"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_022",
    subsectionId: "6e",
    difficulty: .medium,
    question: "Which drug from this subsection is the classic first-line oral agent for a patient with vaginal candidiasis?",
    options: ["Fluconazole", "Nystatin", "Ketoconazole", "Terbinafine", "Metronidazole"],
    answer: "Fluconazole",
    explanation: "Fluconazole 150 mg single dose is the classic treatment for uncomplicated vaginal candidiasis.",
    objective: .dosing,
    relatedDrugIds: ["d231"],
    tags: ["6e", "fluconazole", "dosing", "vaginal-candidiasis"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_023",
    subsectionId: "6e",
    difficulty: .medium,
    question: "A patient is prescribed nitrofurantoin for an uncomplicated UTI. Which dosing regimen best matches the standard Macrobid course?",
    options: ["100 mg BID for 5 days", "500 mg once daily for 10 days", "250 mg TID for 14 days", "1 g single dose", "200 mg daily for 3 days"],
    answer: "100 mg BID for 5 days",
    explanation: "Macrobid (nitrofurantoin) is typically dosed at 100 mg BID for 5 days for uncomplicated cystitis.",
    objective: .dosing,
    relatedDrugIds: ["d236"],
    tags: ["6e", "nitrofurantoin", "dosing"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_024",
    subsectionId: "6e",
    difficulty: .medium,
    question: "A patient needs terbinafine for toenail onychomycosis. Which treatment duration is most accurate?",
    options: ["250 mg daily for 12 weeks", "250 mg daily for 3 days", "500 mg weekly for 6 months", "100 mg BID for 5 days", "150 mg single dose"],
    answer: "250 mg daily for 12 weeks",
    explanation: "Oral terbinafine for toenail onychomycosis is typically 250 mg daily for 12 weeks. Fingernail treatment is shorter at 6 weeks.",
    objective: .dosing,
    relatedDrugIds: ["d242"],
    tags: ["6e", "terbinafine", "dosing", "onychomycosis"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_025",
    subsectionId: "6e",
    difficulty: .medium,
    question: "An adult with influenza symptoms for 1 day is prescribed oseltamivir. Which treatment dose is correct?",
    options: ["75 mg BID for 5 days", "150 mg once daily for 10 days", "75 mg once daily for 5 days", "1 g single dose", "200 mg BID for 3 days"],
    answer: "75 mg BID for 5 days",
    explanation: "Oseltamivir treatment dose for adults is 75 mg BID for 5 days. For prophylaxis, it is 75 mg once daily for 10 days.",
    objective: .dosing,
    relatedDrugIds: ["d239"],
    tags: ["6e", "oseltamivir", "dosing", "treatment"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_026",
    subsectionId: "6e",
    difficulty: .medium,
    question: "Which antibiotic in this subsection carries a classic risk of adrenal suppression with systemic use, making topical formulations preferred?",
    options: ["Ketoconazole", "Fluconazole", "Terbinafine", "Nystatin", "Metronidazole"],
    answer: "Ketoconazole",
    explanation: "Systemic ketoconazole can cause adrenal suppression in addition to hepatotoxicity. Topical formulations avoid these systemic risks.",
    objective: .adverseEffect,
    relatedDrugIds: ["d232"],
    tags: ["6e", "ketoconazole", "adrenal-suppression", "safety"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_027",
    subsectionId: "6e",
    difficulty: .medium,
    question: "Which drug in this subsection can cause peripheral neuropathy with prolonged use, metallic taste, and a disulfiram-like reaction with alcohol?",
    options: ["Metronidazole", "Clindamycin", "Erythromycin", "Nitrofurantoin", "Fluconazole"],
    answer: "Metronidazole",
    explanation: "Metronidazole is the classic drug for the metallic taste + alcohol avoidance + peripheral neuropathy triad.",
    objective: .adverseEffect,
    relatedDrugIds: ["d233"],
    tags: ["6e", "metronidazole", "adverse-effect", "neuropathy"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_028",
    subsectionId: "6e",
    difficulty: .hard,
    question: "A patient with a history of severe penicillin anaphylaxis needs an oral antibiotic for strep pharyngitis. Which drug from this subsection is the best alternative to penicillin V?",
    options: ["Clindamycin", "Cefuroxime", "Nitrofurantoin", "Metronidazole", "Fluconazole"],
    answer: "Clindamycin",
    explanation: "Clindamycin is a commonly used alternative for strep pharyngitis in patients with severe penicillin allergy. Cephalosporins carry cross-reactivity risk in severe allergy.",
    objective: .indication,
    relatedDrugIds: ["d229", "d240"],
    tags: ["6e", "clindamycin", "strep", "penicillin-allergy", "mini-case"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_029",
    subsectionId: "6e",
    difficulty: .hard,
    question: "A patient on warfarin is diagnosed with oral thrush. Which antifungal from this subsection requires the MOST careful INR monitoring due to CYP interaction?",
    options: ["Fluconazole", "Nystatin", "Terbinafine", "Ketoconazole (topical)", "Acyclovir"],
    answer: "Fluconazole",
    explanation: "Fluconazole is a CYP2C9 and CYP3A4 inhibitor that can significantly raise warfarin levels. INR monitoring is essential. Nystatin is not absorbed and would avoid this interaction.",
    objective: .interaction,
    relatedDrugIds: ["d231", "d237"],
    tags: ["6e", "fluconazole", "warfarin", "interaction", "mini-case"],
    source: .curated
),

.multipleChoice(
    id: "q6e_sup_030",
    subsectionId: "6e",
    difficulty: .hard,
    question: "A patient with influenza is started on oseltamivir on day 4 of symptoms. The patient asks whether it will still help. Which statement is most accurate?",
    options: ["It may still provide some benefit but works best when started within 48 hours", "It is completely useless after 24 hours", "It works equally well regardless of timing", "It should be stopped immediately and replaced with acyclovir", "It only works if started before symptoms appear"],
    answer: "It may still provide some benefit but works best when started within 48 hours",
    explanation: "Oseltamivir is most effective within 48 hours of symptom onset but may still reduce complications in hospitalized or high-risk patients when started later.",
    objective: .pearl,
    relatedDrugIds: ["d239"],
    tags: ["6e", "oseltamivir", "timing", "pearl", "mini-case"],
    source: .curated
),

    ]
}
