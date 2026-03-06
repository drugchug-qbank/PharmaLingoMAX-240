import SwiftUI

struct OnboardingView: View {
    @Environment(SupabaseService.self) private var supabase

    @State private var currentStep: Int = 0
    @State private var isForward: Bool = true

    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    @State private var selectedProfession: Profession?

    @State private var schoolSearch: String = ""
    @State private var selectedSchool: String = ""

    @State private var selectedAnimal: AnimalType = .beaver
    @State private var selectedEyes: EyeStyle = .normal
    @State private var selectedMouth: MouthStyle = .smile
    @State private var selectedAccessory: AccessoryType = .none
    @State private var selectedBodyColor: String = AnimalType.beaver.defaultColorHex
    @State private var selectedBgColor: String = "E3F2FD"

    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    @State private var showError: Bool = false
    @State private var showConfirmation: Bool = false
    @State private var featuresVisible: Bool = false
    @State private var avatarBounce: Bool = false

    var onSignInTapped: () -> Void
    var onComplete: () -> Void

    var body: some View {
        ZStack {
            MeshGradient(
                width: 3, height: 3,
                points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [0, 0.5], [0.5, 0.5], [1, 0.5],
                    [0, 1], [0.5, 1], [1, 1]
                ],
                colors: [
                    AppTheme.darkBlue, AppTheme.primaryBlue, AppTheme.darkBlue,
                    AppTheme.primaryBlue, AppTheme.xpPurple, AppTheme.primaryBlue,
                    AppTheme.darkBlue, AppTheme.primaryBlue, AppTheme.darkBlue
                ]
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                progressIndicator
                    .padding(.top, 8)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 4)

                ZStack {
                    if currentStep == 0 {
                        credentialsStep
                            .transition(stepTransition)
                    }
                    if currentStep == 1 {
                        professionStep
                            .transition(stepTransition)
                    }
                    if currentStep == 2 {
                        schoolStep
                            .transition(stepTransition)
                    }
                    if currentStep == 3 {
                        avatarStep
                            .transition(stepTransition)
                    }
                    if currentStep == 4 {
                        featuresStep
                            .transition(stepTransition)
                    }
                }
                .animation(.spring(duration: 0.5, bounce: 0.2), value: currentStep)
            }
        }
        .alert("Error", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text(errorMessage ?? "Something went wrong")
        }
        .alert("Check Your Email", isPresented: $showConfirmation) {
            Button("OK") {
                onSignInTapped()
            }
        } message: {
            Text("We sent a confirmation link to \(email). Please confirm your email, then sign in.")
        }
    }

    private var stepTransition: AnyTransition {
        .asymmetric(
            insertion: .move(edge: isForward ? .trailing : .leading).combined(with: .opacity),
            removal: .move(edge: isForward ? .leading : .trailing).combined(with: .opacity)
        )
    }

    private func goForward() {
        isForward = true
        withAnimation(.spring(duration: 0.5, bounce: 0.2)) {
            currentStep += 1
        }
    }

    private func goBack() {
        isForward = false
        withAnimation(.spring(duration: 0.5, bounce: 0.2)) {
            currentStep -= 1
        }
    }

    // MARK: - Progress

    private var progressIndicator: some View {
        HStack(spacing: 6) {
            ForEach(0..<5, id: \.self) { step in
                Capsule()
                    .fill(step <= currentStep ? Color.white : Color.white.opacity(0.25))
                    .frame(height: 5)
                    .animation(.spring(duration: 0.4), value: currentStep)
            }
        }
    }

    // MARK: - Step 1: Credentials

    private var credentialsStep: some View {
        ScrollView {
            VStack(spacing: 28) {
                Spacer().frame(height: 24)

                VStack(spacing: 10) {
                    Image(systemName: "cross.case.fill")
                        .font(.system(size: 52))
                        .foregroundStyle(.white)
                        .symbolEffect(.bounce, options: .nonRepeating)

                    Text("Let's Get Started!")
                        .font(AppTheme.funFont(.title, weight: .heavy))
                        .foregroundStyle(.white)

                    Text("Create your account to begin mastering pharmacology")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }

                VStack(spacing: 14) {
                    AuthTextField(icon: "person.fill", placeholder: "Username", text: $username, isSecure: false)
                    AuthTextField(icon: "envelope.fill", placeholder: "Email", text: $email, isSecure: false)
                    AuthTextField(icon: "lock.fill", placeholder: "Password", text: $password, isSecure: true)
                    AuthTextField(icon: "lock.shield.fill", placeholder: "Confirm Password", text: $confirmPassword, isSecure: true)
                }
                .padding(20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .padding(.horizontal, 24)

                Button {
                    guard validateCredentials() else { return }
                    goForward()
                } label: {
                    Text("Continue")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(AppTheme.successGreen)
                        .clipShape(.rect(cornerRadius: 14))
                }
                .padding(.horizontal, 24)

                Button {
                    onSignInTapped()
                } label: {
                    Text("Already have an account? Sign In")
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                        .foregroundStyle(.white.opacity(0.9))
                }

                Spacer()
            }
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Step 2: Profession

    private var professionStep: some View {
        ScrollView {
            VStack(spacing: 20) {
                Spacer().frame(height: 12)

                backButton

                VStack(spacing: 8) {
                    Image(systemName: "stethoscope")
                        .font(.system(size: 44))
                        .foregroundStyle(.white)
                        .symbolEffect(.bounce, options: .nonRepeating)

                    Text("What's Your Profession?")
                        .font(AppTheme.funFont(.title2, weight: .heavy))
                        .foregroundStyle(.white)

                    Text("This determines your team on the Profession Leaderboard!")
                        .font(AppTheme.funFont(.subheadline, weight: .medium))
                        .foregroundStyle(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }

                VStack(spacing: 10) {
                    ForEach(Profession.allCases, id: \.self) { prof in
                        Button {
                            withAnimation(.spring(duration: 0.3)) {
                                selectedProfession = prof
                            }
                        } label: {
                            HStack(spacing: 14) {
                                Image(systemName: prof.iconName)
                                    .font(.title2)
                                    .foregroundStyle(selectedProfession == prof ? .white : AppTheme.primaryBlue)
                                    .frame(width: 44, height: 44)
                                    .background(selectedProfession == prof ? Color.white.opacity(0.2) : AppTheme.primaryBlue.opacity(0.1))
                                    .clipShape(Circle())

                                Text(prof.rawValue)
                                    .font(AppTheme.funFont(.body, weight: .bold))
                                    .foregroundStyle(selectedProfession == prof ? .white : .primary)

                                Spacer()

                                if selectedProfession == prof {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding(14)
                            .background(selectedProfession == prof ? AppTheme.primaryBlue : Color(.secondarySystemGroupedBackground))
                            .clipShape(.rect(cornerRadius: 14))
                            .scaleEffect(selectedProfession == prof ? 1.02 : 1.0)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 24)
                .sensoryFeedback(.selection, trigger: selectedProfession)

                leaderboardPreview(
                    icon: "trophy.fill",
                    title: "Profession Leaderboard",
                    rows: sampleProfessionRankings.enumerated().map { index, item in
                        LeaderboardPreviewRow(rank: index, leading: item.name, trailing: "\(item.donations) pts", icon: item.icon)
                    }
                )

                Button {
                    createAccount()
                } label: {
                    Group {
                        if isLoading {
                            ProgressView().tint(.white)
                        } else {
                            Text("Continue")
                                .font(AppTheme.funFont(.headline, weight: .bold))
                        }
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(selectedProfession != nil ? AppTheme.successGreen : Color.gray)
                    .clipShape(.rect(cornerRadius: 14))
                }
                .disabled(isLoading || selectedProfession == nil)
                .padding(.horizontal, 24)

                Spacer().frame(height: 24)
            }
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Step 3: School

    private var schoolStep: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 12)

                    VStack(spacing: 8) {
                        Image(systemName: "building.columns.fill")
                            .font(.system(size: 44))
                            .foregroundStyle(.white)
                            .symbolEffect(.bounce, options: .nonRepeating)

                        Text("Rep Your School!")
                            .font(AppTheme.funFont(.title2, weight: .heavy))
                            .foregroundStyle(.white)

                        Text("Compete on the School Leaderboard and earn additional monthly rewards!")
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)

                        Text("Optional but strongly recommended")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.warningYellow)
                    }

                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                            TextField("Search your school...", text: $schoolSearch)
                                .textInputAutocapitalization(.words)
                                .autocorrectionDisabled()
                        }
                        .padding(14)
                        .background(Color(.secondarySystemGroupedBackground))
                        .clipShape(.rect(cornerRadius: 12))

                        if !selectedSchool.isEmpty {
                            HStack(spacing: 8) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(AppTheme.successGreen)
                                Text(selectedSchool)
                                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                                    .lineLimit(1)
                                Spacer()
                                Button {
                                    withAnimation { selectedSchool = "" }
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(12)
                            .background(AppTheme.successGreen.opacity(0.15))
                            .clipShape(.rect(cornerRadius: 10))
                        }

                        if !schoolSearch.isEmpty && selectedSchool.isEmpty {
                            let filtered = filteredSchools
                            if filtered.isEmpty {
                                Text("No schools found. Try a different search.")
                                    .font(AppTheme.funFont(.caption, weight: .medium))
                                    .foregroundStyle(.white.opacity(0.6))
                                    .padding(.vertical, 4)
                            } else {
                                VStack(spacing: 0) {
                                    ForEach(Array(filtered.prefix(6).enumerated()), id: \.offset) { index, school in
                                        Button {
                                            withAnimation(.spring(duration: 0.3)) {
                                                selectedSchool = school
                                                schoolSearch = ""
                                            }
                                        } label: {
                                            HStack {
                                                Text(school)
                                                    .font(AppTheme.funFont(.subheadline, weight: .medium))
                                                    .foregroundStyle(.primary)
                                                    .lineLimit(1)
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .font(.caption)
                                                    .foregroundStyle(.tertiary)
                                            }
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 12)
                                        }
                                        .buttonStyle(.plain)
                                        if index < min(filtered.count, 6) - 1 {
                                            Divider()
                                        }
                                    }
                                }
                                .background(Color(.secondarySystemGroupedBackground))
                                .clipShape(.rect(cornerRadius: 12))
                            }
                        }
                    }
                    .padding(.horizontal, 24)

                    leaderboardPreview(
                        icon: "building.columns.fill",
                        title: "School Leaderboard",
                        rows: sampleSchoolRankings.enumerated().map { index, item in
                            LeaderboardPreviewRow(rank: index, leading: item.name, trailing: "\(item.xp) XP", icon: nil)
                        }
                    )

                    Spacer().frame(height: 80)
                }
            }
            .scrollIndicators(.hidden)

            Button {
                goForward()
            } label: {
                Text(selectedSchool.isEmpty ? "Skip for Now" : "Continue")
                    .font(AppTheme.funFont(.headline, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(selectedSchool.isEmpty ? Color.white.opacity(0.3) : AppTheme.successGreen)
                    .clipShape(.rect(cornerRadius: 14))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
    }

    // MARK: - Step 4: Avatar

    private var avatarStep: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 16) {
                    Spacer().frame(height: 8)

                    Text("Create Your Avatar!")
                        .font(AppTheme.funFont(.title2, weight: .heavy))
                        .foregroundStyle(.white)

                    AvatarRendererView(
                        configuration: AvatarConfiguration(
                            animal: selectedAnimal.rawValue,
                            eyes: selectedEyes.rawValue,
                            mouth: selectedMouth.rawValue,
                            accessory: selectedAccessory.rawValue,
                            bodyHex: selectedBodyColor,
                            bgHex: selectedBgColor
                        ),
                        size: 150,
                        showIdleAnimation: true
                    )
                    .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 8)
                    .scaleEffect(avatarBounce ? 1.06 : 1.0)
                    .animation(.spring(duration: 0.3, bounce: 0.5), value: avatarBounce)

                    Text(selectedAnimal.displayName)
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white.opacity(0.8))

                    avatarSection(title: "Choose Your Animal") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(AnimalType.allCases, id: \.self) { animal in
                                    Button {
                                        withAnimation(.spring(duration: 0.3)) {
                                            selectedAnimal = animal
                                            selectedBodyColor = animal.defaultColorHex
                                        }
                                        triggerAvatarBounce()
                                    } label: {
                                        VStack(spacing: 4) {
                                            CachedAvatarView(
                                                configuration: AvatarConfiguration(
                                                    animal: animal.rawValue,
                                                    eyes: "normal",
                                                    mouth: "smile",
                                                    accessory: "none",
                                                    bodyHex: animal.defaultColorHex,
                                                    bgHex: "F5F5F5"
                                                ),
                                                size: 52
                                            )

                                            Text(animal.displayName)
                                                .font(.system(size: 9, weight: .bold))
                                                .foregroundStyle(selectedAnimal == animal ? .white : .white.opacity(0.6))
                                        }
                                        .padding(6)
                                        .background(selectedAnimal == animal ? AppTheme.primaryBlue.opacity(0.6) : Color.white.opacity(0.08))
                                        .clipShape(.rect(cornerRadius: 12))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(selectedAnimal == animal ? Color.white : .clear, lineWidth: 2)
                                        )
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        .contentMargins(.horizontal, 24)
                        .sensoryFeedback(.selection, trigger: selectedAnimal)
                    }

                    avatarSection(title: "Eyes") {
                        avatarChipScroll(items: EyeStyle.allCases, selected: selectedEyes, label: \.displayName) { eye in
                            withAnimation(.spring(duration: 0.3)) { selectedEyes = eye }
                            triggerAvatarBounce()
                        }
                    }

                    avatarSection(title: "Mouth") {
                        avatarChipScroll(items: MouthStyle.allCases, selected: selectedMouth, label: \.displayName) { mouth in
                            withAnimation(.spring(duration: 0.3)) { selectedMouth = mouth }
                            triggerAvatarBounce()
                        }
                    }

                    avatarSection(title: "Accessory") {
                        avatarChipScroll(items: AccessoryType.allCases, selected: selectedAccessory, label: \.displayName) { acc in
                            withAnimation(.spring(duration: 0.3)) { selectedAccessory = acc }
                            triggerAvatarBounce()
                        }
                    }

                    avatarSection(title: "Body Color") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(AvatarColorPalette.bodyColors, id: \.hex) { color in
                                    Button {
                                        withAnimation(.spring(duration: 0.2)) {
                                            selectedBodyColor = color.hex
                                        }
                                        triggerAvatarBounce()
                                    } label: {
                                        Circle()
                                            .fill(Color(hex: color.hex))
                                            .frame(width: 34, height: 34)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.white, lineWidth: selectedBodyColor == color.hex ? 3 : 0)
                                            )
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        .contentMargins(.horizontal, 24)
                    }

                    avatarSection(title: "Background") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(AvatarColorPalette.backgroundColors, id: \.hex) { color in
                                    Button {
                                        withAnimation(.spring(duration: 0.2)) {
                                            selectedBgColor = color.hex
                                        }
                                        triggerAvatarBounce()
                                    } label: {
                                        Circle()
                                            .fill(Color(hex: color.hex))
                                            .frame(width: 34, height: 34)
                                            .overlay(
                                                Circle()
                                                    .stroke(selectedBgColor == color.hex ? AppTheme.primaryBlue : Color(.systemGray4), lineWidth: selectedBgColor == color.hex ? 3 : 0.5)
                                            )
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                        .contentMargins(.horizontal, 24)
                    }

                    Text("You can customize even more later!")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.white.opacity(0.5))

                    Spacer().frame(height: 80)
                }
            }
            .scrollIndicators(.hidden)

            Button {
                goForward()
            } label: {
                Text("Continue")
                    .font(AppTheme.funFont(.headline, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(AppTheme.successGreen)
                    .clipShape(.rect(cornerRadius: 14))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
    }

    // MARK: - Step 5: Features

    private var featuresStep: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer().frame(height: 24)

                VStack(spacing: 14) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 48))
                        .foregroundStyle(AppTheme.warningYellow)
                        .symbolEffect(.variableColor.iterative, options: .repeating)

                    Text("GET READY TO MASTER")
                        .font(AppTheme.funFont(.callout, weight: .heavy))
                        .foregroundStyle(.white.opacity(0.85))
                        .tracking(2)

                    Text("PHARMACOLOGY")
                        .font(.system(size: 32, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                }

                VStack(spacing: 10) {
                    ForEach(Array(featureItems.enumerated()), id: \.offset) { index, feature in
                        featureCard(icon: feature.icon, title: feature.title, subtitle: feature.subtitle, color: feature.color)
                            .opacity(featuresVisible ? 1 : 0)
                            .offset(y: featuresVisible ? 0 : 24)
                            .animation(
                                .spring(duration: 0.5, bounce: 0.3).delay(Double(index) * 0.07),
                                value: featuresVisible
                            )
                    }
                }
                .padding(.horizontal, 24)

                VStack(spacing: 8) {
                    AvatarRendererView(
                        configuration: AvatarConfiguration(
                            animal: selectedAnimal.rawValue,
                            eyes: selectedEyes.rawValue,
                            mouth: selectedMouth.rawValue,
                            accessory: selectedAccessory.rawValue,
                            bodyHex: selectedBodyColor,
                            bgHex: selectedBgColor
                        ),
                        size: 72
                    )

                    Text("Welcome, \(username)!")
                        .font(AppTheme.funFont(.headline, weight: .bold))
                        .foregroundStyle(.white)
                }
                .opacity(featuresVisible ? 1 : 0)
                .animation(.spring(duration: 0.5).delay(0.5), value: featuresVisible)

                Button {
                    completeOnboarding()
                } label: {
                    Group {
                        if isLoading {
                            ProgressView().tint(.white)
                        } else {
                            HStack(spacing: 8) {
                                Text("Let's Go!")
                                    .font(AppTheme.funFont(.title3, weight: .heavy))
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.title3)
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(
                        LinearGradient(
                            colors: [AppTheme.successGreen, AppTheme.funTeal],
                            startPoint: .leading, endPoint: .trailing
                        )
                    )
                    .clipShape(.rect(cornerRadius: 16))
                    .shadow(color: AppTheme.successGreen.opacity(0.4), radius: 12, x: 0, y: 6)
                }
                .disabled(isLoading)
                .padding(.horizontal, 24)
                .scaleEffect(featuresVisible ? 1 : 0.9)
                .opacity(featuresVisible ? 1 : 0)
                .animation(.spring(duration: 0.5).delay(0.6), value: featuresVisible)

                Spacer().frame(height: 30)
            }
        }
        .scrollIndicators(.hidden)
        .onAppear {
            featuresVisible = true
        }
    }

    // MARK: - Shared Components

    private var backButton: some View {
        HStack {
            Button { goBack() } label: {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .foregroundStyle(.white.opacity(0.8))
            }
            Spacer()
        }
        .padding(.horizontal, 24)
    }

    private func avatarSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(.white)
                .padding(.horizontal, 24)

            content()
        }
    }

    private func avatarChipScroll<T: Hashable>(items: [T], selected: T, label: KeyPath<T, String>, onSelect: @escaping (T) -> Void) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    Button {
                        onSelect(item)
                    } label: {
                        Text(item[keyPath: label])
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(selected == item ? .white : .white.opacity(0.7))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(selected == item ? AppTheme.primaryBlue : Color.white.opacity(0.12))
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .contentMargins(.horizontal, 24)
    }

    private struct LeaderboardPreviewRow {
        let rank: Int
        let leading: String
        let trailing: String
        let icon: String?
    }

    private func leaderboardPreview(icon: String, title: String, rows: [LeaderboardPreviewRow]) -> some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(AppTheme.warningYellow)
                Text(title)
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(.white)
            }

            VStack(spacing: 0) {
                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                    HStack(spacing: 10) {
                        Text(rankMedal(row.rank))
                            .font(.caption)
                            .frame(width: 26)

                        if let iconName = row.icon {
                            Image(systemName: iconName)
                                .font(.caption)
                                .foregroundStyle(AppTheme.primaryBlue)
                        }

                        Text(row.leading)
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .lineLimit(1)

                        Spacer()

                        Text(row.trailing)
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(AppTheme.xpPurple)
                    }
                    .padding(.vertical, 7)
                    .padding(.horizontal, 12)

                    if index < rows.count - 1 {
                        Divider()
                    }
                }
            }
            .background(Color(.secondarySystemGroupedBackground).opacity(0.95))
            .clipShape(.rect(cornerRadius: 12))
        }
        .padding(.horizontal, 24)
    }

    private func featureCard(icon: String, title: String, subtitle: String, color: Color) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(color.gradient)
                .clipShape(.rect(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(.primary)
                Text(subtitle)
                    .font(AppTheme.funFont(.caption, weight: .medium))
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(.rect(cornerRadius: 14))
    }

    // MARK: - Logic

    private func validateCredentials() -> Bool {
        let trimmedUsername = username.trimmingCharacters(in: .whitespaces)
        guard !trimmedUsername.isEmpty else {
            errorMessage = "Please enter a username."
            showError = true
            return false
        }
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your email."
            showError = true
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters."
            showError = true
            return false
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            showError = true
            return false
        }
        return true
    }

    private func createAccount() {
        guard let profession = selectedProfession else { return }
        isLoading = true
        Task {
            do {
                try await supabase.signUp(
                    email: email.trimmingCharacters(in: .whitespaces),
                    password: password,
                    username: username.trimmingCharacters(in: .whitespaces),
                    profession: profession.rawValue
                )
                isLoading = false
                goForward()
            } catch let error as SupabaseServiceError where error == .emailConfirmationRequired {
                isLoading = false
                showConfirmation = true
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
                showError = true
            }
        }
    }

    private func completeOnboarding() {
        isLoading = true
        Task {
            await supabase.completeOnboarding(
                school: selectedSchool,
                animal: selectedAnimal.rawValue,
                eyes: selectedEyes.rawValue,
                mouth: selectedMouth.rawValue,
                accessory: selectedAccessory.rawValue,
                bodyColor: selectedBodyColor,
                bgColor: selectedBgColor
            )
            isLoading = false
            onComplete()
        }
    }

    private func triggerAvatarBounce() {
        avatarBounce = true
        Task {
            try? await Task.sleep(for: .seconds(0.15))
            avatarBounce = false
        }
    }

    private var filteredSchools: [String] {
        guard schoolSearch.count >= 2 else { return [] }
        return UniversityData.schools.filter { $0.localizedStandardContains(schoolSearch) }
    }

    private func rankMedal(_ index: Int) -> String {
        switch index {
        case 0: return "🥇"
        case 1: return "🥈"
        case 2: return "🥉"
        default: return "#\(index + 1)"
        }
    }

    // MARK: - Sample Data

    private var sampleProfessionRankings: [(name: String, icon: String, donations: Int)] {
        [
            ("Pharmacy", "cross.case.fill", 12450),
            ("Nursing", "heart.text.clipboard.fill", 9820),
            ("Physician MD", "stethoscope", 8340),
            ("Physician Assistant", "person.badge.stethoscope", 5210),
            ("Physician DO", "stethoscope", 3890),
        ]
    }

    private var sampleSchoolRankings: [(name: String, xp: Int)] {
        [
            ("University of Florida", 45200),
            ("Ohio State University", 38750),
            ("University of Michigan", 32100),
            ("UNC Chapel Hill", 28900),
            ("University of Texas", 24500),
        ]
    }

    private var featureItems: [(icon: String, title: String, subtitle: String, color: Color)] {
        [
            ("book.fill", "10 Learning Modules", "Master 300+ drugs with interactive lessons", AppTheme.primaryBlue),
            ("brain.fill", "Drug Mastery System", "Track your knowledge of every medication", AppTheme.xpPurple),
            ("arrow.triangle.2.circlepath", "Adaptive Learning", "Quizzes that adapt to your level", AppTheme.funTeal),
            ("flame.fill", "Daily Streaks", "Build consistency and earn bonus rewards", AppTheme.accentOrange),
            ("trophy.fill", "Leaderboards", "Compete by profession, school & globally", AppTheme.warningYellow),
            ("cross.case.fill", "Clinical Question of the Day", "Daily clinical challenges to test your skills", AppTheme.heartRed),
            ("person.3.fill", "Friends & Social", "Connect with classmates and track progress", AppTheme.funPink),
        ]
    }
}
