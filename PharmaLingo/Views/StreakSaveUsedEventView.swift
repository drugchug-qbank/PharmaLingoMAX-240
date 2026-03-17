import SwiftUI

struct StreakSaveUsedEventView: View {
    let event: AppEvent
    let onDismiss: () -> Void
    let onNavigate: (Int) -> Void

    @State private var animateShield: Bool = false
    @State private var animateContent: Bool = false
    @State private var pulseGlow: Bool = false

    private var streakCount: Int {
        event.intValue("streak_count") ?? 0
    }

    private var savesRemaining: Int {
        event.intValue("saves_remaining") ?? 0
    }

    private var missedDate: String {
        if let d = event.stringValue("missed_date") {
            let inputFmt = DateFormatter()
            inputFmt.dateFormat = "yyyy-MM-dd"
            let outputFmt = DateFormatter()
            outputFmt.dateFormat = "MMM d"
            if let date = inputFmt.date(from: d) {
                return outputFmt.string(from: date)
            }
            return d
        }
        return "yesterday"
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "1a0533"), Color(hex: "2d1b69"), Color(hex: "1a0533")],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [AppTheme.xpPurple.opacity(0.4), AppTheme.xpPurple.opacity(0)],
                                center: .center, startRadius: 30, endRadius: 100
                            )
                        )
                        .frame(width: 200, height: 200)
                        .scaleEffect(pulseGlow ? 1.15 : 1.0)

                    Image(systemName: "shield.checkered")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [AppTheme.xpPurple, AppTheme.funPink],
                                startPoint: .topLeading, endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(animateShield ? 1.0 : 0.3)
                        .opacity(animateShield ? 1.0 : 0)
                }

                if animateContent {
                    VStack(spacing: 12) {
                        Text("Streak Saved!")
                            .font(AppTheme.funFont(.largeTitle, weight: .heavy))
                            .foregroundStyle(.white)

                        Text("You missed \(missedDate), but a Streak Save kept your \(streakCount)-day streak alive.")
                            .font(AppTheme.funFont(.body, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))

                    HStack(spacing: 16) {
                        VStack(spacing: 4) {
                            Image(systemName: "flame.fill")
                                .font(.title2)
                                .foregroundStyle(AppTheme.accentOrange)
                            Text("\(streakCount)")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(.white)
                            Text("Streak")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(.white.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 16))

                        VStack(spacing: 4) {
                            Image(systemName: "shield.fill")
                                .font(.title2)
                                .foregroundStyle(AppTheme.xpPurple)
                            Text("\(savesRemaining)")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(.white)
                            Text("Saves Left")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(.white.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 16))
                    }
                    .padding(.horizontal, 32)
                    .transition(.move(edge: .bottom).combined(with: .opacity))

                    if savesRemaining == 0 {
                        HStack(spacing: 6) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.caption)
                                .foregroundStyle(AppTheme.warningYellow)
                            Text("No saves remaining! Don't miss another day.")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(AppTheme.warningYellow)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(AppTheme.warningYellow.opacity(0.12))
                        .clipShape(Capsule())
                        .transition(.opacity)
                    }
                }

                Spacer()

                VStack(spacing: 12) {
                    Button {
                        onNavigate(0)
                        onDismiss()
                    } label: {
                        Text("Keep Learning")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(colors: [AppTheme.xpPurple, AppTheme.funPink], startPoint: .leading, endPoint: .trailing)
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
            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                animateShield = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(duration: 0.5)) {
                    animateContent = true
                }
            }
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.6)) {
                pulseGlow = true
            }
        }
    }
}
