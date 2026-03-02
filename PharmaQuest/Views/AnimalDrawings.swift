import SwiftUI

struct AnimalAvatarView: View {
    let animalType: AnimalType
    let bodyColor: Color
    let backgroundColor: Color
    let eyeStyle: EyeStyle
    let mouthStyle: MouthStyle
    let accessory: AccessoryType
    let size: CGFloat

    var body: some View {
        Canvas { context, canvasSize in
            let s = canvasSize.width
            drawBackground(context: &context, size: s, color: backgroundColor)
            drawAnimal(context: &context, type: animalType, color: bodyColor, size: s)
            drawEyes(context: &context, style: eyeStyle, size: s)
            drawMouth(context: &context, style: mouthStyle, size: s)
            drawAccessory(context: &context, type: accessory, size: s)
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }

    private func drawBackground(context: inout GraphicsContext, size: CGFloat, color: Color) {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        context.fill(Path(ellipseIn: rect), with: .color(color))
    }

    private func darker(_ color: Color, by amount: CGFloat = 0.15) -> Color {
        color.opacity(1.0).mix(with: .black, by: amount)
    }

    private func lighter(_ color: Color, by amount: CGFloat = 0.25) -> Color {
        color.opacity(1.0).mix(with: .white, by: amount)
    }

    private func drawAnimal(context: inout GraphicsContext, type: AnimalType, color: Color, size: CGFloat) {
        let s = size
        let fc = color
        let belly = Color.white.opacity(0.55)
        let highlight = Color.white.opacity(0.30)
        let cheek = Color(hex: "FF8A80").opacity(0.30)
        let darkAccent = Color.black.opacity(0.12)
        let noseColor = Color.black.opacity(0.65)

        switch type {
        case .beaver:
            let earL = CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.18, height: s * 0.16)
            let earR = CGRect(x: s * 0.66, y: s * 0.22, width: s * 0.18, height: s * 0.16)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "D7CCC8")))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "D7CCC8")))
            let head = CGRect(x: s * 0.13, y: s * 0.26, width: s * 0.74, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.28, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.26, y: s * 0.52, width: s * 0.48, height: s * 0.30)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            let nose = CGRect(x: s * 0.42, y: s * 0.52, width: s * 0.16, height: s * 0.11)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.53, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.45)))
            var teeth = Path()
            teeth.addRoundedRect(in: CGRect(x: s * 0.42, y: s * 0.72, width: s * 0.07, height: s * 0.10), cornerSize: CGSize(width: 2, height: 2))
            teeth.addRoundedRect(in: CGRect(x: s * 0.51, y: s * 0.72, width: s * 0.07, height: s * 0.10), cornerSize: CGSize(width: 2, height: 2))
            context.fill(teeth, with: .color(.white))
            context.stroke(teeth, with: .color(darkAccent), lineWidth: 0.8)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.56, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .bird:
            var crest = Path()
            crest.move(to: CGPoint(x: s * 0.44, y: s * 0.10))
            crest.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.26), control: CGPoint(x: s * 0.38, y: s * 0.18))
            crest.addQuadCurve(to: CGPoint(x: s * 0.56, y: s * 0.10), control: CGPoint(x: s * 0.56, y: s * 0.18))
            crest.addQuadCurve(to: CGPoint(x: s * 0.55, y: s * 0.27), control: CGPoint(x: s * 0.60, y: s * 0.18))
            crest.closeSubpath()
            context.fill(crest, with: .color(fc))
            let head = CGRect(x: s * 0.15, y: s * 0.24, width: s * 0.70, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.26, width: s * 0.32, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.24, y: s * 0.50, width: s * 0.52, height: s * 0.32)), with: .color(belly))
            var beak = Path()
            beak.move(to: CGPoint(x: s * 0.40, y: s * 0.56))
            beak.addQuadCurve(to: CGPoint(x: s * 0.60, y: s * 0.56), control: CGPoint(x: s * 0.50, y: s * 0.50))
            beak.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.68), control: CGPoint(x: s * 0.57, y: s * 0.63))
            beak.addQuadCurve(to: CGPoint(x: s * 0.40, y: s * 0.56), control: CGPoint(x: s * 0.43, y: s * 0.63))
            beak.closeSubpath()
            context.fill(beak, with: .color(Color(hex: "FFA726")))
            context.stroke(beak, with: .color(Color(hex: "E65100").opacity(0.3)), lineWidth: 1)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .bunny:
            let earL = CGRect(x: s * 0.20, y: s * 0.00, width: s * 0.20, height: s * 0.42)
            let earR = CGRect(x: s * 0.60, y: s * 0.00, width: s * 0.20, height: s * 0.42)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.24, y: s * 0.06, width: s * 0.12, height: s * 0.30)), with: .color(Color(hex: "F48FB1").opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.64, y: s * 0.06, width: s * 0.12, height: s * 0.30)), with: .color(Color(hex: "F48FB1").opacity(0.5)))
            let head = CGRect(x: s * 0.13, y: s * 0.28, width: s * 0.74, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.30, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.34, y: s * 0.56, width: s * 0.32, height: s * 0.20)), with: .color(belly))
            let nose = CGRect(x: s * 0.44, y: s * 0.56, width: s * 0.12, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(Color(hex: "F48FB1")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.16, height: s * 0.10)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.69, y: s * 0.54, width: s * 0.16, height: s * 0.10)), with: .color(cheek))

        case .cat:
            var earL = Path()
            earL.move(to: CGPoint(x: s * 0.16, y: s * 0.40))
            earL.addCurve(to: CGPoint(x: s * 0.22, y: s * 0.08), control1: CGPoint(x: s * 0.10, y: s * 0.30), control2: CGPoint(x: s * 0.12, y: s * 0.10))
            earL.addCurve(to: CGPoint(x: s * 0.40, y: s * 0.34), control1: CGPoint(x: s * 0.32, y: s * 0.06), control2: CGPoint(x: s * 0.40, y: s * 0.22))
            earL.closeSubpath()
            var earR = Path()
            earR.move(to: CGPoint(x: s * 0.84, y: s * 0.40))
            earR.addCurve(to: CGPoint(x: s * 0.78, y: s * 0.08), control1: CGPoint(x: s * 0.90, y: s * 0.30), control2: CGPoint(x: s * 0.88, y: s * 0.10))
            earR.addCurve(to: CGPoint(x: s * 0.60, y: s * 0.34), control1: CGPoint(x: s * 0.68, y: s * 0.06), control2: CGPoint(x: s * 0.60, y: s * 0.22))
            earR.closeSubpath()
            context.fill(earL, with: .color(fc))
            context.fill(earR, with: .color(fc))
            var innerEarL = Path()
            innerEarL.move(to: CGPoint(x: s * 0.20, y: s * 0.38))
            innerEarL.addCurve(to: CGPoint(x: s * 0.24, y: s * 0.14), control1: CGPoint(x: s * 0.16, y: s * 0.30), control2: CGPoint(x: s * 0.16, y: s * 0.16))
            innerEarL.addCurve(to: CGPoint(x: s * 0.36, y: s * 0.34), control1: CGPoint(x: s * 0.30, y: s * 0.12), control2: CGPoint(x: s * 0.36, y: s * 0.24))
            innerEarL.closeSubpath()
            var innerEarR = Path()
            innerEarR.move(to: CGPoint(x: s * 0.80, y: s * 0.38))
            innerEarR.addCurve(to: CGPoint(x: s * 0.76, y: s * 0.14), control1: CGPoint(x: s * 0.84, y: s * 0.30), control2: CGPoint(x: s * 0.84, y: s * 0.16))
            innerEarR.addCurve(to: CGPoint(x: s * 0.64, y: s * 0.34), control1: CGPoint(x: s * 0.70, y: s * 0.12), control2: CGPoint(x: s * 0.64, y: s * 0.24))
            innerEarR.closeSubpath()
            context.fill(innerEarL, with: .color(Color(hex: "F48FB1").opacity(0.45)))
            context.fill(innerEarR, with: .color(Color(hex: "F48FB1").opacity(0.45)))
            let head = CGRect(x: s * 0.12, y: s * 0.28, width: s * 0.76, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.30, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.32, y: s * 0.56, width: s * 0.36, height: s * 0.22)), with: .color(belly))
            var nosePath = Path()
            nosePath.move(to: CGPoint(x: s * 0.50, y: s * 0.57))
            nosePath.addCurve(to: CGPoint(x: s * 0.44, y: s * 0.63), control1: CGPoint(x: s * 0.46, y: s * 0.57), control2: CGPoint(x: s * 0.44, y: s * 0.60))
            nosePath.addCurve(to: CGPoint(x: s * 0.56, y: s * 0.63), control1: CGPoint(x: s * 0.48, y: s * 0.66), control2: CGPoint(x: s * 0.52, y: s * 0.66))
            nosePath.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.57), control1: CGPoint(x: s * 0.56, y: s * 0.60), control2: CGPoint(x: s * 0.54, y: s * 0.57))
            nosePath.closeSubpath()
            context.fill(nosePath, with: .color(Color(hex: "F48FB1")))
            for whisker in [(s * 0.34, s * 0.61, s * 0.08, s * 0.57), (s * 0.34, s * 0.65, s * 0.08, s * 0.67),
                            (s * 0.66, s * 0.61, s * 0.92, s * 0.57), (s * 0.66, s * 0.65, s * 0.92, s * 0.67)] {
                var w = Path()
                w.move(to: CGPoint(x: whisker.0, y: whisker.1))
                w.addLine(to: CGPoint(x: whisker.2, y: whisker.3))
                context.stroke(w, with: .color(Color.black.opacity(0.12)), lineWidth: 1.2)
            }
            context.fill(Path(ellipseIn: CGRect(x: s * 0.13, y: s * 0.56, width: s * 0.15, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.56, width: s * 0.15, height: s * 0.09)), with: .color(cheek))

        case .dog:
            let earL = CGRect(x: s * 0.05, y: s * 0.28, width: s * 0.24, height: s * 0.40)
            let earR = CGRect(x: s * 0.71, y: s * 0.28, width: s * 0.24, height: s * 0.40)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.04, dy: s * 0.05)), with: .color(Color(hex: "D7CCC8").opacity(0.5)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.04, dy: s * 0.05)), with: .color(Color(hex: "D7CCC8").opacity(0.5)))
            let head = CGRect(x: s * 0.14, y: s * 0.22, width: s * 0.72, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.24, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.26, y: s * 0.52, width: s * 0.48, height: s * 0.30)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            let nose = CGRect(x: s * 0.40, y: s * 0.52, width: s * 0.20, height: s * 0.13)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.44, y: s * 0.53, width: s * 0.06, height: s * 0.04)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.45, y: s * 0.70, width: s * 0.10, height: s * 0.11)), with: .color(Color(hex: "E91E63").opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .dragon:
            var hornL = Path()
            hornL.move(to: CGPoint(x: s * 0.26, y: s * 0.30))
            hornL.addQuadCurve(to: CGPoint(x: s * 0.18, y: s * 0.06), control: CGPoint(x: s * 0.14, y: s * 0.18))
            hornL.addQuadCurve(to: CGPoint(x: s * 0.36, y: s * 0.28), control: CGPoint(x: s * 0.30, y: s * 0.12))
            hornL.closeSubpath()
            var hornR = Path()
            hornR.move(to: CGPoint(x: s * 0.74, y: s * 0.30))
            hornR.addQuadCurve(to: CGPoint(x: s * 0.82, y: s * 0.06), control: CGPoint(x: s * 0.86, y: s * 0.18))
            hornR.addQuadCurve(to: CGPoint(x: s * 0.64, y: s * 0.28), control: CGPoint(x: s * 0.70, y: s * 0.12))
            hornR.closeSubpath()
            context.fill(hornL, with: .color(Color(hex: "FFA726")))
            context.fill(hornR, with: .color(Color(hex: "FFA726")))
            var spikes = Path()
            for i in 0..<5 {
                let cx = s * (0.35 + CGFloat(i) * 0.075)
                spikes.move(to: CGPoint(x: cx - s * 0.025, y: s * 0.26))
                spikes.addQuadCurve(to: CGPoint(x: cx + s * 0.025, y: s * 0.26), control: CGPoint(x: cx, y: s * 0.15))
                spikes.closeSubpath()
            }
            context.fill(spikes, with: .color(Color(hex: "FFA726").opacity(0.65)))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.26, y: s * 0.48, width: s * 0.48, height: s * 0.30)), with: .color(Color(hex: "FFF9C4").opacity(0.45)))
            let nostrilL = CGRect(x: s * 0.36, y: s * 0.58, width: s * 0.07, height: s * 0.05)
            let nostrilR = CGRect(x: s * 0.57, y: s * 0.58, width: s * 0.07, height: s * 0.05)
            context.fill(Path(ellipseIn: nostrilL), with: .color(darkAccent))
            context.fill(Path(ellipseIn: nostrilR), with: .color(darkAccent))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.73, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .elephant:
            let earL = CGRect(x: s * 0.00, y: s * 0.18, width: s * 0.36, height: s * 0.52)
            let earR = CGRect(x: s * 0.64, y: s * 0.18, width: s * 0.36, height: s * 0.52)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.05, dy: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.2)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.05, dy: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.2)))
            let head = CGRect(x: s * 0.15, y: s * 0.20, width: s * 0.70, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.22, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            var trunk = Path()
            trunk.move(to: CGPoint(x: s * 0.42, y: s * 0.58))
            trunk.addCurve(to: CGPoint(x: s * 0.44, y: s * 0.88), control1: CGPoint(x: s * 0.38, y: s * 0.70), control2: CGPoint(x: s * 0.34, y: s * 0.84))
            trunk.addQuadCurve(to: CGPoint(x: s * 0.56, y: s * 0.86), control: CGPoint(x: s * 0.50, y: s * 0.92))
            trunk.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.58), control1: CGPoint(x: s * 0.66, y: s * 0.84), control2: CGPoint(x: s * 0.62, y: s * 0.70))
            trunk.closeSubpath()
            context.fill(trunk, with: .color(fc))
            context.stroke(trunk, with: .color(darkAccent), lineWidth: 1.2)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.52, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.52, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .fox:
            var earL = Path()
            earL.move(to: CGPoint(x: s * 0.15, y: s * 0.40))
            earL.addCurve(to: CGPoint(x: s * 0.22, y: s * 0.04), control1: CGPoint(x: s * 0.08, y: s * 0.28), control2: CGPoint(x: s * 0.10, y: s * 0.08))
            earL.addCurve(to: CGPoint(x: s * 0.42, y: s * 0.32), control1: CGPoint(x: s * 0.34, y: s * 0.00), control2: CGPoint(x: s * 0.42, y: s * 0.18))
            earL.closeSubpath()
            var earR = Path()
            earR.move(to: CGPoint(x: s * 0.85, y: s * 0.40))
            earR.addCurve(to: CGPoint(x: s * 0.78, y: s * 0.04), control1: CGPoint(x: s * 0.92, y: s * 0.28), control2: CGPoint(x: s * 0.90, y: s * 0.08))
            earR.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.32), control1: CGPoint(x: s * 0.66, y: s * 0.00), control2: CGPoint(x: s * 0.58, y: s * 0.18))
            earR.closeSubpath()
            context.fill(earL, with: .color(fc))
            context.fill(earR, with: .color(fc))
            var tipL = Path()
            tipL.move(to: CGPoint(x: s * 0.22, y: s * 0.04))
            tipL.addCurve(to: CGPoint(x: s * 0.18, y: s * 0.20), control1: CGPoint(x: s * 0.16, y: s * 0.08), control2: CGPoint(x: s * 0.14, y: s * 0.16))
            tipL.addCurve(to: CGPoint(x: s * 0.32, y: s * 0.16), control1: CGPoint(x: s * 0.22, y: s * 0.16), control2: CGPoint(x: s * 0.28, y: s * 0.14))
            tipL.closeSubpath()
            var tipR = Path()
            tipR.move(to: CGPoint(x: s * 0.78, y: s * 0.04))
            tipR.addCurve(to: CGPoint(x: s * 0.82, y: s * 0.20), control1: CGPoint(x: s * 0.84, y: s * 0.08), control2: CGPoint(x: s * 0.86, y: s * 0.16))
            tipR.addCurve(to: CGPoint(x: s * 0.68, y: s * 0.16), control1: CGPoint(x: s * 0.78, y: s * 0.16), control2: CGPoint(x: s * 0.72, y: s * 0.14))
            tipR.closeSubpath()
            context.fill(tipL, with: .color(darkAccent))
            context.fill(tipR, with: .color(darkAccent))
            let head = CGRect(x: s * 0.12, y: s * 0.26, width: s * 0.76, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.28, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            var chin = Path()
            chin.move(to: CGPoint(x: s * 0.22, y: s * 0.52))
            chin.addQuadCurve(to: CGPoint(x: s * 0.78, y: s * 0.52), control: CGPoint(x: s * 0.50, y: s * 0.92))
            chin.closeSubpath()
            context.fill(chin, with: .color(.white.opacity(0.80)))
            let nose = CGRect(x: s * 0.42, y: s * 0.54, width: s * 0.16, height: s * 0.11)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.54, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .frog:
            let head = CGRect(x: s * 0.10, y: s * 0.28, width: s * 0.80, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            let eyeBumpL = CGRect(x: s * 0.14, y: s * 0.16, width: s * 0.30, height: s * 0.30)
            let eyeBumpR = CGRect(x: s * 0.56, y: s * 0.16, width: s * 0.30, height: s * 0.30)
            context.fill(Path(ellipseIn: eyeBumpL), with: .color(fc))
            context.fill(Path(ellipseIn: eyeBumpR), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.18, width: s * 0.16, height: s * 0.10)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.58, y: s * 0.18, width: s * 0.16, height: s * 0.10)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.22, y: s * 0.48, width: s * 0.56, height: s * 0.32)), with: .color(Color(hex: "C8E6C9").opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.13, y: s * 0.58, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.73, y: s * 0.58, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .giraffe:
            var ossiconeL = Path()
            ossiconeL.move(to: CGPoint(x: s * 0.32, y: s * 0.28))
            ossiconeL.addQuadCurve(to: CGPoint(x: s * 0.30, y: s * 0.06), control: CGPoint(x: s * 0.28, y: s * 0.16))
            ossiconeL.addQuadCurve(to: CGPoint(x: s * 0.36, y: s * 0.28), control: CGPoint(x: s * 0.38, y: s * 0.16))
            ossiconeL.closeSubpath()
            var ossiconeR = Path()
            ossiconeR.move(to: CGPoint(x: s * 0.64, y: s * 0.28))
            ossiconeR.addQuadCurve(to: CGPoint(x: s * 0.66, y: s * 0.06), control: CGPoint(x: s * 0.62, y: s * 0.16))
            ossiconeR.addQuadCurve(to: CGPoint(x: s * 0.70, y: s * 0.28), control: CGPoint(x: s * 0.74, y: s * 0.16))
            ossiconeR.closeSubpath()
            context.fill(ossiconeL, with: .color(fc))
            context.fill(ossiconeR, with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.27, y: s * 0.02, width: s * 0.12, height: s * 0.12)), with: .color(Color(hex: "8D6E63")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.63, y: s * 0.02, width: s * 0.12, height: s * 0.12)), with: .color(Color(hex: "8D6E63")))
            let earL = CGRect(x: s * 0.10, y: s * 0.28, width: s * 0.20, height: s * 0.12)
            let earR = CGRect(x: s * 0.70, y: s * 0.28, width: s * 0.20, height: s * 0.12)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            let head = CGRect(x: s * 0.15, y: s * 0.22, width: s * 0.70, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.24, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let spots: [(CGFloat, CGFloat, CGFloat)] = [
                (0.24, 0.36, 0.10), (0.68, 0.38, 0.09), (0.32, 0.70, 0.08),
                (0.60, 0.68, 0.09), (0.46, 0.34, 0.08), (0.44, 0.54, 0.07),
            ]
            for spot in spots {
                context.fill(Path(ellipseIn: CGRect(x: s * spot.0, y: s * spot.1, width: s * spot.2, height: s * spot.2)), with: .color(Color(hex: "8D6E63").opacity(0.30)))
            }
            let muzzle = CGRect(x: s * 0.26, y: s * 0.56, width: s * 0.48, height: s * 0.28)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            let noseRect = CGRect(x: s * 0.40, y: s * 0.58, width: s * 0.20, height: s * 0.12)
            context.fill(Path(ellipseIn: noseRect), with: .color(Color(hex: "8D6E63").opacity(0.45)))
            let nostrilLG = CGRect(x: s * 0.43, y: s * 0.62, width: s * 0.04, height: s * 0.03)
            let nostrilRG = CGRect(x: s * 0.53, y: s * 0.62, width: s * 0.04, height: s * 0.03)
            context.fill(Path(ellipseIn: nostrilLG), with: .color(darkAccent))
            context.fill(Path(ellipseIn: nostrilRG), with: .color(darkAccent))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .hedgehog:
            var spikeBg = Path()
            spikeBg.addEllipse(in: CGRect(x: s * 0.08, y: s * 0.06, width: s * 0.84, height: s * 0.72))
            context.fill(spikeBg, with: .color(Color(hex: "5D4037")))
            let spikeCenter = CGPoint(x: s * 0.50, y: s * 0.40)
            for i in 0..<20 {
                let angle = Double(i) * (Double.pi * 2.0 / 20.0)
                let inner: CGFloat = s * 0.34
                let outer: CGFloat = s * 0.48
                var spike = Path()
                let baseL = CGPoint(x: spikeCenter.x + inner * CGFloat(cos(angle - 0.12)), y: spikeCenter.y + inner * CGFloat(sin(angle - 0.12)))
                let tip = CGPoint(x: spikeCenter.x + outer * CGFloat(cos(angle)), y: spikeCenter.y + outer * CGFloat(sin(angle)))
                let baseR = CGPoint(x: spikeCenter.x + inner * CGFloat(cos(angle + 0.12)), y: spikeCenter.y + inner * CGFloat(sin(angle + 0.12)))
                spike.move(to: baseL)
                spike.addQuadCurve(to: baseR, control: tip)
                spike.closeSubpath()
                let spikeColor = i % 2 == 0 ? Color(hex: "5D4037") : Color(hex: "795548")
                context.fill(spike, with: .color(spikeColor))
            }
            let head = CGRect(x: s * 0.16, y: s * 0.28, width: s * 0.68, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.30, width: s * 0.32, height: s * 0.14)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.28, y: s * 0.52, width: s * 0.44, height: s * 0.28)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            let nose = CGRect(x: s * 0.43, y: s * 0.53, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.47, y: s * 0.54, width: s * 0.04, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .horse:
            var mane = Path()
            mane.move(to: CGPoint(x: s * 0.48, y: s * 0.06))
            mane.addCurve(to: CGPoint(x: s * 0.78, y: s * 0.22), control1: CGPoint(x: s * 0.64, y: s * 0.04), control2: CGPoint(x: s * 0.76, y: s * 0.12))
            mane.addCurve(to: CGPoint(x: s * 0.80, y: s * 0.55), control1: CGPoint(x: s * 0.82, y: s * 0.34), control2: CGPoint(x: s * 0.84, y: s * 0.46))
            mane.addCurve(to: CGPoint(x: s * 0.68, y: s * 0.50), control1: CGPoint(x: s * 0.76, y: s * 0.54), control2: CGPoint(x: s * 0.72, y: s * 0.52))
            mane.addCurve(to: CGPoint(x: s * 0.66, y: s * 0.24), control1: CGPoint(x: s * 0.72, y: s * 0.40), control2: CGPoint(x: s * 0.72, y: s * 0.30))
            mane.addCurve(to: CGPoint(x: s * 0.48, y: s * 0.14), control1: CGPoint(x: s * 0.60, y: s * 0.18), control2: CGPoint(x: s * 0.56, y: s * 0.14))
            mane.closeSubpath()
            context.fill(mane, with: .color(Color(hex: "3E2723")))
            var forelock = Path()
            forelock.move(to: CGPoint(x: s * 0.38, y: s * 0.18))
            forelock.addCurve(to: CGPoint(x: s * 0.48, y: s * 0.06), control1: CGPoint(x: s * 0.38, y: s * 0.10), control2: CGPoint(x: s * 0.42, y: s * 0.06))
            forelock.addCurve(to: CGPoint(x: s * 0.56, y: s * 0.16), control1: CGPoint(x: s * 0.54, y: s * 0.06), control2: CGPoint(x: s * 0.56, y: s * 0.10))
            forelock.addQuadCurve(to: CGPoint(x: s * 0.38, y: s * 0.18), control: CGPoint(x: s * 0.48, y: s * 0.20))
            forelock.closeSubpath()
            context.fill(forelock, with: .color(Color(hex: "3E2723")))
            var earL = Path()
            earL.move(to: CGPoint(x: s * 0.24, y: s * 0.30))
            earL.addQuadCurve(to: CGPoint(x: s * 0.20, y: s * 0.10), control: CGPoint(x: s * 0.16, y: s * 0.18))
            earL.addQuadCurve(to: CGPoint(x: s * 0.34, y: s * 0.26), control: CGPoint(x: s * 0.32, y: s * 0.12))
            earL.closeSubpath()
            var earR = Path()
            earR.move(to: CGPoint(x: s * 0.62, y: s * 0.26))
            earR.addQuadCurve(to: CGPoint(x: s * 0.66, y: s * 0.08), control: CGPoint(x: s * 0.58, y: s * 0.14))
            earR.addQuadCurve(to: CGPoint(x: s * 0.72, y: s * 0.28), control: CGPoint(x: s * 0.76, y: s * 0.14))
            earR.closeSubpath()
            context.fill(earL, with: .color(fc))
            context.fill(earR, with: .color(fc))
            let head = CGRect(x: s * 0.14, y: s * 0.22, width: s * 0.66, height: s * 0.56)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.24, width: s * 0.32, height: s * 0.14)), with: .color(highlight))
            let longMuzzle = CGRect(x: s * 0.22, y: s * 0.52, width: s * 0.50, height: s * 0.34)
            context.fill(Path(ellipseIn: longMuzzle), with: .color(belly))
            var blaze = Path()
            blaze.move(to: CGPoint(x: s * 0.44, y: s * 0.30))
            blaze.addQuadCurve(to: CGPoint(x: s * 0.56, y: s * 0.30), control: CGPoint(x: s * 0.50, y: s * 0.28))
            blaze.addQuadCurve(to: CGPoint(x: s * 0.54, y: s * 0.54), control: CGPoint(x: s * 0.58, y: s * 0.42))
            blaze.addQuadCurve(to: CGPoint(x: s * 0.46, y: s * 0.54), control: CGPoint(x: s * 0.50, y: s * 0.56))
            blaze.addQuadCurve(to: CGPoint(x: s * 0.44, y: s * 0.30), control: CGPoint(x: s * 0.42, y: s * 0.42))
            blaze.closeSubpath()
            context.fill(blaze, with: .color(.white.opacity(0.40)))
            let nostrilL2 = CGRect(x: s * 0.34, y: s * 0.68, width: s * 0.07, height: s * 0.05)
            let nostrilR2 = CGRect(x: s * 0.55, y: s * 0.68, width: s * 0.07, height: s * 0.05)
            context.fill(Path(ellipseIn: nostrilL2), with: .color(darkAccent))
            context.fill(Path(ellipseIn: nostrilR2), with: .color(darkAccent))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.14, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.68, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .lion:
            let maneRect = CGRect(x: s * 0.04, y: s * 0.06, width: s * 0.92, height: s * 0.86)
            context.fill(Path(ellipseIn: maneRect), with: .color(Color(hex: "E65100").opacity(0.45)))
            let maneCenter = CGPoint(x: s * 0.50, y: s * 0.48)
            for i in 0..<24 {
                let angle = Double(i) * (Double.pi * 2.0 / 24.0)
                let inner: CGFloat = s * 0.36
                let outer: CGFloat = s * 0.50
                var tuft = Path()
                let bL = CGPoint(x: maneCenter.x + inner * CGFloat(cos(angle - 0.10)), y: maneCenter.y + inner * CGFloat(sin(angle - 0.10)))
                let tip = CGPoint(x: maneCenter.x + outer * CGFloat(cos(angle)), y: maneCenter.y + outer * CGFloat(sin(angle)))
                let bR = CGPoint(x: maneCenter.x + inner * CGFloat(cos(angle + 0.10)), y: maneCenter.y + inner * CGFloat(sin(angle + 0.10)))
                tuft.move(to: bL)
                tuft.addQuadCurve(to: bR, control: tip)
                tuft.closeSubpath()
                let tuftColor = i % 2 == 0 ? Color(hex: "E65100").opacity(0.40) : Color(hex: "BF360C").opacity(0.30)
                context.fill(tuft, with: .color(tuftColor))
            }
            let earL = CGRect(x: s * 0.12, y: s * 0.20, width: s * 0.18, height: s * 0.16)
            let earR = CGRect(x: s * 0.70, y: s * 0.20, width: s * 0.18, height: s * 0.16)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.5)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.5)))
            let head = CGRect(x: s * 0.15, y: s * 0.24, width: s * 0.70, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.28, y: s * 0.52, width: s * 0.44, height: s * 0.28)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            var nosePath = Path()
            nosePath.move(to: CGPoint(x: s * 0.50, y: s * 0.53))
            nosePath.addCurve(to: CGPoint(x: s * 0.42, y: s * 0.60), control1: CGPoint(x: s * 0.44, y: s * 0.53), control2: CGPoint(x: s * 0.42, y: s * 0.56))
            nosePath.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.64), control: CGPoint(x: s * 0.42, y: s * 0.64))
            nosePath.addQuadCurve(to: CGPoint(x: s * 0.58, y: s * 0.60), control: CGPoint(x: s * 0.58, y: s * 0.64))
            nosePath.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.53), control1: CGPoint(x: s * 0.58, y: s * 0.56), control2: CGPoint(x: s * 0.56, y: s * 0.53))
            nosePath.closeSubpath()
            context.fill(nosePath, with: .color(Color(hex: "5D4037")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.47, y: s * 0.54, width: s * 0.04, height: s * 0.03)), with: .color(Color.white.opacity(0.3)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .monkey:
            let earL = CGRect(x: s * 0.03, y: s * 0.32, width: s * 0.24, height: s * 0.24)
            let earR = CGRect(x: s * 0.73, y: s * 0.32, width: s * 0.24, height: s * 0.24)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.04, dy: s * 0.04)), with: .color(Color(hex: "FFAB91")))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.04, dy: s * 0.04)), with: .color(Color(hex: "FFAB91")))
            let head = CGRect(x: s * 0.13, y: s * 0.20, width: s * 0.74, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let face = CGRect(x: s * 0.22, y: s * 0.40, width: s * 0.56, height: s * 0.40)
            context.fill(Path(ellipseIn: face), with: .color(Color(hex: "FFAB91")))
            let noseM = CGRect(x: s * 0.42, y: s * 0.56, width: s * 0.16, height: s * 0.10)
            context.fill(Path(ellipseIn: noseM), with: .color(Color(hex: "8D6E63").opacity(0.45)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.54, width: s * 0.10, height: s * 0.06)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.10, height: s * 0.06)), with: .color(cheek))

        case .octopus:
            let domeW: CGFloat = s * 0.72
            let domeH: CGFloat = s * 0.52
            let domeX = s * 0.14
            let domeY = s * 0.08
            var dome = Path()
            dome.addEllipse(in: CGRect(x: domeX, y: domeY, width: domeW, height: domeH))
            context.fill(dome, with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: domeX + s * 0.04, y: domeY + s * 0.02, width: s * 0.30, height: s * 0.14)), with: .color(highlight))
            let tentaclePositions: [(CGFloat, CGFloat, CGFloat)] = [
                (0.08, 0.50, -0.08), (0.22, 0.54, -0.04), (0.38, 0.56, 0.00),
                (0.54, 0.56, 0.02), (0.68, 0.54, 0.06), (0.82, 0.50, 0.10),
            ]
            for tent in tentaclePositions {
                let startX = s * tent.0
                let startY = s * tent.1
                let curve = s * tent.2
                var tentacle = Path()
                tentacle.move(to: CGPoint(x: startX, y: startY))
                tentacle.addCurve(
                    to: CGPoint(x: startX + s * 0.02, y: s * 0.92),
                    control1: CGPoint(x: startX - s * 0.06 + curve, y: startY + s * 0.14),
                    control2: CGPoint(x: startX + s * 0.10 + curve, y: s * 0.80)
                )
                tentacle.addCurve(
                    to: CGPoint(x: startX + s * 0.10, y: s * 0.90),
                    control1: CGPoint(x: startX + s * 0.04, y: s * 0.94),
                    control2: CGPoint(x: startX + s * 0.08, y: s * 0.94)
                )
                tentacle.addCurve(
                    to: CGPoint(x: startX + s * 0.08, y: startY),
                    control1: CGPoint(x: startX + s * 0.16 + curve, y: s * 0.78),
                    control2: CGPoint(x: startX + s * 0.02 + curve, y: startY + s * 0.12)
                )
                tentacle.closeSubpath()
                context.fill(tentacle, with: .color(fc))
            }
            for tent in tentaclePositions {
                let startX = s * tent.0
                var sucker = Path()
                sucker.addEllipse(in: CGRect(x: startX + s * 0.02, y: s * 0.72, width: s * 0.04, height: s * 0.04))
                sucker.addEllipse(in: CGRect(x: startX + s * 0.03, y: s * 0.80, width: s * 0.03, height: s * 0.03))
                context.fill(sucker, with: .color(Color.white.opacity(0.25)))
            }
            let octoFace = CGRect(x: s * 0.24, y: s * 0.22, width: s * 0.52, height: s * 0.32)
            context.fill(Path(ellipseIn: octoFace), with: .color(belly))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.14, y: s * 0.42, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.42, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .owl:
            var tuftL = Path()
            tuftL.move(to: CGPoint(x: s * 0.22, y: s * 0.32))
            tuftL.addCurve(to: CGPoint(x: s * 0.18, y: s * 0.06), control1: CGPoint(x: s * 0.14, y: s * 0.24), control2: CGPoint(x: s * 0.10, y: s * 0.10))
            tuftL.addCurve(to: CGPoint(x: s * 0.38, y: s * 0.28), control1: CGPoint(x: s * 0.28, y: s * 0.02), control2: CGPoint(x: s * 0.38, y: s * 0.16))
            tuftL.closeSubpath()
            var tuftR = Path()
            tuftR.move(to: CGPoint(x: s * 0.78, y: s * 0.32))
            tuftR.addCurve(to: CGPoint(x: s * 0.82, y: s * 0.06), control1: CGPoint(x: s * 0.86, y: s * 0.24), control2: CGPoint(x: s * 0.90, y: s * 0.10))
            tuftR.addCurve(to: CGPoint(x: s * 0.62, y: s * 0.28), control1: CGPoint(x: s * 0.72, y: s * 0.02), control2: CGPoint(x: s * 0.62, y: s * 0.16))
            tuftR.closeSubpath()
            context.fill(tuftL, with: .color(fc))
            context.fill(tuftR, with: .color(fc))
            let head = CGRect(x: s * 0.11, y: s * 0.22, width: s * 0.78, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            let eyeRingL = CGRect(x: s * 0.17, y: s * 0.32, width: s * 0.30, height: s * 0.30)
            let eyeRingR = CGRect(x: s * 0.53, y: s * 0.32, width: s * 0.30, height: s * 0.30)
            context.fill(Path(ellipseIn: eyeRingL), with: .color(belly))
            context.fill(Path(ellipseIn: eyeRingR), with: .color(belly))
            var beak = Path()
            beak.move(to: CGPoint(x: s * 0.44, y: s * 0.58))
            beak.addQuadCurve(to: CGPoint(x: s * 0.56, y: s * 0.58), control: CGPoint(x: s * 0.50, y: s * 0.55))
            beak.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.70), control: CGPoint(x: s * 0.54, y: s * 0.66))
            beak.addQuadCurve(to: CGPoint(x: s * 0.44, y: s * 0.58), control: CGPoint(x: s * 0.46, y: s * 0.66))
            beak.closeSubpath()
            context.fill(beak, with: .color(Color(hex: "FFA726")))
            context.stroke(beak, with: .color(Color(hex: "E65100").opacity(0.25)), lineWidth: 0.8)
            let bellyOwl = CGRect(x: s * 0.28, y: s * 0.64, width: s * 0.44, height: s * 0.20)
            context.fill(Path(ellipseIn: bellyOwl), with: .color(belly))
            for i in 0..<3 {
                let vx = s * (0.42 + CGFloat(i) * 0.08)
                var feather = Path()
                feather.move(to: CGPoint(x: vx, y: s * 0.66))
                feather.addLine(to: CGPoint(x: vx, y: s * 0.78))
                context.stroke(feather, with: .color(darkAccent), lineWidth: 0.8)
            }

        case .panda:
            let earL = CGRect(x: s * 0.10, y: s * 0.14, width: s * 0.24, height: s * 0.24)
            let earR = CGRect(x: s * 0.66, y: s * 0.14, width: s * 0.24, height: s * 0.24)
            context.fill(Path(ellipseIn: earL), with: .color(.black.opacity(0.80)))
            context.fill(Path(ellipseIn: earR), with: .color(.black.opacity(0.80)))
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.38, height: s * 0.16)), with: .color(highlight))
            let patchL = CGRect(x: s * 0.19, y: s * 0.34, width: s * 0.24, height: s * 0.22)
            let patchR = CGRect(x: s * 0.57, y: s * 0.34, width: s * 0.24, height: s * 0.22)
            context.fill(Path(ellipseIn: patchL), with: .color(.black.opacity(0.70)))
            context.fill(Path(ellipseIn: patchR), with: .color(.black.opacity(0.70)))
            let nose = CGRect(x: s * 0.43, y: s * 0.58, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.59, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.58, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.73, y: s * 0.58, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .raccoon:
            let earL = CGRect(x: s * 0.12, y: s * 0.14, width: s * 0.20, height: s * 0.20)
            let earR = CGRect(x: s * 0.68, y: s * 0.14, width: s * 0.20, height: s * 0.20)
            context.fill(Path(ellipseIn: earL), with: .color(fc))
            context.fill(Path(ellipseIn: earR), with: .color(fc))
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "F48FB1").opacity(0.25)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "F48FB1").opacity(0.25)))
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            let mask = CGRect(x: s * 0.16, y: s * 0.34, width: s * 0.68, height: s * 0.20)
            context.fill(Path(roundedRect: mask, cornerRadius: s * 0.08), with: .color(.black.opacity(0.52)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.36, width: s * 0.16, height: s * 0.06)), with: .color(Color.white.opacity(0.06)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.64, y: s * 0.36, width: s * 0.16, height: s * 0.06)), with: .color(Color.white.opacity(0.06)))
            var stripe = Path()
            stripe.move(to: CGPoint(x: s * 0.50, y: s * 0.24))
            stripe.addLine(to: CGPoint(x: s * 0.50, y: s * 0.34))
            context.stroke(stripe, with: .color(Color.white.opacity(0.45)), lineWidth: s * 0.04)
            let muzzle = CGRect(x: s * 0.32, y: s * 0.52, width: s * 0.36, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            let noseR = CGRect(x: s * 0.43, y: s * 0.54, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: noseR), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))

        case .seal:
            let head = CGRect(x: s * 0.12, y: s * 0.20, width: s * 0.76, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.22, y: s * 0.44, width: s * 0.56, height: s * 0.36)), with: .color(belly))
            var flipperL = Path()
            flipperL.addEllipse(in: CGRect(x: s * 0.04, y: s * 0.52, width: s * 0.20, height: s * 0.24))
            var flipperR = Path()
            flipperR.addEllipse(in: CGRect(x: s * 0.76, y: s * 0.52, width: s * 0.20, height: s * 0.24))
            context.fill(flipperL, with: .color(fc))
            context.fill(flipperR, with: .color(fc))
            let noseS = CGRect(x: s * 0.42, y: s * 0.52, width: s * 0.16, height: s * 0.10)
            context.fill(Path(ellipseIn: noseS), with: .color(noseColor.opacity(0.8)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.45, y: s * 0.53, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))
            for dot in [(s * 0.32, s * 0.60), (s * 0.28, s * 0.64), (s * 0.66, s * 0.60), (s * 0.70, s * 0.64)] {
                context.fill(Path(ellipseIn: CGRect(x: dot.0, y: dot.1, width: s * 0.025, height: s * 0.025)), with: .color(darkAccent))
            }
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .sloth:
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            let patchL = CGRect(x: s * 0.19, y: s * 0.34, width: s * 0.24, height: s * 0.24)
            let patchR = CGRect(x: s * 0.57, y: s * 0.34, width: s * 0.24, height: s * 0.24)
            context.fill(Path(ellipseIn: patchL), with: .color(Color(hex: "5D4037").opacity(0.30)))
            context.fill(Path(ellipseIn: patchR), with: .color(Color(hex: "5D4037").opacity(0.30)))
            let muzzle = CGRect(x: s * 0.30, y: s * 0.54, width: s * 0.40, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            let noseSloth = CGRect(x: s * 0.43, y: s * 0.56, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: noseSloth), with: .color(noseColor.opacity(0.8)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.57, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.73, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .turtle:
            var shell = Path()
            shell.addEllipse(in: CGRect(x: s * 0.12, y: s * 0.34, width: s * 0.76, height: s * 0.56))
            context.fill(shell, with: .color(Color(hex: "689F38")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.38, width: s * 0.36, height: s * 0.12)), with: .color(Color(hex: "7CB342").opacity(0.35)))
            let shellCenter = CGPoint(x: s * 0.50, y: s * 0.62)
            for i in 0..<6 {
                var hex = Path()
                let hSize: CGFloat = i == 0 ? s * 0.12 : s * 0.07
                let offset: CGPoint = i == 0 ? .zero :
                    [CGPoint(x: -s * 0.14, y: -s * 0.06), CGPoint(x: s * 0.14, y: -s * 0.06),
                     CGPoint(x: -s * 0.10, y: s * 0.10), CGPoint(x: s * 0.10, y: s * 0.10),
                     CGPoint(x: 0, y: -s * 0.14)][i - 1]
                let center = CGPoint(x: shellCenter.x + offset.x, y: shellCenter.y + offset.y)
                for j in 0..<6 {
                    let a = Double(j) * (Double.pi / 3.0) - Double.pi / 6.0
                    let px = center.x + hSize * CGFloat(cos(a))
                    let py = center.y + hSize * CGFloat(sin(a))
                    if j == 0 { hex.move(to: CGPoint(x: px, y: py)) }
                    else { hex.addLine(to: CGPoint(x: px, y: py)) }
                }
                hex.closeSubpath()
                context.fill(hex, with: .color(Color(hex: "558B2F").opacity(0.25)))
                context.stroke(hex, with: .color(Color(hex: "558B2F").opacity(0.35)), lineWidth: 1.2)
            }
            let head = CGRect(x: s * 0.18, y: s * 0.14, width: s * 0.64, height: s * 0.54)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.22, y: s * 0.16, width: s * 0.30, height: s * 0.14)), with: .color(highlight))
            let turtleMuzzle = CGRect(x: s * 0.30, y: s * 0.40, width: s * 0.40, height: s * 0.22)
            context.fill(Path(ellipseIn: turtleMuzzle), with: .color(belly))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.44, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.68, y: s * 0.44, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .unicorn:
            var horn = Path()
            horn.move(to: CGPoint(x: s * 0.50, y: s * 0.00))
            horn.addQuadCurve(to: CGPoint(x: s * 0.42, y: s * 0.28), control: CGPoint(x: s * 0.38, y: s * 0.14))
            horn.addQuadCurve(to: CGPoint(x: s * 0.58, y: s * 0.28), control: CGPoint(x: s * 0.50, y: s * 0.32))
            horn.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.00), control: CGPoint(x: s * 0.62, y: s * 0.14))
            horn.closeSubpath()
            let hornGrad = Gradient(colors: [Color(hex: "FFD54F"), Color(hex: "FFA726"), Color(hex: "FFD54F")])
            context.fill(horn, with: .linearGradient(hornGrad, startPoint: CGPoint(x: s * 0.44, y: 0), endPoint: CGPoint(x: s * 0.56, y: s * 0.28)))
            for stripe in [0.08, 0.14, 0.20] as [CGFloat] {
                var line = Path()
                let y = s * stripe
                let left = s * 0.44 + (y / (s * 0.28)) * s * 0.06
                let right = s * 0.56 - (y / (s * 0.28)) * s * 0.06
                line.move(to: CGPoint(x: left - s * 0.02, y: y))
                line.addLine(to: CGPoint(x: right + s * 0.02, y: y + s * 0.02))
                context.stroke(line, with: .color(Color(hex: "E65100").opacity(0.2)), lineWidth: 1.5)
            }
            var maneU = Path()
            maneU.move(to: CGPoint(x: s * 0.60, y: s * 0.14))
            maneU.addCurve(to: CGPoint(x: s * 0.82, y: s * 0.56), control1: CGPoint(x: s * 0.88, y: s * 0.18), control2: CGPoint(x: s * 0.90, y: s * 0.44))
            maneU.addCurve(to: CGPoint(x: s * 0.70, y: s * 0.50), control1: CGPoint(x: s * 0.78, y: s * 0.54), control2: CGPoint(x: s * 0.74, y: s * 0.52))
            maneU.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.20), control1: CGPoint(x: s * 0.78, y: s * 0.38), control2: CGPoint(x: s * 0.76, y: s * 0.22))
            maneU.closeSubpath()
            let maneGrad = Gradient(colors: [Color(hex: "CE93D8"), Color(hex: "F48FB1"), Color(hex: "81D4FA")])
            context.fill(maneU, with: .linearGradient(maneGrad, startPoint: CGPoint(x: s * 0.60, y: s * 0.14), endPoint: CGPoint(x: s * 0.82, y: s * 0.56)))
            var earUL = Path()
            earUL.move(to: CGPoint(x: s * 0.22, y: s * 0.30))
            earUL.addQuadCurve(to: CGPoint(x: s * 0.20, y: s * 0.14), control: CGPoint(x: s * 0.14, y: s * 0.20))
            earUL.addQuadCurve(to: CGPoint(x: s * 0.34, y: s * 0.28), control: CGPoint(x: s * 0.30, y: s * 0.12))
            earUL.closeSubpath()
            var earUR = Path()
            earUR.move(to: CGPoint(x: s * 0.62, y: s * 0.26))
            earUR.addQuadCurve(to: CGPoint(x: s * 0.64, y: s * 0.12), control: CGPoint(x: s * 0.58, y: s * 0.16))
            earUR.addQuadCurve(to: CGPoint(x: s * 0.72, y: s * 0.28), control: CGPoint(x: s * 0.74, y: s * 0.14))
            earUR.closeSubpath()
            context.fill(earUL, with: .color(fc))
            context.fill(earUR, with: .color(fc))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.66, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(fc))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let muzzleU = CGRect(x: s * 0.24, y: s * 0.54, width: s * 0.46, height: s * 0.26)
            context.fill(Path(ellipseIn: muzzleU), with: .color(belly))
            let nostrilUL = CGRect(x: s * 0.36, y: s * 0.66, width: s * 0.05, height: s * 0.04)
            let nostrilUR = CGRect(x: s * 0.55, y: s * 0.66, width: s * 0.05, height: s * 0.04)
            context.fill(Path(ellipseIn: nostrilUL), with: .color(darkAccent))
            context.fill(Path(ellipseIn: nostrilUR), with: .color(darkAccent))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.67, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
        }
    }

    private func drawEyes(context: inout GraphicsContext, style: EyeStyle, size: CGFloat) {
        let s = size
        let eyeY: CGFloat = s * 0.42
        let leftX: CGFloat = s * 0.32
        let rightX: CGFloat = s * 0.58
        let eyeSize: CGFloat = s * 0.09
        let outlineColor = Color.black.opacity(0.10)
        let outlineW: CGFloat = max(1.0, s * 0.006)

        switch style {
        case .normal:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            let whiteR = CGRect(x: rightX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(outlineColor), lineWidth: outlineW)
            context.stroke(Path(ellipseIn: whiteR), with: .color(outlineColor), lineWidth: outlineW)
            let irisL = CGRect(x: leftX - eyeSize * 0.05, y: eyeY - eyeSize * 0.05, width: eyeSize * 1.1, height: eyeSize * 1.2)
            let irisR = CGRect(x: rightX - eyeSize * 0.05, y: eyeY - eyeSize * 0.05, width: eyeSize * 1.1, height: eyeSize * 1.2)
            context.fill(Path(ellipseIn: irisL), with: .color(Color(hex: "2C2C2C")))
            context.fill(Path(ellipseIn: irisR), with: .color(Color(hex: "2C2C2C")))
            let pupilSize = eyeSize * 0.65
            let pupilOffX = eyeSize * 0.18
            let pupilOffY = eyeSize * 0.22
            context.fill(Path(ellipseIn: CGRect(x: leftX + pupilOffX, y: eyeY + pupilOffY, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.92)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + pupilOffX, y: eyeY + pupilOffY, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.92)))
            let shineSize = eyeSize * 0.42
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.40, y: eyeY + eyeSize * 0.05, width: shineSize, height: shineSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.40, y: eyeY + eyeSize * 0.05, width: shineSize, height: shineSize)), with: .color(.white))
            let shine2 = eyeSize * 0.22
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.08, y: eyeY + eyeSize * 0.62, width: shine2, height: shine2)), with: .color(.white.opacity(0.60)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.08, y: eyeY + eyeSize * 0.62, width: shine2, height: shine2)), with: .color(.white.opacity(0.60)))

        case .happy:
            var arcL = Path()
            arcL.move(to: CGPoint(x: leftX - eyeSize * 0.2, y: eyeY + eyeSize * 0.5))
            arcL.addQuadCurve(to: CGPoint(x: leftX + eyeSize * 1.2, y: eyeY + eyeSize * 0.5), control: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY - eyeSize * 0.5))
            context.stroke(arcL, with: .color(Color(hex: "2C2C2C")), lineWidth: s * 0.032)
            var arcR = Path()
            arcR.move(to: CGPoint(x: rightX - eyeSize * 0.2, y: eyeY + eyeSize * 0.5))
            arcR.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.2, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY - eyeSize * 0.5))
            context.stroke(arcR, with: .color(Color(hex: "2C2C2C")), lineWidth: s * 0.032)

        case .big:
            let bigSize = eyeSize * 2.0
            let bigY = eyeY - eyeSize * 0.50
            let bigLX = leftX - eyeSize * 0.50
            let bigRX = rightX - eyeSize * 0.50
            let bigL = CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)
            let bigR = CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)
            context.fill(Path(ellipseIn: bigL), with: .color(.white))
            context.fill(Path(ellipseIn: bigR), with: .color(.white))
            context.stroke(Path(ellipseIn: bigL), with: .color(outlineColor), lineWidth: outlineW)
            context.stroke(Path(ellipseIn: bigR), with: .color(outlineColor), lineWidth: outlineW)
            let irisSize = bigSize * 0.6
            let irisOff = (bigSize - irisSize) / 2
            context.fill(Path(ellipseIn: CGRect(x: bigLX + irisOff, y: bigY + irisOff * 0.7, width: irisSize, height: irisSize)), with: .color(Color(hex: "2C2C2C")))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + irisOff, y: bigY + irisOff * 0.7, width: irisSize, height: irisSize)), with: .color(Color(hex: "2C2C2C")))
            let pupilSize = bigSize * 0.38
            let pupilOff = bigSize * 0.32
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff, y: bigY + pupilOff * 0.75, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.92)))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff, y: bigY + pupilOff * 0.75, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.92)))
            let shSize = pupilSize * 0.45
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff + pupilSize * 0.30, y: bigY + pupilOff * 0.75 + pupilSize * 0.08, width: shSize, height: shSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff + pupilSize * 0.30, y: bigY + pupilOff * 0.75 + pupilSize * 0.08, width: shSize, height: shSize)), with: .color(.white))
            let sh2 = pupilSize * 0.22
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff + pupilSize * 0.08, y: bigY + pupilOff * 0.75 + pupilSize * 0.55, width: sh2, height: sh2)), with: .color(.white.opacity(0.55)))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff + pupilSize * 0.08, y: bigY + pupilOff * 0.75 + pupilSize * 0.55, width: sh2, height: sh2)), with: .color(.white.opacity(0.55)))

        case .sleepy:
            var lidL = Path()
            lidL.move(to: CGPoint(x: leftX - eyeSize * 0.15, y: eyeY + eyeSize * 0.5))
            lidL.addQuadCurve(to: CGPoint(x: leftX + eyeSize * 1.15, y: eyeY + eyeSize * 0.5), control: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.85))
            context.stroke(lidL, with: .color(.black.opacity(0.85)), lineWidth: s * 0.024)
            var lidR = Path()
            lidR.move(to: CGPoint(x: rightX - eyeSize * 0.15, y: eyeY + eyeSize * 0.5))
            lidR.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.15, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.85))
            context.stroke(lidR, with: .color(.black.opacity(0.85)), lineWidth: s * 0.024)
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.01, y: eyeY + eyeSize * 0.15))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.32))
            context.stroke(browL, with: .color(.black.opacity(0.40)), lineWidth: s * 0.016)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.15))
            browR.addLine(to: CGPoint(x: rightX - s * 0.01, y: eyeY + eyeSize * 0.32))
            context.stroke(browR, with: .color(.black.opacity(0.40)), lineWidth: s * 0.016)

        case .wink:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(outlineColor), lineWidth: outlineW)
            let irisWL = CGRect(x: leftX - eyeSize * 0.05, y: eyeY - eyeSize * 0.05, width: eyeSize * 1.1, height: eyeSize * 1.2)
            context.fill(Path(ellipseIn: irisWL), with: .color(Color(hex: "2C2C2C")))
            let pupilW = eyeSize * 0.65
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.18, y: eyeY + eyeSize * 0.22, width: pupilW, height: pupilW)), with: .color(.black.opacity(0.92)))
            let shineSize = eyeSize * 0.42
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.40, y: eyeY + eyeSize * 0.05, width: shineSize, height: shineSize)), with: .color(.white))
            let sh2w = eyeSize * 0.20
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.08, y: eyeY + eyeSize * 0.60, width: sh2w, height: sh2w)), with: .color(.white.opacity(0.55)))
            var winkArc = Path()
            winkArc.move(to: CGPoint(x: rightX - eyeSize * 0.2, y: eyeY + eyeSize * 0.5))
            winkArc.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.2, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY - eyeSize * 0.4))
            context.stroke(winkArc, with: .color(Color(hex: "2C2C2C")), lineWidth: s * 0.032)

        case .stars:
            drawStar(context: &context, center: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.5), radius: eyeSize * 0.95, color: Color(hex: "FFD54F"))
            drawStar(context: &context, center: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.5), radius: eyeSize * 0.95, color: Color(hex: "FFD54F"))
            let starShine = eyeSize * 0.22
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.28, y: eyeY + eyeSize * 0.18, width: starShine, height: starShine)), with: .color(.white.opacity(0.55)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.28, y: eyeY + eyeSize * 0.18, width: starShine, height: starShine)), with: .color(.white.opacity(0.55)))

        case .heart:
            drawHeart(context: &context, center: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4), size: eyeSize * 1.35, color: Color(hex: "E91E63"))
            drawHeart(context: &context, center: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4), size: eyeSize * 1.35, color: Color(hex: "E91E63"))
            let heartShine = eyeSize * 0.20
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.12, y: eyeY + eyeSize * 0.08, width: heartShine, height: heartShine)), with: .color(.white.opacity(0.45)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.12, y: eyeY + eyeSize * 0.08, width: heartShine, height: heartShine)), with: .color(.white.opacity(0.45)))

        case .determined:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.6, height: eyeSize * 1.5)
            let whiteR = CGRect(x: rightX - eyeSize * 0.3, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.6, height: eyeSize * 1.5)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            let shineD = eyeSize * 0.32
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.48, y: eyeY + eyeSize * 0.12, width: shineD, height: shineD)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.48, y: eyeY + eyeSize * 0.12, width: shineD, height: shineD)), with: .color(.white))
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.02, y: eyeY - eyeSize * 0.35))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.65))
            context.stroke(browL, with: .color(.black.opacity(0.65)), lineWidth: s * 0.030)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.35))
            browR.addLine(to: CGPoint(x: rightX - s * 0.02, y: eyeY - eyeSize * 0.65))
            context.stroke(browR, with: .color(.black.opacity(0.65)), lineWidth: s * 0.030)

        case .surprised:
            let bigSize = eyeSize * 1.9
            let bigY = eyeY - eyeSize * 0.40
            let sL = CGRect(x: leftX - eyeSize * 0.40, y: bigY, width: bigSize, height: bigSize)
            let sR = CGRect(x: rightX - eyeSize * 0.40, y: bigY, width: bigSize, height: bigSize)
            context.fill(Path(ellipseIn: sL), with: .color(.white))
            context.fill(Path(ellipseIn: sR), with: .color(.white))
            context.stroke(Path(ellipseIn: sL), with: .color(outlineColor), lineWidth: outlineW)
            context.stroke(Path(ellipseIn: sR), with: .color(outlineColor), lineWidth: outlineW)
            let irisS = bigSize * 0.55
            let irisOff = (bigSize - irisS) / 2
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.40 + irisOff, y: bigY + irisOff * 0.85, width: irisS, height: irisS)), with: .color(Color(hex: "2C2C2C")))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.40 + irisOff, y: bigY + irisOff * 0.85, width: irisS, height: irisS)), with: .color(Color(hex: "2C2C2C")))
            let pupilSize = bigSize * 0.35
            let pupilOff = (bigSize - pupilSize) / 2
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.40 + pupilOff, y: bigY + pupilOff * 0.85, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.92)))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.40 + pupilOff, y: bigY + pupilOff * 0.85, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.92)))
            let shSize = pupilSize * 0.45
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.40 + pupilOff + pupilSize * 0.28, y: bigY + pupilOff * 0.85 + pupilSize * 0.06, width: shSize, height: shSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.40 + pupilOff + pupilSize * 0.28, y: bigY + pupilOff * 0.85 + pupilSize * 0.06, width: shSize, height: shSize)), with: .color(.white))

        case .cool:
            let glassW = eyeSize * 2.1
            let glassH = eyeSize * 1.35
            let glassY = eyeY - eyeSize * 0.15
            let glassLX = leftX - eyeSize * 0.55
            let glassRX = rightX - eyeSize * 0.55
            let glassLRect = CGRect(x: glassLX, y: glassY, width: glassW, height: glassH)
            let glassRRect = CGRect(x: glassRX, y: glassY, width: glassW, height: glassH)
            context.fill(Path(roundedRect: glassLRect, cornerRadius: 5), with: .color(.black.opacity(0.82)))
            context.fill(Path(roundedRect: glassRRect, cornerRadius: 5), with: .color(.black.opacity(0.82)))
            var bridge = Path()
            bridge.move(to: CGPoint(x: glassLX + glassW, y: glassY + glassH * 0.4))
            bridge.addLine(to: CGPoint(x: glassRX, y: glassY + glassH * 0.4))
            context.stroke(bridge, with: .color(.black.opacity(0.82)), lineWidth: s * 0.024)
            let shineW = glassW * 0.22
            let shineH = glassH * 0.20
            context.fill(Path(roundedRect: CGRect(x: glassLX + glassW * 0.10, y: glassY + glassH * 0.16, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.30)))
            context.fill(Path(roundedRect: CGRect(x: glassRX + glassW * 0.10, y: glassY + glassH * 0.16, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.30)))
        }
    }

    private func drawMouth(context: inout GraphicsContext, style: MouthStyle, size: CGFloat) {
        let s = size
        let mouthY: CGFloat = s * 0.63
        let centerX: CGFloat = s * 0.50
        let mouthW: CGFloat = s * 0.13

        switch style {
        case .smile:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.1, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.1, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.10))
            context.stroke(path, with: .color(Color(hex: "2C2C2C").opacity(0.80)), lineWidth: s * 0.026)

        case .bigSmile:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.4, y: mouthY - s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.4, y: mouthY - s * 0.01), control: CGPoint(x: centerX, y: mouthY + s * 0.15))
            path.closeSubpath()
            context.fill(path, with: .color(Color(hex: "2C2C2C").opacity(0.80)))
            var teethTop = Path()
            teethTop.move(to: CGPoint(x: centerX - mouthW * 1.4, y: mouthY - s * 0.01))
            teethTop.addLine(to: CGPoint(x: centerX + mouthW * 1.4, y: mouthY - s * 0.01))
            teethTop.addLine(to: CGPoint(x: centerX + mouthW * 1.4, y: mouthY + s * 0.018))
            teethTop.addLine(to: CGPoint(x: centerX - mouthW * 1.4, y: mouthY + s * 0.018))
            teethTop.closeSubpath()
            context.fill(teethTop, with: .color(.white.opacity(0.90)))
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: centerX - s * 0.055, y: mouthY + s * 0.025, width: s * 0.11, height: s * 0.075))
            context.fill(tongue, with: .color(Color(hex: "E57373")))

        case .tongue:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.07))
            context.stroke(path, with: .color(.black.opacity(0.70)), lineWidth: s * 0.024)
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: centerX - s * 0.035, y: mouthY + s * 0.02, width: s * 0.07, height: s * 0.09))
            context.fill(tongue, with: .color(Color(hex: "E91E63")))

        case .oh:
            let ohW = s * 0.07
            let ohH = s * 0.09
            let ohRect = CGRect(x: centerX - ohW * 0.5, y: mouthY - ohH * 0.3, width: ohW, height: ohH)
            context.fill(Path(ellipseIn: ohRect), with: .color(.black.opacity(0.70)))
            context.fill(Path(ellipseIn: CGRect(x: centerX - ohW * 0.2, y: mouthY - ohH * 0.15, width: ohW * 0.25, height: ohH * 0.2)), with: .color(.white.opacity(0.2)))

        case .catMouth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY + s * 0.02))
            path.addQuadCurve(to: CGPoint(x: centerX, y: mouthY - s * 0.01), control: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.07))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY + s * 0.02), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.07))
            context.stroke(path, with: .color(.black.opacity(0.70)), lineWidth: s * 0.022)

        case .smirk:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY - s * 0.03), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.08))
            context.stroke(path, with: .color(.black.opacity(0.70)), lineWidth: s * 0.024)

        case .teeth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.12))
            path.closeSubpath()
            context.fill(path, with: .color(.black.opacity(0.70)))
            var teethPath = Path()
            teethPath.move(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY + s * 0.028))
            teethPath.addLine(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY + s * 0.028))
            teethPath.closeSubpath()
            context.fill(teethPath, with: .color(.white))

        case .tiny:
            let dotSize = s * 0.038
            context.fill(Path(ellipseIn: CGRect(x: centerX - dotSize * 0.5, y: mouthY, width: dotSize, height: dotSize)), with: .color(.black.opacity(0.55)))

        case .flat:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.8, y: mouthY + s * 0.01))
            path.addLine(to: CGPoint(x: centerX + mouthW * 0.8, y: mouthY + s * 0.01))
            context.stroke(path, with: .color(.black.opacity(0.70)), lineWidth: s * 0.024)

        case .wavy:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addCurve(
                to: CGPoint(x: centerX + mouthW, y: mouthY),
                control1: CGPoint(x: centerX - mouthW * 0.4, y: mouthY + s * 0.07),
                control2: CGPoint(x: centerX + mouthW * 0.4, y: mouthY - s * 0.05)
            )
            context.stroke(path, with: .color(.black.opacity(0.70)), lineWidth: s * 0.024)
        }
    }

    private func drawAccessory(context: inout GraphicsContext, type: AccessoryType, size: CGFloat) {
        let s = size
        guard type != .none else { return }

        switch type {
        case .none: break

        case .crown:
            var crown = Path()
            crown.move(to: CGPoint(x: s * 0.23, y: s * 0.28))
            crown.addLine(to: CGPoint(x: s * 0.26, y: s * 0.12))
            crown.addLine(to: CGPoint(x: s * 0.35, y: s * 0.21))
            crown.addLine(to: CGPoint(x: s * 0.44, y: s * 0.08))
            crown.addLine(to: CGPoint(x: s * 0.50, y: s * 0.19))
            crown.addLine(to: CGPoint(x: s * 0.56, y: s * 0.08))
            crown.addLine(to: CGPoint(x: s * 0.65, y: s * 0.21))
            crown.addLine(to: CGPoint(x: s * 0.74, y: s * 0.12))
            crown.addLine(to: CGPoint(x: s * 0.77, y: s * 0.28))
            crown.closeSubpath()
            context.fill(crown, with: .color(Color(hex: "FFD54F")))
            context.stroke(crown, with: .color(Color(hex: "FFA726")), lineWidth: 1.5)
            let gemSize = s * 0.04
            context.fill(Path(ellipseIn: CGRect(x: s * 0.39, y: s * 0.20, width: gemSize, height: gemSize)), with: .color(Color(hex: "E91E63")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.48, y: s * 0.18, width: gemSize, height: gemSize)), with: .color(Color(hex: "42A5F5")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.57, y: s * 0.20, width: gemSize, height: gemSize)), with: .color(Color(hex: "66BB6A")))

        case .gradCap:
            var cap = Path()
            cap.move(to: CGPoint(x: s * 0.50, y: s * 0.08))
            cap.addLine(to: CGPoint(x: s * 0.20, y: s * 0.24))
            cap.addLine(to: CGPoint(x: s * 0.50, y: s * 0.32))
            cap.addLine(to: CGPoint(x: s * 0.80, y: s * 0.24))
            cap.closeSubpath()
            context.fill(cap, with: .color(.black.opacity(0.85)))
            let boardRect = CGRect(x: s * 0.28, y: s * 0.22, width: s * 0.44, height: s * 0.06)
            context.fill(Path(roundedRect: boardRect, cornerRadius: 2), with: .color(.black.opacity(0.85)))
            var tassel = Path()
            tassel.move(to: CGPoint(x: s * 0.50, y: s * 0.24))
            tassel.addCurve(to: CGPoint(x: s * 0.74, y: s * 0.40), control1: CGPoint(x: s * 0.55, y: s * 0.28), control2: CGPoint(x: s * 0.70, y: s * 0.36))
            context.stroke(tassel, with: .color(Color(hex: "FFD54F")), lineWidth: 2)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.38, width: s * 0.06, height: s * 0.06)), with: .color(Color(hex: "FFD54F")))

        case .stethoscope:
            var stetho = Path()
            stetho.move(to: CGPoint(x: s * 0.35, y: s * 0.30))
            stetho.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.85), control1: CGPoint(x: s * 0.20, y: s * 0.50), control2: CGPoint(x: s * 0.25, y: s * 0.80))
            stetho.addCurve(to: CGPoint(x: s * 0.65, y: s * 0.30), control1: CGPoint(x: s * 0.75, y: s * 0.80), control2: CGPoint(x: s * 0.80, y: s * 0.50))
            context.stroke(stetho, with: .color(Color(hex: "78909C")), lineWidth: 2.5)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.43, y: s * 0.79, width: s * 0.14, height: s * 0.14)), with: .color(Color(hex: "546E7A")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.82, width: s * 0.04, height: s * 0.04)), with: .color(Color.white.opacity(0.25)))

        case .topHat:
            let brimRect = CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.64, height: s * 0.06)
            context.fill(Path(roundedRect: brimRect, cornerRadius: 3), with: .color(.black.opacity(0.85)))
            let hatBody = CGRect(x: s * 0.28, y: s * 0.00, width: s * 0.44, height: s * 0.24)
            context.fill(Path(roundedRect: hatBody, cornerRadius: 4), with: .color(.black.opacity(0.85)))
            var bandPath = Path()
            bandPath.addRect(CGRect(x: s * 0.28, y: s * 0.16, width: s * 0.44, height: s * 0.04))
            context.fill(bandPath, with: .color(Color(hex: "E91E63")))
            context.fill(Path(roundedRect: CGRect(x: s * 0.30, y: s * 0.02, width: s * 0.10, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.12)))

        case .bow:
            var bowL = Path()
            bowL.addEllipse(in: CGRect(x: s * 0.28, y: s * 0.14, width: s * 0.18, height: s * 0.14))
            var bowR = Path()
            bowR.addEllipse(in: CGRect(x: s * 0.54, y: s * 0.14, width: s * 0.18, height: s * 0.14))
            context.fill(bowL, with: .color(Color(hex: "E91E63")))
            context.fill(bowR, with: .color(Color(hex: "E91E63")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.32, y: s * 0.16, width: s * 0.08, height: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.45)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.58, y: s * 0.16, width: s * 0.08, height: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.45)))
            let knot = CGRect(x: s * 0.46, y: s * 0.17, width: s * 0.08, height: s * 0.08)
            context.fill(Path(ellipseIn: knot), with: .color(Color(hex: "C2185B")))

        case .glasses:
            let glassSize = s * 0.16
            let lensL = CGRect(x: s * 0.19, y: s * 0.37, width: glassSize, height: glassSize)
            let lensR = CGRect(x: s * 0.56, y: s * 0.37, width: glassSize, height: glassSize)
            context.fill(Path(ellipseIn: lensL), with: .color(Color.white.opacity(0.12)))
            context.fill(Path(ellipseIn: lensR), with: .color(Color.white.opacity(0.12)))
            context.stroke(Path(ellipseIn: lensL), with: .color(.black.opacity(0.75)), lineWidth: 2.5)
            context.stroke(Path(ellipseIn: lensR), with: .color(.black.opacity(0.75)), lineWidth: 2.5)
            var bridge = Path()
            bridge.move(to: CGPoint(x: s * 0.35, y: s * 0.44))
            bridge.addQuadCurve(to: CGPoint(x: s * 0.56, y: s * 0.44), control: CGPoint(x: s * 0.455, y: s * 0.40))
            context.stroke(bridge, with: .color(.black.opacity(0.75)), lineWidth: 2.5)

        case .bandana:
            var bandana = Path()
            bandana.move(to: CGPoint(x: s * 0.12, y: s * 0.30))
            bandana.addQuadCurve(to: CGPoint(x: s * 0.88, y: s * 0.30), control: CGPoint(x: s * 0.50, y: s * 0.24))
            bandana.addLine(to: CGPoint(x: s * 0.88, y: s * 0.35))
            bandana.addQuadCurve(to: CGPoint(x: s * 0.12, y: s * 0.35), control: CGPoint(x: s * 0.50, y: s * 0.29))
            bandana.closeSubpath()
            context.fill(bandana, with: .color(Color(hex: "E53935")))
            var knot = Path()
            knot.move(to: CGPoint(x: s * 0.84, y: s * 0.32))
            knot.addLine(to: CGPoint(x: s * 0.94, y: s * 0.40))
            knot.addLine(to: CGPoint(x: s * 0.90, y: s * 0.42))
            knot.addLine(to: CGPoint(x: s * 0.82, y: s * 0.36))
            knot.closeSubpath()
            context.fill(knot, with: .color(Color(hex: "E53935")))
            var dots = Path()
            dots.addEllipse(in: CGRect(x: s * 0.36, y: s * 0.28, width: s * 0.03, height: s * 0.03))
            dots.addEllipse(in: CGRect(x: s * 0.50, y: s * 0.27, width: s * 0.03, height: s * 0.03))
            dots.addEllipse(in: CGRect(x: s * 0.64, y: s * 0.28, width: s * 0.03, height: s * 0.03))
            context.fill(dots, with: .color(Color.white.opacity(0.25)))

        case .halo:
            let haloRect = CGRect(x: s * 0.20, y: s * 0.06, width: s * 0.60, height: s * 0.16)
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFF9C4").opacity(0.40)), lineWidth: 7)
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFD54F")), lineWidth: 3)

        case .headphones:
            var band = Path()
            band.addArc(center: CGPoint(x: s * 0.50, y: s * 0.34), radius: s * 0.32, startAngle: .degrees(198), endAngle: .degrees(342), clockwise: false)
            context.stroke(band, with: .color(Color(hex: "424242")), lineWidth: s * 0.035)
            let padL = CGRect(x: s * 0.10, y: s * 0.36, width: s * 0.14, height: s * 0.18)
            let padR = CGRect(x: s * 0.76, y: s * 0.36, width: s * 0.14, height: s * 0.18)
            context.fill(Path(roundedRect: padL, cornerRadius: 5), with: .color(Color(hex: "424242")))
            context.fill(Path(roundedRect: padR, cornerRadius: 5), with: .color(Color(hex: "424242")))
            context.fill(Path(roundedRect: CGRect(x: s * 0.12, y: s * 0.38, width: s * 0.04, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.12)))
            context.fill(Path(roundedRect: CGRect(x: s * 0.78, y: s * 0.38, width: s * 0.04, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.12)))
        }
    }

    private func drawStar(context: inout GraphicsContext, center: CGPoint, radius: CGFloat, color: Color) {
        var path = Path()
        let points = 5
        for i in 0..<points * 2 {
            let angle = Double(i) * (Double.pi / Double(points)) - Double.pi / 2
            let r = i % 2 == 0 ? radius : radius * 0.4
            let x = center.x + r * CGFloat(cos(angle))
            let y = center.y + r * CGFloat(sin(angle))
            if i == 0 { path.move(to: CGPoint(x: x, y: y)) }
            else { path.addLine(to: CGPoint(x: x, y: y)) }
        }
        path.closeSubpath()
        context.fill(path, with: .color(color))
    }

    private func drawHeart(context: inout GraphicsContext, center: CGPoint, size: CGFloat, color: Color) {
        var path = Path()
        let w = size
        let h = size
        let top = center.y - h * 0.3
        path.move(to: CGPoint(x: center.x, y: top + h * 0.35))
        path.addCurve(
            to: CGPoint(x: center.x - w * 0.5, y: top + h * 0.15),
            control1: CGPoint(x: center.x - w * 0.1, y: top + h * 0.15),
            control2: CGPoint(x: center.x - w * 0.5, y: top - h * 0.15)
        )
        path.addCurve(
            to: CGPoint(x: center.x, y: top + h * 0.75),
            control1: CGPoint(x: center.x - w * 0.5, y: top + h * 0.45),
            control2: CGPoint(x: center.x, y: top + h * 0.55)
        )
        path.addCurve(
            to: CGPoint(x: center.x + w * 0.5, y: top + h * 0.15),
            control1: CGPoint(x: center.x, y: top + h * 0.55),
            control2: CGPoint(x: center.x + w * 0.5, y: top + h * 0.45)
        )
        path.addCurve(
            to: CGPoint(x: center.x, y: top + h * 0.35),
            control1: CGPoint(x: center.x + w * 0.5, y: top - h * 0.15),
            control2: CGPoint(x: center.x + w * 0.1, y: top + h * 0.15)
        )
        path.closeSubpath()
        context.fill(path, with: .color(color))
    }
}

extension Color {
    func mix(with other: Color, by amount: CGFloat) -> Color {
        let clampedAmount = max(0, min(1, amount))
        return Color(
            UIColor { _ in
                var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
                var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
                UIColor(self).getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
                UIColor(other).getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
                return UIColor(
                    red: r1 + (r2 - r1) * clampedAmount,
                    green: g1 + (g2 - g1) * clampedAmount,
                    blue: b1 + (b2 - b1) * clampedAmount,
                    alpha: a1 + (a2 - a1) * clampedAmount
                )
            }
        )
    }
}
