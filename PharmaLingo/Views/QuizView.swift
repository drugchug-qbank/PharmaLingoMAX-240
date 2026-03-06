import SwiftUI

struct QuizView: View {
    let subsection: Subsection
    let gameVM: GameViewModel
    var customQuestions: [Question] = []
    var customTitle: String? = nil
    var onQuizComplete: (() -> Void)? = nil
    @Environment(\.dismiss) private var dismiss
    @State private var quizVM: QuizViewModel?
    @State private var showResult: Bool = false
    @State private var showNoHeartsAlert: Bool = false
    @State private var bounceCorrect: Bool = false
    @State private var shakeWrong: Bool = false
    @State private var showCorrectCelebration: Bool = false
    @State private var hasNoQuestions: Bool = false
    @State private var showOutOfHearts: Bool = false
    @State private var showPaywall: Bool = false
    @State private var adWatchesUsed: Int = 0
    private let maxAdWatches: Int = 3
    @State private var shieldJustSaved: Bool = false
    @State private var comboText: String = ""
    @State private var showCombo: Bool = false
    @State private var comboScale: CGFloat = 0.1
    @State private var comboOpacity: Double = 0

    var body: some View {
        VStack(spacing: 0) {
            if hasNoQuestions {
                noQuestionsView
            } else if showOutOfHearts {
                OutOfHeartsView(
                    gameVM: gameVM,
                    adWatchesUsed: adWatchesUsed,
                    maxAdWatches: maxAdWatches,
                    onWatchAd: {
                        adWatchesUsed += 1
                        gameVM.addHeart()
                        showOutOfHearts = false
                    },
                    onBuyHearts: {
                        if gameVM.spendCoins(300) {
                            gameVM.refillHearts()
                            showOutOfHearts = false
                        }
                    },
                    onGetPro: {
                        showPaywall = true
                    },
                    onQuit: {
                        dismiss()
                    }
                )
            } else if let quizVM {
                if showResult {
                    QuizResultView(quizVM: quizVM, gameVM: gameVM, onDismiss: { dismiss() })
                } else {
                    quizHeader(quizVM: quizVM)
                    progressBar(quizVM: quizVM)

                    Spacer().frame(height: 8)

                    powerUpBar(quizVM: quizVM)

                    ScrollView {
                        if let question = quizVM.currentQuestion {
                            VStack(spacing: 20) {
                                HStack(spacing: 8) {
                                    conceptLabel(question.objective)
                                    questionTypeLabel(question.type)
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
                    Text("Loading quiz...")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .background(Color(.systemBackground))
        .overlay(alignment: .bottom) {
            if showCombo {
                comboOverlay
                    .transition(.scale.combined(with: .opacity))
                    .allowsHitTesting(false)
            }
        }
        .onAppear { setupQuiz() }
        .sensoryFeedback(.success, trigger: bounceCorrect)
        .sensoryFeedback(.error, trigger: shakeWrong)
        .alert("No Hearts!", isPresented: $showNoHeartsAlert) {
            Button("OK") { dismiss() }
        } message: {
            Text("You need hearts to take a quiz. Wait for them to regenerate or visit the shop!")
        }
        .sheet(isPresented: $showPaywall) {
            ProPaywallView()
        }
        .onChange(of: showPaywall) { _, newValue in
            if !newValue {
                Task {
                    await gameVM.refreshProStatus()
                    if gameVM.isProUser {
                        showOutOfHearts = false
                    }
                }
            }
        }
    }

    private var noQuestionsView: some View {
        VStack(spacing: 20) {
            Image(systemName: "hammer.fill")
                .font(.system(size: 56))
                .foregroundStyle(AppTheme.accentOrange)

            Text("Coming Soon!")
                .font(AppTheme.funFont(.title, weight: .heavy))

            Text("Questions for \"\(subsection.title)\" are being crafted. Check back soon!")
                .font(AppTheme.funFont(.body, weight: .medium))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button {
                dismiss()
            } label: {
                Text("Go Back")
                    .font(AppTheme.funFont(.headline, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(AppTheme.primaryBlue)
                    .clipShape(.rect(cornerRadius: 14))
            }
            .padding(.horizontal, 40)
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func setupQuiz() {
        if !gameVM.hasUnlimitedHearts && gameVM.hearts <= 0 {
            showNoHeartsAlert = true
            return
        }

        let questions: [Question]
        if !customQuestions.isEmpty {
            questions = customQuestions
        } else {
            questions = QuizEngine.shared.buildSessionQuestions(
                subsectionId: subsection.id,
                isMastery: subsection.isMasteryQuiz,
                completedSubsections: gameVM.completedSubsections,
                masteryMap: gameVM.masteryMap
            )
        }

        if questions.isEmpty {
            hasNoQuestions = true
            return
        }

        let sessionId = !customQuestions.isEmpty ? "practice" : subsection.id
        let sessionTitle = customTitle ?? subsection.title

        quizVM = QuizViewModel(
            subsectionId: sessionId,
            title: sessionTitle,
            isMastery: customQuestions.isEmpty && subsection.isMasteryQuiz,
            questions: questions
        )
    }

    @ViewBuilder
    private func quizHeader(quizVM: QuizViewModel) -> some View {
        HStack {
            Button { dismiss() } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .layoutPriority(1)

            Text(quizVM.subsectionTitle)
                .font(AppTheme.funFont(.headline, weight: .bold))
                .minimumScaleFactor(0.6)
                .lineLimit(1)
                .frame(maxWidth: .infinity)

            HStack(spacing: 4) {
                ForEach(0..<gameVM.maxHearts, id: \.self) { i in
                    Image(systemName: i < gameVM.hearts ? "heart.fill" : "heart")
                        .font(.caption)
                        .foregroundStyle(i < gameVM.hearts ? AppTheme.heartRed : Color(.tertiaryLabel))
                }
            }
            .layoutPriority(1)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }

    @ViewBuilder
    private func progressBar(quizVM: QuizViewModel) -> some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color(.systemFill))
                    .frame(height: 10)
                Capsule()
                    .fill(
                        LinearGradient(colors: [AppTheme.successGreen, AppTheme.funTeal], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: max(geo.size.width * quizVM.progress, 10), height: 10)
                    .animation(.spring(duration: 0.4), value: quizVM.progress)
            }
        }
        .frame(height: 10)
        .padding(.horizontal)
    }

    @ViewBuilder
    private func conceptLabel(_ objective: QuestionObjective) -> some View {
        let (text, icon): (String, String) = {
            switch objective {
            case .suffixId, .classId: ("Class Pattern", "textformat.abc")
            case .indication: ("Indications", "cross.case.fill")
            case .adverseEffect: ("Side Effects", "exclamationmark.triangle.fill")
            case .contraindication: ("Black Box / Safety", "shield.fill")
            case .pearl: ("Pearls", "star.fill")
            case .brandGeneric, .genericBrand: ("Drug Names", "pill.fill")
            case .monitoring: ("Monitoring", "heart.text.square.fill")
            case .interaction: ("Interactions", "arrow.triangle.2.circlepath")
            case .moa: ("Mechanism", "gearshape.fill")
            case .dosing: ("Dosing", "pills.fill")
            case .mixedReview: ("Review", "arrow.clockwise")
            }
        }()

        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 9, weight: .bold))
            Text(text.uppercased())
                .font(AppTheme.funFont(.caption2, weight: .heavy))
        }
        .foregroundStyle(.secondary)
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(Color(.tertiarySystemFill))
        .clipShape(Capsule())
    }

    @ViewBuilder
    private func questionTypeLabel(_ type: QuestionType) -> some View {
        let (text, color): (String, Color) = {
            switch type {
            case .trueFalse: ("True or False", AppTheme.successGreen)
            case .fillBlank: ("Fill in the Blank", AppTheme.primaryBlue)
            case .multipleChoice: ("Multiple Choice", AppTheme.xpPurple)
            case .matching: ("Matching", AppTheme.accentOrange)
            case .selectAll: ("Select All That Apply", AppTheme.heartRed)
            }
        }()

        Text(text.uppercased())
            .font(AppTheme.funFont(.caption, weight: .heavy))
            .foregroundStyle(color)
            .padding(.horizontal, 14)
            .padding(.vertical, 5)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
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
        let parts = parseExplanation(question.explanation)
        VStack(spacing: 10) {
            HStack(spacing: 6) {
                Image(systemName: quizVM.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.title2)
                    .symbolEffect(.bounce, value: showCorrectCelebration)
                Text(quizVM.isCorrect ? correctCelebrationText() : "Not quite")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
            }
            .foregroundStyle(quizVM.isCorrect ? AppTheme.successGreen : AppTheme.heartRed)

            if let rule = parts.rule {
                HStack(alignment: .top, spacing: 6) {
                    Image(systemName: "lightbulb.fill")
                        .font(.caption)
                        .foregroundStyle(AppTheme.warningYellow)
                    Text(rule)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                        .foregroundStyle(.primary)
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppTheme.warningYellow.opacity(0.1))
                .clipShape(.rect(cornerRadius: 10))
            }

            if let why = parts.why {
                Text(why)
                    .font(AppTheme.funFont(.caption, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let pearl = parts.pearl {
                HStack(alignment: .top, spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.xpPurple)
                    Text(pearl)
                        .font(AppTheme.funFont(.caption, weight: .semibold))
                        .foregroundStyle(AppTheme.xpPurple)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            if parts.rule == nil {
                Text(question.explanation)
                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background((quizVM.isCorrect ? AppTheme.successGreen : AppTheme.heartRed).opacity(0.08))
        .clipShape(.rect(cornerRadius: 14))
        .padding(.horizontal)
        .transition(.scale.combined(with: .opacity))
    }

    @ViewBuilder
    private func powerUpBar(quizVM: QuizViewModel) -> some View {
        HStack(spacing: 10) {
            ForEach(PowerUpType.allCases, id: \.rawValue) { type in
                let count = gameVM.powerUpCount(for: type)
                let canUse = quizVM.canUsePowerUp(type) && count > 0
                let isActive = activePowerUpState(type, quizVM: quizVM)

                Button {
                    activatePowerUp(type, quizVM: quizVM)
                } label: {
                    VStack(spacing: 3) {
                        ZStack(alignment: .topTrailing) {
                            Group {
                                if type.usesCustomImage {
                                    Image(type.customImageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: quizIconSize(for: type), height: quizIconSize(for: type))
                                } else {
                                    Image(systemName: type.iconName)
                                        .font(.system(size: 32, weight: .semibold))
                                }
                            }
                                .frame(width: 56, height: 56)
                                .background(
                                    isActive ? powerUpActiveColor(type).opacity(0.25) :
                                    canUse ? Color(.tertiarySystemFill) : Color(.quaternarySystemFill)
                                )
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(isActive ? powerUpActiveColor(type) : .clear, lineWidth: 2)
                                )

                            Text("\(count)")
                                .font(.system(size: 14, weight: .heavy, design: .rounded))
                                .foregroundStyle(.white)
                                .frame(width: 24, height: 24)
                                .background(count > 0 ? powerUpActiveColor(type) : Color(.systemGray3))
                                .clipShape(Circle())
                                .offset(x: 6, y: -6)
                        }

                        Text(type.displayName)
                            .font(.system(size: 13, weight: .bold, design: .rounded))
                            .lineLimit(1)
                    }
                    .foregroundStyle(canUse ? .primary : .tertiary)
                }
                .disabled(!canUse)
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color(hex: "#ffffff").opacity(0.50))
        .overlay(alignment: .top) {
            Rectangle().fill(Color.black).frame(height: 1.5)
        }
        .overlay(alignment: .bottom) {
            Rectangle().fill(Color.black).frame(height: 1.5)
        }
    }

    private func activePowerUpState(_ type: PowerUpType, quizVM: QuizViewModel) -> Bool {
        switch type {
        case .fiftyFifty: quizVM.fiftyFiftyUsedOnQuestion
        case .shieldHeart: quizVM.shieldActiveOnQuestion
        case .pharmaVision: quizVM.pharmaVisionUsedOnQuestion
        }
    }

    private func powerUpActiveColor(_ type: PowerUpType) -> Color {
        switch type {
        case .fiftyFifty: AppTheme.successGreen
        case .shieldHeart: AppTheme.primaryBlue
        case .pharmaVision: AppTheme.warningYellow
        }
    }

    private func quizIconSize(for type: PowerUpType) -> CGFloat {
        switch type {
        case .fiftyFifty: 94
        case .shieldHeart: 140
        case .pharmaVision: 78
        }
    }

    private func activatePowerUp(_ type: PowerUpType, quizVM: QuizViewModel) {
        guard gameVM.consumePowerUp(type) else { return }
        withAnimation(.spring(duration: 0.3)) {
            switch type {
            case .fiftyFifty:
                quizVM.activateFiftyFifty()
            case .shieldHeart:
                quizVM.activateShield()
            case .pharmaVision:
                quizVM.activatePharmaVision()
            }
        }
    }

    private func correctCelebrationText() -> String {
        ["Correct!", "Nailed it!", "Nice one!", "You got it!", "Exactly right!"].randomElement()!
    }

    private struct ExplanationParts {
        var rule: String?
        var why: String?
        var pearl: String?
    }

    private func parseExplanation(_ text: String) -> ExplanationParts {
        var parts = ExplanationParts()
        let lines = text.components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
        for line in lines {
            if line.hasPrefix("Rule:") {
                parts.rule = String(line.dropFirst(5)).trimmingCharacters(in: .whitespaces)
            } else if line.hasPrefix("Why:") {
                parts.why = String(line.dropFirst(4)).trimmingCharacters(in: .whitespaces)
            } else if line.hasPrefix("Pearl:") {
                parts.pearl = String(line.dropFirst(6)).trimmingCharacters(in: .whitespaces)
            }
        }
        return parts
    }

    private var comboOverlay: some View {
        VStack(spacing: 4) {
            Text(comboText)
                .font(.system(size: 42, weight: .black, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: comboGradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: comboGradientColors[0].opacity(0.6), radius: 12, x: 0, y: 4)
                .scaleEffect(comboScale)
                .opacity(comboOpacity)
                .rotationEffect(.degrees(comboScale < 1 ? -5 : 0))
        }
        .padding(.bottom, 120)
    }

    private var comboGradientColors: [Color] {
        if comboText.contains("PERFECT") {
            return [Color(hex: "FFD700"), Color(hex: "FF6B00"), Color(hex: "FF1744")]
        } else if comboText.contains("10") {
            return [Color(hex: "FF1744"), Color(hex: "D500F9"), Color(hex: "651FFF")]
        } else if comboText.contains("5") {
            return [Color(hex: "00E676"), Color(hex: "00B0FF"), Color(hex: "2979FF")]
        } else {
            return [AppTheme.primaryBlue, AppTheme.funTeal]
        }
    }

    private func checkComboStreak(quizVM: QuizViewModel) {
        let streak = quizVM.consecutiveCorrect
        var text: String?

        if streak == quizVM.totalQuestions && quizVM.currentIndex == quizVM.totalQuestions - 1 {
            text = "\u{1F31F} PERFECT \u{1F31F}"
        } else if streak == 10 {
            text = "\u{1F525} 10x COMBO \u{1F525}"
        } else if streak == 5 {
            text = "\u{26A1} 5x STREAK \u{26A1}"
        } else if streak == 3 {
            text = "\u{1F4AA} 3x ON FIRE!"
        }

        guard let displayText = text else { return }
        comboText = displayText

        withAnimation(.spring(response: 0.35, dampingFraction: 0.5)) {
            showCombo = true
            comboScale = 1.2
            comboOpacity = 1
        }

        withAnimation(.spring(response: 0.2, dampingFraction: 0.6).delay(0.35)) {
            comboScale = 1.0
        }

        withAnimation(.easeOut(duration: 0.4).delay(1.5)) {
            comboScale = 0.5
            comboOpacity = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            showCombo = false
            comboScale = 0.1
        }
    }

    @ViewBuilder
    private func bottomBar(quizVM: QuizViewModel) -> some View {
        VStack(spacing: 0) {
            Divider()
            if quizVM.hasAnswered {
                Button {
                    if !quizVM.isCorrect {
                        if quizVM.shieldActiveOnQuestion {
                            shieldJustSaved = true
                        } else {
                            gameVM.loseHeart()
                        }
                    }
                    gameVM.recordConsecutiveCorrect(quizVM.maxConsecutive)

                    if gameVM.hearts <= 0 && !gameVM.hasUnlimitedHearts {
                        withAnimation { showOutOfHearts = true }
                        return
                    }

                    if quizVM.currentIndex >= quizVM.questions.count - 1 {
                        quizVM.finalizeQuiz()
                        gameVM.completeSubsection(
                            quizVM.subsectionId,
                            score: quizVM.score,
                            correctCount: quizVM.correctCount,
                            totalCount: quizVM.totalQuestions,
                            xpEarned: quizVM.xpEarned,
                            coinsEarned: quizVM.coinsEarned
                        )
                        gameVM.updateStreak()
                        onQuizComplete?()
                        withAnimation { showResult = true }
                    } else {
                        withAnimation(.spring(duration: 0.3)) {
                            quizVM.nextQuestion()
                        }
                    }
                } label: {
                    Text("Continue")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(AppTheme.primaryBlue)
                        .clipShape(.rect(cornerRadius: 14))
                }
                .padding(20)
            } else {
                Button {
                    withAnimation(.spring(duration: 0.3)) {
                        quizVM.submitAnswer()
                    }
                    if let q = quizVM.currentQuestion {
                        gameVM.recordQuestionAttempt(question: q, isCorrect: quizVM.isCorrect)
                    }
                    if quizVM.isCorrect {
                        bounceCorrect.toggle()
                        showCorrectCelebration.toggle()
                        checkComboStreak(quizVM: quizVM)
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
}
