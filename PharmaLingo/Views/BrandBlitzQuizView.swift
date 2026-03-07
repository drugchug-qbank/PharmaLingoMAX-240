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

    var body: some View {
        VStack(spacing: 0) {
            if let quizVM {
                if showResult {
                    QuizResultView(quizVM: quizVM, gameVM: gameVM, onDismiss: { dismiss() })
                } else {
                    blitzHeader(quizVM: quizVM)
                    blitzProgressBar(quizVM: quizVM)

                    ScrollView {
                        if let question = quizVM.currentQuestion {
                            VStack(spacing: 20) {
                                HStack(spacing: 8) {
                                    Image(systemName: "bolt.fill")
                                        .foregroundStyle(AppTheme.xpPurple)
                                    Text("BRAND BLITZ")
                                        .font(AppTheme.funFont(.caption, weight: .heavy))
                                        .foregroundStyle(AppTheme.xpPurple)
                                }
                                .padding(.horizontal, 14)
                                .padding(.vertical, 5)
                                .background(AppTheme.xpPurple.opacity(0.12))
                                .clipShape(Capsule())

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
                Text(quizVM.isCorrect ? "Correct!" : "Incorrect")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
            }
            .foregroundStyle(quizVM.isCorrect ? AppTheme.successGreen : AppTheme.heartRed)

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

                    if !gameVM.hasUnlimitedHearts && gameVM.hearts <= 0 {
                        dismiss()
                        return
                    }

                    if quizVM.currentIndex >= quizVM.questions.count - 1 {
                        quizVM.finalizeQuiz()
                        gameVM.completeSubsection(
                            quizVM.subsectionId,
                            score: quizVM.score,
                            correctCount: quizVM.correctCount,
                            totalCount: quizVM.totalQuestions,
                            xpEarned: max(quizVM.xpEarned / 2, quizVM.correctCount * 5),
                            coinsEarned: max(quizVM.coinsEarned / 2, quizVM.correctCount)
                        )
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
                        .background(AppTheme.xpPurple)
                        .clipShape(.rect(cornerRadius: 14))
                }
                .padding(20)
            } else {
                Button {
                    withAnimation(.spring(duration: 0.3)) {
                        quizVM.submitAnswer()
                    }
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
}
