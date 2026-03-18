import SwiftUI

struct AvatarRendererView: View {
    let configuration: AvatarConfiguration
    let size: CGFloat
    var showIdleAnimation: Bool = false

    @State private var isBlinking: Bool = false
    @State private var breathScale: CGFloat = 1.0

    private var cornerRadius: CGFloat {
        AnimalAvatarView.tileCornerRadius(for: size)
    }

    private var useRiveBunny: Bool {
        configuration.animalType == .bunny
    }

    private var useRiveCat: Bool {
        configuration.animalType == .cat
    }

    private var useRiveBear: Bool {
        configuration.animalType == .bear
    }

    private var useRiveBeaver: Bool {
        configuration.animalType == .beaver
    }

    private var useRiveAvatar: Bool {
        useRiveBunny || useRiveCat || useRiveBear || useRiveBeaver
    }

    var body: some View {
        ZStack {
            backgroundLayer

            if useRiveBunny {
                RiveBunnyAvatarView(size: size, eyeStyle: configuration.eyeStyle, mouthStyle: configuration.mouthStyle)
                    .allowsHitTesting(false)
            } else if useRiveCat {
                RiveCatAvatarView(size: size, eyeStyle: configuration.eyeStyle, mouthStyle: configuration.mouthStyle, accessoryType: configuration.accessoryType, bodyColorIndex: RiveCatAvatarView.bodyColorIndex(for: configuration.bodyHex))
                    .allowsHitTesting(false)
            } else if useRiveBear {
                RiveBearAvatarView(size: size, eyeStyle: configuration.eyeStyle, mouthStyle: configuration.mouthStyle, accessoryType: configuration.accessoryType, bodyColorIndex: RiveBearAvatarView.bodyColorIndex(for: configuration.bodyHex))
                    .allowsHitTesting(false)
            } else if useRiveBeaver {
                RiveBeaverAvatarView(size: size, eyeStyle: configuration.eyeStyle, mouthStyle: configuration.mouthStyle, accessoryType: configuration.accessoryType, bodyColorIndex: RiveBeaverAvatarView.bodyColorIndex(for: configuration.bodyHex))
                    .allowsHitTesting(false)
            } else {
                animalLayer
            }

            if !useRiveAvatar {
                shadingOverlay
                highlightOverlay
            }
        }
        .frame(width: size, height: size)
        .clipShape(.rect(cornerRadius: cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.black.opacity(0.22), lineWidth: size * 0.018)
        )
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    LinearGradient(
                        colors: [Color.white.opacity(0.30), Color.white.opacity(0.0)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: size > 100 ? 2.0 : 1.0
                )
        )
        .shadow(color: .black.opacity(0.15), radius: size * 0.06, x: 0, y: size * 0.025)
        .scaleEffect(breathScale)
        .task {
            guard showIdleAnimation, !useRiveAvatar else { return }
            await withTaskGroup(of: Void.self) { group in
                group.addTask { @MainActor in
                    while !Task.isCancelled {
                        withAnimation(.easeInOut(duration: 1.8)) { breathScale = 1.02 }
                        try? await Task.sleep(for: .seconds(1.8))
                        guard !Task.isCancelled else { break }
                        withAnimation(.easeInOut(duration: 1.8)) { breathScale = 1.0 }
                        try? await Task.sleep(for: .seconds(1.8))
                    }
                }
                group.addTask { @MainActor in
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
        }
    }

    private var backgroundLayer: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(configuration.bgColor)

            RadialGradient(
                colors: [
                    Color.white.opacity(0.18),
                    Color.clear
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: size * 0.8
            )
        }
    }

    private var useBunnyImagePath: Bool {
        let effectiveEye = isBlinking ? EyeStyle.sleepy : configuration.eyeStyle
        return BunnyImageAvatarView.canUseImagePath(animalType: configuration.animalType, eyeStyle: effectiveEye)
    }

    private var bunnyContentScale: CGFloat {
        size > 100 ? 1.25 : 1.0
    }

    @ViewBuilder
    private var animalLayer: some View {
        if useBunnyImagePath {
            BunnyImageAvatarView(
                eyeStyle: .normal,
                mouthStyle: configuration.mouthStyle,
                accessory: configuration.accessoryType,
                size: size,
                contentScale: bunnyContentScale
            )
            .allowsHitTesting(false)
        } else {
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
