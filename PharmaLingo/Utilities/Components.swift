import SwiftUI

struct HeaderBar: View {
    let gameVM: GameViewModel

    private let motivationalTexts: [String] = [
        "Start a new lesson now!",
        "Let's keep up that streak!",
        "You're doing amazing!",
        "Time to level up!",
        "Keep the momentum going!",
        "Challenge yourself today!",
        "Every question counts!",
        "Stay sharp, stay focused!",
        "One more lesson closer!",
        "Knowledge is power!",
    ]

    private var randomMotivation: String {
        let dayIndex = Calendar.current.ordinality(of: .hour, in: .year, for: Date()) ?? 0
        return motivationalTexts[dayIndex % motivationalTexts.count]
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 14) {
                AvatarRendererView(
                    configuration: AvatarConfiguration(
                        animal: gameVM.avatarAnimal,
                        eyes: gameVM.avatarEyes,
                        mouth: gameVM.avatarMouth,
                        accessory: gameVM.avatarAccessory,
                        bodyHex: gameVM.avatarBodyColor,
                        bgHex: gameVM.avatarBgColor
                    ),
                    size: 110,
                    showIdleAnimation: true
                )

                VStack(alignment: .leading, spacing: 2) {
                    Text("PharmaLingo")
                        .font(AppTheme.funFont(.title, weight: .heavy))
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    Text(randomMotivation)
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.white.opacity(0.8))
                        .lineLimit(1)
                }

                Spacer()

                FlickeringStreakView(streak: gameVM.currentStreak)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(.white.opacity(0.18))
                    .clipShape(Capsule())
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            XPProgressBar(gameVM: gameVM)
        }
        .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))
    }
}

struct StatBadge: View {
    let iconName: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .font(AppTheme.funFont(.caption2, weight: .bold))
                .foregroundStyle(color)
            Text(value)
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(.white.opacity(0.18))
        .clipShape(Capsule())
    }
}

struct HeaderStatPill: View {
    let iconName: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.subheadline)
                .foregroundStyle(color)
            Text(value)
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(AppTheme.darkBlue)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .background(.white)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.08), radius: 3, x: 0, y: 1)
    }
}

struct XPProgressBar: View {
    let gameVM: GameViewModel

    var body: some View {
        HStack(spacing: 8) {
            Text("Lv.\(gameVM.level)")
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(AppTheme.warningYellow)
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .frame(height: 10)
                    Capsule()
                        .fill(
                            LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: max(geo.size.width * gameVM.xpProgress, 10), height: 10)
                }
            }
            .frame(height: 10)
            Text("\(gameVM.xpInCurrentLevel)/\(gameVM.xpForNextLevel) XP")
                .font(AppTheme.funFont(.caption2, weight: .bold))
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 10)
    }
}

struct StarRating: View {
    let stars: Int
    let maxStars: Int = 5

    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<maxStars, id: \.self) { index in
                Image(systemName: index < stars ? "star.fill" : "star")
                    .font(AppTheme.funFont(.caption2, weight: .bold))
                    .foregroundStyle(index < stars ? AppTheme.warningYellow : Color(.tertiaryLabel))
            }
        }
    }
}

struct ProgressRing: View {
    let progress: Double
    let size: CGFloat
    let lineWidth: CGFloat
    let color: Color

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.2), lineWidth: lineWidth)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
        .frame(width: size, height: size)
    }
}

struct CoinDisplay: View {
    let amount: Int

    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: "bitcoinsign.circle.fill")
                .foregroundStyle(AppTheme.accentOrange)
            Text("\(amount)")
                .font(AppTheme.funFont(.subheadline, weight: .bold))
        }
    }
}

struct FunSectionHeader: View {
    let icon: String
    let title: String
    let color: Color

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(AppTheme.funFont(.title3, weight: .bold))
                .foregroundStyle(color)
            Text(title)
                .font(AppTheme.funFont(.title3, weight: .bold))
        }
    }
}

struct FunPageHeader: View {
    let title: String
    let subtitle: String
    let icon: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 8) {
                if let icon {
                    Image(systemName: icon)
                        .font(AppTheme.funFont(.title2, weight: .bold))
                        .foregroundStyle(.white)
                }
                Text(title)
                    .font(AppTheme.funFont(.largeTitle, weight: .heavy))
                    .foregroundStyle(.white)
            }
            Text(subtitle)
                .font(AppTheme.funFont(.subheadline, weight: .medium))
                .foregroundStyle(.white.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))
    }
}
