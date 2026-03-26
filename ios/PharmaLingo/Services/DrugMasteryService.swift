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

struct DrugMasteryService {
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
