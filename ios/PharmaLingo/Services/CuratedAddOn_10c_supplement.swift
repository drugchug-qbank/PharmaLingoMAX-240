import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_10c_supplement: [Question] = [
        .matching(id: "q10c_sup_001", subsectionId: "10c", difficulty: .medium,
            question: "Match each contraceptive/hormone to its brand name:",
            pairs: [
                MatchingPair(left: "Conjugated estrogens", right: "Premarin"),
                MatchingPair(left: "Levonorgestrel IUD", right: "Mirena"),
                MatchingPair(left: "Medroxyprogesterone depot", right: "Depo-Provera"),
                MatchingPair(left: "Raloxifene", right: "Evista")
            ],
            explanation: "Key brand-generic pairs for hormonal therapy and contraceptive medications.",
            objective: .brandGeneric, relatedDrugIds: ["d176", "d182", "d183", "d186"], tags: ["10c", "matching", "brand-generic"]),

        .matching(id: "q10c_sup_002", subsectionId: "10c", difficulty: .hard,
            question: "Match each contraceptive to its route of administration:",
            pairs: [
                MatchingPair(left: "Ethinyl estradiol/Etonogestrel", right: "Vaginal ring"),
                MatchingPair(left: "Levonorgestrel IUD", right: "Intrauterine"),
                MatchingPair(left: "Medroxyprogesterone depot", right: "IM injection q3 months"),
                MatchingPair(left: "Norethindrone", right: "Oral daily")
            ],
            explanation: "Each contraceptive in this subsection uses a different administration route.",
            objective: .dosing, relatedDrugIds: ["d179", "d182", "d183", "d184"], tags: ["10c", "matching", "route"]),

        .matching(id: "q10c_sup_003", subsectionId: "10c", difficulty: .hard,
            question: "Match each drug to its high-yield counseling pearl:",
            pairs: [
                MatchingPair(left: "Testosterone gel", right: "Avoid skin-to-skin transfer"),
                MatchingPair(left: "Progesterone capsules", right: "Take at bedtime (sedating)"),
                MatchingPair(left: "Raloxifene", right: "Increases VTE risk"),
                MatchingPair(left: "Drospirenone/EE", right: "Monitor potassium")
            ],
            explanation: "Each medication has a distinctive counseling point that is high yield for practice.",
            objective: .pearl, relatedDrugIds: ["d187", "d185", "d186", "d177"], tags: ["10c", "matching", "counseling"]),

        .selectAll(id: "q10c_sup_004", subsectionId: "10c", difficulty: .hard,
            question: "Select ALL combined oral contraceptives (contain both estrogen and progestin) in this subsection:",
            options: ["Drospirenone/EE", "EE/Levonorgestrel", "EE/Norgestimate", "Norethindrone", "Medroxyprogesterone depot"],
            correctAnswers: ["Drospirenone/EE", "EE/Levonorgestrel", "EE/Norgestimate"],
            explanation: "The three COCs contain ethinyl estradiol plus a progestin. Norethindrone is progestin-only and Depo-Provera is progestin-only injectable.",
            objective: .classId, relatedDrugIds: ["d177", "d180", "d182"], tags: ["10c", "select-all", "coc"]),

        .selectAll(id: "q10c_sup_005", subsectionId: "10c", difficulty: .hard,
            question: "Select ALL hormonal products that carry a boxed warning related to cardiovascular risk with smoking in women over 35:",
            options: ["Drospirenone/EE", "EE/Levonorgestrel", "EE/Norgestimate", "Norethindrone", "Raloxifene"],
            correctAnswers: ["Drospirenone/EE", "EE/Levonorgestrel", "EE/Norgestimate"],
            explanation: "All combined estrogen-containing oral contraceptives share the smoking/cardiovascular boxed warning. Progestin-only pills and SERMs do not carry this specific warning.",
            objective: .contraindication, relatedDrugIds: ["d177", "d180", "d182"], tags: ["10c", "select-all", "smoking-warning"]),

        .selectAll(id: "q10c_sup_006", subsectionId: "10c", difficulty: .hard,
            question: "Select ALL contraceptive options that are progestin-only (no estrogen):",
            options: ["Norethindrone", "Medroxyprogesterone depot", "Levonorgestrel IUD", "Drospirenone/EE", "EE/Etonogestrel ring"],
            correctAnswers: ["Norethindrone", "Medroxyprogesterone depot", "Levonorgestrel IUD"],
            explanation: "Norethindrone (mini-pill), Depo-Provera, and Mirena are progestin-only. The other two contain ethinyl estradiol.",
            objective: .classId, relatedDrugIds: ["d184", "d183", "d185"], tags: ["10c", "select-all", "progestin-only"]),

        .multipleChoice(id: "q10c_sup_007", subsectionId: "10c", difficulty: .hard,
            question: "Which contraceptive method has the longest duration of action in this subsection?",
            options: ["Levonorgestrel IUD (up to 8 years)", "Medroxyprogesterone depot (3 months)", "NuvaRing (3 weeks per cycle)", "Norethindrone (daily)", "Drospirenone/EE (daily)"],
            answer: "Levonorgestrel IUD (up to 8 years)",
            explanation: "Mirena provides the longest contraceptive duration at up to 8 years, far exceeding the other options.",
            objective: .mixedReview, relatedDrugIds: ["d185"], tags: ["10c", "differentiator", "duration"]),

        .multipleChoice(id: "q10c_sup_008", subsectionId: "10c", difficulty: .hard,
            question: "Which feature best distinguishes raloxifene from standard estrogen therapy?",
            options: ["It is a SERM that helps bone and reduces breast cancer risk but worsens hot flashes and raises VTE risk", "It is the preferred treatment for hot flashes", "It is a combined oral contraceptive", "It is a progestin used to protect the endometrium", "It is an androgen replacement therapy"],
            answer: "It is a SERM that helps bone and reduces breast cancer risk but worsens hot flashes and raises VTE risk",
            explanation: "Raloxifene acts as an estrogen agonist on bone but antagonist on breast tissue. Unlike estrogen, it does not treat hot flashes and can worsen them.",
            objective: .mixedReview, relatedDrugIds: ["d186"], tags: ["10c", "differentiator", "raloxifene"]),
    ]
}
