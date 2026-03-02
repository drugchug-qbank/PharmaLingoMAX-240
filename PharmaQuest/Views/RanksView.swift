import SwiftUI
import Auth

struct RanksView: View {
    let gameVM: GameViewModel
    @Environment(SupabaseService.self) private var supabase
    @State private var selectedTab: RanksTab = .league
    @State private var leaderboard: [LeaderboardRecord] = []
    @State private var friends: [LeaderboardRecord] = []
    @State private var showAddFriend: Bool = false
    @State private var isLoadingLeaderboard: Bool = false

    enum RanksTab: String, CaseIterable {
        case league = "League"
        case friends = "Friends"
        case school = "School"
        case profession = "Profession"

        var icon: String {
            switch self {
            case .league: "trophy.fill"
            case .friends: "person.2.fill"
            case .school: "building.columns.fill"
            case .profession: "cross.case.fill"
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(spacing: 12) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Leaderboard")
                                .font(AppTheme.funFont(.largeTitle, weight: .heavy))
                                .foregroundStyle(.white)
                            HStack(spacing: 4) {
                                Image(systemName: "shield.fill")
                                    .foregroundStyle(Color(hex: "CD7F32"))
                                Text("Bronze League")
                                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundStyle(.white.opacity(0.7))
                        Text("Week ends in \(weekTimeRemaining)")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.15))
                    .clipShape(.rect(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.white.opacity(0.6), lineWidth: 3)
                    )
                    .padding(.horizontal)

                    HStack(spacing: 20) {
                        VStack(spacing: 2) {
                            Text("#\(userRank)")
                                .font(AppTheme.funFont(.title, weight: .heavy))
                                .foregroundStyle(AppTheme.warningYellow)
                            Text("League Rank")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.white.opacity(0.7))
                        }

                        Divider().frame(height: 40).background(.white.opacity(0.3))

                        VStack(spacing: 2) {
                            HStack(spacing: 4) {
                                Image(systemName: "bolt.fill")
                                    .foregroundStyle(AppTheme.warningYellow)
                                Text("\(gameVM.totalXP)")
                                    .font(AppTheme.funFont(.title2, weight: .heavy))
                                    .foregroundStyle(.white)
                            }
                            Text("This Week")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.white.opacity(0.7))
                        }

                        Divider().frame(height: 40).background(.white.opacity(0.3))

