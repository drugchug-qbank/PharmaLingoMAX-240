import Foundation

extension DrugDataService {
    static let curatedAddOnQuestions_8c_supplement: [Question] = [

    .matching(
        id: "q8c_sup_001",
        subsectionId: "8c",
        difficulty: .medium,
        question: "Match each bowel drug to its brand name:",
        pairs: [
            MatchingPair(left: "Polyethylene glycol", right: "MiraLAX"),
            MatchingPair(left: "Loperamide", right: "Imodium"),
            MatchingPair(left: "Linaclotide", right: "Linzess"),
            MatchingPair(left: "Bisacodyl", right: "Dulcolax"),
        ],
        explanation: "PEG = MiraLAX, Loperamide = Imodium, Linaclotide = Linzess, Bisacodyl = Dulcolax.",
        objective: .brandGeneric,
        relatedDrugIds: ["d141", "d258", "d257", "d143"],
        tags: ["8c", "matching", "brand-generic"],
        source: .curated
    ),

    .matching(
        id: "q8c_sup_002",
        subsectionId: "8c",
        difficulty: .hard,
        question: "Match each laxative to its mechanism:",
        pairs: [
            MatchingPair(left: "Bisacodyl", right: "Stimulant laxative"),
            MatchingPair(left: "Docusate", right: "Stool softener"),
            MatchingPair(left: "Lactulose", right: "Osmotic laxative"),
            MatchingPair(left: "Linaclotide", right: "GC-C agonist"),
        ],
        explanation: "Each constipation drug uses a different mechanism: stimulant, surfactant, osmotic, or GC-C receptor activation.",
        objective: .moa,
        relatedDrugIds: ["d143", "d142", "d256", "d257"],
        tags: ["8c", "matching", "mechanism"],
        source: .curated
    ),

    .selectAll(
        id: "q8c_sup_003",
        subsectionId: "8c",
        difficulty: .hard,
        question: "Select ALL drugs from this subsection that are osmotic laxatives:",
        options: ["Polyethylene glycol", "Lactulose", "Bisacodyl", "Docusate sodium", "Senna/Docusate"],
        correctAnswers: ["Polyethylene glycol", "Lactulose"],
        explanation: "MiraLAX (PEG) and lactulose both work osmotically to draw water into the bowel lumen. Bisacodyl is a stimulant; docusate is a softener; senna/docusate is a stimulant+softener combo.",
        objective: .classId,
        relatedDrugIds: ["d141", "d256"],
        tags: ["8c", "select-all", "osmotic-laxatives"],
        source: .curated
    ),

    .selectAll(
        id: "q8c_sup_004",
        subsectionId: "8c",
        difficulty: .hard,
        question: "Select ALL antidiarrheal agents in this subsection:",
        options: ["Loperamide", "Diphenoxylate/Atropine", "Docusate sodium", "Polyethylene glycol", "Bisacodyl"],
        correctAnswers: ["Loperamide", "Diphenoxylate/Atropine"],
        explanation: "Loperamide (Imodium) and diphenoxylate/atropine (Lomotil) are the two antidiarrheal agents. The others are laxatives or stool softeners.",
        objective: .classId,
        relatedDrugIds: ["d258", "d255"],
        tags: ["8c", "select-all", "antidiarrheals"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8c_sup_005",
        subsectionId: "8c",
        difficulty: .hard,
        question: "A cirrhotic patient is admitted with confusion, asterixis, and elevated ammonia. Which laxative is the most appropriate first-line therapy for this presentation?",
        options: ["Lactulose", "Polyethylene glycol", "Bisacodyl", "Linaclotide", "Docusate sodium"],
        answer: "Lactulose",
        explanation: "Lactulose is the classic first-line agent for hepatic encephalopathy. It acidifies the colon, trapping ammonia as ammonium ions and reducing systemic ammonia levels.",
        objective: .indication,
        relatedDrugIds: ["d256"],
        tags: ["8c", "mini-case", "lactulose", "hepatic-encephalopathy"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8c_sup_006",
        subsectionId: "8c",
        difficulty: .hard,
        question: "A 25-year-old presents to the ED with syncope and a wide-complex tachycardia on monitor. Toxicology history reveals she has been taking massive doses of an OTC antidiarrheal. Which drug is most likely responsible?",
        options: ["Loperamide", "Diphenoxylate/Atropine", "Docusate sodium", "Bisacodyl", "Lactulose"],
        answer: "Loperamide",
        explanation: "Supratherapeutic loperamide doses can cause life-threatening QT prolongation, torsades de pointes, and ventricular arrhythmias. This is a high-yield safety pearl for OTC drug abuse.",
        objective: .adverseEffect,
        relatedDrugIds: ["d258"],
        tags: ["8c", "mini-case", "loperamide", "cardiac-toxicity"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8c_sup_007",
        subsectionId: "8c",
        difficulty: .hard,
        question: "A patient starting scheduled oxycodone after surgery asks how to prevent constipation. Which bowel regimen is the classic prophylactic choice?",
        options: ["Senna/Docusate", "Loperamide", "Linaclotide", "Polyethylene glycol with electrolytes", "Diphenoxylate/Atropine"],
        answer: "Senna/Docusate",
        explanation: "Senna/docusate (Senokot-S) is the standard prophylactic bowel regimen for opioid-induced constipation, combining a stimulant laxative with a stool softener.",
        objective: .pearl,
        relatedDrugIds: ["d260"],
        tags: ["8c", "mini-case", "opioid-constipation", "senna-docusate"],
        source: .curated
    ),

    .multipleChoice(
        id: "q8c_sup_008",
        subsectionId: "8c",
        difficulty: .medium,
        question: "Which feature best differentiates lactulose from polyethylene glycol among osmotic laxatives?",
        options: ["Lactulose also lowers ammonia in hepatic encephalopathy", "Lactulose is a stimulant rather than osmotic", "PEG causes more bloating than lactulose", "PEG is prescription-only while lactulose is OTC", "They have identical clinical uses"],
        answer: "Lactulose also lowers ammonia in hepatic encephalopathy",
        explanation: "Both are osmotic laxatives, but lactulose uniquely treats hepatic encephalopathy by acidifying the colon and trapping ammonia. PEG is the more common first-line OTC constipation agent.",
        objective: .pearl,
        relatedDrugIds: ["d256", "d141"],
        tags: ["8c", "differentiator", "lactulose", "PEG"],
        source: .curated
    ),

    .trueFalse(
        id: "q8c_sup_009",
        subsectionId: "8c",
        difficulty: .easy,
        question: "MiraLAX (polyethylene glycol) is considered a first-line OTC option for chronic constipation.",
        answer: true,
        explanation: "True. PEG 3350 (MiraLAX) is a well-established first-line OTC osmotic laxative for chronic constipation in adults.",
        objective: .indication,
        relatedDrugIds: ["d141"],
        tags: ["8c", "true-false", "MiraLAX", "first-line"],
        source: .curated
    ),

    .fillBlank(
        id: "q8c_sup_010",
        subsectionId: "8c",
        difficulty: .medium,
        question: "Linaclotide should be taken on an empty stomach at least ___ minutes before the first meal.",
        options: ["30", "10", "60", "120"],
        answer: "30",
        explanation: "Linaclotide (Linzess) should be taken at least 30 minutes before the first meal of the day for optimal efficacy.",
        objective: .dosing,
        relatedDrugIds: ["d257"],
        tags: ["8c", "fill-blank", "linaclotide", "timing"],
        source: .curated
    )

    ]
}
