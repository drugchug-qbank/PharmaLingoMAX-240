import SwiftUI

struct DuoQuestView: View {
    let gameVM: GameViewModel
    @State private var duoService = DuoQuestService.shared
    @State private var showDissolvAlert: Bool = false
    @State private var claimingQuestId: String?
    @State private var showRewardBanner: Bool = false
    @State private var rewardAmount: Int = 0

    var body: some View {
        VStack(spacing: 16) {
            if duoService.isLoading {
                ProgressView()
                    .padding(40)
            } else if let partner = duoService.currentPartnership {
                duoActiveContent(partner: partner)
            } else {
                duoEmptyState
            }
        }
    }

    @ViewBuilder
    private func duoActiveContent(partner: DuoPartnerInfo) -> some View {
        VStack(spacing: 16) {
            VStack(spacing: 14) {
                HStack(spacing: 4) {
                    Image(systemName: "person.2.fill")
                        .font(.title3)
                        .foregroundStyle(
                            LinearGradient(colors: [AppTheme.funTeal, AppTheme.primaryBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    Text("Duo Partner")
                        .font(AppTheme.funFont(.headline, weight: .heavy))
                    Spacer()
                    Button {
                        showDissolvAlert = true
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }

                HStack(spacing: 14) {
                    AvatarDisplayView(
                        animal: partner.partnerAvatar.animal,
                        eyes: partner.partnerAvatar.eyes,
                        mouth: partner.partnerAvatar.mouth,
                        accessory: partner.partnerAvatar.accessory,
                        bodyColor: partner.partnerAvatar.bodyColor,
                        backgroundColor: partner.partnerAvatar.bgColor,
                        size: 56
                    )

                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 6) {
                            Text(partner.partnerName)
                                .font(AppTheme.funFont(.body, weight: .heavy))
                            Text("Lv.\(partner.partnerLevel)")
                                .font(AppTheme.funFont(.caption2, weight: .heavy))
                                .foregroundStyle(AppTheme.darkBlue)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(AppTheme.warningYellow)
                                .clipShape(Capsule())
                        }
                        HStack(spacing: 12) {
                            HStack(spacing: 3) {
                                Image(systemName: "flame.fill")
                                    .font(.caption2)
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text("\(partner.partnerStreak)")
                                    .font(AppTheme.funFont(.caption, weight: .bold))
                                    .foregroundStyle(.secondary)
                            }
                            HStack(spacing: 3) {
                                Image(systemName: "bolt.fill")
                                    .font(.caption2)
                                    .foregroundStyle(AppTheme.xpPurple)
                                Text("\(partner.partnerWeeklyXP) XP")
                                    .font(AppTheme.funFont(.caption, weight: .bold))
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }

                    Spacer()
                }

                HStack(spacing: 16) {
                    VStack(spacing: 2) {
                        HStack(spacing: 4) {
                            Image(systemName: "link.circle.fill")
                                .foregroundStyle(AppTheme.funTeal)
                            Text("\(partner.sharedStreak)")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(AppTheme.funTeal)
                        }
                        Text("Duo Streak")
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(AppTheme.funTeal.opacity(0.08))
                    .clipShape(.rect(cornerRadius: 12))

                    VStack(spacing: 2) {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(AppTheme.successGreen)
                            Text("\(duoService.weeklyQuests.filter(\.isComplete).count)/\(duoService.weeklyQuests.count)")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(AppTheme.successGreen)
                        }
                        Text("Quests Done")
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(AppTheme.successGreen.opacity(0.08))
                    .clipShape(.rect(cornerRadius: 12))
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.funTeal.opacity(0.4))

            if !duoService.weeklyQuests.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 6) {
                        Image(systemName: "target")
                            .font(.title3)
                            .foregroundStyle(AppTheme.xpPurple)
                        Text("Weekly Duo Quests")
                            .font(AppTheme.funFont(.headline, weight: .heavy))
                        Spacer()
                        Text(weekTimeRemaining)
                            .font(AppTheme.funFont(.caption2, weight: .heavy))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(AppTheme.xpPurple))
                    }

                    ForEach(duoService.weeklyQuests, id: \.id) { quest in
                        duoQuestRow(quest: quest, partner: partner)
                    }
                }
                .padding(16)
                .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))
            }

            if showRewardBanner {
                HStack(spacing: 8) {
                    Image(systemName: "party.popper.fill")
                        .font(.title3)
                    Text("+\(rewardAmount) coins each!")
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                }
                .foregroundStyle(.white)
                .padding(14)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [AppTheme.successGreen, AppTheme.funTeal], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .alert("Dissolve Duo?", isPresented: $showDissolvAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Dissolve", role: .destructive) {
                Task {
                    _ = await duoService.dissolveDuo()
                }
            }
        } message: {
            Text("This will end your duo partnership and reset your shared streak. You can partner with someone new afterward.")
        }
    }

    @ViewBuilder
    private func duoQuestRow(quest: DuoWeeklyQuest, partner: DuoPartnerInfo) -> some View {
        let questColor = colorForQuest(quest)

        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: quest.questIcon)
                    .font(.title3)
                    .foregroundStyle(questColor)
                    .frame(width: 36, height: 36)
                    .background(questColor.opacity(0.12))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 3) {
                    Text(quest.questDisplayTitle)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                    HStack(spacing: 8) {
                        HStack(spacing: 3) {
                            Text("You:")
                                .font(AppTheme.funFont(.caption2, weight: .medium))
                                .foregroundStyle(.secondary)
                            Text("\(myProgress(for: quest))")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.primaryBlue)
                        }
                        HStack(spacing: 3) {
                            Text("\(partner.partnerName):")
                                .font(AppTheme.funFont(.caption2, weight: .medium))
                                .foregroundStyle(.secondary)
                            Text("\(partnerProgress(for: quest))")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.accentOrange)
                        }
                    }
                }

                Spacer()

                if quest.isComplete && !quest.rewardClaimed {
                    Button {
                        claimingQuestId = quest.id
                        Task {
                            if let result = await duoService.claimDuoReward(questId: quest.id) {
                                if result.success {
                                    rewardAmount = result.coinsAwarded ?? quest.rewardAmount
                                    gameVM.coins += rewardAmount
                                    gameVM.save()
                                    withAnimation(.spring(duration: 0.4)) {
                                        showRewardBanner = true
                                    }
                                    try? await Task.sleep(for: .seconds(3))
                                    withAnimation { showRewardBanner = false }
                                }
                            }
                            claimingQuestId = nil
                        }
                    } label: {
                        HStack(spacing: 3) {
                            if claimingQuestId == quest.id {
                                ProgressView().tint(.white)
                            } else {
                                Image(systemName: "gift.fill")
                                    .font(.caption)
                                Text("Claim")
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                            }
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(
                            LinearGradient(colors: [AppTheme.successGreen, AppTheme.funTeal], startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .disabled(claimingQuestId != nil)
                } else if quest.rewardClaimed {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.title3)
                        .foregroundStyle(AppTheme.successGreen)
                } else {
                    VStack(spacing: 1) {
                        HStack(spacing: 2) {
                            Image(systemName: "bitcoinsign.circle.fill")
                                .font(.caption2)
                                .foregroundStyle(AppTheme.accentOrange)
                            Text("\(quest.rewardAmount)")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.accentOrange)
                        }
                    }
                }
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.tertiarySystemFill))
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(colors: [questColor.opacity(0.7), questColor], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: geo.size.width * quest.progressFraction, height: 8)
                }
            }
            .frame(height: 8)

            HStack {
                Text("\(quest.combinedProgress)/\(quest.targetValue)")
                    .font(AppTheme.funFont(.caption2, weight: .bold))
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(Int(quest.progressFraction * 100))%")
                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                    .foregroundStyle(questColor)
            }
        }
        .padding(12)
        .background(quest.isComplete ? questColor.opacity(0.04) : .clear)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(quest.isComplete ? questColor.opacity(0.3) : Color(.tertiarySystemFill), lineWidth: 1.5)
        )
    }

    @ViewBuilder
    private var duoEmptyState: some View {
        VStack(spacing: 16) {
            VStack(spacing: 12) {
                Image(systemName: "person.2.circle.fill")
                    .font(.system(size: 52))
                    .foregroundStyle(
                        LinearGradient(colors: [AppTheme.funTeal, AppTheme.primaryBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )

                Text("Team Up!")
                    .font(AppTheme.funFont(.title3, weight: .heavy))

                Text("Partner with a friend to unlock shared streaks and weekly duo quests. Complete goals together to earn bonus coins!")
                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                HStack(spacing: 16) {
                    VStack(spacing: 4) {
                        Image(systemName: "link.circle.fill")
                            .font(.title2)
                            .foregroundStyle(AppTheme.funTeal)
                        Text("Shared Streaks")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                    VStack(spacing: 4) {
                        Image(systemName: "target")
                            .font(.title2)
                            .foregroundStyle(AppTheme.xpPurple)
                        Text("Weekly Quests")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                    VStack(spacing: 4) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.title2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("Bonus Coins")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                }
                .padding(.top, 4)
            }

            if duoService.hasPendingDuoInvite, let sender = duoService.pendingInviteFrom {
                pendingDuoInviteCard(sender: sender)
            }

            Text("Visit a friend's profile to send a Duo invite!")
                .font(AppTheme.funFont(.caption, weight: .bold))
                .foregroundStyle(.secondary)
        }
        .padding(20)
        .cardStyle(borderColor: AppTheme.funTeal.opacity(0.3))
    }

    @ViewBuilder
    private func pendingDuoInviteCard(sender: LeaderboardRecord) -> some View {
        VStack(spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "bell.badge.fill")
                    .foregroundStyle(AppTheme.accentOrange)
                Text("Duo Invite!")
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
            }

            HStack(spacing: 12) {
                AvatarDisplayView(
                    animal: sender.avatarAnimal,
                    eyes: sender.avatarEyes,
                    mouth: sender.avatarMouth,
                    accessory: sender.avatarAccessory,
                    bodyColor: sender.avatarBodyColor,
                    backgroundColor: sender.avatarBgColor,
                    size: 44
                )
                VStack(alignment: .leading, spacing: 2) {
                    Text(sender.username)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                    Text("Lv.\(sender.level) • \(sender.weeklyXP) XP this week")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }

            HStack(spacing: 10) {
                Button {
                    Task {
                        if let pId = duoService.pendingPartnershipId {
                            _ = await duoService.acceptDuoInvite(partnershipId: pId)
                        }
                    }
                } label: {
                    Text("Accept")
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(AppTheme.successGreen)
                        .clipShape(.rect(cornerRadius: 12))
                }
                .buttonStyle(.plain)

                Button {
                    Task {
                        if let pId = duoService.pendingPartnershipId {
                            _ = await duoService.declineDuoInvite(partnershipId: pId)
                        }
                    }
                } label: {
                    Text("Decline")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color(.tertiarySystemFill))
                        .clipShape(.rect(cornerRadius: 12))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(14)
        .background(AppTheme.accentOrange.opacity(0.06))
        .clipShape(.rect(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(AppTheme.accentOrange.opacity(0.3), lineWidth: 1.5)
        )
    }

    private func myProgress(for quest: DuoWeeklyQuest) -> Int {
        guard let userId = SupabaseService.shared.currentUser?.id.uuidString.lowercased(),
              let partner = duoService.currentPartnership else { return 0 }
        if partner.partnerId != userId {
            return quest.user1Progress
        }
        return quest.user2Progress
    }

    private func partnerProgress(for quest: DuoWeeklyQuest) -> Int {
        guard let userId = SupabaseService.shared.currentUser?.id.uuidString.lowercased(),
              let partner = duoService.currentPartnership else { return 0 }
        if partner.partnerId != userId {
            return quest.user2Progress
        }
        return quest.user1Progress
    }

    private func colorForQuest(_ quest: DuoWeeklyQuest) -> Color {
        switch quest.questColor {
        case "funTeal": return AppTheme.funTeal
        case "warningYellow": return AppTheme.warningYellow
        case "accentOrange": return AppTheme.accentOrange
        case "xpPurple": return AppTheme.xpPurple
        case "primaryBlue": return AppTheme.primaryBlue
        default: return AppTheme.primaryBlue
        }
    }

    private var weekTimeRemaining: String {
        let calendar = Calendar.current
        let now = Date()
        guard let endOfWeek = calendar.nextDate(after: now, matching: DateComponents(hour: 0, weekday: 2), matchingPolicy: .nextTime) else {
            return "5d"
        }
        let components = calendar.dateComponents([.day, .hour], from: now, to: endOfWeek)
        return "\(components.day ?? 0)d \(components.hour ?? 0)h"
    }
}
