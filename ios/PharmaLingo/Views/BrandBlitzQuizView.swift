import SwiftUI

struct BrandBlitzQuizView: View {
    let gameVM: GameViewModel
    var onQuizComplete: (() -> Void)? = nil
    @Environment(\.dismiss) private var dismiss
    @State private var quizVM: QuizViewModel?
    @State private var showResult: Bool = false
    @State private var showNoHeartsAlert: Bool = false
    @State private var bounceCorrect: Bool = false
    @State private var shakeWrong: Bool = false

    @State private var questionTimeRemaining: Double = 8.0
    @State private var questionStartDate: Date = .now
    @State private var timerActive: Bool = false
    @State private var questionResults: [BlitzQuestionResult] = []
    @State private var comboCount: Int = 0
    @State private var bestCombo: Int = 0
    @State private var totalSpeedBonusXP: Int = 0
    @State private var runStartDate: Date = .now
    @State private var blitzSummary: BlitzRunSummary?
    @State private var blitzXPBreakdown: XPRewardBreakdown?

    @State private var showComboPopup: Bool = false
    @State private var comboPopupText: String = ""
    @State private var comboPopupScale: CGFloat = 0.1
    @State private var comboPopupOpacity: Double = 0
    @State private var timerPulse: Bool = false
    @State private var showCountdown: Bool = true
    @State private var countdownValue: Int = 3

    private let maxQuestionTime: Double = 8.0

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if let quizVM {
                    if showResult, let summary = blitzSummary {
                        BlitzResultView(summary: summary, gameVM: gameVM, xpBreakdown: blitzXPBreakdown, onDismiss: { dismiss() })
                    } else {
                        blitzHeader(quizVM: quizVM)
                        blitzTimerBar
                        blitzProgressBar(quizVM: quizVM)

                        ScrollView {
                            if let question = quizVM.currentQuestion {
                                VStack(spacing: 20) {
                                    HStack(spacing: 10) {
                                        HStack(spacing: 6) {
                                            Image(systemName: "bolt.fill")
                                                .foregroundStyle(AppTheme.xpPurple)
                                            Text("BRAND BLITZ")
                                                .font(.system(size: 11, weight: .black, design: .rounded))
                                                .foregroundStyle(AppTheme.xpPurple)
                                        }
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 5)
                                        .background(AppTheme.xpPurple.opacity(0.12))
                                        .clipShape(Capsule())

                                        if comboCount > 1 {
                                            HStack(spacing: 4) {
                                                Image(systemName: "flame.fill")
                                                    .font(.system(size: 10, weight: .bold))
                                                Text("\(comboCount)x COMBO")
                                                    .font(.system(size: 11, weight: .black, design: .rounded))
                                            }
                                            .foregroundStyle(.white)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 5)
                                            .background(
                                                Capsule().fill(
                                                    comboGradient
                                                )
                                            )
                                            .transition(.scale.combined(with: .opacity))
                                        }
                                    }

                                    Text(question.questionText)
                                        .font(AppTheme.funFont(.title3, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .fixedSize(horizontal: false, vertical: true)

                                    questionContent(question: question, quizVM: quizVM)

                                    if quizVM.hasAnswered {
                                        feedbackView(quizVM: quizVM, question: question)
                                    }
                                }
                                .padding(.vertical, 20)
                            }
                        }

                        bottomBar(quizVM: quizVM)
                    }
                } else {
                    VStack(spacing: 16) {
                        ProgressView()
                            .scaleEffect(1.3)
                        Text("Generating Brand Blitz...")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .background(Color(.systemBackground))

            if showComboPopup {
                comboOverlay
                    .transition(.scale.combined(with: .opacity))
                    .allowsHitTesting(false)
            }

            if showCountdown {
                countdownOverlay
                    .transition(.opacity)
                    .zIndex(10)
            }
        }
        .onAppear { setupBlitz() }
        .sensoryFeedback(.success, trigger: bounceCorrect)
        .sensoryFeedback(.error, trigger: shakeWrong)
        .alert("No Hearts!", isPresented: $showNoHeartsAlert) {
            Button("OK") { dismiss() }
        } message: {
            Text("You need hearts to take a quiz. Wait for them to regenerate or visit the shop!")
        }
    }

    private func setupBlitz() {
        if !gameVM.hasUnlimitedHearts && gameVM.hearts <= 0 {
            showNoHeartsAlert = true
            return
        }
        let questions = DrugDataService.shared.brandBlitzQuestions(
            completedSubsections: gameVM.completedSubsections,
            count: 15
        )
        quizVM = QuizViewModel(
            subsectionId: "brand_blitz",
            title: "Brand Blitz",
            isMastery: false,
            questions: questions
        )

        startCountdown()
    }

