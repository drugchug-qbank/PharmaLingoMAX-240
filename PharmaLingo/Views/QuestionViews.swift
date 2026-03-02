import SwiftUI

struct TrueFalseQuestionView: View {
    let quizVM: QuizViewModel

    var body: some View {
        VStack(spacing: 12) {
            ForEach(["True", "False"], id: \.self) { option in
                OptionButton(
                    text: option,
                    isSelected: quizVM.selectedAnswer == option,
                    isCorrect: quizVM.hasAnswered ? option == quizVM.currentQuestion?.correctAnswer : nil,
                    showResult: quizVM.hasAnswered
                ) {
                    guard !quizVM.hasAnswered else { return }
                    quizVM.selectedAnswer = option
                }
            }
        }
        .padding(.horizontal)
    }
}

struct FillBlankQuestionView: View {
    let quizVM: QuizViewModel

    var body: some View {
        VStack(spacing: 20) {
            if let selected = quizVM.selectedAnswer {
                HStack {
                    Text("Your answer:")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.secondary)
                    Text(selected)
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(AppTheme.primaryBlue)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(AppTheme.primaryBlue.opacity(0.12))
                        .clipShape(.rect(cornerRadius: 12))
                }
            } else {
                HStack {
                    Text("Tap an option to fill the blank")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 8)
            }

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                if let question = quizVM.currentQuestion {
                    ForEach(quizVM.shuffledOptions, id: \.self) { option in
                        OptionChip(
                            text: option,
                            isSelected: quizVM.selectedAnswer == option,
                            isCorrect: quizVM.hasAnswered ? option == question.correctAnswer : nil,
                            showResult: quizVM.hasAnswered
                        ) {
                            guard !quizVM.hasAnswered else { return }
                            quizVM.selectedAnswer = option
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MultipleChoiceQuestionView: View {
    let quizVM: QuizViewModel

    var body: some View {
        VStack(spacing: 10) {
            if let question = quizVM.currentQuestion {
                ForEach(quizVM.shuffledOptions, id: \.self) { option in
                    OptionButton(
                        text: option,
                        isSelected: quizVM.selectedAnswer == option,
                        isCorrect: quizVM.hasAnswered ? option == question.correctAnswer : nil,
                        showResult: quizVM.hasAnswered
                    ) {
                        guard !quizVM.hasAnswered else { return }
                        quizVM.selectedAnswer = option
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct SelectAllQuestionView: View {
    let quizVM: QuizViewModel

    var body: some View {
        VStack(spacing: 10) {
            if let question = quizVM.currentQuestion {
                ForEach(quizVM.shuffledOptions, id: \.self) { option in
                    let isSelected = quizVM.selectedAnswers.contains(option)
                    let isActuallyCorrect = question.correctAnswers.contains(option)

                    Button {
                        guard !quizVM.hasAnswered else { return }
                        quizVM.toggleSelectAllOption(option)
                    } label: {
                        HStack(spacing: 12) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(checkboxBorderColor(isSelected: isSelected, isCorrect: isActuallyCorrect, showResult: quizVM.hasAnswered), lineWidth: 2.5)
                                    .frame(width: 26, height: 26)
                                if isSelected {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(checkboxFillColor(isCorrect: isActuallyCorrect, showResult: quizVM.hasAnswered))
                                        .frame(width: 26, height: 26)
                                    Image(systemName: "checkmark")
                                        .font(AppTheme.funFont(.caption, weight: .heavy))
                                        .foregroundStyle(.white)
                                }
                            }

                            Text(option)
                                .font(AppTheme.funFont(.body, weight: .medium))
                                .foregroundStyle(.primary)
                                .multilineTextAlignment(.leading)

                            Spacer()

                            if quizVM.hasAnswered {
                                if isActuallyCorrect {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(AppTheme.successGreen)
                                } else if isSelected && !isActuallyCorrect {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(AppTheme.heartRed)
                                }
                            }
                        }
                        .padding(14)
                        .background(selectAllBackground(isSelected: isSelected, isCorrect: isActuallyCorrect, showResult: quizVM.hasAnswered))
                        .clipShape(.rect(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(selectAllBorder(isSelected: isSelected, isCorrect: isActuallyCorrect, showResult: quizVM.hasAnswered), lineWidth: 2.5)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal)
    }

    private func checkboxBorderColor(isSelected: Bool, isCorrect: Bool, showResult: Bool) -> Color {
        if showResult {
            return isCorrect ? AppTheme.successGreen : (isSelected ? AppTheme.heartRed : Color(.systemFill))
        }
        return isSelected ? AppTheme.primaryBlue : Color(.systemFill)
    }

    private func checkboxFillColor(isCorrect: Bool, showResult: Bool) -> Color {
        if showResult {
            return isCorrect ? AppTheme.successGreen : AppTheme.heartRed
        }
        return AppTheme.primaryBlue
    }

    private func selectAllBackground(isSelected: Bool, isCorrect: Bool, showResult: Bool) -> Color {
        if showResult && isSelected {
            return isCorrect ? AppTheme.successGreen.opacity(0.08) : AppTheme.heartRed.opacity(0.08)
        }
        if showResult && isCorrect {
            return AppTheme.successGreen.opacity(0.05)
        }
        return isSelected ? AppTheme.primaryBlue.opacity(0.06) : Color(.tertiarySystemFill)
    }

    private func selectAllBorder(isSelected: Bool, isCorrect: Bool, showResult: Bool) -> Color {
        if showResult {
            if isCorrect { return AppTheme.successGreen.opacity(0.6) }
            if isSelected && !isCorrect { return AppTheme.heartRed.opacity(0.6) }
            return .clear
        }
        return isSelected ? AppTheme.primaryBlue.opacity(0.6) : .clear
    }
}

struct MatchingQuestionView: View {
    let quizVM: QuizViewModel

    var body: some View {
        if let question = quizVM.currentQuestion {
            VStack(spacing: 16) {
                Text("Tap a term, then its match")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)

                HStack(alignment: .top, spacing: 12) {
                    VStack(spacing: 8) {
                        ForEach(question.matchingPairs, id: \.left) { pair in
                            let isMatched = quizVM.matchedPairs[pair.left] != nil
                            let isSelectedLeft = quizVM.selectedMatchLeft == pair.left

                            Button {
                                guard !quizVM.hasAnswered else { return }
                                quizVM.selectMatchItem(pair.left, isLeft: true)
                            } label: {
                                Text(pair.left)
                                    .font(AppTheme.funFont(.subheadline, weight: .semibold))
                                    .foregroundStyle(isMatched ? .white : .primary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 8)
                                    .background(matchLeftColor(isMatched: isMatched, isSelected: isSelectedLeft, pair: pair))
                                    .clipShape(.rect(cornerRadius: 12))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(isSelectedLeft ? AppTheme.primaryBlue : .clear, lineWidth: 2.5)
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }

                    VStack(spacing: 8) {
                        ForEach(quizVM.shuffledRightOptions, id: \.index) { item in
                            let isMatched = quizVM.isRightIndexMatched(item.index)

                            Button {
                                guard !quizVM.hasAnswered else { return }
                                quizVM.selectMatchItem(item.value, isLeft: false, rightIndex: item.index)
                            } label: {
                                Text(item.value)
                                    .font(AppTheme.funFont(.subheadline, weight: .semibold))
                                    .foregroundStyle(isMatched ? .white : .primary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 8)
                                    .background(matchRightColor(isMatched: isMatched, rightIndex: item.index))
                                    .clipShape(.rect(cornerRadius: 12))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal)

                if !quizVM.matchedPairs.isEmpty && !quizVM.hasAnswered {
                    Button {
                        quizVM.matchedPairs.removeAll()
                        quizVM.selectedMatchLeft = nil
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.counterclockwise")
                            Text("Reset")
                        }
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(AppTheme.heartRed)
                    }
                }
            }
        }
    }

    private func matchLeftColor(isMatched: Bool, isSelected: Bool, pair: MatchingPair) -> Color {
        if quizVM.hasAnswered {
            let matchedValue = quizVM.rightValueForLeft(pair.left)
            let isCorrectMatch = matchedValue == pair.right
            return isMatched ? (isCorrectMatch ? AppTheme.successGreen : AppTheme.heartRed) : Color(.tertiarySystemFill)
        }
        return isMatched ? AppTheme.primaryBlue : Color(.tertiarySystemFill)
    }

    private func matchRightColor(isMatched: Bool, rightIndex: Int) -> Color {
        if quizVM.hasAnswered && isMatched {
            let matchedLeft = quizVM.matchedPairs.first { $0.value == rightIndex }?.key
            if let left = matchedLeft {
                let correctPair = quizVM.currentQuestion?.matchingPairs.first { $0.left == left }
                let rightValue = quizVM.shuffledRightOptions.first(where: { $0.index == rightIndex })?.value
                return correctPair?.right == rightValue ? AppTheme.successGreen : AppTheme.heartRed
            }
        }
        return isMatched ? AppTheme.primaryBlue : Color(.tertiarySystemFill)
    }
}

struct OptionButton: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let showResult: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(AppTheme.funFont(.body, weight: .semibold))
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                Spacer()
                if showResult, let isCorrect {
                    Image(systemName: isCorrect ? "checkmark.circle.fill" : (isSelected ? "xmark.circle.fill" : ""))
                        .foregroundStyle(isCorrect ? AppTheme.successGreen : AppTheme.heartRed)
                }
            }
            .padding(16)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(borderColor, lineWidth: 2.5)
            )
        }
        .buttonStyle(.plain)
    }

    private var backgroundColor: Color {
        if showResult {
            if let isCorrect, isCorrect { return AppTheme.successGreen.opacity(0.1) }
            if isSelected { return AppTheme.heartRed.opacity(0.1) }
            return Color(.tertiarySystemFill)
        }
        return isSelected ? AppTheme.primaryBlue.opacity(0.1) : Color(.tertiarySystemFill)
    }

    private var borderColor: Color {
        if showResult {
            if let isCorrect, isCorrect { return AppTheme.successGreen }
            if isSelected { return AppTheme.heartRed }
            return .clear
        }
        return isSelected ? AppTheme.primaryBlue : .clear
    }
}

struct OptionChip: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool?
    let showResult: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .foregroundStyle(isSelected ? .white : .primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(chipBackground)
                .clipShape(.rect(cornerRadius: 14))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(chipBorder, lineWidth: 2.5)
                )
                .shadow(color: isSelected ? chipBackground.opacity(0.3) : .clear, radius: 4, y: 2)
        }
        .buttonStyle(.plain)
    }

    private var chipBackground: Color {
        if showResult {
            if let isCorrect, isCorrect { return AppTheme.successGreen }
            if isSelected { return AppTheme.heartRed }
            return Color(.tertiarySystemFill)
        }
        return isSelected ? AppTheme.primaryBlue : Color(.tertiarySystemFill)
    }

    private var chipBorder: Color {
        if showResult {
            if let isCorrect, isCorrect { return AppTheme.successGreen }
            if isSelected { return AppTheme.heartRed }
            return .clear
        }
        return isSelected ? AppTheme.primaryBlue : .clear
    }
}
