import SwiftUI

struct QuizResultView: View {
    let quizVM: QuizViewModel
    let gameVM: GameViewModel
    let onDismiss: () -> Void

    @State private var animateScore: Bool = false
    @State private var showStars: Bool = false
    @State private var showRewards: Bool = false
    @State private var showStreak: Bool = false
    @State private var showConfetti: Bool = false

    private var passed: Bool { quizVM.score >= 0.8 }
    private var perfect: Bool { quizVM.score == 1.0 }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 24) {
                    Spacer().frame(height: 20)

                    ZStack {
                        Circle()
                            .fill(passed ? AppTheme.successGreen.opacity(0.1) : AppTheme.heartRed.opacity(0.1))
                            .frame(width: 140, height: 140)

                        ProgressRing(
                            progress: animateScore ? quizVM.score : 0,
                            size: 130,
                            lineWidth: 10,
                            color: passed ? AppTheme.successGreen : AppTheme.heartRed
                        )
                        .animation(.spring(duration: 1.0).delay(0.3), value: animateScore)

                        VStack(spacing: 2) {
                            Text("\(Int(quizVM.score * 100))%")
                                .font(.system(.title, design: .rounded, weight: .heavy))
                                .foregroundStyle(passed ? AppTheme.successGreen : AppTheme.heartRed)
                            Text("\(quizVM.correctCount)/\(quizVM.totalQuestions)")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                    }

                    VStack(spacing: 8) {
                        Text(resultTitle)
                            .font(AppTheme.funFont(.title, weight: .heavy))

                        Text(resultSubtitle)
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }

                    if showStars && passed {
                        let stars = gameVM.starsFor(quizVM.subsectionId)
                        HStack(spacing: 6) {
                            ForEach(0..<5, id: \.self) { i in
                                Image(systemName: i < stars ? "star.fill" : "star")
                                    .font(.title2)
                                    .foregroundStyle(i < stars ? AppTheme.warningYellow : Color(.tertiaryLabel))
                                    .scaleEffect(i < stars ? 1.1 : 1.0)
                            }
                        }
                        .transition(.scale.combined(with: .opacity))
                    }

                    if showRewards {
                        VStack(spacing: 14) {
                            HStack(spacing: 24) {
                                RewardItem(icon: "bolt.fill", value: "+\(quizVM.xpEarned)", label: "XP", color: AppTheme.primaryBlue)
                                RewardItem(icon: "bitcoinsign.circle.fill", value: "+\(quizVM.coinsEarned)", label: "Coins", color: AppTheme.accentOrange)
                            }

                            if quizVM.maxConsecutive >= 3 {
                                HStack(spacing: 6) {
                                    Image(systemName: "flame.fill")
                                        .foregroundStyle(AppTheme.accentOrange)
                                    Text("Best streak: \(quizVM.maxConsecutive) in a row!")
                                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                        .foregroundStyle(AppTheme.accentOrange)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(AppTheme.accentOrange.opacity(0.12))
                                .clipShape(Capsule())
                            }

                            if perfect {
                                HStack(spacing: 6) {
                                    Image(systemName: "sparkles")
                                        .foregroundStyle(AppTheme.warningYellow)
                                    Text("PERFECT BONUS!")
                                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                        .foregroundStyle(AppTheme.warningYellow)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(AppTheme.warningYellow.opacity(0.12))
                                .clipShape(Capsule())
                            }
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    if showStreak && gameVM.streakExtended {
                        StreakFlameView(streak: gameVM.currentStreak, previousStreak: gameVM.previousStreak)
                            .transition(.scale.combined(with: .opacity))
                    }

                    HStack(spacing: 16) {
                        StatBox(label: "Correct", value: "\(quizVM.correctCount)", color: AppTheme.successGreen)
                        StatBox(label: "Wrong", value: "\(quizVM.wrongCount)", color: AppTheme.heartRed)
                        StatBox(label: "Best Streak", value: "\(quizVM.maxConsecutive)", color: AppTheme.accentOrange)
                    }
                    .padding(.horizontal)

                    Spacer().frame(height: 10)
                }
                .padding(.horizontal)
            }

            if showConfetti && passed {
                ConfettiView()
                    .ignoresSafeArea()
            }

            VStack {
                Spacer()
                VStack(spacing: 0) {
                    Divider()
                    Button(action: onDismiss) {
                        Text(passed ? "Continue" : "Try Again")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(passed ? AppTheme.successGreen : AppTheme.primaryBlue)
                            .clipShape(.rect(cornerRadius: 14))
                    }
                    .padding(20)
                }
                .background(Color(.systemBackground))
            }
        }
        .onAppear {
            animateScore = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.spring(duration: 0.5)) { showStars = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.spring(duration: 0.5)) { showRewards = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                withAnimation(.spring(duration: 0.6)) { showStreak = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showConfetti = true
            }
        }
    }

    private var resultTitle: String {
        if perfect { return "Perfect Score!" }
        if quizVM.score >= 0.9 { return "Excellent!" }
        if passed { return "Great Job!" }
        if quizVM.score >= 0.6 { return "Almost There!" }
        return "Keep Practicing!"
    }

    private var resultSubtitle: String {
        if passed {
            return "You've earned a mastery star for this section."
        }
        return "Score 80% or higher to earn a mastery star."
    }
}

struct RewardItem: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .foregroundStyle(color)
                Text(value)
                    .font(AppTheme.funFont(.title3, weight: .heavy))
            }
            Text(label)
                .font(AppTheme.funFont(.caption, weight: .bold))
                .foregroundStyle(.secondary)
        }
        .frame(width: 100)
        .padding(.vertical, 12)
        .background(color.opacity(0.08))
        .clipShape(.rect(cornerRadius: 14))
    }
}

struct StatBox: View {
    let label: String
    let value: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(AppTheme.funFont(.title3, weight: .heavy))
                .foregroundStyle(color)
            Text(label)
                .font(AppTheme.funFont(.caption, weight: .bold))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color(.tertiarySystemFill))
        .clipShape(.rect(cornerRadius: 12))
    }
}
