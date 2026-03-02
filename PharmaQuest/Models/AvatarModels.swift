import SwiftUI

nonisolated struct AvatarFaceLayout: Hashable, Sendable {
    let eyesOffsetY: CGFloat
    let eyesWidth: CGFloat
    let eyesHeight: CGFloat
    let mouthOffsetY: CGFloat
    let mouthWidth: CGFloat
    let mouthHeight: CGFloat
}

nonisolated struct AvatarAnimal: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let imageURL: String
    let price: Int
    let isDefault: Bool
    let faceLayout: AvatarFaceLayout
}

nonisolated struct AvatarEyes: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let imageURL: String
    let price: Int
    let isDefault: Bool
}

nonisolated struct AvatarMouth: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let imageURL: String
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
    static let defaultFaceLayout = AvatarFaceLayout(
        eyesOffsetY: -0.08, eyesWidth: 0.45, eyesHeight: 0.22,
        mouthOffsetY: 0.12, mouthWidth: 0.28, mouthHeight: 0.14
    )

    static let animals: [AvatarAnimal] = [
        AvatarAnimal(id: "beaver", name: "Beaver", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/3bxdrsma737ku5igzzosa", price: 0, isDefault: true,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.10, eyesWidth: 0.40, eyesHeight: 0.20, mouthOffsetY: 0.08, mouthWidth: 0.25, mouthHeight: 0.13)),
        AvatarAnimal(id: "bird", name: "Bird", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/ua5aiahukr52gzi5oa03g", price: 0, isDefault: true,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.14, eyesWidth: 0.38, eyesHeight: 0.18, mouthOffsetY: 0.04, mouthWidth: 0.22, mouthHeight: 0.12)),
        AvatarAnimal(id: "bunny", name: "Bunny", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/3iktec67qtgqkk7cn5o31", price: 0, isDefault: true,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.06, eyesWidth: 0.42, eyesHeight: 0.20, mouthOffsetY: 0.12, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "cat", name: "Cat", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/4emw15xtoleffzodgdjil", price: 0, isDefault: true,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.08, eyesWidth: 0.44, eyesHeight: 0.20, mouthOffsetY: 0.10, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "dragon", name: "Dragon", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/a6i2ghvmflp04clvuqaov", price: 300, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.12, eyesWidth: 0.42, eyesHeight: 0.20, mouthOffsetY: 0.08, mouthWidth: 0.26, mouthHeight: 0.14)),
        AvatarAnimal(id: "elephant", name: "Elephant", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/ayyolbbwmkq03cvz0s4sw", price: 300, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.12, eyesWidth: 0.44, eyesHeight: 0.20, mouthOffsetY: 0.06, mouthWidth: 0.26, mouthHeight: 0.13)),
        AvatarAnimal(id: "frog", name: "Frog", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/wsi9bra51ebmt43rzib5n", price: 200, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.16, eyesWidth: 0.48, eyesHeight: 0.22, mouthOffsetY: 0.06, mouthWidth: 0.30, mouthHeight: 0.14)),
        AvatarAnimal(id: "giraffe", name: "Giraffe", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/py0gq0fyirue32rk5vnc1", price: 400, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.10, eyesWidth: 0.38, eyesHeight: 0.18, mouthOffsetY: 0.10, mouthWidth: 0.22, mouthHeight: 0.12)),
        AvatarAnimal(id: "hedgehog", name: "Hedgehog", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/tqrq77v9p35zsd486rape", price: 350, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.06, eyesWidth: 0.40, eyesHeight: 0.20, mouthOffsetY: 0.12, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "horse", name: "Horse", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/vq07h0t45ekoqtd5qsu00", price: 400, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.10, eyesWidth: 0.38, eyesHeight: 0.18, mouthOffsetY: 0.10, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "lion", name: "Lion", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/8yyvxgnh8325tx2c6mnfy", price: 500, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.08, eyesWidth: 0.42, eyesHeight: 0.20, mouthOffsetY: 0.10, mouthWidth: 0.26, mouthHeight: 0.13)),
        AvatarAnimal(id: "monkey", name: "Monkey", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/jtgl9hv856brf7faj05xk", price: 300, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.08, eyesWidth: 0.44, eyesHeight: 0.22, mouthOffsetY: 0.10, mouthWidth: 0.26, mouthHeight: 0.13)),
        AvatarAnimal(id: "octopus", name: "Octopus", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/gyjlhx6lnhixvx3bevj9k", price: 350, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.12, eyesWidth: 0.44, eyesHeight: 0.22, mouthOffsetY: 0.06, mouthWidth: 0.26, mouthHeight: 0.13)),
        AvatarAnimal(id: "owl", name: "Owl", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/643g9e4ne3bs6wsfxwttq", price: 300, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.10, eyesWidth: 0.46, eyesHeight: 0.22, mouthOffsetY: 0.08, mouthWidth: 0.22, mouthHeight: 0.12)),
        AvatarAnimal(id: "panda", name: "Panda", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/jqedi9enhum1n4g99spte", price: 400, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.08, eyesWidth: 0.46, eyesHeight: 0.22, mouthOffsetY: 0.10, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "panda2", name: "Red Panda", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/8epgdhkf5rijly32vcli6", price: 450, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.08, eyesWidth: 0.44, eyesHeight: 0.20, mouthOffsetY: 0.10, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "raccoon", name: "Raccoon", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/ph2xrxrcje44qlmg3p569", price: 300, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.08, eyesWidth: 0.44, eyesHeight: 0.20, mouthOffsetY: 0.10, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "seal", name: "Seal", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/v8t8mgttkuljwqggcdhs4", price: 350, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.10, eyesWidth: 0.42, eyesHeight: 0.20, mouthOffsetY: 0.08, mouthWidth: 0.26, mouthHeight: 0.13)),
        AvatarAnimal(id: "sloth", name: "Sloth", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/952zqzsjk47ueoqzrpfao", price: 300, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.08, eyesWidth: 0.44, eyesHeight: 0.22, mouthOffsetY: 0.10, mouthWidth: 0.26, mouthHeight: 0.13)),
        AvatarAnimal(id: "turtle", name: "Turtle", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/ii8g526759vcpljce4pye", price: 200, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.10, eyesWidth: 0.40, eyesHeight: 0.20, mouthOffsetY: 0.08, mouthWidth: 0.24, mouthHeight: 0.12)),
        AvatarAnimal(id: "unicorn", name: "Unicorn", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/0nuat64kwrrj220q3bubq", price: 600, isDefault: false,
            faceLayout: AvatarFaceLayout(eyesOffsetY: -0.10, eyesWidth: 0.40, eyesHeight: 0.18, mouthOffsetY: 0.08, mouthWidth: 0.24, mouthHeight: 0.12)),
    ]

    static let eyes: [AvatarEyes] = [
        AvatarEyes(id: "none", name: "Default", imageURL: "", price: 0, isDefault: true),
        AvatarEyes(id: "eyes_1", name: "Brown", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/3c0vdxjfpovj6mvs640g5", price: 150, isDefault: false),
        AvatarEyes(id: "eyes_2", name: "Blue", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/a490qkt1bny0p9kcrs5wc", price: 200, isDefault: false),
        AvatarEyes(id: "eyes_3", name: "Rainbow", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/qe92t60c0rucql02w5tmv", price: 350, isDefault: false),
    ]

    static let mouths: [AvatarMouth] = [
        AvatarMouth(id: "none", name: "Default", imageURL: "", price: 0, isDefault: true),
        AvatarMouth(id: "mouth_1", name: "Happy", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/w3dwp7994pcyp7qakt4jd", price: 150, isDefault: false),
        AvatarMouth(id: "mouth_2", name: "Smile", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/ll1vcwxp14jtwdp3tadg8", price: 100, isDefault: false),
        AvatarMouth(id: "mouth_3", name: "Tongue", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/u5x5tj4bp3stlvlw58ipw", price: 200, isDefault: false),
        AvatarMouth(id: "mouth_4", name: "Lips", imageURL: "https://pub-e001eb4506b145aa938b5d3badbff6a5.r2.dev/attachments/i1zqdmbgjgv3lr1z7au08", price: 250, isDefault: false),
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

    static func animalImageURL(for id: String) -> String? {
        animals.first(where: { $0.id == id })?.imageURL
    }

    static func faceLayout(for animalId: String) -> AvatarFaceLayout {
        animals.first(where: { $0.id == animalId })?.faceLayout ?? defaultFaceLayout
    }

    static func eyesImageURL(for id: String) -> String? {
        guard id != "none" else { return nil }
        return eyes.first(where: { $0.id == id })?.imageURL
    }

    static func mouthImageURL(for id: String) -> String? {
        guard id != "none" else { return nil }
        return mouths.first(where: { $0.id == id })?.imageURL
    }
}
