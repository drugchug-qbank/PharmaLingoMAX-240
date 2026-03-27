import SwiftUI

struct MasteryDepthMeterView: View {
    let currentDepth: Int
    let previousDepth: Int
    let unlockState: SubsectionUnlockState
    let milestones: [MilestoneType]

    @State private var animatedFraction: CGFloat = 0
    @State private var showLabel: Bool = false
    @State private var showMilestoneLabels: Bool = false
    @State private var glowPulse: Bool = false

    private let barHeight: CGFloat = 28
    private let markerDiameter: CGFloat = 26

    private var depthIncreased: Bool { currentDepth > previousDepth }
    private var minimumVisualFraction: CGFloat {
        currentDepth == 0 && previousDepth == 0 ? 0.06 : 0
    }

    private struct MilestoneMarker {
        let normalizedPosition: CGFloat
        let icon: String
        let label: String
        let unlocked: Bool
        let color: Color
        let milestoneType: MilestoneType
    }

    private var markers: [MilestoneMarker] {
        [
            MilestoneMarker(normalizedPosition: 0.3, icon: "pills.fill", label: "Dosing", unlocked: unlockState.hasDosingUnlocked, color: AppTheme.primaryBlue, milestoneType: .dosingUnlocked),
            MilestoneMarker(normalizedPosition: 0.5, icon: "flame.fill", label: "Advanced", unlocked: unlockState.hasHarderUnlocked, color: AppTheme.accentOrange, milestoneType: .harderUnlocked),
            MilestoneMarker(normalizedPosition: 0.7, icon: "star.circle.fill", label: "Cases", unlocked: unlockState.hasCaseChallengeReady, color: AppTheme.xpPurple, milestoneType: .caseChallengeReady),
        ]
    }

    private var targetFraction: CGFloat {
        CGFloat(currentDepth) / 10.0
    }

    var body: some View {
        VStack(spacing: 12) {
            depthHeader

            GeometryReader { geo in
                let totalWidth = geo.size.width
                ZStack(alignment: .leading) {
                    backgroundTrack
                    filledTrack(totalWidth: totalWidth)

                    ForEach(markers, id: \.normalizedPosition) { marker in
                        milestoneOnBar(marker: marker, totalWidth: totalWidth)
                    }
                }
            }
            .frame(height: barHeight + 22)

            if showLabel {
                depthLabel
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .onAppear { runAnimation() }
    }

    private var depthHeader: some View {
        VStack(spacing: 2) {
            if depthIncreased {
                HStack(spacing: 6) {
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundStyle(depthTierColor(currentDepth - 1))
                    Text("Depth Increased!")
                        .font(AppTheme.funFont(.headline, weight: .heavy))
                        .foregroundStyle(depthTierColor(currentDepth - 1))
                }
            } else {
                Text("Mastery Depth")
                    .font(AppTheme.funFont(.headline, weight: .heavy))
                    .foregroundStyle(.secondary)
            }

            if !unlockState.subsectionId.isEmpty {
                Text(unlockState.subsectionId)
                    .font(AppTheme.funFont(.caption, weight: .bold))
                    .foregroundStyle(.tertiary)
                    .lineLimit(1)
            }
        }
    }

    private var backgroundTrack: some View {
        RoundedRectangle(cornerRadius: barHeight / 2)
            .fill(Color(.quaternarySystemFill))
            .frame(height: barHeight)
    }

    @ViewBuilder
    private func filledTrack(totalWidth: CGFloat) -> some View {
        let fillWidth = max(barHeight, totalWidth * animatedFraction)

        ZStack(alignment: .leading) {
            if animatedFraction > 0 {
                RoundedRectangle(cornerRadius: barHeight / 2)
                    .fill(
                        LinearGradient(
                            colors: filledGradientColors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: fillWidth, height: barHeight)
                    .overlay {
                        RoundedRectangle(cornerRadius: barHeight / 2)
                            .fill(.white.opacity(glowPulse && depthIncreased ? 0.25 : 0))
                            .frame(width: fillWidth, height: barHeight)
                    }
            }
        }
    }

    private var filledGradientColors: [Color] {
        if currentDepth <= 0 { return [AppTheme.successGreen.opacity(0.5)] }
        if currentDepth <= 3 { return [AppTheme.successGreen.opacity(0.7), AppTheme.successGreen] }
        if currentDepth <= 5 { return [AppTheme.successGreen, AppTheme.primaryBlue] }
        if currentDepth <= 7 { return [AppTheme.successGreen, AppTheme.primaryBlue, AppTheme.xpPurple] }
        return [AppTheme.successGreen, AppTheme.primaryBlue, AppTheme.xpPurple, AppTheme.accentOrange]
    }

    @ViewBuilder
    private func milestoneOnBar(marker: MilestoneMarker, totalWidth: CGFloat) -> some View {
        let xCenter = totalWidth * marker.normalizedPosition
        let isReached = animatedFraction >= marker.normalizedPosition
        let isNewlyUnlocked = milestones.contains(where: { $0 == marker.milestoneType })

        VStack(spacing: 3) {
            ZStack {
                Circle()
                    .fill(isReached && marker.unlocked ? marker.color : Color(.tertiarySystemFill))
                    .frame(width: markerDiameter, height: markerDiameter)

                Circle()
                    .strokeBorder(
                        isReached ? marker.color : Color(.separator).opacity(0.5),
                        lineWidth: 2
                    )
                    .frame(width: markerDiameter, height: markerDiameter)

                Image(systemName: marker.icon)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(isReached && marker.unlocked ? .white : Color(.tertiaryLabel))
            }
            .shadow(color: isReached && marker.unlocked ? marker.color.opacity(0.4) : .clear, radius: 4)
            .scaleEffect(isNewlyUnlocked && showMilestoneLabels ? 1.2 : 1.0)
            .animation(.spring(response: 0.35, dampingFraction: 0.5), value: showMilestoneLabels)

            if showMilestoneLabels {
                Text(marker.label)
                    .font(.system(size: 9, weight: .heavy, design: .rounded))
                    .foregroundStyle(isReached && marker.unlocked ? marker.color : Color(.tertiaryLabel))
                    .transition(.opacity)
            }
        }
        .position(x: xCenter, y: barHeight / 2)
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
        if index < 0 { return AppTheme.successGreen }
        if index < 3 { return AppTheme.successGreen }
        if index < 6 { return AppTheme.primaryBlue }
        if index < 8 { return AppTheme.xpPurple }
        return AppTheme.accentOrange
    }

    private func runAnimation() {
        let startFraction = CGFloat(previousDepth) / 10.0
        animatedFraction = startFraction

        let startDelay: Double = 0.3

        if currentDepth == 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + startDelay) {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.72)) {
                    animatedFraction = minimumVisualFraction
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + startDelay + 0.6) {
                withAnimation(.spring(duration: 0.4)) { showLabel = true }
                withAnimation(.spring(response: 0.4, dampingFraction: 0.65)) { showMilestoneLabels = true }
            }
            return
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + startDelay) {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.72)) {
                animatedFraction = targetFraction
            }
        }

        let revealTime = startDelay + 0.6

        DispatchQueue.main.asyncAfter(deadline: .now() + revealTime) {
            withAnimation(.spring(duration: 0.4)) { showLabel = true }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + revealTime + 0.15) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.65)) {
                showMilestoneLabels = true
            }
        }

        if depthIncreased {
            DispatchQueue.main.asyncAfter(deadline: .now() + revealTime + 0.1) {
                withAnimation(.easeInOut(duration: 0.6).repeatCount(2, autoreverses: true)) {
                    glowPulse = true
                }
            }
        }
    }
}
