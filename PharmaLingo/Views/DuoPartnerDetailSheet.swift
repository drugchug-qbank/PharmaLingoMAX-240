import SwiftUI

struct DuoPartnerDetailSheet: View {
    let partner: DuoPartnerInfo
    let weeklyQuests: [DuoWeeklyQuest]
    let gameVM: GameViewModel
    @State private var duoService = DuoQuestService.shared
    @Environment(\.dismiss) private var dismiss
    @State private var streakPulse: Bool = false
    @State private var showChestReveal: Bool = false
    @State private var chestReward: MysteryChestReward?
    @State private var chestRewardApplied: Bool = false
    @State private var chestGlow: Bool = false

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

                            duoMysteryChestCard
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
            .overlay {
                if showChestReveal, let reward = chestReward {
                    MysteryChestRevealView(
                        reward: reward,
                        wasApplied: chestRewardApplied,
                        onDismiss: {
                            withAnimation(.spring(duration: 0.3)) {
                                showChestReveal = false
                            }
                        }
                    )
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                    streakPulse = true
                }
                withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    chestGlow = true
                }
            }
        }
    }

    private var allQuestsComplete: Bool {
        guard !weeklyQuests.isEmpty else { return false }
        return weeklyQuests.allSatisfy(\.isComplete)
    }

    private var allQuestsClaimed: Bool {
        guard !weeklyQuests.isEmpty else { return false }
        return weeklyQuests.allSatisfy { $0.isComplete && $0.rewardClaimed }
    }

    private var canOpenChest: Bool {
        allQuestsClaimed && !duoService.chestClaimedThisWeek
    }

    @ViewBuilder
    private var duoMysteryChestCard: some View {
        let completedCount = weeklyQuests.filter(\.isComplete).count
        let totalCount = weeklyQuests.count
        let isLocked = !allQuestsClaimed
        let alreadyClaimed = duoService.chestClaimedThisWeek

        VStack(spacing: 14) {
            Rectangle()
                .fill(Color(.separator).opacity(0.3))
                .frame(height: 1)
                .padding(.horizontal, -14)

            HStack(spacing: 10) {
                Image(systemName: "shippingbox.fill")
                    .font(.title3)
                    .foregroundStyle(
                        canOpenChest
                            ? LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .top, endPoint: .bottom)
                            : LinearGradient(colors: [Color(.tertiaryLabel), Color(.quaternaryLabel)], startPoint: .top, endPoint: .bottom)
                    )
                Text("Duo Mystery Chest")
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                Spacer()
                if alreadyClaimed {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.body)
                        .foregroundStyle(AppTheme.successGreen)
                }
            }

            HStack(spacing: 8) {
                ForEach(0..<totalCount, id: \.self) { index in
                    let done = index < completedCount
                    let claimed = index < weeklyQuests.filter({ $0.isComplete && $0.rewardClaimed }).count
                    Circle()
                        .fill(claimed ? AppTheme.successGreen : (done ? AppTheme.warningYellow : Color(.tertiarySystemFill)))
                        .frame(width: 16, height: 16)
                        .overlay {
                            if claimed {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 8, weight: .heavy))
                                    .foregroundStyle(.white)
                            } else if done {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 7))
                                    .foregroundStyle(.white)
                            }
                        }

                    if index < totalCount - 1 {
                        Rectangle()
                            .fill(claimed ? AppTheme.successGreen : (done ? AppTheme.warningYellow : Color(.tertiarySystemFill)))
                            .frame(height: 3)
                    }
                }

                ZStack {
                    Circle()
                        .fill(canOpenChest ? AppTheme.warningYellow.opacity(chestGlow ? 0.2 : 0.05) : Color(.tertiarySystemFill).opacity(0.3))
                        .frame(width: 44, height: 44)

                    Image(systemName: isLocked && !alreadyClaimed ? "lock.fill" : "shippingbox.fill")
                        .font(.title3)
                        .foregroundStyle(
                            canOpenChest
                                ? LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .top, endPoint: .bottom)
                                : alreadyClaimed
                                    ? LinearGradient(colors: [AppTheme.successGreen, AppTheme.successGreen], startPoint: .top, endPoint: .bottom)
                                    : LinearGradient(colors: [Color(.tertiaryLabel), Color(.quaternaryLabel)], startPoint: .top, endPoint: .bottom)
                        )
                        .scaleEffect(canOpenChest && chestGlow ? 1.1 : 1.0)
                }
            }

            if alreadyClaimed {
                HStack(spacing: 4) {
                    Image(systemName: "sparkles")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.successGreen)
                    Text("Chest opened this week!")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(AppTheme.successGreen)
                }
            } else if canOpenChest {
                Button {
                    openDuoChest()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "shippingbox.fill")
                            .font(.subheadline)
                        Text("Open Mystery Chest")
                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 11)
                    .background(
                        LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .leading, endPoint: .trailing)
                    )
                    .clipShape(.rect(cornerRadius: 12))
                }
                .buttonStyle(.plain)
                .sensoryFeedback(.impact(weight: .medium), trigger: showChestReveal)
            } else {
                HStack(spacing: 4) {
                    Image(systemName: "lock.fill")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    Text("Complete & claim all quests to unlock")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(14)
        .background(
            canOpenChest
                ? AppTheme.warningYellow.opacity(0.05)
                : alreadyClaimed
                    ? AppTheme.successGreen.opacity(0.04)
                    : Color(.tertiarySystemFill).opacity(0.5)
        )
        .clipShape(.rect(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(
                    canOpenChest ? AppTheme.warningYellow.opacity(0.4) : (alreadyClaimed ? AppTheme.successGreen.opacity(0.3) : Color(.quaternaryLabel)),
                    lineWidth: 1.5
                )
        )
    }

    private func openDuoChest() {
        let reward = MysteryChestReward.roll()
        let applied = gameVM.applyMysteryChestReward(reward)
        chestReward = MysteryChestReward(type: reward.type, amount: reward.amount, wasApplied: applied)
        chestRewardApplied = applied
        withAnimation(.spring(duration: 0.3)) {
            showChestReveal = true
        }
        Task {
            _ = await duoService.claimMysteryChest(
                rewardType: reward.type.rawValue,
                rewardAmount: reward.amount,
                wasApplied: applied
            )
        }
        gameVM.syncToCloud()
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
