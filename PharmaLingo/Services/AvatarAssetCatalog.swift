import SwiftUI

enum AvatarAssetCatalog {

    struct AnchorPoints {
        let eyeCenter: CGPoint
        let mouthCenter: CGPoint
        let accessoryCenter: CGPoint
        let eyeScale: CGFloat
        let mouthScale: CGFloat

        static let standard = AnchorPoints(
            eyeCenter: CGPoint(x: 0.50, y: 0.42),
            mouthCenter: CGPoint(x: 0.50, y: 0.63),
            accessoryCenter: CGPoint(x: 0.50, y: 0.20),
            eyeScale: 1.0,
            mouthScale: 1.0
        )
    }

    static func anchors(for animal: AnimalType) -> AnchorPoints {
        switch animal {
        case .frog:
            return AnchorPoints(
                eyeCenter: CGPoint(x: 0.50, y: 0.34),
                mouthCenter: CGPoint(x: 0.50, y: 0.60),
                accessoryCenter: CGPoint(x: 0.50, y: 0.16),
                eyeScale: 1.1,
                mouthScale: 1.0
            )
        case .elephant:
            return AnchorPoints(
                eyeCenter: CGPoint(x: 0.50, y: 0.40),
                mouthCenter: CGPoint(x: 0.50, y: 0.55),
                accessoryCenter: CGPoint(x: 0.50, y: 0.16),
                eyeScale: 1.0,
                mouthScale: 0.85
            )
        case .turtle:
            return AnchorPoints(
                eyeCenter: CGPoint(x: 0.50, y: 0.34),
                mouthCenter: CGPoint(x: 0.50, y: 0.50),
                accessoryCenter: CGPoint(x: 0.50, y: 0.12),
                eyeScale: 0.95,
                mouthScale: 0.9
            )
        default:
            return .standard
        }
    }

    struct ShadingConfig {
        let highlightOpacity: CGFloat
        let shadowOpacity: CGFloat
        let highlightOffset: CGPoint
        let shadowOffset: CGPoint

        static let standard = ShadingConfig(
            highlightOpacity: 0.18,
            shadowOpacity: 0.12,
            highlightOffset: CGPoint(x: -0.12, y: -0.12),
            shadowOffset: CGPoint(x: 0.08, y: 0.10)
        )
    }

    static let shading = ShadingConfig.standard

    static let outlineWidth: CGFloat = 1.8

    static func recommendedBodyColors(for animal: AnimalType) -> [String] {
        switch animal {
        case .beaver: return ["8B5E3C", "A1887F", "795548", "D7CCC8"]
        case .bird: return ["4FC3F7", "42A5F5", "26C6DA", "81D4FA"]
        case .bunny: return ["F8BBD0", "F48FB1", "CE93D8", "FFCCBC"]
        case .cat: return ["FF8A65", "FFA726", "FFAB91", "FFCCBC"]
        case .dog: return ["A1887F", "8D6E63", "D7CCC8", "BCAAA4"]
        case .dragon: return ["66BB6A", "4DB6AC", "81C784", "AED581"]
        case .fox: return ["FF7043", "FF8A65", "FFA726", "FFAB91"]
        case .frog: return ["81C784", "66BB6A", "4DB6AC", "AED581"]
        case .panda: return ["E0E0E0", "BDBDBD", "F5F5F5", "CFD8DC"]
        case .unicorn: return ["F8BBD0", "CE93D8", "B39DDB", "81D4FA"]
        default: return [animal.defaultColorHex]
        }
    }
}
