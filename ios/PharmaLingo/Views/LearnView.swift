import SwiftUI

nonisolated enum LearnPresentation: Identifiable, Hashable {
    case learning(Subsection)
    case quiz(Subsection)

    nonisolated var id: String {
        switch self {
        case .learning(let s): "learning-\(s.id)"
        case .quiz(let s): "quiz-\(s.id)"
        }
    }
}

struct LearnView: View {
    let gameVM: GameViewModel
    @State private var activePresentation: LearnPresentation?
    @State private var selectedModule: DrugModule?

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderBar(gameVM: gameVM)

                ScrollView {
                    VStack(spacing: 0) {
                        DailyQuestsCard(quests: gameVM.dailyQuests)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                            .padding(.bottom, 20)

                        ForEach(Array(gameVM.modules.enumerated()), id: \.element.id) { index, module in
                            ModuleTrailItem(
                                module: module,
                                moduleIndex: index,
                                gameVM: gameVM,
                                showConnector: index > 0,
                                previousModuleUnlocked: index > 0 ? gameVM.isModuleUnlocked(gameVM.modules[index - 1]) : false
                            ) {
                                withAnimation {
                                    selectedModule = module
                                }
                            }
                        }
                    }
                    .padding(.bottom, 32)
                    .padding(.top, 4)
                }
                .scrollIndicators(.hidden)
            }
            .background(Color(.systemGroupedBackground))
            .navigationDestination(item: $selectedModule) { module in
                ModuleDetailView(
                    module: module,
                    gameVM: gameVM,
                    onSubsectionTap: { subsection in
                        if gameVM.needsLearning(subsection.id) && !subsection.learningSlides.isEmpty {
                            activePresentation = .learning(subsection)
                        } else {
                            activePresentation = .quiz(subsection)
                        }
                    }
                )
            }
            .fullScreenCover(item: $activePresentation) { presentation in
                switch presentation {
                case .learning(let sub):
                    LearningSlideView(
                        subsection: sub,
                        gameVM: gameVM,
                        onComplete: {
                            activePresentation = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                activePresentation = .quiz(sub)
                            }
                        },
                        onExit: {
                            activePresentation = nil
                        }
                    )
                case .quiz(let sub):
                    QuizView(subsection: sub, gameVM: gameVM)
                }
            }
        }
    }
}

struct ModuleTrailItem: View {
    let module: DrugModule
    let moduleIndex: Int
    let gameVM: GameViewModel
    let showConnector: Bool
    let previousModuleUnlocked: Bool
    let onTap: () -> Void

    private var isUnlocked: Bool { gameVM.isModuleUnlocked(module) }

    var body: some View {
        VStack(spacing: 0) {
            if showConnector {
                ModulePathConnector(
                    variant: moduleIndex,
                    topColor: AppTheme.moduleColor(for: moduleIndex - 1),
                    bottomColor: AppTheme.moduleColor(for: moduleIndex),
                    isUnlocked: isUnlocked,
                    justUnlocked: isUnlocked && previousModuleUnlocked,
                    fillProgress: gameVM.moduleProgress(gameVM.modules[moduleIndex - 1])
                )
                .padding(.vertical, 4)
                .zIndex(0)
            }

            ModuleCard(
                module: module,
                moduleIndex: moduleIndex,
                gameVM: gameVM,
                onTap: onTap
            )
            .padding(.horizontal, 16)
            .zIndex(1)
        }
    }
}

struct ModulePathConnector: View {
    let variant: Int
    let topColor: Color
    let bottomColor: Color
    let isUnlocked: Bool
    let justUnlocked: Bool
    var fillProgress: Double = 0

    @State private var glowPhase: CGFloat = 0

    private let pathHeight: CGFloat = 60

