import SwiftUI

struct ProfileView: View {
    let gameVM: GameViewModel
    @State private var selectedProfession: Profession = .pharmacy
    @State private var username: String = "Student"
    @State private var schoolName: String = ""
    @State private var showEditProfile: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.15))
                                .frame(width: 90, height: 90)
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(.white.opacity(0.9))
                        }

                        VStack(spacing: 4) {
                            HStack(spacing: 6) {
                                Text(username)
                                    .font(.title2.bold())
                                    .foregroundStyle(.white)

                                Text("Lv.\(gameVM.level)")
                                    .font(.caption.bold())
                                    .foregroundStyle(AppTheme.darkBlue)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 3)
                                    .background(AppTheme.warningYellow)
                                    .clipShape(Capsule())
                            }

                            Text("Level \(gameVM.level) • \(gameVM.totalXP) XP")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.8))
                        }
                    }
                    .padding(.vertical, 24)
                    .frame(maxWidth: .infinity)
                    .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))

                    VStack(spacing: 16) {
                        HStack(spacing: 0) {
                            ProfileStatItem(icon: "flame.fill", value: "\(gameVM.currentStreak)", label: "Streak", color: AppTheme.accentOrange)
                            ProfileStatItem(icon: "target", value: "\(Int(gameVM.accuracy * 100))%", label: "Accuracy", color: AppTheme.primaryBlue)
                            ProfileStatItem(icon: "book.closed.fill", value: "\(gameVM.lessonsCompleted)", label: "Lessons", color: AppTheme.successGreen)
                        }
                        .padding(16)
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "flame.fill")
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text("Streak Status")
                                    .font(.headline)
                                Spacer()
                                if gameVM.streakSaves > 0 {
                                    HStack(spacing: 4) {
                                        Image(systemName: "shield.checkered")
                                            .font(.caption)
                                        Text("\(gameVM.streakSaves) save\(gameVM.streakSaves == 1 ? "" : "s")")
                                            .font(.caption.bold())
                                    }
                                    .foregroundStyle(AppTheme.xpPurple)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(AppTheme.xpPurple.opacity(0.1))
                                    .clipShape(Capsule())
                                }
                            }

                            HStack(spacing: 8) {
                                Image(systemName: gameVM.currentStreak > 0 ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(gameVM.currentStreak > 0 ? AppTheme.successGreen : .secondary)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(gameVM.currentStreak > 0 ? "Streak active!" : "Start your streak today!")
                                        .font(.subheadline.weight(.medium))
                                    Text("\(gameVM.currentStreak) day\(gameVM.currentStreak == 1 ? "" : "s") in a row")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                            }
                        }
                        .padding(16)
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("PROFESSION")
                                    .font(.caption.bold())
                                    .foregroundStyle(AppTheme.xpPurple)
                                Spacer()
                            }

                            Button {
                                showEditProfile = true
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: selectedProfession.iconName)
                                        .font(.title3)
                                        .foregroundStyle(AppTheme.xpPurple)

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(selectedProfession.rawValue)
                                            .font(.subheadline.weight(.medium))
                                        Text("Tap to change")
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }

                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(16)
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("YOUR SCHOOL")
                                    .font(.caption.bold())
                                    .foregroundStyle(AppTheme.primaryBlue)
                                Spacer()
                            }

                            Button {
                                showEditProfile = true
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: "building.columns.fill")
                                        .font(.title3)
                                        .foregroundStyle(AppTheme.primaryBlue)

                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(schoolName.isEmpty ? "Select your school" : schoolName)
                                            .font(.subheadline.weight(.medium))
                                            .foregroundStyle(schoolName.isEmpty ? .secondary : .primary)
                                    }

                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(16)
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 12) {
                            Text("ACHIEVEMENTS")
                                .font(.caption.bold())
                                .foregroundStyle(.secondary)

                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                AchievementBadge(icon: "flame.fill", title: "On Fire", subtitle: "7-day streak", isUnlocked: gameVM.currentStreak >= 7)
                                AchievementBadge(icon: "star.fill", title: "First Star", subtitle: "Earn 1 star", isUnlocked: !gameVM.subsectionStars.isEmpty)
                                AchievementBadge(icon: "target", title: "Sharpshooter", subtitle: "90% accuracy", isUnlocked: gameVM.accuracy >= 0.9)
                                AchievementBadge(icon: "bolt.fill", title: "XP Hunter", subtitle: "500 XP", isUnlocked: gameVM.totalXP >= 500)
                                AchievementBadge(icon: "book.closed.fill", title: "Scholar", subtitle: "5 lessons", isUnlocked: gameVM.lessonsCompleted >= 5)
                                AchievementBadge(icon: "crown.fill", title: "Master", subtitle: "All 5 stars", isUnlocked: gameVM.subsectionStars.values.contains(5))
                            }
                        }
                        .padding(16)
                        .cardStyle()

                        Button {
                        } label: {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                Text("Sign Out")
                            }
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(.tertiarySystemFill))
                            .clipShape(.rect(cornerRadius: 12))
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
            .sheet(isPresented: $showEditProfile) {
                EditProfileSheet(profession: $selectedProfession, schoolName: $schoolName)
            }
        }
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
                .font(.headline)
            Text(label)
                .font(.caption)
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
                    .frame(width: 48, height: 48)
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(isUnlocked ? AppTheme.warningYellow : Color(.tertiaryLabel))
            }
            Text(title)
                .font(.caption.bold())
                .foregroundStyle(isUnlocked ? .primary : .secondary)
            Text(subtitle)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
    }
}

struct EditProfileSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var profession: Profession
    @Binding var schoolName: String

    var body: some View {
        NavigationStack {
            Form {
                Section("Profession") {
                    ForEach(Profession.allCases, id: \.self) { prof in
                        Button {
                            profession = prof
                        } label: {
                            HStack {
                                Image(systemName: prof.iconName)
                                    .foregroundStyle(AppTheme.primaryBlue)
                                Text(prof.rawValue)
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
                    TextField("Enter your school name", text: $schoolName)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
