import SwiftUI
import Combine
import Auth

struct ProfileView: View {
    let gameVM: GameViewModel
    @Environment(SupabaseService.self) private var supabase
    @State private var showEditProfile: Bool = false
    @State private var showAvatarCustomization: Bool = false
    @State private var showSignOutAlert: Bool = false
    @State private var showAddFriend: Bool = false
    @State private var streakCountdown: TimeInterval = 0
    @State private var friends: [LeaderboardRecord] = []
    @State private var pendingRequests: [PendingFriendInfo] = []
    @State private var duoService = DuoQuestService.shared
    @State private var isLoadingFriends: Bool = false
    @State private var showDuoDetail: Bool = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private var streakCountdownString: String {
        let hours = Int(streakCountdown) / 3600
        let minutes = (Int(streakCountdown) % 3600) / 60
        let seconds = Int(streakCountdown) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    Button {
                        showAvatarCustomization = true
                    } label: {
                        ZStack(alignment: .bottomTrailing) {
                            AvatarDisplayView(
                                animal: gameVM.avatarAnimal,
                                eyes: gameVM.avatarEyes,
                                mouth: gameVM.avatarMouth,
                                accessory: gameVM.avatarAccessory,
                                bodyColor: gameVM.avatarBodyColor,
                                backgroundColor: gameVM.avatarBgColor,
                                size: 90
                            )

                            Image(systemName: "pencil.circle.fill")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .background(Circle().fill(AppTheme.primaryBlue).frame(width: 26, height: 26))
                        }
                    }
                    .buttonStyle(.plain)

                    VStack(spacing: 4) {
                        HStack(spacing: 6) {
                            Text(gameVM.username)
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(.white)

                            Text("Lv.\(gameVM.level)")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.darkBlue)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(AppTheme.warningYellow)
                                .clipShape(Capsule())
                        }

                        Text("Level \(gameVM.level) • \(gameVM.totalXP) XP")
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))

                ScrollView {
                    VStack(spacing: 16) {
                        NavigationLink {
                            StatsDetailView(gameVM: gameVM)
                        } label: {
                            HStack(spacing: 0) {
                                ProfileStatItem(icon: "flame.fill", value: "\(gameVM.currentStreak)", label: "Streak", color: AppTheme.accentOrange)
                                ProfileStatItem(icon: "target", value: "\(Int(gameVM.accuracy * 100))%", label: "Accuracy", color: AppTheme.primaryBlue)
                                ProfileStatItem(icon: "book.closed.fill", value: "\(gameVM.lessonsCompleted)", label: "Lessons", color: AppTheme.successGreen)
                                ProfileStatItem(icon: "sparkles", value: "\(gameVM.clinicalAuraPoints)", label: "Aura", color: gameVM.clinicalAuraPoints >= 0 ? AppTheme.primaryBlue : AppTheme.heartRed)
                            }
                            .padding(16)
                            .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.5))
                            .overlay(alignment: .topTrailing) {
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(AppTheme.primaryBlue)
                                    .padding(12)
                            }
                        }
                        .buttonStyle(.plain)

                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                FunSectionHeader(icon: "flame.fill", title: "Streak Status", color: AppTheme.accentOrange)

                                Spacer()

                                if gameVM.isStreakSafeToday {
                                    HStack(spacing: 4) {
                                        Image(systemName: "checkmark.shield.fill")
                                            .font(.caption)
                                        Text("Streak is Safe!")
                                            .font(AppTheme.funFont(.caption, weight: .heavy))
                                    }
                                    .foregroundStyle(AppTheme.successGreen)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(AppTheme.successGreen.opacity(0.12))
                                    .clipShape(Capsule())
                                } else if gameVM.currentStreak > 0 {
                                    HStack(spacing: 4) {
                                        Image(systemName: "exclamationmark.triangle.fill")
                                            .font(.caption)
                                        Text("Breaks in \(streakCountdownString)")
                                            .font(AppTheme.funFont(.caption, weight: .heavy))
                                            .monospacedDigit()
                                    }
                                    .foregroundStyle(AppTheme.accentOrange)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(AppTheme.accentOrange.opacity(0.12))
                                    .clipShape(Capsule())
                                }
                            }

                            if gameVM.streakSaves > 0 {
                                HStack(spacing: 4) {
                                    Image(systemName: "shield.checkered")
                                        .font(.caption)
                                    Text("\(gameVM.streakSaves) save\(gameVM.streakSaves == 1 ? "" : "s")")
                                        .font(AppTheme.funFont(.caption, weight: .heavy))
                                }
                                .foregroundStyle(AppTheme.xpPurple)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(AppTheme.xpPurple.opacity(0.1))
                                .clipShape(Capsule())
                            }

                            HStack(spacing: 12) {
                                ZStack {
                                    Circle()
                                        .fill(gameVM.currentStreak > 0 ? AppTheme.accentOrange.opacity(0.15) : Color(.tertiarySystemFill))
                                        .frame(width: 44, height: 44)
                                    Image(systemName: gameVM.currentStreak > 0 ? "flame.fill" : "flame")
                                        .font(.title3)
                                        .foregroundStyle(gameVM.currentStreak > 0 ? AppTheme.accentOrange : .secondary)
                                }

                                VStack(alignment: .leading, spacing: 2) {
                                    Text(gameVM.currentStreak > 0 ? "Streak active!" : "Start your streak today!")
                                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                                    Text("\(gameVM.currentStreak) day\(gameVM.currentStreak == 1 ? "" : "s") in a row")
                                        .font(AppTheme.funFont(.caption, weight: .medium))
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()

                                if gameVM.currentStreak > 0 {
                                    Text("\(gameVM.currentStreak)")
                                        .font(AppTheme.funFont(.title, weight: .heavy))
                                        .foregroundStyle(AppTheme.accentOrange)
                                }
                            }
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.accentOrange.opacity(gameVM.currentStreak > 0 ? 0.3 : 0.5))
                        .onReceive(timer) { _ in
                            streakCountdown = gameVM.timeUntilStreakBreaks
                        }
                        .onAppear {
                            streakCountdown = gameVM.timeUntilStreakBreaks
                        }

                        VStack(alignment: .leading, spacing: 12) {
                            Text("PROFESSION")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.xpPurple)

                            Button {
                                showEditProfile = true
                            } label: {
                                HStack(spacing: 12) {
                                    Image(gameVM.selectedProfession.badgeImageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 54, height: 54)

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(gameVM.selectedProfession.rawValue)
                                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                                        Text("Tap to change")
                                            .font(AppTheme.funFont(.caption, weight: .medium))
                                            .foregroundStyle(.secondary)
                                    }

                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundStyle(AppTheme.xpPurple)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.5))

                        VStack(alignment: .leading, spacing: 12) {
                            Text("YOUR SCHOOL")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.primaryBlue)

                            Button {
                                showEditProfile = true
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: "building.columns.fill")
                                        .font(.title3)
                                        .foregroundStyle(AppTheme.primaryBlue)

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(gameVM.schoolName.isEmpty ? "Select your school" : gameVM.schoolName)
                                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                                            .foregroundStyle(gameVM.schoolName.isEmpty ? .secondary : .primary)
                                    }

                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundStyle(AppTheme.primaryBlue)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.5))

                        duoPartnerSection

                        profileFriendsSection

                        NavigationLink {
                            AchievementsView(gameVM: gameVM)
                        } label: {
                            AchievementsPreviewCard(gameVM: gameVM)
                        }
                        .buttonStyle(.plain)

                        VStack(alignment: .leading, spacing: 12) {
                            Text("DEVELOPER")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(.orange)

                            Toggle(isOn: Bindable(gameVM).devModeUnlockAll) {
                                HStack(spacing: 12) {
                                    Image(systemName: "lock.open.fill")
                                        .font(.title3)
                                        .foregroundStyle(.orange)

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Unlock All Quizzes")
                                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                                        Text("Bypass progression for testing")
                                            .font(AppTheme.funFont(.caption, weight: .medium))
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                            .tint(.orange)
                        }
                        .padding(16)
                        .cardStyle(borderColor: Color.orange.opacity(0.5))

                        Button {
                            showSignOutAlert = true
                        } label: {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                Text("Sign Out")
                            }
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(.tertiarySystemFill))
                            .clipShape(.rect(cornerRadius: 14))
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
                .scrollIndicators(.hidden)
            }
            .background(Color(.systemGroupedBackground))
            .task {
                await loadFriendsData()
            }
            .sheet(isPresented: $showEditProfile) {
                EditProfileSheet(gameVM: gameVM)
            }
            .sheet(isPresented: $showAvatarCustomization) {
                AvatarCustomizationView(gameVM: gameVM)
            }
            .sheet(isPresented: $showAddFriend) {
                AddFriendSheet(onRequestSent: {
                    Task { pendingRequests = await supabase.fetchPendingRequests() }
                })
            }
            .sheet(isPresented: $showDuoDetail) {
                if let partner = duoService.currentPartnership {
                    DuoPartnerDetailSheet(partner: partner, weeklyQuests: duoService.weeklyQuests, gameVM: gameVM)
                }
            }
            .navigationDestination(for: String.self) { userId in
                let name = friends.first(where: { $0.id == userId })?.username ?? "User"
                FriendProfileView(friendId: userId, friendName: name, gameVM: gameVM)
            }
            .refreshable {
                await loadFriendsData()
            }
            .alert("Sign Out", isPresented: $showSignOutAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Sign Out", role: .destructive) {
                    Task {
                        try? await supabase.signOut()
                        gameVM.resetToDefaults()
                    }
                }
            } message: {
                Text("Are you sure you want to sign out?")
            }
        }
    }

    private func loadFriendsData() async {
        isLoadingFriends = true
        async let fr = supabase.fetchFriends()
        async let pr = supabase.fetchPendingRequests()
        friends = await fr
        pendingRequests = await pr
        await duoService.loadDuoData()
        isLoadingFriends = false
    }

    @ViewBuilder
    private var duoPartnerSection: some View {
        if let partner = duoService.currentPartnership {
            VStack(alignment: .leading, spacing: 12) {
                Text("DUO PARTNER")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(AppTheme.funTeal)

                Button {
                    showDuoDetail = true
                } label: {
                    HStack(spacing: 12) {
                        AvatarDisplayView(
                            animal: partner.partnerAvatar.animal,
                            eyes: partner.partnerAvatar.eyes,
                            mouth: partner.partnerAvatar.mouth,
                            accessory: partner.partnerAvatar.accessory,
                            bodyColor: partner.partnerAvatar.bodyColor,
                            backgroundColor: partner.partnerAvatar.bgColor,
                            size: 44
                        )
                        VStack(alignment: .leading, spacing: 3) {
                            Text(partner.partnerName)
                                .font(AppTheme.funFont(.subheadline, weight: .bold))
                            HStack(spacing: 10) {
                                HStack(spacing: 3) {
                                    Image(systemName: "link.circle.fill")
                                        .font(.caption2)
                                        .foregroundStyle(AppTheme.funTeal)
                                    Text("\(partner.sharedStreak) duo streak")
                                        .font(AppTheme.funFont(.caption, weight: .bold))
                                        .foregroundStyle(.secondary)
                                }
                                HStack(spacing: 3) {
                                    Image(systemName: "checkmark.seal.fill")
                                        .font(.caption2)
                                        .foregroundStyle(AppTheme.successGreen)
                                    Text("\(duoService.weeklyQuests.filter(\.isComplete).count)/\(duoService.weeklyQuests.count) quests")
                                        .font(AppTheme.funFont(.caption, weight: .bold))
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(AppTheme.funTeal)
                    }
                }
                .buttonStyle(.plain)
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.funTeal.opacity(0.5))
        } else if duoService.hasPendingDuoInvite, let sender = duoService.pendingInviteFrom {
            VStack(alignment: .leading, spacing: 12) {
                Text("DUO PARTNER")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(AppTheme.accentOrange)

                HStack(spacing: 10) {
                    AvatarDisplayView(
                        animal: sender.avatarAnimal,
                        eyes: sender.avatarEyes,
                        mouth: sender.avatarMouth,
                        accessory: sender.avatarAccessory,
                        bodyColor: sender.avatarBodyColor,
                        backgroundColor: sender.avatarBgColor,
                        size: 36
                    )
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 4) {
                            Image(systemName: "bell.badge.fill")
                                .font(.caption2)
                                .foregroundStyle(AppTheme.accentOrange)
                            Text("Duo invite from \(sender.username)")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                        }
                    }
                    Spacer()
                    Button {
                        Task {
                            if let pId = duoService.pendingPartnershipId {
                                _ = await duoService.acceptDuoInvite(partnershipId: pId)
                                await loadFriendsData()
                            }
                        }
                    } label: {
                        Text("Accept")
                            .font(AppTheme.funFont(.caption2, weight: .heavy))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(AppTheme.successGreen)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.accentOrange.opacity(0.5))
        }
    }

    @ViewBuilder
    private var profileFriendsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("YOUR FRIENDS")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(AppTheme.funTeal)
                Spacer()
                Button {
                    showAddFriend = true
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "person.badge.plus")
                            .font(.caption)
                        Text("Add")
                            .font(AppTheme.funFont(.caption2, weight: .heavy))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(AppTheme.funTeal)
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }

            if !pendingRequests.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "bell.badge.fill")
                            .font(.caption)
                            .foregroundStyle(AppTheme.accentOrange)
                        Text("Pending Requests (\(pendingRequests.count))")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.accentOrange)
                    }

                    ForEach(pendingRequests) { request in
                        HStack(spacing: 10) {
                            AvatarDisplayView(
                                animal: request.avatarAnimal,
                                eyes: request.avatarEyes,
                                mouth: request.avatarMouth,
                                accessory: request.avatarAccessory,
                                bodyColor: request.avatarBodyColor,
                                backgroundColor: request.avatarBgColor,
                                size: 34
                            )
                            VStack(alignment: .leading, spacing: 1) {
                                Text(request.username)
                                    .font(AppTheme.funFont(.caption, weight: .bold))
                                Text("Lv.\(request.level)")
                                    .font(AppTheme.funFont(.caption2, weight: .medium))
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Button {
                                Task {
                                    try? await supabase.acceptFriendRequest(requestId: request.requestId)
                                    await loadFriendsData()
                                }
                            } label: {
                                Image(systemName: "checkmark")
                                    .font(.caption2.bold())
                                    .foregroundStyle(.white)
                                    .frame(width: 28, height: 28)
                                    .background(AppTheme.successGreen)
                                    .clipShape(Circle())
                            }
                            .buttonStyle(.plain)
                            Button {
                                Task {
                                    try? await supabase.declineFriendRequest(requestId: request.requestId)
                                    pendingRequests.removeAll { $0.requestId == request.requestId }
                                }
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.caption2.bold())
                                    .foregroundStyle(.white)
                                    .frame(width: 28, height: 28)
                                    .background(Color(.systemGray3))
                                    .clipShape(Circle())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(10)
                .background(AppTheme.accentOrange.opacity(0.04))
                .clipShape(.rect(cornerRadius: 10))
            }

            if isLoadingFriends {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
            } else if friends.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "person.2.fill")
                        .font(.title2)
                        .foregroundStyle(AppTheme.funTeal.opacity(0.4))
                    Text("No friends yet")
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                        .foregroundStyle(.secondary)
                    Text("Add classmates to compare progress!")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.tertiary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            } else {
                ForEach(friends.prefix(5), id: \.id) { friend in
                    NavigationLink(value: friend.id) {
                        HStack(spacing: 10) {
                            AvatarDisplayView(
                                animal: friend.avatarAnimal,
                                eyes: friend.avatarEyes,
                                mouth: friend.avatarMouth,
                                accessory: friend.avatarAccessory,
                                bodyColor: friend.avatarBodyColor,
                                backgroundColor: friend.avatarBgColor,
                                size: 36
                            )
                            VStack(alignment: .leading, spacing: 2) {
                                Text(friend.username)
                                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                                HStack(spacing: 8) {
                                    HStack(spacing: 3) {
                                        Image(systemName: "flame.fill")
                                            .font(.caption2)
                                            .foregroundStyle(AppTheme.accentOrange)
                                        Text("\(friend.currentStreak)")
                                            .font(AppTheme.funFont(.caption2, weight: .bold))
                                            .foregroundStyle(.secondary)
                                    }
                                    HStack(spacing: 3) {
                                        Image(systemName: "star.fill")
                                            .font(.caption2)
                                            .foregroundStyle(AppTheme.warningYellow)
                                        Text("Lv.\(friend.level)")
                                            .font(AppTheme.funFont(.caption2, weight: .bold))
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption2)
                                .foregroundStyle(.tertiary)
                        }
                        .padding(.vertical, 4)
                    }
                    .buttonStyle(.plain)
                }

                if friends.count > 5 {
                    HStack {
                        Spacer()
                        Text("View all \(friends.count) friends on Ranks")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(AppTheme.funTeal)
                        Image(systemName: "arrow.right")
                            .font(.caption2)
                            .foregroundStyle(AppTheme.funTeal)
                        Spacer()
                    }
                    .padding(.top, 4)
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.funTeal.opacity(0.5))
    }
}

struct ProfileStatItem: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            Text(value)
                .font(AppTheme.funFont(.headline, weight: .heavy))
            Text(label)
                .font(AppTheme.funFont(.caption, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct AchievementBadge: View {
    let icon: String
    let title: String
    let subtitle: String
    let isUnlocked: Bool

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .fill(isUnlocked ? AppTheme.warningYellow.opacity(0.15) : Color(.tertiarySystemFill))
                    .frame(width: 50, height: 50)
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(isUnlocked ? AppTheme.warningYellow : Color(.tertiaryLabel))
            }
            Text(title)
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(isUnlocked ? .primary : .secondary)
            Text(subtitle)
                .font(AppTheme.funFont(.caption2, weight: .medium))
                .foregroundStyle(.secondary)
        }
    }
}

