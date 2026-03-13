import SwiftUI

struct AchievementsView: View {
    let gameVM: GameViewModel
    @State private var selectedCategory: AchievementCategory? = nil
    @State private var selectedAchievement: AchievementDefinition? = nil
    @State private var selectedSpecial: SpecialAchievementDefinition? = nil

    private var completedModulesCount: Int {
        gameVM.modules.filter { mod in
            mod.subsections.allSatisfy { gameVM.completedSubsections.contains($0.id) }
        }.count
    }

    private var totalStars: Int {
        gameVM.subsectionStars.values.reduce(0, +)
    }

    private var fiveStarCount: Int {
        gameVM.subsectionStars.values.filter { $0 >= 5 }.count
    }

    private var isPerfectionist: Bool {
        gameVM.questionsAnswered >= 500 && gameVM.accuracy >= 0.95
    }

    private func currentValue(for achievement: AchievementDefinition) -> Int {
        switch achievement.id {
        case "streak_master": return gameVM.currentStreak
        case "scholar": return gameVM.lessonsCompleted
        case "xp_collector": return gameVM.totalXP
        case "question_warrior": return gameVM.questionsAnswered
        case "accuracy_ace": return gameVM.questionsCorrect
        case "aura_sage": return gameVM.clinicalAuraPoints
        case "star_hunter": return totalStars
        case "combo_king": return gameVM.consecutiveCorrect
        case "coin_tycoon": return gameVM.coins
        case "module_conqueror": return completedModulesCount
        default: return 0
        }
    }

    private func specialValue(for achievement: SpecialAchievementDefinition) -> Int {
        switch achievement.id {
        case "year_warrior": return gameVM.currentStreak
        case "question_machine": return gameVM.questionsAnswered
        case "perfectionist": return isPerfectionist ? 1 : 0
        case "five_star_general": return fiveStarCount
        case "aura_legend": return gameVM.clinicalAuraPoints
        case "speed_demon": return gameVM.lessonsCompleted
        default: return 0
        }
    }

    private var filteredAchievements: [AchievementDefinition] {
        guard let cat = selectedCategory else { return AchievementCatalog.tieredAchievements }
        return AchievementCatalog.tieredAchievements.filter { $0.category == cat }
    }

    private var unlockedCount: Int {
        var count = 0
        for a in AchievementCatalog.tieredAchievements {
            let v = currentValue(for: a)
            for level in a.levels where v >= level.threshold {
                count += 1
            }
        }
        for s in AchievementCatalog.specialAchievements {
            if s.isUnlocked(value: specialValue(for: s)) {
                count += 1
            }
        }
        return count
    }

