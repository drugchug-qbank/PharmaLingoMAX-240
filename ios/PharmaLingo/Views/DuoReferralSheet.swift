import SwiftUI

struct DuoReferralSheet: View {
    let referralCode: String?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()

                Image(systemName: "person.2.circle.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(
                        LinearGradient(colors: [AppTheme.funTeal, AppTheme.primaryBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )

                Text("Invite a Classmate!")
                    .font(AppTheme.funFont(.title2, weight: .heavy))

                Text("Share your referral code with a friend. When they join and you start a Duo Streak together, you'll both earn bonus rewards!")
                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

                if let code = referralCode {
                    VStack(spacing: 8) {
                        Text("Your Code")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)

                        Text(code)
                            .font(AppTheme.funFont(.title, weight: .heavy))
                            .foregroundStyle(AppTheme.funTeal)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(AppTheme.funTeal.opacity(0.08))
                            .clipShape(.rect(cornerRadius: 14))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(AppTheme.funTeal.opacity(0.3), lineWidth: 2)
                            )
                    }

                    Button {
                        UIPasteboard.general.string = code
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "doc.on.doc.fill")
                            Text("Copy Code")
                        }
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(AppTheme.funTeal)
                        .clipShape(.rect(cornerRadius: 14))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 20)

                    Button {
                        let shareText = "Join me on PharmaLingo! Use my referral code: \(code) to get started and we can study together!"
                        let activityVC = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let rootVC = windowScene.windows.first?.rootViewController {
                            rootVC.present(activityVC, animated: true)
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share with Friends")
                        }
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                        .foregroundStyle(AppTheme.funTeal)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(AppTheme.funTeal.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 14))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 20)
                } else {
                    ProgressView()
                }

                VStack(spacing: 8) {
                    HStack(spacing: 6) {
                        Image(systemName: "gift.fill")
                            .foregroundStyle(AppTheme.warningYellow)
                        Text("Referral Rewards")
                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        rewardRow(icon: "person.badge.plus", text: "Friend joins: Study Buddy Starter Pack")
                        rewardRow(icon: "flame", text: "3-day Duo Streak: Bonus coins for both")
                        rewardRow(icon: "flame.fill", text: "7-day Duo Streak: Special Duo Badge")
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(AppTheme.warningYellow.opacity(0.06))
                .clipShape(.rect(cornerRadius: 14))
                .padding(.horizontal, 20)

                Spacer()
            }
            .navigationTitle("Invite Friends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    @ViewBuilder
    private func rewardRow(icon: String, text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundStyle(AppTheme.warningYellow)
                .frame(width: 20)
            Text(text)
                .font(AppTheme.funFont(.caption, weight: .medium))
                .foregroundStyle(.secondary)
        }
    }
}
