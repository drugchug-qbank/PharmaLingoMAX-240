import SwiftUI

nonisolated struct AvatarAnimal: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let iconName: String
    let price: Int
    let isDefault: Bool
}

nonisolated struct AvatarEyes: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let iconName: String
    let price: Int
    let isDefault: Bool
}

nonisolated struct AvatarMouth: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let iconName: String
    let price: Int
    let isDefault: Bool
}

nonisolated struct AvatarAccessory: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let iconName: String
    let price: Int
    let isDefault: Bool
}

enum AvatarShop {
    static let animals: [AvatarAnimal] = [
        AvatarAnimal(id: "hare.fill", name: "Bunny", iconName: "hare.fill", price: 0, isDefault: true),
        AvatarAnimal(id: "tortoise.fill", name: "Turtle", iconName: "tortoise.fill", price: 0, isDefault: true),
        AvatarAnimal(id: "bird.fill", name: "Bird", iconName: "bird.fill", price: 300, isDefault: false),
        AvatarAnimal(id: "cat.fill", name: "Cat", iconName: "cat.fill", price: 300, isDefault: false),
        AvatarAnimal(id: "dog.fill", name: "Dog", iconName: "dog.fill", price: 300, isDefault: false),
        AvatarAnimal(id: "fish.fill", name: "Fish", iconName: "fish.fill", price: 400, isDefault: false),
        AvatarAnimal(id: "ant.fill", name: "Ant", iconName: "ant.fill", price: 400, isDefault: false),
        AvatarAnimal(id: "ladybug.fill", name: "Ladybug", iconName: "ladybug.fill", price: 500, isDefault: false),
        AvatarAnimal(id: "pawprint.fill", name: "Bear", iconName: "pawprint.fill", price: 500, isDefault: false),
        AvatarAnimal(id: "lizard.fill", name: "Lizard", iconName: "lizard.fill", price: 600, isDefault: false),
    ]

    static let eyes: [AvatarEyes] = [
        AvatarEyes(id: "default", name: "Normal", iconName: "eyes", price: 0, isDefault: true),
        AvatarEyes(id: "sparkle", name: "Sparkle", iconName: "sparkles", price: 150, isDefault: false),
        AvatarEyes(id: "star", name: "Star Eyes", iconName: "star.fill", price: 200, isDefault: false),
        AvatarEyes(id: "heart", name: "Heart Eyes", iconName: "heart.fill", price: 200, isDefault: false),
        AvatarEyes(id: "sunglasses", name: "Cool", iconName: "sunglasses", price: 250, isDefault: false),
        AvatarEyes(id: "wink", name: "Wink", iconName: "eye.fill", price: 150, isDefault: false),
    ]

    static let mouths: [AvatarMouth] = [
        AvatarMouth(id: "default", name: "Smile", iconName: "mouth.fill", price: 0, isDefault: true),
        AvatarMouth(id: "grin", name: "Grin", iconName: "face.smiling.inverse", price: 150, isDefault: false),
        AvatarMouth(id: "tongue", name: "Tongue", iconName: "face.smiling.inverse", price: 200, isDefault: false),
        AvatarMouth(id: "surprised", name: "Surprised", iconName: "exclamationmark.circle.fill", price: 200, isDefault: false),
        AvatarMouth(id: "whistle", name: "Whistle", iconName: "music.note", price: 250, isDefault: false),
    ]

    static let accessories: [AvatarAccessory] = [
        AvatarAccessory(id: "none", name: "None", iconName: "circle.slash", price: 0, isDefault: true),
        AvatarAccessory(id: "crown", name: "Crown", iconName: "crown.fill", price: 300, isDefault: false),
        AvatarAccessory(id: "graduation", name: "Grad Cap", iconName: "graduationcap.fill", price: 250, isDefault: false),
        AvatarAccessory(id: "stethoscope", name: "Stethoscope", iconName: "stethoscope", price: 300, isDefault: false),
        AvatarAccessory(id: "star_badge", name: "Star Badge", iconName: "star.circle.fill", price: 200, isDefault: false),
        AvatarAccessory(id: "shield", name: "Shield", iconName: "shield.fill", price: 350, isDefault: false),
        AvatarAccessory(id: "pill", name: "Rx Badge", iconName: "cross.case.fill", price: 300, isDefault: false),
    ]
}
