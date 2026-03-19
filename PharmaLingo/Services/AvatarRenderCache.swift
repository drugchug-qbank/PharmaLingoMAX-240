import SwiftUI
import UIKit

@MainActor
final class AvatarRenderCache {
    static let shared = AvatarRenderCache()

    private let cache = NSCache<NSString, UIImage>()

    private init() {
        cache.countLimit = 150
        cache.totalCostLimit = 30 * 1024 * 1024
    }

    func thumbnail(for config: AvatarConfiguration, size: CGFloat) -> UIImage? {
        let key = "\(config.cacheKey)_\(Int(size))" as NSString
        return cache.object(forKey: key)
    }

    func storeThumbnail(_ image: UIImage, for config: AvatarConfiguration, size: CGFloat) {
        let key = "\(config.cacheKey)_\(Int(size))" as NSString
        cache.setObject(image, forKey: key)
    }

    func invalidate() {
        cache.removeAllObjects()
    }

    private static let riveAnimals: Set<String> = ["bunny", "cat", "bear", "beaver", "chipmunk"]

    @discardableResult
    func renderAndCache(config: AvatarConfiguration, size: CGFloat) -> UIImage? {
        if let existing = thumbnail(for: config, size: size) {
            return existing
        }

        let canvasConfig = config
        let canvasView = AnimalAvatarView(
            animalType: canvasConfig.animalType,
            bodyColor: canvasConfig.bodyColor,
            backgroundColor: canvasConfig.bgColor,
            eyeStyle: canvasConfig.eyeStyle,
            mouthStyle: canvasConfig.mouthStyle,
            accessory: canvasConfig.accessoryType,
            size: size
        )

        let renderer = ImageRenderer(
            content: canvasView.frame(width: size, height: size)
        )
        renderer.scale = 2.0

        guard let uiImage = renderer.uiImage else { return nil }
        storeThumbnail(uiImage, for: config, size: size)
        return uiImage
    }
}

struct CachedAvatarView: View {
    let configuration: AvatarConfiguration
    let size: CGFloat

    @State private var cachedImage: UIImage?

    var body: some View {
        Group {
            if let cachedImage {
                Image(uiImage: cachedImage)
                    .resizable()
                    .frame(width: size, height: size)
            } else {
                AvatarRendererView(configuration: configuration, size: size)
            }
        }
        .task(id: configuration) {
            cachedImage = AvatarRenderCache.shared.renderAndCache(config: configuration, size: size)
        }
    }
}
