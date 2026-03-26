import Foundation

nonisolated enum AirwayRole: String, Sendable, CaseIterable {
    case rescue
    case controller
    case maintenanceBronchodilator
    case comboController
    case allergyNasal
    case decongestant
    case biologic
    case oralController
    case pde4Inhibitor
    case methylxanthine

    var label: String {
        switch self {
        case .rescue: "Rescue / Quick-Relief"
        case .controller: "Controller (ICS)"
        case .maintenanceBronchodilator: "Maintenance Bronchodilator"
        case .comboController: "Combo Controller (ICS/LABA)"
        case .allergyNasal: "Allergy / Nasal Therapy"
        case .decongestant: "Decongestant"
        case .biologic: "Biologic Add-On"
        case .oralController: "Oral Controller"
        case .pde4Inhibitor: "PDE-4 Inhibitor"
        case .methylxanthine: "Methylxanthine"
        }
    }
}

nonisolated enum RespiratoryControllerType: String, Sendable {
    case saba
    case sama
    case laba
    case lama
    case lamaLaba
    case ics
    case icsLaba
    case ltra
    case antiIgE
    case antiIL4IL13
    case pde4
    case methylxanthine
    case antihistamine1stGen
    case antihistamine2ndGen
    case nasalAntihistamine
    case nasalSteroid
    case oralDecongestant
    case comboAntihistamineDecongestant
}

nonisolated enum RespiratoryDeliveryRoute: String, Sendable {
    case inhaledMDI
    case inhaledDPI
    case inhaledNebulizer
    case inhaledGeneral
    case oral
    case nasal
    case subcutaneous
    case intravenous
}

nonisolated enum Module7ConfusionGroup: String, Sendable {
    case albuterolVsLevalbuterol
    case samaVsLama
    case rescueVsController
    case icsAloneVsIcsLaba
    case icsLabaCombos
    case labaMonotherapyDanger
    case inhaledVsNasalSteroid
    case firstGenVsSecondGenAntihistamine
    case secondGenAntihistamines
    case nasalSteroidVsNasalAntihistamine
    case biologicTargets
    case comboVsSingleAntihistamine
    case cetirizineVsLevocetirizine
}

nonisolated struct Module7ContrastPair: Sendable {
    let drugIdA: String
    let drugIdB: String
    let confusionGroup: Module7ConfusionGroup
    let differentiator: String
}

nonisolated struct Module7DrugRoleTag: Sendable {
    let drugId: String
    let airwayRole: AirwayRole
    let controllerType: RespiratoryControllerType
    let deliveryRoute: RespiratoryDeliveryRoute
    let isComboProduct: Bool
    let comboIngredientNames: [String]
    let confusionGroups: [Module7ConfusionGroup]
}

struct Module7ContrastMetadata {

