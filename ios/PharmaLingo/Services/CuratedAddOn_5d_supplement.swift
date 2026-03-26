import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5d_supplement: [Question] = [

    .matching(
        id: "q5d_sup_001",
        subsectionId: "5d",
        difficulty: .medium,
        question: "Match each DMARD or immunosuppressant to its brand name:",
        pairs: [
            MatchingPair(left: "Methotrexate", right: "Trexall/Rheumatrex"),
            MatchingPair(left: "Hydroxychloroquine", right: "Plaquenil"),
            MatchingPair(left: "Adalimumab", right: "Humira"),
            MatchingPair(left: "Tacrolimus", right: "Prograf"),
        ],
        explanation: "Methotrexate = Trexall/Rheumatrex, Hydroxychloroquine = Plaquenil, Adalimumab = Humira, Tacrolimus = Prograf.",
        objective: .brandGeneric,
        relatedDrugIds: ["d167", "d168", "d169", "d178"],
        tags: ["5d", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q5d_sup_002",
        subsectionId: "5d",
        difficulty: .hard,
        question: "Match each immunosuppressant to its signature adverse effect:",
        pairs: [
            MatchingPair(left: "Cyclosporine", right: "Gingival hyperplasia + hirsutism"),
            MatchingPair(left: "Tacrolimus", right: "Tremor + hyperglycemia"),
            MatchingPair(left: "Hydroxychloroquine", right: "Retinal toxicity"),
            MatchingPair(left: "Methotrexate", right: "Mucositis + hepatotoxicity"),
        ],
        explanation: "Cyclosporine is remembered for gingival hyperplasia and hirsutism. Tacrolimus for tremor and hyperglycemia. Hydroxychloroquine for retinal toxicity. Methotrexate for mucositis and hepatotoxicity.",
        objective: .adverseEffect,
        relatedDrugIds: ["d179", "d178", "d168", "d167"],
        tags: ["5d", "matching", "adverse-effect-differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q5d_sup_003",
        subsectionId: "5d",
        difficulty: .hard,
        question: "Select ALL calcineurin inhibitors from this subsection:",
        options: ["Tacrolimus", "Cyclosporine", "Methotrexate", "Azathioprine", "Mycophenolate mofetil"],
        correctAnswers: ["Tacrolimus", "Cyclosporine"],
        explanation: "Tacrolimus and cyclosporine are calcineurin inhibitors. Methotrexate and azathioprine are antimetabolites. Mycophenolate inhibits IMPDH.",
        objective: .classId,
        relatedDrugIds: ["d178", "d179", "d167", "d181", "d180"],
        tags: ["5d", "select-all", "calcineurin inhibitor"],
        source: .curated
    ),

    .selectAll(
        id: "q5d_sup_004",
        subsectionId: "5d",
        difficulty: .hard,
        question: "Select ALL drugs from this subsection that require TB screening before initiation:",
        options: ["Adalimumab", "Etanercept", "Methotrexate", "Hydroxychloroquine", "Tacrolimus"],
        correctAnswers: ["Adalimumab", "Etanercept"],
        explanation: "Anti-TNF biologics (adalimumab and etanercept) require latent TB screening before initiation due to risk of TB reactivation. The other drugs do not carry this specific requirement.",
        objective: .monitoring,
        relatedDrugIds: ["d169", "d170"],
        tags: ["5d", "select-all", "TB screening"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5d_sup_005",
        subsectionId: "5d",
        difficulty: .hard,
        question: "A 32-year-old woman with RA controlled on methotrexate tells her rheumatologist she wants to start a family within 6 months. What is the most appropriate next step regarding methotrexate?",
        options: ["Discontinue methotrexate well before conception because it is teratogenic", "Continue methotrexate throughout pregnancy at a reduced dose", "Switch to folic acid alone as the DMARD", "Double the methotrexate dose to achieve remission before pregnancy", "Add azathioprine to allow a lower methotrexate dose during pregnancy"],
        answer: "Discontinue methotrexate well before conception because it is teratogenic",
        explanation: "Methotrexate is a known teratogen and is contraindicated in pregnancy for non-neoplastic uses. It must be stopped well before conception, and alternative DMARDs such as hydroxychloroquine (safe in pregnancy for SLE/RA) should be considered.",
        objective: .contraindication,
        relatedDrugIds: ["d167"],
        tags: ["5d", "mini-case", "methotrexate", "pregnancy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5d_sup_006",
        subsectionId: "5d",
        difficulty: .hard,
        question: "A transplant patient on tacrolimus develops new-onset tremor, rising fasting glucose, and hyperkalemia. The trough level is above target. Which action is most appropriate?",
        options: ["Reduce the tacrolimus dose and recheck trough level", "Switch to grapefruit juice to lower drug levels naturally", "Add cyclosporine to split the immunosuppressive load", "Discontinue all immunosuppression immediately", "Increase tacrolimus because the symptoms indicate under-dosing"],
        answer: "Reduce the tacrolimus dose and recheck trough level",
        explanation: "Tremor, hyperglycemia, and hyperkalemia with a supratherapeutic trough are classic tacrolimus toxicity signs. Dose reduction with trough re-monitoring is appropriate. Tacrolimus and cyclosporine should never be used simultaneously.",
        objective: .monitoring,
        relatedDrugIds: ["d178"],
        tags: ["5d", "mini-case", "tacrolimus", "toxicity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5d_sup_007",
        subsectionId: "5d",
        difficulty: .hard,
        question: "A patient on adalimumab for Crohn's disease develops persistent cough, night sweats, and weight loss. A chest X-ray shows an upper lobe infiltrate. What should be suspected?",
        options: ["Tuberculosis reactivation", "Methotrexate pneumonitis", "Cyclosporine nephrotoxicity", "Hydroxychloroquine retinopathy", "Azathioprine hepatotoxicity"],
        answer: "Tuberculosis reactivation",
        explanation: "Anti-TNF biologics like adalimumab suppress TNF-mediated immune defense against TB. Cough, night sweats, weight loss, and an upper lobe infiltrate in a patient on adalimumab should raise immediate concern for TB reactivation.",
        objective: .adverseEffect,
        relatedDrugIds: ["d169"],
        tags: ["5d", "mini-case", "adalimumab", "TB"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5d_sup_008",
        subsectionId: "5d",
        difficulty: .medium,
        question: "Which feature best distinguishes etanercept from adalimumab for a student learning anti-TNF biologics?",
        options: ["Etanercept is a TNF receptor fusion protein; adalimumab is a monoclonal antibody", "Adalimumab is the fusion protein; etanercept is the antibody", "Only etanercept requires TB screening", "Only adalimumab is an anti-TNF agent", "Etanercept is a calcineurin inhibitor"],
        answer: "Etanercept is a TNF receptor fusion protein; adalimumab is a monoclonal antibody",
        explanation: "Etanercept (Enbrel) is a soluble TNF receptor fused to an Fc domain. Adalimumab (Humira) is a fully human monoclonal antibody against TNF-alpha. Both require TB screening and carry serious infection warnings.",
        objective: .pearl,
        relatedDrugIds: ["d170", "d169"],
        tags: ["5d", "differentiator", "etanercept", "adalimumab"],
        source: .curated
    ),

    ]
}
