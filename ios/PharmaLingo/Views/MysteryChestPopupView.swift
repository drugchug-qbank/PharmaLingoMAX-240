import SwiftUI

struct MysteryChestPopupView: View {
    let reward: MysteryChestReward
    let wasApplied: Bool
    let onDismiss: () -> Void

    @State private var phase: ChestPhase = .vibrating
    @State private var vibrateOffset: CGFloat = 0
    @State private var chestScale: CGFloat = 1.0
    @State private var glowOpacity: Double = 0
    @State private var sparkleScale: CGFloat = 0
    @State private var rewardScale: CGFloat = 0
    @State private var rewardOffset: CGFloat = 60
    @State private var textOpacity: Double = 0
    @State private var buttonOpacity: Double = 0
    @State private var burstParticles: [BurstParticle] = []
    @State private var shimmerPhase: Bool = false
    @State private var backgroundOpacity: Double = 0

    private enum ChestPhase {
        case vibrating
        case opening
        case revealed
    }

    private var rarityColor: Color {
        switch reward.type.rarity {
        case .common: AppTheme.successGreen
        case .uncommon: AppTheme.primaryBlue
        case .rare: AppTheme.xpPurple
        case .epic: AppTheme.warningYellow
        }
    }

    var body: some View {
        ZStack {
            Color.black.opacity(backgroundOpacity)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                ZStack {
                    ForEach(burstParticles) { particle in
                        Circle()
                            .fill(particle.color)
                            .frame(width: particle.size, height: particle.size)
                            .offset(x: particle.currentX, y: particle.currentY)
                            .opacity(particle.opacity)
                    }

                    switch phase {
                    case .vibrating:
                        vibratingChestView
                    case .opening:
                        openingChestView
                    case .revealed:
                        revealedContentView
                    }
                }
                .frame(height: 340)

                Spacer()
            }
        }
        .onAppear {
            startSequence()
        }
    }

    private var vibratingChestView: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [AppTheme.warningYellow.opacity(0.2), .clear],
                            center: .center, startRadius: 20, endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)
                    .opacity(glowOpacity)

                Image(systemName: "shippingbox.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [AppTheme.warningYellow, AppTheme.accentOrange, Color(hex: "8B5E3C")],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .scaleEffect(chestScale)
                    .offset(x: vibrateOffset)
                    .shadow(color: AppTheme.warningYellow.opacity(0.4), radius: 12)

                Image(systemName: "sparkle")
                    .font(.system(size: 18))
                    .foregroundStyle(AppTheme.warningYellow)
                    .offset(x: -40, y: -35)
                    .scaleEffect(sparkleScale)
                    .opacity(Double(sparkleScale))

                Image(systemName: "sparkle")
                    .font(.system(size: 12))
                    .foregroundStyle(AppTheme.accentOrange)
                    .offset(x: 42, y: -28)
                    .scaleEffect(sparkleScale)
                    .opacity(Double(sparkleScale))

                Image(systemName: "sparkle")
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .offset(x: 30, y: -42)
                    .scaleEffect(sparkleScale)
                    .opacity(Double(sparkleScale))
            }

            Text("Opening...")
                .font(AppTheme.funFont(.title3, weight: .heavy))
                .foregroundStyle(.white)
        }
    }

    private var openingChestView: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [rarityColor.opacity(0.4), rarityColor.opacity(0.1), .clear],
                        center: .center, startRadius: 10, endRadius: 150
                    )
                )
                .frame(width: 300, height: 300)
                .blur(radius: 20)

            Image(systemName: "shippingbox.fill")
                .font(.system(size: 90))
                .foregroundStyle(
                    LinearGradient(
                        colors: [AppTheme.warningYellow, AppTheme.accentOrange],
                        startPoint: .top, endPoint: .bottom
                    )
                )
                .scaleEffect(1.15)
                .opacity(0.4)
        }
    }

    private var revealedContentView: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [rarityColor.opacity(0.3), rarityColor.opacity(0.05), .clear],
                            center: .center, startRadius: 20, endRadius: 120
                        )
                    )
                    .frame(width: 240, height: 240)

                if shimmerPhase {
                    Circle()
                        .fill(rarityColor.opacity(0.1))
                        .frame(width: 180, height: 180)
                        .blur(radius: 30)
                }

                rewardIconView
                    .scaleEffect(rewardScale)
                    .offset(y: rewardOffset)
            }
            .frame(height: 180)

            VStack(spacing: 10) {
                Text(reward.type.rarity.label.uppercased())
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(rarityColor)
                    .tracking(3)
                    .opacity(textOpacity)

                Text(rewardDisplayText)
                    .font(AppTheme.funFont(.title2, weight: .heavy))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .opacity(textOpacity)

                Group {
                    if wasApplied {
                        Label("Added to your inventory!", systemImage: "checkmark.circle.fill")
                            .foregroundStyle(AppTheme.successGreen)
                    } else {
                        Label("Inventory full — reward not added", systemImage: "xmark.circle.fill")
                            .foregroundStyle(AppTheme.heartRed)
                    }
                }
                .font(AppTheme.funFont(.caption, weight: .bold))
                .opacity(textOpacity)
            }

            Button(action: onDismiss) {
                Text("Awesome!")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                    .foregroundStyle(.white)
                    .frame(maxWidth: 260)
                    .padding(.vertical, 14)
                    .background(
                        LinearGradient(
                            colors: [rarityColor, rarityColor.opacity(0.7)],
                            startPoint: .leading, endPoint: .trailing
                        )
                    )
                    .clipShape(.rect(cornerRadius: 16))
                    .shadow(color: rarityColor.opacity(0.4), radius: 10, y: 4)
            }
            .buttonStyle(.plain)
            .opacity(buttonOpacity)
            .scaleEffect(buttonOpacity)
            .sensoryFeedback(.success, trigger: buttonOpacity)
        }
    }

    @ViewBuilder
    private var rewardIconView: some View {
        if reward.type.usesCustomImage, let imageName = reward.type.customImageName {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .shadow(color: rarityColor.opacity(0.6), radius: 20)
        } else {
            Image(systemName: reward.type.iconName)
                .font(.system(size: 70))
                .foregroundStyle(
                    LinearGradient(
                        colors: [rarityColor, rarityColor.opacity(0.6)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .shadow(color: rarityColor.opacity(0.6), radius: 20)
        }
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

    private func startSequence() {
        withAnimation(.easeIn(duration: 0.4)) {
            backgroundOpacity = 0.7
        }

        startVibration()

        withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
            glowOpacity = 1
        }
        withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true).delay(0.2)) {
            sparkleScale = 1.2
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            withAnimation(.spring(duration: 0.3, bounce: 0.5)) {
                chestScale = 1.3
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.easeOut(duration: 0.3)) {
                    phase = .opening
                }
                spawnBurstParticles()

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    phase = .revealed
                    withAnimation(.spring(duration: 0.6, bounce: 0.4)) {
                        rewardScale = 1
                        rewardOffset = 0
                    }
                    withAnimation(.easeOut(duration: 0.5).delay(0.3)) {
                        textOpacity = 1
                    }
                    withAnimation(.spring(duration: 0.5).delay(0.6)) {
                        buttonOpacity = 1
                    }
                    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.5)) {
                        shimmerPhase = true
                    }
                }
            }
        }
    }

    private func startVibration() {
        func vibrate(count: Int, intensity: CGFloat) {
            guard count > 0 else { return }
            let duration = max(0.04, 0.08 - Double(16 - count) * 0.002)
            withAnimation(.linear(duration: duration)) {
                vibrateOffset = CGFloat.random(in: -intensity...intensity)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                vibrate(count: count - 1, intensity: min(intensity + 0.3, 8))
            }
        }
        vibrate(count: 20, intensity: 2)
    }

    private func spawnBurstParticles() {
        let colors: [Color] = [rarityColor, AppTheme.warningYellow, AppTheme.accentOrange, .white]
        var particles: [BurstParticle] = []
        for i in 0..<16 {
            let angle = Double(i) / 16.0 * .pi * 2
            let distance: CGFloat = CGFloat.random(in: 80...160)
            particles.append(BurstParticle(
                id: i,
                color: colors[i % colors.count],
                size: CGFloat.random(in: 4...10),
                targetX: cos(angle) * distance,
                targetY: sin(angle) * distance
            ))
        }
        burstParticles = particles

        withAnimation(.easeOut(duration: 0.6)) {
            for i in burstParticles.indices {
                burstParticles[i].currentX = burstParticles[i].targetX
                burstParticles[i].currentY = burstParticles[i].targetY
            }
        }

        withAnimation(.easeIn(duration: 0.4).delay(0.4)) {
            for i in burstParticles.indices {
                burstParticles[i].opacity = 0
            }
        }
    }
}

private struct BurstParticle: Identifiable {
    let id: Int
    let color: Color
    let size: CGFloat
    let targetX: CGFloat
    let targetY: CGFloat
    var currentX: CGFloat = 0
    var currentY: CGFloat = 0
    var opacity: Double = 1
}
