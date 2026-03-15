import SwiftUI

struct MysteryChestRevealView: View {
    let reward: MysteryChestReward
    let wasApplied: Bool
    let onDismiss: () -> Void

    @State private var phase: Int = 0
    @State private var shimmerOffset: CGFloat = -200
    @State private var particleOpacity: Double = 0

    private var rarityColor: Color {
        switch reward.type.rarity {
        case .common: AppTheme.successGreen
        case .uncommon: AppTheme.primaryBlue
        case .rare: AppTheme.xpPurple
        case .epic: AppTheme.warningYellow
        }
    }

    private var rarityGlow: Color {
        switch reward.type.rarity {
        case .common: AppTheme.successGreen
        case .uncommon: AppTheme.primaryBlue
        case .rare: AppTheme.xpPurple
        case .epic: AppTheme.warningYellow
        }
    }

    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {}

            VStack(spacing: 0) {
                Spacer()

                if phase >= 1 {
                    VStack(spacing: 20) {
                        ZStack {
                            Circle()
                                .fill(rarityGlow.opacity(0.15))
                                .frame(width: 160, height: 160)
                                .blur(radius: 30)

                            Circle()
                                .fill(rarityGlow.opacity(0.08))
                                .frame(width: 220, height: 220)
                                .blur(radius: 40)

                            if phase >= 2 {
                                rewardIconView
                                    .transition(.scale.combined(with: .opacity))
                            }
                        }
                        .frame(height: 180)

                        if phase >= 2 {
                            VStack(spacing: 8) {
                                Text(reward.type.rarity.label)
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                                    .foregroundStyle(rarityColor)
                                    .textCase(.uppercase)
                                    .tracking(2)

                                Text(rewardDisplayText)
                                    .font(AppTheme.funFont(.title2, weight: .heavy))
                                    .multilineTextAlignment(.center)

                                if !wasApplied {
                                    Text("Inventory full — reward not added")
                                        .font(AppTheme.funFont(.caption, weight: .bold))
                                        .foregroundStyle(AppTheme.heartRed)
                                        .padding(.top, 4)
                                } else {
                                    Text("Added to your inventory!")
                                        .font(AppTheme.funFont(.caption, weight: .bold))
                                        .foregroundStyle(AppTheme.successGreen)
                                        .padding(.top, 4)
                                }
                            }
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                        }

                        if phase >= 3 {
                            Button {
                                onDismiss()
                            } label: {
                                Text("Awesome!")
                                    .font(AppTheme.funFont(.headline, weight: .heavy))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(
                                        LinearGradient(colors: [rarityColor, rarityColor.opacity(0.8)], startPoint: .leading, endPoint: .trailing)
                                    )
                                    .clipShape(.rect(cornerRadius: 16))
                            }
                            .buttonStyle(.plain)
                            .padding(.horizontal, 40)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                    .padding(30)
                    .transition(.scale(scale: 0.8).combined(with: .opacity))
                } else {
                    chestAnimationView
                        .transition(.scale.combined(with: .opacity))
                }

                Spacer()
            }
        }
        .onAppear {
            startRevealSequence()
        }
    }

    @ViewBuilder
    private var chestAnimationView: some View {
        VStack(spacing: 16) {
            ZStack {
                Image(systemName: "shippingbox.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .top, endPoint: .bottom)
                    )
                    .symbolEffect(.bounce, options: .repeating.speed(0.5))

                Image(systemName: "sparkles")
                    .font(.system(size: 30))
                    .foregroundStyle(AppTheme.warningYellow)
                    .offset(x: 35, y: -30)
                    .opacity(particleOpacity)

                Image(systemName: "sparkle")
                    .font(.system(size: 20))
                    .foregroundStyle(AppTheme.accentOrange)
                    .offset(x: -30, y: -25)
                    .opacity(particleOpacity)
            }

            Text("Opening Mystery Chest...")
                .font(AppTheme.funFont(.headline, weight: .heavy))
                .foregroundStyle(.white)
        }
    }

    @ViewBuilder
    private var rewardIconView: some View {
        Group {
            if reward.type.usesCustomImage, let imageName = reward.type.customImageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
            } else {
                Image(systemName: reward.type.iconName)
                    .font(.system(size: 60))
                    .foregroundStyle(
                        LinearGradient(colors: [rarityColor, rarityColor.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
            }
        }
        .shadow(color: rarityGlow.opacity(0.6), radius: 20)
    }

    private var rewardDisplayText: String {
        switch reward.type {
        case .coins: "+\(reward.amount) Coins"
        case .maxHearts: "Full Hearts Refill"
        case .doubleXP: "2x XP Boost"
        case .powerUpFiftyFifty: "50/50 Power-Up"
        case .powerUpShieldHeart: "Shield Heart"
        case .powerUpPharmaVision: "Pharma Vision"
        case .streakSave: "Streak Save"
        }
    }

    private func startRevealSequence() {
        withAnimation(.easeIn(duration: 0.3)) {
            particleOpacity = 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
                phase = 1
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            withAnimation(.spring(duration: 0.6, bounce: 0.4)) {
                phase = 2
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            withAnimation(.spring(duration: 0.4)) {
                phase = 3
            }
        }
    }
}
