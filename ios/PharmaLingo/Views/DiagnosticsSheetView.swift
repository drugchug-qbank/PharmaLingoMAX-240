import SwiftUI

#if DEBUG

struct DiagnosticsSheetView: View {
    let report: SessionDiagnosticsReport
    let currentIndex: Int

    var body: some View {
        NavigationStack {
            List {
                summarySection
                if report.isHardenedModule {
                    polishSection
                }
                stageSection
                difficultySection
                objectiveSection
                typeSection
                sourceSection
                questionPlanSection
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Session Diagnostics")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var summarySection: some View {
        Section("Session") {
            LabeledContent("Subsection", value: "\(report.subsectionTitle) (\(report.subsectionId))")
            LabeledContent("Type", value: report.isMastery ? "Mastery/Boss" : "Lesson")
            LabeledContent("Hardened", value: report.isHardenedModule ? "Yes" : "No")
            LabeledContent("Total Questions", value: "\(report.totalQuestions)")
            LabeledContent("Current", value: "#\(currentIndex + 1)")
            LabeledContent("Review Qs", value: "\(report.reviewCount)")
            if !report.focusDrugNames.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Focus Drugs")
                        .foregroundStyle(.secondary)
                    Text(report.focusDrugNames.joined(separator: ", "))
                        .font(.subheadline.weight(.semibold))
                }
            }
        }
    }

    private var polishSection: some View {
        Section("Session Polish (Modules 3/6/7/10)") {
            HStack {
                Label("Contrast Qs", systemImage: "arrow.triangle.branch")
                Spacer()
                Text("\(report.contrastCount)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Label("Capstone Qs", systemImage: "star.fill")
                Spacer()
                Text("\(report.capstoneCount)")
                    .foregroundStyle(.secondary)
            }
            HStack {
                Label("Remediation Qs", systemImage: "arrow.uturn.backward")
                Spacer()
                Text("\(report.remediationCount)")
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var stageSection: some View {
        Section("Stage Breakdown") {
            ForEach([DrugLearningStage.foundation, .indication, .safety, .practical, .advanced], id: \.rawValue) { stage in
                let count = report.stageBreakdown[stage] ?? 0
                if count > 0 {
                    HStack {
                        Text(stage.label)
                        Spacer()
                        Text("\(count)")
                            .foregroundStyle(.secondary)
                        barSegment(count: count, total: report.totalQuestions, color: stageColor(stage))
                    }
                }
            }
        }
    }

    private var difficultySection: some View {
        Section("Difficulty") {
            ForEach([QuestionDifficulty.easy, .medium, .hard, .expert], id: \.rawValue) { diff in
                let count = report.difficultyBreakdown[diff] ?? 0
                if count > 0 {
                    HStack {
                        Text(diff.label)
                        Spacer()
                        Text("\(count)")
                            .foregroundStyle(.secondary)
                        barSegment(count: count, total: report.totalQuestions, color: difficultyColor(diff))
                    }
                }
            }
        }
    }

    private var objectiveSection: some View {
        Section("Objectives") {
            ForEach(report.objectiveBreakdown.sorted(by: { $0.value > $1.value }), id: \.key) { obj, count in
                HStack {
                    Text(obj.rawValue)
                        .font(.caption.monospaced())
                    Spacer()
                    Text("\(count)")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private var typeSection: some View {
        Section("Question Types") {
            ForEach(report.typeBreakdown.sorted(by: { $0.value > $1.value }), id: \.key) { type, count in
                HStack {
                    Text(type.rawValue)
                        .font(.caption.monospaced())
                    Spacer()
                    Text("\(count)")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private var sourceSection: some View {
        Section("Sources") {
            ForEach(report.sourceBreakdown.sorted(by: { $0.value > $1.value }), id: \.key) { src, count in
                HStack {
                    Text(src.rawValue)
                    Spacer()
                    Text("\(count)")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private var questionPlanSection: some View {
        Section("Question Plan") {
            ForEach(report.questionDiagnostics, id: \.questionId) { diag in
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text("#\(diag.index + 1)")
                            .font(.caption2.weight(.black).monospaced())
                            .foregroundStyle(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(diag.index == currentIndex ? Color.blue : Color(.systemGray3))
                            .clipShape(Capsule())

                        Text(diag.drugName)
                            .font(.subheadline.weight(.semibold))
                            .lineLimit(1)

                        Spacer()

                        if diag.isCapstone {
                            flagPill("CAP", color: .purple)
                        }
                        if diag.isContrast {
                            flagPill("CNTRST", color: .indigo)
                        }
                        if diag.isRemediation {
                            flagPill("REMED", color: .red)
                        }
                        if diag.isReview {
                            flagPill("REVIEW", color: .orange)
                        }
                    }

                    HStack(spacing: 8) {
                        diagPill(diag.stage.label, color: stageColor(diag.stage))
                        diagPill(diag.objective.rawValue, color: .secondary)
                        diagPill(diag.difficulty.label, color: difficultyColor(diag.difficulty))
                        diagPill(diag.questionType.rawValue, color: .secondary)
                    }

                    if let cg = diag.confusionGroup {
                        HStack(spacing: 4) {
                            Text("CG:")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundStyle(.tertiary)
                            Text(cg)
                                .font(.system(size: 9).monospaced())
                                .foregroundStyle(.secondary)
                        }
                    }

                    Text(diag.selectionReason)
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                        .lineLimit(2)
                }
                .padding(.vertical, 2)
            }
        }
    }

    private func flagPill(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.system(size: 9, weight: .black))
            .foregroundStyle(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background(color)
            .clipShape(Capsule())
    }

    private func diagPill(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.system(size: 9, weight: .semibold).monospaced())
            .foregroundStyle(color)
            .padding(.horizontal, 5)
            .padding(.vertical, 1)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }

    private func barSegment(count: Int, total: Int, color: Color) -> some View {
        let fraction = total > 0 ? CGFloat(count) / CGFloat(total) : 0
        return Rectangle()
            .fill(color)
            .frame(width: max(fraction * 60, 2), height: 8)
            .clipShape(Capsule())
    }

    private func stageColor(_ stage: DrugLearningStage) -> Color {
        switch stage {
        case .foundation: .blue
        case .indication: .green
        case .safety: .orange
        case .practical: .purple
        case .advanced: .red
        }
    }

    private func difficultyColor(_ diff: QuestionDifficulty) -> Color {
        switch diff {
        case .easy: .green
        case .medium: .yellow
        case .hard: .orange
        case .expert: .red
        }
    }
}

#endif
