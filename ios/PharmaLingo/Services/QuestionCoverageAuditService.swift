import Foundation

nonisolated struct DrugDataCoverage: Sendable {
    let hasBrandName: Bool
    let hasIndications: Bool
    let hasSideEffects: Bool
    let hasContraindications: Bool
    let hasBlackBoxWarnings: Bool
    let hasMonitoring: Bool
    let hasClinicalPearls: Bool
    let hasCommonDosing: Bool

    var missingFields: [String] {
        var gaps: [String] = []
        if !hasBrandName { gaps.append("brandName") }
        if !hasIndications { gaps.append("indications") }
        if !hasSideEffects { gaps.append("sideEffects") }
        if !hasContraindications { gaps.append("contraindications") }
        if !hasBlackBoxWarnings { gaps.append("blackBoxWarnings") }
        if !hasMonitoring { gaps.append("monitoring") }
        if !hasClinicalPearls { gaps.append("clinicalPearls") }
        if !hasCommonDosing { gaps.append("commonDosing") }
        return gaps
    }
}

nonisolated struct DrugQuestionCoverage: Sendable {
    let drugId: String
    let drugName: String
    let totalQuestions: Int
    let byObjective: [QuestionObjective: Int]
    let byType: [QuestionType: Int]
    let byDifficulty: [QuestionDifficulty: Int]
    let dataCoverage: DrugDataCoverage
    let questionGaps: [String]
    let dataGaps: [String]
}

nonisolated struct SubsectionCoverageReport: Sendable {
    let subsectionId: String
    let subsectionCode: String
    let subsectionTitle: String
    let isMastery: Bool
    let totalQuestions: Int
    let drugReports: [DrugQuestionCoverage]
    let byObjective: [QuestionObjective: Int]
    let byType: [QuestionType: Int]
    let byDifficulty: [QuestionDifficulty: Int]
    let flags: [String]
}

nonisolated struct ModuleCoverageReport: Sendable {
    let moduleId: String
    let moduleTitle: String
    let subsectionReports: [SubsectionCoverageReport]
    let totalQuestions: Int
    let totalDrugs: Int
    let totalFlags: Int
}

nonisolated struct FullCoverageReport: Sendable {
    let moduleReports: [ModuleCoverageReport]
    let totalQuestions: Int
    let totalDrugs: Int
    let totalFlags: Int
    let generatedAt: Date
}

struct QuestionCoverageAuditService {
    static let shared = QuestionCoverageAuditService()
    private let dataService = DrugDataService.shared
    private let hyFactory = HighYieldQuestionFactory.shared

    func auditSubsection(_ subsectionId: String) -> SubsectionCoverageReport? {
        guard let subsection = dataService.subsection(for: subsectionId) else { return nil }
        return buildSubsectionReport(subsection)
    }

    func auditModule(_ moduleId: String) -> ModuleCoverageReport? {
        guard let module = dataService.module(for: moduleId) else { return nil }
        return buildModuleReport(module)
    }

    func auditAll() -> FullCoverageReport {
        let moduleReports = dataService.modules.map { buildModuleReport($0) }
        return FullCoverageReport(
            moduleReports: moduleReports,
            totalQuestions: moduleReports.reduce(0) { $0 + $1.totalQuestions },
            totalDrugs: moduleReports.reduce(0) { $0 + $1.totalDrugs },
            totalFlags: moduleReports.reduce(0) { $0 + $1.totalFlags },
            generatedAt: Date()
        )
    }

    // MARK: - Report Builders

    private func buildModuleReport(_ module: DrugModule) -> ModuleCoverageReport {
        let subReports = module.subsections.map { buildSubsectionReport($0) }
        let nonMasteryDrugs = module.subsections.filter { !$0.isMasteryQuiz }.flatMap(\.drugs)
        return ModuleCoverageReport(
            moduleId: module.id,
            moduleTitle: module.title,
            subsectionReports: subReports,
            totalQuestions: subReports.reduce(0) { $0 + $1.totalQuestions },
            totalDrugs: nonMasteryDrugs.count,
            totalFlags: subReports.reduce(0) { $0 + $1.flags.count + $1.drugReports.reduce(0) { $0 + $1.questionGaps.count + $1.dataGaps.count } }
        )
    }