                        VStack(spacing: 2) {
                            HStack(spacing: 4) {
                                Image(systemName: "flame.fill")
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text("\(gameVM.currentStreak)")
                                    .font(AppTheme.funFont(.title2, weight: .heavy))
                                    .foregroundStyle(.white)
                            }
                            Text("Streak")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    .padding(.vertical, 14)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.1))
                    .clipShape(.rect(cornerRadius: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.white.opacity(0.6), lineWidth: 3)
                    )
                    .padding(.horizontal)
                }
                .padding(.vertical, 16)
                .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))

                ScrollView {
                    VStack(spacing: 16) {
                        HStack(spacing: 0) {
                            ForEach(RanksTab.allCases, id: \.self) { tab in
                                Button {
                                    withAnimation(.spring(duration: 0.25)) { selectedTab = tab }
                                } label: {
                                    VStack(spacing: 4) {
                                        Image(systemName: tab.icon)
                                            .font(.subheadline)
                                        Text(tab.rawValue)
                                            .font(AppTheme.funFont(.caption, weight: .heavy))
                                    }
                                    .foregroundStyle(selectedTab == tab ? AppTheme.primaryBlue : .secondary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(selectedTab == tab ? AppTheme.primaryBlue.opacity(0.1) : .clear)
                                    .clipShape(.rect(cornerRadius: 12))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(4)
                        .background(Color(.tertiarySystemFill))
                        .clipShape(.rect(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(AppTheme.primaryBlue.opacity(0.5), lineWidth: 3)
                        )

                        switch selectedTab {
                        case .league:
                            leagueContent
                        case .friends:
                            friendsContent
                        case .school:
                            schoolContent
                        case .profession:
                            professionContent
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
                .scrollIndicators(.hidden)
            }
            .background(Color(.systemGroupedBackground))
            .task {
                await loadLeaderboard()
            }
            .sheet(isPresented: $showAddFriend) {
                AddFriendSheet()
            }
        }
    }

    private var userRank: Int {
        if let idx = leaderboard.firstIndex(where: { $0.id == supabase.currentUser?.id.uuidString }) {
            return idx + 1
        }
        return leaderboard.count + 1
    }

    private var weekTimeRemaining: String {
        let calendar = Calendar.current
        let now = Date()
        guard let endOfWeek = calendar.nextDate(after: now, matching: DateComponents(hour: 0, weekday: 2), matchingPolicy: .nextTime) else {
            return "5d 12h"
        }
        let components = calendar.dateComponents([.day, .hour, .minute], from: now, to: endOfWeek)
        return "\(components.day ?? 0)d \(components.hour ?? 0)h \(components.minute ?? 0)m"
    }

    private func loadLeaderboard() async {
        isLoadingLeaderboard = true
        leaderboard = await supabase.fetchLeaderboard()
        friends = await supabase.fetchFriends()
        isLoadingLeaderboard = false
    }

    @ViewBuilder
    private var leagueContent: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "info.circle.fill")
                    .foregroundStyle(AppTheme.primaryBlue)
                Text("Top 10 get promoted! Bottom 10 get demoted.")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppTheme.primaryBlue.opacity(0.06))
            .clipShape(.rect(cornerRadius: 12))

            if isLoadingLeaderboard {
                ProgressView()
                    .padding(40)
            } else if leaderboard.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "trophy.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                    Text("Leaderboard Loading...")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                    Text("Complete quizzes to earn XP and climb the ranks!")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(32)
            } else {
                ForEach(Array(leaderboard.enumerated()), id: \.element.id) { index, entry in
                    let isCurrentUser = entry.id == supabase.currentUser?.id.uuidString
                    LeaderboardRow(
                        entry: LeaderboardEntry(id: entry.id, username: entry.username, avatarAnimal: entry.avatarAnimal, xpThisWeek: entry.weeklyXP, streak: entry.currentStreak, rank: index + 1),
                        isCurrentUser: isCurrentUser
                    )
                }
            }
        }
    }

    @ViewBuilder
    private var friendsContent: some View {
        VStack(spacing: 16) {
            if friends.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 44))
                        .foregroundStyle(AppTheme.primaryBlue.opacity(0.5))
                    Text("Add Friends")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                    Text("Connect with classmates to compare progress and compete!")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)

                    Button {
                        showAddFriend = true
                    } label: {
                        Text("Find Friends")
                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(AppTheme.primaryBlue)
                            .clipShape(Capsule())
                    }
                }
                .padding(24)
                .cardStyle()
            } else {
                HStack {
                    Text("Friends (\(friends.count))")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                    Spacer()
                    Button {
                        showAddFriend = true
                    } label: {
                        Image(systemName: "person.badge.plus")
                            .foregroundStyle(AppTheme.primaryBlue)
                    }
                }

                ForEach(Array(friends.enumerated()), id: \.element.id) { index, friend in
                    LeaderboardRow(
                        entry: LeaderboardEntry(id: friend.id, username: friend.username, avatarAnimal: friend.avatarAnimal, xpThisWeek: friend.weeklyXP, streak: friend.currentStreak, rank: index + 1),
                        isCurrentUser: false
                    )
                }
            }
        }
    }

    @ViewBuilder
    private var schoolContent: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "building.columns.fill", title: "School Rankings", color: AppTheme.primaryBlue)

                Text("Represent your school! All XP earned this month counts toward your school's ranking.")
                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                    .foregroundStyle(.secondary)

                VStack(spacing: 8) {
                    SchoolRankRow(rank: 1, name: "UNC Eshelman School of Pharmacy", xp: 45200, color: AppTheme.warningYellow)
                    SchoolRankRow(rank: 2, name: "University of Florida College of Pharmacy", xp: 38900, color: Color(.systemGray3))
                    SchoolRankRow(rank: 3, name: "Ohio State University College of Pharmacy", xp: 32100, color: Color(hex: "CD7F32"))
                }

                if gameVM.schoolName.isEmpty {
                    HStack {
                        Image(systemName: "building.columns.fill")
                            .foregroundStyle(AppTheme.primaryBlue)
                        Text("Select your school in Profile to participate")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .padding(10)
                    .background(AppTheme.primaryBlue.opacity(0.06))
                    .clipShape(.rect(cornerRadius: 10))
                } else {
                    HStack(spacing: 8) {
                        Image(systemName: "building.columns.fill")
                            .foregroundStyle(AppTheme.successGreen)
                        Text("Representing: \(gameVM.schoolName)")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.successGreen)
                    }
                    .padding(10)
                    .background(AppTheme.successGreen.opacity(0.08))
                    .clipShape(.rect(cornerRadius: 10))
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.3))
        }
    }

    @ViewBuilder
    private var professionContent: some View {
        ProfessionBattleView(gameVM: gameVM, supabase: supabase)
    }
}