    var body: some View {
        GeometryReader { geo in
            let centerX = geo.size.width / 2
            ZStack {
                connectorPath(centerX: centerX)
                    .stroke(
                        LinearGradient(colors: [Color(.systemGray5), Color(.systemGray5)], startPoint: .top, endPoint: .bottom),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )

                if fillProgress > 0 || isUnlocked {
                    connectorPath(centerX: centerX)
                        .trim(from: 0, to: isUnlocked ? 1.0 : fillProgress)
                        .stroke(
                            LinearGradient(colors: [topColor, bottomColor], startPoint: .top, endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 6, lineCap: .round)
                        )
                } else {
                    connectorPath(centerX: centerX)
                        .stroke(
                            LinearGradient(colors: [Color(.systemGray4), Color(.systemGray4)], startPoint: .top, endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [8, 6])
                        )
                }

                if isUnlocked && justUnlocked {
                    connectorPath(centerX: centerX)
                        .trim(from: 0, to: glowPhase)
                        .stroke(
                            LinearGradient(colors: [topColor, bottomColor], startPoint: .top, endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 8, lineCap: .round)
                        )
                        .blur(radius: 4)
                        .opacity(0.6)
                }


            }
        }
        .frame(height: pathHeight)
        .onAppear {
            if isUnlocked && justUnlocked {
                withAnimation(.easeInOut(duration: 1.2)) {
                    glowPhase = 1.0
                }
            }
        }
    }

    private func connectorPath(centerX: CGFloat) -> Path {
        let h = pathHeight
        return Path { path in
            switch variant % 5 {
            case 0:
                path.move(to: CGPoint(x: centerX, y: 0))
                path.addCurve(
                    to: CGPoint(x: centerX - 30, y: h),
                    control1: CGPoint(x: centerX + 40, y: h * 0.3),
                    control2: CGPoint(x: centerX - 50, y: h * 0.6)
                )
            case 1:
                path.move(to: CGPoint(x: centerX - 30, y: 0))
                path.addCurve(
                    to: CGPoint(x: centerX + 20, y: h),
                    control1: CGPoint(x: centerX - 60, y: h * 0.4),
                    control2: CGPoint(x: centerX + 50, y: h * 0.5)
                )
            case 2:
                path.move(to: CGPoint(x: centerX + 10, y: 0))
                path.addQuadCurve(
                    to: CGPoint(x: centerX - 15, y: h),
                    control: CGPoint(x: centerX + 50, y: h * 0.5)
                )
            case 3:
                path.move(to: CGPoint(x: centerX - 20, y: 0))
                path.addCurve(
                    to: CGPoint(x: centerX + 10, y: h),
                    control1: CGPoint(x: centerX + 35, y: h * 0.25),
                    control2: CGPoint(x: centerX - 40, y: h * 0.75)
                )
            default:
                path.move(to: CGPoint(x: centerX + 15, y: 0))
                path.addQuadCurve(
                    to: CGPoint(x: centerX - 25, y: h),
                    control: CGPoint(x: centerX - 45, y: h * 0.5)
                )
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
        .cardStyle(borderColor: AppTheme.primaryBlue.opacity(0.5), borderWidth: 2.5)
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
                            .fill(isUnlocked ? moduleColor.opacity(0.18) : Color(.tertiarySystemFill))
                            .frame(width: 56, height: 56)
                        Image(systemName: module.iconName)
                            .font(AppTheme.funFont(.title3, weight: .bold))
                            .foregroundStyle(isUnlocked ? moduleColor : .secondary)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("MODULE \(module.number)")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(isUnlocked ? moduleColor : .secondary)

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
        .cardStyle(borderColor: isUnlocked ? moduleColor : nil, borderWidth: 3.5)
        .overlay(alignment: .topTrailing) {
            if !statusLabel.isEmpty {
                Text(statusLabel)
                    .font(AppTheme.funFont(.caption2, weight: .heavy))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(progress >= 1.0 ? AppTheme.successGreen : AppTheme.accentOrange)
                    .clipShape(Capsule())
                    .offset(x: -12, y: -10)
            }
        }
        .opacity(isUnlocked ? 1 : 0.55)
    }
}
