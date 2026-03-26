import Foundation

nonisolated enum AntimicrobialFamily: String, Sendable, CaseIterable {
    case aminopenicillin
    case aminopenicillinBLI
    case extendedSpectrumPenicillinBLI
    case cephalosporin1st
    case cephalosporin2nd
    case cephalosporin3rd
    case cephalosporin4th
    case macrolide
    case fluoroquinolone
    case tetracycline
    case sulfonamideCombination
    case glycopeptide
    case oxazolidinone
    case lipopeptide
    case nitroimidazole
    case lincosamide
    case azoleAntifungal
    case allylamine
    case polyene
    case nucleosideAnalog
    case neuraminidaseInhibitor
    case proteaseCombination
    case aminoglycoside
    case polymyxinCombination
    case naturalPenicillin
    case nitrofuran
}

nonisolated enum AntimicrobialRouteTag: String, Sendable {
    case po
    case iv
    case im
    case ivOrIm
    case poOrIv
    case topicalOtic
    case topicalOphthalmic
    case topicalOticOphthalmic
    case topicalOral
    case topicalSkin
}

nonisolated enum AntimicrobialSiteTag: String, Sendable {
    case systemic
    case giLuminal
    case bladderOnly
    case ear
    case eye
    case earOrEye
    case oralMucosa
    case skin
    case respiratory
}

nonisolated enum Module6ConfusionGroup: String, Sendable {
    case amoxVsAmoxClav
    case cephalosporinGenerations
    case ceftriaxoneVsCephalexin
    case fluoroquinoloneRoles
    case macrolidePair
    case vancomycinRoutes
    case tmpSmxVsNitrofurantoin
    case linezolidVsDaptomycin
    case acyclovirVsValacyclovir
    case fluconazoleVsKetoconazole
    case ciproVsLevoVsMoxi
    case betaLactamBLIPairs
    case topicalEyeDrops
}

nonisolated struct Module6ContrastPair: Sendable {
    let drugIdA: String
    let drugIdB: String
    let confusionGroup: Module6ConfusionGroup
    let differentiator: String
}

nonisolated struct Module6DrugRoleTag: Sendable {
    let drugId: String
    let antimicrobialFamily: AntimicrobialFamily
    let routeTag: AntimicrobialRouteTag
    let siteOfUseTag: AntimicrobialSiteTag
    let combinationProduct: Bool
    let confusionGroups: [Module6ConfusionGroup]
}

