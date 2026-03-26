import Foundation

nonisolated enum Module10MicroFamily: String, Sendable, CaseIterable {
    case alpha1Blocker
    case fiveAlphaReductaseInhibitor
    case antimuscarinicOAB
    case beta3Agonist
    case pde5Inhibitor
    case urinaryAnalgesic

    case oralBisphosphonate
    case ivBisphosphonate
    case ranklInhibitor
    case anabolicPTH

    case combinedOralContraceptive
    case vaginalRing
    case progestinOnlyPill
    case depotInjection
    case intrauterineSystem
    case systemicEstrogen
    case progesterone
    case serm
    case androgen

    case glaucomaProstaglandin
    case glaucomaBetaBlocker
    case glaucomaCAI
    case glaucomaAlpha2
    case glaucomaCombo
    case ophthalmicAllergy
    case rescueAntidote
    case topicalRetinoid
    case topicalSteroid
    case topicalAntiInfective
    case topicalAntifungal
    case topicalAntineoplastic
    case supplementElectrolyte
    case antiseptic

    var label: String {
        switch self {
        case .alpha1Blocker: "Alpha-1 Blocker (BPH)"
        case .fiveAlphaReductaseInhibitor: "5-Alpha Reductase Inhibitor"
        case .antimuscarinicOAB: "Antimuscarinic (OAB)"
        case .beta3Agonist: "Beta-3 Agonist (OAB)"
        case .pde5Inhibitor: "PDE-5 Inhibitor"
        case .urinaryAnalgesic: "Urinary Analgesic"
        case .oralBisphosphonate: "Oral Bisphosphonate"
        case .ivBisphosphonate: "IV Bisphosphonate"
        case .ranklInhibitor: "RANKL Inhibitor"
        case .anabolicPTH: "Anabolic PTH Analog"
        case .combinedOralContraceptive: "Combined Oral Contraceptive"
        case .vaginalRing: "Vaginal Ring"
        case .progestinOnlyPill: "Progestin-Only Pill"
        case .depotInjection: "Depot Injection"
        case .intrauterineSystem: "Intrauterine System"
        case .systemicEstrogen: "Systemic Estrogen"
        case .progesterone: "Progesterone"
        case .serm: "SERM"
        case .androgen: "Androgen"
        case .glaucomaProstaglandin: "Glaucoma — Prostaglandin"
        case .glaucomaBetaBlocker: "Glaucoma — Beta-Blocker"
        case .glaucomaCAI: "Glaucoma — CAI"
        case .glaucomaAlpha2: "Glaucoma — Alpha-2 Agonist"
        case .glaucomaCombo: "Glaucoma — Combo Drop"
        case .ophthalmicAllergy: "Ophthalmic Allergy"
        case .rescueAntidote: "Rescue / Antidote"
        case .topicalRetinoid: "Topical Retinoid"
        case .topicalSteroid: "Topical Steroid"
        case .topicalAntiInfective: "Topical Anti-Infective"
        case .topicalAntifungal: "Topical Antifungal"
        case .topicalAntineoplastic: "Topical Antineoplastic"
        case .supplementElectrolyte: "Supplement / Electrolyte"
        case .antiseptic: "Antiseptic"
        }
    }
}

nonisolated enum Module10SiteOfUse: String, Sendable {
    case oral
    case ophthalmic
    case otic
    case nasal
    case topicalSkin
    case topicalNail
    case vaginal
    case intrauterine
    case intramuscular
    case subcutaneous
    case intravenous
    case transdermal
    case emergency
}

nonisolated enum Module10TherapeuticRole: String, Sendable {
    case symptomaticRelief
    case diseaseMod
    case prevention
    case replacement
    case rescue
    case antidote
    case cosmetic
    case analgesic
    case antiInfective
    case antiInflammatory
    case antineoplastic
    case supplement
    case antiseptic
}

nonisolated enum Module10ConfusionGroup: String, Sendable {
    case finasterideVsTamsulosin
    case oxybutyninVsMirabegronVsSolifenacin
    case sildenafillVsTadalafil
    case alendronateVsDenosumabVsTeriparatideVsZoledronic
    case combinedVsProgestinOnly
    case combinedVsDeviceBased
    case ophthalmicGlaucomaClasses
    case latanoprostVsTimolol
    case topicalSteroidPotency
    case rescueAntidoteMatching
    case ironVsVitaminDVsPotassium
    case estrogenVsSerm
    case depotVsIUD
}

