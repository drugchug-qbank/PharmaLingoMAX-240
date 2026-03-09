import SwiftUI

struct BunnyImageAvatarView: View {
    let eyeStyle: EyeStyle
    let mouthStyle: MouthStyle
    let accessory: AccessoryType
    let size: CGFloat
    var contentScale: CGFloat = 1.0

    static func canUseImagePath(animalType: AnimalType, eyeStyle: EyeStyle) -> Bool {
        guard animalType == .bunny, eyeStyle == .normal else { return false }
        return UIImage(named: bunnyBaseAsset) != nil && UIImage(named: eyeAssetName(for: .normal)) != nil
    }

    private static let bunnyBaseAsset = "avatar_bunny_base_v2"

    static func eyeAssetName(for style: EyeStyle) -> String {
        switch style {
        case .normal: return "avatar_bunny_eyes_neutral_v4_close"
        default: return ""
        }
    }

    static func mouthAssetName(for style: MouthStyle) -> String {
        switch style {
        case .smile: return "avatar_bunny_mouth_smile_v5_lower_again"
        default: return ""
        }
    }

    private var hasMouthAsset: Bool {
        let name = Self.mouthAssetName(for: mouthStyle)
        return !name.isEmpty && UIImage(named: name) != nil
    }

    var body: some View {
        Canvas { context, canvasSize in
            let rect = CGRect(origin: .zero, size: canvasSize)
            if let baseImage = context.resolveSymbol(id: "base") {
                context.draw(baseImage, in: rect)
            }
            if let eyesImage = context.resolveSymbol(id: "eyes") {
                context.draw(eyesImage, in: rect)
            }
            if let mouthImage = context.resolveSymbol(id: "mouth") {
                context.draw(mouthImage, in: rect)
            }
        } symbols: {
            Image(Self.bunnyBaseAsset)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .tag("base")

            Image(Self.eyeAssetName(for: eyeStyle))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .tag("eyes")

            if hasMouthAsset {
                Image(Self.mouthAssetName(for: mouthStyle))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .tag("mouth")
            }
        }
        .frame(width: size, height: size)
        .scaleEffect(contentScale)
        .frame(width: size, height: size)
        .clipped()
    }
}
