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
    @State private var friendshipStatus: FriendshipStatus = .friend
    @State private var isSendingRequest: Bool = false
    @State private var friendRequestError: String?
    @State private var isSendingDuoInvite: Bool = false
    @State private var duoInviteStatus: DuoInviteStatus = .none
    @State private var duoService = DuoQuestService.shared

    private enum DuoInviteStatus {
        case none
        case sent
        case alreadyPartnered
        case error(String)
    }

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
                            bodyColor: friend.avatarBodyColor,
                            backgroundColor: friend.avatarBgColor,
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
                        if !friend.profession.isEmpty {
                            professionStatItem(profession: friend.profession)
                        }
                    }
                    .padding(16)
                    .cardStyle()

                    friendClinicalAuraSection(friend: friend)

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

                    friendActionButton
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
            async let profileTask = supabase.fetchFriendProfile(friendId: friendId)
            async let statusTask = supabase.checkFriendshipStatus(userId: friendId)
            friendProfile = await profileTask
            friendshipStatus = await statusTask
            isLoading = false

            if duoService.currentPartnership == nil {
                await duoService.loadDuoData()
            }
            if let partner = duoService.currentPartnership, partner.partnerId == friendId {
                duoInviteStatus = .alreadyPartnered
            }
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
    private var friendActionButton: some View {
        switch friendshipStatus {
        case .friend:
            VStack(spacing: 10) {
                duoInviteButton

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
        case .notFriend:
            VStack(spacing: 8) {
                Button {
                    isSendingRequest = true
                    friendRequestError = nil
                    Task {
                        guard let friend = friendProfile else { return }
                        do {
                            try await supabase.sendFriendRequest(toUsername: friend.username)
                            friendshipStatus = .pendingSent
                        } catch {
                            friendRequestError = error.localizedDescription
                        }
                        isSendingRequest = false
                    }
                } label: {
                    HStack(spacing: 6) {
                        if isSendingRequest {
                            ProgressView().tint(.white)
                        } else {
                            Image(systemName: "person.badge.plus")
                            Text("Add Friend")
                        }
                    }
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(AppTheme.primaryBlue)
                    .clipShape(.rect(cornerRadius: 14))
                }
                .buttonStyle(.plain)
                .disabled(isSendingRequest)

                if let error = friendRequestError {
                    Text(error)
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(AppTheme.heartRed)
                }
            }
        case .pendingSent:
            HStack(spacing: 6) {
                Image(systemName: "clock.fill")
                Text("Friend Request Sent")
            }
            .font(AppTheme.funFont(.subheadline, weight: .medium))
            .foregroundStyle(AppTheme.primaryBlue)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(AppTheme.primaryBlue.opacity(0.08))
            .clipShape(.rect(cornerRadius: 14))
        case .pendingReceived:
            HStack(spacing: 6) {
                Image(systemName: "bell.badge.fill")
                Text("Pending Request")
            }
            .font(AppTheme.funFont(.subheadline, weight: .medium))
            .foregroundStyle(AppTheme.accentOrange)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(AppTheme.accentOrange.opacity(0.08))
            .clipShape(.rect(cornerRadius: 14))
        case .isSelf:
            EmptyView()
        }
    }

    @ViewBuilder
    private var duoInviteButton: some View {
        switch duoInviteStatus {
        case .none:
            if duoService.currentPartnership == nil {
                Button {
                    isSendingDuoInvite = true
                    Task {
                        let success = await duoService.sendDuoInvite(toFriendId: friendId)
                        if success {
                            duoInviteStatus = .sent
                        } else {
                            duoInviteStatus = .error("Could not send invite. They may already have a partner.")
                        }
                        isSendingDuoInvite = false
                    }
                } label: {
                    HStack(spacing: 6) {
                        if isSendingDuoInvite {
                            ProgressView().tint(.white)
                        } else {
                            Image(systemName: "person.2.circle.fill")
                            Text("Start Duo Quest")
                        }
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
                .disabled(isSendingDuoInvite)
            } else {
                HStack(spacing: 6) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(AppTheme.funTeal)
                    Text("You already have a Duo partner")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 10)
            }
        case .sent:
            HStack(spacing: 6) {
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(AppTheme.funTeal)
                Text("Duo Invite Sent!")
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(AppTheme.funTeal)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(AppTheme.funTeal.opacity(0.08))
            .clipShape(.rect(cornerRadius: 14))
        case .alreadyPartnered:
            HStack(spacing: 6) {
                Image(systemName: "person.2.fill")
                    .foregroundStyle(AppTheme.funTeal)
                Text("Already Duo Partners!")
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(AppTheme.funTeal)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(AppTheme.funTeal.opacity(0.08))
            .clipShape(.rect(cornerRadius: 14))
        case .error(let msg):
            VStack(spacing: 6) {
                Text(msg)
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(AppTheme.heartRed)
            }
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

                            VStack(spacing: 1) {
                                Text(days[i].day)
                                    .font(AppTheme.funFont(.caption2, weight: .medium))
                                    .foregroundStyle(.secondary)
                                Text(days[i].date)
                                    .font(.system(size: 9, weight: .medium, design: .rounded))
                                    .foregroundStyle(.tertiary)
                            }
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

    private func professionStatItem(profession: String) -> some View {
        VStack(spacing: 6) {
            Image(Profession.badgeImage(for: profession))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 48)
            Text(profession)
                .font(AppTheme.funFont(.caption, weight: .medium))
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
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

    @ViewBuilder
    private func friendClinicalAuraSection(friend: FriendDetailProfile) -> some View {
        HStack(spacing: 16) {
            VStack(spacing: 4) {
                Image(systemName: "sparkles")
                    .font(.title3)
                    .foregroundStyle(AppTheme.primaryBlue)
                Text("Clinical Aura")
                    .font(AppTheme.funFont(.caption, weight: .heavy))
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 2) {
                let myPoints = gameVM.clinicalAuraPoints
                HStack(spacing: 8) {
                    VStack(spacing: 2) {
                        Text("You")
                            .font(AppTheme.funFont(.caption2, weight: .medium))
                            .foregroundStyle(.secondary)
                        Text("\(myPoints)")
                            .font(AppTheme.funFont(.title3, weight: .heavy))
                            .foregroundStyle(myPoints >= 0 ? AppTheme.primaryBlue : AppTheme.heartRed)
                            .monospacedDigit()
                    }

                    Text("vs")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.tertiary)

                    VStack(spacing: 2) {
                        Text(friend.username)
                            .font(AppTheme.funFont(.caption2, weight: .medium))
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                        Text("--")
                            .font(AppTheme.funFont(.title3, weight: .heavy))
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(16)
        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.3))
    }

    private func estimateDailyXP(totalXP: Int) -> [Int] {
        let base = totalXP / 14
        return (0..<7).map { i in
            let variance = ((i * 37 + totalXP) % 5) * (base / 4 + 1)
            return max(base + variance - (base / 2), 0)
        }
    }

    private func last7DayLabels() -> [(day: String, date: String)] {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEE"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        return (0..<7).reversed().map { daysAgo in
            let date = Calendar.current.date(byAdding: .day, value: -daysAgo, to: Date()) ?? Date()
            return (dayFormatter.string(from: date), dateFormatter.string(from: date))
        }
    }

    private func barHeight(xp: Int, maxXP: Int) -> CGFloat {
        guard maxXP > 0 else { return 4 }
        return CGFloat(xp) / CGFloat(maxXP) * 70
    }
}
