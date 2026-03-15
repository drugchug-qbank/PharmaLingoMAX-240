import SwiftUI

struct DailyMysteryChestSection: View {
    let gameVM: GameViewModel
    @State private var chestVM = DailyChestViewModel()
    @State private var isLoadingAd: Bool = false
    @State private var chestBounce: Bool = false
    @State private var glowPhase: Bool = false

    private var opensRemaining: Int {
        chestVM.remainingOpens(isPro: gameVM.isProUser)
    }

    private var canOpenFree: Bool {
        chestVM.canOpenFree(isPro: gameVM.isProUser)
    }

    private var canOpenWithAd: Bool {
        chestVM.canOpenWithAd(isPro: gameVM.isProUser)
    }

    private var canOpenPro: Bool {
        chestVM.canOpenPro(isPro: gameVM.isProUser, currentXP: gameVM.totalXP)
    }

    private var hasAnyOpenAvailable: Bool {
        canOpenFree || canOpenWithAd || canOpenPro
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 8) {
                Image(systemName: "shippingbox.fill")
                    .font(.title3)
                    .foregroundStyle(
                        LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                Text("Daily Mystery Chest")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
                Text("\(opensRemaining) left")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(opensRemaining > 0 ? AppTheme.accentOrange : Color(.tertiaryLabel)))
            }

            chestVisual

            openSlotsIndicator

