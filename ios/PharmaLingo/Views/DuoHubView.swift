import SwiftUI

struct DuoHubView: View {
    let gameVM: GameViewModel
    @State private var duoService = DuoQuestService.shared
    @State private var showDissolvAlert: Bool = false
    @State private var showFinalDissolvAlert: Bool = false
    @State private var isDissolvingDuo: Bool = false
    @State private var showPartnerDetail: Bool = false
    @State private var claimingId: String?
    @State private var showRewardBanner: Bool = false
    @State private var rewardBannerText: String = ""
    @State private var nudgeSent: Bool = false
    @State private var showReferralSheet: Bool = false
    @State private var referralCode: String?

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if duoService.isLoading && !duoService.dashboard.hasPartner && duoService.currentPartnership == nil {
                    ProgressView()
                        .padding(40)
                } else if duoService.dashboard.hasPartner, let partnership = duoService.dashboard.partnership, let partner = duoService.dashboard.partner {
                    activePartnerHeader(partnership: partnership, partner: partner)
                    duoStatusCard(partnership: partnership, partner: partner)
                    dailyMissionsCard
                    weeklyRaidsCard(partner: partner)
                    milestoneProgressRail(partnership: partnership)
                    duoActivityFeedCard(partner: partner)
                    breakUpDuoButton(partnerName: partner.username)
                } else if duoService.currentPartnership != nil {
                    DuoQuestView(gameVM: gameVM)
                } else {
                    duoEmptyState
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 32)
        }
        .scrollIndicators(.hidden)
        .refreshable {
            await duoService.loadDuoData()
        }
        .task {
            await duoService.loadDuoData()
        }
        .alert("End Duo Partnership?", isPresented: $showDissolvAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Yes, I'm sure", role: .destructive) {
                showFinalDissolvAlert = true
            }
        } message: {
            Text("Are you sure you want to break up your Duo Partnership? Your shared streak and progress will be lost.")
        }
        .alert("This cannot be undone!", isPresented: $showFinalDissolvAlert) {
            Button("Go Back", role: .cancel) {}
            Button("Break Up Duo", role: .destructive) {
                isDissolvingDuo = true
                Task {
                    _ = await duoService.dissolveDuo()
                    isDissolvingDuo = false
                }
            }
        } message: {
            Text("This will permanently end your Duo Partnership, reset your shared streak to 0, and remove all shared progress. Are you absolutely sure?")
        }
        .sheet(isPresented: $showPartnerDetail) {
            if let partner = duoService.currentPartnership {
                DuoPartnerDetailSheet(partner: partner, weeklyQuests: duoService.weeklyQuests, gameVM: gameVM)
            }
        }
        .sheet(isPresented: $showReferralSheet) {
            DuoReferralSheet(referralCode: referralCode)
        }
        .overlay(alignment: .top) {
            if showRewardBanner {
                HStack(spacing: 8) {
                    Image(systemName: "party.popper.fill")
                        .font(.title3)
                    Text(rewardBannerText)
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                }
                .foregroundStyle(.white)
                .padding(14)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [AppTheme.successGreen, AppTheme.funTeal], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 14))
                .padding(.horizontal, 16)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
    }

    // MARK: - Active Partner Header

    @ViewBuilder
    private func activePartnerHeader(partnership: DuoDashboardPartnership, partner: DuoDashboardPartner) -> some View {
        Button {
            showPartnerDetail = true
        } label: {
            HStack(spacing: 14) {
                AvatarDisplayView(
                    animal: partner.avatar.animal,
                    eyes: partner.avatar.eyes,
                    mouth: partner.avatar.mouth,
                    accessory: partner.avatar.accessory,
                    bodyColor: partner.avatar.bodyColor,
                    backgroundColor: partner.avatar.bgColor,
                    size: 56
                )

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(partner.username)
                            .font(AppTheme.funFont(.body, weight: .heavy))
                        Text("Lv.\(partner.level)")
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
                            Text("\(partner.currentStreak)")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        HStack(spacing: 3) {
                            Image(systemName: "bolt.fill")
                                .font(.caption2)
                                .foregroundStyle(AppTheme.xpPurple)
                            Text("\(partner.weeklyXP) XP")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                Spacer()

                VStack(spacing: 2) {
                    HStack(spacing: 3) {
                        Image(systemName: "link.circle.fill")
                            .foregroundStyle(AppTheme.funTeal)
                        Text("\(partnership.sharedStreak)")
                            .font(AppTheme.funFont(.title2, weight: .heavy))
                            .foregroundStyle(AppTheme.funTeal)
                    }
                    Text("Duo Streak")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.funTeal.opacity(0.4))
        }
        .buttonStyle(.plain)
    }

    // MARK: - Duo Status Card

    @ViewBuilder
    private func duoStatusCard(partnership: DuoDashboardPartnership, partner: DuoDashboardPartner) -> some View {
        let mySafe = duoService.dashboard.myProgress.isSafe
        let partnerSafe = duoService.dashboard.partnerProgress.isSafe
        let bothSafe = mySafe && partnerSafe

        VStack(spacing: 14) {
            HStack(spacing: 6) {
                Image(systemName: bothSafe ? "checkmark.shield.fill" : "shield.fill")
                    .font(.title3)
                    .foregroundStyle(bothSafe ? AppTheme.successGreen : AppTheme.accentOrange)
                Text(statusTitle(mySafe: mySafe, partnerSafe: partnerSafe, partnerName: partner.username))
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(bothSafe ? AppTheme.successGreen : .primary)
                Spacer()
            }

            HStack(spacing: 16) {
                duoPointMeter(label: "You", points: duoService.dashboard.myProgress.duoPoints, isSafe: mySafe, color: AppTheme.primaryBlue)
                duoPointMeter(label: partner.username, points: duoService.dashboard.partnerProgress.duoPoints, isSafe: partnerSafe, color: AppTheme.accentOrange)
            }

            HStack(spacing: 10) {
                HStack(spacing: 4) {
                    Image(systemName: "clock.fill")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    Text(resetTimeText)
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }

                Spacer()

                if !mySafe {
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("Complete a study action!")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(AppTheme.accentOrange)
                    }
                }

                if mySafe && !partnerSafe {
                    Button {
                        Task {
                            nudgeSent = await duoService.nudgePartner()
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: nudgeSent ? "checkmark" : "hand.wave.fill")
                                .font(.caption2)
                            Text(nudgeSent ? "Nudged!" : "Nudge")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(nudgeSent ? AppTheme.successGreen : AppTheme.accentOrange)
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .disabled(nudgeSent)
                }
            }

            if partnership.sharedDuoStreakSaves > 0 {
                HStack(spacing: 4) {
                    Image(systemName: "flame.circle.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.warningYellow)
                    Text("\(partnership.sharedDuoStreakSaves) shared streak save\(partnership.sharedDuoStreakSaves > 1 ? "s" : "") available")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(AppTheme.warningYellow)
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: bothSafe ? AppTheme.successGreen.opacity(0.4) : AppTheme.accentOrange.opacity(0.3))
        .sensoryFeedback(.success, trigger: bothSafe)
    }

    @ViewBuilder
    private func duoPointMeter(label: String, points: Int, isSafe: Bool, color: Color) -> some View {
        VStack(spacing: 6) {
            HStack(spacing: 4) {
                if isSafe {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.caption)
                        .foregroundStyle(AppTheme.successGreen)
                }
                Text(label)
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            HStack(spacing: 3) {
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .fill(i < points ? color : Color(.tertiarySystemFill))
                        .frame(width: 18, height: 18)
                        .overlay {
                            if i < points {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 9, weight: .heavy))
                                    .foregroundStyle(.white)
                            }
                        }
                }
            }

            Text("\(points)/3 points")
                .font(AppTheme.funFont(.caption2, weight: .medium))
                .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(isSafe ? AppTheme.successGreen.opacity(0.06) : color.opacity(0.04))
        .clipShape(.rect(cornerRadius: 12))
    }

    // MARK: - Daily Missions

    @ViewBuilder
    private var dailyMissionsCard: some View {
        let missions = duoService.dashboard.dailyMissions
        if !missions.isEmpty {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "star.circle.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.warningYellow)
                Text("Daily Duo Missions")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
                Text("\(missions.filter(\.completed).count)/\(missions.count)")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(AppTheme.warningYellow))
            }

            ForEach(missions) { mission in
                missionRow(mission)
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
        }
    }

    @ViewBuilder
    private func missionRow(_ mission: DuoDailyMission) -> some View {
        let diffColor: Color = {
            switch mission.difficulty {
            case "easy": return AppTheme.successGreen
            case "medium": return AppTheme.warningYellow
            case "hard": return AppTheme.funCoral
            default: return AppTheme.primaryBlue
            }
        }()

        HStack(spacing: 12) {
            Image(systemName: mission.difficultyIcon)
                .font(.title3)
                .foregroundStyle(diffColor)
                .frame(width: 36, height: 36)
                .background(diffColor.opacity(0.12))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text(mission.title)
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                Text(mission.description)
                    .font(AppTheme.funFont(.caption, weight: .medium))
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            if mission.completed && !mission.claimed {
                Button {
                    claimMissionReward(mission)
                } label: {
                    HStack(spacing: 3) {
                        Image(systemName: "gift.fill")
                            .font(.caption)
                        Text("Claim")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(AppTheme.successGreen)
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
                .disabled(claimingId != nil)
            } else if mission.claimed {
                Image(systemName: "checkmark.seal.fill")
                    .font(.body)
                    .foregroundStyle(AppTheme.successGreen)
            } else {
                VStack(spacing: 1) {
                    HStack(spacing: 2) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(mission.rewardCoins)")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.accentOrange)
                    }
                }
            }
        }
        .padding(10)
        .background(mission.completed ? diffColor.opacity(0.04) : .clear)
        .clipShape(.rect(cornerRadius: 10))
    }

    // MARK: - Weekly Raids

    @ViewBuilder
    private func weeklyRaidsCard(partner: DuoDashboardPartner) -> some View {
        let raids = duoService.dashboard.weeklyRaids
        if !raids.isEmpty {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "target")
                    .font(.title3)
                    .foregroundStyle(AppTheme.xpPurple)
                Text("Weekly Duo Raids")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
                Text(weekTimeRemaining)
                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(AppTheme.xpPurple))
            }

            ForEach(raids) { raid in
                raidRow(raid, partner: partner)
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))
        }
    }

    @ViewBuilder
    private func raidRow(_ raid: DuoWeeklyRaid, partner: DuoDashboardPartner) -> some View {
        let questColor = raidColor(raid)

        VStack(spacing: 8) {
            HStack(spacing: 10) {
                Image(systemName: raid.questIcon)
                    .font(.title3)
                    .foregroundStyle(questColor)
                    .frame(width: 34, height: 34)
                    .background(questColor.opacity(0.12))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(raid.title)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                    HStack(spacing: 8) {
                        Text("You: \(myRaidProgress(raid))")
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .foregroundStyle(AppTheme.primaryBlue)
                        Text("\(partner.username): \(partnerRaidProgress(raid))")
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .foregroundStyle(AppTheme.accentOrange)
                    }
                }

                Spacer()

                if raid.completed && !raid.claimed {
                    Button {
                        claimRaidReward(raid)
                    } label: {
                        HStack(spacing: 3) {
                            Image(systemName: "gift.fill")
                                .font(.caption)
                            Text("Claim")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(
                            LinearGradient(colors: [AppTheme.successGreen, AppTheme.funTeal], startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    .disabled(claimingId != nil)
                } else if raid.claimed {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.body)
                        .foregroundStyle(AppTheme.successGreen)
                } else {
                    HStack(spacing: 2) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(raid.rewardCoins)")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.accentOrange)
                    }
                }
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.tertiarySystemFill))
                        .frame(height: 7)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(LinearGradient(colors: [questColor.opacity(0.7), questColor], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * raid.progressFraction, height: 7)
                }
            }
            .frame(height: 7)

            HStack {
                Text("\(raid.combinedProgress)/\(raid.targetValue)")
                    .font(AppTheme.funFont(.caption2, weight: .bold))
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(Int(raid.progressFraction * 100))%")
                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                    .foregroundStyle(questColor)
            }
        }
        .padding(10)
        .background(raid.completed ? questColor.opacity(0.04) : .clear)
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(raid.completed ? questColor.opacity(0.3) : Color(.tertiarySystemFill), lineWidth: 1)
        )
    }

    // MARK: - Milestone Progress Rail

    @ViewBuilder
    private func milestoneProgressRail(partnership: DuoDashboardPartnership) -> some View {
        let streak = partnership.sharedStreak
        let claimed = duoService.dashboard.claimedMilestones

        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "trophy.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.warningYellow)
                Text("Duo Milestones")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(DuoMilestone.allCases, id: \.rawValue) { milestone in
                        let isReached = streak >= milestone.requiredStreak
                        let isClaimed = claimed.contains(milestone.rawValue)
                        let canClaim = isReached && !isClaimed

                        VStack(spacing: 6) {
                            ZStack {
                                Circle()
                                    .fill(isClaimed ? AppTheme.successGreen.opacity(0.15) : (isReached ? AppTheme.warningYellow.opacity(0.15) : Color(.tertiarySystemFill)))
                                    .frame(width: 50, height: 50)
                                Image(systemName: milestone.icon)
                                    .font(.title3)
                                    .foregroundStyle(isClaimed ? AppTheme.successGreen : (isReached ? AppTheme.warningYellow : Color(.tertiaryLabel)))
                            }

                            Text("\(milestone.requiredStreak)d")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(isReached ? .primary : .tertiary)

                            if canClaim {
                                Button {
                                    claimMilestoneReward(partnership: partnership, milestone: milestone)
                                } label: {
                                    Text("Claim")
                                        .font(AppTheme.funFont(.caption2, weight: .heavy))
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(AppTheme.warningYellow)
                                        .clipShape(Capsule())
                                }
                                .buttonStyle(.plain)
                            } else if isClaimed {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.successGreen)
                            } else {
                                Text(milestone.rewardDescription)
                                    .font(.system(size: 9, weight: .medium, design: .rounded))
                                    .foregroundStyle(Color(.tertiaryLabel))
                                    .lineLimit(1)
                            }
                        }
                        .frame(width: 80)
                    }
                }
                .padding(.horizontal, 4)
            }
            .contentMargins(.horizontal, 0)
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
    }

    // MARK: - Activity Feed

    @ViewBuilder
    private func duoActivityFeedCard(partner: DuoDashboardPartner) -> some View {
        let feed = duoService.dashboard.activityFeed
        if !feed.isEmpty {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.primaryBlue)
                Text("Duo Feed")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
            }

            ForEach(feed.prefix(10)) { event in
                HStack(spacing: 10) {
                    Image(systemName: event.eventIcon)
                        .font(.caption)
                        .foregroundStyle(feedEventColor(event))
                        .frame(width: 28, height: 28)
                        .background(feedEventColor(event).opacity(0.12))
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 4) {
                            if let actorId = event.actorUserId {
                                Text(actorId == partner.id ? partner.username : "You")
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                            }
                            Text(event.displayText)
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.secondary)
                        }
                        .lineLimit(2)

                        Text(feedTimeAgo(event.createdAt))
                            .font(AppTheme.funFont(.caption2, weight: .medium))
                            .foregroundStyle(.tertiary)
                    }

                    Spacer()
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.2))
        }
    }

    // MARK: - Break Up Duo Button

    @ViewBuilder
    private func breakUpDuoButton(partnerName: String) -> some View {
        Button {
            showDissolvAlert = true
        } label: {
            HStack(spacing: 6) {
                if isDissolvingDuo {
                    ProgressView()
                        .tint(AppTheme.heartRed)
                } else {
                    Image(systemName: "person.2.slash")
                    Text("Break Up Duo Partnership")
                }
            }
            .font(AppTheme.funFont(.subheadline, weight: .medium))
            .foregroundStyle(AppTheme.heartRed)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(AppTheme.heartRed.opacity(0.08))
            .clipShape(.rect(cornerRadius: 14))
        }
        .buttonStyle(.plain)
        .disabled(isDissolvingDuo)
        .padding(.top, 8)
    }

    // MARK: - Empty State

    @ViewBuilder
    private var duoEmptyState: some View {
        VStack(spacing: 20) {
            if !duoService.dashboard.pendingInvites.isEmpty {
                ForEach(duoService.dashboard.pendingInvites) { invite in
                    pendingInviteCard(invite: invite)
                }
            } else if duoService.hasPendingDuoInvite, let sender = duoService.pendingInviteFrom {
                legacyPendingInviteCard(sender: sender)
            }

            VStack(spacing: 16) {
                Image(systemName: "person.2.circle.fill")
                    .font(.system(size: 56))
                    .foregroundStyle(
                        LinearGradient(colors: [AppTheme.funTeal, AppTheme.primaryBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )

                Text("Start a Duo Streak!")
                    .font(AppTheme.funFont(.title3, weight: .heavy))

                Text("Invite a classmate and study together every day. Protect your shared streak, complete missions, and earn exclusive rewards!")
                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                HStack(spacing: 20) {
                    VStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .font(.title2)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("Shared Streak")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                    VStack(spacing: 4) {
                        Image(systemName: "star.circle.fill")
                            .font(.title2)
                            .foregroundStyle(AppTheme.warningYellow)
                        Text("Daily Missions")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                    VStack(spacing: 4) {
                        Image(systemName: "target")
                            .font(.title2)
                            .foregroundStyle(AppTheme.xpPurple)
                        Text("Weekly Raids")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                    VStack(spacing: 4) {
                        Image(systemName: "trophy.fill")
                            .font(.title2)
                            .foregroundStyle(AppTheme.warningYellow)
                        Text("Milestones")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                    }
                }
                .padding(.top, 4)

                Button {
                    Task {
                        referralCode = await duoService.generateReferralCode()
                        if referralCode != nil {
                            showReferralSheet = true
                        }
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "link")
                        Text("Share Invite Code")
                    }
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(
                        LinearGradient(colors: [AppTheme.funTeal, AppTheme.primaryBlue], startPoint: .leading, endPoint: .trailing)
                    )
                    .clipShape(.rect(cornerRadius: 14))
                }
                .buttonStyle(.plain)

                Text("Or visit a friend's profile to send a Duo invite!")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .padding(20)
            .cardStyle(borderColor: AppTheme.funTeal.opacity(0.3))
        }
    }

    // MARK: - Pending Invite Cards

    @ViewBuilder
    private func pendingInviteCard(invite: DuoPendingInvite) -> some View {
        VStack(spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "bell.badge.fill")
                    .foregroundStyle(AppTheme.accentOrange)
                Text("Duo Invite!")
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
            }

            HStack(spacing: 12) {
                AvatarDisplayView(
                    animal: invite.senderAvatar.animal,
                    eyes: invite.senderAvatar.eyes,
                    mouth: invite.senderAvatar.mouth,
                    accessory: invite.senderAvatar.accessory,
                    bodyColor: invite.senderAvatar.bodyColor,
                    backgroundColor: invite.senderAvatar.bgColor,
                    size: 44
                )
                VStack(alignment: .leading, spacing: 2) {
                    Text(invite.senderName)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                    Text("Lv.\(invite.senderLevel)")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }

            HStack(spacing: 10) {
                Button {
                    Task { _ = await duoService.acceptDuoInvite(partnershipId: invite.id) }
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
                    Task { _ = await duoService.declineDuoInvite(partnershipId: invite.id) }
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

    @ViewBuilder
    private func legacyPendingInviteCard(sender: LeaderboardRecord) -> some View {
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
                    Text("Lv.\(sender.level)")
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

    // MARK: - Reward Claiming

    private func claimMissionReward(_ mission: DuoDailyMission) {
        claimingId = mission.id
        Task {
            if let reward = await duoService.claimDuoReward(claimType: "daily_mission", claimId: mission.id) {
                applyDuoReward(reward)
                showRewardBannerWith(reward)
            }
            claimingId = nil
            await duoService.fetchDashboard()
        }
    }

    private func claimRaidReward(_ raid: DuoWeeklyRaid) {
        claimingId = raid.id
        Task {
            if let reward = await duoService.claimDuoReward(claimType: "weekly_raid", claimId: raid.id) {
                applyDuoReward(reward)
                showRewardBannerWith(reward)
            }
            claimingId = nil
            await duoService.fetchDashboard()
        }
    }

    private func claimMilestoneReward(partnership: DuoDashboardPartnership, milestone: DuoMilestone) {
        Task {
            if let reward = await duoService.claimMilestone(
                partnershipId: partnership.id,
                milestoneKey: milestone.rawValue,
                rewardPayload: milestone.rewardPayloadDict
            ) {
                applyDuoReward(reward)
                showRewardBannerWith(reward)
            }
            await duoService.fetchDashboard()
        }
    }

    private func applyDuoReward(_ reward: DuoRewardPayload) {
        if reward.coins > 0 { gameVM.coins += reward.coins }
        if reward.xp > 0 { gameVM.earnXP(reward.xp) }
        if reward.streakSave > 0 { gameVM.streakSaves = min(gameVM.streakSaves + reward.streakSave, 5) }
        if reward.maxHearts > 0 { gameVM.refillHearts() }
        if reward.doubleXP { gameVM.activateDoubleXP() }
        if reward.powerupFiftyFifty > 0 {
            for _ in 0..<reward.powerupFiftyFifty {
                _ = gameVM.powerUpInventory.add(.fiftyFifty, isPro: gameVM.isProUser)
            }
        }
        if reward.powerupShieldHeart > 0 {
            for _ in 0..<reward.powerupShieldHeart {
                _ = gameVM.powerUpInventory.add(.shieldHeart, isPro: gameVM.isProUser)
            }
        }
        if reward.powerupPharmaVision > 0 {
            for _ in 0..<reward.powerupPharmaVision {
                _ = gameVM.powerUpInventory.add(.pharmaVision, isPro: gameVM.isProUser)
            }
        }
        gameVM.save()
        gameVM.syncToCloud()
    }

    private func showRewardBannerWith(_ reward: DuoRewardPayload) {
        let items = reward.displayItems
        rewardBannerText = items.map(\.text).joined(separator: " • ")
        withAnimation(.spring(duration: 0.4)) { showRewardBanner = true }
        Task {
            try? await Task.sleep(for: .seconds(3))
            withAnimation { showRewardBanner = false }
        }
    }

    // MARK: - Helpers

    private func statusTitle(mySafe: Bool, partnerSafe: Bool, partnerName: String) -> String {
        if mySafe && partnerSafe { return "Both safe — Duo streak protected!" }
        if mySafe && !partnerSafe { return "You're safe! Waiting on \(partnerName)..." }
        if !mySafe && partnerSafe { return "\(partnerName) is safe. Your turn!" }
        return "Neither safe yet today"
    }

    private var resetTimeText: String {
        let hours = duoService.dashboard.hoursUntilReset
        if hours > 24 { return "Resets in \(Int(hours / 24))d" }
        let h = Int(hours)
        let m = Int((hours - Double(h)) * 60)
        return "Resets in \(h)h \(m)m"
    }

    private func myRaidProgress(_ raid: DuoWeeklyRaid) -> Int {
        duoService.dashboard.isUser1 ? raid.user1Progress : raid.user2Progress
    }

    private func partnerRaidProgress(_ raid: DuoWeeklyRaid) -> Int {
        duoService.dashboard.isUser1 ? raid.user2Progress : raid.user1Progress
    }

    private func raidColor(_ raid: DuoWeeklyRaid) -> Color {
        switch raid.questType {
        case "xp_earned": return AppTheme.xpPurple
        case "brand_blitz_rounds": return AppTheme.accentOrange
        case "questions_answered": return AppTheme.funTeal
        case "high_score_quizzes": return AppTheme.warningYellow
        case "perfect_quizzes": return AppTheme.funPink
        case "lessons_completed": return AppTheme.primaryBlue
        default: return AppTheme.primaryBlue
        }
    }

    private func feedEventColor(_ event: DuoFeedEvent) -> Color {
        switch event.eventType {
        case "both_safe": return AppTheme.successGreen
        case "user_safe": return AppTheme.funTeal
        case "nudge": return AppTheme.accentOrange
        case "milestone_claimed": return AppTheme.warningYellow
        case "partnership_started": return AppTheme.primaryBlue
        case "partnership_dissolved": return AppTheme.heartRed
        default: return AppTheme.primaryBlue
        }
    }

    private func feedTimeAgo(_ dateStr: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let date = formatter.date(from: dateStr) else {
            formatter.formatOptions = [.withInternetDateTime]
            guard let date2 = formatter.date(from: dateStr) else { return "" }
            return timeAgoText(from: date2)
        }
        return timeAgoText(from: date)
    }

    private func timeAgoText(from date: Date) -> String {
        let seconds = Date().timeIntervalSince(date)
        if seconds < 60 { return "Just now" }
        if seconds < 3600 { return "\(Int(seconds / 60))m ago" }
        if seconds < 86400 { return "\(Int(seconds / 3600))h ago" }
        return "\(Int(seconds / 86400))d ago"
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
