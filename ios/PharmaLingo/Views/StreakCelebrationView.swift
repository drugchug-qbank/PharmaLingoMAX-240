import SwiftUI

struct StreakCelebrationView: View {
    let currentStreak: Int
    let previousStreak: Int
    let activityDates: Set<String>
    let onContinue: () -> Void

    @State private var showFlame: Bool = false
    @State private var flameScale: CGFloat = 0.1
    @State private var pulseGlow: Bool = false
    @State private var showStreakCount: Bool = false
    @State private var showWeekRow: Bool = false
    @State private var showMessage: Bool = false
    @State private var showButton: Bool = false
    @State private var displayedStreak: Int
    @State private var showPlusOne: Bool = false
    @State private var revealedDayIndex: Int = -1
    @State private var sparkleRotation: Double = 0

    private let weekDays = ["S", "M", "T", "W", "T", "F", "S"]

    init(currentStreak: Int, previousStreak: Int, activityDates: Set<String>, onContinue: @escaping () -> Void) {
        self.currentStreak = currentStreak
        self.previousStreak = previousStreak
        self.activityDates = activityDates
        self.onContinue = onContinue
        self._displayedStreak = State(initialValue: max(previousStreak, currentStreak - 1))
    }

    private var streakExtended: Bool { currentStreak > previousStreak }

    private var weekDayDates: [WeekDayInfo] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let weekday = calendar.component(.weekday, from: today)
        let sundayOffset = -(weekday - 1)

        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"