    private var totalCount: Int {
        AchievementCatalog.tieredAchievements.reduce(0) { $0 + $1.levels.count } + AchievementCatalog.specialAchievements.count
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                summaryHeader

                categoryFilter

                tieredSection

                specialSection
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 40)
        }
        .scrollIndicators(.hidden)
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Achievements")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $selectedAchievement) { achievement in
            AchievementDetailSheet(achievement: achievement, currentValue: currentValue(for: achievement))
        }
        .sheet(item: $selectedSpecial) { special in
            SpecialAchievementDetailSheet(achievement: special, currentValue: specialValue(for: special))
        }
    }

    @ViewBuilder
    private var summaryHeader: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [AppTheme.warningYellow.opacity(0.3), AppTheme.warningYellow.opacity(0.05)],
                            center: .center,
                            startRadius: 5,
                            endRadius: 50
                        )
                    )
                    .frame(width: 80, height: 80)

                Image(systemName: "trophy.fill")
                    .font(.system(size: 36))
                    .foregroundStyle(AppTheme.warningYellow)
                    .symbolEffect(.pulse, options: .repeating.speed(0.5))
            }

            Text("\(unlockedCount) / \(totalCount)")
                .font(.system(size: 34, weight: .heavy, design: .rounded))
                .foregroundStyle(.primary)

            Text("Achievements Unlocked")
                .font(AppTheme.funFont(.subheadline, weight: .bold))
                .foregroundStyle(.secondary)

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(AppTheme.warningYellow.opacity(0.15))
                        .frame(height: 8)
                    Capsule()
                        .fill(
                            LinearGradient(colors: [AppTheme.warningYellow, AppTheme.accentOrange], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(width: max(geo.size.width * (Double(unlockedCount) / Double(max(totalCount, 1))), unlockedCount > 0 ? 8 : 0), height: 8)
                }
            }
            .frame(height: 8)
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 20)
        .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
    }

    @ViewBuilder
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                CategoryPill(title: "All", isSelected: selectedCategory == nil) {
                    withAnimation(.spring(duration: 0.25)) { selectedCategory = nil }
                }
                ForEach(AchievementCategory.allCases, id: \.self) { cat in
                    CategoryPill(title: cat.rawValue, isSelected: selectedCategory == cat) {
                        withAnimation(.spring(duration: 0.25)) { selectedCategory = cat }
                    }
                }
            }
        }
        .contentMargins(.horizontal, 0)
    }

    @ViewBuilder
    private var tieredSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            FunSectionHeader(icon: "medal.fill", title: "Tiered Achievements", color: AppTheme.warningYellow)

            LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)], spacing: 12) {
                ForEach(filteredAchievements) { achievement in
                    let value = currentValue(for: achievement)
                    TieredAchievementCard(achievement: achievement, currentValue: value) {
                        selectedAchievement = achievement
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var specialSection: some View {
        if selectedCategory == nil {
            VStack(alignment: .leading, spacing: 14) {
                FunSectionHeader(icon: "star.circle.fill", title: "Legendary Achievements", color: AppTheme.funPink)

                VStack(spacing: 10) {
                    ForEach(AchievementCatalog.specialAchievements) { special in
                        let value = specialValue(for: special)
                        SpecialAchievementRow(achievement: special, currentValue: value) {
                            selectedSpecial = special
                        }
                    }
                }
            }
        }
    }
}

struct CategoryPill: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTheme.funFont(.caption, weight: .heavy))
                .foregroundStyle(isSelected ? .white : .secondary)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(isSelected ? AppTheme.primaryBlue : Color(.tertiarySystemFill))
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

struct TieredAchievementCard: View {
    let achievement: AchievementDefinition
    let currentValue: Int
    let onTap: () -> Void

    private var currentTier: AchievementTier? {
        achievement.currentTier(value: currentValue)
    }

    private var displayTier: AchievementTier {
        currentTier ?? .bronze
    }

    private var isUnlocked: Bool {
        currentTier != nil
    }

    private var isMaxed: Bool {
        currentTier == .diamond
    }

    private var progressToNext: Double {
        achievement.progress(value: currentValue)
    }

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 10) {
                ZStack {
                    if isUnlocked {
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: displayTier.bgGradient,
                                    center: .center,
                                    startRadius: 2,
                                    endRadius: 35
                                )
                            )
                            .frame(width: 64, height: 64)

                        if isMaxed {
                            Circle()
                                .stroke(
                                    AngularGradient(
                                        colors: [.purple, .blue, .cyan, .green, .yellow, .orange, .red, .purple],
                                        center: .center
                                    ),
                                    lineWidth: 2.5
                                )
                                .frame(width: 64, height: 64)
                        } else {
                            Circle()
                                .stroke(displayTier.color.opacity(0.4), lineWidth: 2)
                                .frame(width: 64, height: 64)
                        }
                    } else {
                        Circle()
                            .fill(Color(.tertiarySystemFill))
                            .frame(width: 64, height: 64)
                    }

                    Image(systemName: achievement.icons(for: displayTier))
                        .font(.system(size: 26))
                        .foregroundStyle(isUnlocked ? displayTier.color : Color(.quaternaryLabel))
                        .symbolEffect(.bounce, options: .speed(0.6), value: isMaxed)
                }

                VStack(spacing: 3) {
                    Text(achievement.title)
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(isUnlocked ? .primary : .secondary)
                        .lineLimit(1)

                    if isUnlocked {
                        Text(displayTier.label)
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .foregroundStyle(displayTier.color)
                    } else {
                        Text("Locked")
                            .font(AppTheme.funFont(.caption2, weight: .bold))
                            .foregroundStyle(.tertiary)
                    }
                }

                if !isMaxed {
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(isUnlocked ? displayTier.color.opacity(0.15) : Color(.quaternarySystemFill))
                                .frame(height: 5)
                            Capsule()
                                .fill(isUnlocked ? displayTier.color : Color(.tertiaryLabel))
                                .frame(width: max(geo.size.width * progressToNext, progressToNext > 0 ? 4 : 0), height: 5)
                        }
                    }
                    .frame(height: 5)
                    .padding(.horizontal, 8)
                } else {
                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .font(.system(size: 8))
                                .foregroundStyle(
                                    LinearGradient(colors: [.purple, .blue, .cyan], startPoint: .leading, endPoint: .trailing)
                                )
                        }
                    }
                }
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 8)
            .cardStyle(borderColor: isMaxed ? AchievementTier.diamond.color.opacity(0.4) : (isUnlocked ? displayTier.color.opacity(0.25) : nil))
        }
        .buttonStyle(.plain)
    }
}

