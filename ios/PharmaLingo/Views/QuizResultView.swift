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
    @State private var showConfetti: Bool = false
    @State private var showMedal: Bool = false
    @State private var showMilestones: Bool = false
    @State private var showBonusSection: Bool = false
    @State private var isLoadingAd: Bool = false
    @State private var bonusAwarded: Bool = false
    @State private var bonusMessage: String = ""

    private var passed: Bool { quizVM.score >= 0.8 }
    private var perfect: Bool { quizVM.score == 1.0 }
    private var isBoss: Bool { quizVM.isMasteryQuiz }

    private var xpValue: Int {
        quizVM.xpBreakdown?.finalAwardedXP ?? quizVM.xpEarned
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 16)

                    ZStack {
                        Circle()
                            .fill(bossRingColor.opacity(0.1))
                            .frame(width: 130, height: 130)

                        ProgressRing(
                            progress: animateScore ? quizVM.score : 0,
                            size: 120,
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
                                .offset(x: 44, y: -44)
                                .transition(.scale.combined(with: .opacity))
                        }
                    }

                    VStack(spacing: 6) {
                        Text(resultTitle)
                            .font(AppTheme.funFont(.title2, weight: .heavy))

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
                        HStack(spacing: 16) {
                            RewardItem(icon: "bolt.fill", value: "+\(xpValue)", label: "XP", color: AppTheme.primaryBlue)
                            RewardItem(icon: "bitcoinsign.circle.fill", value: "+\(quizVM.coinsEarned)", label: "Coins", color: AppTheme.accentOrange)
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    if showMilestones && !milestones.isEmpty {
                        VStack(spacing: 8) {
                            ForEach(milestones, id: \.rawValue) { milestone in
                                MilestoneBanner(milestone: milestone)
                            }
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    if showBonusSection && passed {
                        bonusRewardsSection
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    Spacer().frame(height: 90)
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
                    bottomButton
                        .padding(20)
                }
                .background(Color(.systemBackground))
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
                withAnimation(.spring(duration: 0.5)) { showMilestones = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation(.spring(duration: 0.5)) { showBonusSection = true }
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

    @ViewBuilder
    private var bonusRewardsSection: some View {
        if bonusAwarded {
            VStack(spacing: 12) {
                Image(systemName: "gift.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(AppTheme.accentOrange)

                Text(bonusMessage)
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.primary)
            }
            .padding(.vertical, 8)
        } else {
            VStack(spacing: 14) {
                Text("Want bonus rewards?")
                    .font(AppTheme.funFont(.headline, weight: .bold))

                if gameVM.isProUser {
                    Button {
                        generateBonus()
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "gift.fill")
                                .font(.title3)
                            Text("Claim Bonus Rewards")
                                .font(AppTheme.funFont(.headline, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            LinearGradient(
                                colors: [AppTheme.warningYellow, AppTheme.accentOrange],
                                startPoint: .leading, endPoint: .trailing
                            )
                        )
                        .clipShape(.rect(cornerRadius: 14))
                    }

                    Text("Pro members get free bonus rewards!")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(AppTheme.warningYellow)
                } else {
                    Button {
                        isLoadingAd = true
                        AdService.shared.showRewardedAd { rewarded in
                            isLoadingAd = false
                            if rewarded {
                                generateBonus()
                            }
                        }
                    } label: {
                        HStack(spacing: 10) {
                            if isLoadingAd {
                                ProgressView()
                                    .tint(.white)
                            } else {
                                Image(systemName: "play.circle.fill")
                                    .font(.title3)
                            }
                            Text("Get Bonus Rewards")
                                .font(AppTheme.funFont(.headline, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            LinearGradient(
                                colors: [AppTheme.warningYellow, AppTheme.accentOrange],
                                startPoint: .leading, endPoint: .trailing
                            )
                        )
                        .clipShape(.rect(cornerRadius: 14))
                    }
                    .disabled(isLoadingAd)

                    Text("Watch a short ad for bonus gold, streak saves, or power-ups")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }

    @ViewBuilder
    private var bottomButton: some View {
        if bonusAwarded || !passed || (showBonusSection && passed) {
            if bonusAwarded {
                Button {
                    onDismiss()
                } label: {
                    Text("Continue")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(AppTheme.successGreen)
                        .clipShape(.rect(cornerRadius: 14))
                }
            } else if !passed {
                Button {
                    onDismiss()
                } label: {
                    Text("Try Again")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(AppTheme.primaryBlue)
                        .clipShape(.rect(cornerRadius: 14))
                }
            } else {
                Button {
                    onDismiss()
                } label: {
                    Text("Skip")
                        .font(AppTheme.funFont(.subheadline, weight: .semibold))
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
            }
        }
    }

    private func generateBonus() {
        if let powerUpType = PowerUpRewardGenerator.rollForPowerUp() {
            let result = gameVM.awardPowerUpFromReward(powerUpType)
            switch result {
            case .added:
                bonusMessage = "You earned a \(powerUpType.displayName) power-up!"
            case .convertedToGold(let amount):
                bonusMessage = "\(powerUpType.displayName) full - converted to \(amount) coins!"
            case .suggestEnhancement(let type):
                bonusMessage = "\(type.displayName) is full! Upgrade capacity in the Shop."
            case .suggestPro:
                bonusMessage = "Power-up inventory full! Go Pro for +1 capacity."
            case .lost:
                bonusMessage = "\(powerUpType.displayName) inventory full."
            }
        } else {
            let roll = Int.random(in: 1...100)
            if roll <= 15 && gameVM.streakSaves < 3 {
                gameVM.streakSaves += 1
                gameVM.save()
                bonusMessage = "You earned a Streak Save!"
            } else if roll <= 50 {
                gameVM.earnCoins(25)
                bonusMessage = "You earned 25 bonus coins!"
            } else {
                gameVM.earnCoins(15)
                bonusMessage = "You earned 15 bonus coins!"
            }
        }
        withAnimation(.spring(duration: 0.5)) {
            bonusAwarded = true
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
