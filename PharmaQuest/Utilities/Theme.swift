import SwiftUI

enum AppTheme {
    static let primaryBlue = Color(hex: "0d97db")
    static let darkBlue = Color(hex: "0a6fa3")
    static let lightBlue = Color(hex: "d6f0ff")
    static let headerBlue = Color(hex: "0b84c2")
    static let accentOrange = Color(red: 1.0, green: 0.58, blue: 0.0)
    static let heartRed = Color(red: 0.95, green: 0.25, blue: 0.25)
    static let successGreen = Color(red: 0.30, green: 0.78, blue: 0.35)
    static let warningYellow = Color(red: 1.0, green: 0.78, blue: 0.0)
    static let xpPurple = Color(red: 0.58, green: 0.30, blue: 0.92)
    static let funPink = Color(red: 0.96, green: 0.34, blue: 0.55)
    static let funTeal = Color(red: 0.18, green: 0.80, blue: 0.75)
    static let funCoral = Color(red: 1.0, green: 0.42, blue: 0.38)

    static let moduleColors: [Color] = [
        heartRed, primaryBlue, successGreen, xpPurple,
        accentOrange, funPink, funTeal, funCoral
    ]

    static func moduleColor(for index: Int) -> Color {
        moduleColors[index % moduleColors.count]
    }

    static var headerGradient: LinearGradient {
        LinearGradient(
            colors: [Color(hex: "0a7bbf"), Color(hex: "0d97db")],
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }

    static let funFont: Font = .system(.body, design: .rounded)
    static func funFont(_ style: Font.TextStyle, weight: Font.Weight = .regular) -> Font {
        .system(style, design: .rounded, weight: weight)
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
    var borderColor: Color? = nil
    var borderWidth: CGFloat = 3

    func body(content: Content) -> some View {
        content
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(.rect(cornerRadius: 18))
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(borderColor ?? .clear, lineWidth: borderColor != nil ? borderWidth : 0)
            )
            .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)
    }
}

extension View {
    func cardStyle(borderColor: Color? = nil, borderWidth: CGFloat = 3) -> some View {
        modifier(CardModifier(borderColor: borderColor, borderWidth: borderWidth))
    }

    func funHeading() -> some View {
        self.font(AppTheme.funFont(.title2, weight: .bold))
    }

    func funBody() -> some View {
        self.font(AppTheme.funFont(.body, weight: .medium))
    }
}
