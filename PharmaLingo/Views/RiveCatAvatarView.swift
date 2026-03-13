import SwiftUI
import RiveRuntime

struct RiveCatAvatarView: View {
    let size: CGFloat
    var eyeStyle: EyeStyle = .normal
    var mouthStyle: MouthStyle = .smile

    @State private var riveViewModel = RiveViewModel(fileName: "cat_test", autoPlay: true)

    static let supportedEyes: [EyeStyle] = [
        .normal, .heart, .angry, .determined, .happy, .stars, .dizzy
    ]

    private var riveEyeValue: Double {
        switch eyeStyle {
        case .normal: 0
        case .heart: 1
        case .angry: 2
        case .determined: 3
        case .happy: 4
        case .stars: 5
        case .dizzy: 6
        default: 0
        }
    }

    private var riveMouthValue: Double {
        switch mouthStyle {
        case .smile: 0
        case .bigSmile: 1
        case .tongue: 2
        case .oh: 3
        case .catMouth: 4
        case .smirk: 5
        case .teeth: 6
        case .tiny: 7
        case .flat: 8
        case .wavy: 9
        }
    }

    private func applyInputs() {
        let eye: Float = Float(riveEyeValue)
        let mouth: Float = Float(riveMouthValue)
        riveViewModel.setInput("eyeStyle", value: eye)
        riveViewModel.setInput("mouthStyle", value: mouth)
    }

    var body: some View {
        riveViewModel.view()
            .frame(width: size, height: size)
            .onChange(of: eyeStyle) { _, _ in
                applyInputs()
            }
            .onChange(of: mouthStyle) { _, _ in
                applyInputs()
            }
            .onAppear {
                applyInputs()
            }
    }
}