    static let drugRoles: [String: Module7DrugRoleTag] = [
        // 7b — Inhaled Bronchodilators
        "d120": Module7DrugRoleTag(drugId: "d120", airwayRole: .rescue, controllerType: .saba, deliveryRoute: .inhaledMDI, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.albuterolVsLevalbuterol, .rescueVsController]),
        "d121": Module7DrugRoleTag(drugId: "d121", airwayRole: .rescue, controllerType: .saba, deliveryRoute: .inhaledNebulizer, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.albuterolVsLevalbuterol, .rescueVsController]),
        "d122": Module7DrugRoleTag(drugId: "d122", airwayRole: .rescue, controllerType: .sama, deliveryRoute: .inhaledMDI, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.samaVsLama, .rescueVsController]),
        "d123": Module7DrugRoleTag(drugId: "d123", airwayRole: .maintenanceBronchodilator, controllerType: .lama, deliveryRoute: .inhaledDPI, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.samaVsLama, .rescueVsController]),
        "d124": Module7DrugRoleTag(drugId: "d124", airwayRole: .maintenanceBronchodilator, controllerType: .lamaLaba, deliveryRoute: .inhaledDPI, isComboProduct: true, comboIngredientNames: ["Umeclidinium", "Vilanterol"], confusionGroups: [.rescueVsController]),

        // 7c — ICS & Combos
        "d114": Module7DrugRoleTag(drugId: "d114", airwayRole: .controller, controllerType: .ics, deliveryRoute: .inhaledMDI, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.icsAloneVsIcsLaba, .rescueVsController, .inhaledVsNasalSteroid]),
        "d115": Module7DrugRoleTag(drugId: "d115", airwayRole: .controller, controllerType: .ics, deliveryRoute: .inhaledNebulizer, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.icsAloneVsIcsLaba, .rescueVsController]),
        "d116": Module7DrugRoleTag(drugId: "d116", airwayRole: .comboController, controllerType: .icsLaba, deliveryRoute: .inhaledDPI, isComboProduct: true, comboIngredientNames: ["Fluticasone", "Salmeterol"], confusionGroups: [.icsAloneVsIcsLaba, .icsLabaCombos, .labaMonotherapyDanger]),
        "d117": Module7DrugRoleTag(drugId: "d117", airwayRole: .comboController, controllerType: .icsLaba, deliveryRoute: .inhaledMDI, isComboProduct: true, comboIngredientNames: ["Budesonide", "Formoterol"], confusionGroups: [.icsAloneVsIcsLaba, .icsLabaCombos, .labaMonotherapyDanger]),
        "d118": Module7DrugRoleTag(drugId: "d118", airwayRole: .maintenanceBronchodilator, controllerType: .laba, deliveryRoute: .inhaledDPI, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.labaMonotherapyDanger, .icsAloneVsIcsLaba]),
        "d119": Module7DrugRoleTag(drugId: "d119", airwayRole: .comboController, controllerType: .icsLaba, deliveryRoute: .inhaledMDI, isComboProduct: true, comboIngredientNames: ["Mometasone", "Formoterol"], confusionGroups: [.icsLabaCombos, .labaMonotherapyDanger]),

        // 7d — Leukotriene Modifiers & Controllers
        "d125": Module7DrugRoleTag(drugId: "d125", airwayRole: .oralController, controllerType: .ltra, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.rescueVsController]),
        "d126": Module7DrugRoleTag(drugId: "d126", airwayRole: .biologic, controllerType: .antiIgE, deliveryRoute: .subcutaneous, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.biologicTargets]),
        "d127": Module7DrugRoleTag(drugId: "d127", airwayRole: .biologic, controllerType: .antiIL4IL13, deliveryRoute: .subcutaneous, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.biologicTargets]),
        "d128": Module7DrugRoleTag(drugId: "d128", airwayRole: .pde4Inhibitor, controllerType: .pde4, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: []),
        "d129": Module7DrugRoleTag(drugId: "d129", airwayRole: .methylxanthine, controllerType: .methylxanthine, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: []),

        // 7e — Antihistamines & Nasal Steroids
        "d245": Module7DrugRoleTag(drugId: "d245", airwayRole: .allergyNasal, controllerType: .nasalAntihistamine, deliveryRoute: .nasal, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.nasalSteroidVsNasalAntihistamine]),
        "d246": Module7DrugRoleTag(drugId: "d246", airwayRole: .allergyNasal, controllerType: .antihistamine2ndGen, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.firstGenVsSecondGenAntihistamine, .secondGenAntihistamines, .cetirizineVsLevocetirizine]),
        "d247": Module7DrugRoleTag(drugId: "d247", airwayRole: .allergyNasal, controllerType: .antihistamine1stGen, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.firstGenVsSecondGenAntihistamine]),
        "d248": Module7DrugRoleTag(drugId: "d248", airwayRole: .allergyNasal, controllerType: .antihistamine2ndGen, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.firstGenVsSecondGenAntihistamine, .secondGenAntihistamines]),
        "d249": Module7DrugRoleTag(drugId: "d249", airwayRole: .allergyNasal, controllerType: .nasalSteroid, deliveryRoute: .nasal, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.nasalSteroidVsNasalAntihistamine, .inhaledVsNasalSteroid]),
        "d250": Module7DrugRoleTag(drugId: "d250", airwayRole: .allergyNasal, controllerType: .antihistamine2ndGen, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.secondGenAntihistamines, .cetirizineVsLevocetirizine]),
        "d251": Module7DrugRoleTag(drugId: "d251", airwayRole: .allergyNasal, controllerType: .antihistamine2ndGen, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.firstGenVsSecondGenAntihistamine, .secondGenAntihistamines]),
        "d252": Module7DrugRoleTag(drugId: "d252", airwayRole: .allergyNasal, controllerType: .comboAntihistamineDecongestant, deliveryRoute: .oral, isComboProduct: true, comboIngredientNames: ["Loratadine", "Pseudoephedrine"], confusionGroups: [.comboVsSingleAntihistamine]),
        "d253": Module7DrugRoleTag(drugId: "d253", airwayRole: .allergyNasal, controllerType: .nasalSteroid, deliveryRoute: .nasal, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.nasalSteroidVsNasalAntihistamine]),
        "d254": Module7DrugRoleTag(drugId: "d254", airwayRole: .decongestant, controllerType: .oralDecongestant, deliveryRoute: .oral, isComboProduct: false, comboIngredientNames: [], confusionGroups: [.comboVsSingleAntihistamine]),
    ]

    static let contrastPairs: [Module7ContrastPair] = [
        Module7ContrastPair(drugIdA: "d120", drugIdB: "d121", confusionGroup: .albuterolVsLevalbuterol, differentiator: "Both SABAs for rescue; levalbuterol is the R-enantiomer of albuterol, sometimes chosen for fewer cardiac side effects"),
        Module7ContrastPair(drugIdA: "d122", drugIdB: "d123", confusionGroup: .samaVsLama, differentiator: "Ipratropium = short-acting anticholinergic (rescue adjunct); tiotropium = long-acting (maintenance COPD cornerstone)"),
        Module7ContrastPair(drugIdA: "d120", drugIdB: "d114", confusionGroup: .rescueVsController, differentiator: "Albuterol = rescue bronchodilator for acute symptoms; fluticasone inhaled = controller for daily maintenance"),
        Module7ContrastPair(drugIdA: "d120", drugIdB: "d123", confusionGroup: .rescueVsController, differentiator: "Albuterol = rescue SABA for quick relief; tiotropium = maintenance LAMA for daily COPD control"),
        Module7ContrastPair(drugIdA: "d114", drugIdB: "d116", confusionGroup: .icsAloneVsIcsLaba, differentiator: "Fluticasone alone (Flovent) = ICS only; fluticasone/salmeterol (Advair) = ICS + LABA combo for step-up"),
        Module7ContrastPair(drugIdA: "d115", drugIdB: "d117", confusionGroup: .icsAloneVsIcsLaba, differentiator: "Budesonide alone (Pulmicort) = ICS only; budesonide/formoterol (Symbicort) = ICS + LABA combo, also SMART therapy"),
        Module7ContrastPair(drugIdA: "d116", drugIdB: "d117", confusionGroup: .icsLabaCombos, differentiator: "Advair = fluticasone + salmeterol (DPI); Symbicort = budesonide + formoterol (MDI, SMART-eligible)"),
        Module7ContrastPair(drugIdA: "d117", drugIdB: "d119", confusionGroup: .icsLabaCombos, differentiator: "Symbicort = budesonide + formoterol; Dulera = mometasone + formoterol — both MDI, different ICS component"),
        Module7ContrastPair(drugIdA: "d118", drugIdB: "d116", confusionGroup: .labaMonotherapyDanger, differentiator: "Salmeterol alone = Black Box in asthma; Advair = salmeterol safely paired with ICS"),
        Module7ContrastPair(drugIdA: "d114", drugIdB: "d249", confusionGroup: .inhaledVsNasalSteroid, differentiator: "Inhaled fluticasone (Flovent) = asthma controller; nasal fluticasone (Flonase) = allergic rhinitis"),
        Module7ContrastPair(drugIdA: "d126", drugIdB: "d127", confusionGroup: .biologicTargets, differentiator: "Omalizumab = anti-IgE for allergic asthma; dupilumab = anti-IL-4/IL-13 for eosinophilic asthma + eczema"),
        Module7ContrastPair(drugIdA: "d247", drugIdB: "d246", confusionGroup: .firstGenVsSecondGenAntihistamine, differentiator: "Diphenhydramine = 1st-gen, sedating, anticholinergic; cetirizine = 2nd-gen, less sedating"),
        Module7ContrastPair(drugIdA: "d247", drugIdB: "d248", confusionGroup: .firstGenVsSecondGenAntihistamine, differentiator: "Diphenhydramine = 1st-gen, very sedating; fexofenadine = 2nd-gen, least sedating antihistamine"),
        Module7ContrastPair(drugIdA: "d246", drugIdB: "d250", confusionGroup: .cetirizineVsLevocetirizine, differentiator: "Levocetirizine is the active R-enantiomer of cetirizine; both 2nd-gen, similar profile"),
        Module7ContrastPair(drugIdA: "d249", drugIdB: "d245", confusionGroup: .nasalSteroidVsNasalAntihistamine, differentiator: "Fluticasone nasal (Flonase) = nasal steroid, most effective for allergic rhinitis; azelastine = nasal antihistamine, faster onset"),
        Module7ContrastPair(drugIdA: "d251", drugIdB: "d252", confusionGroup: .comboVsSingleAntihistamine, differentiator: "Loratadine (Claritin) = antihistamine only; Claritin-D adds pseudoephedrine for congestion"),
    ]

    static func isModule7Drug(_ drugId: String) -> Bool {
        drugRoles[drugId] != nil
    }

    static func roleTag(for drugId: String) -> Module7DrugRoleTag? {
        drugRoles[drugId]
    }

    static func confusionGroupDrugs(for group: Module7ConfusionGroup) -> [String] {
        drugRoles.values.filter { $0.confusionGroups.contains(group) }.map(\.drugId)
    }

    static func contrastPairsFor(drugId: String) -> [Module7ContrastPair] {
        contrastPairs.filter { $0.drugIdA == drugId || $0.drugIdB == drugId }
    }

    static func isComboProduct(_ drugId: String) -> Bool {
        drugRoles[drugId]?.isComboProduct == true
    }

    static func hasRouteDistinction(_ drugId: String) -> Bool {
        guard let role = drugRoles[drugId] else { return false }
        return role.confusionGroups.contains(.inhaledVsNasalSteroid)
    }
}
