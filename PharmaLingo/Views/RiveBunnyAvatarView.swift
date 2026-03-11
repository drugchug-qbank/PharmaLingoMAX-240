import SwiftUI
import RiveRuntime

struct RiveBunnyAvatarView: View {
    let size: CGFloat

    @State private var riveViewModel = RiveViewModel(fileName: "bunny_test", autoPlay: true)

    var body: some View {
        riveViewModel.view()
            .frame(width: size, height: size)
    }
}
