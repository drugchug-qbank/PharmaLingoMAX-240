import SwiftUI
import RiveRuntime

struct RiveBunnyAvatarView: View {
    let size: CGFloat
    var eyeStyle: EyeStyle = .normal

    @State private var riveViewModel = RiveViewModel(fileName: "bunny_test", autoPlay: true)

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

    var body: some View {
        riveViewModel.view()
            .frame(width: size, height: size)
            .onChange(of: eyeStyle) { _, _ in
                riveViewModel.setInput("eyeStyle", value: riveEyeValue)
            }
            .onAppear {
                riveViewModel.setInput("eyeStyle", value: riveEyeValue)
            }
    }
}
