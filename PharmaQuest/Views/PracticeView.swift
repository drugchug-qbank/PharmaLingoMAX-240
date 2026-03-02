import SwiftUI

struct PracticeView: View {
    let gameVM: GameViewModel
    @State private var showQuickPractice: Bool = false
    @State private var showBrandBlitz: Bool = false
    @State private var showMasteryDetail: Bool = false

    private var allDrugs: [Drug] {
        DrugDataService.shared.modules.flatMap { $0.subsections.flatMap { $0.drugs } }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    FunPageHeader(title: "Practice", subtitle: "Strengthen your knowledge!", icon: "brain.head.profile.fill")

                    VStack(spacing: 14) {
                        PracticeCard(
                            title: "Spaced Review",
                            subtitle: "\(max(1, gameVM.completedSubsections.count)) drug\(gameVM.completedSubsections.count == 1 ? "" : "s") due for review",
                            iconName: "arrow.clockwise.circle.fill",
                            gradient: [Color(hex: "FF6B35"), Color(hex: "F7931E")],
                            badgeCount: gameVM.completedSubsections.count
                        ) {
                            showQuickPractice = true
                        }

                        PracticeCard(
                            title: "Quick Practice",
                            subtitle: "10 random questions from all categories",
                            iconName: "bolt.circle.fill",
                            gradient: [Color(hex: "E91E63"), Color(hex: "FF5722")],
                            badgeCount: nil
                        ) {
                            showQuickPractice = true
                        }

                        PracticeCard(
                            title: "Brand Blitz Quiz",
                            subtitle: "15 rapid-fire brand/generic questions",
                            iconName: "arrow.triangle.2.circlepath.circle.fill",
                            gradient: [Color(hex: "9C27B0"), Color(hex: "E040FB")],
                            badgeCount: nil
                        ) {
                            showBrandBlitz = true
                        }

                        HStack(spacing: 0) {
                            PracticeStatItem(icon: "target", value: "\(Int(gameVM.accuracy * 100))%", label: "Accuracy", color: AppTheme.accentOrange)
                            PracticeStatItem(icon: "bolt.fill", value: "\(gameVM.totalXP)", label: "Total XP", color: AppTheme.primaryBlue)
                            PracticeStatItem(icon: "chart.line.uptrend.xyaxis", value: "\(gameVM.lessonsCompleted)", label: "Lessons", color: AppTheme.successGreen)
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.successGreen.opacity(0.5))

                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                FunSectionHeader(icon: "pills.fill", title: "Drug Mastery", color: AppTheme.xpPurple)
                                Spacer()
                                Text("\(masteredCount)/\(allDrugs.count)")
                                    .font(AppTheme.funFont(.caption, weight: .heavy))
                                    .foregroundStyle(AppTheme.xpPurple)
                            }

                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .fill(AppTheme.xpPurple.opacity(0.15))
                                        .frame(height: 10)
                                    Capsule()
                                        .fill(
                                            LinearGradient(colors: [AppTheme.xpPurple, AppTheme.funPink], startPoint: .leading, endPoint: .trailing)
                                        )
                                        .frame(width: max(10, geo.size.width * masteryProgress), height: 10)
                                }
                            }
                            .frame(height: 10)

                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                                ForEach(allDrugs.prefix(8)) { drug in
                                    DrugMasteryPill(drug: drug, mastery: drugMasteryLevel(drug))
                                }
                            }

                            if allDrugs.count > 8 {
                                Button {
                                    showMasteryDetail = true
                                } label: {
                                    Text("View All \(allDrugs.count) Drugs")
                                        .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                        .foregroundStyle(AppTheme.xpPurple)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 10)
                                        .background(AppTheme.xpPurple.opacity(0.08))
                                        .clipShape(.rect(cornerRadius: 12))
                                }
                            }
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.xpPurple.opacity(0.4))

                        VStack(alignment: .leading, spacing: 12) {
                            FunSectionHeader(icon: "exclamationmark.triangle.fill", title: "Review Mistakes", color: AppTheme.accentOrange)

                            let mistakeCount = gameVM.questionsAnswered - gameVM.questionsCorrect
                            HStack(spacing: 12) {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(AppTheme.heartRed)

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("\(mistakeCount) mistakes this week")
                                        .font(AppTheme.funFont(.subheadline, weight: .semibold))
                                    Text("\(max(0, mistakeCount / 3)) drugs to review")
                                        .font(AppTheme.funFont(.caption, weight: .medium))
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(14)
                            .background(Color(.tertiarySystemFill))
                            .clipShape(.rect(cornerRadius: 14))
                        }
                        .padding(16)
                        .cardStyle(borderColor: AppTheme.accentOrange.opacity(0.5))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                }
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
            .fullScreenCover(isPresented: $showQuickPractice) {
                quickPracticeQuiz
            }
            .fullScreenCover(isPresented: $showBrandBlitz) {
                BrandBlitzQuizView(gameVM: gameVM)
            }
            .sheet(isPresented: $showMasteryDetail) {
                DrugMasteryListView(drugs: allDrugs, gameVM: gameVM)
            }
        }
    }

    private var masteredCount: Int {
        allDrugs.filter { drugMasteryLevel($0) >= 3 }.count
    }

    private var masteryProgress: Double {
        guard !allDrugs.isEmpty else { return 0 }
        return Double(masteredCount) / Double(allDrugs.count)
    }

    private func drugMasteryLevel(_ drug: Drug) -> Int {
        let subsections = gameVM.completedSubsections
        let module = DrugDataService.shared.modules.first { m in
            m.subsections.contains { s in s.drugs.contains { $0.id == drug.id } }
        }
        guard let sub = module?.subsections.first(where: { $0.drugs.contains { $0.id == drug.id } }) else { return 0 }
        return subsections.contains(sub.id) ? min(gameVM.starsFor(sub.id) + 1, 5) : 0
    }

    @ViewBuilder
    private var quickPracticeQuiz: some View {
        let allCompleted = gameVM.completedSubsections
        let subsectionId = allCompleted.first ?? "1a"
        let sub = DrugDataService.shared.subsection(for: subsectionId) ?? DrugDataService.shared.modules[0].subsections[0]
        QuizView(subsection: sub, gameVM: gameVM)
    }
}

