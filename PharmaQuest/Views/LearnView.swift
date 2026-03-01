import SwiftUI

struct LearnView: View {
    let gameVM: GameViewModel
    @State private var showQuiz: Bool = false
    @State private var showLearning: Bool = false
    @State private var selectedSubsection: Subsection?
    @State private var selectedModule: DrugModule?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    HeaderBar(gameVM: gameVM)

                    VStack(spacing: 16) {
                        DailyQuestsCard(quests: gameVM.dailyQuests)
                            .padding(.top, 16)

                        ForEach(Array(gameVM.modules.enumerated()), id: \.element.id) { index, module in
                            ModuleCard(
                                module: module,
                                moduleIndex: index,
                                gameVM: gameVM
                            ) {
                                selectedModule = module
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                }
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
            .navigationDestination(item: $selectedModule) { module in
                ModuleDetailView(
                    module: module,
                    gameVM: gameVM,
                    onSubsectionTap: { subsection in
                        selectedSubsection = subsection
                        if gameVM.needsLearning(subsection.id) && !subsection.learningSlides.isEmpty {
                            showLearning = true
                        } else {
                            showQuiz = true
                        }
                    }
                )
            }
            .fullScreenCover(isPresented: $showLearning) {
                if let sub = selectedSubsection {
                    LearningSlideView(
                        subsection: sub,
                        gameVM: gameVM,
                        onComplete: {
                            showLearning = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                showQuiz = true
                            }
                        }
                    )
                }
            }
            .fullScreenCover(isPresented: $showQuiz) {
                if let sub = selectedSubsection {
                    QuizView(subsection: sub, gameVM: gameVM)
                }
            }
        }
    }
}

struct DailyQuestsCard: View {
    let quests: [DailyQuest]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.circle.fill")
                    .foregroundStyle(AppTheme.warningYellow)
                    .font(AppTheme.funFont(.title3, weight: .bold))
                Text("Daily Quests")
                    .font(AppTheme.funFont(.headline, weight: .bold))
                Spacer()
                Image(systemName: "ellipsis.circle.fill")
                    .foregroundStyle(.secondary)
            }

            ForEach(quests) { quest in
                HStack(spacing: 12) {
                    ZStack {
                        ProgressRing(progress: quest.progress, size: 34, lineWidth: 3.5, color: quest.isComplete ? AppTheme.successGreen : AppTheme.primaryBlue)
                        if quest.isComplete {
                            Image(systemName: "checkmark")
                                .font(AppTheme.funFont(.caption2, weight: .heavy))
                                .foregroundStyle(AppTheme.successGreen)
                        }
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(quest.title)
                            .font(AppTheme.funFont(.subheadline, weight: .semibold))
                        Text("\(quest.current)/\(quest.target)")
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    HStack(spacing: 3) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .foregroundStyle(AppTheme.accentOrange)
                            .font(.caption)
                        Text("+\(quest.coinReward)")
                            .font(AppTheme.funFont(.subheadline, weight: .heavy))
                            .foregroundStyle(AppTheme.accentOrange)
                    }
                }
            }
        }
        .padding(16)
        .cardStyle()
    }
}

struct ModuleCard: View {
    let module: DrugModule
    let moduleIndex: Int
    let gameVM: GameViewModel
    let onTap: () -> Void

    private var isUnlocked: Bool { gameVM.isModuleUnlocked(module) }
    private var progress: Double { gameVM.moduleProgress(module) }
    private var moduleColor: Color { AppTheme.moduleColor(for: moduleIndex) }

    private var statusLabel: String {
        if progress >= 1.0 { return "COMPLETE" }
        if progress > 0 { return "IN PROGRESS" }
        return ""
    }

    var body: some View {
        Button(action: {
            if isUnlocked { onTap() }
        }) {
            VStack(spacing: 0) {
                HStack(spacing: 14) {
                    ZStack {
                        Circle()
                            .fill(isUnlocked ? moduleColor.opacity(0.15) : Color(.tertiarySystemFill))
                            .frame(width: 54, height: 54)
                        Image(systemName: module.iconName)
                            .font(AppTheme.funFont(.title3, weight: .bold))
                            .foregroundStyle(isUnlocked ? moduleColor : .secondary)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 8) {
                            Text("MODULE \(module.number)")
                                .font(AppTheme.funFont(.caption, weight: .heavy))
                                .foregroundStyle(isUnlocked ? moduleColor : .secondary)

                            if !statusLabel.isEmpty {
                                Text(statusLabel)
                                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 3)
                                    .background(progress >= 1.0 ? AppTheme.successGreen : AppTheme.accentOrange)
                                    .clipShape(Capsule())
                            }
                        }

                        Text(module.title)
                            .font(AppTheme.funFont(.headline, weight: .bold))
                            .foregroundStyle(isUnlocked ? .primary : .secondary)

                        Text(module.subtitle)
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    if isUnlocked {
                        VStack(alignment: .trailing, spacing: 6) {
                            if progress > 0 {
                                Text("\(Int(progress * 100))%")
                                    .font(AppTheme.funFont(.subheadline, weight: .heavy))
                                    .foregroundStyle(moduleColor)
                            }
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title3)
                                .foregroundStyle(moduleColor.opacity(0.6))
                        }
                    } else {
                        Image(systemName: "lock.fill")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(16)

                if isUnlocked && progress > 0 {
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(moduleColor.opacity(0.15))
                                .frame(height: 6)
                            Capsule()
                                .fill(moduleColor)
                                .frame(width: geo.size.width * progress, height: 6)
                        }
                    }
                    .frame(height: 6)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                }
            }
        }
        .buttonStyle(.plain)
        .cardStyle(borderColor: isUnlocked ? moduleColor.opacity(0.4) : nil)
        .opacity(isUnlocked ? 1 : 0.55)
    }
}