struct AchievementsPreviewCard: View {
    let gameVM: GameViewModel

    private var totalStars: Int {
        gameVM.subsectionStars.values.reduce(0, +)
    }

    private var previewAchievements: [(String, AchievementTier?, String)] {
        let catalog = AchievementCatalog.tieredAchievements
        return catalog.prefix(6).map { a in
            let value: Int
            switch a.id {
            case "streak_master": value = gameVM.currentStreak
            case "scholar": value = gameVM.lessonsCompleted
            case "xp_collector": value = gameVM.totalXP
            case "question_warrior": value = gameVM.questionsAnswered
            case "accuracy_ace": value = gameVM.questionsCorrect
            case "aura_sage": value = gameVM.clinicalAuraPoints
            default: value = 0
            }
            let tier = a.currentTier(value: value)
            let icon = a.icons(for: tier ?? .bronze)
            return (icon, tier, a.title)
        }
    }

    private var unlockedCount: Int {
        var count = 0
        for a in AchievementCatalog.tieredAchievements {
            let value: Int
            switch a.id {
            case "streak_master": value = gameVM.currentStreak
            case "scholar": value = gameVM.lessonsCompleted
            case "xp_collector": value = gameVM.totalXP
            case "question_warrior": value = gameVM.questionsAnswered
            case "accuracy_ace": value = gameVM.questionsCorrect
            case "aura_sage": value = gameVM.clinicalAuraPoints
            case "star_hunter": value = totalStars
            case "combo_king": value = gameVM.consecutiveCorrect
            case "coin_tycoon": value = gameVM.coins
            case "module_conqueror": value = gameVM.modules.filter { mod in mod.subsections.allSatisfy { gameVM.completedSubsections.contains($0.id) } }.count
            default: value = 0
            }
            for level in a.levels where value >= level.threshold {
                count += 1
            }
        }
        return count
    }

