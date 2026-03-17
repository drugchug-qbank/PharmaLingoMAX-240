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
        .happy, .sharpConfident, .stars, .heart,
        .sparkleGlam, .glanceLeft, .glanceRight, .winkLeft, .winkRight,
        .lashesSoft, .boldBrow, .dizzy, .determined, .relaxedBlink,
        .sadEyes, .angry, .normal, .dizzySwirl, .starEyes, .heartEyes
    ]

    static let supportedMouths: [MouthStyle] = [
        .smile, .teethGrin, .tongue, .grin, .toothedGrin, .catMouth,
        .neutralLine, .smirk, .oh, .pout,
        .sadMouth, .surprisedO, .laughOpen, .tonguePlayful, .wavy, .sadDown,
        .determinedFlat, .buckToothSmile, .fangPeek, .sleepySmall,
        .grittedTeeth, .buckTeeth, .kiss, .smirkTeeth, .vampire
    ]

    static let supportedAccessories: [AccessoryType] = [
        .none, .roundGlasses, .heartSunglasses, .monocle,
        .flowerCrown, .tiara, .bucketHat, .wizardHat,
        .gradCap, .bandana, .bowClip, .pearlNecklace, .crown
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
        case .stars: 7
        case .heart: 8
        case .sparkleGlam: 9
        case .glanceLeft: 10
        case .glanceRight: 11
        case .winkLeft: 12
        case .winkRight: 13
        case .lashesSoft: 14
        case .boldBrow: 15
        case .dizzy: 16
        case .determined: 17
        case .relaxedBlink: 18
        case .sadEyes: 19
        case .angry: 20
        case .normal: 21
        case .dizzySwirl: 22
        case .starEyes: 23
        case .heartEyes: 24
        default: 21
        }
    }

    private var riveMouthValue: Double {
        switch mouthStyle {
        case .smile: 0
        case .teethGrin: 1
        case .tongue: 2
        case .grin: 3
        case .toothedGrin: 4
        case .catMouth: 5
        case .neutralLine: 6
        case .smirk: 7
        case .oh: 8
        case .pout: 9
        case .sadMouth: 10
        case .surprisedO: 11
        case .laughOpen: 12
        case .tonguePlayful: 13
        case .wavy: 14
        case .sadDown: 15
        case .determinedFlat: 16
        case .buckToothSmile: 17
        case .fangPeek: 18
        case .sleepySmall: 19
        case .grittedTeeth: 20
        case .buckTeeth: 21
        case .kiss: 22
        case .smirkTeeth: 23
        case .vampire: 24
        default: 0
        }
    }

    private var riveAccessoryValue: Double {
        switch accessoryType {
        case .none: 0
        case .roundGlasses: 1
        case .heartSunglasses: 2
        case .monocle: 3
        case .flowerCrown: 4
        case .tiara: 5
        case .bucketHat: 6
        case .wizardHat: 7
        case .gradCap: 8
        case .bandana: 9
        case .bowClip: 10
        case .pearlNecklace: 11
        case .crown: 12
        default: 0
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