        return (0..<7).map { i in
            let date = calendar.date(byAdding: .day, value: sundayOffset + i, to: today)!
            let dateStr = fmt.string(from: date)
            let isToday = calendar.isDateInToday(date)
            let isFuture = date > today
            let hasActivity = activityDates.contains(dateStr)
            return WeekDayInfo(index: i, label: weekDays[i], isToday: isToday, isFuture: isFuture, hasActivity: hasActivity)
        }
    }

    private var motivationalMessage: String {
        if currentStreak >= 30 { return "Legendary dedication!" }
        if currentStreak >= 14 { return "Two weeks strong! Unstoppable!" }
        if currentStreak >= 7 { return "A full week! Keep the fire alive!" }
        if currentStreak >= 3 { return "Building momentum! Don't stop!" }
        if streakExtended { return "Great job showing up today!" }
        return "Every day counts. Keep going!"
    }

    private var streakEmoji: String {
        if currentStreak >= 30 { return "👑" }
        if currentStreak >= 14 { return "⚡" }
        if currentStreak >= 7 { return "🔥" }
        if currentStreak >= 3 { return "💪" }
        return "✨"
    }

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                flameSection
                    .padding(.bottom, 8)

                if showStreakCount {
                    streakCountSection
                        .transition(.scale.combined(with: .opacity))
                        .padding(.bottom, 20)
                }

                if showWeekRow {
                    weekSection
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .padding(.bottom, 24)
                }

                if showMessage {
                    Text(motivationalMessage)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .transition(.opacity)
                        .padding(.bottom, 8)
                }

                Spacer()

                if showButton {
                    Button {
                        onContinue()
                    } label: {
                        Text("Continue")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(AppTheme.accentOrange)
                            .clipShape(.rect(cornerRadius: 14))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .onAppear { runEntrance() }
    }

    private var flameSection: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            AppTheme.accentOrange.opacity(pulseGlow ? 0.25 : 0.1),
                            AppTheme.accentOrange.opacity(0)
                        ],
                        center: .center,
                        startRadius: 10,
                        endRadius: 80
                    )
                )
                .frame(width: 160, height: 160)
                .scaleEffect(pulseGlow ? 1.2 : 0.9)

            ForEach(0..<8, id: \.self) { i in
                Image(systemName: "sparkle")
                    .font(.system(size: CGFloat.random(in: 6...10)))
                    .foregroundStyle(AppTheme.warningYellow.opacity(showFlame ? 0.6 : 0))
                    .offset(
                        x: cos(Double(i) * .pi / 4 + sparkleRotation * 0.02) * 55,
                        y: sin(Double(i) * .pi / 4 + sparkleRotation * 0.02) * 55
                    )
                    .scaleEffect(showFlame ? 1.0 : 0.3)
            }

            Image(systemName: "flame.fill")
                .font(.system(size: 72))
                .foregroundStyle(
                    LinearGradient(
                        colors: [AppTheme.warningYellow, AppTheme.accentOrange, AppTheme.heartRed],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: AppTheme.accentOrange.opacity(0.5), radius: 16, y: 4)
                .scaleEffect(flameScale)
                .opacity(showFlame ? 1 : 0)

            if showPlusOne && streakExtended {
                Text("+1")
                    .font(.system(size: 22, weight: .black, design: .rounded))
                    .foregroundStyle(AppTheme.warningYellow)
                    .shadow(color: AppTheme.warningYellow.opacity(0.5), radius: 4)
                    .offset(x: 42, y: -38)
                    .transition(.asymmetric(
                        insertion: .scale(scale: 0.3).combined(with: .opacity),
                        removal: .opacity
                    ))
            }
        }
    }

    private var streakCountSection: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Text("\(displayedStreak)")
                    .font(.system(size: 48, weight: .black, design: .rounded))
                    .foregroundStyle(AppTheme.accentOrange)
                    .contentTransition(.numericText(countsDown: false))
                    .animation(.spring(response: 0.5, dampingFraction: 0.6), value: displayedStreak)

                Text("day streak \(streakEmoji)")
                    .font(AppTheme.funFont(.title2, weight: .heavy))
                    .foregroundStyle(AppTheme.accentOrange)
            }

            if streakExtended {
                Text("Streak Extended!")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(AppTheme.warningYellow)
            } else {
                Text("Streak Maintained!")
                    .font(AppTheme.funFont(.subheadline, weight: .bold))
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var weekSection: some View {
        VStack(spacing: 10) {
            Text("THIS WEEK")
                .font(.system(size: 11, weight: .heavy, design: .rounded))
                .foregroundStyle(.tertiary)
                .tracking(1.5)

            HStack(spacing: 10) {
                ForEach(weekDayDates, id: \.index) { day in
                    weekDayCell(day: day)
                }
            }
            .padding(.horizontal, 20)
        }
    }

    @ViewBuilder
    private func weekDayCell(day: WeekDayInfo) -> some View {
        let isRevealed = revealedDayIndex >= day.index
        let shouldAnimate = day.isToday && day.hasActivity

        VStack(spacing: 6) {
            Text(day.label)
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundStyle(day.isToday ? .primary : .secondary)

            ZStack {
                Circle()
                    .fill(
                        day.hasActivity && isRevealed
                            ? AppTheme.accentOrange.opacity(0.15)
                            : Color(.tertiarySystemFill)
                    )
                    .frame(width: 38, height: 38)

                if day.isFuture {
                    Circle()
                        .strokeBorder(Color(.separator).opacity(0.3), lineWidth: 1)
                        .frame(width: 38, height: 38)
                } else if day.hasActivity && isRevealed {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [AppTheme.warningYellow, AppTheme.accentOrange],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .scaleEffect(shouldAnimate && revealedDayIndex == day.index ? 1.3 : 1.0)
                        .animation(
                            shouldAnimate ? .spring(response: 0.3, dampingFraction: 0.4) : .default,
                            value: revealedDayIndex
                        )
                } else if !day.isFuture {
                    Circle()
                        .fill(Color(.quaternarySystemFill))
                        .frame(width: 6, height: 6)
                }

                if day.isToday {
                    Circle()
                        .strokeBorder(AppTheme.accentOrange, lineWidth: 2.5)
                        .frame(width: 38, height: 38)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    private func runEntrance() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
            showFlame = true
            flameScale = 1.0
        }

        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.6)) {
            pulseGlow = true
        }

        withAnimation(.linear(duration: 20).repeatForever(autoreverses: false).delay(0.5)) {
            sparkleRotation = 360
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                showStreakCount = true
            }
        }

        if streakExtended {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    showPlusOne = true
                }
                withAnimation {
                    displayedStreak = currentStreak
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation { showPlusOne = false }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.spring(duration: 0.5)) {
                showWeekRow = true
            }
            revealWeekDays()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.spring(duration: 0.4)) { showMessage = true }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.spring(duration: 0.4)) { showButton = true }
        }
    }

    private func revealWeekDays() {
        let days = weekDayDates
        for day in days where !day.isFuture {
            let delay = Double(day.index) * 0.12 + 0.15
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 + delay) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    revealedDayIndex = day.index
                }
            }
        }
    }
}

private struct WeekDayInfo {
    let index: Int
    let label: String
    let isToday: Bool
    let isFuture: Bool
    let hasActivity: Bool
}
