import Foundation

nonisolated enum ConceptBucket: String, CaseIterable, Sendable {
    case names
    case classMOA
    case indications
    case safety
    case dosingMonitoring

    var label: String {
        switch self {
        case .names: "Names"
        case .classMOA: "Class / MOA"
        case .indications: "Indications"
        case .safety: "Safety & ADRs"
        case .dosingMonitoring: "Dosing & Monitoring"
        }
    }

    var icon: String {
        switch self {
        case .names: "textformat.abc"
        case .classMOA: "puzzlepiece.fill"
        case .indications: "cross.case.fill"
        case .safety: "exclamationmark.shield.fill"
        case .dosingMonitoring: "clock.fill"
        }
    }

    static func bucket(for objective: QuestionObjective) -> ConceptBucket {
        switch objective {
        case .brandGeneric, .genericBrand, .suffixId:
            return .names
        case .classId, .moa:
            return .classMOA
        case .indication:
            return .indications
        case .adverseEffect, .contraindication, .pearl:
            return .safety
        case .monitoring, .interaction, .dosing:
            return .dosingMonitoring
        case .mixedReview:
            return .names
        }
    }
}

nonisolated struct DrugConceptMastery: Sendable {
    let bucket: ConceptBucket
    let totalAttempts: Int
    let correctAttempts: Int
    let averageLevel: Double

    var accuracy: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(correctAttempts) / Double(totalAttempts)
    }
}

nonisolated struct DrugMasterySummary: Sendable {
    let drugId: String
    let overallLevel: Int
    let totalAttempts: Int
    let correctAttempts: Int
    let conceptMastery: [ConceptBucket: DrugConceptMastery]

    var accuracy: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(correctAttempts) / Double(totalAttempts)
    }
}

nonisolated enum DrugLearningStage: Int, Comparable, Sendable {
    case foundation = 0
    case indication = 1
    case safety = 2
    case practical = 3
    case advanced = 4

    nonisolated static func < (lhs: Self, rhs: Self) -> Bool { lhs.rawValue < rhs.rawValue }

    var label: String {
        switch self {
        case .foundation: "Foundation"
        case .indication: "Indications"
        case .safety: "Safety"
        case .practical: "Practical"
        case .advanced: "Advanced"
        }
    }
}

struct DrugMasteryService {

    static func learningStage(for drugId: String, masteryMap: [String: MasteryRecord]) -> DrugLearningStage {
        let summary = computeMastery(for: drugId, masteryMap: masteryMap)

        let names = summary.conceptMastery[.names]
        let classMOA = summary.conceptMastery[.classMOA]
        let foundationAttempts = (names?.totalAttempts ?? 0) + (classMOA?.totalAttempts ?? 0)
        let foundationCorrect = (names?.correctAttempts ?? 0) + (classMOA?.correctAttempts ?? 0)
        let foundationAccuracy = foundationAttempts > 0 ? Double(foundationCorrect) / Double(foundationAttempts) : 0
        guard foundationAttempts >= 4, foundationAccuracy >= 0.75 else { return .foundation }

        let ind = summary.conceptMastery[.indications]
        guard (ind?.totalAttempts ?? 0) >= 2, (ind?.accuracy ?? 0) >= 0.75 else { return .indication }

        let safety = summary.conceptMastery[.safety]
        guard (safety?.totalAttempts ?? 0) >= 2, (safety?.accuracy ?? 0) >= 0.75 else { return .safety }

        let dosing = summary.conceptMastery[.dosingMonitoring]
        guard (dosing?.totalAttempts ?? 0) >= 1, (dosing?.accuracy ?? 0) >= 0.70 else { return .practical }

        return .advanced
    }

    static func relevantMasteryRecords(for subsectionDrugIds: [String], masteryMap: [String: MasteryRecord]) -> [String: MasteryRecord] {
        let drugIdSet = Set(subsectionDrugIds)
        var result: [String: MasteryRecord] = [:]
        for objective in QuestionObjective.allCases {
            for drugId in drugIdSet {
                let key = "\(objective.rawValue)_\(drugId)"
                if let record = masteryMap[key] {
                    result[key] = record
                }
            }
        }
        return result
    }

    static func computeMastery(for drugId: String, masteryMap: [String: MasteryRecord]) -> DrugMasterySummary {
        var bucketAttempts: [ConceptBucket: (total: Int, correct: Int, levels: [Int])] = [:]
        for bucket in ConceptBucket.allCases {
            bucketAttempts[bucket] = (0, 0, [])
        }

        for objective in QuestionObjective.allCases {
            let key = "\(objective.rawValue)_\(drugId)"
            guard let record = masteryMap[key], record.totalAttempts > 0 else { continue }
            let bucket = ConceptBucket.bucket(for: objective)
            var entry = bucketAttempts[bucket]!
            entry.total += record.totalAttempts
            entry.correct += record.correctAttempts
            entry.levels.append(record.level)
            bucketAttempts[bucket] = entry
        }

        var conceptMastery: [ConceptBucket: DrugConceptMastery] = [:]
        var allLevels: [Int] = []
        var grandTotal = 0
        var grandCorrect = 0

        for bucket in ConceptBucket.allCases {
            let entry = bucketAttempts[bucket]!
            let avgLevel = entry.levels.isEmpty ? 0.0 : Double(entry.levels.reduce(0, +)) / Double(entry.levels.count)
            conceptMastery[bucket] = DrugConceptMastery(
                bucket: bucket,
                totalAttempts: entry.total,
                correctAttempts: entry.correct,
                averageLevel: avgLevel
            )
            allLevels.append(contentsOf: entry.levels)
            grandTotal += entry.total
            grandCorrect += entry.correct
        }

        let overallLevel: Int
        if allLevels.isEmpty {
            overallLevel = 0
        } else {
            let avg = Double(allLevels.reduce(0, +)) / Double(allLevels.count)
            overallLevel = min(Int(avg.rounded()), 5)
        }

        return DrugMasterySummary(
            drugId: drugId,
            overallLevel: overallLevel,
            totalAttempts: grandTotal,
            correctAttempts: grandCorrect,
            conceptMastery: conceptMastery
        )
    }

    static func computeAllMastery(drugs: [Drug], masteryMap: [String: MasteryRecord]) -> [String: DrugMasterySummary] {
        var result: [String: DrugMasterySummary] = [:]
        for drug in drugs {
            result[drug.id] = computeMastery(for: drug.id, masteryMap: masteryMap)
        }
        return result
    }
}
