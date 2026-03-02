import SwiftUI

struct ProfileView: View {
    let gameVM: GameViewModel
    @Environment(SupabaseService.self) private var supabase
    @State private var showEditProfile: Bool = false
    @State private var showAvatarCustomization: Bool = false
    @State private var showSignOutAlert: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
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

                    VStack(spacing: 16) {
                        HStack(spacing: 0) {
                            ProfileStatItem(icon: "flame.fill", value: "\(gameVM.currentStreak)", label: "Streak", color: AppTheme.accentOrange)
                            ProfileStatItem(icon: "target", value: "\(Int(gameVM.accuracy * 100))%", label: "Accuracy", color: AppTheme.primaryBlue)
                            ProfileStatItem(icon: "book.closed.fill", value: "\(gameVM.lessonsCompleted)", label: "Lessons", color: AppTheme.successGreen)
                        }
                        .padding(16)
                        .cardStyle()

                        VStack(alignment: .leading, spacing: 12) {
                            FunSectionHeader(icon: "flame.fill", title: "Streak Status", color: AppTheme.accentOrange)

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
                        .cardStyle(borderColor: gameVM.currentStreak > 0 ? AppTheme.accentOrange.opacity(0.3) : nil)

                        VStack(alignment: .leading, spacing: 12) {
                            Text("PROFESSION")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.xpPurple)

                            Button {
                                showEditProfile = true
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: gameVM.selectedProfession.iconName)
                                        .font(.title3)
                                        .foregroundStyle(AppTheme.xpPurple)

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
                                        .foregroundStyle(.secondary)
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
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.5))

                        VStack(alignment: .leading, spacing: 12) {
                            Text("ACHIEVEMENTS")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(AppTheme.heartRed)

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
                        .cardStyle(borderColor: AppTheme.heartRed.opacity(0.5))

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
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
            .sheet(isPresented: $showEditProfile) {
                EditProfileSheet(gameVM: gameVM)
            }
            .sheet(isPresented: $showAvatarCustomization) {
                AvatarCustomizationView(gameVM: gameVM)
            }
            .alert("Sign Out", isPresented: $showSignOutAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Sign Out", role: .destructive) {
                    Task {
                        try? await supabase.signOut()
                    }
                }
            } message: {
                Text("Are you sure you want to sign out?")
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
                                Image(systemName: prof.iconName)
                                    .foregroundStyle(AppTheme.primaryBlue)
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
                        gameVM.syncToCloud()
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
