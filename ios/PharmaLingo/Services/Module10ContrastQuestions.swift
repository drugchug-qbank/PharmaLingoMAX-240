import Foundation

extension DrugDataService {
    static let module10ContrastQuestions: [Question] = [

        // MARK: - 10a Contrast: Finasteride vs Tamsulosin
        .multipleChoice(id: "q10a_ctr_001", subsectionId: "10a", difficulty: .easy,
            question: "A patient with BPH asks which drug family relaxes smooth muscle for faster symptom relief rather than shrinking the prostate. Which micro-family fits?",
            options: ["Alpha-1 blocker", "5-alpha reductase inhibitor", "Beta-3 agonist", "Antimuscarinic", "PDE-5 inhibitor"],
            answer: "Alpha-1 blocker",
            explanation: "Alpha-1 blockers like tamsulosin relax prostate/bladder neck smooth muscle for quick BPH relief. 5-ARIs shrink the prostate slowly over months.",
            objective: .classId, relatedDrugIds: ["d188", "d189"], tags: ["10a", "micro-family", "contrast-pair", "differentiator"]),

        .multipleChoice(id: "q10a_ctr_002", subsectionId: "10a", difficulty: .medium,
            question: "Which best differentiates tamsulosin from finasteride in BPH management?",
            options: ["Tamsulosin provides faster symptom relief; finasteride slowly reduces prostate size", "Finasteride works faster than tamsulosin", "Both have identical mechanisms", "Tamsulosin shrinks the prostate; finasteride relaxes smooth muscle", "Neither is used for BPH"],
            answer: "Tamsulosin provides faster symptom relief; finasteride slowly reduces prostate size",
            explanation: "Tamsulosin (alpha-1 blocker) gives quicker symptomatic improvement. Finasteride (5-ARI) reduces prostate volume over months by lowering DHT.",
            objective: .mixedReview, relatedDrugIds: ["d188", "d189"], tags: ["10a", "contrast-pair", "differentiator"]),

        // MARK: - 10a Contrast: OAB Antimuscarinics vs Beta-3 Agonist
        .multipleChoice(id: "q10a_ctr_003", subsectionId: "10a", difficulty: .medium,
            question: "An older adult with OAB already has dry mouth and constipation from other medications. Which OAB drug avoids adding anticholinergic burden?",
            options: ["Mirabegron", "Oxybutynin", "Solifenacin", "Tamsulosin", "Phenazopyridine"],
            answer: "Mirabegron",
            explanation: "Mirabegron is a beta-3 agonist that avoids classic anticholinergic effects like dry mouth, constipation, and cognitive fog.",
            objective: .mixedReview, relatedDrugIds: ["d192", "d191", "d275"], tags: ["10a", "micro-family", "contrast-pair", "differentiator"]),

        .multipleChoice(id: "q10a_ctr_004", subsectionId: "10a", difficulty: .medium,
            question: "Which statement best differentiates solifenacin from mirabegron?",
            options: ["Solifenacin is antimuscarinic (dry mouth risk); mirabegron is beta-3 agonist (monitor BP)", "Both are beta-3 agonists", "Mirabegron causes more dry mouth than solifenacin", "Solifenacin is a beta-blocker", "They have identical side-effect profiles"],
            answer: "Solifenacin is antimuscarinic (dry mouth risk); mirabegron is beta-3 agonist (monitor BP)",
            explanation: "Solifenacin blocks muscarinic receptors (anticholinergic burden). Mirabegron stimulates beta-3 receptors (watch blood pressure).",
            objective: .mixedReview, relatedDrugIds: ["d275", "d192"], tags: ["10a", "contrast-pair", "differentiator"]),

        // MARK: - 10a Contrast: Sildenafil vs Tadalafil
        .multipleChoice(id: "q10a_ctr_005", subsectionId: "10a", difficulty: .hard,
            question: "A patient took a PDE-5 inhibitor yesterday and now needs nitroglycerin. Which PDE-5 inhibitor requires a 48-hour nitrate washout instead of 24 hours?",
            options: ["Tadalafil", "Sildenafil", "Tamsulosin", "Finasteride", "Mirabegron"],
            answer: "Tadalafil",
            explanation: "Tadalafil has a ~36-hour duration, so nitrates are avoided for 48 hours. Sildenafil's shorter duration requires ~24 hours.",
            objective: .contraindication, relatedDrugIds: ["d194", "d193"], tags: ["10a", "contrast-pair", "differentiator", "cant-miss"]),

        // MARK: - 10b Contrast: Antiresorptive vs Anabolic
        .multipleChoice(id: "q10b_ctr_001", subsectionId: "10b", difficulty: .easy,
            question: "In the bone health micro-family, which category does teriparatide belong to?",
            options: ["Anabolic (bone-building)", "Antiresorptive (prevents breakdown)", "RANKL inhibitor", "Bisphosphonate", "SERM"],
            answer: "Anabolic (bone-building)",
            explanation: "Teriparatide is the only anabolic PTH analog in 10b. All others (bisphosphonates, denosumab) are antiresorptive.",
            objective: .classId, relatedDrugIds: ["d175"], tags: ["10b", "micro-family", "category", "differentiator"]),

        .multipleChoice(id: "q10b_ctr_002", subsectionId: "10b", difficulty: .medium,
            question: "Which feature best differentiates denosumab from alendronate?",
            options: ["Denosumab is a RANKL inhibitor given SubQ q6months with rebound fracture risk if stopped; alendronate is an oral weekly bisphosphonate", "Both are oral bisphosphonates", "Alendronate is given SubQ; denosumab is oral", "Denosumab builds new bone; alendronate does not slow resorption", "They have identical administration requirements"],
            answer: "Denosumab is a RANKL inhibitor given SubQ q6months with rebound fracture risk if stopped; alendronate is an oral weekly bisphosphonate",
            explanation: "Denosumab (Prolia) = SubQ RANKL inhibitor, must not miss doses. Alendronate (Fosamax) = oral bisphosphonate, fasting/upright rules.",
            objective: .mixedReview, relatedDrugIds: ["d174", "d171"], tags: ["10b", "contrast-pair", "differentiator"]),

        .multipleChoice(id: "q10b_ctr_003", subsectionId: "10b", difficulty: .hard,
            question: "A patient cannot swallow oral pills reliably and has CrCl 30 mL/min. Which bone agent is the best fit: zoledronic acid or denosumab?",
            options: ["Denosumab — it avoids oral and IV bisphosphonate renal concerns, but requires close calcium monitoring in CKD", "Zoledronic acid — it has no renal dosing concerns", "Neither can be used in any patient with CKD", "Alendronate — it bypasses renal issues", "Teriparatide — it is first-line for all CKD patients"],
            answer: "Denosumab — it avoids oral and IV bisphosphonate renal concerns, but requires close calcium monitoring in CKD",
            explanation: "Zoledronic acid is contraindicated at CrCl <35. Denosumab can be used but carries a boxed warning for severe hypocalcemia in advanced CKD.",
            objective: .mixedReview, relatedDrugIds: ["d174", "d173"], tags: ["10b", "contrast-pair", "differentiator", "mini-case"]),

        // MARK: - 10c Contrast: Combined vs Progestin-Only
        .multipleChoice(id: "q10c_ctr_001", subsectionId: "10c", difficulty: .easy,
            question: "Which category does norethindrone (Micronor) belong to?",
            options: ["Progestin-only pill", "Combined oral contraceptive", "Vaginal ring", "SERM", "Depot injection"],
            answer: "Progestin-only pill",
            explanation: "Norethindrone is a progestin-only mini-pill with no estrogen component.",
            objective: .classId, relatedDrugIds: ["d184"], tags: ["10c", "micro-family", "category"]),

        .multipleChoice(id: "q10c_ctr_002", subsectionId: "10c", difficulty: .medium,
            question: "A 37-year-old smoker wants oral contraception. Why is a progestin-only pill safer than a combined oral contraceptive here?",
            options: ["Combined OCs carry a boxed cardiovascular warning in smokers over 35; progestin-only pills do not", "Progestin-only pills contain more estrogen", "Combined OCs have no cardiovascular risk", "Smoking only matters for IUD users", "Both carry the same smoking warning"],
            answer: "Combined OCs carry a boxed cardiovascular warning in smokers over 35; progestin-only pills do not",
            explanation: "Estrogen-containing OCs are contraindicated in smokers over 35 due to serious cardiovascular risk. Progestin-only options avoid this.",
            objective: .contraindication, relatedDrugIds: ["d184", "d177"], tags: ["10c", "contrast-pair", "differentiator"]),

        // MARK: - 10c Contrast: Estrogen vs SERM
        .multipleChoice(id: "q10c_ctr_003", subsectionId: "10c", difficulty: .hard,
            question: "A postmenopausal patient wants help with hot flashes AND osteoporosis prevention. Why is raloxifene a poor choice for the hot flash component?",
            options: ["Raloxifene can worsen hot flashes and raises VTE risk", "Raloxifene is the best treatment for hot flashes", "Raloxifene is an estrogen replacement", "Raloxifene is only available as a patch", "Hot flashes are not affected by SERMs"],
            answer: "Raloxifene can worsen hot flashes and raises VTE risk",
            explanation: "Raloxifene (SERM) helps bone and reduces breast cancer risk but worsens hot flashes. Systemic estrogen treats hot flashes but needs progestin if uterus is intact.",
            objective: .mixedReview, relatedDrugIds: ["d186", "d176"], tags: ["10c", "contrast-pair", "differentiator"]),

        // MARK: - 10c Contrast: Depot vs IUD
        .multipleChoice(id: "q10c_ctr_004", subsectionId: "10c", difficulty: .medium,
            question: "Which statement best differentiates Depo-Provera from Mirena?",
            options: ["Depo-Provera = IM q3months with bone density boxed warning; Mirena = IUD up to 8 years, also treats heavy bleeding", "Both are IUDs", "Mirena causes bone density loss; Depo-Provera does not", "Both last exactly the same duration", "Depo-Provera is inserted into the uterus"],
            answer: "Depo-Provera = IM q3months with bone density boxed warning; Mirena = IUD up to 8 years, also treats heavy bleeding",
            explanation: "Depo-Provera is an IM injection every 3 months with bone density concerns. Mirena is an IUD lasting up to 8 years, also indicated for heavy menstrual bleeding.",
            objective: .mixedReview, relatedDrugIds: ["d183", "d182"], tags: ["10c", "contrast-pair", "differentiator"]),

        // MARK: - 10e Contrast: Glaucoma Classes (Site-of-Use)
        .multipleChoice(id: "q10e_ctr_001", subsectionId: "10e", difficulty: .easy,
            question: "Latanoprost, timolol, dorzolamide, and brimonidine are all used for the same site. Where are these primarily used?",
            options: ["Ophthalmic (eye drops for glaucoma)", "Otic (ear drops)", "Topical skin", "Oral", "Nasal"],
            answer: "Ophthalmic (eye drops for glaucoma)",
            explanation: "All four are ophthalmic drops used to lower intraocular pressure in glaucoma.",
            objective: .classId, relatedDrugIds: ["d295", "d298", "d290", "d284"], tags: ["10e", "site-of-use", "micro-family", "category"]),

        .multipleChoice(id: "q10e_ctr_002", subsectionId: "10e", difficulty: .medium,
            question: "Which glaucoma drug class should be avoided in a patient with asthma?",
            options: ["Beta-blocker (timolol)", "Prostaglandin analog (latanoprost)", "Alpha-2 agonist (brimonidine)", "CAI (dorzolamide)", "Antihistamine (olopatadine)"],
            answer: "Beta-blocker (timolol)",
            explanation: "Timolol, even as an eye drop, can be absorbed systemically and cause bronchospasm in asthma/COPD patients.",
            objective: .contraindication, relatedDrugIds: ["d298"], tags: ["10e", "site-of-use", "differentiator", "cant-miss"]),

        .multipleChoice(id: "q10e_ctr_003", subsectionId: "10e", difficulty: .medium,
            question: "Which glaucoma drug class is typically first-line and applied once daily at bedtime?",
            options: ["Prostaglandin analog", "Beta-blocker", "CAI", "Alpha-2 agonist", "Antihistamine"],
            answer: "Prostaglandin analog",
            explanation: "Prostaglandin analogs (latanoprost, bimatoprost) are first-line for open-angle glaucoma and are applied once daily in the evening.",
            objective: .classId, relatedDrugIds: ["d295", "d283"], tags: ["10e", "micro-family", "site-specific"]),

        // MARK: - 10e Contrast: Topical Steroid Potency
        .multipleChoice(id: "q10e_ctr_004", subsectionId: "10e", difficulty: .easy,
            question: "Which topical steroid is super-high potency and should generally be limited to 2 weeks?",
            options: ["Clobetasol", "Triamcinolone", "Hydrocortisone", "Mupirocin", "Tretinoin"],
            answer: "Clobetasol",
            explanation: "Clobetasol (Temovate) is super-high potency. Prolonged use risks skin atrophy and HPA axis suppression.",
            objective: .classId, relatedDrugIds: ["d288"], tags: ["10e", "micro-family", "potency", "category"]),

        .multipleChoice(id: "q10e_ctr_005", subsectionId: "10e", difficulty: .medium,
            question: "A patient needs a topical steroid for a body rash but not on the face. Which potency level is triamcinolone?",
            options: ["Medium potency", "Super-high potency", "Low potency", "Ultra-low potency", "Not a steroid"],
            answer: "Medium potency",
            explanation: "Triamcinolone is a medium-potency topical steroid, more versatile than super-high potency clobetasol.",
            objective: .classId, relatedDrugIds: ["d300"], tags: ["10e", "micro-family", "potency", "category"]),

        // MARK: - 10e Contrast: Rescue/Antidote Site-of-Use
        .multipleChoice(id: "q10e_ctr_006", subsectionId: "10e", difficulty: .easy,
            question: "Which rescue agent is given IM into the outer mid-thigh for anaphylaxis?",
            options: ["Epinephrine (EpiPen)", "Atropine", "Flumazenil", "Timolol", "Tretinoin"],
            answer: "Epinephrine (EpiPen)",
            explanation: "EpiPen delivers epinephrine IM into the outer mid-thigh as first-line treatment for anaphylaxis.",
            objective: .indication, relatedDrugIds: ["d198"], tags: ["10e", "micro-family", "site-of-use", "category", "cant-miss"]),

        .multipleChoice(id: "q10e_ctr_007", subsectionId: "10e", difficulty: .medium,
            question: "Which reversal agent should be used cautiously in benzodiazepine-dependent patients because it can precipitate seizures?",
            options: ["Flumazenil", "Atropine", "Epinephrine", "Naloxone", "Latanoprost"],
            answer: "Flumazenil",
            explanation: "Flumazenil reverses benzodiazepines but can precipitate withdrawal seizures in dependent patients.",
            objective: .contraindication, relatedDrugIds: ["d200"], tags: ["10e", "micro-family", "site-of-use", "cant-miss"]),

        // MARK: - 10e Contrast: Supplements/Electrolytes
        .multipleChoice(id: "q10e_ctr_008", subsectionId: "10e", difficulty: .easy,
            question: "Which supplement is best absorbed on an empty stomach with vitamin C?",
            options: ["Ferrous sulfate (iron)", "Potassium chloride", "Vitamin D3", "Calcium carbonate", "Tretinoin"],
            answer: "Ferrous sulfate (iron)",
            explanation: "Iron is best absorbed on an empty stomach with vitamin C. Calcium, antacids, coffee, and tea reduce absorption.",
            objective: .pearl, relatedDrugIds: ["d196"], tags: ["10e", "micro-family", "site-of-use", "category"]),

        .multipleChoice(id: "q10e_ctr_009", subsectionId: "10e", difficulty: .medium,
            question: "Which oral supplement can cause severe GI irritation and esophageal ulceration if not taken with adequate water and food?",
            options: ["Potassium chloride", "Vitamin D3", "Ferrous sulfate", "Tretinoin", "Ciclopirox"],
            answer: "Potassium chloride",
            explanation: "Oral potassium chloride can cause GI irritation and esophageal ulceration, so it should be taken with food and a full glass of water.",
            objective: .adverseEffect, relatedDrugIds: ["d197"], tags: ["10e", "micro-family", "site-of-use", "category"]),

        // MARK: - 10e Contrast: Topical Derm Site-of-Use
        .multipleChoice(id: "q10e_ctr_010", subsectionId: "10e", difficulty: .easy,
            question: "Mupirocin (Bactroban) is a topical anti-infective. What is one of its highest-yield uses?",
            options: ["MRSA nasal decolonization", "Glaucoma treatment", "Acne maintenance", "Osteoporosis prevention", "Smoking cessation"],
            answer: "MRSA nasal decolonization",
            explanation: "Mupirocin nasal ointment is a key tool for MRSA nasal decolonization.",
            objective: .indication, relatedDrugIds: ["d296"], tags: ["10e", "micro-family", "site-of-use", "site-specific"]),

        .multipleChoice(id: "q10e_ctr_011", subsectionId: "10e", difficulty: .medium,
            question: "A patient on topical fluorouracil for actinic keratoses reports redness and erosion at the treatment site. Is this expected?",
            options: ["Yes — the inflammatory reaction means the drug is working on abnormal cells", "No — this is a severe allergic reaction", "No — the drug should never cause visible skin changes", "Yes — but only with oral fluorouracil", "No — it proves the lesions are benign"],
            answer: "Yes — the inflammatory reaction means the drug is working on abnormal cells",
            explanation: "Topical fluorouracil causes an expected inflammatory reaction at treatment sites. Patients should be counseled this is normal.",
            objective: .pearl, relatedDrugIds: ["d292"], tags: ["10e", "micro-family", "site-specific"]),

        // MARK: - 10e: Ophthalmic Allergy vs Glaucoma
        .multipleChoice(id: "q10e_ctr_012", subsectionId: "10e", difficulty: .easy,
            question: "Pataday (olopatadine) and Zaditor (ketotifen) are ophthalmic drops, but they treat a different condition than latanoprost. What do they treat?",
            options: ["Allergic conjunctivitis", "Open-angle glaucoma", "Bacterial conjunctivitis", "Cataracts", "Macular degeneration"],
            answer: "Allergic conjunctivitis",
            explanation: "Olopatadine and ketotifen are antihistamine/mast cell stabilizer eye drops for allergic conjunctivitis, not glaucoma.",
            objective: .indication, relatedDrugIds: ["d297", "d294"], tags: ["10e", "micro-family", "site-of-use", "differentiator"]),

        // MARK: - Cross-Subsection 10e "What Category" Questions
        .multipleChoice(id: "q10e_ctr_013", subsectionId: "10e", difficulty: .easy,
            question: "Ciclopirox (Penlac) is applied to the nail rather than the skin. What condition does it treat?",
            options: ["Onychomycosis (fungal nail infection)", "Glaucoma", "Acne vulgaris", "Psoriasis", "Anaphylaxis"],
            answer: "Onychomycosis (fungal nail infection)",
            explanation: "Ciclopirox nail lacquer is a topical antifungal used for onychomycosis.",
            objective: .indication, relatedDrugIds: ["d286"], tags: ["10e", "micro-family", "site-of-use", "site-specific"]),

        .multipleChoice(id: "q10e_ctr_014", subsectionId: "10e", difficulty: .medium,
            question: "Chlorhexidine (Hibiclens) is used for surgical skin prep. Which safety precaution is most important?",
            options: ["Avoid contact with eyes and ears — it can cause corneal damage and ototoxicity", "It is only effective against fungi", "It must be applied to mucous membranes only", "It is safe for direct instillation into the ear canal", "It only works on intact skin without any safety concerns"],
            answer: "Avoid contact with eyes and ears — it can cause corneal damage and ototoxicity",
            explanation: "Chlorhexidine can cause corneal damage if it enters the eyes and ototoxicity if it enters the middle ear.",
            objective: .adverseEffect, relatedDrugIds: ["d285"], tags: ["10e", "micro-family", "site-of-use", "cant-miss"]),
    ]
}