struct ProfessionBattleView: View {
    let gameVM: GameViewModel
    let supabase: SupabaseService
    @State private var donateAmount: Double = 10
    @State private var isDonating: Bool = false

    private var maxDonation: Double {
        Double(max(gameVM.coins, 1))
    }

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Profession Battle")
                            .font(AppTheme.funFont(.headline, weight: .heavy))
                        Text("Donate coins to boost your profession!")
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }

                HStack(spacing: 0) {
                    PrizePodium(place: "1st", coins: 500, color: AppTheme.warningYellow, icon: "trophy.fill")
                    PrizePodium(place: "2nd", coins: 250, color: Color(.systemGray3), icon: "medal.fill")
                    PrizePodium(place: "3rd", coins: 100, color: Color(hex: "CD7F32"), icon: "star.fill")
                }

                Text("Donate at least 100 coins this month to qualify for prizes.")
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.secondary)

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Current Standings")
                        .font(AppTheme.funFont(.subheadline, weight: .heavy))

                    ForEach(Profession.allCases, id: \.self) { prof in
                        HStack(spacing: 10) {
                            Image(systemName: prof.iconName)
                                .font(.caption)
                                .foregroundStyle(prof == gameVM.selectedProfession ? AppTheme.primaryBlue : .secondary)
                                .frame(width: 20)
                            Text(prof.rawValue)
                                .font(AppTheme.funFont(.caption, weight: prof == gameVM.selectedProfession ? .heavy : .medium))
                                .foregroundStyle(prof == gameVM.selectedProfession ? AppTheme.primaryBlue : .primary)
                                .lineLimit(1)
                            Spacer()
                            Text("0 coins")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(prof == gameVM.selectedProfession ? AppTheme.primaryBlue.opacity(0.06) : .clear)
                        .clipShape(.rect(cornerRadius: 8))
                    }
                }

                Divider()

                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Your Contribution")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                        Spacer()
                        Text("You represent")
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                        Text(gameVM.selectedProfession.rawValue)
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.primaryBlue)
                    }

                    VStack(spacing: 6) {
                        HStack {
                            Text("Donate")
                                .font(AppTheme.funFont(.subheadline, weight: .medium))
                            Spacer()
                            HStack(spacing: 3) {
                                Image(systemName: "bitcoinsign.circle.fill")
                                    .foregroundStyle(AppTheme.accentOrange)
                                    .font(.caption)
                                Text("\(Int(donateAmount))")
                                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                    .foregroundStyle(AppTheme.accentOrange)
                            }
                        }

                        Slider(value: $donateAmount, in: 1...maxDonation, step: 1)
                            .tint(AppTheme.primaryBlue)

                        HStack {
                            Text("1")
                                .font(AppTheme.funFont(.caption2, weight: .medium))
                                .foregroundStyle(.secondary)
                            Spacer()
                            Text("Balance: \(gameVM.coins)")
                                .font(AppTheme.funFont(.caption2, weight: .medium))
                                .foregroundStyle(.secondary)
                            Spacer()
                            Text("\(Int(maxDonation))")
                                .font(AppTheme.funFont(.caption2, weight: .medium))
                                .foregroundStyle(.secondary)
                        }
                    }

                    Button {
                        isDonating = true
                        Task {
                            let success = await supabase.donateToProfession(amount: Int(donateAmount))
                            if success {
                                gameVM.coins = supabase.currentProfile?.coins ?? gameVM.coins
                                gameVM.save()
                            }
                            isDonating = false
                        }
                    } label: {
                        HStack {
                            if isDonating {
                                ProgressView()
                                    .tint(.white)
                            } else {
                                Image(systemName: "bitcoinsign.circle.fill")
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text("Donate \(Int(donateAmount)) Coins")
                                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                            }
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(gameVM.coins >= Int(donateAmount) ? AppTheme.primaryBlue : Color(.systemFill))
                        .clipShape(.rect(cornerRadius: 14))
                    }
                    .disabled(gameVM.coins < Int(donateAmount) || isDonating)
                }
            }
            .padding(16)
            .cardStyle()
        }
    }
}

