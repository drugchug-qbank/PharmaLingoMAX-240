import SwiftUI
import Combine

@Observable
class ClinicalQuizViewModel {
    var question: ClinicalQuestion?
    var selectedChoiceId: String?
    var hasSubmitted: Bool = false
    var isCorrect: Bool = false
    var hasAlreadyAnsweredToday: Bool = false
    var todaysResult: Bool?
    var countdownSeconds: TimeInterval = 0

    private let service = ClinicalQuizService.shared
    private let answeredKey = "cqotd_answered_dates"
    private let resultsKey = "cqotd_results"

    init() {
        loadTodaysQuestion()
        checkIfAlreadyAnswered()
        countdownSeconds = ClinicalQuizService.timeUntilMidnight()
    }

    func loadTodaysQuestion() {
        question = service.todaysQuestion()
    }

    func selectChoice(_ id: String) {
        guard !hasSubmitted, !hasAlreadyAnsweredToday else { return }
        selectedChoiceId = id
    }

    func submit(gameVM: GameViewModel) {
        guard let selectedChoiceId, let question, !hasSubmitted else { return }
        hasSubmitted = true
        isCorrect = selectedChoiceId == question.correctChoiceId

        if isCorrect {
            gameVM.addClinicalAuraPoint()
        } else {
            gameVM.removeClinicalAuraPoint()
        }

        markAnsweredToday(correct: isCorrect)
        hasAlreadyAnsweredToday = true
        todaysResult = isCorrect
    }

    func updateCountdown() {
        countdownSeconds = ClinicalQuizService.timeUntilMidnight()
    }

    var countdownString: String {
        let hours = Int(countdownSeconds) / 3600
        let minutes = (Int(countdownSeconds) % 3600) / 60
        let seconds = Int(countdownSeconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    private func checkIfAlreadyAnswered() {
        let today = ClinicalQuizService.todayDateString()
        let answered = UserDefaults.standard.dictionary(forKey: answeredKey) as? [String: Bool] ?? [:]
        if let result = answered[today] {
            hasAlreadyAnsweredToday = true
            todaysResult = result
            hasSubmitted = true
            isCorrect = result
            if let question {
                selectedChoiceId = result ? question.correctChoiceId : nil
            }
        }
    }

    private func markAnsweredToday(correct: Bool) {
        let today = ClinicalQuizService.todayDateString()
        var answered = UserDefaults.standard.dictionary(forKey: answeredKey) as? [String: Bool] ?? [:]
        answered[today] = correct
        UserDefaults.standard.set(answered, forKey: answeredKey)
    }
}