    private var totalCount: Int {
        AchievementCatalog.tieredAchievements.reduce(0) { $0 + $1.levels.count } + AchievementCatalog.specialAchievements.count
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("ACHIEVEMENTS")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(AppTheme.warningYellow)

                Spacer()

                HStack(spacing: 4) {
                    Text("\(unlockedCount)/\(totalCount)")
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(AppTheme.warningYellow)
                    Image(systemName: "chevron.right")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.warningYellow)
                }
            }

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(Array(previewAchievements.enumerated()), id: \.offset) { _, item in
                    let (icon, tier, title) = item
                    let isUnlocked = tier != nil
                    let color = tier?.color ?? Color(.tertiaryLabel)

                    VStack(spacing: 6) {
                        ZStack {
                            Circle()
                                .fill(isUnlocked ? color.opacity(0.15) : Color(.tertiarySystemFill))
                                .frame(width: 50, height: 50)
                            if isUnlocked {
                                Circle()
                                    .stroke(color.opacity(0.4), lineWidth: 1.5)
                                    .frame(width: 50, height: 50)
                            }
                            Image(systemName: icon)
                                .font(.title3)
                                .foregroundStyle(isUnlocked ? color : Color(.tertiaryLabel))
                        }
                        Text(title)
                            .font(AppTheme.funFont(.caption2, weight: .heavy))
                            .foregroundStyle(isUnlocked ? .primary : .secondary)
                            .lineLimit(1)
                        if let t = tier {
                            Text(t.label)
                                .font(AppTheme.funFont(.caption2, weight: .bold))
                                .foregroundStyle(t.color)
                        } else {
                            Text("Locked")
                                .font(AppTheme.funFont(.caption2, weight: .bold))
                                .foregroundStyle(.tertiary)
                        }
                    }
                }
            }

            HStack {
                Spacer()
                Text("View All Achievements")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(AppTheme.warningYellow)
                Image(systemName: "arrow.right")
                    .font(.caption2)
                    .foregroundStyle(AppTheme.warningYellow)
                Spacer()
            }
            .padding(.top, 4)
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.4))
    }
}

