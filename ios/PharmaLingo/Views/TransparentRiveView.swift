import SwiftUI
import RiveRuntime
import QuartzCore
import Metal

struct TransparentRiveView: UIViewRepresentable {
    let viewModel: RiveViewModel

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> RiveView {
        let view = viewModel.createRiveView()
        Self.applyTransparency(to: view)
        context.coordinator.beginMonitoring(view: view)
        return view
    }

    func updateUIView(_ uiView: RiveView, context: Context) {
        Self.applyTransparency(to: uiView)
    }

    class Coordinator: NSObject {
        private var displayLink: CADisplayLink?
        private weak var targetView: UIView?
        private var tickCount = 0

        func beginMonitoring(view: UIView) {
            targetView = view
            tickCount = 0
            displayLink?.invalidate()
            displayLink = CADisplayLink(target: self, selector: #selector(onFrame))
            displayLink?.add(to: .main, forMode: .common)
        }

        @objc private func onFrame() {
            tickCount += 1
            if let view = targetView {
                TransparentRiveView.applyTransparency(to: view)
            }
            if tickCount >= 90 {
                displayLink?.invalidate()
                displayLink = nil
            }
        }

        deinit {
            displayLink?.invalidate()
        }
    }

    static func applyTransparency(to view: UIView) {
        view.isOpaque = false
        view.backgroundColor = .clear
        view.layer.isOpaque = false
        view.layer.backgroundColor = UIColor.clear.cgColor

        makeLayerTransparent(view.layer)

        for subview in view.subviews {
            subview.isOpaque = false
            subview.backgroundColor = .clear
            subview.layer.isOpaque = false
            makeLayerTransparent(subview.layer)
        }
    }

    private static func makeLayerTransparent(_ layer: CALayer) {
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
}
