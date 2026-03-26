import Foundation

nonisolated enum InsulinTherapeuticRole: String, Sendable, CaseIterable {
    case basal
    case bolus
    case shortActing

    var label: String {
        switch self {
        case .basal: "Basal / Background"
        case .bolus: "Bolus / Mealtime"
        case .shortActing: "Short-Acting"
        }
    }
}

nonisolated enum TherapyFamily: String, Sendable {
    case insulin
    case biguanide
    case tzd
    case sglt2
    case glp1
    case dpp4
    case sulfonylurea
    case thyroidReplacement
    case antiThyroid
    case corticosteroid
}

nonisolated enum EndocrineConfusionGroup: String, Sendable {
    case basalInsulins
    case rapidInsulins
    case basalVsBolus
    case oralDiabetesClasses
    case thyroidReplacementPair
    case antiThyroidPair
    case corticosteroidPotency
}

nonisolated struct ContrastPair: Sendable {
    let drugIdA: String
    let drugIdB: String
    let confusionGroup: EndocrineConfusionGroup
    let differentiator: String
}

nonisolated struct DrugRoleTag: Sendable {
    let drugId: String
    let therapyFamily: TherapyFamily
    let therapeuticRole: InsulinTherapeuticRole?
    let formulationTag: String
    let routeTag: String
    let confusionGroups: [EndocrineConfusionGroup]
}

