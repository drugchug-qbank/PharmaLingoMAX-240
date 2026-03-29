import SwiftUI

struct DuoHubView: View {
    let gameVM: GameViewModel
    @State private var duoService = DuoQuestService.shared
    @State private var showDissolvAlert: Bool = false
    @State private var showFinalDissolvAlert: Bool = false
    @State private var isDissolvingDuo: Bool = false
    @State private var claimingId: String?
    @State private var showRewardBanner: Bool = false
    @State private var rewardBannerText: String = ""
    @State private var nudgeSent: Bool = false
    @State private var showReferralSheet: Bool = false
    @State private var referralCode: String?
    @State private var streakPulse: Bool = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    if duoService.isLoading && !duoService.dashboard.hasPartner && duoService.currentPartnership == nil {
                        ProgressView()
                            .padding(40)
                    } else if duoService.dashboard.hasPartner, let partnership = duoService.dashboard.partnership, let partner = duoService.dashboard.partner {
                        activePartnerHeader(partnership: partnership, partner: partner)
                        duoStatusCard(partnership: partnership, partner: partner)
                        howToEarnPointsCard
                        dailyMissionsCard
                        weeklyRaidsCard(partner: partner)
                        milestoneProgressRail(partnership: partnership)
                        duoActivityFeedCard(partner: partner)
                        breakUpDuoButton(partnerName: partner.username)
                    } else if duoService.currentPartnership != nil {
                        legacyActiveContent
                    } else {
                        duoEmptyState
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Duo Hub")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
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
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                    streakPulse = true
                }
            }
        }
    }

    // MARK: - Active Partner Header

    @ViewBuilder
    private func activePartnerHeader(partnership: DuoDashboardPartnership, partner: DuoDashboardPartner) -> some View {
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
                        size: 60
                    )
                    Text("You")
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(AppTheme.primaryBlue)
                }

                VStack(spacing: 4) {
                    ZStack {
                        Circle()
                            .fill(AppTheme.funTeal.opacity(0.15))
                            .frame(width: 48, height: 48)
                            .scaleEffect(streakPulse ? 1.2 : 1.0)
                            .opacity(streakPulse ? 0.0 : 0.6)
                        Image(systemName: "flame.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(
                                partnership.sharedStreak > 0
                                    ? LinearGradient(colors: [AppTheme.accentOrange, AppTheme.funCoral], startPoint: .top, endPoint: .bottom)
                                    : LinearGradient(colors: [Color(.tertiaryLabel), Color(.quaternaryLabel)], startPoint: .top, endPoint: .bottom)
                            )
                    }
                    Text("\(partnership.sharedStreak)")
                        .font(AppTheme.funFont(.title, weight: .heavy))
                        .foregroundStyle(partnership.sharedStreak > 0 ? AppTheme.accentOrange : Color(.tertiaryLabel))
                    Text("Duo Streak")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 4) {
                    AvatarDisplayView(
                        animal: partner.avatar.animal,
                        eyes: partner.avatar.eyes,
                        mouth: partner.avatar.mouth,
                        accessory: partner.avatar.accessory,
                        bodyColor: partner.avatar.bodyColor,
                        backgroundColor: partner.avatar.bgColor,
                        size: 60
                    )
                    Text(partner.username)
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(AppTheme.funTeal)
                        .lineLimit(1)
                }
            }

            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image(systemName: "trophy.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.warningYellow)
                    Text("Best: \(partnership.bestSharedStreak)")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                HStack(spacing: 4) {
                    Image(systemName: "bolt.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.xpPurple)
                    Text("\(partner.weeklyXP) XP/wk")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.warningYellow)
                    Text("Lv.\(partner.level)")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(18)
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
                .stroke(AppTheme.funTeal.opacity(0.35), lineWidth: 2)
        )
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
                        Text("Study to protect your streak!")
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

            Text(isSafe ? "Safe!" : "\(points)/3 pts")
                .font(AppTheme.funFont(.caption2, weight: isSafe ? .heavy : .medium))
                .foregroundStyle(isSafe ? AppTheme.successGreen : Color(.tertiaryLabel))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(isSafe ? AppTheme.successGreen.opacity(0.06) : color.opacity(0.04))
        .clipShape(.rect(cornerRadius: 12))
    }

    // MARK: - How to Earn Points

    @ViewBuilder
    private var howToEarnPointsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "lightbulb.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.warningYellow)
                Text("How to Earn Duo Points")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
                Text("3 max/day")
                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(AppTheme.warningYellow))
            }

            VStack(spacing: 8) {
                duoPointExplainerRow(icon: "bolt.circle.fill", iconColor: AppTheme.accentOrange, text: "Complete a Brand Blitz round", pointValue: "+1")
                duoPointExplainerRow(icon: "star.circle.fill", iconColor: AppTheme.warningYellow, text: "Score 90%+ on any quiz or lesson", pointValue: "+1")
                duoPointExplainerRow(icon: "bolt.fill", iconColor: AppTheme.xpPurple, text: "Earn 100+ XP in a day", pointValue: "+1")
                duoPointExplainerRow(icon: "book.closed.fill", iconColor: AppTheme.primaryBlue, text: "Complete a lesson with 80%+", pointValue: "+1")
                duoPointExplainerRow(icon: "questionmark.circle.fill", iconColor: AppTheme.funTeal, text: "Answer 20+ questions in a day", pointValue: "+1")
            }

            HStack(spacing: 6) {
                Image(systemName: "info.circle.fill")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Text("Both partners need at least 1 point each day to protect the streak!")
                    .font(AppTheme.funFont(.caption2, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 2)
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
    }

    @ViewBuilder
    private func duoPointExplainerRow(icon: String, iconColor: Color, text: String, pointValue: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.body)
                .foregroundStyle(iconColor)
                .frame(width: 28)

            Text(text)
                .font(AppTheme.funFont(.caption, weight: .medium))
                .foregroundStyle(.primary)

            Spacer()

            Text(pointValue)
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(AppTheme.successGreen)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(AppTheme.successGreen.opacity(0.12))
                .clipShape(Capsule())
        }
    }

    // MARK: - Daily Missions

    @ViewBuilder
    private var dailyMissionsCard: some View {
        let missions = duoService.dashboard.dailyMissions

        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "star.circle.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.warningYellow)
                Text("Daily Duo Missions")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
                if !missions.isEmpty {
                    Text("\(missions.filter(\.completed).count)/\(missions.count)")
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(AppTheme.warningYellow))
                }
            }

            if missions.isEmpty {
                VStack(spacing: 10) {
                    Image(systemName: "sparkles")
                        .font(.title2)
                        .foregroundStyle(AppTheme.warningYellow.opacity(0.5))
                    Text("Daily missions generate each day!")
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                        .foregroundStyle(.secondary)
                    Text("Complete 3 bonus missions together for extra coins, XP, and power-ups. Missions rotate daily with easy, medium, and hard challenges.")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.tertiary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            } else {
                ForEach(missions) { mission in
                    missionRow(mission)
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
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
                HStack(spacing: 6) {
                    Text(mission.title)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                    Text(mission.difficulty.capitalized)
                        .font(.system(size: 9, weight: .heavy, design: .rounded))
                        .foregroundStyle(diffColor)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(diffColor.opacity(0.12))
                        .clipShape(Capsule())
                }
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
                rewardBadge(mission.rewardCoins, mission.rewardXP)
            }
        }
        .padding(10)
        .background(mission.completed ? diffColor.opacity(0.04) : .clear)
        .clipShape(.rect(cornerRadius: 10))
    }

    @ViewBuilder
    private func rewardBadge(_ coins: Int, _ xp: Int) -> some View {
        VStack(spacing: 2) {
            if coins > 0 {
                HStack(spacing: 2) {
                    Image(systemName: "bitcoinsign.circle.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.accentOrange)
                    Text("\(coins)")
                        .font(AppTheme.funFont(.caption2, weight: .heavy))
                        .foregroundStyle(AppTheme.accentOrange)
                }
            }
            if xp > 0 {
                HStack(spacing: 2) {
                    Image(systemName: "bolt.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.xpPurple)
                    Text("\(xp)")
                        .font(AppTheme.funFont(.caption2, weight: .heavy))
                        .foregroundStyle(AppTheme.xpPurple)
                }
            }
        }
    }

    // MARK: - Weekly Raids

    @ViewBuilder
    private func weeklyRaidsCard(partner: DuoDashboardPartner) -> some View {
        let raids = duoService.dashboard.weeklyRaids

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

            if raids.isEmpty {
                VStack(spacing: 10) {
                    Image(systemName: "scope")
                        .font(.title2)
                        .foregroundStyle(AppTheme.xpPurple.opacity(0.5))
                    Text("Weekly raids generate each Monday!")
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                        .foregroundStyle(.secondary)
                    Text("5 co-op challenges each week — earn XP together, crush Brand Blitz rounds, ace quizzes, and more. Pool your efforts for bigger rewards!")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(Color(.tertiaryLabel))
                        .multilineTextAlignment(.center)

                    HStack(spacing: 12) {
                        raidPreviewBadge(icon: "bolt.fill", label: "Earn XP", color: AppTheme.xpPurple)
                        raidPreviewBadge(icon: "bolt.circle.fill", label: "Brand Blitz", color: AppTheme.accentOrange)
                        raidPreviewBadge(icon: "star.fill", label: "90%+ Quizzes", color: AppTheme.warningYellow)
                        raidPreviewBadge(icon: "book.fill", label: "Lessons", color: AppTheme.primaryBlue)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            } else {
                ForEach(raids) { raid in
                    raidRow(raid, partner: partner)
                }

                if !raids.isEmpty {
                    let completed = raids.filter(\.completed).count
                    HStack(spacing: 6) {
                        Image(systemName: "chart.bar.fill")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.xpPurple)
                        Text("\(completed)/\(raids.count) raids completed this week")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))
    }

    @ViewBuilder
    private func raidPreviewBadge(icon: String, label: String, color: Color) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundStyle(color)
            Text(label)
                .font(.system(size: 9, weight: .bold, design: .rounded))
                .foregroundStyle(.secondary)
                .lineLimit(1)
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
                    rewardBadge(raid.rewardCoins, 0)
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
                Text("\(streak) day\(streak == 1 ? "" : "s")")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(AppTheme.warningYellow)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(DuoMilestone.allCases, id: \.rawValue) { milestone in
                        let isReached = streak >= milestone.requiredStreak
                        let isClaimed = claimed.contains(milestone.rawValue)
                        let canClaim = isReached && !isClaimed
                        let progress = min(Double(streak) / Double(milestone.requiredStreak), 1.0)

                        VStack(spacing: 6) {
                            ZStack {
                                Circle()
                                    .stroke(Color(.tertiarySystemFill), lineWidth: 3)
                                    .frame(width: 50, height: 50)
                                Circle()
                                    .trim(from: 0, to: progress)
                                    .stroke(
                                        isClaimed ? AppTheme.successGreen : (isReached ? AppTheme.warningYellow : AppTheme.primaryBlue),
                                        style: StrokeStyle(lineWidth: 3, lineCap: .round)
                                    )
                                    .frame(width: 50, height: 50)
                                    .rotationEffect(.degrees(-90))

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

            HStack(spacing: 6) {
                Image(systemName: "arrow.right.circle.fill")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
                let nextMilestone = DuoMilestone.allCases.first { streak < $0.requiredStreak }
                if let next = nextMilestone {
                    Text("\(next.requiredStreak - streak) more day\(next.requiredStreak - streak == 1 ? "" : "s") until \(next.displayTitle) reward!")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                } else {
                    Text("All milestones reached! Keep the streak alive!")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(AppTheme.successGreen)
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
    }

    // MARK: - Activity Feed

    @ViewBuilder
    private func duoActivityFeedCard(partner: DuoDashboardPartner) -> some View {
        let feed = duoService.dashboard.activityFeed

        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.primaryBlue)
                Text("Duo Feed")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                Spacer()
            }

            if feed.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "text.bubble")
                        .font(.title2)
                        .foregroundStyle(AppTheme.primaryBlue.opacity(0.4))
                    Text("Activity will appear here as you and your partner study!")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.tertiary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
            } else {
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
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.2))
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

    // MARK: - Legacy Active Content (fallback when dashboard RPC unavailable)

    @ViewBuilder
    private var legacyActiveContent: some View {
        if let partner = duoService.currentPartnership {
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
                            size: 56
                        )
                        Text("You")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.primaryBlue)
                    }

                    VStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("\(partner.sharedStreak)")
                            .font(AppTheme.funFont(.title, weight: .heavy))
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("Duo Streak")
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
                            size: 56
                        )
                        Text(partner.partnerName)
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.funTeal)
                    }
                }
                .padding(18)
                .frame(maxWidth: .infinity)
                .cardStyle(borderColor: AppTheme.funTeal.opacity(0.4))

                howToEarnPointsCard

                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 6) {
                        Image(systemName: "star.circle.fill")
                            .font(.title3)
                            .foregroundStyle(AppTheme.warningYellow)
                        Text("Daily Duo Missions")
                            .font(AppTheme.funFont(.headline, weight: .heavy))
                    }
                    VStack(spacing: 10) {
                        Image(systemName: "sparkles")
                            .font(.title2)
                            .foregroundStyle(AppTheme.warningYellow.opacity(0.5))
                        Text("Missions generate automatically each day!")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                            .foregroundStyle(.secondary)
                        Text("Start studying to trigger your first daily missions. Complete Brand Blitz, lessons, or quizzes to unlock them.")
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.tertiary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
                .padding(16)
                .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))

                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 6) {
                        Image(systemName: "target")
                            .font(.title3)
                            .foregroundStyle(AppTheme.xpPurple)
                        Text("Weekly Duo Raids")
                            .font(AppTheme.funFont(.headline, weight: .heavy))
                    }
                    VStack(spacing: 10) {
                        Image(systemName: "scope")
                            .font(.title2)
                            .foregroundStyle(AppTheme.xpPurple.opacity(0.5))
                        Text("Co-op challenges refresh every Monday!")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                            .foregroundStyle(.secondary)
                        Text("5 shared challenges each week. Earn XP together, ace quizzes, and crush Brand Blitz rounds for bonus rewards.")
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.tertiary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
                .padding(16)
                .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))

                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 6) {
                        Image(systemName: "trophy.fill")
                            .font(.title3)
                            .foregroundStyle(AppTheme.warningYellow)
                        Text("Duo Milestones")
                            .font(AppTheme.funFont(.headline, weight: .heavy))
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(DuoMilestone.allCases, id: \.rawValue) { milestone in
                                VStack(spacing: 6) {
                                    ZStack {
                                        Circle()
                                            .fill(Color(.tertiarySystemFill))
                                            .frame(width: 50, height: 50)
                                        Image(systemName: milestone.icon)
                                            .font(.title3)
                                            .foregroundStyle(Color(.tertiaryLabel))
                                    }
                                    Text("\(milestone.requiredStreak)d")
                                        .font(AppTheme.funFont(.caption, weight: .heavy))
                                        .foregroundStyle(.tertiary)
                                    Text(milestone.rewardDescription)
                                        .font(.system(size: 9, weight: .medium, design: .rounded))
                                        .foregroundStyle(Color(.tertiaryLabel))
                                        .lineLimit(1)
                                }
                                .frame(width: 80)
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    .contentMargins(.horizontal, 0)

                    HStack(spacing: 6) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(.tertiary)
                        Text("\(3 - partner.sharedStreak) more day\(3 - partner.sharedStreak == 1 ? "" : "s") until your first milestone!")
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(16)
                .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))

                breakUpDuoButton(partnerName: partner.partnerName)
            }
        }
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

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    duoFeaturePreview(icon: "flame.fill", title: "Shared Streak", subtitle: "Both study daily", color: AppTheme.accentOrange)
                    duoFeaturePreview(icon: "star.circle.fill", title: "Daily Missions", subtitle: "3 bonus challenges", color: AppTheme.warningYellow)
                    duoFeaturePreview(icon: "target", title: "Weekly Raids", subtitle: "5 co-op quests", color: AppTheme.xpPurple)
                    duoFeaturePreview(icon: "trophy.fill", title: "Milestones", subtitle: "Streak rewards", color: AppTheme.warningYellow)
                }

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

    @ViewBuilder
    private func duoFeaturePreview(icon: String, title: String, subtitle: String, color: Color) -> some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            Text(title)
                .font(AppTheme.funFont(.caption, weight: .heavy))
            Text(subtitle)
                .font(AppTheme.funFont(.caption2, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(color.opacity(0.06))
        .clipShape(.rect(cornerRadius: 12))
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
        case "brand_blitz_complete": return AppTheme.accentOrange
        case "high_score": return AppTheme.warningYellow
        case "perfect_quiz": return AppTheme.funPink
        case "lesson_complete": return AppTheme.primaryBlue
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
