import SwiftUI

struct FlickeringStreakView: View {
    let streak: Int

    @State private var flickerPhase: Int = 0

    private let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()

    private var flameScale: CGFloat {
        switch flickerPhase % 6 {
        case 0: 1.0
        case 1: 1.08
        case 2: 0.95
        case 3: 1.05
        case 4: 0.98
        case 5: 1.03
        default: 1.0
        }
    }

    private var flameRotation: Double {
        switch flickerPhase % 6 {
        case 0: 0
        case 1: 2.5
        case 2: -1.5
        case 3: 1.8
        case 4: -2.0
        case 5: 0.8
        default: 0
        }
    }

    private var flameOpacity: Double {
        switch flickerPhase % 6 {
        case 0: 1.0
        case 1: 0.85
        case 2: 1.0
        case 3: 0.9
        case 4: 1.0
        case 5: 0.88
        default: 1.0
        }
    }

    var body: some View {
        HStack(spacing: 4) {
            ZStack {
                Image(systemName: "flame.fill")
                    .font(.title2)
                    .foregroundStyle(AppTheme.accentOrange.opacity(0.4))
                    .scaleEffect(flameScale * 1.15)
                    .blur(radius: 3)
                    .opacity(streak > 0 ? 0.5 : 0)

                Image(systemName: "flame.fill")
                    .font(.title2)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "FF6B00"), AppTheme.accentOrange, AppTheme.warningYellow],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .scaleEffect(streak > 0 ? flameScale : 1.0)
                    .rotationEffect(.degrees(streak > 0 ? flameRotation : 0))
                    .opacity(streak > 0 ? flameOpacity : 0.5)
            }

            Text("\(streak)")
                .font(AppTheme.funFont(.title2, weight: .heavy))
                .foregroundStyle(.white)
        }
        .onReceive(timer) { _ in
            guard streak > 0 else { return }
            withAnimation(.easeInOut(duration: 0.15)) {
                flickerPhase += 1
            }
        }
    }
}
