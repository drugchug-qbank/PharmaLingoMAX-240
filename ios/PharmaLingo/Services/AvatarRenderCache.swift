import SwiftUI
import UIKit

@MainActor
final class AvatarRenderCache {
    static let shared = AvatarRenderCache()

    private let cache = NSCache<NSString, UIImage>()
    private var pendingKeys = Set<String>()

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
        pendingKeys.removeAll()
    }

    func snapshotRiveAvatar(config: AvatarConfiguration, size: CGFloat) async -> UIImage? {
        if let existing = thumbnail(for: config, size: size) {
            return existing
        }

        let key = "\(config.cacheKey)_\(Int(size))"
        guard !pendingKeys.contains(key) else { return nil }
        pendingKeys.insert(key)
        defer { pendingKeys.remove(key) }

        let renderSize = size * 2.0
        let avatarView = AvatarRendererView(configuration: config, size: renderSize)

        let hostingController = UIHostingController(rootView: avatarView)
        hostingController.view.frame = CGRect(x: 0, y: 0, width: renderSize, height: renderSize)
        hostingController.view.backgroundColor = .clear

        let offscreenWindow = UIWindow(frame: CGRect(x: -9999, y: -9999, width: renderSize, height: renderSize))
        offscreenWindow.rootViewController = hostingController
        offscreenWindow.isHidden = false
        offscreenWindow.layoutIfNeeded()
        hostingController.view.layoutIfNeeded()

        try? await Task.sleep(for: .milliseconds(400))

        hostingController.view.layoutIfNeeded()

        let renderer = UIGraphicsImageRenderer(size: CGSize(width: renderSize, height: renderSize))
        let image = renderer.image { _ in
            hostingController.view.drawHierarchy(in: CGRect(x: 0, y: 0, width: renderSize, height: renderSize), afterScreenUpdates: true)
        }

        offscreenWindow.isHidden = true
        offscreenWindow.rootViewController = nil

        let finalImage = UIImage(cgImage: image.cgImage!, scale: 2.0, orientation: .up)
        storeThumbnail(finalImage, for: config, size: size)
        return finalImage
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
                    .overlay {
                        ProgressView()
                            .scaleEffect(size > 50 ? 0.6 : 0.4)
                    }
            }
        }
        .task(id: configuration) {
            if let existing = AvatarRenderCache.shared.thumbnail(for: configuration, size: size) {
                cachedImage = existing
                return
            }
            cachedImage = await AvatarRenderCache.shared.snapshotRiveAvatar(config: configuration, size: size)
        }
    }
}
