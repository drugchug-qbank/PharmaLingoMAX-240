import SwiftUI
import Combine

struct ClinicalQuizView: View {
    let gameVM: GameViewModel
    @State private var viewModel = ClinicalQuizViewModel()
    @Environment(\.dismiss) private var dismiss
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            Group {
                if let question = viewModel.question {
                    ScrollView {
                        VStack(spacing: 16) {
                            headerSection(question: question)
                            stemSection(question: question)
                            clinicalInfoBoxes(question: question)
                            questionSection(question: question)
                            answerChoices(question: question)

                            if !viewModel.hasSubmitted && !viewModel.hasAlreadyAnsweredToday {
                                submitButton
                            }

                            if viewModel.hasSubmitted || viewModel.hasAlreadyAnsweredToday {
                                resultBanner(question: question)
                                takeawaySection(question: question)
                                rationalesSection(question: question)
                                focusDrugsSection(question: question)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 40)
                    }
                    .scrollIndicators(.hidden)
                } else {
                    VStack(spacing: 16) {
                        Image(systemName: "cross.case.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.secondary)
                        Text("No Clinical Question Available")
                            .font(AppTheme.funFont(.title3, weight: .bold))
                        Text("Check back tomorrow!")
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 2) {
                        Text("Clinical QOTD")
                            .font(AppTheme.funFont(.headline, weight: .heavy))
                        HStack(spacing: 4) {
                            Image(systemName: "clock.fill")
                                .font(.system(size: 10))
                            Text(viewModel.countdownString)
                                .font(.system(size: 12, weight: .bold, design: .monospaced))
                        }
                        .foregroundStyle(AppTheme.accentOrange)
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .onReceive(timer) { _ in
                viewModel.updateCountdown()
            }
        }
    }

    @ViewBuilder
    private func headerSection(question: ClinicalQuestion) -> some View {
        VStack(spacing: 8) {
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "calendar")
                        .font(.caption)
                    Text("Day \(question.dayOfYear)")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(AppTheme.primaryBlue)
                .clipShape(Capsule())

                difficultyBadge(question.difficulty)

                Spacer()

                auraPointsBadge
            }

            Text(question.title)
                .font(AppTheme.funFont(.title3, weight: .heavy))
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.3))
    }

    @ViewBuilder
    private var auraPointsBadge: some View {
        let points = gameVM.clinicalAuraPoints
        HStack(spacing: 4) {
            Image(systemName: "sparkles")
                .font(.caption)
            Text("\(points)")
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .monospacedDigit()
        }
        .foregroundStyle(points >= 0 ? AppTheme.primaryBlue : AppTheme.heartRed)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background((points >= 0 ? AppTheme.primaryBlue : AppTheme.heartRed).opacity(0.1))
        .clipShape(Capsule())
    }

