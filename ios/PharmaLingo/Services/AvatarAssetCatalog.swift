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
        .standard
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
        case .bear: return ["8D6E63", "795548", "A1887F", "5D4037"]
        case .beaver: return ["8B5E3C", "A1887F", "795548", "D7CCC8"]
        case .cat: return ["FF8A65", "FFA726", "FFAB91", "FFCCBC"]
        case .chipmunk: return ["C4956A", "D2B48C", "DAA520", "8D6E63"]
        case .deer: return ["C4956A", "D2B48C", "DAA520", "8D6E63"]
        case .dog: return ["A1887F", "8D6E63", "D7CCC8", "BCAAA4"]
        case .dragon: return ["66BB6A", "4DB6AC", "81C784", "AED581"]
        case .fox: return ["FF7043", "FF8A65", "FFA726", "FFAB91"]
        case .hedgehog: return ["C4956A", "D2B48C", "DAA520", "8D6E63"]
        case .mouse: return ["B0BEC5", "90A4AE", "CFD8DC", "78909C"]
        case .octopus: return ["CE93D8", "AB47BC", "B39DDB", "E1BEE7"]
        case .panda: return ["E0E0E0", "BDBDBD", "F5F5F5", "CFD8DC"]
        case .tiger: return ["FF8C00", "E8733A", "DAA520", "C0593A"]
        case .unicorn: return ["F8BBD0", "CE93D8", "B39DDB", "81D4FA"]
        default: return [animal.defaultColorHex]
        }
    }
}
