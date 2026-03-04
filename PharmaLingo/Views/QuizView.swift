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

            Spacer()

            Text(quizVM.subsectionTitle)
                .font(AppTheme.funFont(.subheadline, weight: .bold))

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

    @ViewBuilder
    private func bottomBar(quizVM: QuizViewModel) -> some View {
        VStack(spacing: 0) {
            Divider()
            if quizVM.hasAnswered {
                Button {
                    if !quizVM.isCorrect {
                        gameVM.loseHeart()
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
