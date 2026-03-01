import SwiftUI

struct ShopView: View {
    let gameVM: GameViewModel
    @State private var showPurchaseAlert: Bool = false
    @State private var purchaseMessage: String = ""
    @State private var bounceHearts: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: "bag.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                            Text("Shop")
                                .font(.largeTitle.bold())
                                .foregroundStyle(.white)
                        }
                        Text("Power up your learning!")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.vertical, 16)
                    .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))

                    VStack(spacing: 16) {
                        HStack(spacing: 0) {
                            ShopStatBadge(icon: "heart.fill", value: "\(gameVM.hearts)", label: "Hearts", color: AppTheme.heartRed)
                            ShopStatBadge(icon: "bitcoinsign.circle.fill", value: "\(gameVM.coins)", label: "Coins", color: AppTheme.accentOrange)
                            ShopStatBadge(icon: "bolt.fill", value: "\(gameVM.totalXP)", label: "XP", color: AppTheme.primaryBlue)
                        }
                        .padding(14)
                        .cardStyle()

                        HStack(spacing: 6) {
                            ForEach(0..<gameVM.maxHearts, id: \.self) { i in
                                Image(systemName: i < gameVM.hearts ? "heart.fill" : "heart")
                                    .font(.title2)
                                    .foregroundStyle(i < gameVM.hearts ? AppTheme.heartRed : Color(.tertiaryLabel))
                                    .symbolEffect(.bounce, value: bounceHearts)
                            }
                        }
                        .padding(.vertical, 8)

                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(AppTheme.heartRed)
                                Text("Hearts")
                                    .font(.title3.bold())
                            }

                            Text("Need more hearts? Buy them with coins or watch a short ad!")
                                .font(.subheadline)
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
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Image(systemName: "shield.checkered")
                                    .foregroundStyle(AppTheme.xpPurple)
                                Text("Power-Ups")
                                    .font(.title3.bold())
                            }

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
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .foregroundStyle(AppTheme.successGreen)
                                Text("Avatar Shop")
                                    .font(.title3.bold())
                            }
                            Text("Coming soon! Customize your avatar with new animals, eyes, and accessories.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            HStack(spacing: 16) {
                                AvatarShopPreview(icon: "hare.fill", label: "Animals", price: "500")
                                AvatarShopPreview(icon: "eyes", label: "Eyes", price: "200")
                                AvatarShopPreview(icon: "mouth.fill", label: "Mouths", price: "200")
                                AvatarShopPreview(icon: "crown.fill", label: "Hats", price: "300")
                            }
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
            .alert("Purchase Complete", isPresented: $showPurchaseAlert) {
                Button("OK") { }
            } message: {
                Text(purchaseMessage)
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
                .font(.headline.bold())
            Text(label)
                .font(.caption)
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
                        .font(.subheadline.weight(.semibold))
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                HStack(spacing: 4) {
                    if let priceIcon {
                        Image(systemName: priceIcon)
                            .font(.caption)
                    }
                    Text(price)
                        .font(.subheadline.bold())
                }
                .foregroundStyle(priceColor)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(priceColor.opacity(0.1))
                .clipShape(Capsule())
            }
            .padding(14)
            .background(Color(.tertiarySystemFill))
            .clipShape(.rect(cornerRadius: 12))
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
                .font(.caption2)
                .foregroundStyle(.secondary)
            HStack(spacing: 2) {
                Image(systemName: "bitcoinsign.circle.fill")
                    .font(.caption2)
                    .foregroundStyle(AppTheme.accentOrange)
                Text(price)
                    .font(.caption2.bold())
            }
        }
        .frame(maxWidth: .infinity)
    }
}
