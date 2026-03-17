import SwiftUI

struct XPBreakdownCard: View {
    let breakdown: XPRewardBreakdown

    var body: some View {
        VStack(spacing: 8) {
            VStack(spacing: 6) {
                breakdownRow("Base XP", value: "+\(breakdown.baseXP)", color: .primary)

                if breakdown.perfectBonusXP > 0 {
                    breakdownRow("Perfect Bonus", value: "+\(breakdown.perfectBonusXP)", color: AppTheme.warningYellow, icon: "sparkles")
                }

                if breakdown.firstCompletionBonusXP > 0 {
                    breakdownRow("First Clear Bonus", value: "+\(breakdown.firstCompletionBonusXP)", color: AppTheme.successGreen, icon: "star.fill")
                }

                if breakdown.repeatPenaltyApplied {
                    breakdownRow("Repeat Penalty", value: "-50%", color: AppTheme.heartRed, icon: "arrow.down.circle.fill")
                }
            }
            .padding(12)
            .background(Color(.tertiarySystemFill))
            .clipShape(.rect(cornerRadius: 12))

            if breakdown.repeatPenaltyApplied {
                Text("Daily repeat limit reached for this content. XP is reduced by 50% after 5 full runs today.")
                    .font(AppTheme.funFont(.caption2, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
    }

    private func breakdownRow(_ label: String, value: String, color: Color, icon: String? = nil) -> some View {
        HStack(spacing: 6) {
            if let icon {
                Image(systemName: icon)
                    .font(.caption2)
                    .foregroundStyle(color)
            }
            Text(label)
                .font(AppTheme.funFont(.caption, weight: .semibold))
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(color)
        }
    }
}