struct Module6ContrastMetadata {
    static let drugRoles: [String: Module6DrugRoleTag] = [
        // 6b — Beta-Lactams
        "d98": Module6DrugRoleTag(drugId: "d98", antimicrobialFamily: .aminopenicillin, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.amoxVsAmoxClav]),
        "d99": Module6DrugRoleTag(drugId: "d99", antimicrobialFamily: .aminopenicillinBLI, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: true, confusionGroups: [.amoxVsAmoxClav, .betaLactamBLIPairs]),
        "d100": Module6DrugRoleTag(drugId: "d100", antimicrobialFamily: .extendedSpectrumPenicillinBLI, routeTag: .iv, siteOfUseTag: .systemic, combinationProduct: true, confusionGroups: [.betaLactamBLIPairs]),
        "d101": Module6DrugRoleTag(drugId: "d101", antimicrobialFamily: .cephalosporin1st, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.cephalosporinGenerations, .ceftriaxoneVsCephalexin]),
        "d102": Module6DrugRoleTag(drugId: "d102", antimicrobialFamily: .cephalosporin3rd, routeTag: .ivOrIm, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.cephalosporinGenerations, .ceftriaxoneVsCephalexin]),
        "d103": Module6DrugRoleTag(drugId: "d103", antimicrobialFamily: .cephalosporin4th, routeTag: .iv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.cephalosporinGenerations]),
        // 6c — Macrolides, FQs, Tetracyclines
        "d106": Module6DrugRoleTag(drugId: "d106", antimicrobialFamily: .macrolide, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.macrolidePair]),
        "d107": Module6DrugRoleTag(drugId: "d107", antimicrobialFamily: .macrolide, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.macrolidePair]),
        "d104": Module6DrugRoleTag(drugId: "d104", antimicrobialFamily: .fluoroquinolone, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.fluoroquinoloneRoles, .ciproVsLevoVsMoxi]),
        "d105": Module6DrugRoleTag(drugId: "d105", antimicrobialFamily: .fluoroquinolone, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.fluoroquinoloneRoles, .ciproVsLevoVsMoxi]),
        "d108": Module6DrugRoleTag(drugId: "d108", antimicrobialFamily: .tetracycline, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: []),
        // 6d — Sulfonamides & Other
        "d109": Module6DrugRoleTag(drugId: "d109", antimicrobialFamily: .sulfonamideCombination, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: true, confusionGroups: [.tmpSmxVsNitrofurantoin]),
        "d110": Module6DrugRoleTag(drugId: "d110", antimicrobialFamily: .glycopeptide, routeTag: .iv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.vancomycinRoutes]),
        "d111": Module6DrugRoleTag(drugId: "d111", antimicrobialFamily: .glycopeptide, routeTag: .po, siteOfUseTag: .giLuminal, combinationProduct: false, confusionGroups: [.vancomycinRoutes]),
        "d112": Module6DrugRoleTag(drugId: "d112", antimicrobialFamily: .oxazolidinone, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.linezolidVsDaptomycin]),
        "d113": Module6DrugRoleTag(drugId: "d113", antimicrobialFamily: .lipopeptide, routeTag: .iv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.linezolidVsDaptomycin]),
        // 6e — Antifungals & Antivirals
        "d226": Module6DrugRoleTag(drugId: "d226", antimicrobialFamily: .nucleosideAnalog, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.acyclovirVsValacyclovir]),
        "d227": Module6DrugRoleTag(drugId: "d227", antimicrobialFamily: .cephalosporin3rd, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.cephalosporinGenerations]),
        "d228": Module6DrugRoleTag(drugId: "d228", antimicrobialFamily: .cephalosporin2nd, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.cephalosporinGenerations]),
        "d229": Module6DrugRoleTag(drugId: "d229", antimicrobialFamily: .lincosamide, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: []),
        "d230": Module6DrugRoleTag(drugId: "d230", antimicrobialFamily: .macrolide, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.macrolidePair]),
        "d231": Module6DrugRoleTag(drugId: "d231", antimicrobialFamily: .azoleAntifungal, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.fluconazoleVsKetoconazole]),
        "d232": Module6DrugRoleTag(drugId: "d232", antimicrobialFamily: .azoleAntifungal, routeTag: .topicalSkin, siteOfUseTag: .skin, combinationProduct: false, confusionGroups: [.fluconazoleVsKetoconazole]),
        "d233": Module6DrugRoleTag(drugId: "d233", antimicrobialFamily: .nitroimidazole, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: []),
        "d234": Module6DrugRoleTag(drugId: "d234", antimicrobialFamily: .fluoroquinolone, routeTag: .poOrIv, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.ciproVsLevoVsMoxi, .fluoroquinoloneRoles]),
        "d235": Module6DrugRoleTag(drugId: "d235", antimicrobialFamily: .proteaseCombination, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: true, confusionGroups: []),
        "d236": Module6DrugRoleTag(drugId: "d236", antimicrobialFamily: .nitrofuran, routeTag: .po, siteOfUseTag: .bladderOnly, combinationProduct: false, confusionGroups: [.tmpSmxVsNitrofurantoin]),
        "d237": Module6DrugRoleTag(drugId: "d237", antimicrobialFamily: .polyene, routeTag: .topicalOral, siteOfUseTag: .oralMucosa, combinationProduct: false, confusionGroups: []),
        "d238": Module6DrugRoleTag(drugId: "d238", antimicrobialFamily: .fluoroquinolone, routeTag: .topicalOticOphthalmic, siteOfUseTag: .earOrEye, combinationProduct: false, confusionGroups: [.topicalEyeDrops]),
        "d239": Module6DrugRoleTag(drugId: "d239", antimicrobialFamily: .neuraminidaseInhibitor, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: []),
        "d240": Module6DrugRoleTag(drugId: "d240", antimicrobialFamily: .naturalPenicillin, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: []),
        "d241": Module6DrugRoleTag(drugId: "d241", antimicrobialFamily: .polymyxinCombination, routeTag: .topicalOphthalmic, siteOfUseTag: .eye, combinationProduct: true, confusionGroups: [.topicalEyeDrops]),
        "d242": Module6DrugRoleTag(drugId: "d242", antimicrobialFamily: .allylamine, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: []),
        "d243": Module6DrugRoleTag(drugId: "d243", antimicrobialFamily: .aminoglycoside, routeTag: .topicalOphthalmic, siteOfUseTag: .eye, combinationProduct: false, confusionGroups: [.topicalEyeDrops]),
        "d244": Module6DrugRoleTag(drugId: "d244", antimicrobialFamily: .nucleosideAnalog, routeTag: .po, siteOfUseTag: .systemic, combinationProduct: false, confusionGroups: [.acyclovirVsValacyclovir]),
    ]

    static let contrastPairs: [Module6ContrastPair] = [
        Module6ContrastPair(drugIdA: "d98", drugIdB: "d99", confusionGroup: .amoxVsAmoxClav, differentiator: "Amoxicillin is plain; amoxicillin/clavulanate adds a beta-lactamase inhibitor for broader coverage + more GI upset"),
        Module6ContrastPair(drugIdA: "d101", drugIdB: "d102", confusionGroup: .ceftriaxoneVsCephalexin, differentiator: "Cephalexin = oral 1st-gen (outpatient skin); ceftriaxone = parenteral 3rd-gen (meningitis, gonorrhea)"),
        Module6ContrastPair(drugIdA: "d104", drugIdB: "d105", confusionGroup: .fluoroquinoloneRoles, differentiator: "Ciprofloxacin = UTI/Pseudomonas focus; levofloxacin = respiratory fluoroquinolone"),
        Module6ContrastPair(drugIdA: "d104", drugIdB: "d234", confusionGroup: .ciproVsLevoVsMoxi, differentiator: "Ciprofloxacin = UTI/Pseudomonas; moxifloxacin = respiratory FQ, no usual renal dose adjustment"),
        Module6ContrastPair(drugIdA: "d105", drugIdB: "d234", confusionGroup: .ciproVsLevoVsMoxi, differentiator: "Levofloxacin = respiratory FQ needing renal dose review; moxifloxacin = respiratory FQ typically no renal adjustment"),
        Module6ContrastPair(drugIdA: "d106", drugIdB: "d107", confusionGroup: .macrolidePair, differentiator: "Azithromycin = Z-Pack, fewer drug interactions; clarithromycin = H. pylori, strong CYP3A4 inhibitor"),
        Module6ContrastPair(drugIdA: "d110", drugIdB: "d111", confusionGroup: .vancomycinRoutes, differentiator: "IV vancomycin = systemic MRSA; oral vancomycin = GI luminal C. difficile only"),
        Module6ContrastPair(drugIdA: "d112", drugIdB: "d113", confusionGroup: .linezolidVsDaptomycin, differentiator: "Linezolid = VRE + MRSA pneumonia, CBC monitoring, MAOI risk; daptomycin = MRSA bacteremia, NOT pneumonia, CPK monitoring"),
        Module6ContrastPair(drugIdA: "d109", drugIdB: "d236", confusionGroup: .tmpSmxVsNitrofurantoin, differentiator: "TMP/SMX = UTI + PJP + MRSA skin; nitrofurantoin = bladder-only UTI, not pyelonephritis"),
        Module6ContrastPair(drugIdA: "d226", drugIdB: "d244", confusionGroup: .acyclovirVsValacyclovir, differentiator: "Both treat HSV/VZV; valacyclovir = prodrug with better bioavailability and simpler dosing"),
        Module6ContrastPair(drugIdA: "d231", drugIdB: "d232", confusionGroup: .fluconazoleVsKetoconazole, differentiator: "Fluconazole = systemic Candida treatment; ketoconazole = mostly topical due to hepatotoxicity/interaction concerns"),
    ]

    static func isModule6Drug(_ drugId: String) -> Bool {
        drugRoles[drugId] != nil
    }

    static func roleTag(for drugId: String) -> Module6DrugRoleTag? {
        drugRoles[drugId]
    }

    static func confusionGroupDrugs(for group: Module6ConfusionGroup) -> [String] {
        drugRoles.values.filter { $0.confusionGroups.contains(group) }.map(\.drugId)
    }

    static func contrastPairsFor(drugId: String) -> [Module6ContrastPair] {
        contrastPairs.filter { $0.drugIdA == drugId || $0.drugIdB == drugId }
    }

    static func hasRouteDistinction(_ drugId: String) -> Bool {
        guard let role = drugRoles[drugId] else { return false }
        return role.confusionGroups.contains(.vancomycinRoutes)
            || role.siteOfUseTag != .systemic
    }
}
