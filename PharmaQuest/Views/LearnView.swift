import SwiftUI

struct LearnView: View {
    let gameVM: GameViewModel
    @State private var showQuiz: Bool = false
    @State private var showLearning: Bool = false
    @State private var selectedSubsection: Subsection?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    HeaderBar(gameVM: gameVM)
                    XPProgressBar(gameVM: gameVM)

                    VStack(spacing: 16) {
                        DailyQuestsCard(quests: gameVM.dailyQuests)
                            .padding(.top, 16)

                        ForEach(gameVM.modules) { module in
                            ModuleCard(
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
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
            }
            .background(Color(.systemGroupedBackground))
            .scrollIndicators(.hidden)
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
                    .font(.title3)
                Text("Daily Quests")
                    .font(.headline)
                Spacer()
            }

            ForEach(quests) { quest in
                HStack(spacing: 12) {
                    ZStack {
                        ProgressRing(progress: quest.progress, size: 32, lineWidth: 3, color: quest.isComplete ? AppTheme.successGreen : AppTheme.primaryBlue)
                        if quest.isComplete {
                            Image(systemName: "checkmark")
                                .font(.caption2.bold())
                                .foregroundStyle(AppTheme.successGreen)
                        }
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(quest.title)
                            .font(.subheadline.weight(.medium))
                        Text("\(quest.current)/\(quest.target)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    HStack(spacing: 2) {
                        Image(systemName: "bitcoinsign.circle.fill")
                            .foregroundStyle(AppTheme.accentOrange)
                            .font(.caption)
                        Text("+\(quest.coinReward)")
                            .font(.subheadline.bold())
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
    let gameVM: GameViewModel
    let onSubsectionTap: (Subsection) -> Void

    @State private var isExpanded: Bool = false

    private var isUnlocked: Bool { gameVM.isModuleUnlocked(module) }
    private var progress: Double { gameVM.moduleProgress(module) }
    private var moduleColor: Color { Color(hex: module.accentColorHex) }

    var body: some View {
        VStack(spacing: 0) {
            Button {
                if isUnlocked {
                    withAnimation(.spring(duration: 0.3)) {
                        isExpanded.toggle()
                    }
                }
            } label: {
                HStack(spacing: 14) {
                    ZStack {
                        Circle()
                            .fill(isUnlocked ? moduleColor.opacity(0.15) : Color(.tertiarySystemFill))
                            .frame(width: 50, height: 50)
                        Image(systemName: module.iconName)
                            .font(.title3)
                            .foregroundStyle(isUnlocked ? moduleColor : .secondary)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("MODULE \(module.number)")
                            .font(.caption.bold())
                            .foregroundStyle(isUnlocked ? moduleColor : .secondary)
                        Text(module.title)
                            .font(.headline)
                            .foregroundStyle(isUnlocked ? .primary : .secondary)
                        Text(module.subtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    if isUnlocked {
                        VStack(alignment: .trailing, spacing: 4) {
                            if progress > 0 {
                                Text("\(Int(progress * 100))%")
                                    .font(.caption.bold())
                                    .foregroundStyle(moduleColor)
                            }
                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    } else {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(16)
            }
            .buttonStyle(.plain)

            if isUnlocked && progress > 0 {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(moduleColor.opacity(0.1))
                            .frame(height: 4)
                        Rectangle()
                            .fill(moduleColor)
                            .frame(width: geo.size.width * progress, height: 4)
                    }
                }
                .frame(height: 4)
                .padding(.horizontal, 16)
            }

            if isExpanded {
                VStack(spacing: 2) {
                    ForEach(module.subsections) { subsection in
                        SubsectionRow(
                            subsection: subsection,
                            gameVM: gameVM,
                            moduleColor: moduleColor,
                            onTap: { onSubsectionTap(subsection) }
                        )
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .cardStyle()
        .opacity(isUnlocked ? 1 : 0.6)
        .onAppear {
            if isUnlocked && progress > 0 && progress < 1 {
                isExpanded = true
            }
        }
    }
}

struct SubsectionRow: View {
    let subsection: Subsection
    let gameVM: GameViewModel
    let moduleColor: Color
    let onTap: () -> Void

    private var isUnlocked: Bool { gameVM.isSubsectionUnlocked(subsection) }
    private var stars: Int { gameVM.starsFor(subsection.id) }
    private var isCompleted: Bool { gameVM.completedSubsections.contains(subsection.id) }

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(isCompleted ? moduleColor.opacity(0.15) : Color(.tertiarySystemFill))
                        .frame(width: 40, height: 40)
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(moduleColor)
                    } else if isUnlocked {
                        Image(systemName: subsection.iconName)
                            .font(.subheadline)
                            .foregroundStyle(moduleColor)
                    } else {
                        Image(systemName: "lock.fill")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(subsection.title)
                        .font(.subheadline.weight(.medium))
                        .foregroundStyle(isUnlocked ? .primary : .secondary)
                    if stars > 0 {
                        StarRating(stars: stars)
                    } else {
                        Text(subsection.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                }

                Spacer()

                if isUnlocked && !isCompleted {
                    Text("START")
                        .font(.caption.bold())
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(moduleColor)
                        .clipShape(Capsule())
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
        }
        .buttonStyle(.plain)
        .disabled(!isUnlocked || gameVM.hearts <= 0)
    }
}