struct Module3ContrastMetadata {
    static let drugRoles: [String: DrugRoleTag] = [
        "d46": DrugRoleTag(drugId: "d46", therapyFamily: .insulin, therapeuticRole: .basal, formulationTag: "long-acting analog", routeTag: "SubQ", confusionGroups: [.basalInsulins, .basalVsBolus]),
        "d47": DrugRoleTag(drugId: "d47", therapyFamily: .insulin, therapeuticRole: .bolus, formulationTag: "rapid-acting analog", routeTag: "SubQ", confusionGroups: [.rapidInsulins, .basalVsBolus]),
        "d48": DrugRoleTag(drugId: "d48", therapyFamily: .insulin, therapeuticRole: .bolus, formulationTag: "rapid-acting analog", routeTag: "SubQ", confusionGroups: [.rapidInsulins, .basalVsBolus]),
        "d49": DrugRoleTag(drugId: "d49", therapyFamily: .insulin, therapeuticRole: .basal, formulationTag: "long-acting analog", routeTag: "SubQ", confusionGroups: [.basalInsulins, .basalVsBolus]),
        "d50": DrugRoleTag(drugId: "d50", therapyFamily: .insulin, therapeuticRole: .shortActing, formulationTag: "human insulin", routeTag: "SubQ/IV", confusionGroups: [.basalVsBolus]),
        "d45": DrugRoleTag(drugId: "d45", therapyFamily: .biguanide, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.oralDiabetesClasses]),
        "d58": DrugRoleTag(drugId: "d58", therapyFamily: .tzd, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.oralDiabetesClasses]),
        "d51": DrugRoleTag(drugId: "d51", therapyFamily: .sglt2, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.oralDiabetesClasses]),
        "d52": DrugRoleTag(drugId: "d52", therapyFamily: .sglt2, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.oralDiabetesClasses]),
        "d53": DrugRoleTag(drugId: "d53", therapyFamily: .glp1, therapeuticRole: nil, formulationTag: "injectable/oral", routeTag: "SubQ/PO", confusionGroups: [.oralDiabetesClasses]),
        "d54": DrugRoleTag(drugId: "d54", therapyFamily: .glp1, therapeuticRole: nil, formulationTag: "injectable", routeTag: "SubQ", confusionGroups: [.oralDiabetesClasses]),
        "d55": DrugRoleTag(drugId: "d55", therapyFamily: .dpp4, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.oralDiabetesClasses]),
        "d56": DrugRoleTag(drugId: "d56", therapyFamily: .sulfonylurea, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.oralDiabetesClasses]),
        "d57": DrugRoleTag(drugId: "d57", therapyFamily: .sulfonylurea, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.oralDiabetesClasses]),
        "d59": DrugRoleTag(drugId: "d59", therapyFamily: .thyroidReplacement, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.thyroidReplacementPair]),
        "d60": DrugRoleTag(drugId: "d60", therapyFamily: .thyroidReplacement, therapeuticRole: nil, formulationTag: "oral tablet/IV", routeTag: "PO/IV", confusionGroups: [.thyroidReplacementPair]),
        "d61": DrugRoleTag(drugId: "d61", therapyFamily: .antiThyroid, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.antiThyroidPair]),
        "d62": DrugRoleTag(drugId: "d62", therapyFamily: .antiThyroid, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.antiThyroidPair]),
        "d163": DrugRoleTag(drugId: "d163", therapyFamily: .corticosteroid, therapeuticRole: nil, formulationTag: "oral tablet", routeTag: "PO", confusionGroups: [.corticosteroidPotency]),
        "d164": DrugRoleTag(drugId: "d164", therapyFamily: .corticosteroid, therapeuticRole: nil, formulationTag: "oral/IV", routeTag: "PO/IV", confusionGroups: [.corticosteroidPotency]),
        "d165": DrugRoleTag(drugId: "d165", therapyFamily: .corticosteroid, therapeuticRole: nil, formulationTag: "oral/IV", routeTag: "PO/IV/IM", confusionGroups: [.corticosteroidPotency]),
        "d166": DrugRoleTag(drugId: "d166", therapyFamily: .corticosteroid, therapeuticRole: nil, formulationTag: "oral/IV", routeTag: "PO/IV", confusionGroups: [.corticosteroidPotency]),
    ]

    static let contrastPairs: [ContrastPair] = [
        ContrastPair(drugIdA: "d46", drugIdB: "d49", confusionGroup: .basalInsulins, differentiator: "Glargine is peakless ~24h; detemir may need BID dosing"),
        ContrastPair(drugIdA: "d47", drugIdB: "d48", confusionGroup: .rapidInsulins, differentiator: "Lispro (Humalog) vs aspart (NovoLog) — both rapid-acting, different brands"),
        ContrastPair(drugIdA: "d46", drugIdB: "d47", confusionGroup: .basalVsBolus, differentiator: "Glargine = basal/background; lispro = bolus/mealtime"),
        ContrastPair(drugIdA: "d49", drugIdB: "d48", confusionGroup: .basalVsBolus, differentiator: "Detemir = basal; aspart = bolus"),
        ContrastPair(drugIdA: "d50", drugIdB: "d47", confusionGroup: .basalVsBolus, differentiator: "Regular = short-acting (30 min before meal, IV capable); lispro = rapid-acting (15 min)"),
        ContrastPair(drugIdA: "d45", drugIdB: "d58", confusionGroup: .oralDiabetesClasses, differentiator: "Metformin = biguanide, first-line; pioglitazone = TZD, fluid retention/HF risk"),
        ContrastPair(drugIdA: "d59", drugIdB: "d60", confusionGroup: .thyroidReplacementPair, differentiator: "Levothyroxine = T4, first-line, long half-life; liothyronine = T3, shorter half-life"),
        ContrastPair(drugIdA: "d61", drugIdB: "d62", confusionGroup: .antiThyroidPair, differentiator: "Methimazole = preferred (less hepatotoxicity); PTU = 1st trimester pregnancy & thyroid storm"),
        ContrastPair(drugIdA: "d163", drugIdB: "d165", confusionGroup: .corticosteroidPotency, differentiator: "Prednisone = moderate potency, oral workhorse; dexamethasone = most potent, no mineralocorticoid"),
        ContrastPair(drugIdA: "d165", drugIdB: "d166", confusionGroup: .corticosteroidPotency, differentiator: "Dexamethasone = most potent, long half-life; hydrocortisone = least potent, most mineralocorticoid, physiologic replacement"),
    ]

    static func insulinRole(for drugId: String) -> InsulinTherapeuticRole? {
        drugRoles[drugId]?.therapeuticRole
    }

    static func isModule3Drug(_ drugId: String) -> Bool {
        drugRoles[drugId] != nil
    }

    static func confusionGroupDrugs(for group: EndocrineConfusionGroup) -> [String] {
        drugRoles.values.filter { $0.confusionGroups.contains(group) }.map(\.drugId)
    }

    static func contrastPairsFor(drugId: String) -> [ContrastPair] {
        contrastPairs.filter { $0.drugIdA == drugId || $0.drugIdB == drugId }
    }
}
