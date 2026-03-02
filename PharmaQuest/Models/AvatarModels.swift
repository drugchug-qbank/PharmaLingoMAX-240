import SwiftUI

nonisolated enum AnimalType: String, CaseIterable, Sendable {
    case beaver, bird, bunny, cat, dog, dragon, elephant, fox, frog, giraffe
    case hedgehog, horse, lion, monkey, octopus, owl, panda, raccoon, seal, sloth, turtle, unicorn

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
        case .hedgehog: "Hedgehog"
        case .horse: "Horse"
        case .lion: "Lion"
        case .monkey: "Monkey"
        case .octopus: "Octopus"
        case .owl: "Owl"
        case .panda: "Panda"
        case .raccoon: "Raccoon"
        case .seal: "Seal"
        case .sloth: "Sloth"
        case .turtle: "Turtle"
        case .unicorn: "Unicorn"
        }
    }

    var price: Int {
        switch self {
        case .beaver, .bunny, .cat, .dog: 0
        case .bird, .frog, .turtle, .seal: 100
        case .monkey, .raccoon, .owl, .sloth: 200
        case .dragon, .elephant, .hedgehog, .fox: 300
        case .giraffe, .horse, .panda, .octopus: 400
        case .lion, .unicorn: 500
        }
    }

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
        case .hedgehog: "8D6E63"
        case .horse: "795548"
        case .lion: "FFA726"
        case .monkey: "A1887F"
        case .octopus: "CE93D8"
        case .owl: "8D6E63"
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

    var displayName: String {
        switch self {
        case .normal: "Normal"
        case .happy: "Happy"
        case .big: "Big"
        case .sleepy: "Sleepy"
        case .wink: "Wink"
        case .stars: "Stars"
        case .heart: "Heart"
        case .determined: "Fierce"
        case .surprised: "Surprised"
        case .cool: "Cool"
        }
    }

    var price: Int {
        switch self {
        case .normal, .happy, .big: 0
        case .sleepy, .wink: 50
        case .stars, .heart: 150
        case .determined, .surprised: 100
        case .cool: 200
        }
    }
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

    var price: Int {
        switch self {
        case .smile, .bigSmile, .tiny: 0
        case .tongue, .flat: 50
        case .oh, .catMouth: 100
        case .smirk, .teeth: 150
        case .wavy: 200
        }
    }
}

nonisolated enum AccessoryType: String, CaseIterable, Sendable {
    case none, crown, gradCap, stethoscope, topHat, bow, glasses, bandana, halo, headphones

    var displayName: String {
        switch self {
        case .none: "None"
        case .crown: "Crown"
        case .gradCap: "Grad Cap"
        case .stethoscope: "Stethoscope"
        case .topHat: "Top Hat"
        case .bow: "Bow"
        case .glasses: "Glasses"
        case .bandana: "Bandana"
        case .halo: "Halo"
        case .headphones: "Headphones"
        }
    }

    var price: Int {
        switch self {
        case .none: 0
        case .bow, .bandana: 100
        case .glasses, .halo: 200
        case .crown, .gradCap: 300
        case .stethoscope, .topHat: 350
        case .headphones: 250
        }
    }
}

enum AvatarColorPalette {
    static let bodyColors: [(name: String, hex: String)] = [
        ("Red", "EF5350"), ("Orange", "FF7043"), ("Amber", "FFA726"),
        ("Yellow", "FFEE58"), ("Lime", "D4E157"), ("Green", "66BB6A"),
        ("Teal", "26A69A"), ("Cyan", "26C6DA"), ("Blue", "42A5F5"),
        ("Indigo", "5C6BC0"), ("Purple", "AB47BC"), ("Pink", "EC407A"),
        ("Brown", "8D6E63"), ("Gray", "BDBDBD"), ("Cream", "FFF8E1"),
        ("Peach", "FFCCBC"), ("Lavender", "D1C4E9"), ("Mint", "B2DFDB"),
    ]

    static let backgroundColors: [(name: String, hex: String)] = [
        ("Soft Yellow", "FFF9C4"), ("Soft Pink", "FCE4EC"), ("Soft Blue", "E3F2FD"),
        ("Soft Green", "E8F5E9"), ("Soft Purple", "F3E5F5"), ("Soft Orange", "FFF3E0"),
        ("White", "FFFFFF"), ("Light Gray", "F5F5F5"), ("Coral", "FFCCBC"),
        ("Mint", "E0F2F1"), ("Lavender", "EDE7F6"), ("Peach", "FBE9E7"),
    ]
}
