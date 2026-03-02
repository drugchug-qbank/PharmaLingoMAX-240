import SwiftUI

nonisolated enum AnimalType: String, CaseIterable, Sendable {
    case beaver, bird, bunny, cat, dog, dragon, elephant, fox, frog, giraffe
    case lion, monkey, panda, raccoon, seal, sloth, turtle, unicorn

    var displayName: String {
        switch self {
        case .beaver: "Beaver"
        case .bird: "Bird"
        case .bunny: "Bunny"
        case .cat: "Cat"
        case .dog: "Dog"
        case .dragon: "Dragon"
        case .elephant: "Elephant"
        case .fox: "Fox"
        case .frog: "Frog"
        case .giraffe: "Giraffe"
        case .lion: "Lion"
        case .monkey: "Monkey"
        case .panda: "Panda"
        case .raccoon: "Raccoon"
        case .seal: "Seal"
        case .sloth: "Sloth"
        case .turtle: "Turtle"
        case .unicorn: "Unicorn"
        }
    }

    var price: Int { 0 }

    var defaultColorHex: String {
        switch self {
        case .beaver: "8B5E3C"
        case .bird: "4FC3F7"
        case .bunny: "F8BBD0"
        case .cat: "FF8A65"
        case .dog: "A1887F"
        case .dragon: "66BB6A"
        case .elephant: "90A4AE"
        case .fox: "FF7043"
        case .frog: "81C784"
        case .giraffe: "FFD54F"
        case .lion: "FFA726"
        case .monkey: "A1887F"
        case .panda: "E0E0E0"
        case .raccoon: "78909C"
        case .seal: "B0BEC5"
        case .sloth: "BCAAA4"
        case .turtle: "4DB6AC"
        case .unicorn: "F8BBD0"
        }
    }
}

nonisolated enum EyeStyle: String, CaseIterable, Sendable {
    case normal, happy, big, sleepy, wink, stars, heart, determined, surprised, cool
    case angry, rainbow, eyeRoll, dizzy, crying

    var displayName: String {
        switch self {
        case .normal: "Normal"
        case .happy: "Happy"
        case .big: "Big"
        case .sleepy: "Sleepy"
        case .wink: "Wink"
        case .stars: "Stars"
        case .heart: "Heart"
        case .determined: "Worried"
        case .surprised: "Surprised"
        case .cool: "Cool"
        case .angry: "Angry"
        case .rainbow: "Rainbow"
        case .eyeRoll: "Eye Roll"
        case .dizzy: "Dizzy"
        case .crying: "Crying"
        }
    }

    var price: Int { 0 }
}

nonisolated enum MouthStyle: String, CaseIterable, Sendable {
    case smile, bigSmile, tongue, oh, catMouth, smirk, teeth, tiny, flat, wavy

    var displayName: String {
        switch self {
        case .smile: "Smile"
        case .bigSmile: "Grin"
        case .tongue: "Tongue"
        case .oh: "Oh!"
        case .catMouth: "Cat"
        case .smirk: "Smirk"
        case .teeth: "Teeth"
        case .tiny: "Tiny"
        case .flat: "Flat"
        case .wavy: "Wavy"
        }
    }

    var price: Int { 0 }
}

nonisolated enum AccessoryType: String, CaseIterable, Sendable {
    case none, crown, gradCap, topHat, bow, bandana, halo, headphones
    case eyePatch, partyHat, flower, horns, tiara, beanie

    var displayName: String {
        switch self {
        case .none: "None"
        case .crown: "Crown"
        case .gradCap: "Grad Cap"
        case .topHat: "Top Hat"
        case .bow: "Bow"
        case .bandana: "Bandana"
        case .halo: "Halo"
        case .headphones: "Headphones"
        case .eyePatch: "Eye Patch"
        case .partyHat: "Party Hat"
        case .flower: "Flower"
        case .horns: "Horns"
        case .tiara: "Tiara"
        case .beanie: "Beanie"
        }
    }

    var price: Int { 0 }
}

enum AvatarColorPalette {
    static let bodyColors: [(name: String, hex: String)] = [
        ("Red", "EF5350"), ("Coral", "FF7043"), ("Orange", "FFA726"),
        ("Amber", "FFB74D"), ("Yellow", "FFEE58"), ("Lime", "D4E157"),
        ("Green", "66BB6A"), ("Sage", "A5D6A7"), ("Teal", "26A69A"),
        ("Cyan", "26C6DA"), ("Sky", "4FC3F7"), ("Blue", "42A5F5"),
        ("Indigo", "5C6BC0"), ("Purple", "AB47BC"), ("Lilac", "CE93D8"),
        ("Pink", "EC407A"), ("Rose", "F48FB1"), ("Blush", "FFCDD2"),
        ("Brown", "8D6E63"), ("Mocha", "A1887F"), ("Tan", "D7CCC8"),
        ("Gray", "BDBDBD"), ("Slate", "90A4AE"), ("Cream", "FFF8E1"),
        ("Peach", "FFCCBC"), ("Lavender", "D1C4E9"), ("Mint", "B2DFDB"),
        ("Cloud", "ECEFF1"),
    ]

    static let backgroundColors: [(name: String, hex: String)] = [
        ("Soft Yellow", "FFF9C4"), ("Soft Pink", "FCE4EC"), ("Soft Blue", "E3F2FD"),
        ("Soft Green", "E8F5E9"), ("Soft Purple", "F3E5F5"), ("Soft Orange", "FFF3E0"),
        ("White", "FFFFFF"), ("Light Gray", "F5F5F5"), ("Coral", "FFCCBC"),
        ("Mint", "E0F2F1"), ("Lavender", "EDE7F6"), ("Peach", "FBE9E7"),
        ("Sky", "BBDEFB"), ("Rose", "F8BBD0"), ("Butter", "FFF59D"),
        ("Sage", "C8E6C9"), ("Lilac", "E1BEE7"), ("Powder", "B3E5FC"),
        ("Sand", "FFECB3"), ("Ice", "E0F7FA"), ("Blush", "FCE4EC"),
        ("Slate", "CFD8DC"), ("Cream", "FFFDE7"), ("Cloud", "FAFAFA"),
    ]
}
