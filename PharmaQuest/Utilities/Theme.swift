import SwiftUI

enum AppTheme {
    static let primaryBlue = Color(red: 0.11, green: 0.53, blue: 0.93)
    static let darkBlue = Color(red: 0.05, green: 0.28, blue: 0.63)
    static let lightBlue = Color(red: 0.88, green: 0.94, blue: 1.0)
    static let accentOrange = Color(red: 1.0, green: 0.6, blue: 0.0)
    static let heartRed = Color(red: 0.9, green: 0.22, blue: 0.21)
    static let successGreen = Color(red: 0.18, green: 0.72, blue: 0.35)
    static let warningYellow = Color(red: 1.0, green: 0.8, blue: 0.0)
    static let xpPurple = Color(red: 0.56, green: 0.27, blue: 0.87)

    static var headerGradient: LinearGradient {
        LinearGradient(
            colors: [darkBlue, primaryBlue],
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(CardModifier())
    }
}
