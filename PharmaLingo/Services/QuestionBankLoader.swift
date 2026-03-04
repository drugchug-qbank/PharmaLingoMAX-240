import Foundation

nonisolated struct QuestionBankJSON: Codable, Sendable {
    let subsectionId: String
    let questions: [QuestionJSON]
}

nonisolated struct QuestionJSON: Codable, Sendable {
    let id: String
    let type: String
    let difficulty: String
    let objective: String
    let questionText: String
    let options: [String]
    let correctAnswer: String
    let correctAnswers: [String]
    let matchingPairs: [MatchingPairJSON]
    let relatedDrugIds: [String]
    let tags: [String]
    let explanation: String
}

nonisolated struct MatchingPairJSON: Codable, Sendable {
    let left: String
    let right: String
}

struct QuestionBankLoader {
    static let shared = QuestionBankLoader()
    private var cache: [String: [Question]] = [:]

    static func load(subsectionId: String) -> [Question] {
        let url = Bundle.main.url(forResource: subsectionId, withExtension: "json", subdirectory: "Resources/QuestionBanks")
            ?? Bundle.main.url(forResource: subsectionId, withExtension: "json")
        guard let url else {
            return []
        }
        guard let data = try? Data(contentsOf: url) else { return [] }
        guard let bank = try? JSONDecoder().decode(QuestionBankJSON.self, from: data) else { return [] }
        return bank.questions.compactMap { mapQuestion($0, subsectionId: subsectionId) }
    }

    private static func mapQuestion(_ json: QuestionJSON, subsectionId: String) -> Question? {
        guard let type = mapType(json.type),
              let difficulty = mapDifficulty(json.difficulty) else { return nil }
        let objective = mapObjective(json.objective)
        let pairs = json.matchingPairs.map { MatchingPair(left: $0.left, right: $0.right) }
        let correctAnswersSet = Set(json.correctAnswers)

        return Question(
            id: json.id,
            subsectionId: subsectionId,
            type: type,
            difficulty: difficulty,
            questionText: json.questionText,
            options: json.options,
            correctAnswer: json.correctAnswer,
            correctAnswers: correctAnswersSet,
            matchingPairs: pairs,
            explanation: json.explanation,
            objective: objective,
            relatedDrugIds: json.relatedDrugIds,
            tags: json.tags,
            source: .curated
        )
    }

    private static func mapType(_ raw: String) -> QuestionType? {
        switch raw {
        case "multipleChoice": return .multipleChoice
        case "fillBlank": return .fillBlank
        case "trueFalse": return .trueFalse
        case "selectAll": return .selectAll
        case "matching": return .matching
        default: return nil
        }
    }

    private static func mapDifficulty(_ raw: String) -> QuestionDifficulty? {
        switch raw {
        case "easy": return .easy
        case "medium": return .medium
        case "hard": return .hard
        case "expert": return .expert
        default: return nil
        }
    }

    private static func mapObjective(_ raw: String) -> QuestionObjective {
        switch raw {
        case "classId": return .classId
        case "suffixId": return .suffixId
        case "indication": return .indication
        case "adverseEffect": return .adverseEffect
        case "contraindication": return .contraindication
        case "monitoring": return .monitoring
        case "interaction": return .interaction
        case "pearl": return .pearl
        case "moa": return .moa
        case "dosing": return .dosing
        case "brandGeneric": return .brandGeneric
        case "genericBrand": return .genericBrand
        default: return .mixedReview
        }
    }
}
