import SwiftUI

struct QuizResultView: View {
    let quizVM: QuizViewModel
    let gameVM: GameViewModel
    var milestones: [MilestoneType] = []
    var unlockState: SubsectionUnlockState = .empty
    var previousDepth: Int = 0
    let onDismiss: () -> Void

    @State private var animateScore: Bool = false
    @State private var showDepthMeter: Bool = false
    @State private var showRewards: Bool = false
    @State private var showStreak: Bool = false
    @State private var showConfetti: Bool = false
    @State private var showBonusPage: Bool = false
    @State private var showMedal: Bool = false
    @State private var showMilestones: Bool = false

    private var passed: Bool { quizVM.score >= 0.8 }
    private var perfect: Bool { quizVM.score == 1.0 }
    private var isBoss: Bool { quizVM.isMasteryQuiz }

    var body: some View {
        ZStack {
            if showBonusPage && passed {
                BonusRewardsView(
                    gameVM: gameVM,
                    quizVM: quizVM,
                    onClaim: { onDismiss() },
                    onSkip: { onDismiss() }
                )
            } else {
                ScrollView {
                    VStack(spacing: 24) {
                        Spacer().frame(height: 20)

                        ZStack {
                            Circle()
                                .fill(bossRingColor.opacity(0.1))
                                .frame(width: 140, height: 140)

                            ProgressRing(
                                progress: animateScore ? quizVM.score : 0,
                                size: 130,
                                lineWidth: isBoss ? 12 : 10,
                                color: bossRingColor
                            )
                            .animation(.spring(duration: 1.0).delay(0.3), value: animateScore)

                            VStack(spacing: 2) {
                                Text("\(Int(quizVM.score * 100))%")
                                    .font(.system(.title, design: .rounded, weight: .heavy))
                                    .foregroundStyle(bossRingColor)
                                Text("\(quizVM.correctCount)/\(quizVM.totalQuestions)")
                                    .font(AppTheme.funFont(.caption, weight: .bold))
                                    .foregroundStyle(.secondary)
                            }

                            if isBoss && passed && showMedal {
                                Image(systemName: bossMedalIcon)
                                    .font(.system(size: 28, weight: .bold))
                                    .foregroundStyle(bossMedalColor)
                                    .offset(x: 48, y: -48)
                                    .transition(.scale.combined(with: .opacity))
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

                        if showDepthMeter {
                            MasteryDepthMeterView(
                                currentDepth: unlockState.masteryDepth10,
                                previousDepth: previousDepth,
                                unlockState: unlockState,
                                milestones: milestones
                            )
                            .transition(.scale.combined(with: .opacity))
                        }

                        if showRewards {
                            VStack(spacing: 14) {
                                if let breakdown = quizVM.xpBreakdown {
                                    HStack(spacing: 24) {
                                        RewardItem(icon: "bolt.fill", value: "+\(breakdown.finalAwardedXP)", label: "XP", color: AppTheme.primaryBlue)
                                        RewardItem(icon: "bitcoinsign.circle.fill", value: "+\(quizVM.coinsEarned)", label: "Coins", color: AppTheme.accentOrange)
                                    }

                                    XPBreakdownCard(breakdown: breakdown)
                                } else {
                                    HStack(spacing: 24) {
                                        RewardItem(icon: "bolt.fill", value: "+\(quizVM.xpEarned)", label: "XP", color: AppTheme.primaryBlue)
                                        RewardItem(icon: "bitcoinsign.circle.fill", value: "+\(quizVM.coinsEarned)", label: "Coins", color: AppTheme.accentOrange)
                                    }
                                }

                                if gameVM.isProUser {
                                    HStack(spacing: 6) {
                                        Image(systemName: "crown.fill")
                                            .foregroundStyle(AppTheme.warningYellow)
                                        Text("Pro Bonus: 50% extra XP & Gold!")
                                            .font(AppTheme.funFont(.caption, weight: .heavy))
                                            .foregroundStyle(AppTheme.warningYellow)
                                    }
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(AppTheme.warningYellow.opacity(0.12))
                                    .clipShape(Capsule())
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

                                if perfect && quizVM.xpBreakdown == nil {
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

                        if showMilestones && !milestones.isEmpty {
                            VStack(spacing: 10) {
                                ForEach(milestones, id: \.rawValue) { milestone in
                                    MilestoneBanner(milestone: milestone)
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
                        Button {
                            if passed {
                                withAnimation { showBonusPage = true }
                            } else {
                                onDismiss()
                            }
                        } label: {
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
        }
        .onAppear {
            animateScore = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.spring(duration: 0.5)) { showDepthMeter = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.spring(duration: 0.5)) { showRewards = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                withAnimation(.spring(duration: 0.6)) { showStreak = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation(.spring(duration: 0.5)) { showMilestones = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                showConfetti = true
            }
            if isBoss && passed {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.5)) { showMedal = true }
                }
            }
        }
    }

    private var resultTitle: String {
        if isBoss {
            if perfect { return "Flawless Victory!" }
            if quizVM.score >= 0.9 { return "Boss Cleared!" }
            if passed { return "Boss Defeated!" }
            if quizVM.score >= 0.6 { return "Almost Had It!" }
            return "Boss Wins... This Time"
        }
        if perfect { return "Perfect Score!" }
        if quizVM.score >= 0.9 { return "Excellent!" }
        if passed { return "Great Job!" }
        if quizVM.score >= 0.6 { return "Almost There!" }
        return "Keep Practicing!"
    }

    private var resultSubtitle: String {
        if isBoss {
            if passed {
                return "You've conquered this mastery challenge."
            }
            return "Score 80% or higher to defeat the boss."
        }
        if passed {
            if unlockState.totalDrugs > 0 && unlockState.masteryDepth10 > previousDepth {
                return "Your mastery depth increased!"
            }
            return "Great work on this section."
        }
        return "Score 80% or higher to level up."
    }

    private var bossRingColor: Color {
        if isBoss {
            return passed ? AppTheme.accentOrange : AppTheme.heartRed
        }
        return passed ? AppTheme.successGreen : AppTheme.heartRed
    }

    private var bossMedalIcon: String {
        if perfect { return "medal.fill" }
        if quizVM.score >= 0.9 { return "trophy.fill" }
        return "shield.checkered"
    }

    private var bossMedalColor: Color {
        if perfect { return Color(hex: "FFD700") }
        if quizVM.score >= 0.9 { return AppTheme.accentOrange }
        return AppTheme.warningYellow
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
