import SwiftUI

struct MonthlyProfessionResultEventView: View {
    let event: AppEvent
    let onDismiss: () -> Void
    let onNavigate: (Int) -> Void

    @State private var animateIcon: Bool = false
    @State private var animateContent: Bool = false
    @State private var showConfetti: Bool = false

    private var profession: String {
        event.stringValue("profession") ?? "Your Profession"
    }

    private var rank: Int {
        event.intValue("rank") ?? 0
    }

    private var totalDonations: Int {
        event.intValue("total_donations") ?? 0
    }

    private var monthName: String {
        event.stringValue("month_name") ?? "Last Month"
    }

    private var isTopProfession: Bool {
        rank == 1
    }

    private var iconColor: Color {
        if rank == 1 { return Color(hex: "FFD700") }
        if rank <= 3 { return AppTheme.primaryBlue }
        return AppTheme.funTeal
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "0a1a1a"), Color(hex: "0d3333"), Color(hex: "0a1a1a")],
                startPoint: .top, endPoint: .bottom
            )
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
                                colors: [iconColor.opacity(0.35), iconColor.opacity(0)],
                                center: .center, startRadius: 25, endRadius: 90
                            )
                        )
                        .frame(width: 180, height: 180)

                    Image(systemName: "cross.case.fill")
                        .font(.system(size: 72))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [iconColor, iconColor.opacity(0.7)],
                                startPoint: .topLeading, endPoint: .bottomTrailing
                            )
                        )
                        .scaleEffect(animateIcon ? 1.0 : 0.3)
                        .opacity(animateIcon ? 1.0 : 0)
                }

                if animateContent {
                    VStack(spacing: 10) {
                        Text(isTopProfession ? "Profession Champions!" : "Monthly Results")
                            .font(AppTheme.funFont(.largeTitle, weight: .heavy))
                            .foregroundStyle(.white)

                        Text(monthName)
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(iconColor)

                        Text(profession)
                            .font(AppTheme.funFont(.title3, weight: .heavy))
                            .foregroundStyle(.white.opacity(0.9))
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))

                    HStack(spacing: 16) {
                        VStack(spacing: 4) {
                            Text("#\(rank)")
                                .font(.system(size: 40, weight: .heavy, design: .rounded))
                                .foregroundStyle(iconColor)
                            Text("Profession Rank")
                                .font(AppTheme.funFont(.caption, weight: .bold))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(.white.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 16))

                        VStack(spacing: 4) {
                            HStack(spacing: 4) {
                                Image(systemName: "gift.fill")
                                    .font(.title3)
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text("\(totalDonations)")
                                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                            Text("Total Donated")
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

                    Text("Donate coins to your profession to climb the ranks!")
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.white.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                        .transition(.opacity)
                }

                Spacer()

                VStack(spacing: 12) {
                    Button {
                        onNavigate(2)
                        onDismiss()
                    } label: {
                        Text("View Rankings")
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(colors: [AppTheme.funTeal, AppTheme.primaryBlue], startPoint: .leading, endPoint: .trailing)
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
                animateIcon = true
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
