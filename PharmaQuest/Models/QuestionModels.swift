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

    static func trueFalse(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .easy,
        question: String, answer: Bool, explanation: String
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .trueFalse, difficulty: difficulty,
            questionText: question, options: ["True", "False"],
            correctAnswer: answer ? "True" : "False", correctAnswers: [],
            matchingPairs: [], explanation: explanation
        )
    }

    static func fillBlank(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .easy,
        question: String, options: [String], answer: String, explanation: String
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .fillBlank, difficulty: difficulty,
            questionText: question, options: options,
            correctAnswer: answer, correctAnswers: [],
            matchingPairs: [], explanation: explanation
        )
    }

    static func multipleChoice(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .medium,
        question: String, options: [String], answer: String, explanation: String
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .multipleChoice, difficulty: difficulty,
            questionText: question, options: options,
            correctAnswer: answer, correctAnswers: [],
            matchingPairs: [], explanation: explanation
        )
    }

    static func selectAll(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .hard,
        question: String, options: [String], correctAnswers: Set<String>, explanation: String
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .selectAll, difficulty: difficulty,
            questionText: question, options: options,
            correctAnswer: "", correctAnswers: correctAnswers,
            matchingPairs: [], explanation: explanation
        )
    }

    static func matching(
        id: String, subsectionId: String, difficulty: QuestionDifficulty = .hard,
        question: String, pairs: [MatchingPair], explanation: String
    ) -> Question {
        Question(
            id: id, subsectionId: subsectionId, type: .matching, difficulty: difficulty,
            questionText: question, options: [],
            correctAnswer: "", correctAnswers: [],
            matchingPairs: pairs, explanation: explanation
        )
    }
}
