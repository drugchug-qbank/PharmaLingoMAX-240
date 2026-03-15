import SwiftUI

struct DailyMysteryChestSection: View {
    let gameVM: GameViewModel
    @State private var chestVM = DailyChestViewModel()
    @State private var isLoadingAd: Bool = false
    @State private var chestBounce: Bool = false
    @State private var glowPhase: Bool = false
    @State private var showChestPopup: Bool = false
    @State private var pendingReward: MysteryChestReward?
    @State private var pendingApplied: Bool = false

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

    private var allOpened: Bool {
        chestVM.opensUsedToday >= 4
    }

    private enum OpenMode {
        case free
        case ad
        case xpLocked
        case xpReady
        case done
    }

    private var currentMode: OpenMode {
        if allOpened { return .done }
        if canOpenFree { return .free }
        if gameVM.isProUser {
            return canOpenPro ? .xpReady : .xpLocked
        }
        return .ad
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

            if gameVM.isProUser && currentMode == .xpLocked {
                proXPProgress
            }

            dynamicOpenButton
        }
        .padding(16)
        .cardStyle(borderColor: (hasAnyOpenAvailable ? AppTheme.warningYellow : Color(.tertiarySystemFill)).opacity(hasAnyOpenAvailable ? 0.6 : 0.3))
        .fullScreenCover(isPresented: $showChestPopup) {
            if let reward = pendingReward {
                MysteryChestPopupView(
                    reward: reward,
                    wasApplied: pendingApplied,
                    onDismiss: {
                        showChestPopup = false
                    }
                )
                .background(ClearBackgroundView())
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
    private var proXPProgress: some View {
        let xpGained = gameVM.totalXP - chestVM.xpAtSessionStart
        let xpNeeded = chestVM.xpNeededForNextOpen(opensUsed: chestVM.opensUsedToday)

        VStack(spacing: 8) {
            HStack(spacing: 6) {
                Image(systemName: "bolt.fill")
                    .font(.caption)
                    .foregroundStyle(AppTheme.xpPurple)
                Text("Earn \(xpNeeded) XP to unlock next chest")
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
            }
        }
    }

    @ViewBuilder
    private var dynamicOpenButton: some View {
        switch currentMode {
        case .free:
            Button {
                chestBounce.toggle()
                openAndShowPopup()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "sparkles")
                        .font(.subheadline)
                    Text("Open Free Chest")
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
                .background(
                    LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
                .shadow(color: AppTheme.warningYellow.opacity(0.3), radius: 8, y: 3)
            }
            .buttonStyle(.plain)

        case .ad:
            Button {
                isLoadingAd = true
                AdService.shared.showRewardedAd { rewarded in
                    isLoadingAd = false
                    if rewarded {
                        chestBounce.toggle()
                        openAndShowPopup()
                    }
                }
            } label: {
                HStack(spacing: 8) {
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
                .padding(.vertical, 13)
                .background(
                    LinearGradient(colors: [AppTheme.primaryBlue, AppTheme.funTeal], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
                .shadow(color: AppTheme.primaryBlue.opacity(0.3), radius: 8, y: 3)
            }
            .buttonStyle(.plain)
            .disabled(isLoadingAd)

        case .xpLocked:
            HStack(spacing: 8) {
                Image(systemName: "lock.fill")
                    .font(.subheadline)
                Text("Earn XP to Unlock")
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
            }
            .foregroundStyle(.white.opacity(0.6))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 13)
            .background(Color(.quaternarySystemFill))
            .clipShape(.rect(cornerRadius: 14))

        case .xpReady:
            Button {
                chestBounce.toggle()
                openAndShowPopup()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "crown.fill")
                        .font(.subheadline)
                    Text("Open Pro Chest")
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
                .background(
                    LinearGradient(colors: [AppTheme.xpPurple, AppTheme.funPink], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
                .shadow(color: AppTheme.xpPurple.opacity(0.3), radius: 8, y: 3)
            }
            .buttonStyle(.plain)

        case .done:
            HStack(spacing: 6) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.caption)
                    .foregroundStyle(AppTheme.successGreen)
                Text("All chests opened today! Come back tomorrow.")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
        }
    }

    private func openAndShowPopup() {
        let reward = MysteryChestReward.roll()
        let applied = gameVM.applyMysteryChestReward(reward)
        pendingReward = MysteryChestReward(type: reward.type, amount: reward.amount, wasApplied: applied)
        pendingApplied = applied
        chestVM.opensUsedToday += 1
        chestVM.saveStatePublic()
        gameVM.syncToCloud()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            showChestPopup = true
        }
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = InnerView()
        DispatchQueue.main.async {
            if let window = view.window {
                window.rootViewController?.view.backgroundColor = .clear
            }
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            superview?.superview?.backgroundColor = .clear
        }
    }
}