    private func buildSubsectionReport(_ subsection: Subsection) -> SubsectionCoverageReport {
        let pool = collectAllQuestions(for: subsection)

        var byObjective: [QuestionObjective: Int] = [:]
        var byType: [QuestionType: Int] = [:]
        var byDifficulty: [QuestionDifficulty: Int] = [:]
        for q in pool {
            byObjective[q.objective, default: 0] += 1
            byType[q.type, default: 0] += 1
            byDifficulty[q.difficulty, default: 0] += 1
        }

        let drugReports: [DrugQuestionCoverage]
        var flags: [String] = []

        if subsection.isMasteryQuiz {
            drugReports = []
            flags.append("[mastery] Review-only subsection — no new-drug question gaps flagged")
        } else {
            drugReports = subsection.drugs.map { drug in
                buildDrugReport(drug: drug, subsection: subsection, pool: pool)
            }
            if pool.isEmpty {
                flags.append("[critical] No questions at all for subsection \(subsection.code)")
            }
            let easyCount = byDifficulty[.easy, default: 0]
            if easyCount < 3 {
                flags.append("[warning] Only \(easyCount) easy questions — adaptive engine needs ≥3 for openers")
            }
            let foundationObjectives: Set<QuestionObjective> = [.suffixId, .classId, .genericBrand, .brandGeneric, .moa]
            let foundationCount = pool.filter { foundationObjectives.contains($0.objective) }.count
            if foundationCount < 4 && !subsection.drugs.isEmpty {
                flags.append("[warning] Only \(foundationCount) foundation-stage questions (suffixId/classId/brandGeneric/moa) — need ≥4")
            }
        }

        return SubsectionCoverageReport(
            subsectionId: subsection.id,
            subsectionCode: subsection.code,
            subsectionTitle: subsection.title,
            isMastery: subsection.isMasteryQuiz,
            totalQuestions: pool.count,
            drugReports: drugReports,
            byObjective: byObjective,
            byType: byType,
            byDifficulty: byDifficulty,
            flags: flags
        )
    }

    private func buildDrugReport(drug: Drug, subsection: Subsection, pool: [Question]) -> DrugQuestionCoverage {
        let drugQuestions = pool.filter { $0.relatedDrugIds.contains(drug.id) }

        var byObjective: [QuestionObjective: Int] = [:]
        var byType: [QuestionType: Int] = [:]
        var byDifficulty: [QuestionDifficulty: Int] = [:]
        for q in drugQuestions {
            byObjective[q.objective, default: 0] += 1
            byType[q.type, default: 0] += 1
            byDifficulty[q.difficulty, default: 0] += 1
        }

        let dataCoverage = DrugDataCoverage(
            hasBrandName: !drug.brandName.isEmpty,
            hasIndications: !drug.indications.isEmpty,
            hasSideEffects: !drug.sideEffects.isEmpty,
            hasContraindications: !drug.majorContraindications.isEmpty,
            hasBlackBoxWarnings: !drug.blackBoxWarnings.isEmpty,
            hasMonitoring: !drug.monitoring.isEmpty,
            hasClinicalPearls: !drug.clinicalPearls.isEmpty,
            hasCommonDosing: !drug.commonDosing.isEmpty
        )

        var questionGaps: [String] = []
        var dataGaps: [String] = []

        let foundationObjectives: Set<QuestionObjective> = [.suffixId, .classId, .genericBrand, .brandGeneric, .moa]
        let hasFoundation = drugQuestions.contains { foundationObjectives.contains($0.objective) }
        if !hasFoundation {
            questionGaps.append("no foundation questions (suffix/class/brand-generic/moa)")
        }

        if byObjective[.genericBrand, default: 0] == 0 && byObjective[.brandGeneric, default: 0] == 0 {
            questionGaps.append("no brand/generic questions")
        }

        if byObjective[.indication, default: 0] == 0 && dataCoverage.hasIndications {
            questionGaps.append("no indication questions (data exists)")
        }

        let safetyCount = (byObjective[.adverseEffect, default: 0]) + (byObjective[.contraindication, default: 0])
        if safetyCount == 0 && (dataCoverage.hasSideEffects || dataCoverage.hasContraindications) {
            questionGaps.append("no safety questions (data exists)")
        }

        if byObjective[.dosing, default: 0] == 0 && dataCoverage.hasCommonDosing {
            questionGaps.append("no dosing questions (commonDosing exists)")
        }

        if byObjective[.pearl, default: 0] == 0 && dataCoverage.hasClinicalPearls {
            questionGaps.append("no pearl/vignette questions (clinicalPearls exist)")
        }

        if byObjective[.monitoring, default: 0] == 0 && dataCoverage.hasMonitoring {
            questionGaps.append("no monitoring questions (monitoring data exists)")
        }

        for field in dataCoverage.missingFields {
            dataGaps.append("missing Drug.\(field)")
        }

        return DrugQuestionCoverage(
            drugId: drug.id,
            drugName: drug.genericName,
            totalQuestions: drugQuestions.count,
            byObjective: byObjective,
            byType: byType,
            byDifficulty: byDifficulty,
            dataCoverage: dataCoverage,
            questionGaps: questionGaps,
            dataGaps: dataGaps
        )
    }

