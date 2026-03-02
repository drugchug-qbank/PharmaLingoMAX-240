import SwiftUI

struct FriendProfileView: View {
    let friendId: String
    let friendName: String
    let gameVM: GameViewModel
    @Environment(SupabaseService.self) private var supabase
    @Environment(\.dismiss) private var dismiss
    @State private var friendProfile: FriendDetailProfile?
    @State private var isLoading: Bool = true
    @State private var showRemoveAlert: Bool = false

    var body: some View {
        ScrollView {
            if isLoading {
                ProgressView()
                    .padding(60)
            } else if let friend = friendProfile {
                VStack(spacing: 20) {
                    VStack(spacing: 12) {
                        AvatarDisplayView(
                            animal: friend.avatarAnimal,
                            eyes: friend.avatarEyes,
                            mouth: friend.avatarMouth,
                            accessory: friend.avatarAccessory,
                            size: 100
                        )

                        VStack(spacing: 4) {
                            HStack(spacing: 6) {
                                Text(friend.username)
                                    .font(AppTheme.funFont(.title2, weight: .heavy))
                                Text("Lv.\(friend.level)")
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                                    .foregroundStyle(AppTheme.darkBlue)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 3)
                                    .background(AppTheme.warningYellow)
                                    .clipShape(Capsule())
                            }

                            if !friend.profession.isEmpty {
                                Text(friend.profession)
                                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                                    .foregroundStyle(.secondary)
                            }
                            if !friend.school.isEmpty {
                                Text(friend.school)
                                    .font(AppTheme.funFont(.caption, weight: .medium))
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.top, 8)

                    HStack(spacing: 0) {
                        statItem(icon: "bolt.fill", value: "\(friend.totalXP)", label: "Total XP", color: AppTheme.xpPurple)
                        statItem(icon: "flame.fill", value: "\(friend.currentStreak)", label: "Streak", color: AppTheme.accentOrange)
                        statItem(icon: "target", value: "\(Int(friend.accuracy * 100))%", label: "Accuracy", color: AppTheme.primaryBlue)
                    }
                    .padding(16)
                    .cardStyle()

                    xpComparisonSection(friend: friend)

                    VStack(alignment: .leading, spacing: 12) {
                        FunSectionHeader(icon: "chart.bar.fill", title: "Detailed Stats", color: AppTheme.primaryBlue)

                        VStack(spacing: 10) {
                            detailRow(label: "Total XP", value: "\(friend.totalXP)", icon: "bolt.fill", color: AppTheme.xpPurple)
                            detailRow(label: "Weekly XP", value: "\(friend.weeklyXP)", icon: "calendar", color: AppTheme.primaryBlue)
                            detailRow(label: "Questions Answered", value: "\(friend.questionsAnswered)", icon: "questionmark.circle.fill", color: AppTheme.funTeal)
                            detailRow(label: "Correct Answers", value: "\(friend.questionsCorrect)", icon: "checkmark.circle.fill", color: AppTheme.successGreen)
                            detailRow(label: "Accuracy", value: "\(Int(friend.accuracy * 100))%", icon: "target", color: AppTheme.accentOrange)
                            detailRow(label: "Current Streak", value: "\(friend.currentStreak) days", icon: "flame.fill", color: AppTheme.accentOrange)
                            detailRow(label: "Level", value: "\(friend.level)", icon: "star.fill", color: AppTheme.warningYellow)
                        }
                    }
                    .padding(16)
                    .cardStyle()

                    achievementsSection(friend: friend)

                    Button {
                        showRemoveAlert = true
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "person.badge.minus")
                            Text("Remove Friend")
                        }
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(AppTheme.heartRed)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(AppTheme.heartRed.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 14))
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "person.fill.questionmark")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                    Text("Could not load profile")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .padding(60)
            }
        }
        .scrollIndicators(.hidden)
        .background(Color(.systemGroupedBackground))
        .navigationTitle(friendName)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            friendProfile = await supabase.fetchFriendProfile(friendId: friendId)
            isLoading = false
        }
        .alert("Remove Friend", isPresented: $showRemoveAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Remove", role: .destructive) {
                Task {
                    try? await supabase.removeFriend(friendId: friendId)
                    dismiss()
                }
            }
        } message: {
            Text("Are you sure you want to remove \(friendName) as a friend?")
        }
    }

    @ViewBuilder
    private func xpComparisonSection(friend: FriendDetailProfile) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            FunSectionHeader(icon: "chart.line.uptrend.xyaxis", title: "XP Comparison", color: AppTheme.successGreen)

            let myDailyXP = estimateDailyXP(totalXP: gameVM.totalXP)
            let friendDailyXP = estimateDailyXP(totalXP: friend.totalXP)
            let days = last7DayLabels()

            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Circle().fill(AppTheme.primaryBlue).frame(width: 8, height: 8)
                        Text("You")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                    }
                    HStack(spacing: 4) {
                        Circle().fill(AppTheme.accentOrange).frame(width: 8, height: 8)
                        Text(friend.username)
                            .font(AppTheme.funFont(.caption, weight: .bold))
                    }
                    Spacer()
                }

                HStack(alignment: .bottom, spacing: 6) {
                    ForEach(0..<7, id: \.self) { i in
                        VStack(spacing: 4) {
                            HStack(alignment: .bottom, spacing: 2) {
                                let myH = barHeight(xp: myDailyXP[i], maxXP: max((myDailyXP + friendDailyXP).max() ?? 1, 1))
                                let friendH = barHeight(xp: friendDailyXP[i], maxXP: max((myDailyXP + friendDailyXP).max() ?? 1, 1))

                                RoundedRectangle(cornerRadius: 3)
                                    .fill(AppTheme.primaryBlue)
                                    .frame(width: 12, height: max(myH, 4))

                                RoundedRectangle(cornerRadius: 3)
                                    .fill(AppTheme.accentOrange)
                                    .frame(width: 12, height: max(friendH, 4))
                            }
                            .frame(height: 80, alignment: .bottom)

                            Text(days[i])
                                .font(AppTheme.funFont(.caption2, weight: .medium))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }

            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Your Total")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                    Text("\(gameVM.totalXP) XP")
                        .font(AppTheme.funFont(.headline, weight: .heavy))
                        .foregroundStyle(AppTheme.primaryBlue)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(friend.username)'s Total")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)
                    Text("\(friend.totalXP) XP")
                        .font(AppTheme.funFont(.headline, weight: .heavy))
                        .foregroundStyle(AppTheme.accentOrange)
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.successGreen.opacity(0.3))
    }

    @ViewBuilder
    private func achievementsSection(friend: FriendDetailProfile) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            FunSectionHeader(icon: "trophy.fill", title: "Achievements", color: AppTheme.warningYellow)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                AchievementBadge(icon: "flame.fill", title: "On Fire", subtitle: "7-day streak", isUnlocked: friend.currentStreak >= 7)
                AchievementBadge(icon: "bolt.fill", title: "XP Hunter", subtitle: "500 XP", isUnlocked: friend.totalXP >= 500)
                AchievementBadge(icon: "target", title: "Sharpshooter", subtitle: "90% accuracy", isUnlocked: friend.accuracy >= 0.9)
                AchievementBadge(icon: "star.fill", title: "Rising Star", subtitle: "1000 XP", isUnlocked: friend.totalXP >= 1000)
                AchievementBadge(icon: "crown.fill", title: "Champion", subtitle: "Lv.10+", isUnlocked: friend.level >= 10)
                AchievementBadge(icon: "brain.fill", title: "Brain Power", subtitle: "100 questions", isUnlocked: friend.questionsAnswered >= 100)
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
    }

    private func statItem(icon: String, value: String, label: String, color: Color) -> some View {
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

    private func detailRow(label: String, value: String, icon: String, color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.subheadline)
                .foregroundStyle(color)
                .frame(width: 24)
            Text(label)
                .font(AppTheme.funFont(.subheadline, weight: .medium))
            Spacer()
            Text(value)
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(color)
        }
        .padding(.vertical, 4)
    }

    private func estimateDailyXP(totalXP: Int) -> [Int] {
        let base = totalXP / 14
        return (0..<7).map { i in
            let variance = ((i * 37 + totalXP) % 5) * (base / 4 + 1)
            return max(base + variance - (base / 2), 0)
        }
    }

    private func last7DayLabels() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return (0..<7).reversed().map { daysAgo in
            let date = Calendar.current.date(byAdding: .day, value: -daysAgo, to: Date()) ?? Date()
            return formatter.string(from: date)
        }
    }

    private func barHeight(xp: Int, maxXP: Int) -> CGFloat {
        guard maxXP > 0 else { return 4 }
        return CGFloat(xp) / CGFloat(maxXP) * 70
    }
}