struct LeaderboardRow: View {
    let entry: LeaderboardEntry
    let isCurrentUser: Bool

    var body: some View {
        HStack(spacing: 12) {
            Text("#\(entry.rank)")
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(rankColor)
                .frame(width: 30)

            AvatarDisplayView(
                animal: entry.avatarAnimal,
                eyes: "none",
                mouth: "none",
                accessory: "none",
                size: 38
            )

            VStack(alignment: .leading, spacing: 2) {
                Text(entry.username)
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(isCurrentUser ? AppTheme.primaryBlue : .primary)
                HStack(spacing: 4) {
                    Image(systemName: "flame.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.accentOrange)
                    Text("\(entry.streak)")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            Text("\(entry.xpThisWeek) XP")
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(isCurrentUser ? AppTheme.primaryBlue : .primary)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(isCurrentUser ? AppTheme.primaryBlue.opacity(0.06) : .clear)
        .clipShape(.rect(cornerRadius: 12))
    }

    private var rankColor: Color {
        switch entry.rank {
        case 1: AppTheme.warningYellow
        case 2: Color(.systemGray3)
        case 3: Color(hex: "CD7F32")
        default: .secondary
        }
    }
}

struct SchoolRankRow: View {
    let rank: Int
    let name: String
    let xp: Int
    let color: Color

    var body: some View {
        HStack(spacing: 10) {
            Text("#\(rank)")
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(color)
                .frame(width: 28)
            Text(name)
                .font(AppTheme.funFont(.subheadline, weight: .medium))
                .lineLimit(1)
            Spacer()
            Text("\(xp.formatted()) XP")
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .background(Color(.tertiarySystemFill))
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct PrizePodium: View {
    let place: String
    let coins: Int
    let color: Color
    let icon: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            Text(place)
                .font(AppTheme.funFont(.headline, weight: .heavy))
            HStack(spacing: 2) {
                Image(systemName: "bitcoinsign.circle.fill")
                    .font(.caption)
                    .foregroundStyle(AppTheme.accentOrange)
                Text("+\(coins)")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct AddFriendSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(SupabaseService.self) private var supabase
    @State private var searchText: String = ""
    @State private var searchResults: [LeaderboardRecord] = []
    @State private var isSearching: Bool = false
    @State private var sentRequest: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    TextField("Search by username...", text: $searchText)
                        .font(AppTheme.funFont(.body, weight: .medium))
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .onSubmit {
                            Task { await search() }
                        }
                }
                .padding(12)
                .background(Color(.secondarySystemGroupedBackground))
                .clipShape(.rect(cornerRadius: 14))
                .padding(.horizontal)

                if isSearching {
                    ProgressView()
                        .padding(40)
                } else if searchResults.isEmpty && !searchText.isEmpty {
                    VStack(spacing: 8) {
                        Image(systemName: "person.fill.questionmark")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                        Text("No users found")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .padding(40)
                } else {
                    List(searchResults, id: \.id) { user in
                        HStack(spacing: 12) {
                            AvatarDisplayView(
                                animal: user.avatarAnimal,
                                eyes: "none",
                                mouth: "none",
                                accessory: "none",
                                size: 40
                            )

                            VStack(alignment: .leading, spacing: 2) {
                                Text(user.username)
                                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                                Text("Lv.\(user.level) • \(user.profession)")
                                    .font(AppTheme.funFont(.caption, weight: .medium))
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Button {
                                Task {
                                    do {
                                        try await supabase.sendFriendRequest(toUsername: user.username)
                                        sentRequest = true
                                    } catch {
                                        errorMessage = error.localizedDescription
                                    }
                                }
                            } label: {
                                Text("Add")
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 6)
                                    .background(AppTheme.primaryBlue)
                                    .clipShape(Capsule())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .listStyle(.plain)
                }

                Spacer()
            }
            .padding(.top, 16)
            .navigationTitle("Find Friends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .alert("Request Sent!", isPresented: $sentRequest) {
                Button("OK") {}
            } message: {
                Text("Your friend request has been sent.")
            }
        }
    }

    private func search() async {
        guard !searchText.isEmpty else { return }
        isSearching = true
        searchResults = await supabase.searchUsers(query: searchText)
        isSearching = false
    }
}
