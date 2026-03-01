import SwiftUI

struct RanksView: View {
    let gameVM: GameViewModel
    @State private var selectedTab: RanksTab = .league

    private let mockLeaderboard: [LeaderboardEntry] = [
        LeaderboardEntry(id: "1", username: "PharmAce", avatarAnimal: "hare.fill", xpThisWeek: 1250, streak: 14, rank: 1),
        LeaderboardEntry(id: "2", username: "MedStudent99", avatarAnimal: "tortoise.fill", xpThisWeek: 980, streak: 7, rank: 2),
        LeaderboardEntry(id: "3", username: "DrugMaster", avatarAnimal: "bird.fill", xpThisWeek: 870, streak: 12, rank: 3),
        LeaderboardEntry(id: "4", username: "PillPro", avatarAnimal: "cat.fill", xpThisWeek: 750, streak: 5, rank: 4),
        LeaderboardEntry(id: "5", username: "RxQueen", avatarAnimal: "fish.fill", xpThisWeek: 680, streak: 9, rank: 5),
        LeaderboardEntry(id: "6", username: "NurseNinja", avatarAnimal: "ant.fill", xpThisWeek: 620, streak: 3, rank: 6),
        LeaderboardEntry(id: "7", username: "CardioKing", avatarAnimal: "ladybug.fill", xpThisWeek: 550, streak: 8, rank: 7),
        LeaderboardEntry(id: "8", username: "StudyBuddy", avatarAnimal: "hare.fill", xpThisWeek: 480, streak: 2, rank: 8),
    ]

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
                            Text("Week ends in 5d 12h 19m")
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
                                Text("#\(min(24, mockLeaderboard.count + 1))")
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
        }
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

            ForEach(mockLeaderboard) { entry in
                LeaderboardRow(entry: entry, isCurrentUser: false)
            }

            LeaderboardRow(
                entry: LeaderboardEntry(id: "me", username: "You", avatarAnimal: "person.fill", xpThisWeek: gameVM.totalXP, streak: gameVM.currentStreak, rank: mockLeaderboard.count + 1),
                isCurrentUser: true
            )
        }
    }

    @ViewBuilder
    private var friendsContent: some View {
        VStack(spacing: 16) {
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
                        Text("Boost your profession's monthly score")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "clock.fill")
                            .font(.caption)
                        Text("Ends in 4d 13h")
                            .font(.caption.bold())
                    }
                    .foregroundStyle(.secondary)
                }

                HStack(spacing: 0) {
                    PrizePodium(place: "1st", coins: 500, color: AppTheme.warningYellow, icon: "trophy.fill")
                    PrizePodium(place: "2nd", coins: 250, color: Color(.systemGray3), icon: "medal.fill")
                    PrizePodium(place: "3rd", coins: 100, color: Color(hex: "CD7F32"), icon: "star.fill")
                }

                Text("Eligibility: donate at least 100 coins total this month.")
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
                        Text("Pharmacy")
                            .font(.subheadline.bold())
                            .foregroundStyle(AppTheme.primaryBlue)
                    }
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
