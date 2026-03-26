import SwiftUI

struct ShopView: View {
    let gameVM: GameViewModel
    @State private var showPurchaseAlert: Bool = false
    @State private var purchaseMessage: String = ""
    @State private var bounceHearts: Bool = false
    @State private var showAvatarShop: Bool = false
    @State private var showPaywall: Bool = false
    @State private var isLoadingAd: Bool = false
    @State private var proGlowPhase: Bool = false
    @State private var proShake: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                FunPageHeader(title: "Shop", subtitle: "Power up your learning!", icon: "bag.fill")

                ScrollView {
                    VStack(spacing: 16) {
                        HStack(spacing: 0) {
                            ShopStatBadge(icon: "heart.fill", value: "\(gameVM.hearts)", label: "Hearts", color: AppTheme.heartRed)
                            ShopStatBadge(icon: "bitcoinsign.circle.fill", value: "\(gameVM.coins)", label: "Coins", color: AppTheme.accentOrange)
                            ShopStatBadge(icon: "bolt.fill", value: "\(gameVM.totalXP)", label: "XP", color: AppTheme.primaryBlue)
                        }
                        .padding(14)
                        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.5))

                        VStack(spacing: 8) {
                            HStack(spacing: 10) {
                                ForEach(0..<gameVM.maxHearts, id: \.self) { i in
                                    Image(systemName: i < gameVM.hearts ? "heart.fill" : "heart")
                                        .font(.system(size: 30))
                                        .foregroundStyle(i < gameVM.hearts ? AppTheme.heartRed : Color(.tertiaryLabel))
                                        .symbolEffect(.bounce, value: bounceHearts)
                                }
                            }

                            if gameVM.hearts < gameVM.maxHearts {
                                HeartRegenTimer(gameVM: gameVM)
                            } else {
                                Text("Hearts Full!")
                                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                                    .foregroundStyle(AppTheme.successGreen)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .cardStyle(borderColor: AppTheme.heartRed.opacity(0.4))

                        if !gameVM.isProUser {
                            Button { showPaywall = true } label: {
                                HStack(spacing: 14) {
                                    ZStack {
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    colors: [AppTheme.warningYellow, AppTheme.accentOrange],
                                                    startPoint: .topLeading, endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 44, height: 44)
                                        Image(systemName: "crown.fill")
                                            .font(.title3)
                                            .foregroundStyle(.white)
                                    }

                                    VStack(alignment: .leading, spacing: 3) {
                                        Text("PharmaLingo Pro")
                                            .font(AppTheme.funFont(.headline, weight: .heavy))
                                            .foregroundStyle(.white)
                                        Text("Unlimited hearts, 50% bonus XP & more")
                                            .font(AppTheme.funFont(.caption, weight: .medium))
                                            .foregroundStyle(.white.opacity(0.85))
                                    }

                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .font(.subheadline)
                                        .foregroundStyle(.white.opacity(0.7))
                                }
                                .padding(16)
                                .background(
                                    LinearGradient(
                                        colors: [AppTheme.xpPurple, AppTheme.funPink],
                                        startPoint: .leading, endPoint: .trailing
                                    )
                                )
                                .clipShape(.rect(cornerRadius: 18))
                                .shadow(color: proGlowPhase ? AppTheme.xpPurple.opacity(0.6) : AppTheme.xpPurple.opacity(0.2), radius: proGlowPhase ? 14 : 6, x: 0, y: 4)
                                .offset(x: proShake ? -3 : 0)
                            }
                            .buttonStyle(.plain)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                    proGlowPhase = true
                                }
                                startShakeTimer()
                            }
                        } else {
                            HStack(spacing: 12) {
                                Image(systemName: "crown.fill")
                                    .font(.title2)
                                    .foregroundStyle(AppTheme.warningYellow)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("PharmaLingo Pro Active")
                                        .font(AppTheme.funFont(.headline, weight: .heavy))
                                    Text("Unlimited hearts, 50% bonus XP & +1 power-up capacity")
                                        .font(AppTheme.funFont(.caption, weight: .medium))
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Image(systemName: "checkmark.seal.fill")
                                    .font(.title2)
                                    .foregroundStyle(AppTheme.successGreen)
                            }
                            .padding(16)
                            .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.5))
                        }

                        Button {
                            showAvatarShop = true
                        } label: {
                            HStack(spacing: 14) {
                                AvatarDisplayView(
                                    animal: gameVM.avatarAnimal,
                                    eyes: gameVM.avatarEyes,
                                    mouth: gameVM.avatarMouth,
                                    accessory: gameVM.avatarAccessory,
                                    bodyColor: gameVM.avatarBodyColor,
                                    backgroundColor: gameVM.avatarBgColor,
                                    size: 52
                                )

                                VStack(alignment: .leading, spacing: 3) {
                                    Text("Avatar Shop")
                                        .font(AppTheme.funFont(.headline, weight: .heavy))
                                        .foregroundStyle(.primary)
                                    Text("Customize your look with animals, eyes & accessories")
                                        .font(AppTheme.funFont(.caption, weight: .medium))
                                        .foregroundStyle(.secondary)
                                        .lineLimit(1)
                                }

                                Spacer()

                                Image(systemName: "chevron.right.circle.fill")
                                    .font(.title3)
                                    .foregroundStyle(AppTheme.successGreen.opacity(0.7))
                            }
                            .padding(16)
                            .cardStyle(borderColor: AppTheme.successGreen.opacity(0.4))
                        }
                        .buttonStyle(.plain)

                        DailyMysteryChestSection(gameVM: gameVM)

                        VStack(alignment: .leading, spacing: 14) {
                            FunSectionHeader(icon: "heart.fill", title: "Hearts", color: AppTheme.heartRed)

                            if gameVM.isProUser {
                                HStack(spacing: 8) {
                                    Image(systemName: "infinity")
                                        .font(.title2)
                                        .foregroundStyle(AppTheme.heartRed)
                                    Text("Unlimited hearts with Pro!")
                                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                                        .foregroundStyle(AppTheme.heartRed)
                                }
                                .padding(14)
                                .frame(maxWidth: .infinity)
                                .background(AppTheme.heartRed.opacity(0.08))
                                .clipShape(.rect(cornerRadius: 14))
                            } else {
                                Text("Need more hearts? Buy them with coins or watch a short ad!")
                                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                                    .foregroundStyle(.secondary)

                                ShopItemRow(
                                    icon: "heart.fill",
                                    iconColor: AppTheme.heartRed,
                                    title: "+1 Heart",
                                    subtitle: "Get one extra heart",
                                    price: "300",
                                    priceIcon: "bitcoinsign.circle.fill",
                                    priceColor: AppTheme.accentOrange,
                                    isEnabled: gameVM.coins >= 300 && gameVM.hearts < gameVM.maxHearts
                                ) {
                                    if gameVM.spendCoins(300) {
                                        gameVM.addHeart()
                                        bounceHearts.toggle()
                                        purchaseMessage = "You got +1 heart!"
                                        showPurchaseAlert = true
                                    }
                                }

                                ShopItemRow(
                                    icon: "heart.circle.fill",
                                    iconColor: AppTheme.heartRed,
                                    title: "Full Refill",
                                    subtitle: "Restore all 5 hearts",
                                    price: "1200",
                                    priceIcon: "bitcoinsign.circle.fill",
                                    priceColor: AppTheme.accentOrange,
                                    isEnabled: gameVM.coins >= 1200 && gameVM.hearts < gameVM.maxHearts
                                ) {
                                    if gameVM.spendCoins(1200) {
                                        gameVM.refillHearts()
                                        bounceHearts.toggle()
                                        purchaseMessage = "Hearts fully restored!"
                                        showPurchaseAlert = true
                                    }
                                }

                                ShopItemRow(
                                    icon: "play.circle.fill",
                                    iconColor: AppTheme.successGreen,
                                    title: isLoadingAd ? "Loading Ad..." : "Watch Ad",
                                    subtitle: "Watch a short ad for +1 heart",
                                    price: "FREE",
                                    priceIcon: nil,
                                    priceColor: AppTheme.successGreen,
                                    isEnabled: gameVM.hearts < gameVM.maxHearts && !isLoadingAd
                                ) {
                                    isLoadingAd = true
                                    AdService.shared.showRewardedAd { rewarded in
                                        isLoadingAd = false
                                        if rewarded {
                                            gameVM.addHeart()
                                            bounceHearts.toggle()
                                            purchaseMessage = "You earned +1 heart!"
                                            showPurchaseAlert = true
                                        } else {
                                            purchaseMessage = "Ad not available right now. Please try again later."
                                            showPurchaseAlert = true
                                        }
                                    }
                                }
                            }
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.heartRed.opacity(0.5))

                        VStack(alignment: .leading, spacing: 14) {
                            FunSectionHeader(icon: "shield.checkered", title: "Boosts", color: AppTheme.xpPurple)

                            ShopItemRow(
                                icon: "flame.fill",
                                iconColor: AppTheme.accentOrange,
                                title: "Streak Save",
                                subtitle: "Protects your streak if you miss a day",
                                price: "1000",
                                priceIcon: "bitcoinsign.circle.fill",
                                priceColor: AppTheme.accentOrange,
                                isEnabled: gameVM.coins >= 1000
                            ) {
                                if gameVM.spendCoins(1000) {
                                    gameVM.streakSaves += 1
                                    gameVM.save()
                                    purchaseMessage = "Streak Save purchased! You have \(gameVM.streakSaves) save(s)."
                                    showPurchaseAlert = true
                                }
                            }

                            ShopItemRow(
                                icon: "2x.circle.fill",
                                iconColor: AppTheme.primaryBlue,
                                title: gameVM.hasActiveDoubleXP ? "Double XP Ready!" : "Double XP (Next Quiz)",
                                subtitle: gameVM.hasActiveDoubleXP ? "Active — your next quiz will earn double XP" : "Double your XP on your next quiz attempt",
                                price: "500",
                                priceIcon: "bitcoinsign.circle.fill",
                                priceColor: AppTheme.accentOrange,
                                isEnabled: gameVM.coins >= 500 && !gameVM.hasActiveDoubleXP
                            ) {
                                if gameVM.spendCoins(500) {
                                    gameVM.activateDoubleXP()
                                    gameVM.syncToCloud()
                                    purchaseMessage = "Double XP activated! Your next quiz will earn double XP."
                                    showPurchaseAlert = true
                                }
                            }
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.5))

                        PowerUpShopSection(
                            gameVM: gameVM,
                            onPurchase: { message in
                                purchaseMessage = message
                                showPurchaseAlert = true
                            }
                        )

                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
                .scrollIndicators(.hidden)
            }
            .background(Color(.systemGroupedBackground))
            .alert("Purchase Complete", isPresented: $showPurchaseAlert) {
                Button("OK") { }
            } message: {
                Text(purchaseMessage)
            }
            .sheet(isPresented: $showAvatarShop) {
                AvatarCustomizationView(gameVM: gameVM)
            }
            .sheet(isPresented: $showPaywall) {
                ProPaywallView()
            }
            .onChange(of: showPaywall) { _, newValue in
                if !newValue {
                    Task { await gameVM.refreshProStatus() }
                }
            }
        }
    }

    private func startShakeTimer() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            Task { @MainActor in
                withAnimation(.default) { proShake = true }
                try? await Task.sleep(for: .milliseconds(80))
                withAnimation(.default) { proShake = false }
                try? await Task.sleep(for: .milliseconds(80))
                withAnimation(.default) { proShake = true }
                try? await Task.sleep(for: .milliseconds(80))
                withAnimation(.default) { proShake = false }
            }
        }
    }
}

