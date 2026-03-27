import SwiftUI

struct MasteryDepthMeterView: View {
    let currentDepth: Int
    let previousDepth: Int
    let unlockState: SubsectionUnlockState
    let milestones: [MilestoneType]

    @State private var animatedDepth: Int = 0
    @State private var segmentScales: [CGFloat] = Array(repeating: 0, count: 10)
    @State private var showLabel: Bool = false
    @State private var showMilestoneIcons: Bool = false
    @State private var pulseNewSegments: Bool = false

    private let segmentSpacing: CGFloat = 4
    private let segmentHeight: CGFloat = 28

    private var depthIncreased: Bool { currentDepth > previousDepth }

    var body: some View {
        VStack(spacing: 16) {
            depthTitle

            HStack(spacing: segmentSpacing) {
                ForEach(0..<10, id: \.self) { i in
                    segmentView(index: i)
                }
            }
            .frame(height: segmentHeight)
            .padding(.horizontal, 4)

            milestoneMarkers

            if showLabel {
                depthLabel
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .onAppear { runAnimation() }
    }

    private var depthTitle: some View {
        VStack(spacing: 4) {
            if depthIncreased {
                Text("Depth Increased!")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                    .foregroundStyle(depthTierColor(currentDepth - 1))
            } else if currentDepth > 0 {
                Text("Mastery Depth")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                    .foregroundStyle(.secondary)
            }

            Text(subsectionTitle)
                .font(AppTheme.funFont(.caption, weight: .bold))
                .foregroundStyle(.tertiary)
                .lineLimit(1)
        }
    }

    private var subsectionTitle: String {
        unlockState.subsectionId.isEmpty ? "" : unlockState.subsectionId
    }

    @ViewBuilder
    private func segmentView(index: Int) -> some View {
        let isFilled = index < animatedDepth
        let isNew = index >= previousDepth && index < currentDepth
        let color = isFilled ? depthTierColor(index) : Color(.quaternarySystemFill)

        RoundedRectangle(cornerRadius: 4)
            .fill(
                isFilled
                    ? AnyShapeStyle(color.gradient)
                    : AnyShapeStyle(color)
            )
            .frame(height: segmentHeight)
            .scaleEffect(y: segmentScales[index])
            .overlay {
                if isNew && pulseNewSegments {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(color.opacity(0.4))
                        .scaleEffect(1.15)
                        .opacity(pulseNewSegments ? 0 : 0.6)
                        .animation(
                            .easeOut(duration: 0.8)
                            .repeatCount(2, autoreverses: false)
                            .delay(Double(index - previousDepth) * 0.1),
                            value: pulseNewSegments
                        )
                }
            }
            .overlay(alignment: .top) {
                if index == animatedDepth - 1 && isFilled && showLabel {
                    Triangle()
                        .fill(depthTierColor(index))
                        .frame(width: 8, height: 5)
                        .offset(y: -7)
                }
            }
    }

    private var milestoneMarkers: some View {
        HStack(spacing: 0) {
            milestoneIcon(
                at: 3,
                icon: "pills.fill",
                label: "Dosing",
                unlocked: unlockState.hasDosingUnlocked,
                color: AppTheme.primaryBlue
            )
            Spacer()
            milestoneIcon(
                at: 5,
                icon: "flame.fill",
                label: "Advanced",
                unlocked: unlockState.hasHarderUnlocked,
                color: AppTheme.accentOrange
            )
            Spacer()
            milestoneIcon(
                at: 7,
                icon: "star.circle.fill",
                label: "Cases",
                unlocked: unlockState.hasCaseChallengeReady,
                color: AppTheme.xpPurple
            )
        }
        .opacity(showMilestoneIcons ? 1 : 0)
        .offset(y: showMilestoneIcons ? 0 : 6)
    }

    @ViewBuilder
    private func milestoneIcon(at threshold: Int, icon: String, label: String, unlocked: Bool, color: Color) -> some View {
        let isNewlyUnlocked = milestones.contains(where: {
            switch ($0, threshold) {
            case (.dosingUnlocked, 3): true
            case (.harderUnlocked, 5): true
            case (.caseChallengeReady, 7): true
            default: false
            }
        })

        VStack(spacing: 3) {
            ZStack {
                Circle()
                    .fill(unlocked ? color.opacity(0.15) : Color(.tertiarySystemFill))
                    .frame(width: 28, height: 28)

                Image(systemName: icon)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(unlocked ? color : Color(.tertiaryLabel))
            }
            .scaleEffect(isNewlyUnlocked && showMilestoneIcons ? 1.2 : 1.0)
            .animation(
                .spring(response: 0.3, dampingFraction: 0.5),
                value: showMilestoneIcons
            )

            Text(label)
                .font(.system(size: 9, weight: .heavy, design: .rounded))
                .foregroundStyle(unlocked ? color : Color(.tertiaryLabel))
        }
    }

    private var depthLabel: some View {
        HStack(spacing: 6) {
            Text("\(currentDepth)")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundStyle(depthTierColor(max(0, currentDepth - 1)))
                .contentTransition(.numericText())

            VStack(alignment: .leading, spacing: 1) {
                Text("/ 10")
                    .font(.system(size: 13, weight: .heavy, design: .rounded))
                    .foregroundStyle(.secondary)

                Text(depthTierLabel)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundStyle(depthTierColor(max(0, currentDepth - 1)).opacity(0.8))
            }

            if depthIncreased {
                HStack(spacing: 2) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 10, weight: .black))
                    Text("+\(currentDepth - previousDepth)")
                        .font(.system(size: 13, weight: .black, design: .rounded))
                }
                .foregroundStyle(AppTheme.successGreen)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(AppTheme.successGreen.opacity(0.12))
                .clipShape(Capsule())
            }
        }
    }

    private var depthTierLabel: String {
        if currentDepth == 0 { return "Just Starting" }
        if currentDepth <= 2 { return "Foundation" }
        if currentDepth <= 4 { return "Building" }
        if currentDepth <= 6 { return "Intermediate" }
        if currentDepth <= 8 { return "Proficient" }
        if currentDepth <= 9 { return "Expert" }
        return "Mastered"
    }

    private func depthTierColor(_ index: Int) -> Color {
        if index < 3 { return AppTheme.successGreen }
        if index < 6 { return AppTheme.primaryBlue }
        if index < 8 { return AppTheme.xpPurple }
        return AppTheme.accentOrange
    }

    private func runAnimation() {
        animatedDepth = previousDepth
        for i in 0..<10 {
            segmentScales[i] = i < previousDepth ? 1.0 : 0.0
        }

        for i in 0..<previousDepth {
            segmentScales[i] = 1.0
        }

        let startDelay: Double = 0.3
        for i in previousDepth..<currentDepth {
            let delay = startDelay + Double(i - previousDepth) * 0.15
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.55)) {
                    segmentScales[i] = 1.0
                    animatedDepth = i + 1
                }
            }
        }

        let totalFillTime = startDelay + Double(max(0, currentDepth - previousDepth)) * 0.15 + 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + totalFillTime) {
            withAnimation(.spring(duration: 0.4)) {
                showLabel = true
            }
            pulseNewSegments = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + totalFillTime + 0.3) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.65)) {
                showMilestoneIcons = true
            }
        }
    }
}

private struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
