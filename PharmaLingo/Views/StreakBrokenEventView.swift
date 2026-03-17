import SwiftUI

struct StreakBrokenEventView: View {
    let event: AppEvent
    let onDismiss: () -> Void
    let onNavigate: (Int) -> Void

    @State private var animateIcon: Bool = false
    @State private var animateContent: Bool = false
    @State private var shakeOffset: CGFloat = 0

    private var lostStreak: Int {
        event.intValue("lost_streak") ?? 0
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "1a0a0a"), Color(hex: "4a1010"), Color(hex: "1a0a0a")],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [AppTheme.heartRed.opacity(0.3), AppTheme.heartRed.opacity(0)],
                                center: .center, startRadius: 30, endRadius: 100
                            )
                        )
                        .frame(width: 200, height: 200)

                    Image(systemName: "flame.slash")
                        .font(.system(size: 80))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [AppTheme.heartRed, AppTheme.accentOrange.opacity(0.6)],
                                startPoint: .top, endPoint: .bottom
                            )
                        )
                        .scaleEffect(animateIcon ? 1.0 : 0.3)
                        .opacity(animateIcon ? 1.0 : 0)
                        .offset(x: shakeOffset)
                }

                if animateContent {
                    VStack(spacing: 12) {
                        Text("Streak Lost")
                            .font(AppTheme.funFont(.largeTitle, weight: .heavy))
                            .foregroundStyle(.white)

                        if lostStreak > 0 {
                            Text("Your \(lostStreak)-day streak has ended.")
                                .font(AppTheme.funFont(.body, weight: .medium))
                                .foregroundStyle(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                        }

                        Text("Don't worry — every great streak starts with Day 1. Get back in there!")
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.white.opacity(0.6))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))

                    if lostStreak > 0 {
                        VStack(spacing: 4) {
                            Text("\(lostStreak)")
                                .font(.system(size: 56, weight: .heavy, design: .rounded))
                                .foregroundStyle(AppTheme.heartRed.opacity(0.5))
                            Text("Days Lost")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.white.opacity(0.4))
                        }
                        .frame(width: 140)
                        .padding(.vertical, 16)
                        .background(.white.opacity(0.06))
                        .clipShape(.rect(cornerRadius: 16))
                        .transition(.scale.combined(with: .opacity))
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "lightbulb.fill")
                            .font(.caption)
                            .foregroundStyle(AppTheme.warningYellow)
                        Text("Tip: Stock up on Streak Saves in the Shop!")
                            .font(AppTheme.funFont(.caption, weight: .bold))
                            .foregroundStyle(AppTheme.warningYellow)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(AppTheme.warningYellow.opacity(0.1))
                    .clipShape(Capsule())
                    .transition(.opacity)
                }

                Spacer()

                VStack(spacing: 12) {
                    Button {
                        onNavigate(0)
                        onDismiss()
                    } label: {
                        Text("Start a New Streak")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(colors: [AppTheme.accentOrange, AppTheme.heartRed], startPoint: .leading, endPoint: .trailing)
                            )
                            .clipShape(.rect(cornerRadius: 14))
                    }

                    Button {
                        onNavigate(3)
                        onDismiss()
                    } label: {
                        Text("Visit Shop")
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                animateIcon = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.default) {
                    shakeOffset = 12
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                    withAnimation(.default) { shakeOffset = -10 }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                        withAnimation(.default) { shakeOffset = 6 }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) { shakeOffset = 0 }
                        }
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.spring(duration: 0.5)) {
                    animateContent = true
                }
            }
        }
    }
}
