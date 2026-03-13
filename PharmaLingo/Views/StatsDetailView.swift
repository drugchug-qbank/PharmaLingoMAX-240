import SwiftUI

struct StatsDetailView: View {
    let gameVM: GameViewModel
    @State private var selectedSection: StatSection = .streak

    enum StatSection: String, CaseIterable {
        case streak = "Streak"
        case accuracy = "Accuracy"
        case lessons = "Lessons"
        case aura = "Aura"

        var icon: String {
            switch self {
            case .streak: "flame.fill"
            case .accuracy: "target"
            case .lessons: "book.closed.fill"
            case .aura: "sparkles"
            }
        }

        var color: Color {
            switch self {
            case .streak: AppTheme.accentOrange
            case .accuracy: AppTheme.primaryBlue
            case .lessons: AppTheme.successGreen
            case .aura: AppTheme.xpPurple
            }
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(spacing: 0) {
                    ForEach(StatSection.allCases, id: \.self) { section in
                        Button {
                            withAnimation(.spring(duration: 0.25)) { selectedSection = section }
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: section.icon)
                                    .font(.subheadline)
                                    .foregroundStyle(selectedSection == section ? section.color : .secondary)
                                Text(section.rawValue)
                                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                                    .foregroundStyle(selectedSection == section ? section.color : .secondary)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(selectedSection == section ? section.color.opacity(0.1) : .clear)
                            .clipShape(.rect(cornerRadius: 12))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(4)
                .background(Color(.tertiarySystemFill))
                .clipShape(.rect(cornerRadius: 14))

                switch selectedSection {
                case .streak:
                    streakSection
                case .accuracy:
                    accuracySection
                case .lessons:
                    lessonsSection
                case .aura:
                    auraSection
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 32)
        }
        .scrollIndicators(.hidden)
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Your Stats")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private var streakSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                VStack(spacing: 4) {
                    Text("\(gameVM.currentStreak)")
                        .font(.system(size: 44, weight: .heavy, design: .rounded))
                        .foregroundStyle(AppTheme.accentOrange)
                    Text("Current Streak")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .cardStyle(borderColor: AppTheme.accentOrange.opacity(0.3))

                VStack(spacing: 4) {
                    Text("\(gameVM.streakSaves)")
                        .font(.system(size: 44, weight: .heavy, design: .rounded))
                        .foregroundStyle(AppTheme.xpPurple)
                    Text("Streak Saves")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))
            }

            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "calendar", title: "Activity Calendar", color: AppTheme.accentOrange)
                StreakCalendarView(gameVM: gameVM)
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.accentOrange.opacity(0.3))

            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "chart.bar.fill", title: "Streak Milestones", color: AppTheme.warningYellow)

                let milestones: [(days: Int, title: String, icon: String)] = [
                    (3, "Getting Started", "flame"),
                    (7, "One Week Strong", "flame.fill"),
                    (14, "Two Week Warrior", "bolt.fill"),
                    (30, "Monthly Master", "star.fill"),
                    (60, "Unstoppable", "crown.fill"),
                    (100, "Century Club", "trophy.fill"),
                ]

                ForEach(milestones, id: \.days) { milestone in
                    let achieved = gameVM.currentStreak >= milestone.days
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(achieved ? AppTheme.warningYellow.opacity(0.15) : Color(.tertiarySystemFill))
                                .frame(width: 40, height: 40)
                            Image(systemName: milestone.icon)
                                .font(.subheadline)
                                .foregroundStyle(achieved ? AppTheme.warningYellow : Color(.tertiaryLabel))
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text(milestone.title)
                                .font(AppTheme.funFont(.subheadline, weight: .bold))
                                .foregroundStyle(achieved ? .primary : .secondary)
                            Text("\(milestone.days) day streak")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        if achieved {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(AppTheme.successGreen)
                        } else {
                            Text("\(milestone.days - gameVM.currentStreak) to go")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.tertiary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
        }
    }

    @ViewBuilder
    private var accuracySection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                VStack(spacing: 8) {
                    ZStack {
                        ProgressRing(
                            progress: gameVM.accuracy,
                            size: 100,
                            lineWidth: 10,
                            color: accuracyColor
                        )
                        VStack(spacing: 0) {
                            Text("\(Int(gameVM.accuracy * 100))%")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(accuracyColor)
                        }
                    }
                    Text("Overall Accuracy")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .cardStyle(borderColor: accuracyColor.opacity(0.3))

                VStack(spacing: 12) {
                    VStack(spacing: 4) {
                        Text("\(gameVM.questionsAnswered)")
                            .font(AppTheme.funFont(.title, weight: .heavy))
                            .foregroundStyle(AppTheme.primaryBlue)
                        Text("Answered")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }

                    Divider()

                    VStack(spacing: 4) {
                        Text("\(gameVM.questionsCorrect)")
                            .font(AppTheme.funFont(.title, weight: .heavy))
                            .foregroundStyle(AppTheme.successGreen)
                        Text("Correct")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.3))
            }

            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "chart.pie.fill", title: "Breakdown", color: AppTheme.primaryBlue)

                let incorrect = gameVM.questionsAnswered - gameVM.questionsCorrect

                HStack(spacing: 0) {
                    if gameVM.questionsAnswered > 0 {
                        let correctRatio = CGFloat(gameVM.questionsCorrect) / CGFloat(gameVM.questionsAnswered)
                        RoundedRectangle(cornerRadius: 6)
                            .fill(AppTheme.successGreen)
                            .frame(height: 24)
                            .frame(maxWidth: .infinity)
                            .scaleEffect(x: correctRatio, anchor: .leading)
                            .overlay(alignment: .leading) {
                                if correctRatio > 0.15 {
                                    Text("\(gameVM.questionsCorrect)")
                                        .font(AppTheme.funFont(.caption2, weight: .heavy))
                                        .foregroundStyle(.white)
                                        .padding(.leading, 8)
                                }
                            }
                    }
                }
                .frame(height: 24)
                .background(AppTheme.heartRed.opacity(0.8))
                .clipShape(.rect(cornerRadius: 6))

                HStack(spacing: 16) {
                    HStack(spacing: 6) {
                        Circle().fill(AppTheme.successGreen).frame(width: 10, height: 10)
                        Text("Correct: \(gameVM.questionsCorrect)")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                    }
                    HStack(spacing: 6) {
                        Circle().fill(AppTheme.heartRed).frame(width: 10, height: 10)
                        Text("Incorrect: \(incorrect)")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                    }
                    Spacer()
                }

                Divider()

                VStack(spacing: 8) {
                    accuracyStatRow(label: "Total Questions", value: "\(gameVM.questionsAnswered)", icon: "questionmark.circle.fill", color: AppTheme.primaryBlue)
                    accuracyStatRow(label: "Correct Answers", value: "\(gameVM.questionsCorrect)", icon: "checkmark.circle.fill", color: AppTheme.successGreen)
                    accuracyStatRow(label: "Incorrect Answers", value: "\(incorrect)", icon: "xmark.circle.fill", color: AppTheme.heartRed)
                    accuracyStatRow(label: "Best Combo", value: "\(gameVM.consecutiveCorrect)", icon: "bolt.fill", color: AppTheme.warningYellow)
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.3))
        }
    }

    private var accuracyColor: Color {
        let pct = gameVM.accuracy
        if pct >= 0.9 { return AppTheme.successGreen }
        if pct >= 0.7 { return AppTheme.primaryBlue }
        if pct >= 0.5 { return AppTheme.accentOrange }
        return AppTheme.heartRed
    }

    private func accuracyStatRow(label: String, value: String, icon: String, color: Color) -> some View {
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
        .padding(.vertical, 2)
    }

    @ViewBuilder
    private var lessonsSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                VStack(spacing: 4) {
                    Text("\(gameVM.lessonsCompleted)")
                        .font(.system(size: 44, weight: .heavy, design: .rounded))
                        .foregroundStyle(AppTheme.successGreen)
                    Text("Completed")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .cardStyle(borderColor: AppTheme.successGreen.opacity(0.3))

                VStack(spacing: 4) {
                    let totalStars = gameVM.subsectionStars.values.reduce(0, +)
                    Text("\(totalStars)")
                        .font(.system(size: 44, weight: .heavy, design: .rounded))
                        .foregroundStyle(AppTheme.warningYellow)
                    Text("Total Stars")
                        .font(AppTheme.funFont(.caption, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .cardStyle(borderColor: AppTheme.warningYellow.opacity(0.3))
            }

            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "books.vertical.fill", title: "Module Progress", color: AppTheme.successGreen)

                ForEach(Array(gameVM.modules.enumerated()), id: \.element.id) { index, module in
                    let progress = gameVM.moduleProgress(module)
                    let completedCount = module.subsections.filter { gameVM.completedSubsections.contains($0.id) }.count
                    let totalCount = module.subsections.count
                    let moduleColor = AppTheme.moduleColor(for: index)

                    VStack(spacing: 8) {
                        HStack {
                            Text("Module \(module.number)")
                                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                .foregroundStyle(moduleColor)
                            Spacer()
                            Text("\(completedCount)/\(totalCount)")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.secondary)
                        }

                        Text(module.title)
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(moduleColor.opacity(0.15))
                                    .frame(height: 8)
                                Capsule()
                                    .fill(moduleColor)
                                    .frame(width: max(geo.size.width * progress, progress > 0 ? 8 : 0), height: 8)
                            }
                        }
                        .frame(height: 8)
                    }
                    .padding(.vertical, 6)

                    if index < gameVM.modules.count - 1 {
                        Divider()
                    }
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.successGreen.opacity(0.3))

            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "bolt.fill", title: "XP Overview", color: AppTheme.xpPurple)

                HStack(spacing: 0) {
                    VStack(spacing: 4) {
                        Text("\(gameVM.totalXP)")
                            .font(AppTheme.funFont(.title2, weight: .heavy))
                            .foregroundStyle(AppTheme.xpPurple)
                        Text("Total XP")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)

                    Divider().frame(height: 40)

                    VStack(spacing: 4) {
                        Text("Lv.\(gameVM.level)")
                            .font(AppTheme.funFont(.title2, weight: .heavy))
                            .foregroundStyle(AppTheme.warningYellow)
                        Text("Current Level")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)

                    Divider().frame(height: 40)

                    VStack(spacing: 4) {
                        Text("\(gameVM.xpForNextLevel - gameVM.xpInCurrentLevel)")
                            .font(AppTheme.funFont(.title2, weight: .heavy))
                            .foregroundStyle(AppTheme.primaryBlue)
                        Text("XP to Next")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))
        }
    }

    @ViewBuilder
    private var auraSection: some View {
        let points = gameVM.clinicalAuraPoints
        let isPositive = points >= 0
        let auraColor = isPositive ? AppTheme.primaryBlue : AppTheme.heartRed

        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .font(.system(size: 40))
                    .foregroundStyle(auraColor)
                    .symbolEffect(.pulse, options: .repeating)

                Text("\(points)")
                    .font(.system(size: 56, weight: .heavy, design: .rounded))
                    .foregroundStyle(auraColor)
                    .monospacedDigit()

                Text("Clinical Aura Points")
                    .font(AppTheme.funFont(.headline, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .cardStyle(borderColor: auraColor.opacity(0.3))

            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "info.circle.fill", title: "How It Works", color: AppTheme.primaryBlue)

                VStack(spacing: 10) {
                    auraInfoRow(icon: "checkmark.circle.fill", text: "Correct daily clinical question", value: "+1", color: AppTheme.successGreen)
                    auraInfoRow(icon: "xmark.circle.fill", text: "Incorrect daily clinical question", value: "-1", color: AppTheme.heartRed)
                }

                Divider()

                Text("Clinical Aura Points reflect your daily clinical quiz performance. Challenge yourself every day to build your aura!")
                    .font(AppTheme.funFont(.caption, weight: .medium))
                    .foregroundStyle(.secondary)
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.3))

            VStack(alignment: .leading, spacing: 12) {
                FunSectionHeader(icon: "calendar.badge.clock", title: "Recent Results", color: AppTheme.xpPurple)
                ClinicalAuraHistoryView()
            }
            .padding(16)
            .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.3))
        }
    }

    private func auraInfoRow(icon: String, text: String, value: String, color: Color) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(color)
                .frame(width: 24)
            Text(text)
                .font(AppTheme.funFont(.subheadline, weight: .medium))
            Spacer()
            Text(value)
                .font(AppTheme.funFont(.subheadline, weight: .heavy))
                .foregroundStyle(color)
        }
    }
}

