import SwiftUI
import RiveRuntime

struct RiveBearAvatarView: View {
    let size: CGFloat
    var eyeStyle: EyeStyle = .normal
    var mouthStyle: MouthStyle = .smile
    var accessoryType: AccessoryType = .none

    @State private var riveViewModel = RiveViewModel(fileName: "bear_v3", autoPlay: true)
    @State private var isReady: Bool = false

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
        case .none: 0
        case .roundGlasses: 1
        case .heartSunglasses: 2
        case .monocle: 3
        case .flowerCrown: 4
        case .crown: 5
        case .bucketHat: 6
        case .wizardHat: 7
        case .gradCap: 8
        case .bandana: 9
        case .bowClip: 10
        case .pearlNecklace: 11
        default: 0
        }
    }

    private func applyInputs() {
        riveViewModel.setInput("eyeStyle", value: Float(riveEyeValue))
        riveViewModel.setInput("mouthStyle", value: Float(riveMouthValue))
        riveViewModel.setInput("accessoryStyle", value: Float(riveAccessoryValue))
    }

    var body: some View {
        riveViewModel.view()
            .frame(width: size, height: size)
            .onChange(of: eyeStyle) { _, _ in applyInputs() }
            .onChange(of: mouthStyle) { _, _ in applyInputs() }
            .onChange(of: accessoryType) { _, _ in applyInputs() }
            .onAppear {
                Task { @MainActor in
                    try? await Task.sleep(for: .milliseconds(100))
                    applyInputs()
                    isReady = true
                }
            }
    }
}
