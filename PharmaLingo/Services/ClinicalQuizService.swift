import Foundation

class ClinicalQuizService {
    static let shared = ClinicalQuizService()
    private var questions: [ClinicalQuestion] = []

    private init() {
        loadQuestions()
    }

    private func loadQuestions() {
        guard let url = Bundle.main.url(forResource: "cqotd_questions", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { return }
        let decoder = JSONDecoder()
        questions = (try? decoder.decode([ClinicalQuestion].self, from: data)) ?? []
    }

    func todaysQuestion() -> ClinicalQuestion? {
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
        return questions.first(where: { $0.dayOfYear == dayOfYear }) ?? questions.first
    }

    func question(for dayOfYear: Int) -> ClinicalQuestion? {
        questions.first(where: { $0.dayOfYear == dayOfYear })
    }

    var totalQuestions: Int { questions.count }

    static func timeUntilMidnight() -> TimeInterval {
        let now = Date()
        let calendar = Calendar.current
        guard let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now)) else { return 0 }
        return tomorrow.timeIntervalSince(now)
    }

    static func todayDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}
