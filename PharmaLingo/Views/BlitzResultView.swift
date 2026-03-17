import SwiftUI

struct BlitzResultView: View {
    let summary: BlitzRunSummary
    let gameVM: GameViewModel
    var xpBreakdown: XPRewardBreakdown? = nil
    let onDismiss: () -> Void

    @State private var animateScore: Bool = false
    @State private var showStats: Bool = false
    @State private var showRewards: Bool = false
    @State private var showConfetti: Bool = false
    @State private var pulseCombo: Bool = false

    private var passed: Bool { summary.accuracy >= 0.5 }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 24) {
                    Spacer().frame(height: 16)

                    blitzBadge

                    scoreRing

                    titleSection

                    if showStats {
                        statsGrid
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    if showRewards {
                        rewardsSection
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    if showStats {
                        timeBreakdown
                            .transition(.opacity)
                    }

                    Spacer().frame(height: 100)
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)

            if showConfetti && summary.isPerfect {
                ConfettiView()
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }

            VStack {
                Spacer()
                VStack(spacing: 0) {
                    Divider()
                    Button {
                        onDismiss()
                    } label: {
                        Text("Done")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(
                                    colors: [AppTheme.xpPurple, AppTheme.funPink],
                                    startPoint: .leading, endPoint: .trailing
                                )
                            )
                            .clipShape(.rect(cornerRadius: 14))
                    }
                    .padding(20)
                }
                .background(Color(.systemBackground))
            }
        }
        .background(Color(.systemBackground))
        .onAppear {
            animateScore = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.spring(duration: 0.5)) { showStats = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.spring(duration: 0.5)) { showRewards = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                showConfetti = true
            }
        }
    }

    private var blitzBadge: some View {
        HStack(spacing: 8) {
            Image(systemName: "bolt.fill")
                .font(.system(size: 14, weight: .black))
            Text("BRAND BLITZ")
                .font(.system(size: 14, weight: .black, design: .rounded))
            Image(systemName: "bolt.fill")
                .font(.system(size: 14, weight: .black))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .background(
            Capsule().fill(
                LinearGradient(
                    colors: [AppTheme.xpPurple, AppTheme.funPink],
                    startPoint: .leading, endPoint: .trailing
                )
            )
        )
    }

    private var scoreRing: some View {
        ZStack {
            Circle()
                .fill(ringColor.opacity(0.1))
                .frame(width: 150, height: 150)

            ProgressRing(
                progress: animateScore ? summary.accuracy : 0,
                size: 140,
                lineWidth: 12,
                color: ringColor
            )
            .animation(.spring(duration: 1.0).delay(0.3), value: animateScore)

            VStack(spacing: 2) {
                Text("\(Int(summary.accuracy * 100))%")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundStyle(ringColor)
                Text("\(summary.correctCount)/\(summary.totalCount)")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var ringColor: Color {
        if summary.isPerfect { return AppTheme.warningYellow }
        if summary.accuracy >= 0.8 { return AppTheme.xpPurple }
        if summary.accuracy >= 0.6 { return AppTheme.funPink }
        return AppTheme.heartRed
    }

    private var titleSection: some View {
        VStack(spacing: 8) {
            Text(resultTitle)
                .font(AppTheme.funFont(.title, weight: .heavy))

            Text(resultSubtitle)
                .font(AppTheme.funFont(.subheadline, weight: .medium))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }

    private var resultTitle: String {
        if summary.isPerfect { return "Flawless Blitz!" }
        if summary.accuracy >= 0.9 { return "Lightning Fast!" }
        if summary.accuracy >= 0.8 { return "Speed Demon!" }
        if summary.accuracy >= 0.6 { return "Not Bad!" }
        return "Keep Practicing!"
    }

    private var resultSubtitle: String {
        if summary.isPerfect { return "Perfect accuracy at blitz speed. Legendary." }
        if summary.bestCombo >= 10 { return "That \(summary.bestCombo)x combo was insane!" }
        if summary.accuracy >= 0.8 { return "Fast and accurate. Impressive." }
        return "Speed comes with practice. Try again!"
    }

    private var statsGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            blitzStat(
                icon: "timer",
                value: formatTime(summary.totalTime),
                label: "Total Time",
                color: AppTheme.primaryBlue
            )
            blitzStat(
                icon: "bolt.fill",
                value: "\(summary.bestCombo)x",
                label: "Best Combo",
                color: AppTheme.accentOrange
            )
            blitzStat(
                icon: "gauge.with.needle.fill",
                value: formatTime(summary.averageTime),
                label: "Avg / Question",
                color: AppTheme.funTeal
            )
            blitzStat(
                icon: "flame.fill",
                value: "+\(summary.speedBonusXP)",
                label: "Speed Bonus XP",
                color: AppTheme.funPink
            )
        }
    }

    private func blitzStat(icon: String, value: String, label: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            Text(value)
                .font(.system(size: 22, weight: .heavy, design: .rounded))
                .foregroundStyle(color)
            Text(label)
                .font(AppTheme.funFont(.caption, weight: .bold))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(color.opacity(0.08))
        .clipShape(.rect(cornerRadius: 14))
    }

    private var rewardsSection: some View {
        VStack(spacing: 14) {
            if let breakdown = xpBreakdown {
                HStack(spacing: 24) {
                    RewardItem(
                        icon: "bolt.fill",
                        value: "+\(breakdown.finalAwardedXP)",
                        label: "Total XP",
                        color: AppTheme.xpPurple
                    )
                    RewardItem(
                        icon: "bitcoinsign.circle.fill",
                        value: "+\(summary.totalCoins)",
                        label: "Coins",
                        color: AppTheme.accentOrange
                    )
                }

                XPBreakdownCard(breakdown: breakdown)
            } else {
                HStack(spacing: 24) {
                    RewardItem(
                        icon: "bolt.fill",
                        value: "+\(summary.totalXP)",
                        label: "Total XP",
                        color: AppTheme.xpPurple
                    )
                    RewardItem(
                        icon: "bitcoinsign.circle.fill",
                        value: "+\(summary.totalCoins)",
                        label: "Coins",
                        color: AppTheme.accentOrange
                    )
                }
            }

            if summary.comboBonus > 0 {
                bonusPill(
                    icon: "flame.fill",
                    text: "Combo Bonus: +\(summary.comboBonus) XP",
                    color: AppTheme.accentOrange
                )
            }

            if summary.speedBonusXP > 0 {
                bonusPill(
                    icon: "hare.fill",
                    text: "Speed Bonus: +\(summary.speedBonusXP) XP",
                    color: AppTheme.funTeal
                )
            }

            if summary.isPerfect && xpBreakdown == nil {
                bonusPill(
                    icon: "sparkles",
                    text: "PERFECT BLITZ BONUS!",
                    color: AppTheme.warningYellow
                )
            }

            if gameVM.isProUser {
                bonusPill(
                    icon: "crown.fill",
                    text: "Pro Bonus: 50% extra XP & Gold!",
                    color: AppTheme.warningYellow
                )
            }
        }
    }

    private func bonusPill(icon: String, text: String, color: Color) -> some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .foregroundStyle(color)
            Text(text)
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(color)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(color.opacity(0.12))
        .clipShape(Capsule())
    }

    private var timeBreakdown: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 6) {
                Image(systemName: "chart.bar.fill")
                    .foregroundStyle(AppTheme.xpPurple)
                Text("Question Breakdown")
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
            }

            ForEach(summary.questionResults, id: \.questionIndex) { result in
                HStack(spacing: 10) {
                    Image(systemName: result.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.caption)
                        .foregroundStyle(result.isCorrect ? AppTheme.successGreen : AppTheme.heartRed)

                    Text("Q\(result.questionIndex + 1)")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .frame(width: 28, alignment: .leading)

                    GeometryReader { geo in
                        let maxTime: Double = 8.0
                        let ratio = min(result.timeSpent / maxTime, 1.0)
                        let barColor = result.timeSpent <= 3 ? AppTheme.successGreen :
                            result.timeSpent <= 5 ? AppTheme.warningYellow : AppTheme.heartRed

                        Capsule()
                            .fill(Color(.systemFill))
                            .frame(height: 8)
                            .overlay(alignment: .leading) {
                                Capsule()
                                    .fill(barColor)
                                    .frame(width: max(geo.size.width * ratio, 6), height: 8)
                            }
                    }
                    .frame(height: 8)

                    Text(formatTime(result.timeSpent))
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .foregroundStyle(.secondary)
                        .frame(width: 40, alignment: .trailing)

                    if result.comboAtTime > 1 {
                        Text("\(result.comboAtTime)x")
                            .font(.system(size: 10, weight: .black, design: .rounded))
                            .foregroundStyle(AppTheme.accentOrange)
                            .frame(width: 28, alignment: .trailing)
                    } else {
                        Spacer().frame(width: 28)
                    }
                }
            }
        }
        .padding(16)
        .background(Color(.tertiarySystemFill))
        .clipShape(.rect(cornerRadius: 14))
    }

    private func formatTime(_ time: TimeInterval) -> String {
        if time >= 60 {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return "\(minutes):\(String(format: "%02d", seconds))"
        }
        return String(format: "%.1fs", time)
    }
}
