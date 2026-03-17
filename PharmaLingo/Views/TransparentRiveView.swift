import SwiftUI
import RiveRuntime

struct TransparentRiveView: UIViewRepresentable {
    let viewModel: RiveViewModel

    func makeUIView(context: Context) -> RiveView {
        let view = viewModel.createRiveView()
        view.isOpaque = false
        view.backgroundColor = .clear
        view.layer.isOpaque = false
        return view
    }

    func updateUIView(_ uiView: RiveView, context: Context) {}
}
