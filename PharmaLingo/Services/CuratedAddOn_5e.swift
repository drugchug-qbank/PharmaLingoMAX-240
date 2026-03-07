// PharmaLingo — Systemic Steroids in Rheum
// Curated Add-On Question Pack (45 questions)
// IDs: q5e_add_001 ... q5e_add_045
//
// IMPORTANT INTEGRATION NOTE
// - 5e is a review-only mastery-style subsection in the vNext outline and current repo.
// - These questions should be appended AFTER the app auto-builds the mastery pool in DrugDataService.init().
// - This pack is designed to mirror the integration pattern used for previous mastery sections.
//
// Integration (recommended):
// 1) Add this file to your project.
// 2) In DrugDataService.init(), inside the mastery-generation loop:
//        for sub in mod.subsections where sub.isMasteryQuiz { ... }
//    immediately after:
//        bank[sub.id] = mastery
//    append:
//        if sub.id == Self.systemicSteroidsInRheumSubsectionId {
//            bank[sub.id]?.append(contentsOf: Self.curatedAddOnQuestions_5eMastery)
//        }
//
// Notes:
// - Single-best-answer multiple choice (5 options each).
// - Review-only across 5a–5d with crossover to 3f systemic corticosteroids.
// - No clinical-trial questions.
//
// Generated on: 2026-03-07

import Foundation

extension DrugDataService {
    /// Target subsection for the Module 5 steroid review quiz.
    static let systemicSteroidsInRheumSubsectionId: String = "5e"

