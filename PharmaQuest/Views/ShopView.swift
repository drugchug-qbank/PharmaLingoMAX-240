import SwiftUI

struct ShopView: View {
    let gameVM: GameViewModel
    @State private var showPurchaseAlert: Bool = false
    @State private var purchaseMessage: String = ""
    @State private var bounceHearts: Bool = false
    @State private var showAvatarShop: Bool = false

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

                        VStack(spacing: 6) {
                            HStack(spacing: 6) {
                                ForEach(0..<gameVM.maxHearts, id: \.self) { i in
                                    Image(systemName: i < gameVM.hearts ? "heart.fill" : "heart")
                                        .font(.title2)
                                        .foregroundStyle(i < gameVM.hearts ? AppTheme.heartRed : Color(.tertiaryLabel))
                                        .symbolEffect(.bounce, value: bounceHearts)
                                }
                            }

                            if gameVM.hearts < gameVM.maxHearts {
                                HeartRegenTimer(gameVM: gameVM)
                            } else {
                                Text("Hearts Full!")
                                    .font(AppTheme.funFont(.caption, weight: .bold))
                                    .foregroundStyle(AppTheme.successGreen)
                            }
                        }
                        .padding(.vertical, 8)

                        VStack(alignment: .leading, spacing: 14) {
                            FunSectionHeader(icon: "heart.fill", title: "Hearts", color: AppTheme.heartRed)

                            Text("Need more hearts? Buy them with coins or watch a short ad!")
                                .font(AppTheme.funFont(.subheadline, weight: .medium))
                                .foregroundStyle(.secondary)

                            ShopItemRow(
                                icon: "heart.fill",
                                iconColor: AppTheme.heartRed,
                                title: "+1 Heart",
                                subtitle: "Get one extra heart",
                                price: "30",
                                priceIcon: "bitcoinsign.circle.fill",
                                priceColor: AppTheme.accentOrange,
                                isEnabled: gameVM.coins >= 30 && gameVM.hearts < gameVM.maxHearts
                            ) {
                                if gameVM.spendCoins(30) {
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
                                price: "100",
                                priceIcon: "bitcoinsign.circle.fill",
                                priceColor: AppTheme.accentOrange,
                                isEnabled: gameVM.coins >= 100 && gameVM.hearts < gameVM.maxHearts
                            ) {
                                if gameVM.spendCoins(100) {
                                    gameVM.refillHearts()
                                    bounceHearts.toggle()
                                    purchaseMessage = "Hearts fully restored!"
                                    showPurchaseAlert = true
                                }
                            }

                            ShopItemRow(
                                icon: "play.circle.fill",
                                iconColor: AppTheme.successGreen,
                                title: "Watch Ad",
                                subtitle: "Watch a short ad for +1 heart",
                                price: "FREE",
                                priceIcon: nil,
                                priceColor: AppTheme.successGreen,
                                isEnabled: gameVM.hearts < gameVM.maxHearts
                            ) {
                                gameVM.addHeart()
                                bounceHearts.toggle()
                                purchaseMessage = "You earned +1 heart!"
                                showPurchaseAlert = true
                            }
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.heartRed.opacity(0.5))

                        VStack(alignment: .leading, spacing: 14) {
                            FunSectionHeader(icon: "shield.checkered", title: "Power-Ups", color: AppTheme.xpPurple)

                            ShopItemRow(
                                icon: "flame.fill",
                                iconColor: AppTheme.accentOrange,
                                title: "Streak Save",
                                subtitle: "Protects your streak if you miss a day",
                                price: "200",
                                priceIcon: "bitcoinsign.circle.fill",
                                priceColor: AppTheme.accentOrange,
                                isEnabled: gameVM.coins >= 200
                            ) {
                                if gameVM.spendCoins(200) {
                                    gameVM.streakSaves += 1
                                    gameVM.save()
                                    purchaseMessage = "Streak Save purchased! You have \(gameVM.streakSaves) save(s)."
                                    showPurchaseAlert = true
                                }
                            }

                            ShopItemRow(
                                icon: "2x.circle.fill",
                                iconColor: AppTheme.primaryBlue,
                                title: "Double XP (1 Hour)",
                                subtitle: "Earn double XP for the next hour",
                                price: "150",
                                priceIcon: "bitcoinsign.circle.fill",
                                priceColor: AppTheme.accentOrange,
                                isEnabled: gameVM.coins >= 150
                            ) {
                                if gameVM.spendCoins(150) {
                                    purchaseMessage = "Double XP activated for 1 hour!"
                                    showPurchaseAlert = true
                                }
                            }
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.5))

                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                FunSectionHeader(icon: "person.crop.circle.fill", title: "Avatar Shop", color: AppTheme.successGreen)
                                Spacer()
                                Button {
                                    showAvatarShop = true
                                } label: {
                                    Text("Open")
                                        .font(AppTheme.funFont(.caption, weight: .heavy))
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 6)
                                        .background(AppTheme.successGreen)
                                        .clipShape(Capsule())
                                }
                            }

                            Text("Customize your avatar with new animals, eyes, and accessories!")
                                .font(AppTheme.funFont(.subheadline, weight: .medium))
                                .foregroundStyle(.secondary)

                            HStack(spacing: 16) {
                                AvatarShopPreview(icon: "hare.fill", label: "Animals", price: "300+")
                                AvatarShopPreview(icon: "eyes", label: "Eyes", price: "150+")
                                AvatarShopPreview(icon: "mouth.fill", label: "Mouths", price: "150+")
                                AvatarShopPreview(icon: "crown.fill", label: "Hats", price: "200+")
                            }
                        }
                        .padding(16)
                        .cardStyle()
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

struct AvatarShopPreview: View {
    let icon: String
    let label: String
    let price: String

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .fill(Color(.tertiarySystemFill))
                    .frame(width: 50, height: 50)
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            Text(label)
                .font(AppTheme.funFont(.caption2, weight: .bold))
                .foregroundStyle(.secondary)
            HStack(spacing: 2) {
                Image(systemName: "bitcoinsign.circle.fill")
                    .font(.caption2)
                    .foregroundStyle(AppTheme.accentOrange)
                Text(price)
                    .font(AppTheme.funFont(.caption2, weight: .heavy))
            }
        }
        .frame(maxWidth: .infinity)
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
                if gameVM.hearts >= gameVM.maxHearts {
                    timer?.invalidate()
                }
            }
        } else {
            timeRemaining = 3600
        }
    }
}