    private func startCountdown() {
        showCountdown = true
        countdownValue = 3

        func tick() {
            if countdownValue > 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        countdownValue -= 1
                    }
                    tick()
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        showCountdown = false
                    }
                    runStartDate = .now
                    startQuestionTimer()
                }
            }
        }
        tick()
    }

    private var countdownOverlay: some View {
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "bolt.fill")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [AppTheme.xpPurple, AppTheme.funPink],
                            startPoint: .top, endPoint: .bottom
                        )
                    )

                Text("\(countdownValue)")
                    .font(.system(size: 80, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .contentTransition(.numericText())

                Text("GET READY")
                    .font(.system(size: 18, weight: .black, design: .rounded))
                    .foregroundStyle(.white.opacity(0.6))
                    .tracking(4)
            }
        }
    }

    private func startQuestionTimer() {
        questionTimeRemaining = maxQuestionTime
        questionStartDate = .now
        timerActive = true
        tickTimer()
    }

    private func tickTimer() {
        guard timerActive else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            guard timerActive else { return }
            let elapsed = Date().timeIntervalSince(questionStartDate)
            let remaining = maxQuestionTime - elapsed
            if remaining <= 0 {
                questionTimeRemaining = 0
                timerActive = false
                autoSubmitTimeout()
            } else {
                questionTimeRemaining = remaining
                if remaining <= 3 {
                    timerPulse.toggle()
                }
                tickTimer()
            }
        }
    }

    private func autoSubmitTimeout() {
        guard let quizVM, !quizVM.hasAnswered else { return }
        withAnimation(.spring(duration: 0.3)) {
            quizVM.submitAnswer()
        }
        if let q = quizVM.currentQuestion {
            gameVM.recordQuestionAttempt(question: q, isCorrect: quizVM.isCorrect)
        }
        recordQuestionResult(isCorrect: quizVM.isCorrect)
        shakeWrong.toggle()
    }

    private func recordQuestionResult(isCorrect: Bool) {
        let timeSpent = Date().timeIntervalSince(questionStartDate)

        if isCorrect {
            comboCount += 1
            bestCombo = max(bestCombo, comboCount)
        } else {
            comboCount = 0
        }

        var speedBonus = 0
        if isCorrect {
            if timeSpent <= 2.0 { speedBonus = 15 }
            else if timeSpent <= 3.5 { speedBonus = 10 }
            else if timeSpent <= 5.0 { speedBonus = 5 }
            else { speedBonus = 2 }

            let comboMultiplier = max(1.0, 1.0 + Double(comboCount - 1) * 0.25)
            speedBonus = Int(Double(speedBonus) * comboMultiplier)
        }

        totalSpeedBonusXP += speedBonus

        let result = BlitzQuestionResult(
            questionIndex: questionResults.count,
            isCorrect: isCorrect,
            timeSpent: timeSpent,
            comboAtTime: comboCount,
            speedBonusXP: speedBonus
        )
        questionResults.append(result)

        if isCorrect && comboCount >= 3 {
            showComboAnimation()
        }
    }

    private func showComboAnimation() {
        if comboCount >= 10 {
            comboPopupText = "\u{1F525} \(comboCount)x UNSTOPPABLE \u{1F525}"
        } else if comboCount >= 7 {
            comboPopupText = "\u{26A1} \(comboCount)x ON FIRE \u{26A1}"
        } else if comboCount >= 5 {
            comboPopupText = "\u{1F4AA} \(comboCount)x COMBO!"
        } else {
            comboPopupText = "\(comboCount)x STREAK!"
        }

        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
            showComboPopup = true
            comboPopupScale = 1.2
            comboPopupOpacity = 1
        }
        withAnimation(.spring(response: 0.2, dampingFraction: 0.6).delay(0.3)) {
            comboPopupScale = 1.0
        }
        withAnimation(.easeOut(duration: 0.3).delay(1.2)) {
            comboPopupScale = 0.5
            comboPopupOpacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            showComboPopup = false
            comboPopupScale = 0.1
        }
    }

    private var comboGradient: LinearGradient {
        if comboCount >= 10 {
            return LinearGradient(colors: [Color(hex: "FF1744"), Color(hex: "D500F9")], startPoint: .leading, endPoint: .trailing)
        } else if comboCount >= 7 {
            return LinearGradient(colors: [AppTheme.accentOrange, AppTheme.heartRed], startPoint: .leading, endPoint: .trailing)
        } else if comboCount >= 5 {
            return LinearGradient(colors: [AppTheme.funPink, AppTheme.xpPurple], startPoint: .leading, endPoint: .trailing)
        }
        return LinearGradient(colors: [AppTheme.xpPurple, AppTheme.funPink], startPoint: .leading, endPoint: .trailing)
    }

    private var comboOverlay: some View {
        VStack(spacing: 4) {
            Text(comboPopupText)
                .font(.system(size: 38, weight: .black, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [AppTheme.xpPurple, AppTheme.funPink, AppTheme.accentOrange],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: AppTheme.xpPurple.opacity(0.6), radius: 12, x: 0, y: 4)
                .scaleEffect(comboPopupScale)
                .opacity(comboPopupOpacity)
        }
        .padding(.bottom, 120)
    }

    @ViewBuilder
    private func blitzHeader(quizVM: QuizViewModel) -> some View {
        HStack {
            Button { dismiss() } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            HStack(spacing: 6) {
                Image(systemName: "bolt.fill")
                    .foregroundStyle(AppTheme.xpPurple)
                Text("Brand Blitz")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
            }

            Spacer()

            HStack(spacing: 4) {
                ForEach(0..<gameVM.maxHearts, id: \.self) { i in
                    Image(systemName: i < gameVM.hearts ? "heart.fill" : "heart")
                        .font(.caption)
                        .foregroundStyle(i < gameVM.hearts ? AppTheme.heartRed : Color(.tertiaryLabel))
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }

    private var blitzTimerBar: some View {
        GeometryReader { geo in
            let ratio = questionTimeRemaining / maxQuestionTime
            let barColor: Color = ratio > 0.5 ? AppTheme.xpPurple :
                ratio > 0.25 ? AppTheme.accentOrange : AppTheme.heartRed

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(.systemFill))
                    .frame(height: 6)
                Capsule()
                    .fill(barColor)
                    .frame(width: max(geo.size.width * ratio, 4), height: 6)
                    .animation(.linear(duration: 0.05), value: questionTimeRemaining)
            }
        }
        .frame(height: 6)
        .padding(.horizontal)
        .overlay(alignment: .trailing) {
            HStack(spacing: 3) {
                Image(systemName: "timer")
                    .font(.system(size: 10, weight: .bold))
                Text(String(format: "%.1f", questionTimeRemaining))
                    .font(.system(size: 12, weight: .heavy, design: .monospaced))
            }
            .foregroundStyle(questionTimeRemaining <= 3 ? AppTheme.heartRed : .secondary)
            .padding(.trailing, 16)
            .offset(y: 12)
        }
    }

    @ViewBuilder
    private func blitzProgressBar(quizVM: QuizViewModel) -> some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(.systemFill))
                    .frame(height: 10)
                Capsule()
                    .fill(
                        LinearGradient(colors: [AppTheme.xpPurple, AppTheme.funPink], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: max(geo.size.width * quizVM.progress, 10), height: 10)
                    .animation(.spring(duration: 0.4), value: quizVM.progress)
            }
        }
        .frame(height: 10)
        .padding(.horizontal)
        .padding(.top, 10)
    }

    @ViewBuilder
    private func questionContent(question: Question, quizVM: QuizViewModel) -> some View {
        switch question.type {
        case .trueFalse:
            TrueFalseQuestionView(quizVM: quizVM)
        case .fillBlank:
            FillBlankQuestionView(quizVM: quizVM)
        case .multipleChoice:
            MultipleChoiceQuestionView(quizVM: quizVM)
        case .selectAll:
            SelectAllQuestionView(quizVM: quizVM)
        case .matching:
            MatchingQuestionView(quizVM: quizVM)
        }
    }

    @ViewBuilder
    private func feedbackView(quizVM: QuizViewModel, question: Question) -> some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: quizVM.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.title2)
                Text(quizVM.isCorrect ? feedbackText() : "Incorrect")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
            }
            .foregroundStyle(quizVM.isCorrect ? AppTheme.successGreen : AppTheme.heartRed)

            if quizVM.isCorrect, let lastResult = questionResults.last, lastResult.speedBonusXP > 0 {
                HStack(spacing: 4) {
                    Image(systemName: "hare.fill")
                        .font(.caption)
                    Text("+\(lastResult.speedBonusXP) speed bonus")
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                }
                .foregroundStyle(AppTheme.funTeal)
            }

            Text(question.explanation)
                .font(AppTheme.funFont(.subheadline, weight: .medium))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background((quizVM.isCorrect ? AppTheme.successGreen : AppTheme.heartRed).opacity(0.08))
        .clipShape(.rect(cornerRadius: 14))
        .padding(.horizontal)
        .transition(.scale.combined(with: .opacity))
    }

    private func feedbackText() -> String {
        if comboCount >= 7 { return "UNSTOPPABLE!" }
        if comboCount >= 5 { return "On Fire!" }
        if comboCount >= 3 { return "Combo!" }
        return ["Correct!", "Nailed it!", "Quick!", "Got it!"].randomElement()!
    }

    @ViewBuilder
    private func bottomBar(quizVM: QuizViewModel) -> some View {
        VStack(spacing: 0) {
            Divider()
            if quizVM.hasAnswered {
                Button {
                    timerActive = false
                    if !quizVM.isCorrect {
                        gameVM.loseHeart()
                    }
                    gameVM.recordConsecutiveCorrect(quizVM.maxConsecutive)

                    if !gameVM.hasUnlimitedHearts && gameVM.hearts <= 0 {
                        finalizeBlitz(quizVM: quizVM)
                        return
                    }

                    if quizVM.currentIndex >= quizVM.questions.count - 1 {
                        finalizeBlitz(quizVM: quizVM)
                    } else {
                        withAnimation(.spring(duration: 0.3)) {
                            quizVM.nextQuestion()
                        }
                        startQuestionTimer()
                    }
                } label: {
                    HStack(spacing: 8) {
                        Text("Continue")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                        if comboCount > 1 {
                            Text("\(comboCount)x")
                                .font(.system(size: 14, weight: .black, design: .rounded))
                                .foregroundStyle(AppTheme.warningYellow)
                        }
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            colors: [AppTheme.xpPurple, AppTheme.funPink],
                            startPoint: .leading, endPoint: .trailing
                        )
                    )
                    .clipShape(.rect(cornerRadius: 14))
                }
                .padding(20)
            } else {
                Button {
                    timerActive = false
                    withAnimation(.spring(duration: 0.3)) {
                        quizVM.submitAnswer()
                    }
                    if let q = quizVM.currentQuestion {
                        gameVM.recordQuestionAttempt(question: q, isCorrect: quizVM.isCorrect)
                    }
                    recordQuestionResult(isCorrect: quizVM.isCorrect)
                    if quizVM.isCorrect {
                        bounceCorrect.toggle()
                    } else {
                        shakeWrong.toggle()
                    }
                } label: {
                    Text("Check Answer")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(quizVM.canSubmit() ? AppTheme.successGreen : Color(.systemFill))
                        .clipShape(.rect(cornerRadius: 14))
                }
                .disabled(!quizVM.canSubmit())
                .padding(20)
            }
        }
    }

    private func finalizeBlitz(quizVM: QuizViewModel) {
        quizVM.finalizeQuiz()

        let totalTime = Date().timeIntervalSince(runStartDate)
        let baseXP = quizVM.correctCount * 10
        let comboBonus = bestCombo >= 10 ? 50 : bestCombo >= 7 ? 30 : bestCombo >= 5 ? 20 : bestCombo >= 3 ? 10 : 0
        let perfectBonus = quizVM.correctCount == quizVM.totalQuestions ? 75 : 0
        let baseCoins = quizVM.correctCount * 2

        let summary = BlitzRunSummary(
            totalTime: totalTime,
            correctCount: quizVM.correctCount,
            totalCount: quizVM.totalQuestions,
            bestCombo: bestCombo,
            speedBonusXP: totalSpeedBonusXP,
            comboBonus: comboBonus,
            perfectStreakBonus: perfectBonus,
            baseXP: baseXP,
            baseCoins: baseCoins,
            questionResults: questionResults
        )
        blitzSummary = summary

        let breakdown = gameVM.completePracticeSession(
            score: quizVM.score,
            correctCount: quizVM.correctCount,
            totalCount: quizVM.totalQuestions,
            xpEarned: summary.totalXP,
            coinsEarned: summary.totalCoins,
            contentKey: "practice:brand_blitz"
        )
        blitzXPBreakdown = breakdown
        gameVM.recordBrandBlitzComplete()

        saveBestBlitzScore(summary)

        onQuizComplete?()
        withAnimation { showResult = true }
    }

    private func saveBestBlitzScore(_ summary: BlitzRunSummary) {
        let score = summary.totalXP
        let key = "blitz_best_score"
        let current = UserDefaults.standard.integer(forKey: key)
        if score > current {
            UserDefaults.standard.set(score, forKey: key)
            UserDefaults.standard.set(summary.accuracy, forKey: "blitz_best_accuracy")
            UserDefaults.standard.set(summary.bestCombo, forKey: "blitz_best_combo")
            UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: "blitz_best_date")
        }

        var todayScores = UserDefaults.standard.array(forKey: "blitz_daily_scores") as? [[String: Any]] ?? []
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())

        if let lastDate = UserDefaults.standard.string(forKey: "blitz_daily_date"), lastDate != today {
            todayScores = []
        }
        UserDefaults.standard.set(today, forKey: "blitz_daily_date")

        todayScores.append([
            "score": score,
            "accuracy": summary.accuracy,
            "combo": summary.bestCombo,
            "time": summary.totalTime
        ])
        UserDefaults.standard.set(todayScores, forKey: "blitz_daily_scores")
    }
}
