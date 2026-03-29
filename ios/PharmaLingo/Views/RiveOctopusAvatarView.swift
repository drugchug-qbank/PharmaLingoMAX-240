import SwiftUI
import RiveRuntime

struct RiveOctopusAvatarView: View {
    let size: CGFloat
    var eyeStyle: EyeStyle = .normal
    var mouthStyle: MouthStyle = .smile
    var accessoryType: AccessoryType = .none
    var bodyColorIndex: Double = 0

    @State private var riveViewModel = RiveViewModel(fileName: "octopus_v1", autoPlay: true)

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

    static let octopusBodyColors: [(name: String, index: Double)] = [
        ("Base", 0),
        ("Lavender", 1),
        ("Ocean Blue", 2),
        ("Coral Pink", 3),
        ("Mint Green", 4),
        ("Sunset Orange", 5),
        ("Deep Purple", 6),
        ("Sky Blue", 7),
        ("Rose", 8),
        ("Teal", 9),
        ("Arctic White", 10),
        ("Neon", 11),
        ("Berry", 12),
    ]

    static let octopusBodyColorHexes: [(name: String, hex: String, index: Double)] = [
        ("Base", "CE93D8", 0),
        ("Lavender", "B39DDB", 1),
        ("Ocean Blue", "42A5F5", 2),
        ("Coral Pink", "F48FB1", 3),
        ("Mint Green", "80CBC4", 4),
        ("Sunset Orange", "FF8A65", 5),
        ("Deep Purple", "7E57C2", 6),
        ("Sky Blue", "81D4FA", 7),
        ("Rose", "E91E63", 8),
        ("Teal", "26A69A", 9),
        ("Arctic White", "F0F0F0", 10),
        ("Neon", "39FF14", 11),
        ("Berry", "AD1457", 12),
    ]

    static func bodyColorIndex(for hex: String) -> Double {
        let upperHex = hex.uppercased()
        if let match = octopusBodyColorHexes.first(where: { $0.hex.uppercased() == upperHex }) {
            return match.index
        }
        return 0
    }

    private var riveEyeValue: Double {
        switch eyeStyle {
        case .dotFriendly: 1
        case .roundBright: 2
        case .almond: 3
        case .droopy: 4
        case .sleepy: 5
        case .happy: 6
        case .sharpConfident: 7
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
        case .determined: 18
        case .relaxedBlink: 19
        case .sadEyes: 20
        case .angry: 21
        case .normal: 22
        case .dizzySwirl: 23
        case .starEyes: 24
        case .heartEyes: 25
        default: 22
        }
    }

    private var riveMouthValue: Double {
        switch mouthStyle {
        case .smile: 1
        case .teethGrin: 2
        case .tongue: 3
        case .grin: 4
        case .toothedGrin: 5
        case .catMouth: 6
        case .neutralLine: 7
        case .smirk: 8
        case .oh: 9
        case .pout: 10
        case .sadMouth: 11
        case .surprisedO: 12
        case .laughOpen: 13
        case .tonguePlayful: 14
        case .wavy: 15
        case .sadDown: 16
        case .determinedFlat: 17
        case .buckToothSmile: 18
        case .fangPeek: 19
        case .sleepySmall: 20
        case .grittedTeeth: 21
        case .buckTeeth: 22
        case .kiss: 23
        case .smirkTeeth: 24
        case .vampire: 25
        default: 1
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
        TransparentRiveView(viewModel: riveViewModel)
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
