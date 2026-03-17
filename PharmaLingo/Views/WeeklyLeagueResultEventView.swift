import SwiftUI

struct WeeklyLeagueResultEventView: View {
    let event: AppEvent
    let onDismiss: () -> Void
    let onNavigate: (Int) -> Void

    @State private var animateTrophy: Bool = false
    @State private var animateContent: Bool = false
    @State private var showConfetti: Bool = false

    private var rank: Int {
        event.intValue("rank") ?? 0
    }

    private var weeklyXP: Int {
        event.intValue("weekly_xp") ?? 0
    }

    private var leagueName: String {
        event.stringValue("league_name") ?? "Bronze League"
    }

    private var promoted: Bool {
        event.boolValue("promoted") ?? false
    }

    private var relegated: Bool {
        event.boolValue("relegated") ?? false
    }

    private var trophyIcon: String {
        if rank == 1 { return "trophy.fill" }
        if rank <= 3 { return "medal.fill" }
        if rank <= 10 { return "rosette" }
        return "flag.checkered"
    }

    private var trophyColor: Color {
        if rank == 1 { return Color(hex: "FFD700") }
        if rank == 2 { return Color(hex: "C0C0C0") }
        if rank == 3 { return Color(hex: "CD7F32") }
        return AppTheme.primaryBlue
    }

    private var bgColors: [Color] {
        if rank <= 3 {
            return [Color(hex: "1a1200"), Color(hex: "3d2e00"), Color(hex: "1a1200")]
        }
        return [Color(hex: "0a1a2e"), Color(hex: "0d2b4a"), Color(hex: "0a1a2e")]
    }

    private var resultTitle: String {
        if rank == 1 { return "League Champion!" }
        if rank <= 3 { return "Top 3 Finish!" }
        if rank <= 10 { return "Strong Week!" }
        return "Week Complete"
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: bgColors, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            if showConfetti && rank <= 3 {
                ConfettiView()
                    .ignoresSafeArea()
            }

            VStack(spacing: 24) {
                Spacer()

                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [trophyColor.opacity(0.35), trophyColor.opacity(0)],
                                center: .center, startRadius: 25, endRadius: 90
                            )
                        )
                        .frame(width: 180, height: 180)

                    Image(systemName: trophyIcon)
                        .font(.system(size: 72))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [trophyColor, trophyColor.opacity(0.7)],
                                startPoint: .top, endPoint: .bottom
                            )
                        )
                        .scaleEffect(animateTrophy ? 1.0 : 0.3)
                        .opacity(animateTrophy ? 1.0 : 0)
                }

                if animateContent {
                    VStack(spacing: 10) {
                        Text(resultTitle)
                            .font(AppTheme.funFont(.largeTitle, weight: .heavy))
                            .foregroundStyle(.white)

                        Text(leagueName)
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(trophyColor)

                        if promoted {
                            HStack(spacing: 6) {
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundStyle(AppTheme.successGreen)
                                Text("Promoted!")
                                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                    .foregroundStyle(AppTheme.successGreen)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(AppTheme.successGreen.opacity(0.15))
                            .clipShape(Capsule())
                        } else if relegated {
                            HStack(spacing: 6) {
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundStyle(AppTheme.heartRed)
                                Text("Relegated")
                                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                    .foregroundStyle(AppTheme.heartRed)
                            }
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(AppTheme.heartRed.opacity(0.15))
                            .clipShape(Capsule())
                        }
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))

                    HStack(spacing: 16) {
                        VStack(spacing: 4) {
                            Text("#\(rank)")
                                .font(.system(size: 40, weight: .heavy, design: .rounded))
                                .foregroundStyle(trophyColor)
                            Text("Final Rank")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(.white.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 16))

                        VStack(spacing: 4) {
                            HStack(spacing: 4) {
                                Image(systemName: "bolt.fill")
                                    .font(.title3)
                                    .foregroundStyle(AppTheme.primaryBlue)
                                Text("\(weeklyXP)")
                                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                            Text("Weekly XP")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(.white.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 16))
                    }
                    .padding(.horizontal, 24)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                Spacer()

                VStack(spacing: 12) {
                    Button {
                        onNavigate(2)
                        onDismiss()
                    } label: {
                        Text("View Leaderboard")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(colors: [trophyColor, trophyColor.opacity(0.7)], startPoint: .leading, endPoint: .trailing)
                            )
                            .clipShape(.rect(cornerRadius: 14))
                    }

                    Button {
                        onDismiss()
                    } label: {
                        Text("Dismiss")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                            .foregroundStyle(.white.opacity(0.6))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.55)) {
                animateTrophy = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(duration: 0.5)) {
                    animateContent = true
                }
            }
            if rank <= 3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    showConfetti = true
                }
            }
        }
    }
}
