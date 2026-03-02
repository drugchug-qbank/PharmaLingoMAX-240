import SwiftUI

struct ConfettiPiece: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    let color: Color
    let size: CGFloat
    let rotation: Double
    let speed: Double
    let wobble: Double
}

struct ConfettiView: View {
    @State private var pieces: [ConfettiPiece] = []
    @State private var animate: Bool = false
    let colors: [Color] = [
        AppTheme.primaryBlue, AppTheme.successGreen, AppTheme.warningYellow,
        AppTheme.heartRed, AppTheme.accentOrange, AppTheme.xpPurple,
        AppTheme.funPink, AppTheme.funTeal
    ]

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(pieces) { piece in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(piece.color)
                        .frame(width: piece.size, height: piece.size * 0.6)
                        .rotationEffect(.degrees(animate ? piece.rotation + 360 : piece.rotation))
                        .position(
                            x: piece.x + (animate ? CGFloat(piece.wobble) * 30 : 0),
                            y: animate ? geo.size.height + 50 : piece.y
                        )
                        .opacity(animate ? 0 : 1)
                }
            }
            .onAppear {
                pieces = (0..<60).map { _ in
                    ConfettiPiece(
                        x: CGFloat.random(in: 0...geo.size.width),
                        y: CGFloat.random(in: -100...(-10)),
                        color: colors.randomElement()!,
                        size: CGFloat.random(in: 6...12),
                        rotation: Double.random(in: 0...360),
                        speed: Double.random(in: 2...4),
                        wobble: Double.random(in: -1...1)
                    )
                }
                withAnimation(.easeIn(duration: 3.0)) {
                    animate = true
                }
            }
        }
        .allowsHitTesting(false)
    }
}

struct StreakFlameView: View {
    let streak: Int
    @State private var flameScale: CGFloat = 0.3
    @State private var flameOpacity: Double = 0
    @State private var pulseFlame: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [AppTheme.accentOrange.opacity(0.3), AppTheme.accentOrange.opacity(0)],
                            center: .center,
                            startRadius: 20,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                    .scaleEffect(pulseFlame ? 1.15 : 1.0)

                Image(systemName: "flame.fill")
                    .font(.system(size: 56))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [AppTheme.warningYellow, AppTheme.accentOrange, AppTheme.heartRed],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .scaleEffect(flameScale)
                    .opacity(flameOpacity)
            }

            Text("\(streak) Day Streak!")
                .font(AppTheme.funFont(.title2, weight: .heavy))
                .foregroundStyle(AppTheme.accentOrange)
                .scaleEffect(flameScale)
                .opacity(flameOpacity)
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                flameScale = 1.0
                flameOpacity = 1.0
            }
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true).delay(0.6)) {
                pulseFlame = true
            }
        }
    }
}