struct SpecialAchievementRow: View {
    let achievement: SpecialAchievementDefinition
    let currentValue: Int
    let onTap: () -> Void

    private var isUnlocked: Bool {
        achievement.isUnlocked(value: currentValue)
    }

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                ZStack {
                    if isUnlocked {
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [achievement.color.opacity(0.3), achievement.color.opacity(0.05)],
                                    center: .center,
                                    startRadius: 2,
                                    endRadius: 28
                                )
                            )
                            .frame(width: 52, height: 52)

                        Circle()
                            .stroke(
                                AngularGradient(
                                    colors: [achievement.color, achievement.color.opacity(0.5), achievement.color],
                                    center: .center
                                ),
                                lineWidth: 2
                            )
                            .frame(width: 52, height: 52)
                    } else {
                        Circle()
                            .fill(Color(.tertiarySystemFill))
                            .frame(width: 52, height: 52)
                    }

                    Image(systemName: achievement.icon)
                        .font(.system(size: 22))
                        .foregroundStyle(isUnlocked ? achievement.color : Color(.quaternaryLabel))
                }

                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text(achievement.title)
                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                            .foregroundStyle(isUnlocked ? .primary : .secondary)

                        if isUnlocked {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.caption2)
                                .foregroundStyle(achievement.color)
                        }
                    }

                    Text(achievement.description)
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.secondary)

                    if !isUnlocked {
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(Color(.quaternarySystemFill))
                                    .frame(height: 4)
                                Capsule()
                                    .fill(achievement.color.opacity(0.6))
                                    .frame(width: max(geo.size.width * achievement.progress(value: currentValue), achievement.progress(value: currentValue) > 0 ? 4 : 0), height: 4)
                            }
                        }
                        .frame(height: 4)
                    }
                }

                Spacer()

                if isUnlocked {
                    Image(systemName: "sparkles")
                        .font(.title3)
                        .foregroundStyle(achievement.color)
                        .symbolEffect(.variableColor.iterative, options: .repeating.speed(0.3))
                } else {
                    Image(systemName: "lock.fill")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
            }
            .padding(14)
            .cardStyle(borderColor: isUnlocked ? achievement.color.opacity(0.3) : nil)
        }
        .buttonStyle(.plain)
    }
}

struct AchievementDetailSheet: View {
    @Environment(\.dismiss) private var dismiss
    let achievement: AchievementDefinition
    let currentValue: Int

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    VStack(spacing: 16) {
                        let currentTier = achievement.currentTier(value: currentValue)
                        let displayTier = currentTier ?? .bronze
                        let isUnlocked = currentTier != nil

                        ZStack {
                            if isUnlocked {
                                Circle()
                                    .fill(
                                        RadialGradient(
                                            colors: [displayTier.color.opacity(0.25), displayTier.color.opacity(0.03)],
                                            center: .center,
                                            startRadius: 5,
                                            endRadius: 55
                                        )
                                    )
                                    .frame(width: 100, height: 100)
                            }

                            Image(systemName: achievement.icons(for: displayTier))
                                .font(.system(size: 44))
                                .foregroundStyle(isUnlocked ? displayTier.color : Color(.quaternaryLabel))
                        }

                        Text(achievement.title)
                            .font(AppTheme.funFont(.title2, weight: .heavy))

                        if let tier = currentTier {
                            Text(tier.label)
                                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                .foregroundStyle(tier.color)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 5)
                                .background(tier.color.opacity(0.12))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.top, 8)

