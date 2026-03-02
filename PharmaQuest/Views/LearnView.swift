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
            ScrollView {
                VStack(spacing: 0) {
                    HeaderBar(gameVM: gameVM)

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
                }
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
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
        ZStack {
            if showConnector {
                ModulePathConnector(
                    variant: moduleIndex,
                    topColor: AppTheme.moduleColor(for: moduleIndex - 1),
                    bottomColor: AppTheme.moduleColor(for: moduleIndex),
                    isUnlocked: isUnlocked,
                    justUnlocked: isUnlocked && previousModuleUnlocked
                )
                .offset(y: -44)
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
        .padding(.top, showConnector ? 24 : 0)
    }
}

struct ModulePathConnector: View {
    let variant: Int
    let topColor: Color
    let bottomColor: Color
    let isUnlocked: Bool
    let justUnlocked: Bool

    @State private var glowPhase: CGFloat = 0

    private var pathHeight: CGFloat { 60 }

    var body: some View {
        ZStack {
            trailPath
                .stroke(
                    isUnlocked
                        ? LinearGradient(colors: [topColor.opacity(0.3), bottomColor.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                        : LinearGradient(colors: [Color(.systemGray5), Color(.systemGray5)], startPoint: .top, endPoint: .bottom),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )

            trailPath
                .stroke(
                    isUnlocked
                        ? LinearGradient(colors: [topColor, bottomColor], startPoint: .top, endPoint: .bottom)
                        : LinearGradient(colors: [Color(.systemGray4), Color(.systemGray4)], startPoint: .top, endPoint: .bottom),
                    style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: isUnlocked ? [] : [8, 6])
                )

            if isUnlocked && justUnlocked {
                trailPath
                    .trim(from: 0, to: glowPhase)
                    .stroke(
                        LinearGradient(colors: [topColor, bottomColor], startPoint: .top, endPoint: .bottom),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .blur(radius: 4)
                    .opacity(0.6)
            }

            if isUnlocked {
                let dotPos = trailDotPosition
                Circle()
                    .fill(bottomColor)
                    .frame(width: 10, height: 10)
                    .shadow(color: bottomColor.opacity(0.5), radius: 4)
                    .position(dotPos)
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

    private var trailPath: Path {
        let w: CGFloat = 200
        let h = pathHeight
        let midX = w / 2

        return Path { path in
            switch variant % 5 {
            case 0:
                path.move(to: CGPoint(x: midX, y: 0))
                path.addCurve(
                    to: CGPoint(x: midX - 30, y: h),
                    control1: CGPoint(x: midX + 40, y: h * 0.3),
                    control2: CGPoint(x: midX - 50, y: h * 0.6)
                )
            case 1:
                path.move(to: CGPoint(x: midX - 30, y: 0))
                path.addCurve(
                    to: CGPoint(x: midX + 20, y: h),
                    control1: CGPoint(x: midX - 60, y: h * 0.4),
                    control2: CGPoint(x: midX + 50, y: h * 0.5)
                )
            case 2:
                path.move(to: CGPoint(x: midX + 10, y: 0))
                path.addQuadCurve(
                    to: CGPoint(x: midX - 15, y: h),
                    control: CGPoint(x: midX + 50, y: h * 0.5)
                )
            case 3:
                path.move(to: CGPoint(x: midX - 20, y: 0))
                path.addCurve(
                    to: CGPoint(x: midX + 10, y: h),
                    control1: CGPoint(x: midX + 35, y: h * 0.25),
                    control2: CGPoint(x: midX - 40, y: h * 0.75)
                )
            default:
                path.move(to: CGPoint(x: midX + 15, y: 0))
                path.addQuadCurve(
                    to: CGPoint(x: midX - 25, y: h),
                    control: CGPoint(x: midX - 45, y: h * 0.5)
                )
            }
        }
    }

    private var trailDotPosition: CGPoint {
        let w: CGFloat = 200
        let h = pathHeight
        let midX = w / 2

        switch variant % 5 {
        case 0: return CGPoint(x: midX - 30, y: h - 2)
        case 1: return CGPoint(x: midX + 20, y: h - 2)
        case 2: return CGPoint(x: midX - 15, y: h - 2)
        case 3: return CGPoint(x: midX + 10, y: h - 2)
        default: return CGPoint(x: midX - 25, y: h - 2)
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
        .cardStyle(borderColor: isUnlocked ? moduleColor : nil, borderWidth: 3.5)
        .opacity(isUnlocked ? 1 : 0.55)
    }
}
