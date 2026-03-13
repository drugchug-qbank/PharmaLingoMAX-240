import Foundation

extension DrugDataService {
    static let masteringGUBoneHormonesPreventionSubsectionId: String = "10f"

    static let curatedAddOnQuestions_10eMastery: [Question] = [

        .multipleChoice(
            id: "q10e_add_001",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .easy,
            question: "Flomax is one of the highest-yield BPH drugs because it improves urinary flow faster than prostate-shrinking agents. What is the generic name of Flomax?",
            options: ["Tamsulosin", "Finasteride", "Dutasteride", "Tadalafil", "Mirabegron"],
            answer: "Tamsulosin",
            explanation: "Flomax is the brand name for tamsulosin, a uroselective alpha-1 blocker used for symptomatic relief of BPH.",
            objective: .brandGeneric,
            relatedDrugIds: ["d188"],
            tags: ["Mastery", "10e", "tamsulosin", "brand-generic"]
        ),

        .multipleChoice(
            id: "q10e_add_002",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A man with bothersome BPH wants the medicine most likely to improve hesitancy and weak stream within days to weeks rather than slowly shrinking prostate tissue over months. Which drug best fits that goal?",
            options: ["Tamsulosin", "Finasteride", "Dutasteride", "Mirabegron", "Phenazopyridine"],
            answer: "Tamsulosin",
            explanation: "Tamsulosin relaxes smooth muscle in the prostate and bladder neck, so it improves urinary symptoms faster than 5-alpha reductase inhibitors, which work gradually by shrinking the prostate.",
            objective: .mixedReview,
            relatedDrugIds: ["d188", "d189", "d190"],
            tags: ["Mastery", "10e", "bph", "fast-relief"]
        ),

        .multipleChoice(
            id: "q10e_add_003",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient taking tamsulosin is told to take it about 30 minutes after the same meal each day. What is the main reason this counseling point is high yield?",
            options: ["It helps keep absorption and blood levels more consistent", "It completely prevents orthostatic hypotension", "It is required because the capsule must be taken with dairy products", "It allows the drug to shrink the prostate faster", "It turns tamsulosin into an extended-release product"],
            answer: "It helps keep absorption and blood levels more consistent",
            explanation: "Tamsulosin is taken about 30 minutes after the same meal each day to keep exposure more consistent and reduce avoidable variability.",
            objective: .dosing,
            relatedDrugIds: ["d188"],
            tags: ["Mastery", "10e", "tamsulosin", "same-meal"]
        ),

        .multipleChoice(
            id: "q10e_add_004",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A man has been taking finasteride for more than 6 months. How should a single PSA value generally be interpreted compared with a man not taking finasteride?",
            options: ["It should generally be doubled for comparison with typical reference expectations", "It should be cut in half again because finasteride raises PSA", "It becomes useless and should never be checked", "It should be interpreted exactly the same as in untreated men", "It should only be interpreted if testosterone is also elevated"],
            answer: "It should generally be doubled for comparison with typical reference expectations",
            explanation: "Finasteride lowers PSA, so isolated PSA values in men taking finasteride for six months or more are generally doubled for comparison with usual reference expectations.",
            objective: .monitoring,
            relatedDrugIds: ["d189"],
            tags: ["Mastery", "10e", "finasteride", "psa"]
        ),

        .multipleChoice(
            id: "q10e_add_005",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which counseling pearl is especially associated with dutasteride because of how long the drug persists in the body?",
            options: ["Do not donate blood until at least 6 months after the last dose", "Avoid plain water with each dose", "Always stop the medication 24 hours before intercourse", "Take it only at bedtime because of vivid dreams", "Use two forms of contraception for 24 hours after each dose"],
            answer: "Do not donate blood until at least 6 months after the last dose",
            explanation: "Men taking dutasteride should not donate blood until at least six months after the last dose to avoid exposing a pregnant transfusion recipient to the drug.",
            objective: .pearl,
            relatedDrugIds: ["d190"],
            tags: ["Mastery", "10e", "dutasteride", "blood-donation"]
        ),

        .multipleChoice(
            id: "q10e_add_006",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient with overactive bladder wants the non-anticholinergic option that relaxes the detrusor during storage by stimulating beta-3 receptors. Which drug best matches that description?",
            options: ["Mirabegron", "Oxybutynin", "Solifenacin", "Tamsulosin", "Phenazopyridine"],
            answer: "Mirabegron",
            explanation: "Mirabegron is a beta-3 agonist used for overactive bladder and is the non-anticholinergic option in this section.",
            objective: .classId,
            relatedDrugIds: ["d192"],
            tags: ["Mastery", "10e", "mirabegron", "class"]
        ),

        .multipleChoice(
            id: "q10e_add_007",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient with overactive bladder already has dry mouth and constipation and wants to avoid making those worse. Which module 10 drug class is most likely to cause those anticholinergic effects?",
            options: ["Oxybutynin and solifenacin", "Mirabegron", "Nicotine patch", "Alendronate", "Teriparatide"],
            answer: "Oxybutynin and solifenacin",
            explanation: "Oxybutynin and solifenacin are antimuscarinic bladder medications and commonly cause dry mouth and constipation.",
            objective: .adverseEffect,
            relatedDrugIds: ["d191", "d275"],
            tags: ["Mastery", "10e", "anticholinergic", "oab"]
        ),

        .multipleChoice(
            id: "q10e_add_008",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which overactive bladder medication is especially high yield for blood pressure monitoring because it can increase blood pressure?",
            options: ["Mirabegron", "Oxybutynin", "Solifenacin", "Phenazopyridine", "Nicotine gum"],
            answer: "Mirabegron",
            explanation: "Mirabegron can raise blood pressure, so blood pressure monitoring is a key counseling and safety point.",
            objective: .monitoring,
            relatedDrugIds: ["d192"],
            tags: ["Mastery", "10e", "mirabegron", "blood-pressure"]
        ),

        .multipleChoice(
            id: "q10e_add_009",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient starts an antibiotic for cystitis but still has bothersome burning with urination. Which drug from module 10 can help urinary discomfort while not treating the infection itself?",
            options: ["Phenazopyridine", "Tamsulosin", "Mirabegron", "Finasteride", "Nicotine lozenge"],
            answer: "Phenazopyridine",
            explanation: "Phenazopyridine is a urinary tract analgesic that can reduce dysuria symptoms, but it is not an antibacterial agent.",
            objective: .indication,
            relatedDrugIds: ["d274"],
            tags: ["Mastery", "10e", "phenazopyridine", "indication"]
        ),

        .multipleChoice(
            id: "q10e_add_010",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which counseling statement about phenazopyridine is most appropriate?",
            options: ["It may turn urine orange-red and is usually only used briefly with an antibacterial", "It should be continued long term to prevent recurrent UTIs", "It is the preferred monotherapy for pyelonephritis", "It must be taken on an empty stomach with plain water only", "It should be doubled if dysuria persists after 24 hours"],
            answer: "It may turn urine orange-red and is usually only used briefly with an antibacterial",
            explanation: "Phenazopyridine commonly discolors urine orange-red and is generally used only briefly for symptom relief rather than as a long-term therapy.",
            objective: .pearl,
            relatedDrugIds: ["d274"],
            tags: ["Mastery", "10e", "phenazopyridine", "counseling"]
        ),

        .multipleChoice(
            id: "q10e_add_011",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which module 10 medicine has the high-yield overlap of treating both erectile dysfunction and lower urinary tract symptoms from BPH?",
            options: ["Tadalafil", "Sildenafil", "Tamsulosin", "Phenazopyridine", "Mirabegron"],
            answer: "Tadalafil",
            explanation: "Tadalafil is approved for erectile dysfunction and also for lower urinary tract symptoms associated with BPH.",
            objective: .mixedReview,
            relatedDrugIds: ["d194"],
            tags: ["Mastery", "10e", "tadalafil", "bph-ed"]
        ),

        .multipleChoice(
            id: "q10e_add_012",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A man uses sublingual nitroglycerin for angina and asks for a drug from module 10 to help erectile dysfunction. Which option is most clearly contraindicated because of a dangerous nitrate interaction?",
            options: ["Sildenafil", "Phenazopyridine", "Finasteride", "Mirabegron", "Nicotine patch"],
            answer: "Sildenafil",
            explanation: "Sildenafil and other PDE-5 inhibitors are contraindicated with nitrates because the combination can cause profound hypotension.",
            objective: .contraindication,
            relatedDrugIds: ["d193"],
            tags: ["Mastery", "10e", "sildenafil", "nitrates"]
        ),

        .multipleChoice(
            id: "q10e_add_013",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .easy,
            question: "Prolia is a non-bisphosphonate osteoporosis medicine given every 6 months. What is the generic name of Prolia?",
            options: ["Denosumab", "Teriparatide", "Zoledronic acid", "Alendronate", "Risedronate"],
            answer: "Denosumab",
            explanation: "Prolia is the brand name for denosumab, a RANKL inhibitor used in osteoporosis.",
            objective: .brandGeneric,
            relatedDrugIds: ["d174"],
            tags: ["Mastery", "10e", "denosumab", "brand-generic"]
        ),

        .multipleChoice(
            id: "q10e_add_014",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient dislikes weekly pills and asks which osteoporosis medication in this module is typically administered once every 6 months by subcutaneous injection. Which answer is best?",
            options: ["Denosumab", "Alendronate", "Risedronate", "Teriparatide", "Phenazopyridine"],
            answer: "Denosumab",
            explanation: "Denosumab is given as a subcutaneous injection every 6 months for osteoporosis.",
            objective: .dosing,
            relatedDrugIds: ["d174"],
            tags: ["Mastery", "10e", "denosumab", "every-6-months"]
        ),

        .multipleChoice(
            id: "q10e_add_015",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "Which osteoporosis drug now carries a boxed warning for severe hypocalcemia in patients with advanced kidney disease?",
            options: ["Denosumab", "Alendronate", "Risedronate", "Teriparatide", "Raloxifene"],
            answer: "Denosumab",
            explanation: "Denosumab carries a boxed warning for severe hypocalcemia in patients with advanced kidney disease, so calcium status and kidney disease risk matter greatly.",
            objective: .contraindication,
            relatedDrugIds: ["d174"],
            tags: ["Mastery", "10e", "denosumab", "boxed-warning"]
        ),

        .multipleChoice(
            id: "q10e_add_016",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient at very high fracture risk is started on the daily injectable osteoporosis medicine that works as an anabolic PTH analog rather than a classic antiresorptive. Which drug best matches that mechanism?",
            options: ["Teriparatide", "Denosumab", "Alendronate", "Zoledronic acid", "Raloxifene"],
            answer: "Teriparatide",
            explanation: "Teriparatide is an anabolic parathyroid hormone analog used in selected patients at high fracture risk.",
            objective: .moa,
            relatedDrugIds: ["d175"],
            tags: ["Mastery", "10e", "teriparatide", "anabolic"]
        ),

        .multipleChoice(
            id: "q10e_add_017",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which osteoporosis drug from this module is the classic once-yearly intravenous bisphosphonate that must be infused over at least 15 minutes?",
            options: ["Zoledronic acid", "Teriparatide", "Denosumab", "Alendronate", "Risedronate"],
            answer: "Zoledronic acid",
            explanation: "Zoledronic acid is the annual IV bisphosphonate used for osteoporosis and is infused over at least 15 minutes.",
            objective: .dosing,
            relatedDrugIds: ["d173"],
            tags: ["Mastery", "10e", "zoledronic-acid", "annual-iv"]
        ),

        .multipleChoice(
            id: "q10e_add_018",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A patient with osteoporosis has achalasia and cannot reliably stay upright after taking oral medicines. Which module 10 bone medication is the poorest fit because of its esophageal administration precautions?",
            options: ["Alendronate", "Denosumab", "Teriparatide", "Zoledronic acid", "Raloxifene"],
            answer: "Alendronate",
            explanation: "Alendronate is contraindicated in patients with certain esophageal disorders or inability to remain upright after dosing because of esophageal injury risk.",
            objective: .contraindication,
            relatedDrugIds: ["d171"],
            tags: ["Mastery", "10e", "alendronate", "esophagus"]
        ),

        .multipleChoice(
            id: "q10e_add_019",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A postmenopausal woman with a uterus is taking systemic estrogen for hot flashes. Which additional hormone is commonly used to lower the risk of estrogen-induced endometrial hyperplasia?",
            options: ["Progesterone", "Testosterone", "Raloxifene", "Mirabegron", "Nicotine patch"],
            answer: "Progesterone",
            explanation: "A progestin or progesterone is commonly paired with systemic estrogen in patients with a uterus to reduce endometrial hyperplasia risk.",
            objective: .moa,
            relatedDrugIds: ["d186", "d277", "d280"],
            tags: ["Mastery", "10e", "estrogen", "progesterone"]
        ),

        .multipleChoice(
            id: "q10e_add_020",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "Which high-yield risk is especially associated with unopposed systemic estrogen therapy in a patient who still has a uterus?",
            options: ["Endometrial cancer risk", "Tendon rupture", "Severe hypocalcemia in advanced CKD", "Aplastic anemia", "Nicotine withdrawal seizures"],
            answer: "Endometrial cancer risk",
            explanation: "Unopposed systemic estrogen increases the risk of endometrial hyperplasia and endometrial cancer in patients with a uterus.",
            objective: .contraindication,
            relatedDrugIds: ["d186", "d277"],
            tags: ["Mastery", "10e", "estrogen", "endometrial-cancer"]
        ),

        .multipleChoice(
            id: "q10e_add_021",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A 39-year-old patient who smokes heavily asks about starting a combined estrogen-containing oral contraceptive. Which high-yield safety principle matters most?",
            options: ["Combined hormonal contraceptives are generally avoided because smoking markedly raises cardiovascular and thrombotic risk", "Smoking improves contraceptive efficacy, so no counseling is needed", "Smoking only matters if the patient is also taking nicotine gum", "The main issue is only orange urine from the contraceptive", "Combined hormonal contraceptives are preferred in heavy smokers because they lower blood pressure"],
            answer: "Combined hormonal contraceptives are generally avoided because smoking markedly raises cardiovascular and thrombotic risk",
            explanation: "Smoking, especially in older reproductive-age patients, substantially increases cardiovascular and thrombotic risk with estrogen-containing contraceptives.",
            objective: .contraindication,
            relatedDrugIds: ["d276", "d279", "d182", "d278"],
            tags: ["Mastery", "10e", "contraceptives", "smoking"]
        ),

        .multipleChoice(
            id: "q10e_add_022",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which combined hormonal contraceptive in this module is especially remembered for the drospirenone component and its high-yield hyperkalemia counseling pearl?",
            options: ["Drospirenone / ethinyl estradiol", "Ethinyl estradiol / levonorgestrel", "Ethinyl estradiol / norgestimate", "Norethindrone", "Levonorgestrel IUD"],
            answer: "Drospirenone / ethinyl estradiol",
            explanation: "Drospirenone has antimineralocorticoid activity, so hyperkalemia is a classic counseling and interaction pearl.",
            objective: .interaction,
            relatedDrugIds: ["d276"],
            tags: ["Mastery", "10e", "drospirenone", "hyperkalemia"]
        ),

        .multipleChoice(
            id: "q10e_add_023",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient choosing the ethinyl estradiol/etonogestrel vaginal ring wants to confirm the usual cycle. Which schedule is correct for the standard ring regimen?",
            options: ["Leave it in for 3 weeks, then remove it for 1 week", "Leave it in for 1 week, then remove it for 3 weeks", "Replace it every day", "Insert it only during intercourse", "Use it for 8 years before replacement"],
            answer: "Leave it in for 3 weeks, then remove it for 1 week",
            explanation: "The classic vaginal ring regimen is 3 weeks in place followed by 1 ring-free week.",
            objective: .dosing,
            relatedDrugIds: ["d278"],
            tags: ["Mastery", "10e", "nuvaring", "schedule"]
        ),

        .multipleChoice(
            id: "q10e_add_024",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "Which long-acting contraceptive in this module is approved for prevention of pregnancy for up to 8 years but for treatment of heavy menstrual bleeding for up to 5 years?",
            options: ["Levonorgestrel IUD (Mirena)", "Depot medroxyprogesterone", "Norethindrone", "NuvaRing", "Conjugated estrogens"],
            answer: "Levonorgestrel IUD (Mirena)",
            explanation: "Mirena is approved for contraception for up to 8 years and for heavy menstrual bleeding for up to 5 years.",
            objective: .mixedReview,
            relatedDrugIds: ["d185"],
            tags: ["Mastery", "10e", "mirena", "duration"]
        ),

        .multipleChoice(
            id: "q10e_add_025",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which module 10 contraceptive is especially high yield for a boxed warning about loss of bone mineral density with prolonged use?",
            options: ["Depot medroxyprogesterone (Depo-Provera)", "Levonorgestrel IUD", "Norethindrone", "NuvaRing", "Progesterone"],
            answer: "Depot medroxyprogesterone (Depo-Provera)",
            explanation: "Depot medroxyprogesterone carries a boxed warning about bone mineral density loss, which becomes more concerning with longer use.",
            objective: .contraindication,
            relatedDrugIds: ["d184"],
            tags: ["Mastery", "10e", "depo-provera", "boxed-warning"]
        ),

        .multipleChoice(
            id: "q10e_add_026",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient chooses a progestin-only pill because estrogen is not a good fit. Which counseling point is especially high yield for norethindrone mini-pills?",
            options: ["Take it at the same time every day because timing matters more than with many combined pills", "Take it only on days when intercourse is planned", "Skip doses during placebo weeks", "Always take two tablets together if one dose is late by one hour", "Take it only at bedtime with food to prevent orthostasis"],
            answer: "Take it at the same time every day because timing matters more than with many combined pills",
            explanation: "Progestin-only pills such as norethindrone are time-sensitive and should be taken at the same time every day.",
            objective: .dosing,
            relatedDrugIds: ["d183"],
            tags: ["Mastery", "10e", "norethindrone", "same-time"]
        ),

        .multipleChoice(
            id: "q10e_add_027",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient is prescribed oral micronized progesterone for menopausal hormone therapy support. Which counseling pearl is most accurate?",
            options: ["It is often taken at bedtime because it can cause drowsiness or dizziness", "It is used only as emergency contraception", "It should be chewed and parked like nicotine gum", "It is the best option for acute dysuria relief", "It is the preferred treatment for smoking cessation"],
            answer: "It is often taken at bedtime because it can cause drowsiness or dizziness",
            explanation: "Oral micronized progesterone can cause dizziness or drowsiness, so bedtime administration is a common counseling point.",
            objective: .pearl,
            relatedDrugIds: ["d280"],
            tags: ["Mastery", "10e", "progesterone", "bedtime"]
        ),

        .multipleChoice(
            id: "q10e_add_028",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A postmenopausal patient with osteoporosis and a prior deep-vein thrombosis asks about raloxifene. Why is this drug often a poor choice in that situation?",
            options: ["Raloxifene increases venous thromboembolism risk", "Raloxifene causes severe hypocalcemia in advanced CKD", "Raloxifene is contraindicated with all calcium supplements", "Raloxifene is only approved for smoking cessation", "Raloxifene permanently suppresses ovulation after one dose"],
            answer: "Raloxifene increases venous thromboembolism risk",
            explanation: "Raloxifene is a selective estrogen receptor modulator associated with an increased risk of venous thromboembolism.",
            objective: .contraindication,
            relatedDrugIds: ["d187"],
            tags: ["Mastery", "10e", "raloxifene", "vte"]
        ),

        .multipleChoice(
            id: "q10e_add_029",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which counseling point is especially important for testosterone gel products?",
            options: ["Avoid skin-to-skin transfer to others by following careful application and covering instructions", "Take it with plain water and remain upright for 30 minutes", "Use backup contraception for only 24 hours after each dose", "Chew and park it between the cheek and gum", "Stop nicotine patches while using it"],
            answer: "Avoid skin-to-skin transfer to others by following careful application and covering instructions",
            explanation: "Secondary exposure from testosterone gel is a major counseling point, so application-site precautions and handwashing matter.",
            objective: .pearl,
            relatedDrugIds: ["d281"],
            tags: ["Mastery", "10e", "testosterone", "transference"]
        ),

        .multipleChoice(
            id: "q10e_add_030",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A smoker wants steady all-day nicotine coverage plus something faster for breakthrough cravings. Which strategy best fits the most evidence-based approach in this module?",
            options: ["Nicotine patch plus nicotine gum or lozenge as needed", "Nicotine gum only once weekly", "Varenicline plus a nitrate", "Phenazopyridine plus a nicotine patch", "Alendronate plus nicotine gum"],
            answer: "Nicotine patch plus nicotine gum or lozenge as needed",
            explanation: "A long-acting nicotine patch paired with short-acting nicotine gum or lozenge is a common and effective combination strategy for smoking cessation.",
            objective: .mixedReview,
            relatedDrugIds: ["d301", "d302", "d303"],
            tags: ["Mastery", "10e", "smoking-cessation", "combination"]
        ),

        .multipleChoice(
            id: "q10e_add_031",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient asks how nicotine gum should be used correctly. Which counseling statement is best?",
            options: ["Chew it until it tingles, then park it between the cheek and gum", "Swallow it whole with water like a tablet", "Use it only right before bed", "Apply it to the skin and rotate sites daily", "Take it with acidic drinks to increase absorption"],
            answer: "Chew it until it tingles, then park it between the cheek and gum",
            explanation: "Nicotine gum is used with the classic chew-and-park technique to allow nicotine absorption through the oral mucosa.",
            objective: .pearl,
            relatedDrugIds: ["d302"],
            tags: ["Mastery", "10e", "nicotine-gum", "chew-and-park"]
        ),

        .multipleChoice(
            id: "q10e_add_032",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which instruction is most appropriate for nicotine lozenges used during a quit attempt?",
            options: ["Allow the lozenge to dissolve slowly in the mouth rather than chewing or swallowing it whole", "Apply the lozenge to a hair-free skin site each morning", "Take it only after meals with milk", "Break it in half and swallow each piece with water", "Use it only once daily regardless of cravings"],
            answer: "Allow the lozenge to dissolve slowly in the mouth rather than chewing or swallowing it whole",
            explanation: "Nicotine lozenges are meant to dissolve slowly in the mouth so nicotine can be absorbed through the oral mucosa.",
            objective: .pearl,
            relatedDrugIds: ["d303"],
            tags: ["Mastery", "10e", "nicotine-lozenge", "dissolve"]
        ),

        .multipleChoice(
            id: "q10e_add_033",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "Which smoking-cessation medicine from module 10 should generally be avoided in a patient with a seizure disorder or a history of bulimia or anorexia nervosa?",
            options: ["Bupropion SR", "Varenicline", "Nicotine patch", "Nicotine gum", "Nicotine lozenge"],
            answer: "Bupropion SR",
            explanation: "Bupropion lowers seizure threshold and is contraindicated in patients with seizure disorders and in patients with current or prior bulimia or anorexia nervosa.",
            objective: .contraindication,
            relatedDrugIds: ["d304"],
            tags: ["Mastery", "10e", "bupropion", "contraindication"]
        ),

        .multipleChoice(
            id: "q10e_add_034",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient picks bupropion SR for smoking cessation and asks when to start it relative to the quit date. Which answer is best?",
            options: ["Start it before the quit date so the medication is already on board when quitting begins", "Start it only after nicotine withdrawal becomes severe", "Use it only as needed for cravings", "Wait until 6 months after the quit date", "Start it only after a nicotine patch has completely failed"],
            answer: "Start it before the quit date so the medication is already on board when quitting begins",
            explanation: "Bupropion SR is typically started before the planned quit date so its therapeutic effect is present when the quit attempt begins.",
            objective: .dosing,
            relatedDrugIds: ["d304"],
            tags: ["Mastery", "10e", "bupropion", "quit-date"]
        ),

        .multipleChoice(
            id: "q10e_add_035",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "Which smoking-cessation medicine in this module works as a partial agonist at nicotinic receptors rather than as a nicotine replacement product?",
            options: ["Varenicline", "Nicotine patch", "Nicotine gum", "Nicotine lozenge", "Phenazopyridine"],
            answer: "Varenicline",
            explanation: "Varenicline is a nicotinic receptor partial agonist that reduces cravings and blunts the rewarding effects of smoking.",
            objective: .moa,
            relatedDrugIds: ["d305"],
            tags: ["Mastery", "10e", "varenicline", "mechanism"]
        ),

        .multipleChoice(
            id: "q10e_add_036",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient taking varenicline reports the most common dose-related adverse effect discussed during counseling. Which answer best fits?",
            options: ["Nausea", "Orange-red urine", "Severe hypocalcemia", "Esophageal ulceration", "Hyperprolactinemia"],
            answer: "Nausea",
            explanation: "Nausea is the most common adverse effect reported with varenicline and is often improved by proper titration and administration strategies.",
            objective: .adverseEffect,
            relatedDrugIds: ["d305"],
            tags: ["Mastery", "10e", "varenicline", "nausea"]
        ),

        .multipleChoice(
            id: "q10e_add_037",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "Which smoking-cessation medication is especially high yield for dose adjustment in severe renal impairment?",
            options: ["Varenicline", "Bupropion SR", "Nicotine gum", "Nicotine lozenge", "Nicotine patch"],
            answer: "Varenicline",
            explanation: "Varenicline requires dose reduction in severe renal impairment, making renal function an important consideration.",
            objective: .monitoring,
            relatedDrugIds: ["d305"],
            tags: ["Mastery", "10e", "varenicline", "renal"]
        ),

        .multipleChoice(
            id: "q10e_add_038",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A patient uses nitroglycerin for angina and asks whether sildenafil or tadalafil is safer to combine with it. Which answer is most accurate?",
            options: ["Neither should be combined with nitrates because both can cause dangerous hypotension", "Sildenafil is unsafe, but tadalafil is safe", "Tadalafil is unsafe, but sildenafil is safe", "Both are safe if taken with food", "Both are safe if the nitrate dose is low"],
            answer: "Neither should be combined with nitrates because both can cause dangerous hypotension",
            explanation: "Both sildenafil and tadalafil are PDE-5 inhibitors and both are contraindicated with nitrates because of hypotension risk.",
            objective: .interaction,
            relatedDrugIds: ["d193", "d194"],
            tags: ["Mastery", "10e", "pde5", "nitrates"]
        ),

        .multipleChoice(
            id: "q10e_add_039",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A man taking tamsulosin is scheduled for cataract surgery. Which counseling point is most important?",
            options: ["Tell the eye surgeon about current or prior tamsulosin use because of floppy iris risk", "Stop all medications in module 10 immediately without asking anyone", "Double the tamsulosin dose the night before surgery", "Switch to phenazopyridine on the day of surgery", "Take tamsulosin with grapefruit juice for better vision"],
            answer: "Tell the eye surgeon about current or prior tamsulosin use because of floppy iris risk",
            explanation: "Intraoperative floppy iris syndrome is a key counseling pearl with tamsulosin, so eye surgeons should be informed about current or prior use.",
            objective: .pearl,
            relatedDrugIds: ["d188"],
            tags: ["Mastery", "10e", "tamsulosin", "cataract"]
        ),

        .multipleChoice(
            id: "q10e_add_040",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A patient with overactive bladder also has chronic constipation, dry mouth, and narrow-angle glaucoma concerns. Which option from module 10 is often more attractive than antimuscarinic bladder drugs for those reasons?",
            options: ["Mirabegron", "Oxybutynin", "Solifenacin", "Phenazopyridine", "Tamsulosin"],
            answer: "Mirabegron",
            explanation: "Mirabegron is the non-anticholinergic option for overactive bladder and may be preferred when antimuscarinic adverse effects or cautions are problematic.",
            objective: .mixedReview,
            relatedDrugIds: ["d192", "d191", "d275"],
            tags: ["Mastery", "10e", "mirabegron", "compare"]
        ),

        .multipleChoice(
            id: "q10e_add_041",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient with enlarged prostate wants the drug most associated with gradually shrinking prostate tissue rather than rapidly relaxing smooth muscle. Which answer best fits?",
            options: ["Finasteride or dutasteride", "Tamsulosin", "Phenazopyridine", "Mirabegron", "Sildenafil"],
            answer: "Finasteride or dutasteride",
            explanation: "Finasteride and dutasteride are 5-alpha reductase inhibitors that gradually reduce prostate size, unlike tamsulosin, which mainly provides symptomatic smooth-muscle relaxation.",
            objective: .mixedReview,
            relatedDrugIds: ["d189", "d190", "d188"],
            tags: ["Mastery", "10e", "5ari", "prostate-size"]
        ),

        .multipleChoice(
            id: "q10e_add_042",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "A postmenopausal patient primarily wants relief of bothersome hot flashes but also has osteoporosis risk. Which drug from module 10 is a poor choice if the main symptom is vasomotor because it can worsen hot flashes and raises VTE risk?",
            options: ["Raloxifene", "Conjugated estrogens", "Estradiol", "Progesterone", "Mirena"],
            answer: "Raloxifene",
            explanation: "Raloxifene is not used to treat vasomotor symptoms and can worsen hot flashes while also increasing VTE risk.",
            objective: .contraindication,
            relatedDrugIds: ["d187"],
            tags: ["Mastery", "10e", "raloxifene", "hot-flashes"]
        ),

        .multipleChoice(
            id: "q10e_add_043",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A patient starting an antibiotic for UTI asks which module 10 medication may help burning and urgency over the next day or two while the antibiotic begins working. Which answer is best?",
            options: ["Phenazopyridine", "Finasteride", "Oxybutynin", "Alendronate", "Varenicline"],
            answer: "Phenazopyridine",
            explanation: "Phenazopyridine is used for short-term urinary symptom relief while definitive treatment addresses the underlying infection.",
            objective: .mixedReview,
            relatedDrugIds: ["d274"],
            tags: ["Mastery", "10e", "phenazopyridine", "uti-symptoms"]
        ),

        .multipleChoice(
            id: "q10e_add_044",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .medium,
            question: "A smoker wants one medicine that does not contain nicotine, can be started before the quit date, and is not used only when a craving suddenly appears. Which option best matches that description?",
            options: ["Bupropion SR", "Nicotine gum", "Nicotine lozenge", "Phenazopyridine", "Nicotine patch used only during a craving"],
            answer: "Bupropion SR",
            explanation: "Bupropion SR is a non-nicotine smoking-cessation medication that is started before the quit date rather than used as an on-demand product.",
            objective: .mixedReview,
            relatedDrugIds: ["d304"],
            tags: ["Mastery", "10e", "bupropion", "non-nicotine"]
        ),

        .multipleChoice(
            id: "q10e_add_045",
            subsectionId: DrugDataService.masteringGUBoneHormonesPreventionSubsectionId,
            difficulty: .hard,
            question: "Which module 10 pairing represents two different boxed-warning themes from the same overall module: one drug for contraception with bone mineral density loss, and one smoking-cessation drug with seizure-disorder and eating-disorder contraindications?",
            options: ["Depot medroxyprogesterone and bupropion SR", "Mirena and nicotine gum", "Conjugated estrogens and tamsulosin", "Alendronate and varenicline", "Phenazopyridine and tadalafil"],
            answer: "Depot medroxyprogesterone and bupropion SR",
            explanation: "Depot medroxyprogesterone is the contraceptive with the boxed warning about bone mineral density loss, while bupropion SR is the smoking-cessation medication avoided in seizure disorders and eating disorders.",
            objective: .mixedReview,
            relatedDrugIds: ["d184", "d304"],
            tags: ["Mastery", "10e", "cross-topic", "module-10"]
        ),

    ]
}
