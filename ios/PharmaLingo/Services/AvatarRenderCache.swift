import SwiftUI
import UIKit

@MainActor
final class AvatarRenderCache {
    static let shared = AvatarRenderCache()

    private let cache = NSCache<NSString, UIImage>()

    private init() {
        cache.countLimit = 200
        cache.totalCostLimit = 40 * 1024 * 1024
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

    @discardableResult
    func renderAndCache(config: AvatarConfiguration, size: CGFloat) -> UIImage? {
        if let existing = thumbnail(for: config, size: size) {
            return existing
        }

        let canvasView = AnimalAvatarView(
            animalType: config.animalType,
            bodyColor: config.bodyColor,
            backgroundColor: config.bgColor,
            eyeStyle: config.eyeStyle,
            mouthStyle: config.mouthStyle,
            accessory: config.accessoryType,
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

    private var cornerRadius: CGFloat {
        AnimalAvatarView.tileCornerRadius(for: size)
    }

    var body: some View {
        Group {
            if let cachedImage {
                Image(uiImage: cachedImage)
                    .resizable()
                    .frame(width: size, height: size)
                    .clipShape(.rect(cornerRadius: cornerRadius))
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(Color.black.opacity(0.15), lineWidth: size * 0.015)
                    )
                    .shadow(color: .black.opacity(0.08), radius: size * 0.04, x: 0, y: size * 0.015)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(configuration.bgColor)
                    .frame(width: size, height: size)
            }
        }
        .task(id: configuration) {
            cachedImage = AvatarRenderCache.shared.renderAndCache(config: configuration, size: size)
        }
    }
}