nonisolated struct Module10ContrastPair: Sendable {
    let drugIdA: String
    let drugIdB: String
    let confusionGroup: Module10ConfusionGroup
    let differentiator: String
}

nonisolated struct Module10DrugTag: Sendable {
    let drugId: String
    let microFamily: Module10MicroFamily
    let siteOfUse: Module10SiteOfUse
    let therapeuticRole: Module10TherapeuticRole
    let confusionGroups: [Module10ConfusionGroup]
}

struct Module10ContrastMetadata {

    static let drugTags: [String: Module10DrugTag] = [
        // 10a — BPH + OAB + Urinary
        "d188": Module10DrugTag(drugId: "d188", microFamily: .alpha1Blocker, siteOfUse: .oral, therapeuticRole: .symptomaticRelief, confusionGroups: [.finasterideVsTamsulosin]),
        "d189": Module10DrugTag(drugId: "d189", microFamily: .fiveAlphaReductaseInhibitor, siteOfUse: .oral, therapeuticRole: .diseaseMod, confusionGroups: [.finasterideVsTamsulosin]),
        "d190": Module10DrugTag(drugId: "d190", microFamily: .fiveAlphaReductaseInhibitor, siteOfUse: .oral, therapeuticRole: .diseaseMod, confusionGroups: [.finasterideVsTamsulosin]),
        "d191": Module10DrugTag(drugId: "d191", microFamily: .antimuscarinicOAB, siteOfUse: .oral, therapeuticRole: .symptomaticRelief, confusionGroups: [.oxybutyninVsMirabegronVsSolifenacin]),
        "d192": Module10DrugTag(drugId: "d192", microFamily: .beta3Agonist, siteOfUse: .oral, therapeuticRole: .symptomaticRelief, confusionGroups: [.oxybutyninVsMirabegronVsSolifenacin]),
        "d193": Module10DrugTag(drugId: "d193", microFamily: .pde5Inhibitor, siteOfUse: .oral, therapeuticRole: .symptomaticRelief, confusionGroups: [.sildenafillVsTadalafil]),
        "d194": Module10DrugTag(drugId: "d194", microFamily: .pde5Inhibitor, siteOfUse: .oral, therapeuticRole: .symptomaticRelief, confusionGroups: [.sildenafillVsTadalafil]),
        "d274": Module10DrugTag(drugId: "d274", microFamily: .urinaryAnalgesic, siteOfUse: .oral, therapeuticRole: .analgesic, confusionGroups: []),
        "d275": Module10DrugTag(drugId: "d275", microFamily: .antimuscarinicOAB, siteOfUse: .oral, therapeuticRole: .symptomaticRelief, confusionGroups: [.oxybutyninVsMirabegronVsSolifenacin]),

        // 10b — Osteoporosis
        "d171": Module10DrugTag(drugId: "d171", microFamily: .oralBisphosphonate, siteOfUse: .oral, therapeuticRole: .prevention, confusionGroups: [.alendronateVsDenosumabVsTeriparatideVsZoledronic]),
        "d172": Module10DrugTag(drugId: "d172", microFamily: .oralBisphosphonate, siteOfUse: .oral, therapeuticRole: .prevention, confusionGroups: [.alendronateVsDenosumabVsTeriparatideVsZoledronic]),
        "d173": Module10DrugTag(drugId: "d173", microFamily: .ivBisphosphonate, siteOfUse: .intravenous, therapeuticRole: .prevention, confusionGroups: [.alendronateVsDenosumabVsTeriparatideVsZoledronic]),
        "d174": Module10DrugTag(drugId: "d174", microFamily: .ranklInhibitor, siteOfUse: .subcutaneous, therapeuticRole: .prevention, confusionGroups: [.alendronateVsDenosumabVsTeriparatideVsZoledronic]),
        "d175": Module10DrugTag(drugId: "d175", microFamily: .anabolicPTH, siteOfUse: .subcutaneous, therapeuticRole: .diseaseMod, confusionGroups: [.alendronateVsDenosumabVsTeriparatideVsZoledronic]),

        // 10c — Contraceptives & Hormonal
        "d176": Module10DrugTag(drugId: "d176", microFamily: .systemicEstrogen, siteOfUse: .oral, therapeuticRole: .replacement, confusionGroups: [.estrogenVsSerm]),
        "d177": Module10DrugTag(drugId: "d177", microFamily: .combinedOralContraceptive, siteOfUse: .oral, therapeuticRole: .prevention, confusionGroups: [.combinedVsProgestinOnly]),
        "d178": Module10DrugTag(drugId: "d178", microFamily: .systemicEstrogen, siteOfUse: .oral, therapeuticRole: .replacement, confusionGroups: [.estrogenVsSerm]),
        "d179": Module10DrugTag(drugId: "d179", microFamily: .vaginalRing, siteOfUse: .vaginal, therapeuticRole: .prevention, confusionGroups: [.combinedVsDeviceBased]),
        "d180": Module10DrugTag(drugId: "d180", microFamily: .combinedOralContraceptive, siteOfUse: .oral, therapeuticRole: .prevention, confusionGroups: [.combinedVsProgestinOnly]),
        "d181": Module10DrugTag(drugId: "d181", microFamily: .combinedOralContraceptive, siteOfUse: .oral, therapeuticRole: .prevention, confusionGroups: [.combinedVsProgestinOnly]),
        "d182": Module10DrugTag(drugId: "d182", microFamily: .intrauterineSystem, siteOfUse: .intrauterine, therapeuticRole: .prevention, confusionGroups: [.combinedVsDeviceBased, .depotVsIUD]),
        "d183": Module10DrugTag(drugId: "d183", microFamily: .depotInjection, siteOfUse: .intramuscular, therapeuticRole: .prevention, confusionGroups: [.combinedVsProgestinOnly, .depotVsIUD]),
        "d184": Module10DrugTag(drugId: "d184", microFamily: .progestinOnlyPill, siteOfUse: .oral, therapeuticRole: .prevention, confusionGroups: [.combinedVsProgestinOnly]),
        "d185": Module10DrugTag(drugId: "d185", microFamily: .progesterone, siteOfUse: .oral, therapeuticRole: .replacement, confusionGroups: []),
        "d186": Module10DrugTag(drugId: "d186", microFamily: .serm, siteOfUse: .oral, therapeuticRole: .prevention, confusionGroups: [.estrogenVsSerm]),
        "d187": Module10DrugTag(drugId: "d187", microFamily: .androgen, siteOfUse: .transdermal, therapeuticRole: .replacement, confusionGroups: []),

        // 10e — Eye/Ear + Derm + Misc
        "d295": Module10DrugTag(drugId: "d295", microFamily: .glaucomaProstaglandin, siteOfUse: .ophthalmic, therapeuticRole: .diseaseMod, confusionGroups: [.ophthalmicGlaucomaClasses, .latanoprostVsTimolol]),
        "d283": Module10DrugTag(drugId: "d283", microFamily: .glaucomaProstaglandin, siteOfUse: .ophthalmic, therapeuticRole: .diseaseMod, confusionGroups: [.ophthalmicGlaucomaClasses]),
        "d298": Module10DrugTag(drugId: "d298", microFamily: .glaucomaBetaBlocker, siteOfUse: .ophthalmic, therapeuticRole: .diseaseMod, confusionGroups: [.ophthalmicGlaucomaClasses, .latanoprostVsTimolol]),
        "d290": Module10DrugTag(drugId: "d290", microFamily: .glaucomaCAI, siteOfUse: .ophthalmic, therapeuticRole: .diseaseMod, confusionGroups: [.ophthalmicGlaucomaClasses]),
        "d291": Module10DrugTag(drugId: "d291", microFamily: .glaucomaCombo, siteOfUse: .ophthalmic, therapeuticRole: .diseaseMod, confusionGroups: [.ophthalmicGlaucomaClasses]),
        "d284": Module10DrugTag(drugId: "d284", microFamily: .glaucomaAlpha2, siteOfUse: .ophthalmic, therapeuticRole: .diseaseMod, confusionGroups: [.ophthalmicGlaucomaClasses]),
        "d297": Module10DrugTag(drugId: "d297", microFamily: .ophthalmicAllergy, siteOfUse: .ophthalmic, therapeuticRole: .symptomaticRelief, confusionGroups: []),
        "d294": Module10DrugTag(drugId: "d294", microFamily: .ophthalmicAllergy, siteOfUse: .ophthalmic, therapeuticRole: .symptomaticRelief, confusionGroups: []),
        "d198": Module10DrugTag(drugId: "d198", microFamily: .rescueAntidote, siteOfUse: .emergency, therapeuticRole: .rescue, confusionGroups: [.rescueAntidoteMatching]),
        "d199": Module10DrugTag(drugId: "d199", microFamily: .rescueAntidote, siteOfUse: .emergency, therapeuticRole: .antidote, confusionGroups: [.rescueAntidoteMatching]),
        "d200": Module10DrugTag(drugId: "d200", microFamily: .rescueAntidote, siteOfUse: .emergency, therapeuticRole: .antidote, confusionGroups: [.rescueAntidoteMatching]),
        "d299": Module10DrugTag(drugId: "d299", microFamily: .topicalRetinoid, siteOfUse: .topicalSkin, therapeuticRole: .diseaseMod, confusionGroups: []),
        "d288": Module10DrugTag(drugId: "d288", microFamily: .topicalSteroid, siteOfUse: .topicalSkin, therapeuticRole: .antiInflammatory, confusionGroups: [.topicalSteroidPotency]),
        "d282": Module10DrugTag(drugId: "d282", microFamily: .topicalSteroid, siteOfUse: .topicalSkin, therapeuticRole: .antiInflammatory, confusionGroups: [.topicalSteroidPotency]),
        "d300": Module10DrugTag(drugId: "d300", microFamily: .topicalSteroid, siteOfUse: .topicalSkin, therapeuticRole: .antiInflammatory, confusionGroups: [.topicalSteroidPotency]),
        "d296": Module10DrugTag(drugId: "d296", microFamily: .topicalAntiInfective, siteOfUse: .topicalSkin, therapeuticRole: .antiInfective, confusionGroups: []),
        "d286": Module10DrugTag(drugId: "d286", microFamily: .topicalAntifungal, siteOfUse: .topicalNail, therapeuticRole: .antiInfective, confusionGroups: []),
        "d292": Module10DrugTag(drugId: "d292", microFamily: .topicalAntineoplastic, siteOfUse: .topicalSkin, therapeuticRole: .antineoplastic, confusionGroups: []),
        "d196": Module10DrugTag(drugId: "d196", microFamily: .supplementElectrolyte, siteOfUse: .oral, therapeuticRole: .supplement, confusionGroups: [.ironVsVitaminDVsPotassium]),
        "d195": Module10DrugTag(drugId: "d195", microFamily: .supplementElectrolyte, siteOfUse: .oral, therapeuticRole: .supplement, confusionGroups: [.ironVsVitaminDVsPotassium]),
        "d197": Module10DrugTag(drugId: "d197", microFamily: .supplementElectrolyte, siteOfUse: .oral, therapeuticRole: .supplement, confusionGroups: [.ironVsVitaminDVsPotassium]),
        "d285": Module10DrugTag(drugId: "d285", microFamily: .antiseptic, siteOfUse: .topicalSkin, therapeuticRole: .antiseptic, confusionGroups: []),
    ]

