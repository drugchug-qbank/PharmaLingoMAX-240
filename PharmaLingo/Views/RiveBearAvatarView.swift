import SwiftUI
import RiveRuntime

struct RiveBearAvatarView: View {
    let size: CGFloat
    var eyeStyle: EyeStyle = .normal
    var mouthStyle: MouthStyle = .smile
    var accessoryType: AccessoryType = .none
    var bodyColorIndex: Double = 0

    @State private var riveViewModel = RiveViewModel(fileName: "bear_v3", autoPlay: true)

    static let supportedEyes: [EyeStyle] = [
        .dotFriendly, .roundBright, .almond, .droopy, .sleepy,
        .happy, .sharpConfident, .normal, .stars, .heart,
        .sparkleGlam, .glanceLeft, .glanceRight, .winkLeft, .winkRight,
        .lashesSoft, .boldBrow, .dizzy, .angry, .relaxedBlink,
        .sadEyes, .surprised, .cool, .determined, .wink
    ]

    static let supportedMouths: [MouthStyle] = [
        .teethGrin, .tongue, .grin, .toothedGrin, .catMouth,
        .neutralLine, .smirk, .oh, .sadMouth, .pout,
        .surprisedO, .laughOpen, .tonguePlayful, .wavy, .sadDown,
        .determinedFlat, .buckToothSmile, .fangPeek, .sleepySmall,
        .grittedTeeth, .buckTeeth, .kiss, .smile, .smirkTeeth, .vampire
    ]

    static let supportedAccessories: [AccessoryType] = [
        .none, .roundGlasses, .heartSunglasses, .monocle,
        .flowerCrown, .crown, .bucketHat, .wizardHat,
        .gradCap, .bandana, .bowClip, .pearlNecklace
    ]

    static let bearBodyColors: [(name: String, index: Double)] = [
        ("Base", 0),
        ("Cocoa Cream", 1),
        ("Charcoal Mint", 2),
        ("Honey Gold", 3),
        ("Strawberry Cream", 4),
        ("Mint Cloud", 5),
        ("Sky Blue", 6),
        ("Lavender Dream", 7),
        ("Forest Moss", 8),
        ("Sunset Orange", 9),
        ("Arctic White", 10),
        ("Neon", 11),
        ("Autumn Maple", 12),
    ]

    static let bearBodyColorHexes: [(name: String, hex: String, index: Double)] = [
        ("Base", "8D6E63", 0),
        ("Cocoa Cream", "D2B48C", 1),
        ("Charcoal Mint", "4A6B5D", 2),
        ("Honey Gold", "DAA520", 3),
        ("Strawberry Cream", "F4A6B0", 4),
        ("Mint Cloud", "B2DFDB", 5),
        ("Sky Blue", "87CEEB", 6),
        ("Lavender Dream", "C4A8D8", 7),
        ("Forest Moss", "6B8E4E", 8),
        ("Sunset Orange", "E8733A", 9),
        ("Arctic White", "F0F0F0", 10),
        ("Neon", "39FF14", 11),
        ("Autumn Maple", "C0593A", 12),
    ]

    static func bodyColorIndex(for hex: String) -> Double {
        let upperHex = hex.uppercased()
        if let match = bearBodyColorHexes.first(where: { $0.hex.uppercased() == upperHex }) {
            return match.index
        }
        return 0
    }

    private var riveEyeValue: Double {
        switch eyeStyle {
        case .dotFriendly: 0
        case .roundBright: 1
        case .almond: 2
        case .droopy: 3
        case .sleepy: 4
        case .happy: 5
        case .sharpConfident: 6
        case .normal: 7
        case .stars: 8
        case .heart: 9
        case .sparkleGlam: 10
        case .glanceLeft: 11
        case .glanceRight: 12
        case .winkLeft: 13
        case .winkRight: 14
        case .lashesSoft: 15
        case .boldBrow: 16
        case .dizzy: 17
        case .angry: 18
        case .relaxedBlink: 19
        case .sadEyes: 20
        case .surprised: 21
        case .cool: 22
        case .determined: 23
        case .wink: 24
        default: 7
        }
    }

    private var riveMouthValue: Double {
        switch mouthStyle {
        case .teethGrin: 0
        case .tongue: 1
        case .grin: 2
        case .toothedGrin: 3
        case .catMouth: 4
        case .neutralLine: 5
        case .smirk: 6
        case .oh: 7
        case .sadMouth: 8
        case .pout: 9
        case .surprisedO: 10
        case .laughOpen: 11
        case .tonguePlayful: 12
        case .wavy: 13
        case .sadDown: 14
        case .determinedFlat: 15
        case .buckToothSmile: 16
        case .fangPeek: 17
        case .sleepySmall: 18
        case .grittedTeeth: 19
        case .buckTeeth: 20
        case .kiss: 21
        case .smile: 22
        case .smirkTeeth: 23
        case .vampire: 24
        default: 22
        }
    }

    private var riveAccessoryValue: Double {
        switch accessoryType {
        case .roundGlasses: 0
        case .heartSunglasses: 1
        case .monocle: 2
        case .flowerCrown: 3
        case .crown: 4
        case .bucketHat: 5
        case .wizardHat: 6
        case .gradCap: 7
        case .bandana: 8
        case .bowClip: 9
        case .pearlNecklace: 10
        case .none: 11
        default: 11
        }
    }

    private func applyInputs() {
        riveViewModel.setInput("Eyes", value: riveEyeValue)
        riveViewModel.setInput("Mouth", value: riveMouthValue)
        riveViewModel.setInput("Accessory", value: riveAccessoryValue)
        riveViewModel.setInput("Base Color", value: bodyColorIndex)
    }

    var body: some View {
        riveViewModel.view()
            .frame(width: size, height: size)
            .onChange(of: eyeStyle) { _, _ in applyInputs() }
            .onChange(of: mouthStyle) { _, _ in applyInputs() }
            .onChange(of: accessoryType) { _, _ in applyInputs() }
            .onChange(of: bodyColorIndex) { _, _ in applyInputs() }
            .onAppear {
                Task { @MainActor in
                    try? await Task.sleep(for: .milliseconds(150))
                    applyInputs()
                }
            }
    }
}
