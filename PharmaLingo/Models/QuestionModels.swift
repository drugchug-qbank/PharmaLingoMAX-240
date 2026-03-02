import Foundation

nonisolated enum QuestionType: String, Sendable {
    case trueFalse
    case fillBlank
    case multipleChoice
    case matching
    case selectAll
}

nonisolated enum QuestionDifficulty: Int, Sendable, Comparable {
    case easy = 1
    case medium = 2
    case hard = 3
    case expert = 4

    nonisolated static func < (lhs: Self, rhs: Self) -> Bool { lhs.rawValue < rhs.rawValue }

    var label: String {
        switch self {
        case .easy: "Easy"
        case .medium: "Medium"
        case .hard: "Hard"
        case .expert: "Expert"
        }
    }
}

nonisolated enum QuestionObjective: String, Sendable {
    case brandGeneric
    case genericBrand
    case classId
    case suffixId
    case indication
    case adverseEffect
    case contraindication
    case monitoring
    case interaction
    case pearl
    case moa
    case mixedReview
}

nonisolated enum QuestionSource: String, Sendable {
    case curated
    case generated
}

nonisolated struct MatchingPair: Hashable, Sendable {
    let left: String
    let right: String
}

nonisolated struct Question: Identifiable, Sendable {
    let id: String
    let subsectionId: String
    let type: QuestionType
    let difficulty: QuestionDifficulty
    let questionText: String
    let options: [String]
    let correctAnswer: String
    let correctAnswers: Set<String>
    let matchingPairs: [MatchingPair]
    let explanation: String
    let objective: QuestionObjective
    let relatedDrugIds: [String]
    let tags: [String]
    let source: QuestionSource

    init(
        id: String,
        subsectionId: String,
        type: QuestionType,
        difficulty: QuestionDifficulty,
        questionText: String,
        options: [String],
        correctAnswer: String,
        correctAnswers: Set<String>,
        matchingPairs: [MatchingPair],
        explanation: String,
        objective: QuestionObjective = .mixedReview,
        relatedDrugIds: [String] = [],
        tags: [String] = [],
        source: QuestionSource = .curated
    ) {
        self.id = id
        self.subsectionId = subsectionId
        self.type = type
        self.difficulty = difficulty
        self.questionText = questionText
        self.options = options
        self.correctAnswer = correctAnswer
        self.correctAnswers = correctAnswers
        self.matchingPairs = matchingPairs
        self.explanation = explanation
        self.objective = objective
        self.relatedDrugIds = relatedDrugIds
        self.tags = tags
        self.source = source
    }

    static func trueFalse(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .easy,
        question: String, answer: Bool, explanation: String,
        objective: QuestionObjective = .mixedReview, relatedDrugIds: [String] = [], tags: [String] = [], source: QuestionSource = .curated
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .trueFalse, difficulty: difficulty,
            questionText: question, options: ["True", "False"],
            correctAnswer: answer ? "True" : "False", correctAnswers: [],
            matchingPairs: [], explanation: explanation,
            objective: objective, relatedDrugIds: relatedDrugIds, tags: tags, source: source
        )
    }

    static func fillBlank(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .easy,
        question: String, options: [String], answer: String, explanation: String,
        objective: QuestionObjective = .mixedReview, relatedDrugIds: [String] = [], tags: [String] = [], source: QuestionSource = .curated
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .fillBlank, difficulty: difficulty,
            questionText: question, options: options,
            correctAnswer: answer, correctAnswers: [],
            matchingPairs: [], explanation: explanation,
            objective: objective, relatedDrugIds: relatedDrugIds, tags: tags, source: source
        )
    }

    static func multipleChoice(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .medium,
        question: String, options: [String], answer: String, explanation: String,
        objective: QuestionObjective = .mixedReview, relatedDrugIds: [String] = [], tags: [String] = [], source: QuestionSource = .curated
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .multipleChoice, difficulty: difficulty,
            questionText: question, options: options,
            correctAnswer: answer, correctAnswers: [],
            matchingPairs: [], explanation: explanation,
            objective: objective, relatedDrugIds: relatedDrugIds, tags: tags, source: source
        )
    }

    static func selectAll(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .hard,
        question: String, options: [String], correctAnswers: Set<String>, explanation: String,
        objective: QuestionObjective = .mixedReview, relatedDrugIds: [String] = [], tags: [String] = [], source: QuestionSource = .curated
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .selectAll, difficulty: difficulty,
            questionText: question, options: options,
            correctAnswer: "", correctAnswers: correctAnswers,
            matchingPairs: [], explanation: explanation,
            objective: objective, relatedDrugIds: relatedDrugIds, tags: tags, source: source
        )
    }

    static func matching(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .hard,
        question: String, pairs: [MatchingPair], explanation: String,
        objective: QuestionObjective = .mixedReview, relatedDrugIds: [String] = [], tags: [String] = [], source: QuestionSource = .curated
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .matching, difficulty: difficulty,
            questionText: question, options: [],
            correctAnswer: "", correctAnswers: [],
            matchingPairs: pairs, explanation: explanation,
            objective: objective, relatedDrugIds: relatedDrugIds, tags: tags, source: source
        )
    }

    var masteryKey: String {
        if let primaryDrug = relatedDrugIds.first {
            return "\(objective.rawValue)_\(primaryDrug)"
        }
        return "\(objective.rawValue)_\(subsectionId)"
    }
}