struct EditProfileSheet: View {
    @Environment(\.dismiss) private var dismiss
    let gameVM: GameViewModel
    @State private var profession: Profession
    @State private var schoolName: String
    @State private var username: String
    @State private var showSchoolPicker: Bool = false
    @State private var schoolSearchText: String = ""

    init(gameVM: GameViewModel) {
        self.gameVM = gameVM
        _profession = State(initialValue: gameVM.selectedProfession)
        _schoolName = State(initialValue: gameVM.schoolName)
        _username = State(initialValue: gameVM.username)
    }

    private var filteredSchools: [String] {
        if schoolSearchText.isEmpty { return UniversityData.schools }
        return UniversityData.schools.filter { $0.localizedStandardContains(schoolSearchText) }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Display Name") {
                    TextField("Username", text: $username)
                        .font(AppTheme.funFont(.body, weight: .medium))
                }

                Section("Profession") {
                    ForEach(Profession.allCases, id: \.self) { prof in
                        Button {
                            profession = prof
                        } label: {
                            HStack {
                                Image(prof.badgeImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 28, height: 28)
                                Text(prof.rawValue)
                                    .font(AppTheme.funFont(.body, weight: .medium))
                                    .foregroundStyle(.primary)
                                Spacer()
                                if profession == prof {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(AppTheme.primaryBlue)
                                }
                            }
                        }
                    }
                }