    // MARK: - Question Pool Collection

    private func collectAllQuestions(for subsection: Subsection) -> [Question] {
        let curated = dataService.questions(for: subsection.id)
        let legacy = dataService.allQuestions(for: subsection.id)
        let generated = subsection.isMasteryQuiz ? [] : hyFactory.generateBucketed(for: subsection).all()
        var pool = curated + legacy + generated
        pool = Dictionary(grouping: pool, by: \.id).compactMap(\.value.first)
        return pool
    }

    // MARK: - Console Print

    func printSubsectionReport(_ subsectionId: String) {
        guard let report = auditSubsection(subsectionId) else {
            print("⚠️ Subsection '\(subsectionId)' not found")
            return
        }
        printSubsectionReportDetail(report)
    }

    func printModuleReport(_ moduleId: String) {
        guard let report = auditModule(moduleId) else {
            print("⚠️ Module '\(moduleId)' not found")
            return
        }
        printModuleReportDetail(report)
    }

    func printFullReport() {
        let report = auditAll()
        print("═══════════════════════════════════════════════════")
        print("  PHARMALINGO CONTENT COVERAGE AUDIT")
        print("  Generated: \(report.generatedAt)")
        print("═══════════════════════════════════════════════════")
        print("  Total Questions: \(report.totalQuestions)")
        print("  Total Drugs: \(report.totalDrugs)")
        print("  Total Flags: \(report.totalFlags)")
        print("═══════════════════════════════════════════════════\n")

        for moduleReport in report.moduleReports {
            printModuleReportDetail(moduleReport)
        }
    }

    private func printModuleReportDetail(_ report: ModuleCoverageReport) {
        print("┌─────────────────────────────────────────────────")
        print("│ MODULE: \(report.moduleTitle) (\(report.moduleId))")
        print("│ Questions: \(report.totalQuestions) | Drugs: \(report.totalDrugs) | Flags: \(report.totalFlags)")
        print("└─────────────────────────────────────────────────")

        for sub in report.subsectionReports {
            printSubsectionReportDetail(sub)
        }
        print("")
    }

    private func printSubsectionReportDetail(_ report: SubsectionCoverageReport) {
        let masteryTag = report.isMastery ? " [MASTERY]" : ""
        print("  ┌── \(report.subsectionCode): \(report.subsectionTitle)\(masteryTag)")
        print("  │   Total Questions: \(report.totalQuestions)")

        if !report.isMastery {
            let objSummary = QuestionObjective.allCases.compactMap { obj -> String? in
                let count = report.byObjective[obj, default: 0]
                return count > 0 ? "\(obj.rawValue):\(count)" : nil
            }.joined(separator: " | ")
            if !objSummary.isEmpty {
                print("  │   By Objective: \(objSummary)")
            }

            let typeSummary = [QuestionType.multipleChoice, .trueFalse, .fillBlank, .matching, .selectAll].compactMap { t -> String? in
                let count = report.byType[t, default: 0]
                return count > 0 ? "\(t.rawValue):\(count)" : nil
            }.joined(separator: " | ")
            if !typeSummary.isEmpty {
                print("  │   By Type: \(typeSummary)")
            }

            let diffSummary = [QuestionDifficulty.easy, .medium, .hard, .expert].compactMap { d -> String? in
                let count = report.byDifficulty[d, default: 0]
                return count > 0 ? "\(d.label):\(count)" : nil
            }.joined(separator: " | ")
            if !diffSummary.isEmpty {
                print("  │   By Difficulty: \(diffSummary)")
            }
        }

        for flag in report.flags {
            print("  │   🚩 \(flag)")
        }

        for drugReport in report.drugReports {
            let gapCount = drugReport.questionGaps.count + drugReport.dataGaps.count
            let gapMarker = gapCount > 0 ? " ⚠️ \(gapCount) gaps" : " ✅"
            print("  │   ┌── \(drugReport.drugName) (\(drugReport.drugId)): \(drugReport.totalQuestions) Qs\(gapMarker)")

            if !drugReport.questionGaps.isEmpty {
                for gap in drugReport.questionGaps {
                    print("  │   │   ❌ Q-GAP: \(gap)")
                }
            }
            if !drugReport.dataGaps.isEmpty {
                for gap in drugReport.dataGaps {
                    print("  │   │   📋 DATA-GAP: \(gap)")
                }
            }

            let objDetail = QuestionObjective.allCases.compactMap { obj -> String? in
                let count = drugReport.byObjective[obj, default: 0]
                return count > 0 ? "\(obj.rawValue):\(count)" : nil
            }.joined(separator: " ")
            if !objDetail.isEmpty {
                print("  │   │   objectives: \(objDetail)")
            }

            print("  │   └──")
        }

        print("  └──\n")
    }

