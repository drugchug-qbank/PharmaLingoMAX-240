import SwiftUI

@Observable
class QuizViewModel {
    let subsectionId: String
    let subsectionTitle: String
    let isMasteryQuiz: Bool
    var questions: [Question]
    var currentIndex: Int = 0
    var selectedAnswer: String?
    var selectedAnswers: Set<String> = []
    var matchedPairs: [String: String] = [:]
    var selectedMatchLeft: String?
    var hasAnswered: Bool = false
    var isCorrect: Bool = false
    var correctCount: Int = 0
    var wrongCount: Int = 0
    var consecutiveCorrect: Int = 0
    var maxConsecutive: Int = 0
    var isComplete: Bool = false
    var xpEarned: Int = 0
    var coinsEarned: Int = 0

    var currentQuestion: Question? {
        guard currentIndex < questions.count else { return nil }
        return questions[currentIndex]
    }

    var progress: Double {
        guard !questions.isEmpty else { return 0 }
        return Double(currentIndex) / Double(questions.count)
    }

    var score: Double {
        guard !questions.isEmpty else { return 0 }
        return Double(correctCount) / Double(questions.count)
    }

    var totalQuestions: Int { questions.count }

    init(subsectionId: String, title: String, isMastery: Bool, questions: [Question]) {
        self.subsectionId = subsectionId
        self.subsectionTitle = title
        self.isMasteryQuiz = isMastery
        self.questions = questions
    }

    func submitAnswer() {
        guard let question = currentQuestion, !hasAnswered else { return }
        hasAnswered = true

        switch question.type {
        case .trueFalse, .multipleChoice, .fillBlank:
            isCorrect = selectedAnswer == question.correctAnswer
        case .selectAll:
            isCorrect = selectedAnswers == question.correctAnswers
        case .matching:
            isCorrect = question.matchingPairs.allSatisfy { pair in
                matchedPairs[pair.left] == pair.right
            }
        }

        if isCorrect {
            correctCount += 1
            consecutiveCorrect += 1
            maxConsecutive = max(maxConsecutive, consecutiveCorrect)
        } else {
            wrongCount += 1
            consecutiveCorrect = 0
        }
    }

    func nextQuestion() {
        guard currentIndex < questions.count - 1 else {
            isComplete = true
            calculateRewards()
            return
        }

        currentIndex += 1
        resetQuestionState()
    }

    private func resetQuestionState() {
        selectedAnswer = nil
        selectedAnswers = []
        matchedPairs = [:]
        selectedMatchLeft = nil
        hasAnswered = false
        isCorrect = false
    }

    private func calculateRewards() {
        xpEarned = correctCount * 10
        if score == 1.0 { xpEarned += 50 }
        else if score >= 0.9 { xpEarned += 25 }

        coinsEarned = 5
        if score == 1.0 { coinsEarned += 20 }
        else if score >= 0.9 { coinsEarned += 10 }
    }

    func canSubmit() -> Bool {
        guard let question = currentQuestion else { return false }
        switch question.type {
        case .trueFalse, .multipleChoice, .fillBlank:
            return selectedAnswer != nil
        case .selectAll:
            return !selectedAnswers.isEmpty
        case .matching:
            return matchedPairs.count == (currentQuestion?.matchingPairs.count ?? 0)
        }
    }

    func toggleSelectAllOption(_ option: String) {
        if selectedAnswers.contains(option) {
            selectedAnswers.remove(option)
        } else {
            selectedAnswers.insert(option)
        }
    }

    func selectMatchItem(_ item: String, isLeft: Bool) {
        if isLeft {
            selectedMatchLeft = item
        } else if let left = selectedMatchLeft {
            matchedPairs[left] = item
            selectedMatchLeft = nil
        }
    }
}
