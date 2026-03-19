import SwiftUI
import RiveRuntime
import QuartzCore

struct TransparentRiveView: UIViewRepresentable {
    let viewModel: RiveViewModel

    func makeUIView(context: Context) -> RiveView {
        let view = viewModel.createRiveView()
        applyTransparency(to: view)
        return view
    }

    func updateUIView(_ uiView: RiveView, context: Context) {
        applyTransparency(to: uiView)
    }

    private func applyTransparency(to view: UIView) {
        view.isOpaque = false
        view.backgroundColor = .clear
        view.layer.isOpaque = false
        view.layer.backgroundColor = UIColor.clear.cgColor

        func makeLayerTransparent(_ layer: CALayer) {
            layer.isOpaque = false
            layer.backgroundColor = UIColor.clear.cgColor
            if let metalLayer = layer as? CAMetalLayer {
                metalLayer.isOpaque = false
                metalLayer.pixelFormat = .bgra8Unorm
            }
            for sub in layer.sublayers ?? [] {
                makeLayerTransparent(sub)
            }
        }
        makeLayerTransparent(view.layer)

        for subview in view.subviews {
            subview.isOpaque = false
            subview.backgroundColor = .clear
            subview.layer.isOpaque = false
            makeLayerTransparent(subview.layer)
        }
    }
}
