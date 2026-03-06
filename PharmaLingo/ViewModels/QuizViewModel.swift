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
    var matchedPairs: [String: Int] = [:]
    var selectedMatchLeft: String?
    var shuffledRightOptions: [(index: Int, value: String)] = []
    var shuffledOptions: [String] = []
    var hasAnswered: Bool = false
    var isCorrect: Bool = false
    var correctCount: Int = 0

    var fiftyFiftyUsedOnQuestion: Bool = false
    var shieldActiveOnQuestion: Bool = false
    var pharmaVisionUsedOnQuestion: Bool = false
    var eliminatedOptions: Set<String> = []
    var pharmaVisionHighlights: Set<String> = []
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
        prepareShuffledOptions()
    }

    private func prepareShuffledOptions() {
        guard let q = currentQuestion else {
            shuffledRightOptions = []
            shuffledOptions = []
            return
        }
        if q.type == .matching {
            let rights = q.matchingPairs.map(\.right).shuffled()
            shuffledRightOptions = rights.enumerated().map { (index: $0.offset, value: $0.element) }
            shuffledOptions = []
        } else if !q.options.isEmpty {
            shuffledOptions = q.options.shuffled()
            shuffledRightOptions = []
        } else {
            shuffledOptions = []
            shuffledRightOptions = []
        }
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
            isCorrect = validateMatchingAnswer(question: question)
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
        fiftyFiftyUsedOnQuestion = false
        shieldActiveOnQuestion = false
        pharmaVisionUsedOnQuestion = false
        eliminatedOptions = []
        pharmaVisionHighlights = []
        prepareShuffledOptions()
    }

    func canUsePowerUp(_ type: PowerUpType) -> Bool {
        guard let q = currentQuestion else { return false }
        guard !hasAnswered else { return false }
        guard type.supportsQuestionType(q.type) else { return false }
        switch type {
        case .fiftyFifty: return !fiftyFiftyUsedOnQuestion
        case .shieldHeart: return !shieldActiveOnQuestion
        case .pharmaVision: return !pharmaVisionUsedOnQuestion
        }
    }

    func activateFiftyFifty() {
        guard let q = currentQuestion, !fiftyFiftyUsedOnQuestion else { return }
        fiftyFiftyUsedOnQuestion = true

        switch q.type {
        case .multipleChoice, .trueFalse, .fillBlank:
            let incorrectOptions = shuffledOptions.filter { $0 != q.correctAnswer }
            let countToRemove = max(incorrectOptions.count - 1, 1)
            let toEliminate = Set(incorrectOptions.shuffled().prefix(countToRemove))
            eliminatedOptions = toEliminate
        case .selectAll:
            let incorrectOptions = shuffledOptions.filter { !q.correctAnswers.contains($0) }
            let countToRemove = max(incorrectOptions.count - 1, 1)
            let toEliminate = Set(incorrectOptions.shuffled().prefix(countToRemove))
            eliminatedOptions = toEliminate
        case .matching:
            break
        }
    }

    func activateShield() {
        guard !shieldActiveOnQuestion else { return }
        shieldActiveOnQuestion = true
    }

    func activatePharmaVision() {
        guard let q = currentQuestion, !pharmaVisionUsedOnQuestion else { return }
        pharmaVisionUsedOnQuestion = true

        switch q.type {
        case .multipleChoice, .trueFalse, .fillBlank:
            pharmaVisionHighlights = [q.correctAnswer]
        case .selectAll:
            let visibleCorrect = shuffledOptions.filter {
                q.correctAnswers.contains($0) && !eliminatedOptions.contains($0)
            }
            pharmaVisionHighlights = Set(visibleCorrect)
        case .matching:
            break
        }
    }

    private func calculateRewards() {
        xpEarned = correctCount * 10
        if maxConsecutive >= 5 { xpEarned += maxConsecutive * 3 }
        else if maxConsecutive >= 3 { xpEarned += maxConsecutive * 2 }
        if score == 1.0 { xpEarned += 75 }
        else if score >= 0.9 { xpEarned += 35 }
        else if score >= 0.8 { xpEarned += 15 }

        coinsEarned = correctCount * 2
        if score == 1.0 { coinsEarned += 30 }
        else if score >= 0.9 { coinsEarned += 15 }
        else if score >= 0.8 { coinsEarned += 5 }
    }

    func finalizeQuiz() {
        isComplete = true
        calculateRewards()
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

    func selectMatchItem(_ item: String, isLeft: Bool, rightIndex: Int? = nil) {
        if isLeft {
            selectedMatchLeft = item
        } else if let left = selectedMatchLeft, let idx = rightIndex {
            matchedPairs[left] = idx
            selectedMatchLeft = nil
        }
    }

    func rightValueForLeft(_ left: String) -> String? {
        guard let idx = matchedPairs[left] else { return nil }
        return shuffledRightOptions.first(where: { $0.index == idx })?.value
    }

    func isRightIndexMatched(_ index: Int) -> Bool {
        matchedPairs.values.contains(index)
    }

    private func validateMatchingAnswer(question: Question) -> Bool {
        let pairs = question.matchingPairs
        guard matchedPairs.count == pairs.count else { return false }

        var usedRightIndices = Set<Int>()
        for pair in pairs {
            guard let matchedIdx = matchedPairs[pair.left] else { return false }
            let matchedValue = shuffledRightOptions.first(where: { $0.index == matchedIdx })?.value
            guard matchedValue == pair.right else { return false }
            usedRightIndices.insert(matchedIdx)
        }
        return usedRightIndices.count == pairs.count
    }
}
