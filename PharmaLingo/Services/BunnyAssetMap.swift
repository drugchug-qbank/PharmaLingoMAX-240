import SwiftUI

enum BunnyAssetMap {

    static let base = "avatar_bunny_base_v2"

    private static let eyeAssets: [EyeStyle: String] = [
        .normal: "avatar_bunny_eyes_neutral_v4_close",
    ]

    private static let mouthAssets: [MouthStyle: String] = [
        .smile: "avatar_bunny_mouth_smile_v5_lower_again",
    ]

    static func eyeAssetName(for style: EyeStyle) -> String? {
        guard let name = eyeAssets[style],
              UIImage(named: name) != nil else { return nil }
        return name
    }

    static func mouthAssetName(for style: MouthStyle) -> String? {
        guard let name = mouthAssets[style],
              UIImage(named: name) != nil else { return nil }
        return name
    }

    static func hasFullPNGSupport(eye: EyeStyle, mouth: MouthStyle) -> Bool {
        eyeAssetName(for: eye) != nil
    }

    static func canRender(animal: AnimalType, eye: EyeStyle) -> Bool {
        animal == .bunny
            && UIImage(named: base) != nil
            && eyeAssetName(for: eye) != nil
    }
}
