import SwiftUI
import RevenueCat

struct ProPaywallView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var subscriptionService = SubscriptionService.shared
    @State private var isPurchasing: Bool = false
    @State private var showError: Bool = false
    @State private var showSuccess: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    headerSection

                    benefitsSection

                    packagesSection

                    restoreButton
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 40)
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .task {
                await subscriptionService.fetchOfferings()
            }
            .alert("Purchase Successful!", isPresented: $showSuccess) {
                Button("Continue") { dismiss() }
            } message: {
                Text("Welcome to PharmaLingo Pro! Enjoy unlimited hearts, reviews, bonus XP & more.")
            }
            .alert("Error", isPresented: $showError) {
                Button("OK") { }
            } message: {
                Text(subscriptionService.errorMessage ?? "Something went wrong.")
            }
        }
    }

    private var headerSection: some View {
        VStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [AppTheme.warningYellow, AppTheme.accentOrange],
                            startPoint: .topLeading, endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)

                Image(systemName: "crown.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(.white)
            }

            Text("PharmaLingo Pro")
                .font(AppTheme.funFont(.largeTitle, weight: .heavy))

            Text("Unlock your full potential")
                .font(AppTheme.funFont(.subheadline, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .padding(.top, 8)
    }

    private var benefitsSection: some View {
        VStack(spacing: 12) {
            BenefitRow(icon: "heart.fill", iconColor: AppTheme.heartRed, title: "Unlimited Hearts", subtitle: "Never stop learning")
            BenefitRow(icon: "arrow.clockwise.circle.fill", iconColor: AppTheme.primaryBlue, title: "Unlimited Reviews", subtitle: "Practice anytime, anywhere")
            BenefitRow(icon: "bolt.fill", iconColor: AppTheme.warningYellow, title: "50% Bonus XP & Gold", subtitle: "Level up faster")
            BenefitRow(icon: "sparkles", iconColor: AppTheme.xpPurple, title: "Pro Badge", subtitle: "Stand out on the leaderboard")
        }
        .padding(16)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(.rect(cornerRadius: 18))
    }

    @ViewBuilder
    private var packagesSection: some View {
        if subscriptionService.isLoading {
            ProgressView()
                .padding(40)
        } else if let offerings = subscriptionService.offerings,
                  let current = offerings.current {
            VStack(spacing: 12) {
                ForEach(current.availablePackages, id: \.identifier) { package in
                    PackageCard(
                        package: package,
                        isPurchasing: isPurchasing
                    ) {
                        await purchasePackage(package)
                    }
                }
            }
        } else {
            VStack(spacing: 12) {
                Image(systemName: "wifi.slash")
                    .font(.title)
                    .foregroundStyle(.secondary)
                Text("Unable to load subscription options")
                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                    .foregroundStyle(.secondary)
                Button("Retry") {
                    Task { await subscriptionService.fetchOfferings() }
                }
                .font(AppTheme.funFont(.subheadline, weight: .bold))
            }
            .padding(30)
        }
    }

    private var restoreButton: some View {
        Button {
            Task {
                isPurchasing = true
                let restored = await subscriptionService.restorePurchases()
                isPurchasing = false
                if restored {
                    showSuccess = true
                }
            }
        } label: {
            Text("Restore Purchases")
                .font(AppTheme.funFont(.footnote, weight: .semibold))
                .foregroundStyle(.secondary)
        }
        .disabled(isPurchasing)
    }

    private func purchasePackage(_ package: Package) async {
        isPurchasing = true
        let success = await subscriptionService.purchase(package: package)
        isPurchasing = false
        if success {
            showSuccess = true
        } else if subscriptionService.errorMessage != nil {
            showError = true
        }
    }
}

struct BenefitRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(iconColor)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                Text(subtitle)
                    .font(AppTheme.funFont(.caption, weight: .medium))
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(AppTheme.successGreen)
        }
    }
}

struct PackageCard: View {
    let package: Package
    let isPurchasing: Bool
    let action: () async -> Void

    var body: some View {
        Button {
            Task { await action() }
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(package.storeProduct.localizedTitle)
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white)

                    Text(package.storeProduct.localizedPriceString + " / " + periodLabel)
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.white.opacity(0.9))
                }

                Spacer()

                if isPurchasing {
                    ProgressView()
                        .tint(.white)
                } else {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
            .padding(18)
            .background(
                LinearGradient(
                    colors: [AppTheme.xpPurple, AppTheme.funPink],
                    startPoint: .leading, endPoint: .trailing
                )
            )
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: AppTheme.xpPurple.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(.plain)
        .disabled(isPurchasing)
    }

    private var periodLabel: String {
        switch package.packageType {
        case .monthly: return "month"
        case .annual: return "year"
        case .weekly: return "week"
        default: return "period"
        }
    }
}

struct OutOfHeartsView: View {
    let gameVM: GameViewModel
    let onWatchAd: () -> Void
    let onBuyHearts: () -> Void
    let onGetPro: () -> Void
    let onQuit: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            VStack(spacing: 8) {
                Image(systemName: "heart.slash.fill")
                    .font(.system(size: 56))
                    .foregroundStyle(AppTheme.heartRed)

                Text("Out of Hearts!")
                    .font(AppTheme.funFont(.title, weight: .heavy))

                Text("You've run out of hearts. Choose how to continue:")
                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 8)

