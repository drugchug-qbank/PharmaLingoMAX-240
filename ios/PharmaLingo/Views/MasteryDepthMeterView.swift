import SwiftUI

struct MasteryDepthMeterView: View {
    let currentDepth: Int
    let previousDepth: Int
    let unlockState: SubsectionUnlockState
    let milestones: [MilestoneType]

    @State private var animatedDepth: Int = 0
    @State private var segmentScales: [CGFloat] = Array(repeating: 0, count: 10)
    @State private var showLabel: Bool = false
    @State private var pulseNewSegments: Bool = false
    @State private var showMilestoneLabels: Bool = false

    private let segmentHeight: CGFloat = 22
    private let markerSize: CGFloat = 32

    private var depthIncreased: Bool { currentDepth > previousDepth }

    private struct MilestoneMarker {
        let position: Int
        let icon: String
        let label: String
        let unlocked: Bool
        let color: Color
        let milestoneType: MilestoneType
    }

    private var markers: [MilestoneMarker] {
        [
            MilestoneMarker(position: 3, icon: "pills.fill", label: "Dosing", unlocked: unlockState.hasDosingUnlocked, color: AppTheme.primaryBlue, milestoneType: .dosingUnlocked),
            MilestoneMarker(position: 5, icon: "flame.fill", label: "Advanced", unlocked: unlockState.hasHarderUnlocked, color: AppTheme.accentOrange, milestoneType: .harderUnlocked),
            MilestoneMarker(position: 7, icon: "star.circle.fill", label: "Cases", unlocked: unlockState.hasCaseChallengeReady, color: AppTheme.xpPurple, milestoneType: .caseChallengeReady),
        ]
    }

    var body: some View {
        VStack(spacing: 14) {
            depthHeader

            GeometryReader { geo in
                let totalWidth = geo.size.width
                ZStack(alignment: .leading) {
                    trackBar(totalWidth: totalWidth)

                    ForEach(markers, id: \.position) { marker in
                        milestoneNode(marker: marker, totalWidth: totalWidth)
                    }
                }
            }
            .frame(height: markerSize + 20)
            .padding(.horizontal, 4)

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

    @ViewBuilder
    private func trackBar(totalWidth: CGFloat) -> some View {
        let barY = markerSize / 2

        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(.quaternarySystemFill))
                .frame(height: segmentHeight)

            HStack(spacing: 2) {
                ForEach(0..<10, id: \.self) { i in
                    segmentPiece(index: i)
                }
            }
            .frame(height: segmentHeight)
            .clipShape(.rect(cornerRadius: 6))
        }
        .offset(y: barY - segmentHeight / 2)
    }

    @ViewBuilder
    private func segmentPiece(index: Int) -> some View {
        let isFilled = index < animatedDepth
        let isNew = index >= previousDepth && index < currentDepth
        let color = isFilled ? depthTierColor(index) : Color.clear

        Rectangle()
            .fill(isFilled ? AnyShapeStyle(color.gradient) : AnyShapeStyle(Color.clear))
            .scaleEffect(y: segmentScales[index], anchor: .center)
            .overlay {
                if isNew && pulseNewSegments {
                    Rectangle()
                        .fill(color.opacity(0.5))
                        .scaleEffect(1.08)
                        .opacity(pulseNewSegments ? 0 : 0.8)
                        .animation(
                            .easeOut(duration: 0.7)
                            .repeatCount(2, autoreverses: false)
                            .delay(Double(index - previousDepth) * 0.1),
                            value: pulseNewSegments
                        )
                }
            }
    }

    @ViewBuilder
    private func milestoneNode(marker: MilestoneMarker, totalWidth: CGFloat) -> some View {
        let segmentWidth = totalWidth / 10.0
        let xPos = CGFloat(marker.position) * segmentWidth - markerSize / 2

        let isNewlyUnlocked = milestones.contains(where: { $0 == marker.milestoneType })
        let isReached = animatedDepth >= marker.position

        VStack(spacing: 2) {
            ZStack {
                Circle()
                    .fill(marker.unlocked ? marker.color : Color(.tertiarySystemFill))
                    .frame(width: markerSize, height: markerSize)
                    .shadow(color: marker.unlocked ? marker.color.opacity(0.4) : .clear, radius: 4)

                Circle()
                    .strokeBorder(
                        isReached ? marker.color.opacity(0.6) : Color(.separator),
                        lineWidth: 2
                    )
                    .frame(width: markerSize, height: markerSize)

                Image(systemName: marker.icon)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(marker.unlocked ? .white : Color(.tertiaryLabel))
            }
            .scaleEffect(isNewlyUnlocked && showMilestoneLabels ? 1.15 : 1.0)
            .animation(.spring(response: 0.35, dampingFraction: 0.5), value: showMilestoneLabels)

            if showMilestoneLabels {
                Text(marker.label)
                    .font(.system(size: 9, weight: .heavy, design: .rounded))
                    .foregroundStyle(marker.unlocked ? marker.color : Color(.tertiaryLabel))
                    .transition(.opacity)
            }
        }
        .offset(x: xPos)
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
        animatedDepth = previousDepth
        for i in 0..<10 {
            segmentScales[i] = i < previousDepth ? 1.0 : 0.0
        }

        let startDelay: Double = 0.3

        if currentDepth == 0 {
            for i in 0..<10 {
                let delay = startDelay + Double(i) * 0.05
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.6)) {
                        segmentScales[i] = 1.0
                    }
                }
            }
            let emptyRevealTime = startDelay + 10.0 * 0.05 + 0.2
            DispatchQueue.main.asyncAfter(deadline: .now() + emptyRevealTime) {
                withAnimation(.spring(duration: 0.4)) { showLabel = true }
                withAnimation(.spring(response: 0.4, dampingFraction: 0.65)) { showMilestoneLabels = true }
            }
            return
        }

        for i in previousDepth..<currentDepth {
            let delay = startDelay + Double(i - previousDepth) * 0.15
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.55)) {
                    segmentScales[i] = 1.0
                    animatedDepth = i + 1
                }
            }
        }

        for i in currentDepth..<10 {
            let delay = startDelay + Double(max(0, currentDepth - previousDepth)) * 0.15 + Double(i - currentDepth) * 0.04
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.spring(response: 0.25, dampingFraction: 0.6)) {
                    segmentScales[i] = 1.0
                }
            }
        }

        let totalFillTime = startDelay + Double(max(0, currentDepth - previousDepth)) * 0.15 + 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + totalFillTime) {
            withAnimation(.spring(duration: 0.4)) { showLabel = true }
            pulseNewSegments = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + totalFillTime + 0.2) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.65)) {
                showMilestoneLabels = true
            }
        }
    }
}