    static let contrastPairs: [Module10ContrastPair] = [
        // 10a contrasts
        Module10ContrastPair(drugIdA: "d188", drugIdB: "d189", confusionGroup: .finasterideVsTamsulosin, differentiator: "Tamsulosin = alpha-1 blocker, fast symptom relief; finasteride = 5-ARI, slowly shrinks prostate over months"),
        Module10ContrastPair(drugIdA: "d188", drugIdB: "d190", confusionGroup: .finasterideVsTamsulosin, differentiator: "Tamsulosin relaxes smooth muscle; dutasteride inhibits both type 1 & 2 5-alpha reductase"),
        Module10ContrastPair(drugIdA: "d191", drugIdB: "d192", confusionGroup: .oxybutyninVsMirabegronVsSolifenacin, differentiator: "Oxybutynin = antimuscarinic with classic anticholinergic burden; mirabegron = beta-3 agonist, avoids dry mouth/cognitive fog"),
        Module10ContrastPair(drugIdA: "d191", drugIdB: "d275", confusionGroup: .oxybutyninVsMirabegronVsSolifenacin, differentiator: "Both are antimuscarinics for OAB; solifenacin is more M3-selective, oxybutynin has more CNS/anticholinergic effects"),
        Module10ContrastPair(drugIdA: "d275", drugIdB: "d192", confusionGroup: .oxybutyninVsMirabegronVsSolifenacin, differentiator: "Solifenacin = antimuscarinic (dry mouth, constipation); mirabegron = beta-3 agonist (monitor BP instead)"),
        Module10ContrastPair(drugIdA: "d193", drugIdB: "d194", confusionGroup: .sildenafillVsTadalafil, differentiator: "Sildenafil ~4-6h, nitrate washout 24h; tadalafil ~36h, nitrate washout 48h, also treats BPH"),

        // 10b contrasts
        Module10ContrastPair(drugIdA: "d171", drugIdB: "d174", confusionGroup: .alendronateVsDenosumabVsTeriparatideVsZoledronic, differentiator: "Alendronate = oral weekly bisphosphonate; denosumab = SubQ RANKL inhibitor q6months, rebound fracture risk on stopping"),
        Module10ContrastPair(drugIdA: "d171", drugIdB: "d175", confusionGroup: .alendronateVsDenosumabVsTeriparatideVsZoledronic, differentiator: "Alendronate = antiresorptive; teriparatide = anabolic PTH analog that builds new bone"),
        Module10ContrastPair(drugIdA: "d173", drugIdB: "d174", confusionGroup: .alendronateVsDenosumabVsTeriparatideVsZoledronic, differentiator: "Zoledronic acid = IV yearly bisphosphonate (check CrCl); denosumab = SubQ q6months RANKL inhibitor (boxed warning hypocalcemia in CKD)"),
        Module10ContrastPair(drugIdA: "d174", drugIdB: "d175", confusionGroup: .alendronateVsDenosumabVsTeriparatideVsZoledronic, differentiator: "Denosumab = antiresorptive, don't delay/stop; teriparatide = anabolic, daily SubQ, avoid in osteosarcoma risk"),

        // 10c contrasts
        Module10ContrastPair(drugIdA: "d177", drugIdB: "d184", confusionGroup: .combinedVsProgestinOnly, differentiator: "Drospirenone/EE = combined OC with smoking/VTE risk; norethindrone = progestin-only, time-sensitive, no estrogen"),
        Module10ContrastPair(drugIdA: "d183", drugIdB: "d182", confusionGroup: .depotVsIUD, differentiator: "Depo-Provera = IM q3months, bone density boxed warning; Mirena = IUD up to 8 years, also treats heavy bleeding"),
        Module10ContrastPair(drugIdA: "d176", drugIdB: "d186", confusionGroup: .estrogenVsSerm, differentiator: "Conjugated estrogens treat hot flashes but need progestin with uterus; raloxifene = SERM, helps bone/breast cancer risk but worsens hot flashes and raises VTE risk"),

        // 10e contrasts
        Module10ContrastPair(drugIdA: "d295", drugIdB: "d298", confusionGroup: .latanoprostVsTimolol, differentiator: "Latanoprost = prostaglandin, increases outflow, iris color change; timolol = beta-blocker, reduces production, bronchospasm/bradycardia risk"),
        Module10ContrastPair(drugIdA: "d288", drugIdB: "d300", confusionGroup: .topicalSteroidPotency, differentiator: "Clobetasol = super-high potency, limit 2 weeks, avoid face; triamcinolone = medium potency, more versatile"),
    ]

    static func isModule10Drug(_ drugId: String) -> Bool {
        drugTags[drugId] != nil
    }

    static func tag(for drugId: String) -> Module10DrugTag? {
        drugTags[drugId]
    }

    static func microFamily(for drugId: String) -> Module10MicroFamily? {
        drugTags[drugId]?.microFamily
    }

    static func drugsInSameMicroFamily(as drugId: String) -> [String] {
        guard let family = drugTags[drugId]?.microFamily else { return [] }
        return drugTags.values.filter { $0.microFamily == family }.map(\.drugId)
    }

    static func confusionGroupDrugs(for group: Module10ConfusionGroup) -> [String] {
        drugTags.values.filter { $0.confusionGroups.contains(group) }.map(\.drugId)
    }

    static func contrastPairsFor(drugId: String) -> [Module10ContrastPair] {
        contrastPairs.filter { $0.drugIdA == drugId || $0.drugIdB == drugId }
    }
}
