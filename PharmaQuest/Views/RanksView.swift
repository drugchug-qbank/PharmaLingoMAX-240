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
            ScrollView {
                VStack(spacing: 0) {
                    VStack(spacing: 12) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Leaderboard")
                                    .font(.largeTitle.bold())
                                    .foregroundStyle(.white)
                                HStack(spacing: 4) {
                                    Image(systemName: "shield.fill")
                                        .foregroundStyle(Color(hex: "CD7F32"))
                                    Text("Bronze League")
                                        .font(.subheadline)
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
                                .font(.subheadline.bold())
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.15))
                        .clipShape(.rect(cornerRadius: 12))
                        .padding(.horizontal)

                        HStack(spacing: 20) {
                            VStack(spacing: 2) {
                                Text("#\(userRank)")
                                    .font(.title.bold())
                                    .foregroundStyle(AppTheme.warningYellow)
                                Text("League Rank")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.7))
                            }

                            Divider().frame(height: 40).background(.white.opacity(0.3))

                            VStack(spacing: 2) {
                                HStack(spacing: 4) {
                                    Image(systemName: "bolt.fill")
                                        .foregroundStyle(AppTheme.warningYellow)
                                    Text("\(gameVM.totalXP)")
                                        .font(.title2.bold())
                                        .foregroundStyle(.white)
                                }
                                Text("This Week")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.7))
                            }

                            Divider().frame(height: 40).background(.white.opacity(0.3))

                            VStack(spacing: 2) {
                                HStack(spacing: 4) {
                                    Image(systemName: "flame.fill")
                                        .foregroundStyle(AppTheme.accentOrange)
                                    Text("\(gameVM.currentStreak)")
                                        .font(.title2.bold())
                                        .foregroundStyle(.white)
                                }
                                Text("Streak")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                        }
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.1))
                        .clipShape(.rect(cornerRadius: 14))
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 16)
                    .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))

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
                                            .font(.caption.bold())
                                    }
                                    .foregroundStyle(selectedTab == tab ? AppTheme.primaryBlue : .secondary)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(selectedTab == tab ? AppTheme.primaryBlue.opacity(0.1) : .clear)
                                    .clipShape(.rect(cornerRadius: 10))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(4)
                        .background(Color(.tertiarySystemFill))
                        .clipShape(.rect(cornerRadius: 14))

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
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
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
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppTheme.primaryBlue.opacity(0.05))
            .clipShape(.rect(cornerRadius: 10))

            if isLoadingLeaderboard {
                ProgressView()
                    .padding(40)
            } else if leaderboard.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "trophy.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                    Text("Leaderboard Loading...")
                        .font(.headline)
                    Text("Complete quizzes to earn XP and climb the ranks!")
                        .font(.subheadline)
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
                        .font(.largeTitle)
                        .foregroundStyle(AppTheme.primaryBlue.opacity(0.5))
                    Text("Add Friends")
                        .font(.headline)
                    Text("Connect with classmates to compare progress and compete!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)

                    Button {
                        showAddFriend = true
                    } label: {
                        Text("Find Friends")
                            .font(.subheadline.bold())
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
                        .font(.headline)
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
                Text("School Rankings")
                    .font(.headline)
                Text("Represent your school! All XP earned this month counts toward your school's ranking.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                VStack(spacing: 8) {
                    SchoolRankRow(rank: 1, name: "UNC Eshelman School of Pharmacy", xp: 45200, color: AppTheme.warningYellow)
                    SchoolRankRow(rank: 2, name: "University of Florida College of Pharmacy", xp: 38900, color: Color(.systemGray3))
                    SchoolRankRow(rank: 3, name: "Ohio State University", xp: 32100, color: Color(hex: "CD7F32"))
                }

                if gameVM.schoolName.isEmpty {
                    HStack {
                        Image(systemName: "building.columns.fill")
                            .foregroundStyle(AppTheme.primaryBlue)
                        Text("Select your school in Profile to participate")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(10)
                    .background(AppTheme.primaryBlue.opacity(0.05))
                    .clipShape(.rect(cornerRadius: 8))
                }
            }
            .padding(16)
            .cardStyle()
        }
    }

    @ViewBuilder
    private var professionContent: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Profession Battle")
                            .font(.headline.bold())
                        Text("Donate coins to boost your profession!")
                            .font(.caption)
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
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Contribution")
                        .font(.subheadline.bold())
                    HStack {
                        Text("You represent")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(gameVM.selectedProfession.rawValue)
                            .font(.subheadline.bold())
                            .foregroundStyle(AppTheme.primaryBlue)
                    }

                    Button {
                        Task {
                            let success = await supabase.donateToProfession(amount: 10)
                            if success {
                                gameVM.coins = supabase.currentProfile?.coins ?? gameVM.coins
                                gameVM.save()
                            }
                        }
                    } label: {
                        HStack {
                            Image(systemName: "bitcoinsign.circle.fill")
                                .foregroundStyle(AppTheme.accentOrange)
                            Text("Donate 10 Coins")
                                .font(.subheadline.bold())
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(gameVM.coins >= 10 ? AppTheme.primaryBlue : Color(.systemFill))
                        .clipShape(.rect(cornerRadius: 12))
                    }
                    .disabled(gameVM.coins < 10)
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
                .font(.subheadline.bold())
                .foregroundStyle(rankColor)
                .frame(width: 30)

            ZStack {
                Circle()
                    .fill(isCurrentUser ? AppTheme.primaryBlue.opacity(0.15) : Color(.tertiarySystemFill))
                    .frame(width: 36, height: 36)
                Image(systemName: entry.avatarAnimal)
                    .font(.subheadline)
                    .foregroundStyle(isCurrentUser ? AppTheme.primaryBlue : .secondary)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(entry.username)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(isCurrentUser ? AppTheme.primaryBlue : .primary)
                HStack(spacing: 4) {
                    Image(systemName: "flame.fill")
                        .font(.caption2)
                        .foregroundStyle(AppTheme.accentOrange)
                    Text("\(entry.streak)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            Text("\(entry.xpThisWeek) XP")
                .font(.subheadline.bold())
                .foregroundStyle(isCurrentUser ? AppTheme.primaryBlue : .primary)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(isCurrentUser ? AppTheme.primaryBlue.opacity(0.05) : .clear)
        .clipShape(.rect(cornerRadius: 10))
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
                .font(.subheadline.bold())
                .foregroundStyle(color)
                .frame(width: 28)
            Text(name)
                .font(.subheadline)
                .lineLimit(1)
            Spacer()
            Text("\(xp) XP")
                .font(.caption.bold())
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .background(Color(.tertiarySystemFill))
        .clipShape(.rect(cornerRadius: 8))
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
                .font(.headline.bold())
            HStack(spacing: 2) {
                Image(systemName: "bitcoinsign.circle.fill")
                    .font(.caption)
                    .foregroundStyle(AppTheme.accentOrange)
                Text("+\(coins)")
                    .font(.caption.bold())
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
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .onSubmit {
                            Task { await search() }
                        }
                }
                .padding(12)
                .background(Color(.secondarySystemGroupedBackground))
                .clipShape(.rect(cornerRadius: 12))
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
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(40)
                } else {
                    List(searchResults, id: \.id) { user in
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(Color(.tertiarySystemFill))
                                    .frame(width: 40, height: 40)
                                Image(systemName: user.avatarAnimal)
                                    .foregroundStyle(.secondary)
                            }

                            VStack(alignment: .leading, spacing: 2) {
                                Text(user.username)
                                    .font(.subheadline.weight(.medium))
                                Text("Lv.\(user.level) • \(user.profession)")
                                    .font(.caption)
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
                                    .font(.caption.bold())
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
