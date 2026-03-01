import SwiftUI

struct HeaderBar: View {
    let gameVM: GameViewModel

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 2) {
                Text("PharmaLingo")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                Text("Top 300 Drugs")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
            }

            Spacer()

            HStack(spacing: 12) {
                StatBadge(iconName: "flame.fill", value: "\(gameVM.currentStreak)", color: AppTheme.accentOrange)
                StatBadge(iconName: "heart.fill", value: "\(gameVM.hearts)", color: AppTheme.heartRed)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
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
                .font(.caption.bold())
                .foregroundStyle(color)
            Text(value)
                .font(.subheadline.bold())
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(.white.opacity(0.15))
        .clipShape(Capsule())
    }
}

struct XPProgressBar: View {
    let gameVM: GameViewModel

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Lv.\(gameVM.level)")
                    .font(.caption.bold())
                    .foregroundStyle(.white)
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(.white.opacity(0.2))
                            .frame(height: 8)
                        Capsule()
                            .fill(AppTheme.warningYellow)
                            .frame(width: max(geo.size.width * gameVM.xpProgress, 8), height: 8)
                    }
                }
                .frame(height: 8)
                Text("\(gameVM.xpInCurrentLevel)/\(gameVM.xpForNextLevel) XP")
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.8))
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
        .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))
    }
}

struct StarRating: View {
    let stars: Int
    let maxStars: Int = 5

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<maxStars, id: \.self) { index in
                Image(systemName: index < stars ? "star.fill" : "star")
                    .font(.caption2)
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
        HStack(spacing: 2) {
            Image(systemName: "bitcoinsign.circle.fill")
                .foregroundStyle(AppTheme.accentOrange)
            Text("\(amount)")
                .font(.subheadline.bold())
        }
    }
}
