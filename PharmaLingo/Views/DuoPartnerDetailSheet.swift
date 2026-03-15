import SwiftUI

struct DuoPartnerDetailSheet: View {
    let partner: DuoPartnerInfo
    let weeklyQuests: [DuoWeeklyQuest]
    let gameVM: GameViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var streakPulse: Bool = false

    private var partnerSinceText: String {
        guard let createdAt = partner.createdAt else { return "Recently" }
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
        if let date = formatter.date(from: String(createdAt.prefix(10))) {
            let display = DateFormatter()
            display.dateStyle = .medium
            return display.string(from: date)
        }
        return "Recently"
    }

    private var daysTogether: Int {
        guard let createdAt = partner.createdAt else { return 0 }
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
        guard let date = formatter.date(from: String(createdAt.prefix(10))) else { return 0 }
        return max(Calendar.current.dateComponents([.day], from: date, to: Date()).day ?? 0, 1)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(spacing: 16) {
                        HStack(spacing: 20) {
                            VStack(spacing: 4) {
                                AvatarDisplayView(
                                    animal: gameVM.avatarAnimal,
                                    eyes: gameVM.avatarEyes,
                                    mouth: gameVM.avatarMouth,
                                    accessory: gameVM.avatarAccessory,
                                    bodyColor: gameVM.avatarBodyColor,
                                    backgroundColor: gameVM.avatarBgColor,
                                    size: 64
                                )
                                Text("You")
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                                    .foregroundStyle(AppTheme.primaryBlue)
                            }

                            VStack(spacing: 4) {
                                ZStack {
                                    Circle()
                                        .fill(AppTheme.funTeal.opacity(0.15))
                                        .frame(width: 52, height: 52)
                                        .scaleEffect(streakPulse ? 1.15 : 1.0)
                                        .opacity(streakPulse ? 0.0 : 0.6)
                                    Image(systemName: "link.circle.fill")
                                        .font(.system(size: 32))
                                        .foregroundStyle(AppTheme.funTeal)
                                }
                                Text("\(partner.sharedStreak)")
                                    .font(AppTheme.funFont(.title, weight: .heavy))
                                    .foregroundStyle(AppTheme.funTeal)
                                Text("duo streak")
                                    .font(AppTheme.funFont(.caption2, weight: .bold))
                                    .foregroundStyle(.secondary)
                            }

                            VStack(spacing: 4) {
                                AvatarDisplayView(
                                    animal: partner.partnerAvatar.animal,
                                    eyes: partner.partnerAvatar.eyes,
                                    mouth: partner.partnerAvatar.mouth,
                                    accessory: partner.partnerAvatar.accessory,
                                    bodyColor: partner.partnerAvatar.bodyColor,
                                    backgroundColor: partner.partnerAvatar.bgColor,
                                    size: 64
                                )
                                Text(partner.partnerName)
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                                    .foregroundStyle(AppTheme.funTeal)
                            }
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            colors: [AppTheme.funTeal.opacity(0.08), AppTheme.primaryBlue.opacity(0.05)],
                            startPoint: .topLeading, endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(.rect(cornerRadius: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(AppTheme.funTeal.opacity(0.3), lineWidth: 2)
                    )

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        DuoStatTile(icon: "calendar.badge.clock", label: "Partners Since", value: partnerSinceText, color: AppTheme.primaryBlue)
                        DuoStatTile(icon: "clock.fill", label: "Days Together", value: "\(daysTogether)", color: AppTheme.funTeal)
                        DuoStatTile(icon: "flame.fill", label: "Partner Streak", value: "\(partner.partnerStreak) days", color: AppTheme.accentOrange)
                        DuoStatTile(icon: "star.fill", label: "Partner Level", value: "Lv.\(partner.partnerLevel)", color: AppTheme.warningYellow)
                        DuoStatTile(icon: "bolt.fill", label: "Partner Weekly XP", value: "\(partner.partnerWeeklyXP)", color: AppTheme.xpPurple)
                        DuoStatTile(icon: "checkmark.seal.fill", label: "Quests Done", value: "\(weeklyQuests.filter(\.isComplete).count)/\(weeklyQuests.count)", color: AppTheme.successGreen)
                    }

                    if !weeklyQuests.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 6) {
                                Image(systemName: "target")
                                    .foregroundStyle(AppTheme.funTeal)
                                Text("Weekly Duo Quests")
                                    .font(AppTheme.funFont(.headline, weight: .heavy))
                            }

                            ForEach(weeklyQuests, id: \.id) { quest in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack(spacing: 8) {
                                        Image(systemName: quest.questIcon)
                                            .font(.caption)
                                            .foregroundStyle(quest.isComplete ? AppTheme.successGreen : AppTheme.funTeal)
                                        Text(quest.questDisplayTitle)
                                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                                            .lineLimit(2)
                                        Spacer()
                                        if quest.isComplete {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(AppTheme.successGreen)
                                        }
                                    }

                                    GeometryReader { geo in
                                        ZStack(alignment: .leading) {
                                            Capsule()
                                                .fill(AppTheme.funTeal.opacity(0.15))
                                                .frame(height: 8)
                                            Capsule()
                                                .fill(quest.isComplete ? AppTheme.successGreen : AppTheme.funTeal)
                                                .frame(width: max(geo.size.width * quest.progressFraction, 8), height: 8)
                                        }
                                    }
                                    .frame(height: 8)

                                    HStack {
                                        Text("\(quest.combinedProgress)/\(quest.targetValue)")
                                            .font(AppTheme.funFont(.caption, weight: .bold))
                                            .foregroundStyle(.secondary)
                                        Spacer()
                                        HStack(spacing: 3) {
                                            Image(systemName: "gift.fill")
                                                .font(.caption2)
                                                .foregroundStyle(AppTheme.accentOrange)
                                            Text("+\(quest.rewardAmount) \(quest.rewardType)")
                                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                                .foregroundStyle(AppTheme.accentOrange)
                                        }
                                    }
                                }
                                .padding(14)
                                .background(quest.isComplete ? AppTheme.successGreen.opacity(0.06) : Color(.tertiarySystemFill))
                                .clipShape(.rect(cornerRadius: 12))
                            }
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.funTeal.opacity(0.3))
                    }

                    VStack(spacing: 8) {
                        HStack(spacing: 6) {
                            Image(systemName: "lightbulb.fill")
                                .foregroundStyle(AppTheme.warningYellow)
                            Text("Duo Tips")
                                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                        }
                        Text("Both partners must be active on the same day to grow the duo streak. Complete weekly quests together to earn bonus rewards!")
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(AppTheme.warningYellow.opacity(0.06))
                    .clipShape(.rect(cornerRadius: 14))
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 32)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Duo Partnership")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                    streakPulse = true
                }
            }
        }
    }
}

struct DuoStatTile: View {
    let icon: String
    let label: String
    let value: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            Text(value)
                .font(AppTheme.funFont(.headline, weight: .heavy))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            Text(label)
                .font(AppTheme.funFont(.caption2, weight: .bold))
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .padding(.horizontal, 8)
        .background(color.opacity(0.06))
        .clipShape(.rect(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(color.opacity(0.15), lineWidth: 1.5)
        )
    }
}
