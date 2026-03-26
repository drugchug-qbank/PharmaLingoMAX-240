import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_5c_supplement: [Question] = [

    .matching(
        id: "q5c_sup_001",
        subsectionId: "5c",
        difficulty: .medium,
        question: "Match each gout medication to its brand name:",
        pairs: [
            MatchingPair(left: "Allopurinol", right: "Zyloprim"),
            MatchingPair(left: "Colchicine", right: "Colcrys"),
            MatchingPair(left: "Febuxostat", right: "Uloric"),
        ],
        explanation: "Allopurinol = Zyloprim, Colchicine = Colcrys, Febuxostat = Uloric.",
        objective: .brandGeneric,
        relatedDrugIds: ["d176", "d157", "d177"],
        tags: ["5c", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q5c_sup_002",
        subsectionId: "5c",
        difficulty: .hard,
        question: "Match each gout drug to its primary role:",
        pairs: [
            MatchingPair(left: "Allopurinol", right: "First-line chronic urate lowering"),
            MatchingPair(left: "Colchicine", right: "Acute flare treatment and prophylaxis"),
            MatchingPair(left: "Febuxostat", right: "Alternative urate lowering with CV boxed warning"),
        ],
        explanation: "Allopurinol is the first-line xanthine oxidase inhibitor. Colchicine treats flares and provides prophylaxis. Febuxostat is reserved for patients who cannot use allopurinol and carries a boxed CV warning.",
        objective: .indication,
        relatedDrugIds: ["d176", "d157", "d177"],
        tags: ["5c", "matching", "role-differentiator"],
        source: .curated
    ),

    .selectAll(
        id: "q5c_sup_003",
        subsectionId: "5c",
        difficulty: .hard,
        question: "Select ALL xanthine oxidase inhibitors from this subsection:",
        options: ["Allopurinol", "Febuxostat", "Colchicine"],
        correctAnswers: ["Allopurinol", "Febuxostat"],
        explanation: "Allopurinol and febuxostat both inhibit xanthine oxidase to lower uric acid production. Colchicine is an anti-inflammatory gout agent that disrupts microtubule-dependent inflammation.",
        objective: .classId,
        relatedDrugIds: ["d176", "d177", "d157"],
        tags: ["5c", "select-all", "xanthine oxidase"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5c_sup_004",
        subsectionId: "5c",
        difficulty: .hard,
        question: "A 55-year-old man with recurrent gout is started on allopurinol. Three weeks later he develops a diffuse maculopapular rash with mucosal involvement. Which action is most appropriate?",
        options: ["Stop allopurinol immediately and evaluate for SJS/TEN", "Continue allopurinol and add an antihistamine", "Increase the allopurinol dose to push through the rash", "Switch to daily colchicine as the sole long-term therapy", "Add febuxostat on top of allopurinol"],
        answer: "Stop allopurinol immediately and evaluate for SJS/TEN",
        explanation: "A rash with mucosal involvement after starting allopurinol raises concern for severe hypersensitivity including SJS/TEN. The drug must be stopped immediately. HLA-B*58:01 testing may be relevant in high-risk populations.",
        objective: .adverseEffect,
        relatedDrugIds: ["d176"],
        tags: ["5c", "mini-case", "allopurinol", "SJS"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5c_sup_005",
        subsectionId: "5c",
        difficulty: .hard,
        question: "A patient on colchicine 0.6 mg twice daily for gout prophylaxis is prescribed clarithromycin for a sinus infection. Her GFR is 35 mL/min. What is the biggest concern?",
        options: ["Life-threatening colchicine toxicity from CYP3A4/P-gp inhibition in renal impairment", "Clarithromycin will lower uric acid too much", "Colchicine will block clarithromycin absorption", "The combination causes QT prolongation only", "There is no meaningful interaction"],
        answer: "Life-threatening colchicine toxicity from CYP3A4/P-gp inhibition in renal impairment",
        explanation: "Clarithromycin is a strong CYP3A4 and P-gp inhibitor. Colchicine is a CYP3A4/P-gp substrate. In a patient with renal impairment, this combination can cause fatal colchicine toxicity including multi-organ failure.",
        objective: .interaction,
        relatedDrugIds: ["d157"],
        tags: ["5c", "mini-case", "colchicine", "clarithromycin"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5c_sup_006",
        subsectionId: "5c",
        difficulty: .hard,
        question: "A patient with gout and Crohn's disease takes azathioprine. The rheumatologist wants to start urate-lowering therapy. Which option is safest?",
        options: ["Use allopurinol with major azathioprine dose reduction and close CBC monitoring", "Start febuxostat at full dose alongside azathioprine", "Use colchicine as the sole chronic urate-lowering drug", "Add both allopurinol and febuxostat simultaneously", "Double the azathioprine dose to offset the interaction"],
        answer: "Use allopurinol with major azathioprine dose reduction and close CBC monitoring",
        explanation: "Both allopurinol and febuxostat interact with azathioprine, but febuxostat is contraindicated with it. Allopurinol can be used if the azathioprine dose is reduced by approximately 75% and CBC is monitored closely.",
        objective: .interaction,
        relatedDrugIds: ["d176", "d177", "d181"],
        tags: ["5c", "mini-case", "allopurinol", "azathioprine"],
        source: .curated
    ),

    .multipleChoice(
        id: "q5c_sup_007",
        subsectionId: "5c",
        difficulty: .medium,
        question: "Which feature best differentiates febuxostat from allopurinol in a clinical decision?",
        options: ["Febuxostat carries a boxed warning for increased CV death and is reserved for allopurinol failures", "Febuxostat is first-line for all gout patients", "Allopurinol has the boxed CV warning, not febuxostat", "Febuxostat is an anti-inflammatory, not a urate-lowering drug", "Febuxostat requires HLA-B*58:01 testing before initiation"],
        answer: "Febuxostat carries a boxed warning for increased CV death and is reserved for allopurinol failures",
        explanation: "Febuxostat is reserved for patients who cannot adequately use allopurinol because of its boxed warning about increased cardiovascular death risk compared to allopurinol.",
        objective: .pearl,
        relatedDrugIds: ["d177", "d176"],
        tags: ["5c", "differentiator", "febuxostat", "allopurinol"],
        source: .curated
    ),

    ]
}
