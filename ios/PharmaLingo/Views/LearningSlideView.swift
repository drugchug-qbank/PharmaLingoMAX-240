import SwiftUI

nonisolated struct SlideCheckpoint: Sendable {
    let question: String
    let options: [String]
    let correctIndex: Int
}

struct LearningSlideView: View {
    let subsection: Subsection
    let gameVM: GameViewModel
    let onComplete: () -> Void
    let onExit: () -> Void

    @State private var currentSlide: Int = 0
    @State private var showExitDialog: Bool = false
    @State private var checkpointState: CheckpointState = .none
    @State private var checkpointSelected: Int? = nil
    @State private var checkpointRevealed: Bool = false
    @State private var completedCheckpoints: Set<Int> = []
    @State private var slideAppeared: Bool = false
    @State private var generatedCheckpoints: [Int: SlideCheckpoint] = [:]

    private var slides: [LearningSlide] { subsection.learningSlides }
    private var isLastSlide: Bool { currentSlide >= slides.count - 1 }
    private var totalSteps: Int { slides.count + checkpointSlideIndices.count }

    private var currentStep: Int {
        var step = 0
        for i in 0..<currentSlide {
            step += 1
            if checkpointSlideIndices.contains(i) { step += 1 }
        }
        if checkpointState == .active { step += 1 } else { step += 1 }
        return step
    }

    private var checkpointSlideIndices: [Int] {
        guard slides.count > 1 else { return [] }
        var indices: [Int] = []
        var i = 1
        while i < slides.count {
            indices.append(i)
            i += 2
        }
        return indices
    }

    private enum CheckpointState: Equatable {
        case none
        case active
    }