                    VStack(spacing: 0) {
                        ForEach(achievement.levels) { level in
                            let unlocked = currentValue >= level.threshold
                            let isCurrent = achievement.currentTier(value: currentValue) == level.tier

                            HStack(spacing: 14) {
                                ZStack {
                                    Circle()
                                        .fill(unlocked ? level.tier.color.opacity(0.15) : Color(.tertiarySystemFill))
                                        .frame(width: 48, height: 48)

                                    if isCurrent {
                                        Circle()
                                            .stroke(level.tier.color, lineWidth: 2.5)
                                            .frame(width: 48, height: 48)
                                    }

                                    Image(systemName: achievement.icons(for: level.tier))
                                        .font(.system(size: 20))
                                        .foregroundStyle(unlocked ? level.tier.color : Color(.quaternaryLabel))
                                }

                                VStack(alignment: .leading, spacing: 3) {
                                    HStack(spacing: 6) {
                                        Text(level.tier.label)
                                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                            .foregroundStyle(unlocked ? level.tier.color : .secondary)

                                        if isCurrent {
                                            Text("CURRENT")
                                                .font(.system(size: 9, weight: .heavy, design: .rounded))
                                                .foregroundStyle(.white)
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 2)
                                                .background(level.tier.color)
                                                .clipShape(Capsule())
                                        }
                                    }

                                    Text(level.description)
                                        .font(AppTheme.funFont(.caption, weight: .medium))
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                if unlocked {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(AppTheme.successGreen)
                                } else {
                                    Text("\(level.threshold)")
                                        .font(AppTheme.funFont(.caption, weight: .heavy))
                                        .foregroundStyle(.tertiary)
                                }
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)

                            if level.id < achievement.levels.count {
                                Divider().padding(.leading, 76)
                            }
                        }
                    }
                    .background(Color(.secondarySystemGroupedBackground))
                    .clipShape(.rect(cornerRadius: 16))

                    if let next = achievement.nextLevel(value: currentValue) {
                        VStack(spacing: 8) {
                            Text("Next: \(next.tier.label)")
                                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                .foregroundStyle(next.tier.color)

                            let remaining = next.threshold - currentValue
                            Text("\(remaining) more to go")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.secondary)

                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(next.tier.color.opacity(0.15))
                                        .frame(height: 8)
                                    Capsule()
                                        .fill(next.tier.color)
                                        .frame(width: max(geo.size.width * achievement.progress(value: currentValue), 8), height: 8)
                                }
                            }
                            .frame(height: 8)
                        }
                        .padding(16)
                        .background(Color(.secondarySystemGroupedBackground))
                        .clipShape(.rect(cornerRadius: 16))
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .scrollIndicators(.hidden)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Achievement Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

struct SpecialAchievementDetailSheet: View {
    @Environment(\.dismiss) private var dismiss
    let achievement: SpecialAchievementDefinition
    let currentValue: Int

    private var isUnlocked: Bool {
        achievement.isUnlocked(value: currentValue)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()

                ZStack {
                    if isUnlocked {
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [achievement.color.opacity(0.3), achievement.color.opacity(0.03)],
                                    center: .center,
                                    startRadius: 10,
                                    endRadius: 70
                                )
                            )
                            .frame(width: 140, height: 140)

                        Circle()
                            .stroke(
                                AngularGradient(
                                    colors: [achievement.color, achievement.color.opacity(0.3), achievement.color],
                                    center: .center
                                ),
                                lineWidth: 3
                            )
                            .frame(width: 120, height: 120)
                    } else {
                        Circle()
                            .fill(Color(.tertiarySystemFill))
                            .frame(width: 120, height: 120)
                    }

                    Image(systemName: achievement.icon)
                        .font(.system(size: 50))
                        .foregroundStyle(isUnlocked ? achievement.color : Color(.quaternaryLabel))
                }

                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Text(achievement.title)
                            .font(AppTheme.funFont(.title, weight: .heavy))

                        if isUnlocked {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.title3)
                                .foregroundStyle(achievement.color)
                        }
                    }

                    Text(achievement.description)
                        .font(AppTheme.funFont(.body, weight: .medium))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }

                if isUnlocked {
                    Text("LEGENDARY")
                        .font(.system(size: 13, weight: .heavy, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(
                            LinearGradient(colors: [achievement.color, achievement.color.opacity(0.7)], startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                } else {
                    VStack(spacing: 10) {
                        let progress = achievement.progress(value: currentValue)
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(achievement.color.opacity(0.15))
                                    .frame(height: 10)
                                Capsule()
                                    .fill(achievement.color)
                                    .frame(width: max(geo.size.width * progress, progress > 0 ? 6 : 0), height: 10)
                            }
                        }
                        .frame(height: 10)
                        .padding(.horizontal, 40)

                        Text("\(Int(progress * 100))% complete")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 16)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Legendary Achievement")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

extension AchievementDefinition: Hashable {
    static func == (lhs: AchievementDefinition, rhs: AchievementDefinition) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension SpecialAchievementDefinition: Hashable {
    static func == (lhs: SpecialAchievementDefinition, rhs: SpecialAchievementDefinition) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