            if gameVM.isProUser {
                proOpenSection
            } else {
                freeOpenSection
            }
        }
        .padding(16)
        .cardStyle(borderColor: (hasAnyOpenAvailable ? AppTheme.warningYellow : Color(.tertiarySystemFill)).opacity(hasAnyOpenAvailable ? 0.6 : 0.3))
        .overlay {
            if chestVM.showChestReveal, let reward = chestVM.chestReward {
                MysteryChestRevealView(
                    reward: reward,
                    wasApplied: chestVM.chestRewardApplied,
                    onDismiss: {
                        withAnimation(.spring(duration: 0.3)) {
                            chestVM.showChestReveal = false
                        }
                    }
                )
            }
        }
        .onAppear {
            chestVM.initializeSessionXP(gameVM.totalXP)
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                glowPhase = true
            }
        }
    }

    @ViewBuilder
    private var chestVisual: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(AppTheme.warningYellow.opacity(glowPhase ? 0.15 : 0.05))
                    .frame(width: 72, height: 72)

                Image(systemName: "shippingbox.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(
                        LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .top, endPoint: .bottom)
                    )
                    .symbolEffect(.bounce, value: chestBounce)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text("Open daily for free rewards!")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))

                Text("Win coins, power-ups, streak saves & more")
                    .font(AppTheme.funFont(.caption, weight: .medium))
                    .foregroundStyle(.secondary)

                HStack(spacing: 12) {
                    rewardPreviewTag(icon: "bitcoinsign.circle.fill", label: "Coins", color: AppTheme.accentOrange)
                    rewardPreviewTag(icon: "bolt.circle.fill", label: "2x XP", color: AppTheme.primaryBlue)
                    rewardPreviewTag(icon: "flame.circle.fill", label: "Saves", color: AppTheme.heartRed)
                }
            }
        }
    }

    @ViewBuilder
    private func rewardPreviewTag(icon: String, label: String, color: Color) -> some View {
        HStack(spacing: 3) {
            Image(systemName: icon)
                .font(.system(size: 10))
                .foregroundStyle(color)
            Text(label)
                .font(AppTheme.funFont(.caption2, weight: .bold))
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var openSlotsIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<4, id: \.self) { index in
                let isUsed = index < chestVM.opensUsedToday
                VStack(spacing: 4) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(isUsed ? AppTheme.successGreen.opacity(0.12) : Color(.tertiarySystemFill))
                            .frame(height: 36)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(isUsed ? AppTheme.successGreen.opacity(0.4) : Color(.quaternaryLabel), lineWidth: 1.5)
                            )

                        if isUsed {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.body)
                                .foregroundStyle(AppTheme.successGreen)
                        } else {
                            Image(systemName: index == 0 ? "gift.fill" : (gameVM.isProUser ? "star.fill" : "play.circle.fill"))
                                .font(.caption)
                                .foregroundStyle(index == 0 ? AppTheme.warningYellow : (gameVM.isProUser ? AppTheme.xpPurple : AppTheme.primaryBlue))
                        }
                    }

                    Text(index == 0 ? "Free" : (gameVM.isProUser ? "XP" : "Ad"))
                        .font(.system(size: 9, weight: .bold, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    @ViewBuilder
    private var freeOpenSection: some View {
        if chestVM.opensUsedToday == 0 {
            Button {
                chestBounce.toggle()
                chestVM.openChest(gameVM: gameVM)
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "sparkles")
                        .font(.subheadline)
                    Text("Open Free Chest")
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
            }
            .buttonStyle(.plain)
            .sensoryFeedback(.impact(weight: .medium), trigger: chestVM.showChestReveal)
        } else if chestVM.opensUsedToday < 4 {
            Button {
                isLoadingAd = true
                AdService.shared.showRewardedAd { rewarded in
                    isLoadingAd = false
                    if rewarded {
                        chestBounce.toggle()
                        chestVM.openChest(gameVM: gameVM)
                    }
                }
            } label: {
                HStack(spacing: 6) {
                    if isLoadingAd {
                        ProgressView().tint(.white)
                    } else {
                        Image(systemName: "play.circle.fill")
                            .font(.subheadline)
                        Text("Watch Ad to Open")
                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    }
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    LinearGradient(colors: [AppTheme.primaryBlue, AppTheme.funTeal], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
            }
            .buttonStyle(.plain)
            .disabled(isLoadingAd)
        } else {
            HStack(spacing: 6) {
                Image(systemName: "clock.fill")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("All chests opened today! Come back tomorrow.")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
        }
    }

    @ViewBuilder
    private var proOpenSection: some View {
        if chestVM.opensUsedToday == 0 {
            Button {
                chestBounce.toggle()
                chestVM.openChest(gameVM: gameVM)
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "sparkles")
                        .font(.subheadline)
                    Text("Open Free Chest")
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
            }
            .buttonStyle(.plain)
            .sensoryFeedback(.impact(weight: .medium), trigger: chestVM.showChestReveal)
        } else if chestVM.opensUsedToday < 4 {
            let xpGained = gameVM.totalXP - chestVM.xpAtSessionStart
            let xpNeeded = chestVM.xpNeededForNextOpen(opensUsed: chestVM.opensUsedToday)
            let hasEnoughXP = xpGained >= xpNeeded

            VStack(spacing: 10) {
                HStack(spacing: 6) {
                    Image(systemName: "bolt.fill")
                        .font(.caption)
                        .foregroundStyle(AppTheme.xpPurple)
                    Text("Earn \(xpNeeded) XP today to unlock next chest")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(.tertiarySystemFill))
                            .frame(height: 8)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(colors: [AppTheme.xpPurple.opacity(0.7), AppTheme.xpPurple], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: geo.size.width * min(Double(xpGained) / Double(max(xpNeeded, 1)), 1.0), height: 8)
                    }
                }
                .frame(height: 8)

                HStack {
                    Text("\(min(xpGained, xpNeeded))/\(xpNeeded) XP")
                        .font(AppTheme.funFont(.caption2, weight: .heavy))
                        .foregroundStyle(AppTheme.xpPurple)
                    Spacer()
                    if hasEnoughXP {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundStyle(AppTheme.successGreen)
                    }
                }

                if hasEnoughXP {
                    Button {
                        chestBounce.toggle()
                        chestVM.openChest(gameVM: gameVM)
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "crown.fill")
                                .font(.subheadline)
                            Text("Open Pro Chest")
                                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            LinearGradient(colors: [AppTheme.xpPurple, AppTheme.funPink], startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(.rect(cornerRadius: 14))
                    }
                    .buttonStyle(.plain)
                    .sensoryFeedback(.impact(weight: .medium), trigger: chestVM.showChestReveal)
                }
            }
        } else {
            HStack(spacing: 6) {
                Image(systemName: "clock.fill")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("All chests opened today! Come back tomorrow.")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
