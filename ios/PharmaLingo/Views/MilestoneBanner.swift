import SwiftUI

struct MilestoneBanner: View {
    let milestone: MilestoneType

    @State private var appeared: Bool = false

    private var bannerColor: Color {
        switch milestone {
        case .dosingUnlocked: AppTheme.primaryBlue
        case .harderUnlocked: AppTheme.accentOrange
        case .caseChallengeReady: AppTheme.xpPurple
        }
    }

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: milestone.bannerIcon)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(bannerColor)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text("NEW UNLOCK")
                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                    .foregroundStyle(bannerColor)
                Text(milestone.bannerTitle)
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
            }

            Spacer()

            Image(systemName: "lock.open.fill")
                .font(.caption)
                .foregroundStyle(bannerColor)
        }
        .padding(12)
        .background(bannerColor.opacity(0.1))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(bannerColor.opacity(0.3), lineWidth: 1.5)
        )
        .clipShape(.rect(cornerRadius: 12))
        .scaleEffect(appeared ? 1.0 : 0.8)
        .opacity(appeared ? 1.0 : 0.0)
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                appeared = true
            }
        }
        .sensoryFeedback(.success, trigger: appeared)
    }
}