            VStack(spacing: 12) {
                Button(action: onWatchAd) {
                    HStack(spacing: 12) {
                        Image(systemName: "play.circle.fill")
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Watch Ad for +1 Heart")
                                .font(AppTheme.funFont(.subheadline, weight: .bold))
                            Text("Continue your current quiz")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .opacity(0.8)
                        }
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .padding(16)
                    .background(AppTheme.successGreen)
                    .clipShape(.rect(cornerRadius: 14))
                }

                Button(action: onBuyHearts) {
                    HStack(spacing: 12) {
                        Image(systemName: "heart.circle.fill")
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Buy Full Hearts")
                                .font(AppTheme.funFont(.subheadline, weight: .bold))
                            Text("300 coins for all 5 hearts")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .opacity(0.8)
                        }
                        Spacer()
                        HStack(spacing: 4) {
                            Image(systemName: "bitcoinsign.circle.fill")
                                .font(.caption)
                            Text("300")
                                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                        }
                    }
                    .foregroundStyle(.white)
                    .padding(16)
                    .background(AppTheme.accentOrange)
                    .clipShape(.rect(cornerRadius: 14))
                    .opacity(gameVM.coins >= 300 ? 1.0 : 0.5)
                }
                .disabled(gameVM.coins < 300)

                Button(action: onGetPro) {
                    HStack(spacing: 12) {
                        Image(systemName: "crown.fill")
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Get PharmaLingo Pro")
                                .font(AppTheme.funFont(.subheadline, weight: .bold))
                            Text("Unlimited hearts + 50% bonus XP")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .opacity(0.8)
                        }
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .padding(16)
                    .background(
                        LinearGradient(
                            colors: [AppTheme.xpPurple, AppTheme.funPink],
                            startPoint: .leading, endPoint: .trailing
                        )
                    )
                    .clipShape(.rect(cornerRadius: 14))
                }
            }
            .padding(.horizontal, 4)

            Button(action: onQuit) {
                Text("Quit Practice")
                    .font(AppTheme.funFont(.subheadline, weight: .semibold))
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 12)
            }

            Spacer()
        }
        .padding(.horizontal, 24)
        .background(Color(.systemBackground))
    }
}

struct BonusRewardsView: View {
    let gameVM: GameViewModel
    let quizVM: QuizViewModel
    let onClaim: () -> Void
    let onSkip: () -> Void

    @State private var showRewards: Bool = false
    @State private var bonusType: BonusType = .coins
    @State private var bonusAmount: Int = 0

    private enum BonusType {
        case coins
        case doubleXP
        case streakSave
    }

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            VStack(spacing: 12) {
                Image(systemName: "star.circle.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(AppTheme.warningYellow)
                    .symbolEffect(.pulse, options: .repeating)

                Text("Mastery Increased!")
                    .font(AppTheme.funFont(.title, weight: .heavy))

                masteryProgressSection
            }

            if showRewards {
                VStack(spacing: 16) {
                    Text("Want bonus rewards?")
                        .font(AppTheme.funFont(.headline, weight: .bold))

                    Button(action: {
                        generateBonus()
                        onClaim()
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "play.circle.fill")
                                .font(.title3)
                            Text("Get Bonus Rewards")
                                .font(AppTheme.funFont(.headline, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [AppTheme.warningYellow, AppTheme.accentOrange],
                                startPoint: .leading, endPoint: .trailing
                            )
                        )
                        .clipShape(.rect(cornerRadius: 14))
                    }

                    Text("Watch a short ad for bonus gold, streak saves, or 2x XP")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)

                    Button(action: onSkip) {
                        Text("Skip")
                            .font(AppTheme.funFont(.subheadline, weight: .semibold))
                            .foregroundStyle(.secondary)
                    }
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }

            Spacer()
        }
        .padding(.horizontal, 24)
        .background(Color(.systemBackground))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation(.spring(duration: 0.5)) {
                    showRewards = true
                }
            }
        }
    }

    private var masteryProgressSection: some View {
        VStack(spacing: 10) {
            let stars = gameVM.starsFor(quizVM.subsectionId)
            HStack(spacing: 6) {
                ForEach(0..<5, id: \.self) { i in
                    Image(systemName: i < stars ? "star.fill" : "star")
                        .font(.title2)
                        .foregroundStyle(i < stars ? AppTheme.warningYellow : Color(.tertiaryLabel))
                }
            }

            Text("\(quizVM.subsectionTitle)")
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .foregroundStyle(.secondary)

            Text("Star \(stars) of 5")
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(AppTheme.warningYellow)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(AppTheme.warningYellow.opacity(0.12))
                .clipShape(Capsule())
        }
    }

    private func generateBonus() {
        let roll = Int.random(in: 1...100)
        if roll <= 10 && gameVM.streakSaves < 3 {
            gameVM.streakSaves += 1
            gameVM.save()
        } else if roll <= 35 {
            gameVM.earnCoins(25)
        } else {
            gameVM.earnCoins(15)
        }
    }
}