                Section("School") {
                    Button {
                        showSchoolPicker = true
                    } label: {
                        HStack {
                            Image(systemName: "building.columns.fill")
                                .foregroundStyle(AppTheme.primaryBlue)
                            Text(schoolName.isEmpty ? "Select your school" : schoolName)
                                .font(AppTheme.funFont(.body, weight: .medium))
                                .foregroundStyle(schoolName.isEmpty ? .secondary : .primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        gameVM.username = username
                        gameVM.selectedProfession = profession
                        gameVM.schoolName = schoolName
                        gameVM.save()
                        Task {
                            if let updated = await SupabaseService.shared.saveProfileInfo(
                                username: username,
                                profession: profession.rawValue,
                                school: schoolName
                            ) {
                                gameVM.hydrateFromProfile(updated)
                            }
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .sheet(isPresented: $showSchoolPicker) {
                SchoolPickerView(selectedSchool: $schoolName, searchText: $schoolSearchText)
            }
        }
    }
}

struct SchoolPickerView: View {
    @Binding var selectedSchool: String
    @Binding var searchText: String
    @Environment(\.dismiss) private var dismiss

    private var filteredSchools: [String] {
        if searchText.isEmpty { return UniversityData.schools }
        return UniversityData.schools.filter { $0.localizedStandardContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            List(filteredSchools, id: \.self) { school in
                Button {
                    selectedSchool = school
                    dismiss()
                } label: {
                    HStack {
                        Text(school)
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.primary)
                        Spacer()
                        if selectedSchool == school {
                            Image(systemName: "checkmark")
                                .foregroundStyle(AppTheme.primaryBlue)
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search schools...")
            .navigationTitle("Select School")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
