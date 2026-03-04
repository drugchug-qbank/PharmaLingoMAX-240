import Foundation

nonisolated struct DoseFact: Hashable, Sendable {
    let context: String
    let dose: String
}

nonisolated struct Drug: Identifiable, Hashable, Sendable {
    let id: String
    let genericName: String
    let brandName: String
    let drugClass: String
    let suffix: String
    let indications: [String]
    let sideEffects: [String]
    let clinicalPearls: [String]
    let blackBoxWarnings: [String]
    let majorContraindications: [String]
    let monitoring: [String]
    let commonDosing: [DoseFact]

    init(
        id: String,
        genericName: String,
        brandName: String,
        drugClass: String,
        suffix: String,
        indications: [String],
        sideEffects: [String],
        clinicalPearls: [String],
        blackBoxWarnings: [String] = [],
        majorContraindications: [String] = [],
        monitoring: [String] = [],
        commonDosing: [DoseFact] = []
    ) {
        self.id = id
        self.genericName = genericName
        self.brandName = brandName
        self.drugClass = drugClass
        self.suffix = suffix
        self.indications = indications
        self.sideEffects = sideEffects
        self.clinicalPearls = clinicalPearls
        self.blackBoxWarnings = blackBoxWarnings
        self.majorContraindications = majorContraindications
        self.monitoring = monitoring
        self.commonDosing = commonDosing
    }
}

nonisolated struct LearningSlide: Identifiable, Hashable, Sendable {
    let id: String
    let title: String
    let content: String
    let bulletPoints: [String]
    let highlightText: String
}

nonisolated struct Subsection: Identifiable, Sendable {
    let id: String
    let moduleId: String
    let code: String
    let title: String
    let description: String
    let iconName: String
    let drugs: [Drug]
    let isMasteryQuiz: Bool
    let learningSlides: [LearningSlide]
}

extension Subsection: Hashable {
    nonisolated static func == (lhs: Subsection, rhs: Subsection) -> Bool { lhs.id == rhs.id }
    nonisolated func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

nonisolated struct DrugModule: Identifiable, Sendable {
    let id: String
    let number: Int
    let title: String
    let subtitle: String
    let iconName: String
    let accentColorHex: String
    let subsections: [Subsection]
}

extension DrugModule: Hashable {
    nonisolated static func == (lhs: DrugModule, rhs: DrugModule) -> Bool { lhs.id == rhs.id }
    nonisolated func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