    static let curatedAddOnQuestions_5eMastery: [Question] = [
        .multipleChoice(
            id: "q5e_add_001",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "A patient with newly diagnosed rheumatoid arthritis is starting methotrexate, but the team wants a fast anti-inflammatory bridge while waiting for the DMARD to take effect. Which drug best fits that short-term bridge role?",
            options: ["Prednisone", "Methotrexate", "Hydroxychloroquine", "Allopurinol", "Gabapentin"],
            answer: "Prednisone",
            explanation: "Prednisone is often used as a short-term bridge because it works quickly for inflammation, while methotrexate takes time to provide disease control.",
            objective: .indication,
            relatedDrugIds: ["d163", "d167"],
            tags: ["Mastery", "5e", "prednisone", "methotrexate", "bridge therapy"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_002",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Deltasone is a systemic corticosteroid commonly used in rheumatology for short tapers and flare control. What is the generic name of Deltasone?",
            options: ["Prednisone", "Prednisolone", "Methylprednisolone", "Dexamethasone", "Hydrocortisone"],
            answer: "Prednisone",
            explanation: "Deltasone is the brand name for prednisone, one of the most commonly taught oral systemic corticosteroids.",
            objective: .brandGeneric,
            relatedDrugIds: ["d163"],
            tags: ["Deltasone", "prednisone", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_003",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Prednisone is a high-yield oral glucocorticoid used for inflammatory flares when fast symptom control is needed. Which brand name matches prednisone in your bank?",
            options: ["Deltasone", "Decadron", "Medrol", "Cortef", "Celebrex"],
            answer: "Deltasone",
            explanation: "Prednisone pairs with the brand name Deltasone.",
            objective: .genericBrand,
            relatedDrugIds: ["d163"],
            tags: ["prednisone", "Deltasone", "generic->brand"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_004",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A learner is counseling a patient who says prednisone keeps them awake at night. What administration pearl best teaches how to reduce insomnia while matching the body's normal cortisol rhythm?",
            options: ["Take it in the morning, ideally with food", "Take it at bedtime to avoid daytime hunger", "Take it only every other week", "Crush it into juice at night", "Use it only as needed for pain"],
            answer: "Take it in the morning, ideally with food",
            explanation: "Morning dosing helps mimic normal cortisol timing and may reduce insomnia; taking it with food can also help limit GI upset.",
            objective: .dosing,
            relatedDrugIds: ["d163"],
            tags: ["prednisone", "morning dosing", "insomnia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_005",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient has taken prednisone daily for several weeks and feels better, so they want to stop it all at once. Which counseling point is most important?",
            options: ["It usually should be tapered rather than stopped abruptly after prolonged use", "It is safe to stop suddenly once pain improves", "It should be doubled for 2 days before stopping", "Only eye drops require tapering", "Abrupt discontinuation mainly matters with NSAIDs, not steroids"],
            answer: "It usually should be tapered rather than stopped abruptly after prolonged use",
            explanation: "After prolonged systemic corticosteroid use, tapering is important because abrupt discontinuation can precipitate adrenal suppression or withdrawal symptoms.",
            objective: .dosing,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["steroids", "taper", "adrenal suppression"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_006",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "A patient with diabetes has a sharp rise in glucose after starting a steroid burst for an autoimmune flare. Which adverse effect best explains this pattern?",
            options: ["Hyperglycemia", "Hypoglycemia", "Hyponatremia", "Bradycardia", "Photosensitivity"],
            answer: "Hyperglycemia",
            explanation: "Systemic corticosteroids commonly raise blood glucose, which is especially important in patients with diabetes or prediabetes.",
            objective: .adverseEffect,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["steroids", "hyperglycemia", "adverse effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_007",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient has needed repeated prednisone tapers and is now facing longer-term therapy for inflammatory disease. Which long-term toxicity deserves bone-health prevention and monitoring?",
            options: ["Osteoporosis", "Neutropenia", "Ototoxicity", "Blue-gray skin discoloration", "Drug-induced Parkinsonism"],
            answer: "Osteoporosis",
            explanation: "Chronic systemic corticosteroid exposure accelerates bone loss, so osteoporosis prevention and monitoring are high-yield long-term counseling points.",
            objective: .monitoring,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["steroids", "osteoporosis", "monitoring"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_008",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "A patient on immunosuppressive-dose prednisone asks about vaccines before travel. Which statement is most accurate?",
            options: ["Live vaccines are generally avoided while on immunosuppressive corticosteroid doses", "All vaccines are equally safe and effective during high-dose steroid therapy", "Only influenza vaccine is contraindicated; all others are preferred", "Vaccination issues matter with methotrexate but not prednisone", "Steroids increase vaccine response, so live vaccines are preferred"],
            answer: "Live vaccines are generally avoided while on immunosuppressive corticosteroid doses",
            explanation: "Immunosuppressive corticosteroid doses can make live vaccines unsafe, so this is a classic counseling pearl for systemic steroid therapy.",
            objective: .contraindication,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["steroids", "live vaccines", "immunosuppression"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_009",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Cortef and Solu-Cortef are names that often appear when students compare mineralocorticoid activity among corticosteroids. What is the generic name of Cortef/Solu-Cortef?",
            options: ["Hydrocortisone", "Prednisone", "Methylprednisolone", "Dexamethasone", "Celecoxib"],
            answer: "Hydrocortisone",
            explanation: "Cortef and Solu-Cortef are brand names for hydrocortisone.",
            objective: .brandGeneric,
            relatedDrugIds: ["d166"],
            tags: ["hydrocortisone", "Cortef", "Solu-Cortef", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_010",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "Which corticosteroid from your bank is most associated with physiologic replacement and relatively greater mineralocorticoid activity?",
            options: ["Hydrocortisone", "Dexamethasone", "Methylprednisolone", "Celecoxib", "Etanercept"],
            answer: "Hydrocortisone",
            explanation: "Hydrocortisone is the most “cortisol-like” option here and is classically remembered for replacement therapy and greater mineralocorticoid activity.",
            objective: .pearl,
            relatedDrugIds: ["d166"],
            tags: ["hydrocortisone", "replacement", "mineralocorticoid"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_011",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Decadron is commonly remembered as the very potent long-acting steroid in this family. What is the generic name of Decadron?",
            options: ["Dexamethasone", "Prednisone", "Hydrocortisone", "Methylprednisolone", "Methotrexate"],
            answer: "Dexamethasone",
            explanation: "Decadron is the brand name for dexamethasone.",
            objective: .brandGeneric,
            relatedDrugIds: ["d165"],
            tags: ["dexamethasone", "Decadron", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_012",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient with significant edema and hypertension needs a steroid, so the clinician wants one with minimal sodium-retaining activity. Which option best fits that pearl?",
            options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Naproxen", "Ibuprofen"],
            answer: "Dexamethasone",
            explanation: "Dexamethasone is remembered for essentially no mineralocorticoid activity, making it a useful contrast with hydrocortisone.",
            objective: .pearl,
            relatedDrugIds: ["d165", "d166"],
            tags: ["dexamethasone", "edema", "mineralocorticoid"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_013",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "When comparing systemic steroids, which one is classically taught as the most potent and longest acting among the four in this bank?",
            options: ["Dexamethasone", "Hydrocortisone", "Prednisone", "Methylprednisolone", "Celecoxib"],
            answer: "Dexamethasone",
            explanation: "Among these listed corticosteroids, dexamethasone is the high-yield choice for greatest potency and longest duration.",
            objective: .pearl,
            relatedDrugIds: ["d165", "d163", "d164", "d166"],
            tags: ["dexamethasone", "potency", "long half-life"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_014",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Medrol and Solu-Medrol are names students often see in inpatient autoimmune flare management. What is the generic name of Medrol/Solu-Medrol?",
            options: ["Methylprednisolone", "Prednisone", "Hydrocortisone", "Dexamethasone", "Hydroxychloroquine"],
            answer: "Methylprednisolone",
            explanation: "Medrol and Solu-Medrol are brand names for methylprednisolone.",
            objective: .brandGeneric,
            relatedDrugIds: ["d164"],
            tags: ["methylprednisolone", "Medrol", "Solu-Medrol", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_015",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A hospitalized patient with a severe autoimmune flare needs a high-yield steroid that is commonly given IV in acute settings. Which drug best matches that use?",
            options: ["Methylprednisolone", "Celecoxib", "Hydroxychloroquine", "Allopurinol", "Gabapentin"],
            answer: "Methylprednisolone",
            explanation: "IV methylprednisolone (Solu-Medrol) is a classic choice for severe inflammatory flares in the hospital.",
            objective: .indication,
            relatedDrugIds: ["d164"],
            tags: ["methylprednisolone", "IV", "acute flare"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_016",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Which medication below is a systemic glucocorticoid rather than an NSAID, DMARD, or biologic?",
            options: ["Prednisone", "Celecoxib", "Methotrexate", "Adalimumab", "Allopurinol"],
            answer: "Prednisone",
            explanation: "Prednisone is a systemic corticosteroid. Celecoxib is an NSAID, methotrexate is a DMARD, adalimumab is a biologic, and allopurinol lowers uric acid.",
            objective: .classId,
            relatedDrugIds: ["d163", "d154", "d167", "d169", "d176"],
            tags: ["prednisone", "class identification"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_017",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A student wants the RA drug from this module that actually modifies disease activity and often serves as the anchor DMARD, rather than just giving rapid anti-inflammatory relief like prednisone. Which drug is that?",
            options: ["Methotrexate", "Prednisone", "Acetaminophen", "Ketorolac", "Naloxone"],
            answer: "Methotrexate",
            explanation: "Methotrexate is the anchor DMARD for many rheumatoid arthritis regimens, whereas prednisone is often used as a bridge or for flare control.",
            objective: .indication,
            relatedDrugIds: ["d167", "d163"],
            tags: ["methotrexate", "RA", "anchor DMARD"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_018",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "Methotrexate is so high yield that dosing mistakes are dangerous. Which statement is correct for rheumatoid arthritis teaching?",
            options: ["Methotrexate for RA is usually given once weekly, not daily", "Methotrexate for RA should be taken every 6 hours during flares", "Methotrexate is only used as a one-time IV pulse", "Methotrexate should be taken only with live vaccines", "Methotrexate is an opioid-sparing analgesic, not a DMARD"],
            answer: "Methotrexate for RA is usually given once weekly, not daily",
            explanation: "Once-weekly dosing is one of the most important methotrexate safety pearls in rheumatology education.",
            objective: .dosing,
            relatedDrugIds: ["d167"],
            tags: ["methotrexate", "weekly dosing", "safety"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_019",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient taking methotrexate for RA develops mouth sores, and the team adds a supplement to reduce that toxicity. Which supplement is classically paired with methotrexate?",
            options: ["Folic acid", "Vitamin C", "Niacin", "Magnesium oxide", "Fish oil"],
            answer: "Folic acid",
            explanation: "Folic acid is commonly used with methotrexate to reduce adverse effects such as mouth sores and some GI intolerance.",
            objective: .interaction,
            relatedDrugIds: ["d167"],
            tags: ["methotrexate", "folic acid", "mucositis"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_020",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "After months of repeated prednisone use, a patient develops central weight gain, round facies, and easy bruising. Which steroid toxicity pattern does this teach?",
            options: ["Cushingoid effects", "Tardive dyskinesia", "Serotonin syndrome", "Stevens-Johnson syndrome", "Ototoxicity"],
            answer: "Cushingoid effects",
            explanation: "Long-term systemic corticosteroid exposure can cause Cushingoid features such as moon facies, central weight gain, and skin changes.",
            objective: .adverseEffect,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["steroids", "Cushingoid", "adverse effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_021",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Plaquenil is a familiar rheumatology brand that is often chosen for milder inflammatory disease and SLE maintenance. What is the generic name of Plaquenil?",
            options: ["Hydroxychloroquine", "Methotrexate", "Azathioprine", "Cyclosporine", "Colchicine"],
            answer: "Hydroxychloroquine",
            explanation: "Plaquenil is the brand name for hydroxychloroquine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d168"],
            tags: ["Plaquenil", "hydroxychloroquine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_022",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "Hydroxychloroquine can be an excellent steroid-sparing option in some autoimmune disease states, but what monitoring pearl must students remember?",
            options: ["Periodic eye exams for retinal toxicity", "Weekly INR checks", "Daily potassium checks", "Routine audiology testing", "Serum uric acid every morning"],
            answer: "Periodic eye exams for retinal toxicity",
            explanation: "Hydroxychloroquine is high yield for retinal toxicity, so baseline and periodic ophthalmic monitoring are key teaching points.",
            objective: .monitoring,
            relatedDrugIds: ["d168"],
            tags: ["hydroxychloroquine", "retina", "eye exam"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_023",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Humira is a major biologic used when rheumatologic disease needs more than short prednisone bursts and conventional DMARDs alone. What is the generic name of Humira?",
            options: ["Adalimumab", "Etanercept", "Infliximab", "Hydroxychloroquine", "Tacrolimus"],
            answer: "Adalimumab",
            explanation: "Humira is the brand name for adalimumab.",
            objective: .brandGeneric,
            relatedDrugIds: ["d169"],
            tags: ["Humira", "adalimumab", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_024",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Enbrel is another high-yield rheumatology biologic that learners should not confuse with Humira. What is the generic name of Enbrel?",
            options: ["Etanercept", "Adalimumab", "Azathioprine", "Methotrexate", "Cyclobenzaprine"],
            answer: "Etanercept",
            explanation: "Enbrel is the brand name for etanercept.",
            objective: .brandGeneric,
            relatedDrugIds: ["d170"],
            tags: ["Enbrel", "etanercept", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_025",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "Humira and Enbrel are examples of which high-yield rheumatology class that requires infection vigilance and latent TB screening before initiation?",
            options: ["Anti-TNF biologics", "Xanthine oxidase inhibitors", "Calcineurin inhibitors", "COX-2 selective NSAIDs", "Gabapentinoids"],
            answer: "Anti-TNF biologics",
            explanation: "Adalimumab and etanercept are anti-TNF biologics, and a major teaching pearl is serious infection risk including TB reactivation.",
            objective: .classId,
            relatedDrugIds: ["d169", "d170"],
            tags: ["anti-TNF", "TB screening", "class identification"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_026",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient on adalimumab develops fever and cough after escalating immunosuppressive therapy. Which counseling point best matches this biologic?",
            options: ["Adalimumab increases the risk of serious infections, including TB reactivation", "Adalimumab mainly causes ototoxicity and hearing loss", "Adalimumab must always be taken once daily with food", "Adalimumab is used for acute gout attacks only", "Adalimumab reverses opioid overdose"],
            answer: "Adalimumab increases the risk of serious infections, including TB reactivation",
            explanation: "Adalimumab is an anti-TNF biologic, and serious infection risk including tuberculosis is one of its most important warnings.",
            objective: .adverseEffect,
            relatedDrugIds: ["d169"],
            tags: ["adalimumab", "infection risk", "TB"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_027",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Imuran is an immunosuppressant that sometimes appears in autoimmune disease and transplant regimens. What is the generic name of Imuran?",
            options: ["Azathioprine", "Mycophenolate mofetil", "Tacrolimus", "Cyclosporine", "Methotrexate"],
            answer: "Azathioprine",
            explanation: "Imuran is the brand name for azathioprine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d181"],
            tags: ["Imuran", "azathioprine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_028",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with chronic gout is already taking allopurinol and is now prescribed azathioprine. Which interaction pearl is most important?",
            options: ["Allopurinol can dangerously increase azathioprine toxicity", "Azathioprine prevents allopurinol rash, so the combo is preferred", "The combination mainly causes ototoxicity and tinnitus", "The combination is used to reverse acute steroid withdrawal", "There is no meaningful interaction between these two drugs"],
            answer: "Allopurinol can dangerously increase azathioprine toxicity",
            explanation: "Allopurinol inhibits xanthine oxidase and can markedly increase azathioprine toxicity, making this a classic high-yield interaction.",
            objective: .interaction,
            relatedDrugIds: ["d176", "d181"],
            tags: ["allopurinol", "azathioprine", "interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_029",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient remains on long-term prednisone because disease control has been difficult. Besides glucose and bone health, what additional monitoring pearl should students remember for chronic systemic steroid use?",
            options: ["Watch for cataracts and glaucoma with eye monitoring", "Check serum digoxin levels weekly", "Obtain routine audiology tests for ototoxicity", "Measure INR because prednisone is a vitamin K antagonist", "Screen for retinal toxicity exactly like hydroxychloroquine"],
            answer: "Watch for cataracts and glaucoma with eye monitoring",
            explanation: "Long-term systemic corticosteroids can contribute to cataracts and glaucoma, so eye-related toxicity is another high-yield monitoring point.",
            objective: .monitoring,
            relatedDrugIds: ["d163", "d164", "d165", "d166"],
            tags: ["steroids", "cataracts", "glaucoma"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_030",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "Which calcineurin inhibitor is classically associated with nephrotoxicity, hypertension, gingival hyperplasia, and hirsutism?",
            options: ["Cyclosporine", "Tacrolimus", "Hydroxychloroquine", "Etanercept", "Prednisone"],
            answer: "Cyclosporine",
            explanation: "Cyclosporine is high yield for nephrotoxicity plus the classic cosmetic clues of gingival hyperplasia and hirsutism.",
            objective: .adverseEffect,
            relatedDrugIds: ["d179"],
            tags: ["cyclosporine", "gingival hyperplasia", "hirsutism"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_031",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Prograf is a narrow-therapeutic-index immunosuppressant used heavily in transplant medicine and sometimes discussed alongside rheum immunosuppressants. What is the generic name of Prograf?",
            options: ["Tacrolimus", "Cyclosporine", "Azathioprine", "Adalimumab", "Methotrexate"],
            answer: "Tacrolimus",
            explanation: "Prograf is the brand name for tacrolimus.",
            objective: .brandGeneric,
            relatedDrugIds: ["d178"],
            tags: ["Prograf", "tacrolimus", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_032",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "Which calcineurin inhibitor is more classically tied to tremor, hyperglycemia, and hyperkalemia than to hirsutism and gingival hyperplasia?",
            options: ["Tacrolimus", "Cyclosporine", "Hydrocortisone", "Celecoxib", "Allopurinol"],
            answer: "Tacrolimus",
            explanation: "Tacrolimus is often remembered for tremor and hyperglycemia, whereas cyclosporine is more associated with gingival hyperplasia and hirsutism.",
            objective: .adverseEffect,
            relatedDrugIds: ["d178", "d179"],
            tags: ["tacrolimus", "tremor", "hyperglycemia"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_033",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient asks whether grapefruit juice is safe with their immunosuppressant. Which drug in this bank is most classically linked to that counseling pearl?",
            options: ["Cyclosporine", "Hydroxychloroquine", "Methotrexate", "Prednisone", "Celecoxib"],
            answer: "Cyclosporine",
            explanation: "Cyclosporine is classically taught with grapefruit avoidance because grapefruit can alter its metabolism and toxicity risk.",
            objective: .interaction,
            relatedDrugIds: ["d179"],
            tags: ["cyclosporine", "grapefruit", "interaction"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_034",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Celebrex is often chosen when learners want an NSAID example that is relatively COX-2 selective. What is the generic name of Celebrex?",
            options: ["Celecoxib", "Etodolac", "Meloxicam", "Diclofenac", "Ibuprofen"],
            answer: "Celecoxib",
            explanation: "Celebrex is the brand name for celecoxib.",
            objective: .brandGeneric,
            relatedDrugIds: ["d154"],
            tags: ["Celebrex", "celecoxib", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_035",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "Celecoxib reduces inflammation and pain through which high-yield mechanism?",
            options: ["Selective COX-2 inhibition", "Direct TNF blockade", "Xanthine oxidase inhibition", "Calcineurin inhibition", "Serotonin reuptake inhibition"],
            answer: "Selective COX-2 inhibition",
            explanation: "Celecoxib is a COX-2 selective NSAID, a distinction that helps explain its relatively lower GI toxicity than many nonselective NSAIDs.",
            objective: .moa,
            relatedDrugIds: ["d154"],
            tags: ["celecoxib", "COX-2", "mechanism"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_036",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A student wants the IV/IM NSAID from this module that is limited to a very short course because toxicity climbs quickly. Which option fits that teaching pearl?",
            options: ["Ketorolac", "Naproxen", "Celecoxib", "Hydroxychloroquine", "Acetaminophen"],
            answer: "Ketorolac",
            explanation: "Ketorolac is the classic IV/IM NSAID that should generally be limited to 5 days maximum.",
            objective: .dosing,
            relatedDrugIds: ["d156"],
            tags: ["ketorolac", "5 days", "acute pain"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_037",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Which analgesic in this module is useful for pain and fever but does NOT provide meaningful anti-inflammatory effect?",
            options: ["Acetaminophen", "Prednisone", "Celecoxib", "Ibuprofen", "Naproxen"],
            answer: "Acetaminophen",
            explanation: "Acetaminophen is analgesic and antipyretic but is not considered an anti-inflammatory drug like NSAIDs or systemic corticosteroids.",
            objective: .classId,
            relatedDrugIds: ["d155"],
            tags: ["acetaminophen", "no anti-inflammatory", "class identification"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_038",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Colcrys is a high-yield drug for acute gout flares and prophylaxis discussions. What is the generic name of Colcrys?",
            options: ["Colchicine", "Allopurinol", "Febuxostat", "Prednisone", "Indomethacin"],
            answer: "Colchicine",
            explanation: "Colcrys is the brand name for colchicine.",
            objective: .brandGeneric,
            relatedDrugIds: ["d157"],
            tags: ["Colcrys", "colchicine", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_039",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient treated with colchicine for gout develops cramping and loose stools. Which adverse effect is most classically associated with colchicine?",
            options: ["Diarrhea", "Dry cough", "Hyperkalemia", "Bradycardia", "Photosensitivity"],
            answer: "Diarrhea",
            explanation: "Diarrhea is the classic dose-limiting GI adverse effect of colchicine.",
            objective: .adverseEffect,
            relatedDrugIds: ["d157"],
            tags: ["colchicine", "diarrhea", "adverse effect"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_040",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .easy,
            question: "Uloric is reserved for chronic gout management when students compare xanthine oxidase inhibitors. What is the generic name of Uloric?",
            options: ["Febuxostat", "Allopurinol", "Colchicine", "Methotrexate", "Prednisone"],
            answer: "Febuxostat",
            explanation: "Uloric is the brand name for febuxostat.",
            objective: .brandGeneric,
            relatedDrugIds: ["d177"],
            tags: ["Uloric", "febuxostat", "brand->generic"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_041",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "Which gout medication in this bank carries a boxed warning about increased cardiovascular death risk and is usually reserved for patients who cannot use allopurinol adequately?",
            options: ["Febuxostat", "Colchicine", "Prednisone", "Acetaminophen", "Hydroxychloroquine"],
            answer: "Febuxostat",
            explanation: "Febuxostat is the xanthine oxidase inhibitor with the high-yield boxed warning about increased cardiovascular death risk.",
            objective: .adverseEffect,
            relatedDrugIds: ["d177"],
            tags: ["febuxostat", "boxed warning", "cardiovascular death"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_042",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .medium,
            question: "A patient asks which drug is meant to lower uric acid over time for chronic gout prevention rather than provide immediate flare relief today. Which option best fits that role?",
            options: ["Allopurinol", "Prednisone", "Colchicine", "Ketorolac", "Hydrocortisone"],
            answer: "Allopurinol",
            explanation: "Allopurinol is used for long-term urate lowering and chronic gout prevention, not as the main immediate anti-inflammatory treatment for an acute flare.",
            objective: .indication,
            relatedDrugIds: ["d176"],
            tags: ["allopurinol", "chronic gout", "urate lowering"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_043",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "A patient with an acute gout flare cannot use NSAIDs because of GI bleeding risk and has trouble tolerating colchicine. Which option from your overall bank is a reasonable anti-inflammatory alternative often used in that situation?",
            options: ["Prednisone", "Allopurinol", "Febuxostat", "Hydroxychloroquine", "Gabapentin"],
            answer: "Prednisone",
            explanation: "Systemic corticosteroids such as prednisone are common anti-inflammatory alternatives for acute gout flares when NSAIDs or colchicine are not good options.",
            objective: .indication,
            relatedDrugIds: ["d163", "d157", "d176", "d177"],
            tags: ["prednisone", "acute gout", "alternative"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_044",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "A patient is already on prednisone for inflammatory disease and now wants to add ibuprofen every day for pain. What risk is most important to teach when combining those two anti-inflammatory drugs?",
            options: ["Higher risk of GI ulceration and bleeding", "Guaranteed hypoglycemia", "Reversal of prednisone effect", "Severe ototoxicity in most patients", "Complete loss of ibuprofen absorption"],
            answer: "Higher risk of GI ulceration and bleeding",
            explanation: "Systemic steroids and NSAIDs together can substantially increase GI irritation, ulcer risk, and bleeding risk.",
            objective: .interaction,
            relatedDrugIds: ["d163", "d152"],
            tags: ["prednisone", "ibuprofen", "GI bleeding"],
            source: .curated
        ),

        .multipleChoice(
            id: "q5e_add_045",
            subsectionId: DrugDataService.systemicSteroidsInRheumSubsectionId,
            difficulty: .hard,
            question: "A patient on chronic prednisone has osteoarthritis pain and a history of peptic ulcer disease. If the goal is pain control without adding another anti-inflammatory drug that worsens GI bleeding risk, which option best fits?",
            options: ["Acetaminophen", "Ibuprofen", "Naproxen", "Ketorolac", "Indomethacin"],
            answer: "Acetaminophen",
            explanation: "Acetaminophen can help pain without adding the same anti-inflammatory GI-bleeding burden that comes with NSAIDs, which matters in a patient already on prednisone with ulcer risk.",
            objective: .pearl,
            relatedDrugIds: ["d155", "d163", "d152", "d153", "d156", "d222"],
            tags: ["acetaminophen", "ulcer history", "prednisone"],
            source: .curated
        )

    ]
}
