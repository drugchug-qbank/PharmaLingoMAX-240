import Foundation

nonisolated struct ClinicalAnswerChoice: Codable, Sendable, Identifiable {
    let id: String
    let text: String
}

nonisolated struct ClinicalQuestion: Codable, Sendable, Identifiable {
    let id: String
    let dayOfYear: Int
    let title: String
    let stem: String
    let question: String
    let answerChoices: [ClinicalAnswerChoice]
    let correctChoiceId: String
    let rationales: [String: String]
    let takeaway: String
    let focusDrugs: [String]
    let moduleTags: [String]
    let difficulty: String
    let version: String

    nonisolated enum CodingKeys: String, CodingKey {
        case id
        case dayOfYear = "day_of_year"
        case title
        case stem
        case question
        case answerChoices = "answer_choices"
        case correctChoiceId = "correct_choice_id"
        case rationales
        case takeaway
        case focusDrugs = "focus_drugs"
        case moduleTags = "module_tags"
        case difficulty
        case version
    }

    var labValues: [String] {
        extractSectionValues(pattern: #"(?i)labs?[:\s]*(.*?)(?:\n(?:Vitals|Meds|PMH|Assessment)|$)"#)
    }

    var currentMedications: [String] {
        extractSectionValues(pattern: #"(?i)(?:meds|medications|current medications)[:\s]*(.*?)(?:\n(?:Vitals|Labs|PMH|Assessment)|$)"#)
    }

    var vitals: [String] {
        extractSectionValues(pattern: #"(?i)vitals[:\s]*(.*?)(?:\n(?:Labs|Meds|PMH|Assessment)|$)"#)
    }

    private func extractSectionValues(pattern: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: [.dotMatchesLineSeparators]) else { return [] }
        let range = NSRange(stem.startIndex..., in: stem)
        guard let match = regex.firstMatch(in: stem, options: [], range: range),
              match.numberOfRanges > 1,
              let captureRange = Range(match.range(at: 1), in: stem) else { return [] }
        let captured = String(stem[captureRange]).trimmingCharacters(in: .whitespacesAndNewlines)
        if captured.isEmpty { return [] }
        let items = captured.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
        return items.count > 1 ? items : [captured]
    }

    var hasLabValues: Bool { !labValues.isEmpty }
    var hasMedications: Bool { !currentMedications.isEmpty }
    var hasVitals: Bool { !vitals.isEmpty }
}
