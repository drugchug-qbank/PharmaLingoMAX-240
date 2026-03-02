import SwiftUI

struct AvatarRendererView: View {
    let configuration: AvatarConfiguration
    let size: CGFloat
    var showIdleAnimation: Bool = false

    @State private var isBlinking: Bool = false

    var body: some View {
        ZStack {
            backgroundLayer

            animalLayer

            shadingOverlay

            highlightOverlay
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [Color.white.opacity(0.35), Color.white.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: size > 100 ? 2.5 : 1.5
                )
        )
        .task {
            guard showIdleAnimation else { return }
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(Double.random(in: 3.0...6.0)))
                guard !Task.isCancelled else { break }
                withAnimation(.easeInOut(duration: 0.12)) { isBlinking = true }
                try? await Task.sleep(for: .seconds(0.15))
                guard !Task.isCancelled else { break }
                withAnimation(.easeInOut(duration: 0.12)) { isBlinking = false }
            }
        }
    }

    private var backgroundLayer: some View {
        ZStack {
            Circle()
                .fill(configuration.bgColor)

            RadialGradient(
                colors: [
                    Color.white.opacity(0.2),
                    Color.clear
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: size * 0.8
            )
        }
    }

    private var animalLayer: some View {
        AnimalAvatarView(
            animalType: configuration.animalType,
            bodyColor: configuration.bodyColor,
            backgroundColor: .clear,
            eyeStyle: isBlinking ? .sleepy : configuration.eyeStyle,
            mouthStyle: configuration.mouthStyle,
            accessory: configuration.accessoryType,
            size: size
        )
        .allowsHitTesting(false)
    }

    private var shadingOverlay: some View {
        RadialGradient(
            colors: [
                Color.clear,
                Color.black.opacity(AvatarAssetCatalog.shading.shadowOpacity)
            ],
            center: UnitPoint(
                x: 0.5 + AvatarAssetCatalog.shading.highlightOffset.x,
                y: 0.5 + AvatarAssetCatalog.shading.highlightOffset.y
            ),
            startRadius: size * 0.15,
            endRadius: size * 0.55
        )
        .blendMode(.multiply)
        .allowsHitTesting(false)
    }

    private var highlightOverlay: some View {
        RadialGradient(
            colors: [
                Color.white.opacity(AvatarAssetCatalog.shading.highlightOpacity),
                Color.clear
            ],
            center: UnitPoint(x: 0.30, y: 0.25),
            startRadius: 0,
            endRadius: size * 0.45
        )
        .blendMode(.screen)
        .allowsHitTesting(false)
    }
}