struct ShopStatBadge: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            Text(value)
                .font(AppTheme.funFont(.headline, weight: .heavy))
            Text(label)
                .font(AppTheme.funFont(.caption, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ShopItemRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let subtitle: String
    let price: String
    let priceIcon: String?
    let priceColor: Color
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(iconColor)
                    .frame(width: 36)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                    Text(subtitle)
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                }

                Spacer()

                HStack(spacing: 4) {
                    if let priceIcon {
                        Image(systemName: priceIcon)
                            .font(.caption)
                    }
                    Text(price)
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                }
                .foregroundStyle(priceColor)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(priceColor.opacity(0.12))
                .clipShape(Capsule())
            }
            .padding(14)
            .background(Color(.tertiarySystemFill))
            .clipShape(.rect(cornerRadius: 14))
            .opacity(isEnabled ? 1 : 0.5)
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
    }
}


struct HeartRegenTimer: View {
    let gameVM: GameViewModel
    @State private var timeRemaining: TimeInterval = 0
    @State private var timer: Timer?

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "clock.fill")
                .font(.caption2)
                .foregroundStyle(AppTheme.heartRed)
            Text("Next heart in \(formattedTime)")
                .font(AppTheme.funFont(.caption, weight: .semibold))
                .foregroundStyle(.secondary)
        }
        .onAppear { startTimer() }
        .onDisappear { timer?.invalidate() }
    }

    private var formattedTime: String {
        let totalSeconds = max(Int(timeRemaining), 0)
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private func startTimer() {
        updateRemaining()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Task { @MainActor in
                updateRemaining()
            }
        }
    }

    private func updateRemaining() {
        if let nextRegen = gameVM.nextHeartRegenDate {
            timeRemaining = nextRegen.timeIntervalSinceNow
            if timeRemaining <= 0 {
                gameVM.addHeart()
                if gameVM.hearts < gameVM.maxHearts {
                    if let updated = gameVM.nextHeartRegenDate {
                        timeRemaining = updated.timeIntervalSinceNow
                    }
                } else {
                    timer?.invalidate()
                }
            }
        } else {
            if gameVM.hearts < gameVM.maxHearts {
                gameVM.lastHeartLossDate = Date()
                gameVM.save()
                timeRemaining = 3600
            } else {
                timer?.invalidate()
            }
        }
    }
}
