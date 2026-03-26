import SwiftUI

struct ModuleDetailView: View {
    let module: DrugModule
    let gameVM: GameViewModel
    let onSubsectionTap: (Subsection) -> Void

    @Environment(\.dismiss) private var dismiss

    private var moduleColor: Color {
        if let idx = gameVM.modules.firstIndex(where: { $0.id == module.id }) {
            return AppTheme.moduleColor(for: idx)
        }
        return AppTheme.primaryBlue
    }

    private var progress: Double { gameVM.moduleProgress(module) }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(moduleColor.opacity(0.2))
                            .frame(width: 80, height: 80)
                        Image(systemName: module.iconName)
                            .font(.system(size: 36, weight: .bold))
                            .foregroundStyle(.white)
                    }

                    VStack(spacing: 6) {
                        Text("MODULE \(module.number)")
                            .font(AppTheme.funFont(.caption, weight: .heavy))
                            .foregroundStyle(.white.opacity(0.7))
                        Text(module.title)
                            .font(AppTheme.funFont(.title, weight: .heavy))
                            .foregroundStyle(.white)
                        Text(module.subtitle)
                            .font(AppTheme.funFont(.subheadline, weight: .medium))
                            .foregroundStyle(.white.opacity(0.8))
                    }

                    HStack(spacing: 20) {
                        VStack(spacing: 2) {
                            Text("\(Int(progress * 100))%")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(.white)
                            Text("Complete")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.white.opacity(0.7))
                        }

                        Divider().frame(height: 36).background(.white.opacity(0.3))

                        VStack(spacing: 2) {
                            let completedCount = module.subsections.filter { gameVM.completedSubsections.contains($0.id) }.count
                            Text("\(completedCount)/\(module.subsections.count)")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(.white)
                            Text("Lessons")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.white.opacity(0.7))
                        }

                        Divider().frame(height: 36).background(.white.opacity(0.3))

                        VStack(spacing: 2) {
                            let totalStars = module.subsections.reduce(0) { $0 + gameVM.starsFor($1.id) }
                            Text("\(totalStars)")
                                .font(AppTheme.funFont(.title2, weight: .heavy))
                                .foregroundStyle(AppTheme.warningYellow)
                            Text("Stars")
                                .font(AppTheme.funFont(.caption, weight: .medium))
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 20)
                    .background(.white.opacity(0.12))
                    .clipShape(.rect(cornerRadius: 14))
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: [moduleColor.opacity(0.9), moduleColor],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea(edges: .top)
                )

                VStack(spacing: 12) {
                    ForEach(Array(module.subsections.enumerated()), id: \.element.id) { index, subsection in
                        SubsectionCard(
                            subsection: subsection,
                            index: index,
                            gameVM: gameVM,
                            moduleColor: moduleColor,
                            onTap: { onSubsectionTap(subsection) }
                        )
                    }
                }
                .padding(16)
                .padding(.bottom, 32)
            }
        }
        .background(Color(.systemGroupedBackground))
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct SubsectionCard: View {
    let subsection: Subsection
    let index: Int
    let gameVM: GameViewModel
    let moduleColor: Color
    let onTap: () -> Void

    private var isUnlocked: Bool { gameVM.isSubsectionUnlocked(subsection) }
    private var stars: Int { gameVM.starsFor(subsection.id) }
    private var isCompleted: Bool { gameVM.completedSubsections.contains(subsection.id) }

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(circleColor)
                        .frame(width: 50, height: 50)

                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.white)
                    } else if isUnlocked {
                        Text("\(index + 1)")
                            .font(AppTheme.funFont(.title3, weight: .heavy))
                            .foregroundStyle(.white)
                    } else {
                        Image(systemName: "lock.fill")
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(subsection.title)
                        .font(AppTheme.funFont(.subheadline, weight: .bold))
                        .foregroundStyle(isUnlocked ? .primary : .secondary)

                    if stars > 0 {
                        StarRating(stars: stars)
                    } else {
                        Text(subsection.description)
                            .font(AppTheme.funFont(.caption, weight: .medium))
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                }

                Spacer()

                if isUnlocked && !isCompleted {
                    Text("START")
                        .font(AppTheme.funFont(.caption, weight: .heavy))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .background(moduleColor)
                        .clipShape(Capsule())
                        .shadow(color: moduleColor.opacity(0.4), radius: 4, y: 2)
                } else if isCompleted {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.title3)
                        .foregroundStyle(moduleColor.opacity(0.6))
                }
            }
            .padding(14)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(.rect(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isCompleted ? moduleColor.opacity(0.3) : .clear, lineWidth: 2)
            )
            .shadow(color: .black.opacity(0.05), radius: 6, y: 2)
        }
        .buttonStyle(.plain)
        .disabled(!isUnlocked || gameVM.hearts <= 0)
        .opacity(isUnlocked ? 1 : 0.5)
    }

    private var circleColor: Color {
        if isCompleted { return moduleColor }
        if isUnlocked { return moduleColor.opacity(0.7) }
        return Color(.systemGray4)
    }
}
