import SwiftUI

nonisolated enum AnimalType: String, CaseIterable, Sendable {
    case bear, beaver, cat, chipmunk, deer, dog, dragon, fox
    case hedgehog, lion, monkey, mouse, octopus, panda, raccoon, tiger, unicorn

    var displayName: String {
        switch self {
        case .bear: "Bear"
        case .beaver: "Beaver"
        case .cat: "Cat"
        case .chipmunk: "Chipmunk"
        case .deer: "Deer"
        case .dog: "Dog"
        case .dragon: "Dragon"
        case .fox: "Fox"
        case .hedgehog: "Hedgehog"
        case .lion: "Lion"
        case .monkey: "Monkey"
        case .mouse: "Mouse"
        case .octopus: "Octopus"
        case .panda: "Panda"
        case .raccoon: "Raccoon"
        case .tiger: "Tiger"
        case .unicorn: "Unicorn"
        }
    }

    var price: Int { 0 }

    var defaultColorHex: String {
        switch self {
        case .bear: "8D6E63"
        case .beaver: "8B5E3C"
        case .cat: "FF8A65"
        case .chipmunk: "C4956A"
        case .deer: "C4956A"
        case .dog: "A1887F"
        case .dragon: "66BB6A"
        case .fox: "FF7043"
        case .hedgehog: "C4956A"
        case .lion: "FFA726"
        case .monkey: "A1887F"
        case .mouse: "B0BEC5"
        case .octopus: "CE93D8"
        case .panda: "E0E0E0"
        case .raccoon: "78909C"
        case .tiger: "FF8C00"
        case .unicorn: "F8BBD0"
        }
    }
}

nonisolated enum EyeStyle: String, CaseIterable, Sendable {
    case normal, happy, big, sleepy, wink, stars, heart, determined, surprised, cool
    case angry, rainbow, eyeRoll, dizzy, crying
    case dotFriendly, roundBright, almond, droopy, sharpConfident
    case sparkleGlam, glanceLeft, glanceRight, winkLeft, winkRight
    case lashesSoft, boldBrow, relaxedBlink, sadEyes
    case dizzySwirl, starEyes, heartEyes

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
        case .dotFriendly: "Dot"
        case .roundBright: "Round"
        case .almond: "Almond"
        case .droopy: "Droopy"
        case .sharpConfident: "Sharp"
        case .sparkleGlam: "Sparkle"
        case .glanceLeft: "Glance Left"
        case .glanceRight: "Glance Right"
        case .winkLeft: "Wink Left"
        case .winkRight: "Wink Right"
        case .lashesSoft: "Lashes"
        case .boldBrow: "Bold Brow"
        case .relaxedBlink: "Relaxed"
        case .sadEyes: "Sad"
        case .dizzySwirl: "Dizzy Swirl"
        case .starEyes: "Star Eyes"
        case .heartEyes: "Heart Eyes"
        }
    }

    var price: Int { 0 }
}

nonisolated enum MouthStyle: String, CaseIterable, Sendable {
    case smile, bigSmile, tongue, oh, catMouth, smirk, teeth, tiny, flat, wavy
    case teethGrin, grin, toothedGrin, neutralLine, pout
    case surprisedO, laughOpen, tonguePlayful, sadMouth, sadDown
    case determinedFlat, buckToothSmile, fangPeek, sleepySmall
    case grittedTeeth, buckTeeth, kiss, smirkTeeth, vampire

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
        case .teethGrin: "Teeth Grin"
        case .grin: "Grin Wide"
        case .toothedGrin: "Toothy"
        case .neutralLine: "Neutral"
        case .pout: "Pout"
        case .surprisedO: "Surprised"
        case .laughOpen: "Laugh"
        case .tonguePlayful: "Playful"
        case .sadMouth: "Sad"
        case .sadDown: "Frown"
        case .determinedFlat: "Determined"
        case .buckToothSmile: "Buck Tooth"
        case .fangPeek: "Fang"
        case .sleepySmall: "Sleepy"
        case .grittedTeeth: "Gritted"
        case .buckTeeth: "Buck Teeth"
        case .kiss: "Kiss"
        case .smirkTeeth: "Smirk Teeth"
        case .vampire: "Vampire"
        }
    }

    var price: Int { 0 }
}

nonisolated enum AccessoryType: String, CaseIterable, Sendable {
    case none, crown, gradCap, topHat, bow, bandana, halo, headphones
    case eyePatch, partyHat, flower, horns, tiara, beanie
    case roundGlasses, heartSunglasses, monocle, flowerCrown
    case wizardHat, bucketHat, pearlNecklace, bowClip

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
        case .tiara: "Small Crown"
        case .beanie: "Beanie"
        case .roundGlasses: "Glasses"
        case .heartSunglasses: "Heart Shades"
        case .monocle: "Monocle"
        case .flowerCrown: "Flower Crown"
        case .wizardHat: "Wizard Hat"
        case .bucketHat: "Bucket Hat"
        case .pearlNecklace: "Pearls"
        case .bowClip: "Bow Clip"
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
