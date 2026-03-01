import SwiftUI

struct LearningSlideView: View {
    let subsection: Subsection
    let gameVM: GameViewModel
    let onComplete: () -> Void

    @State private var currentSlide: Int = 0

    private var slides: [LearningSlide] { subsection.learningSlides }
    private var isLastSlide: Bool { currentSlide >= slides.count - 1 }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    onComplete()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                }

                Spacer()

                Text("\(currentSlide + 1) of \(slides.count)")
                    .font(.subheadline.bold())
                    .foregroundStyle(.white.opacity(0.8))

                Spacer()
                Color.clear.frame(width: 24)
            }
            .padding()
            .background(AppTheme.headerGradient.ignoresSafeArea(edges: .top))

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle().fill(Color.white.opacity(0.3))
                    Rectangle()
                        .fill(AppTheme.warningYellow)
                        .frame(width: geo.size.width * Double(currentSlide + 1) / Double(max(slides.count, 1)))
                        .animation(.spring(duration: 0.3), value: currentSlide)
                }
            }
            .frame(height: 4)
            .background(AppTheme.primaryBlue)

            if !slides.isEmpty {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        let slide = slides[currentSlide]

                        HStack {
                            Image(systemName: "lightbulb.fill")
                                .font(.title2)
                                .foregroundStyle(AppTheme.warningYellow)
                            Text(slide.title)
                                .font(.title2.bold())
                        }
                        .padding(.top, 8)

                        Text(slide.content)
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)

                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(Array(slide.bulletPoints.enumerated()), id: \.offset) { _, point in
                                HStack(alignment: .top, spacing: 10) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(AppTheme.successGreen)
                                        .font(.subheadline)
                                        .padding(.top, 2)
                                    Text(point)
                                        .font(.subheadline)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                        .padding(16)
                        .background(AppTheme.successGreen.opacity(0.08))
                        .clipShape(.rect(cornerRadius: 12))

                        if !slide.highlightText.isEmpty {
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(AppTheme.accentOrange)
                                Text(slide.highlightText)
                                    .font(.headline)
                                    .foregroundStyle(AppTheme.darkBlue)
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(AppTheme.warningYellow.opacity(0.15))
                            .clipShape(.rect(cornerRadius: 12))
                        }
                    }
                    .padding(20)
                }
            }

            Spacer()

            Button {
                if isLastSlide {
                    gameVM.markLearningComplete(subsection.id)
                    onComplete()
                } else {
                    withAnimation(.spring(duration: 0.3)) {
                        currentSlide += 1
                    }
                }
            } label: {
                Text(isLastSlide ? "Start Quiz" : "Continue")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(AppTheme.primaryBlue)
                    .clipShape(.rect(cornerRadius: 14))
            }
            .padding(20)
            .sensoryFeedback(.impact(weight: .light), trigger: currentSlide)
        }
        .background(Color(.systemBackground))
    }
}