    var body: some View {
        VStack(spacing: 0) {
            header
            progressBarView

            Group {
                if checkpointState == .active, let cp = generatedCheckpoints[currentSlide] {
                    checkpointView(cp)
                } else if !slides.isEmpty {
                    slideContentView
                }
            }

            Spacer()
            bottomButton
        }
        .background(Color(.systemBackground))
        .overlay {
            if showExitDialog {
                exitDialogOverlay
            }
        }
        .sensoryFeedback(.impact(weight: .light), trigger: currentSlide)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) { slideAppeared = true }
            buildCheckpoints()
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            Button {
                showExitDialog = true
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.8))
            }

            Spacer()

            Text("\(currentSlide + 1) of \(slides.count)")
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .foregroundStyle(.white.opacity(0.8))

            Spacer()
            Color.clear.frame(width: 24)
        }
        .padding()
        .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))
    }

    // MARK: - Progress Bar

    private var progressBarView: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle().fill(Color.white.opacity(0.3))
                Rectangle()
                    .fill(
                        LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: geo.size.width * Double(currentStep) / Double(max(totalSteps, 1)))
                    .animation(.spring(duration: 0.3), value: currentStep)
            }
        }
        .frame(height: 6)
        .background(AppTheme.primaryBlue)
    }

    // MARK: - Slide Content

    private var slideContentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                let slide = slides[currentSlide]

                HStack {
                    Image(systemName: "lightbulb.fill")
                        .font(.title2)
                        .foregroundStyle(AppTheme.warningYellow)
                    Text(slide.title)
                        .font(AppTheme.funFont(.title2, weight: .heavy))
                }
                .padding(.top, 8)
                .opacity(slideAppeared ? 1 : 0)
                .offset(y: slideAppeared ? 0 : 12)

                Text(slide.content)
                    .font(AppTheme.funFont(.body, weight: .medium))
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)

                VStack(alignment: .leading, spacing: 12) {
                    ForEach(Array(slide.bulletPoints.enumerated()), id: \.offset) { _, point in
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(AppTheme.successGreen)
                                .font(.subheadline)
                                .padding(.top, 2)
                            Text(point)
                                .font(AppTheme.funFont(.subheadline, weight: .medium))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .padding(16)
                .background(AppTheme.successGreen.opacity(0.08))
                .clipShape(.rect(cornerRadius: 14))

                if !slide.highlightText.isEmpty {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(AppTheme.accentOrange)
                        Text(slide.highlightText)
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(AppTheme.darkBlue)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(AppTheme.warningYellow.opacity(0.15))
                    .clipShape(.rect(cornerRadius: 14))
                }
            }
            .padding(20)
        }
        .id(currentSlide)
    }

    // MARK: - Checkpoint View

    private func checkpointView(_ checkpoint: SlideCheckpoint) -> some View {
        ScrollView {
            VStack(spacing: 24) {
                HStack(spacing: 8) {
                    Image(systemName: "brain.fill")
                        .font(.title2)
                        .foregroundStyle(AppTheme.xpPurple)
                    Text("Quick Check")
                        .font(AppTheme.funFont(.title3, weight: .heavy))
                        .foregroundStyle(AppTheme.xpPurple)
                }
                .padding(.top, 20)

                Text(checkpoint.question)
                    .font(AppTheme.funFont(.headline, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
                    .fixedSize(horizontal: false, vertical: true)

                VStack(spacing: 12) {
                    ForEach(Array(checkpoint.options.enumerated()), id: \.offset) { idx, option in
                        Button {
                            guard !checkpointRevealed else { return }
                            withAnimation(.spring(duration: 0.25)) {
                                checkpointSelected = idx
                                checkpointRevealed = true
                            }
                        } label: {
                            HStack(spacing: 12) {
                                checkpointOptionIcon(idx: idx, correctIdx: checkpoint.correctIndex)

                                Text(option)
                                    .font(AppTheme.funFont(.body, weight: .semibold))
                                    .foregroundStyle(.primary)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)

                                Spacer()
                            }
                            .padding(16)
                            .background(checkpointOptionBackground(idx: idx, correctIdx: checkpoint.correctIndex))
                            .clipShape(.rect(cornerRadius: 14))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(checkpointOptionBorder(idx: idx, correctIdx: checkpoint.correctIndex), lineWidth: 2.5)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 4)

                if checkpointRevealed {
                    HStack(spacing: 6) {
                        let isCorrect = checkpointSelected == checkpoint.correctIndex
                        Image(systemName: isCorrect ? "checkmark.circle.fill" : "arrow.uturn.right.circle.fill")
                            .font(.title3)
                        Text(isCorrect ? "You got it!" : "Good to review — let's keep going!")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                    }
                    .foregroundStyle(checkpointSelected == checkpoint.correctIndex ? AppTheme.successGreen : AppTheme.accentOrange)
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(20)
        }
        .id("checkpoint-\(currentSlide)")
    }

    @ViewBuilder
    private func checkpointOptionIcon(idx: Int, correctIdx: Int) -> some View {
        if checkpointRevealed {
            if idx == correctIdx {
                Image(systemName: "checkmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.successGreen)
            } else if idx == checkpointSelected {
                Image(systemName: "xmark.circle.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.heartRed)
            } else {
                Circle()
                    .stroke(Color(.tertiaryLabel), lineWidth: 2)
                    .frame(width: 24, height: 24)
            }
        } else {
            Circle()
                .stroke(idx == checkpointSelected ? AppTheme.primaryBlue : Color(.tertiaryLabel), lineWidth: 2)
                .frame(width: 24, height: 24)
        }
    }

    private func checkpointOptionBackground(idx: Int, correctIdx: Int) -> Color {
        guard checkpointRevealed else {
            return Color(.tertiarySystemFill)
        }
        if idx == correctIdx { return AppTheme.successGreen.opacity(0.1) }
        if idx == checkpointSelected { return AppTheme.heartRed.opacity(0.08) }
        return Color(.tertiarySystemFill)
    }

    private func checkpointOptionBorder(idx: Int, correctIdx: Int) -> Color {
        guard checkpointRevealed else { return .clear }
        if idx == correctIdx { return AppTheme.successGreen }
        if idx == checkpointSelected { return AppTheme.heartRed }
        return .clear
    }

    // MARK: - Bottom Button

    private var bottomButton: some View {
        Button {
            handleContinue()
        } label: {
            Text(bottomButtonTitle)
                .font(AppTheme.funFont(.headline, weight: .bold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(bottomButtonColor)
                .clipShape(.rect(cornerRadius: 14))
        }
        .disabled(checkpointState == .active && !checkpointRevealed)
        .padding(20)
    }

    private var bottomButtonTitle: String {
        if checkpointState == .active {
            return checkpointRevealed ? "Continue" : "Answer to Continue"
        }
        return isLastSlide ? "Start Quiz" : "Continue"
    }

    private var bottomButtonColor: Color {
        if checkpointState == .active && !checkpointRevealed {
            return Color(.systemFill)
        }
        return isLastSlide && checkpointState != .active ? AppTheme.successGreen : AppTheme.primaryBlue
    }

    private func handleContinue() {
        if checkpointState == .active {
            completedCheckpoints.insert(currentSlide)
            withAnimation(.spring(duration: 0.3)) {
                checkpointState = .none
                checkpointSelected = nil
                checkpointRevealed = false
            }
            advanceSlide()
            return
        }

        if isLastSlide {
            gameVM.markLearningComplete(subsection.id)
            onComplete()
        } else {
            if checkpointSlideIndices.contains(currentSlide) && !completedCheckpoints.contains(currentSlide) {
                withAnimation(.spring(duration: 0.3)) {
                    checkpointState = .active
                    checkpointSelected = nil
                    checkpointRevealed = false
                }
            } else {
                advanceSlide()
            }
        }
    }

    private func advanceSlide() {
        slideAppeared = false
        withAnimation(.spring(duration: 0.3)) {
            currentSlide += 1
        }
        withAnimation(.easeOut(duration: 0.3).delay(0.1)) {
            slideAppeared = true
        }
    }

    // MARK: - Exit Dialog

    private var exitDialogOverlay: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture { showExitDialog = false }

            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    Image(systemName: "book.closed.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(AppTheme.primaryBlue)

                    Text("Leave Lesson?")
                        .font(AppTheme.funFont(.title3, weight: .heavy))

                    Text("You haven't finished this lesson yet. Your progress won't be saved.")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 28)
                .padding(.horizontal, 24)
                .padding(.bottom, 20)

                VStack(spacing: 10) {
                    Button {
                        withAnimation(.spring(duration: 0.25)) { showExitDialog = false }
                    } label: {
                        Text("Resume Learning")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(AppTheme.primaryBlue)
                            .clipShape(.rect(cornerRadius: 12))
                    }

                    Button {
                        gameVM.markLearningComplete(subsection.id)
                        showExitDialog = false
                        onComplete()
                    } label: {
                        Text("Skip to Quiz")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                            .foregroundStyle(AppTheme.accentOrange)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(AppTheme.accentOrange.opacity(0.12))
                            .clipShape(.rect(cornerRadius: 12))
                    }

                    Button {
                        showExitDialog = false
                        onExit()
                    } label: {
                        Text("Exit")
                            .font(AppTheme.funFont(.subheadline, weight: .semibold))
                            .foregroundStyle(.secondary)
                            .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: 24))
            .shadow(color: .black.opacity(0.2), radius: 30, x: 0, y: 10)
            .padding(.horizontal, 32)
            .transition(.scale(scale: 0.9).combined(with: .opacity))
        }
        .transition(.opacity)
    }

    // MARK: - Checkpoint Generation

    private func generateCheckpoint(for slide: LearningSlide) -> SlideCheckpoint {
        let highlight = slide.highlightText
        let bullets = slide.bulletPoints

        if !highlight.isEmpty && bullets.count >= 2 {
            let correctOption = highlight
            let distractors = bullets.shuffled().prefix(2).map { $0 }
            var options = [correctOption] + distractors
            options.shuffle()
            let correctIdx = options.firstIndex(of: correctOption) ?? 0
            return SlideCheckpoint(
                question: "Which key takeaway was highlighted for \"\(slide.title)\"?",
                options: options,
                correctIndex: correctIdx
            )
        }

        if bullets.count >= 3 {
            let correct = bullets[0]
            let wrong1 = "None of the listed points apply"
            let wrong2 = bullets.count > 2 ? reverseBullet(bullets[1]) : "This section had no key facts"
            var options = [correct, wrong1, wrong2]
            options.shuffle()
            let correctIdx = options.firstIndex(of: correct) ?? 0
            return SlideCheckpoint(
                question: "Which of these is a key fact from \"\(slide.title)\"?",
                options: options,
                correctIndex: correctIdx
            )
        }

        return SlideCheckpoint(
            question: "The previous slide covered \"\(slide.title)\". True or False?",
            options: ["True", "False"],
            correctIndex: 0
        )
    }

    private func reverseBullet(_ bullet: String) -> String {
        if bullet.lowercased().contains("not") {
            return bullet.replacingOccurrences(of: "not ", with: "", options: .caseInsensitive)
        }
        return "This is NOT a key fact: \(bullet)"
    }

    private func buildCheckpoints() {
        guard generatedCheckpoints.isEmpty else { return }
        var map: [Int: SlideCheckpoint] = [:]
        for idx in checkpointSlideIndices {
            if idx < slides.count {
                map[idx] = generateCheckpoint(for: slides[idx])
            }
        }
        generatedCheckpoints = map
    }
}