    @ViewBuilder
    private func difficultyBadge(_ difficulty: String) -> some View {
        let color: Color = switch difficulty.lowercased() {
        case "easy": AppTheme.successGreen
        case "medium": AppTheme.warningYellow
        case "hard": AppTheme.accentOrange
        default: AppTheme.heartRed
        }
        Text(difficulty.capitalized)
            .font(AppTheme.funFont(.caption2, weight: .heavy))
            .foregroundStyle(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }

    @ViewBuilder
    private func stemSection(question: ClinicalQuestion) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "doc.text.fill")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.primaryBlue)
                Text("Clinical Scenario")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(AppTheme.primaryBlue)
            }

            Text(question.stem)
                .font(.system(.subheadline, design: .rounded, weight: .medium))
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(3)
        }
        .padding(16)
        .cardStyle()
    }

    @ViewBuilder
    private func clinicalInfoBoxes(question: ClinicalQuestion) -> some View {
        if question.hasLabValues || question.hasMedications || question.hasVitals {
            VStack(spacing: 10) {
                if question.hasMedications {
                    clinicalInfoBox(
                        icon: "pills.fill",
                        title: "Current Medications",
                        items: question.currentMedications,
                        color: AppTheme.xpPurple
                    )
                }
                if question.hasLabValues {
                    clinicalInfoBox(
                        icon: "flask.fill",
                        title: "Lab Values",
                        items: question.labValues,
                        color: AppTheme.funTeal
                    )
                }
                if question.hasVitals {
                    clinicalInfoBox(
                        icon: "heart.text.clipboard.fill",
                        title: "Vitals",
                        items: question.vitals,
                        color: AppTheme.accentOrange
                    )
                }
            }
        }
    }

    @ViewBuilder
    private func clinicalInfoBox(icon: String, title: String, items: [String], color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.caption)
                    .foregroundStyle(color)
                Text(title)
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(color)
            }

            VStack(alignment: .leading, spacing: 4) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .top, spacing: 6) {
                        Circle()
                            .fill(color.opacity(0.5))
                            .frame(width: 5, height: 5)
                            .padding(.top, 6)
                        Text(item)
                            .font(.system(.caption, design: .rounded, weight: .medium))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.06))
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(color.opacity(0.2), lineWidth: 1)
        )
    }

    @ViewBuilder
    private func questionSection(question: ClinicalQuestion) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 6) {
                Image(systemName: "questionmark.circle.fill")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.warningYellow)
                Text("Question")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(AppTheme.warningYellow)
            }
            Text(question.question)
                .font(.system(.body, design: .rounded, weight: .semibold))
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(2)
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
    }

    @ViewBuilder
    private func answerChoices(question: ClinicalQuestion) -> some View {
        VStack(spacing: 8) {
            ForEach(question.answerChoices) { choice in
                answerChoiceRow(choice: choice, question: question)
            }
        }
    }

    @ViewBuilder
    private func answerChoiceRow(choice: ClinicalAnswerChoice, question: ClinicalQuestion) -> some View {
        let isSelected = viewModel.selectedChoiceId == choice.id
        let isCorrectChoice = choice.id == question.correctChoiceId
        let showResult = viewModel.hasSubmitted || viewModel.hasAlreadyAnsweredToday

        let bgColor: Color = {
            if showResult {
                if isCorrectChoice { return AppTheme.successGreen.opacity(0.12) }
                if isSelected && !isCorrectChoice { return AppTheme.heartRed.opacity(0.12) }
                return Color(.tertiarySystemFill)
            }
            return isSelected ? AppTheme.primaryBlue.opacity(0.12) : Color(.tertiarySystemFill)
        }()

        let borderColor: Color = {
            if showResult {
                if isCorrectChoice { return AppTheme.successGreen }
                if isSelected && !isCorrectChoice { return AppTheme.heartRed }
                return .clear
            }
            return isSelected ? AppTheme.primaryBlue : .clear
        }()

        let iconName: String? = {
            if showResult {
                if isCorrectChoice { return "checkmark.circle.fill" }
                if isSelected && !isCorrectChoice { return "xmark.circle.fill" }
                return nil
            }
            return nil
        }()

        Button {
            viewModel.selectChoice(choice.id)
        } label: {
            HStack(spacing: 12) {
                Text(choice.id)
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(.white)
                    .frame(width: 28, height: 28)
                    .background({
                        if showResult && isCorrectChoice { return AppTheme.successGreen }
                        if showResult && isSelected && !isCorrectChoice { return AppTheme.heartRed }
                        if isSelected { return AppTheme.primaryBlue }
                        return Color(.systemGray3)
                    }() as Color)
                    .clipShape(Circle())

                Text(choice.text)
                    .font(.system(.subheadline, design: .rounded, weight: .medium))
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)

                Spacer()

                if let iconName {
                    Image(systemName: iconName)
                        .font(.title3)
                        .foregroundStyle(isCorrectChoice ? AppTheme.successGreen : AppTheme.heartRed)
                }
            }
            .padding(14)
            .background(bgColor)
            .clipShape(.rect(cornerRadius: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(borderColor, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
        .disabled(viewModel.hasSubmitted || viewModel.hasAlreadyAnsweredToday)
    }

    @ViewBuilder
    private var submitButton: some View {
        Button {
            withAnimation(.spring(duration: 0.4)) {
                viewModel.submit(gameVM: gameVM)
            }
        } label: {
            Text("Submit Answer")
                .font(AppTheme.funFont(.headline, weight: .heavy))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    viewModel.selectedChoiceId != nil
                    ? LinearGradient(colors: [AppTheme.primaryBlue, AppTheme.darkBlue], startPoint: .leading, endPoint: .trailing)
                    : LinearGradient(colors: [Color(.systemGray4), Color(.systemGray4)], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 16))
                .shadow(color: viewModel.selectedChoiceId != nil ? AppTheme.primaryBlue.opacity(0.3) : .clear, radius: 8, y: 4)
        }
        .buttonStyle(.plain)
        .disabled(viewModel.selectedChoiceId == nil)
    }

    @ViewBuilder
    private func resultBanner(question: ClinicalQuestion) -> some View {
        let correct = viewModel.todaysResult ?? viewModel.isCorrect
        HStack(spacing: 12) {
            Image(systemName: correct ? "checkmark.seal.fill" : "xmark.seal.fill")
                .font(.title2)
                .foregroundStyle(correct ? AppTheme.successGreen : AppTheme.heartRed)

            VStack(alignment: .leading, spacing: 2) {
                Text(correct ? "Correct!" : "Incorrect")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                    .foregroundStyle(correct ? AppTheme.successGreen : AppTheme.heartRed)
                Text(correct ? "+1 Clinical Aura Point" : "-1 Clinical Aura Point")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(correct ? AppTheme.successGreen.opacity(0.8) : AppTheme.heartRed.opacity(0.8))
            }

            Spacer()

            VStack(spacing: 2) {
                Text("Aura")
                    .font(AppTheme.funFont(.caption2, weight: .medium))
                    .foregroundStyle(.secondary)
                let points = gameVM.clinicalAuraPoints
                Text("\(points)")
                    .font(AppTheme.funFont(.title2, weight: .heavy))
                    .foregroundStyle(points >= 0 ? AppTheme.primaryBlue : AppTheme.heartRed)
                    .monospacedDigit()
            }
        }
        .padding(16)
        .background((correct ? AppTheme.successGreen : AppTheme.heartRed).opacity(0.08))
        .clipShape(.rect(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke((correct ? AppTheme.successGreen : AppTheme.heartRed).opacity(0.3), lineWidth: 2)
        )
    }

    @ViewBuilder
    private func takeawaySection(question: ClinicalQuestion) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "lightbulb.fill")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.warningYellow)
                Text("Key Takeaway")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(AppTheme.warningYellow)
            }
            Text(question.takeaway)
                .font(.system(.subheadline, design: .rounded, weight: .medium))
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(2)
        }
        .padding(16)
        .background(AppTheme.warningYellow.opacity(0.06))
        .clipShape(.rect(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(AppTheme.warningYellow.opacity(0.2), lineWidth: 1)
        )
    }

    @ViewBuilder
    private func rationalesSection(question: ClinicalQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "text.book.closed.fill")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.xpPurple)
                Text("Answer Explanations")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(AppTheme.xpPurple)
            }

            ForEach(question.answerChoices) { choice in
                let isCorrectChoice = choice.id == question.correctChoiceId
                let rationale = question.rationales[choice.id] ?? ""

                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 8) {
                        Text(choice.id)
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(.white)
                            .frame(width: 22, height: 22)
                            .background(isCorrectChoice ? AppTheme.successGreen : Color(.systemGray4))
                            .clipShape(Circle())

                        Text(choice.text)
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(isCorrectChoice ? AppTheme.successGreen : .primary)
                            .fixedSize(horizontal: false, vertical: true)

                        if isCorrectChoice {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption)
                                .foregroundStyle(AppTheme.successGreen)
                        }
                    }

                    if !rationale.isEmpty {
                        Text(rationale)
                            .font(.system(.caption, design: .rounded, weight: .medium))
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(2)
                    }
                }
                .padding(10)
                .background(isCorrectChoice ? AppTheme.successGreen.opacity(0.06) : Color(.tertiarySystemFill).opacity(0.5))
                .clipShape(.rect(cornerRadius: 10))
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))
    }

    @ViewBuilder
    private func focusDrugsSection(question: ClinicalQuestion) -> some View {
        if !question.focusDrugs.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Image(systemName: "cross.vial.fill")
                        .font(.caption)
                        .foregroundStyle(AppTheme.funTeal)
                    Text("Focus Drugs")
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(AppTheme.funTeal)
                }

                FlowLayout(spacing: 6) {
                    ForEach(question.focusDrugs, id: \.self) { drug in
                        Text(drug)
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(AppTheme.funTeal.opacity(0.1))
                            .clipShape(Capsule())
                    }
                }
            }
            .padding(12)
            .cardStyle()
        }
    }
}

struct FlowLayout: Layout {
    let spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y), proposal: .unspecified)
        }
    }

    private func arrangeSubviews(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, positions: [CGPoint]) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var lineHeight: CGFloat = 0
        var maxX: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > maxWidth, currentX > 0 {
                currentX = 0
                currentY += lineHeight + spacing
                lineHeight = 0
            }
            positions.append(CGPoint(x: currentX, y: currentY))
            lineHeight = max(lineHeight, size.height)
            currentX += size.width + spacing
            maxX = max(maxX, currentX - spacing)
        }

        return (CGSize(width: maxX, height: currentY + lineHeight), positions)
    }
}