struct StreakCalendarView: View {
    let gameVM: GameViewModel
    @State private var displayedMonth: Date = Date()
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 7)

    private var calendar: Calendar { Calendar.current }

    private var monthTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: displayedMonth)
    }

    private var canGoBack: Bool {
        guard let earliest = earliestMonth else { return false }
        let displayedComps = calendar.dateComponents([.year, .month], from: displayedMonth)
        let earliestComps = calendar.dateComponents([.year, .month], from: earliest)
        if let dy = displayedComps.year, let dm = displayedComps.month,
           let ey = earliestComps.year, let em = earliestComps.month {
            return dy > ey || (dy == ey && dm > em)
        }
        return false
    }

    private var canGoForward: Bool {
        let nowComps = calendar.dateComponents([.year, .month], from: Date())
        let displayedComps = calendar.dateComponents([.year, .month], from: displayedMonth)
        if let ny = nowComps.year, let nm = nowComps.month,
           let dy = displayedComps.year, let dm = displayedComps.month {
            return dy < ny || (dy == ny && dm < nm)
        }
        return false
    }

    private var earliestMonth: Date? {
        if let created = gameVM.accountCreatedDate {
            return created
        }
        if let lastActive = gameVM.lastActiveDate, gameVM.currentStreak > 0 {
            return calendar.date(byAdding: .day, value: -(gameVM.currentStreak - 1), to: lastActive)
        }
        return calendar.date(byAdding: .month, value: -1, to: Date())
    }

    private var calendarDays: [CalendarDay] {
        let comps = calendar.dateComponents([.year, .month], from: displayedMonth)
        guard let firstOfMonth = calendar.date(from: comps),
              let range = calendar.range(of: .day, in: .month, for: firstOfMonth) else { return [] }

        let today = calendar.startOfDay(for: Date())
        let firstWeekday = calendar.component(.weekday, from: firstOfMonth)
        let leadingBlanks = firstWeekday - 1

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        var days: [CalendarDay] = []

        for _ in 0..<leadingBlanks {
            days.append(CalendarDay(date: nil, dayNumber: 0, hasActivity: false, isToday: false, wasStreakSave: false, isPlaceholder: true))
        }

        let accountStart: Date? = gameVM.accountCreatedDate.map { calendar.startOfDay(for: $0) }

        let firstActivityDate: Date? = {
            let allDates = gameVM.activityDates.union(gameVM.streakSaveDates)
            guard !allDates.isEmpty else { return nil }
            return allDates.compactMap { formatter.date(from: $0) }.min().map { calendar.startOfDay(for: $0) }
        }()

        for day in range {
            var dateComps = comps
            dateComps.day = day
            guard let date = calendar.date(from: dateComps) else { continue }
            let dateStart = calendar.startOfDay(for: date)
            let dateStr = formatter.string(from: dateStart)
            let isToday = calendar.isDate(dateStart, inSameDayAs: today)
            let hasActivity = gameVM.activityDates.contains(dateStr)
            let wasStreakSave = gameVM.streakSaveDates.contains(dateStr)
            let isFuture = dateStart > today
            let isBeforeAccount = accountStart.map { dateStart < $0 } ?? false
            let isBeforeFirstActivity = firstActivityDate.map { dateStart < $0 } ?? true

            days.append(CalendarDay(
                date: dateStart,
                dayNumber: day,
                hasActivity: isFuture ? false : hasActivity,
                isToday: isToday,
                wasStreakSave: isFuture ? false : wasStreakSave,
                isPlaceholder: false,
                isFuture: isFuture,
                isBeforeAccount: isBeforeAccount,
                isBeforeFirstActivity: isBeforeFirstActivity
            ))
        }

        return days
    }

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        displayedMonth = calendar.date(byAdding: .month, value: -1, to: displayedMonth) ?? displayedMonth
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(canGoBack ? AppTheme.primaryBlue : Color(.quaternaryLabel))
                }
                .disabled(!canGoBack)

                Spacer()

                Text(monthTitle)
                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                    .foregroundStyle(.primary)

                Spacer()

                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        displayedMonth = calendar.date(byAdding: .month, value: 1, to: displayedMonth) ?? displayedMonth
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(canGoForward ? AppTheme.primaryBlue : Color(.quaternaryLabel))
                }
                .disabled(!canGoForward)
            }

            HStack(spacing: 0) {
                ForEach(Array(["S", "M", "T", "W", "T", "F", "S"].enumerated()), id: \.offset) { _, day in
                    Text(day)
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                }
            }

            LazyVGrid(columns: columns, spacing: 6) {
                ForEach(Array(calendarDays.enumerated()), id: \.offset) { _, day in
                    CalendarDayCell(day: day)
                }
            }

            HStack(spacing: 12) {
                HStack(spacing: 5) {
                    Circle().fill(AppTheme.successGreen).frame(width: 8, height: 8)
                    Text("Active")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                HStack(spacing: 5) {
                    Circle().fill(AppTheme.xpPurple).frame(width: 8, height: 8)
                    Text("Saved")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                HStack(spacing: 5) {
                    Circle().fill(AppTheme.heartRed.opacity(0.4)).frame(width: 8, height: 8)
                    Text("Missed")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                HStack(spacing: 5) {
                    Circle()
                        .strokeBorder(AppTheme.primaryBlue, lineWidth: 1.5)
                        .frame(width: 8, height: 8)
                    Text("Today")
                        .font(AppTheme.funFont(.caption2, weight: .bold))
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.top, 2)
        }
    }
}

struct CalendarDay {
    let date: Date?
    let dayNumber: Int
    let hasActivity: Bool
    let isToday: Bool
    let wasStreakSave: Bool
    var isPlaceholder: Bool = false
    var isFuture: Bool = false
    var isBeforeAccount: Bool = false
    var isBeforeFirstActivity: Bool = false
}

struct CalendarDayCell: View {
    let day: CalendarDay

    var body: some View {
        Group {
            if day.isPlaceholder {
                Color.clear
                    .frame(width: 36, height: 36)
            } else {
                ZStack {
                    if day.wasStreakSave {
                        Circle()
                            .fill(AppTheme.xpPurple.opacity(0.18))
                    } else if day.hasActivity {
                        Circle()
                            .fill(AppTheme.successGreen.opacity(0.18))
                    } else if !day.isFuture && !day.isBeforeAccount && !day.isBeforeFirstActivity && !day.isToday {
                        Circle()
                            .fill(AppTheme.heartRed.opacity(0.1))
                    } else {
                        Circle()
                            .fill(Color(.tertiarySystemFill).opacity(0.5))
                    }

                    if day.isToday {
                        Circle()
                            .strokeBorder(AppTheme.primaryBlue, lineWidth: 2)
                    }

                    Text("\(day.dayNumber)")
                        .font(.system(size: 11, weight: day.isToday ? .bold : .medium, design: .rounded))
                        .foregroundStyle(
                            day.wasStreakSave ? AppTheme.xpPurple :
                            day.hasActivity ? AppTheme.successGreen :
                            (day.isFuture || day.isBeforeAccount || day.isBeforeFirstActivity) ? Color(.quaternaryLabel) :
                            Color(.tertiaryLabel)
                        )
                }
                .frame(width: 36, height: 36)
            }
        }
    }
}

struct ClinicalAuraHistoryView: View {
    private var recentResults: [(date: String, correct: Bool)] {
        let answered = UserDefaults.standard.dictionary(forKey: "cqotd_answered_dates") as? [String: Bool] ?? [:]
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "MMM d"

        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        return (0..<14).compactMap { daysAgo in
            let date = calendar.date(byAdding: .day, value: -daysAgo, to: today) ?? today
            let dateStr = formatter.string(from: date)
            guard let result = answered[dateStr] else { return nil }
            return (displayFormatter.string(from: date), result)
        }
    }

    var body: some View {
        if recentResults.isEmpty {
            VStack(spacing: 8) {
                Image(systemName: "calendar.badge.exclamationmark")
                    .font(.title2)
                    .foregroundStyle(.secondary)
                Text("No clinical quiz history yet")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(.secondary)
                Text("Complete the daily clinical quiz to see your history here.")
                    .font(AppTheme.funFont(.caption, weight: .medium))
                    .foregroundStyle(.tertiary)
                    .multilineTextAlignment(.center)
            }
            .padding(16)
        } else {
            VStack(spacing: 8) {
                ForEach(Array(recentResults.enumerated()), id: \.offset) { _, result in
                    HStack(spacing: 12) {
                        Image(systemName: result.correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(result.correct ? AppTheme.successGreen : AppTheme.heartRed)
                        Text(result.date)
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                        Spacer()
                        Text(result.correct ? "+1" : "-1")
                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                            .foregroundStyle(result.correct ? AppTheme.successGreen : AppTheme.heartRed)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}
