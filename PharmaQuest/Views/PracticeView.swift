import SwiftUI

struct PracticeView: View {
    let gameVM: GameViewModel
    @State private var showQuickPractice: Bool = false
    @State private var showBrandBlitz: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Practice")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                        Text("Strengthen your knowledge!")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.vertical, 16)
                    .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))

                    VStack(spacing: 14) {
                        PracticeCard(
                            title: "Spaced Review",
                            subtitle: "\(max(1, gameVM.completedSubsections.count)) drug\(gameVM.completedSubsections.count == 1 ? "" : "s") due for review",
                            iconName: "arrow.clockwise.circle.fill",
                            gradient: [Color(hex: "FF6B35"), Color(hex: "F7931E")],
                            badgeCount: gameVM.completedSubsections.count
                        ) {
                            showQuickPractice = true
                        }

                        PracticeCard(
                            title: "Quick Practice",
                            subtitle: "10 random questions from all categories",
                            iconName: "bolt.circle.fill",
                            gradient: [Color(hex: "E91E63"), Color(hex: "FF5722")],
                            badgeCount: nil
                        ) {
                            showQuickPractice = true
                        }

                        PracticeCard(
                            title: "Brand Blitz Quiz",
                            subtitle: "15 rapid-fire brand/generic questions",
                            iconName: "arrow.triangle.2.circlepath.circle.fill",
                            gradient: [Color(hex: "9C27B0"), Color(hex: "E040FB")],
                            badgeCount: nil
                        ) {
                            showBrandBlitz = true
                        }

                        HStack(spacing: 0) {
                            PracticeStatItem(icon: "target", value: "\(Int(gameVM.accuracy * 100))%", label: "Accuracy", color: AppTheme.accentOrange)
                            PracticeStatItem(icon: "bolt.fill", value: "\(gameVM.totalXP)", label: "Total XP", color: AppTheme.primaryBlue)
                            PracticeStatItem(icon: "chart.line.uptrend.xyaxis", value: "\(gameVM.lessonsCompleted)", label: "Lessons", color: AppTheme.successGreen)
                        }
                        .padding(16)
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text("Review Mistakes")
                                    .font(.headline)
                            }

                            let mistakeCount = gameVM.questionsAnswered - gameVM.questionsCorrect
                            HStack(spacing: 12) {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(AppTheme.heartRed)

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("\(mistakeCount) mistakes this week")
                                        .font(.subheadline.weight(.medium))
                                    Text("\(max(0, mistakeCount / 3)) drugs to review")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(14)
                            .background(Color(.tertiarySystemFill))
                            .clipShape(.rect(cornerRadius: 12))
                        }
                        .padding(16)
                        .cardStyle()
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
            .fullScreenCover(isPresented: $showQuickPractice) {
                quickPracticeQuiz
            }
            .fullScreenCover(isPresented: $showBrandBlitz) {
                quickPracticeQuiz
            }
        }
    }

    @ViewBuilder
    private var quickPracticeQuiz: some View {
        let allCompleted = gameVM.completedSubsections
        let subsectionId = allCompleted.first ?? "1a"
        let sub = DrugDataService.shared.subsection(for: subsectionId) ?? DrugDataService.shared.modules[0].subsections[0]
        QuizView(subsection: sub, gameVM: gameVM)
    }
}

struct PracticeCard: View {
    let title: String
    let subtitle: String
    let iconName: String
    let gradient: [Color]
    let badgeCount: Int?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundStyle(.white)

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.headline.bold())
                        .foregroundStyle(.white)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.85))
                }

                Spacer()

                if let count = badgeCount, count > 0 {
                    Text("\(count)")
                        .font(.caption.bold())
                        .foregroundStyle(gradient[0])
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(18)
            .background(LinearGradient(colors: gradient, startPoint: .leading, endPoint: .trailing))
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: gradient[0].opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(.plain)
    }
}

struct PracticeStatItem: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            Text(value)
                .font(.headline)
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}