    // MARK: - JSON Export

    func exportJSON(for report: FullCoverageReport) -> String {
        var lines: [String] = []
        lines.append("{")
        lines.append("  \"generatedAt\": \"\(report.generatedAt)\",")
        lines.append("  \"totalQuestions\": \(report.totalQuestions),")
        lines.append("  \"totalDrugs\": \(report.totalDrugs),")
        lines.append("  \"totalFlags\": \(report.totalFlags),")
        lines.append("  \"modules\": [")

        for (mi, mod) in report.moduleReports.enumerated() {
            lines.append("    {")
            lines.append("      \"moduleId\": \"\(mod.moduleId)\",")
            lines.append("      \"title\": \"\(mod.moduleTitle)\",")
            lines.append("      \"totalQuestions\": \(mod.totalQuestions),")
            lines.append("      \"totalDrugs\": \(mod.totalDrugs),")
            lines.append("      \"totalFlags\": \(mod.totalFlags),")
            lines.append("      \"subsections\": [")

            for (si, sub) in mod.subsectionReports.enumerated() {
                lines.append("        {")
                lines.append("          \"id\": \"\(sub.subsectionId)\",")
                lines.append("          \"code\": \"\(sub.subsectionCode)\",")
                lines.append("          \"title\": \"\(escapeJSON(sub.subsectionTitle))\",")
                lines.append("          \"isMastery\": \(sub.isMastery),")
                lines.append("          \"totalQuestions\": \(sub.totalQuestions),")
                lines.append("          \"flags\": [\(sub.flags.map { "\"\(escapeJSON($0))\"" }.joined(separator: ", "))],")
                lines.append("          \"drugs\": [")

                for (di, drug) in sub.drugReports.enumerated() {
                    lines.append("            {")
                    lines.append("              \"drugId\": \"\(drug.drugId)\",")
                    lines.append("              \"name\": \"\(escapeJSON(drug.drugName))\",")
                    lines.append("              \"totalQuestions\": \(drug.totalQuestions),")
                    lines.append("              \"questionGaps\": [\(drug.questionGaps.map { "\"\(escapeJSON($0))\"" }.joined(separator: ", "))],")
                    lines.append("              \"dataGaps\": [\(drug.dataGaps.map { "\"\(escapeJSON($0))\"" }.joined(separator: ", "))],")

                    let objEntries = drug.byObjective.sorted(by: { $0.key.rawValue < $1.key.rawValue })
                        .map { "\"\($0.key.rawValue)\": \($0.value)" }.joined(separator: ", ")
                    lines.append("              \"byObjective\": {\(objEntries)},")

                    let typeEntries = drug.byType.sorted(by: { $0.key.rawValue < $1.key.rawValue })
                        .map { "\"\($0.key.rawValue)\": \($0.value)" }.joined(separator: ", ")
                    lines.append("              \"byType\": {\(typeEntries)},")

                    let diffEntries = drug.byDifficulty.sorted(by: { $0.key.rawValue < $1.key.rawValue })
                        .map { "\"\($0.key.label)\": \($0.value)" }.joined(separator: ", ")
                    lines.append("              \"byDifficulty\": {\(diffEntries)}")

                    lines.append("            }\(di < sub.drugReports.count - 1 ? "," : "")")
                }

                lines.append("          ]")
                lines.append("        }\(si < mod.subsectionReports.count - 1 ? "," : "")")
            }

            lines.append("      ]")
            lines.append("    }\(mi < report.moduleReports.count - 1 ? "," : "")")
        }

        lines.append("  ]")
        lines.append("}")
        return lines.joined(separator: "\n")
    }

    private func escapeJSON(_ string: String) -> String {
        string.replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"", with: "\\\"")
            .replacingOccurrences(of: "\n", with: "\\n")
    }
}