struct DrugMasteryPill: View {
    let drug: Drug
    let mastery: Int

    private var masteryColor: Color {
        switch mastery {
        case 0: Color(.systemGray4)
        case 1: AppTheme.heartRed
        case 2: AppTheme.accentOrange
        case 3: AppTheme.warningYellow
        case 4: AppTheme.successGreen
        default: AppTheme.xpPurple
        }
    }

    var body: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(masteryColor)
                .frame(width: 8, height: 8)
            Text(drug.genericName)
                .font(AppTheme.funFont(.caption, weight: .semibold))
                .lineLimit(1)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(masteryColor.opacity(0.08))
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct DrugMasteryListView: View {
    let drugs: [Drug]
    let gameVM: GameViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""

    private var filteredDrugs: [Drug] {
        if searchText.isEmpty { return drugs }
        return drugs.filter {
            $0.genericName.localizedStandardContains(searchText) ||
            $0.brandName.localizedStandardContains(searchText) ||
            $0.drugClass.localizedStandardContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredDrugs) { drug in
                HStack(spacing: 12) {
                    let level = masteryLevel(drug)
                    Circle()
                        .fill(masteryColor(level))
                        .frame(width: 12, height: 12)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(drug.genericName)
                            .font(AppTheme.funFont(.subheadline, weight: .bold))
                        Text("\(drug.brandName) • \(drug.drugClass)")
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) { i in
                            Image(systemName: i < level ? "star.fill" : "star")
                                .font(.system(size: 8))
                                .foregroundStyle(i < level ? AppTheme.warningYellow : Color(.tertiaryLabel))
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search drugs...")
            .navigationTitle("Drug Mastery")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    private func masteryLevel(_ drug: Drug) -> Int {
        let module = DrugDataService.shared.modules.first { m in
            m.subsections.contains { s in s.drugs.contains { $0.id == drug.id } }
        }
        guard let sub = module?.subsections.first(where: { $0.drugs.contains { $0.id == drug.id } }) else { return 0 }
        return gameVM.completedSubsections.contains(sub.id) ? min(gameVM.starsFor(sub.id) + 1, 5) : 0
    }

    private func masteryColor(_ level: Int) -> Color {
        switch level {
        case 0: Color(.systemGray4)
        case 1: AppTheme.heartRed
        case 2: AppTheme.accentOrange
        case 3: AppTheme.warningYellow
        case 4: AppTheme.successGreen
        default: AppTheme.xpPurple
        }
    }
}

struct PracticeCard: View {
    let title: String
    let subtitle: String
    let iconName: String
    let gradient: [Color]
    let badgeCount: Int?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundStyle(.white)

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(AppTheme.funFont(.headline, weight: .heavy))
                        .foregroundStyle(.white)
                    Text(subtitle)
                        .font(AppTheme.funFont(.caption, weight: .medium))
                        .foregroundStyle(.white.opacity(0.85))
                }

                Spacer()

                if let count = badgeCount, count > 0 {
                    Text("\(count)")
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(gradient[0])
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(18)
            .background(LinearGradient(colors: gradient, startPoint: .leading, endPoint: .trailing))
            .clipShape(.rect(cornerRadius: 18))
            .shadow(color: gradient[0].opacity(0.35), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(.plain)
    }
}

struct PracticeStatItem: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            Text(value)
                .font(AppTheme.funFont(.headline, weight: .heavy))
            Text(label)
                .font(AppTheme.funFont(.caption, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}
