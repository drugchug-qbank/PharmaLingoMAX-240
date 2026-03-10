import SwiftUI

struct BunnyImageAvatarView: View {
    let eyeStyle: EyeStyle
    let mouthStyle: MouthStyle
    let accessory: AccessoryType
    let size: CGFloat
    var contentScale: CGFloat = 1.0

    static func canUseImagePath(animalType: AnimalType, eyeStyle: EyeStyle) -> Bool {
        BunnyAssetMap.canRender(animal: animalType, eye: eyeStyle)
    }

    private var mouthAsset: String? {
        BunnyAssetMap.mouthAssetName(for: mouthStyle)
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
            Image(BunnyAssetMap.base)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .tag("base")

            if let eyeName = BunnyAssetMap.eyeAssetName(for: eyeStyle) {
                Image(eyeName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .tag("eyes")
            }

            if let mouthName = mouthAsset {
                Image(mouthName)
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
