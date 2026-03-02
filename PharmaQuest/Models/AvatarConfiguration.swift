import SwiftUI

nonisolated struct AvatarConfiguration: Hashable, Codable, Sendable {
    let animal: String
    let eyes: String
    let mouth: String
    let accessory: String
    let bodyHex: String
    let bgHex: String

    var cacheKey: String {
        "\(animal)_\(eyes)_\(mouth)_\(accessory)_\(bodyHex)_\(bgHex)"
    }

    var animalType: AnimalType {
        AnimalType(rawValue: animal) ?? .beaver
    }

    var eyeStyle: EyeStyle {
        EyeStyle(rawValue: eyes) ?? .normal
    }

    var mouthStyle: MouthStyle {
        MouthStyle(rawValue: mouth) ?? .smile
    }

    var accessoryType: AccessoryType {
        AccessoryType(rawValue: accessory) ?? .none
    }

    var bodyColor: Color {
        bodyHex.isEmpty ? Color(hex: animalType.defaultColorHex) : Color(hex: bodyHex)
    }

    var bgColor: Color {
        bgHex.isEmpty ? Color(hex: "E3F2FD") : Color(hex: bgHex)
    }

    init(animal: String, eyes: String, mouth: String, accessory: String, bodyHex: String = "", bgHex: String = "") {
        self.animal = animal
        self.eyes = eyes
        self.mouth = mouth
        self.accessory = accessory
        self.bodyHex = bodyHex
        self.bgHex = bgHex
    }
}
