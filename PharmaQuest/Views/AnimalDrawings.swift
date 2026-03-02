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

    private func drawAnimal(context: inout GraphicsContext, type: AnimalType, color: Color, size: CGFloat) {
        let s = size
        let faceColor = color
        let bellyColor = Color.white.opacity(0.5)
        let shadow = Color.black.opacity(0.08)
        let highlight = Color.white.opacity(0.35)
        let cheekPink = Color(hex: "FF8A80").opacity(0.35)

        switch type {
        case .beaver:
            let earL = CGRect(x: s * 0.16, y: s * 0.20, width: s * 0.18, height: s * 0.16)
            let earR = CGRect(x: s * 0.66, y: s * 0.20, width: s * 0.18, height: s * 0.16)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.19, y: s * 0.22, width: s * 0.12, height: s * 0.10)
            let innerEarR = CGRect(x: s * 0.69, y: s * 0.22, width: s * 0.12, height: s * 0.10)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "D7CCC8")))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "D7CCC8")))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.26, width: s * 0.40, height: s * 0.20)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.26, y: s * 0.50, width: s * 0.48, height: s * 0.32)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.43, y: s * 0.52, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(Color.black.opacity(0.65)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.53, width: s * 0.04, height: s * 0.03)), with: .color(Color.white.opacity(0.5)))
            var teeth = Path()
            teeth.addRoundedRect(in: CGRect(x: s * 0.42, y: s * 0.72, width: s * 0.07, height: s * 0.10), cornerSize: CGSize(width: 2, height: 2))
            teeth.addRoundedRect(in: CGRect(x: s * 0.51, y: s * 0.72, width: s * 0.07, height: s * 0.10), cornerSize: CGSize(width: 2, height: 2))
            context.fill(teeth, with: .color(.white))
            context.stroke(teeth, with: .color(shadow), lineWidth: 1)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.54, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.54, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))

        case .bird:
            var crest = Path()
            crest.move(to: CGPoint(x: s * 0.42, y: s * 0.12))
            crest.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.25), control1: CGPoint(x: s * 0.40, y: s * 0.18), control2: CGPoint(x: s * 0.44, y: s * 0.22))
            crest.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.12), control1: CGPoint(x: s * 0.56, y: s * 0.22), control2: CGPoint(x: s * 0.60, y: s * 0.18))
            crest.addCurve(to: CGPoint(x: s * 0.54, y: s * 0.26), control1: CGPoint(x: s * 0.58, y: s * 0.20), control2: CGPoint(x: s * 0.56, y: s * 0.24))
            crest.closeSubpath()
            context.fill(crest, with: .color(faceColor))
            let head = CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.68, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.26, width: s * 0.36, height: s * 0.18)), with: .color(highlight))
            let belly = CGRect(x: s * 0.24, y: s * 0.48, width: s * 0.52, height: s * 0.34)
            context.fill(Path(ellipseIn: belly), with: .color(bellyColor))
            var beak = Path()
            beak.move(to: CGPoint(x: s * 0.42, y: s * 0.55))
            beak.addQuadCurve(to: CGPoint(x: s * 0.58, y: s * 0.55), control: CGPoint(x: s * 0.50, y: s * 0.50))
            beak.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.67), control: CGPoint(x: s * 0.56, y: s * 0.62))
            beak.addQuadCurve(to: CGPoint(x: s * 0.42, y: s * 0.55), control: CGPoint(x: s * 0.44, y: s * 0.62))
            beak.closeSubpath()
            context.fill(beak, with: .color(Color(hex: "FFA726")))
            context.stroke(beak, with: .color(Color(hex: "E65100").opacity(0.4)), lineWidth: 1)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .bunny:
            let earL = CGRect(x: s * 0.20, y: s * 0.00, width: s * 0.20, height: s * 0.42)
            let earR = CGRect(x: s * 0.60, y: s * 0.00, width: s * 0.20, height: s * 0.42)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.24, y: s * 0.06, width: s * 0.12, height: s * 0.30)
            let innerEarR = CGRect(x: s * 0.64, y: s * 0.06, width: s * 0.12, height: s * 0.30)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "F48FB1")))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "F48FB1")))
            let head = CGRect(x: s * 0.14, y: s * 0.28, width: s * 0.72, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.30, width: s * 0.38, height: s * 0.18)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.34, y: s * 0.56, width: s * 0.32, height: s * 0.18)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.45, y: s * 0.56, width: s * 0.10, height: s * 0.07)
            context.fill(Path(ellipseIn: nose), with: .color(Color(hex: "F48FB1")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.52, width: s * 0.16, height: s * 0.12)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.68, y: s * 0.52, width: s * 0.16, height: s * 0.12)), with: .color(cheekPink))

        case .cat:
            var earL = Path()
            earL.move(to: CGPoint(x: s * 0.15, y: s * 0.38))
            earL.addLine(to: CGPoint(x: s * 0.20, y: s * 0.10))
            earL.addLine(to: CGPoint(x: s * 0.40, y: s * 0.32))
            earL.closeSubpath()
            var earR = Path()
            earR.move(to: CGPoint(x: s * 0.85, y: s * 0.38))
            earR.addLine(to: CGPoint(x: s * 0.80, y: s * 0.10))
            earR.addLine(to: CGPoint(x: s * 0.60, y: s * 0.32))
            earR.closeSubpath()
            context.fill(earL, with: .color(faceColor))
            context.fill(earR, with: .color(faceColor))
            var innerEarL = Path()
            innerEarL.move(to: CGPoint(x: s * 0.19, y: s * 0.36))
            innerEarL.addLine(to: CGPoint(x: s * 0.22, y: s * 0.17))
            innerEarL.addLine(to: CGPoint(x: s * 0.36, y: s * 0.33))
            innerEarL.closeSubpath()
            var innerEarR = Path()
            innerEarR.move(to: CGPoint(x: s * 0.81, y: s * 0.36))
            innerEarR.addLine(to: CGPoint(x: s * 0.78, y: s * 0.17))
            innerEarR.addLine(to: CGPoint(x: s * 0.64, y: s * 0.33))
            innerEarR.closeSubpath()
            context.fill(innerEarL, with: .color(Color(hex: "F48FB1")))
            context.fill(innerEarR, with: .color(Color(hex: "F48FB1")))
            let head = CGRect(x: s * 0.13, y: s * 0.26, width: s * 0.74, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.28, width: s * 0.40, height: s * 0.18)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.32, y: s * 0.54, width: s * 0.36, height: s * 0.22)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            var nosePath = Path()
            nosePath.move(to: CGPoint(x: s * 0.50, y: s * 0.56))
            nosePath.addLine(to: CGPoint(x: s * 0.44, y: s * 0.63))
            nosePath.addLine(to: CGPoint(x: s * 0.56, y: s * 0.63))
            nosePath.closeSubpath()
            context.fill(nosePath, with: .color(Color(hex: "F48FB1")))
            var whiskerL1 = Path()
            whiskerL1.move(to: CGPoint(x: s * 0.34, y: s * 0.60))
            whiskerL1.addLine(to: CGPoint(x: s * 0.10, y: s * 0.56))
            context.stroke(whiskerL1, with: .color(Color.black.opacity(0.15)), lineWidth: 1)
            var whiskerL2 = Path()
            whiskerL2.move(to: CGPoint(x: s * 0.34, y: s * 0.64))
            whiskerL2.addLine(to: CGPoint(x: s * 0.10, y: s * 0.66))
            context.stroke(whiskerL2, with: .color(Color.black.opacity(0.15)), lineWidth: 1)
            var whiskerR1 = Path()
            whiskerR1.move(to: CGPoint(x: s * 0.66, y: s * 0.60))
            whiskerR1.addLine(to: CGPoint(x: s * 0.90, y: s * 0.56))
            context.stroke(whiskerR1, with: .color(Color.black.opacity(0.15)), lineWidth: 1)
            var whiskerR2 = Path()
            whiskerR2.move(to: CGPoint(x: s * 0.66, y: s * 0.64))
            whiskerR2.addLine(to: CGPoint(x: s * 0.90, y: s * 0.66))
            context.stroke(whiskerR2, with: .color(Color.black.opacity(0.15)), lineWidth: 1)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.14, y: s * 0.54, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.54, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))

        case .dog:
            let earL = CGRect(x: s * 0.06, y: s * 0.26, width: s * 0.24, height: s * 0.40)
            let earR = CGRect(x: s * 0.70, y: s * 0.26, width: s * 0.24, height: s * 0.40)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.10, y: s * 0.32, width: s * 0.16, height: s * 0.28)
            let innerEarR = CGRect(x: s * 0.74, y: s * 0.32, width: s * 0.16, height: s * 0.28)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "D7CCC8").opacity(0.6)))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "D7CCC8").opacity(0.6)))
            let head = CGRect(x: s * 0.15, y: s * 0.22, width: s * 0.70, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.24, width: s * 0.38, height: s * 0.18)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.28, y: s * 0.50, width: s * 0.44, height: s * 0.30)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.42, y: s * 0.52, width: s * 0.16, height: s * 0.12)
            context.fill(Path(ellipseIn: nose), with: .color(Color.black.opacity(0.7)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.45, y: s * 0.53, width: s * 0.06, height: s * 0.04)), with: .color(Color.white.opacity(0.4)))
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: s * 0.45, y: s * 0.68, width: s * 0.10, height: s * 0.12))
            context.fill(tongue, with: .color(Color(hex: "E91E63").opacity(0.7)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.52, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.52, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))

        case .dragon:
            var hornL = Path()
            hornL.move(to: CGPoint(x: s * 0.24, y: s * 0.30))
            hornL.addCurve(to: CGPoint(x: s * 0.16, y: s * 0.06), control1: CGPoint(x: s * 0.20, y: s * 0.22), control2: CGPoint(x: s * 0.14, y: s * 0.12))
            hornL.addLine(to: CGPoint(x: s * 0.36, y: s * 0.26))
            hornL.closeSubpath()
            var hornR = Path()
            hornR.move(to: CGPoint(x: s * 0.76, y: s * 0.30))
            hornR.addCurve(to: CGPoint(x: s * 0.84, y: s * 0.06), control1: CGPoint(x: s * 0.80, y: s * 0.22), control2: CGPoint(x: s * 0.86, y: s * 0.12))
            hornR.addLine(to: CGPoint(x: s * 0.64, y: s * 0.26))
            hornR.closeSubpath()
            context.fill(hornL, with: .color(Color(hex: "FFA726")))
            context.fill(hornR, with: .color(Color(hex: "FFA726")))
            context.stroke(hornL, with: .color(Color(hex: "E65100").opacity(0.3)), lineWidth: 1)
            context.stroke(hornR, with: .color(Color(hex: "E65100").opacity(0.3)), lineWidth: 1)
            var spikes = Path()
            for i in 0..<5 {
                let cx = s * (0.35 + CGFloat(i) * 0.075)
                spikes.move(to: CGPoint(x: cx - s * 0.028, y: s * 0.26))
                spikes.addLine(to: CGPoint(x: cx, y: s * 0.16))
                spikes.addLine(to: CGPoint(x: cx + s * 0.028, y: s * 0.26))
                spikes.closeSubpath()
            }
            context.fill(spikes, with: .color(Color(hex: "FFA726").opacity(0.7)))
            let head = CGRect(x: s * 0.15, y: s * 0.24, width: s * 0.70, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.26, width: s * 0.38, height: s * 0.18)), with: .color(highlight))
            let belly = CGRect(x: s * 0.26, y: s * 0.46, width: s * 0.48, height: s * 0.32)
            context.fill(Path(ellipseIn: belly), with: .color(Color(hex: "FFF9C4").opacity(0.5)))
            let nostrilL = CGRect(x: s * 0.36, y: s * 0.56, width: s * 0.07, height: s * 0.05)
            let nostrilR = CGRect(x: s * 0.57, y: s * 0.56, width: s * 0.07, height: s * 0.05)
            context.fill(Path(ellipseIn: nostrilL), with: .color(Color.black.opacity(0.15)))
            context.fill(Path(ellipseIn: nostrilR), with: .color(Color.black.opacity(0.15)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .elephant:
            let earL = CGRect(x: s * 0.00, y: s * 0.18, width: s * 0.36, height: s * 0.50)
            let earR = CGRect(x: s * 0.64, y: s * 0.18, width: s * 0.36, height: s * 0.50)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.04, y: s * 0.24, width: s * 0.26, height: s * 0.38)
            let innerEarR = CGRect(x: s * 0.70, y: s * 0.24, width: s * 0.26, height: s * 0.38)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "F48FB1").opacity(0.25)))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "F48FB1").opacity(0.25)))
            let head = CGRect(x: s * 0.16, y: s * 0.20, width: s * 0.68, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.22, width: s * 0.38, height: s * 0.18)), with: .color(highlight))
            var trunk = Path()
            trunk.move(to: CGPoint(x: s * 0.42, y: s * 0.58))
            trunk.addCurve(to: CGPoint(x: s * 0.46, y: s * 0.88), control1: CGPoint(x: s * 0.40, y: s * 0.70), control2: CGPoint(x: s * 0.36, y: s * 0.84))
            trunk.addCurve(to: CGPoint(x: s * 0.54, y: s * 0.86), control1: CGPoint(x: s * 0.50, y: s * 0.90), control2: CGPoint(x: s * 0.54, y: s * 0.90))
            trunk.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.58), control1: CGPoint(x: s * 0.60, y: s * 0.84), control2: CGPoint(x: s * 0.60, y: s * 0.70))
            trunk.closeSubpath()
            context.fill(trunk, with: .color(faceColor))
            context.stroke(trunk, with: .color(shadow), lineWidth: 1.5)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.50, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.50, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))

        case .fox:
            var earL = Path()
            earL.move(to: CGPoint(x: s * 0.14, y: s * 0.38))
            earL.addLine(to: CGPoint(x: s * 0.22, y: s * 0.06))
            earL.addLine(to: CGPoint(x: s * 0.42, y: s * 0.30))
            earL.closeSubpath()
            var earR = Path()
            earR.move(to: CGPoint(x: s * 0.86, y: s * 0.38))
            earR.addLine(to: CGPoint(x: s * 0.78, y: s * 0.06))
            earR.addLine(to: CGPoint(x: s * 0.58, y: s * 0.30))
            earR.closeSubpath()
            context.fill(earL, with: .color(faceColor))
            context.fill(earR, with: .color(faceColor))
            var earTipL = Path()
            earTipL.move(to: CGPoint(x: s * 0.22, y: s * 0.06))
            earTipL.addLine(to: CGPoint(x: s * 0.18, y: s * 0.22))
            earTipL.addLine(to: CGPoint(x: s * 0.30, y: s * 0.18))
            earTipL.closeSubpath()
            var earTipR = Path()
            earTipR.move(to: CGPoint(x: s * 0.78, y: s * 0.06))
            earTipR.addLine(to: CGPoint(x: s * 0.82, y: s * 0.22))
            earTipR.addLine(to: CGPoint(x: s * 0.70, y: s * 0.18))
            earTipR.closeSubpath()
            context.fill(earTipL, with: .color(Color.black.opacity(0.15)))
            context.fill(earTipR, with: .color(Color.black.opacity(0.15)))
            let head = CGRect(x: s * 0.13, y: s * 0.24, width: s * 0.74, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.26, width: s * 0.40, height: s * 0.18)), with: .color(highlight))
            var chin = Path()
            chin.move(to: CGPoint(x: s * 0.24, y: s * 0.50))
            chin.addQuadCurve(to: CGPoint(x: s * 0.76, y: s * 0.50), control: CGPoint(x: s * 0.50, y: s * 0.90))
            chin.closeSubpath()
            context.fill(chin, with: .color(.white.opacity(0.85)))
            let nose = CGRect(x: s * 0.43, y: s * 0.54, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .frog:
            let head = CGRect(x: s * 0.10, y: s * 0.28, width: s * 0.80, height: s * 0.56)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let eyeBumpL = CGRect(x: s * 0.14, y: s * 0.16, width: s * 0.30, height: s * 0.30)
            let eyeBumpR = CGRect(x: s * 0.56, y: s * 0.16, width: s * 0.30, height: s * 0.30)
            context.fill(Path(ellipseIn: eyeBumpL), with: .color(faceColor))
            context.fill(Path(ellipseIn: eyeBumpR), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.18, width: s * 0.18, height: s * 0.12)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.58, y: s * 0.18, width: s * 0.18, height: s * 0.12)), with: .color(highlight))
            let belly = CGRect(x: s * 0.22, y: s * 0.46, width: s * 0.56, height: s * 0.34)
            context.fill(Path(ellipseIn: belly), with: .color(Color(hex: "C8E6C9").opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.14, y: s * 0.56, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.56, width: s * 0.14, height: s * 0.10)), with: .color(cheekPink))

        case .giraffe:
            let hornBaseL = CGRect(x: s * 0.30, y: s * 0.08, width: s * 0.06, height: s * 0.24)
            let hornBaseR = CGRect(x: s * 0.64, y: s * 0.08, width: s * 0.06, height: s * 0.24)
            context.fill(Path(roundedRect: hornBaseL, cornerRadius: 3), with: .color(faceColor))
            context.fill(Path(roundedRect: hornBaseR, cornerRadius: 3), with: .color(faceColor))
            let hornTipL = CGRect(x: s * 0.27, y: s * 0.04, width: s * 0.12, height: s * 0.12)
            let hornTipR = CGRect(x: s * 0.61, y: s * 0.04, width: s * 0.12, height: s * 0.12)
            context.fill(Path(ellipseIn: hornTipL), with: .color(Color(hex: "8D6E63")))
            context.fill(Path(ellipseIn: hornTipR), with: .color(Color(hex: "8D6E63")))
            let head = CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.68, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.24, width: s * 0.36, height: s * 0.18)), with: .color(highlight))
            let spots: [(CGFloat, CGFloat, CGFloat)] = [
                (0.26, 0.34, 0.09), (0.66, 0.36, 0.08), (0.34, 0.68, 0.07),
                (0.58, 0.66, 0.08), (0.46, 0.33, 0.07),
            ]
            for spot in spots {
                let spotRect = CGRect(x: s * spot.0, y: s * spot.1, width: s * spot.2, height: s * spot.2)
                context.fill(Path(ellipseIn: spotRect), with: .color(Color(hex: "8D6E63").opacity(0.35)))
            }
            let muzzle = CGRect(x: s * 0.28, y: s * 0.56, width: s * 0.44, height: s * 0.26)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.42, y: s * 0.58, width: s * 0.16, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(Color(hex: "8D6E63").opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .hedgehog:
            var spikes = Path()
            let center = CGPoint(x: s * 0.50, y: s * 0.46)
            for i in 0..<14 {
                let angle = Double(i) * (Double.pi / 7.0) - Double.pi * 0.15
                if angle > Double.pi * 0.65 { continue }
                let inner: CGFloat = s * 0.34
                let outer: CGFloat = s * 0.48
                let x1 = center.x + inner * CGFloat(cos(angle - 0.10))
                let y1 = center.y + inner * CGFloat(sin(angle - 0.10))
                let xTip = center.x + outer * CGFloat(cos(angle))
                let yTip = center.y + outer * CGFloat(sin(angle))
                let x2 = center.x + inner * CGFloat(cos(angle + 0.10))
                let y2 = center.y + inner * CGFloat(sin(angle + 0.10))
                spikes.move(to: CGPoint(x: x1, y: y1))
                spikes.addLine(to: CGPoint(x: xTip, y: yTip))
                spikes.addLine(to: CGPoint(x: x2, y: y2))
                spikes.closeSubpath()
            }
            context.fill(spikes, with: .color(Color(hex: "5D4037")))
            let head = CGRect(x: s * 0.16, y: s * 0.28, width: s * 0.68, height: s * 0.56)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.30, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.30, y: s * 0.50, width: s * 0.40, height: s * 0.28)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.44, y: s * 0.52, width: s * 0.12, height: s * 0.09)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.47, y: s * 0.53, width: s * 0.04, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .horse:
            var mane = Path()
            mane.move(to: CGPoint(x: s * 0.58, y: s * 0.10))
            mane.addCurve(to: CGPoint(x: s * 0.74, y: s * 0.58), control1: CGPoint(x: s * 0.84, y: s * 0.18), control2: CGPoint(x: s * 0.86, y: s * 0.48))
            mane.addLine(to: CGPoint(x: s * 0.64, y: s * 0.52))
            mane.addCurve(to: CGPoint(x: s * 0.53, y: s * 0.16), control1: CGPoint(x: s * 0.74, y: s * 0.38), control2: CGPoint(x: s * 0.72, y: s * 0.20))
            mane.closeSubpath()
            context.fill(mane, with: .color(Color(hex: "4E342E")))
            let earL = CGRect(x: s * 0.22, y: s * 0.12, width: s * 0.14, height: s * 0.20)
            let earR = CGRect(x: s * 0.56, y: s * 0.10, width: s * 0.14, height: s * 0.20)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.25, y: s * 0.15, width: s * 0.08, height: s * 0.14)
            let innerEarR = CGRect(x: s * 0.59, y: s * 0.13, width: s * 0.08, height: s * 0.14)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "D7CCC8").opacity(0.6)))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "D7CCC8").opacity(0.6)))
            let head = CGRect(x: s * 0.14, y: s * 0.22, width: s * 0.66, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.24, width: s * 0.36, height: s * 0.18)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.24, y: s * 0.56, width: s * 0.46, height: s * 0.26)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nostrilL = CGRect(x: s * 0.36, y: s * 0.66, width: s * 0.06, height: s * 0.04)
            let nostrilR = CGRect(x: s * 0.54, y: s * 0.66, width: s * 0.06, height: s * 0.04)
            context.fill(Path(ellipseIn: nostrilL), with: .color(Color.black.opacity(0.15)))
            context.fill(Path(ellipseIn: nostrilR), with: .color(Color.black.opacity(0.15)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.66, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .lion:
            let maneRect = CGRect(x: s * 0.06, y: s * 0.10, width: s * 0.88, height: s * 0.82)
            context.fill(Path(ellipseIn: maneRect), with: .color(Color(hex: "E65100").opacity(0.5)))
            var maneSpikes = Path()
            let maneCenter = CGPoint(x: s * 0.50, y: s * 0.50)
            for i in 0..<18 {
                let angle = Double(i) * (Double.pi * 2.0 / 18.0)
                let inner: CGFloat = s * 0.36
                let outer: CGFloat = s * 0.48
                let x1 = maneCenter.x + inner * CGFloat(cos(angle - 0.12))
                let y1 = maneCenter.y + inner * CGFloat(sin(angle - 0.12))
                let xTip = maneCenter.x + outer * CGFloat(cos(angle))
                let yTip = maneCenter.y + outer * CGFloat(sin(angle))
                let x2 = maneCenter.x + inner * CGFloat(cos(angle + 0.12))
                let y2 = maneCenter.y + inner * CGFloat(sin(angle + 0.12))
                maneSpikes.move(to: CGPoint(x: x1, y: y1))
                maneSpikes.addLine(to: CGPoint(x: xTip, y: yTip))
                maneSpikes.addLine(to: CGPoint(x: x2, y: y2))
                maneSpikes.closeSubpath()
            }
            context.fill(maneSpikes, with: .color(Color(hex: "E65100").opacity(0.45)))
            let head = CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.68, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.24, width: s * 0.36, height: s * 0.18)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.30, y: s * 0.50, width: s * 0.40, height: s * 0.26)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.42, y: s * 0.52, width: s * 0.16, height: s * 0.12)
            context.fill(Path(ellipseIn: nose), with: .color(Color(hex: "5D4037")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.45, y: s * 0.53, width: s * 0.06, height: s * 0.04)), with: .color(Color.white.opacity(0.3)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.52, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .monkey:
            let earL = CGRect(x: s * 0.04, y: s * 0.32, width: s * 0.24, height: s * 0.24)
            let earR = CGRect(x: s * 0.72, y: s * 0.32, width: s * 0.24, height: s * 0.24)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.08, y: s * 0.36, width: s * 0.16, height: s * 0.16)
            let innerEarR = CGRect(x: s * 0.76, y: s * 0.36, width: s * 0.16, height: s * 0.16)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "FFAB91")))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "FFAB91")))
            let head = CGRect(x: s * 0.14, y: s * 0.20, width: s * 0.72, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.38, height: s * 0.18)), with: .color(highlight))
            let face = CGRect(x: s * 0.22, y: s * 0.38, width: s * 0.56, height: s * 0.42)
            context.fill(Path(ellipseIn: face), with: .color(Color(hex: "FFAB91")))
            let nose = CGRect(x: s * 0.42, y: s * 0.54, width: s * 0.16, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(Color(hex: "8D6E63").opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.52, width: s * 0.10, height: s * 0.06)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.52, width: s * 0.10, height: s * 0.06)), with: .color(cheekPink))

        case .octopus:
            let head = CGRect(x: s * 0.14, y: s * 0.10, width: s * 0.72, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.12, width: s * 0.36, height: s * 0.18)), with: .color(highlight))
            for i in 0..<5 {
                let cx = s * (0.16 + CGFloat(i) * 0.17)
                var tentacle = Path()
                tentacle.move(to: CGPoint(x: cx, y: s * 0.60))
                tentacle.addCurve(
                    to: CGPoint(x: cx + s * 0.04, y: s * 0.92),
                    control1: CGPoint(x: cx - s * 0.06, y: s * 0.74),
                    control2: CGPoint(x: cx + s * 0.10, y: s * 0.82)
                )
                tentacle.addLine(to: CGPoint(x: cx + s * 0.10, y: s * 0.90))
                tentacle.addCurve(
                    to: CGPoint(x: cx + s * 0.06, y: s * 0.60),
                    control1: CGPoint(x: cx + s * 0.14, y: s * 0.78),
                    control2: CGPoint(x: cx, y: s * 0.70)
                )
                tentacle.closeSubpath()
                context.fill(tentacle, with: .color(faceColor))
            }
            let face = CGRect(x: s * 0.26, y: s * 0.28, width: s * 0.48, height: s * 0.32)
            context.fill(Path(ellipseIn: face), with: .color(bellyColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.44, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.44, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .owl:
            var tuftL = Path()
            tuftL.move(to: CGPoint(x: s * 0.20, y: s * 0.30))
            tuftL.addCurve(to: CGPoint(x: s * 0.18, y: s * 0.08), control1: CGPoint(x: s * 0.16, y: s * 0.22), control2: CGPoint(x: s * 0.14, y: s * 0.12))
            tuftL.addLine(to: CGPoint(x: s * 0.36, y: s * 0.26))
            tuftL.closeSubpath()
            var tuftR = Path()
            tuftR.move(to: CGPoint(x: s * 0.80, y: s * 0.30))
            tuftR.addCurve(to: CGPoint(x: s * 0.82, y: s * 0.08), control1: CGPoint(x: s * 0.84, y: s * 0.22), control2: CGPoint(x: s * 0.86, y: s * 0.12))
            tuftR.addLine(to: CGPoint(x: s * 0.64, y: s * 0.26))
            tuftR.closeSubpath()
            context.fill(tuftL, with: .color(faceColor))
            context.fill(tuftR, with: .color(faceColor))
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.38, height: s * 0.18)), with: .color(highlight))
            let eyeRingL = CGRect(x: s * 0.18, y: s * 0.32, width: s * 0.30, height: s * 0.30)
            let eyeRingR = CGRect(x: s * 0.52, y: s * 0.32, width: s * 0.30, height: s * 0.30)
            context.fill(Path(ellipseIn: eyeRingL), with: .color(bellyColor))
            context.fill(Path(ellipseIn: eyeRingR), with: .color(bellyColor))
            var beak = Path()
            beak.move(to: CGPoint(x: s * 0.44, y: s * 0.58))
            beak.addLine(to: CGPoint(x: s * 0.50, y: s * 0.70))
            beak.addLine(to: CGPoint(x: s * 0.56, y: s * 0.58))
            beak.closeSubpath()
            context.fill(beak, with: .color(Color(hex: "FFA726")))
            context.stroke(beak, with: .color(Color(hex: "E65100").opacity(0.3)), lineWidth: 1)
            let belly = CGRect(x: s * 0.28, y: s * 0.62, width: s * 0.44, height: s * 0.22)
            context.fill(Path(ellipseIn: belly), with: .color(bellyColor))
            var featherV1 = Path()
            featherV1.move(to: CGPoint(x: s * 0.42, y: s * 0.64))
            featherV1.addLine(to: CGPoint(x: s * 0.44, y: s * 0.76))
            context.stroke(featherV1, with: .color(Color.black.opacity(0.08)), lineWidth: 1)
            var featherV2 = Path()
            featherV2.move(to: CGPoint(x: s * 0.50, y: s * 0.62))
            featherV2.addLine(to: CGPoint(x: s * 0.50, y: s * 0.78))
            context.stroke(featherV2, with: .color(Color.black.opacity(0.08)), lineWidth: 1)
            var featherV3 = Path()
            featherV3.move(to: CGPoint(x: s * 0.58, y: s * 0.64))
            featherV3.addLine(to: CGPoint(x: s * 0.56, y: s * 0.76))
            context.stroke(featherV3, with: .color(Color.black.opacity(0.08)), lineWidth: 1)

        case .panda:
            let earL = CGRect(x: s * 0.10, y: s * 0.14, width: s * 0.24, height: s * 0.24)
            let earR = CGRect(x: s * 0.66, y: s * 0.14, width: s * 0.24, height: s * 0.24)
            context.fill(Path(ellipseIn: earL), with: .color(.black.opacity(0.8)))
            context.fill(Path(ellipseIn: earR), with: .color(.black.opacity(0.8)))
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.40, height: s * 0.18)), with: .color(highlight))
            let patchL = CGRect(x: s * 0.20, y: s * 0.34, width: s * 0.22, height: s * 0.22)
            let patchR = CGRect(x: s * 0.58, y: s * 0.34, width: s * 0.22, height: s * 0.22)
            context.fill(Path(ellipseIn: patchL), with: .color(.black.opacity(0.72)))
            context.fill(Path(ellipseIn: patchR), with: .color(.black.opacity(0.72)))
            let nose = CGRect(x: s * 0.43, y: s * 0.57, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.58, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .raccoon:
            let earL = CGRect(x: s * 0.12, y: s * 0.14, width: s * 0.20, height: s * 0.20)
            let earR = CGRect(x: s * 0.68, y: s * 0.14, width: s * 0.20, height: s * 0.20)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.15, y: s * 0.17, width: s * 0.14, height: s * 0.14)
            let innerEarR = CGRect(x: s * 0.71, y: s * 0.17, width: s * 0.14, height: s * 0.14)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "F48FB1").opacity(0.3)))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "F48FB1").opacity(0.3)))
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.38, height: s * 0.18)), with: .color(highlight))
            let mask = CGRect(x: s * 0.16, y: s * 0.34, width: s * 0.68, height: s * 0.20)
            context.fill(Path(roundedRect: mask, cornerRadius: s * 0.08), with: .color(.black.opacity(0.55)))
            let maskHighL = CGRect(x: s * 0.20, y: s * 0.36, width: s * 0.18, height: s * 0.08)
            let maskHighR = CGRect(x: s * 0.62, y: s * 0.36, width: s * 0.18, height: s * 0.08)
            context.fill(Path(ellipseIn: maskHighL), with: .color(Color.white.opacity(0.08)))
            context.fill(Path(ellipseIn: maskHighR), with: .color(Color.white.opacity(0.08)))
            var stripe = Path()
            stripe.move(to: CGPoint(x: s * 0.50, y: s * 0.24))
            stripe.addLine(to: CGPoint(x: s * 0.50, y: s * 0.34))
            context.stroke(stripe, with: .color(Color.white.opacity(0.5)), lineWidth: s * 0.04)
            let muzzle = CGRect(x: s * 0.32, y: s * 0.52, width: s * 0.36, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.43, y: s * 0.54, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))

        case .seal:
            let head = CGRect(x: s * 0.12, y: s * 0.20, width: s * 0.76, height: s * 0.64)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.40, height: s * 0.18)), with: .color(highlight))
            let belly = CGRect(x: s * 0.22, y: s * 0.42, width: s * 0.56, height: s * 0.38)
            context.fill(Path(ellipseIn: belly), with: .color(bellyColor))
            var flipperL = Path()
            flipperL.addEllipse(in: CGRect(x: s * 0.04, y: s * 0.50, width: s * 0.20, height: s * 0.26))
            var flipperR = Path()
            flipperR.addEllipse(in: CGRect(x: s * 0.76, y: s * 0.50, width: s * 0.20, height: s * 0.26))
            context.fill(flipperL, with: .color(faceColor))
            context.fill(flipperR, with: .color(faceColor))
            let nose = CGRect(x: s * 0.42, y: s * 0.50, width: s * 0.16, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.45, y: s * 0.51, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            let dotL = CGRect(x: s * 0.32, y: s * 0.58, width: s * 0.03, height: s * 0.03)
            let dotR = CGRect(x: s * 0.65, y: s * 0.58, width: s * 0.03, height: s * 0.03)
            let dotL2 = CGRect(x: s * 0.28, y: s * 0.62, width: s * 0.02, height: s * 0.02)
            let dotR2 = CGRect(x: s * 0.70, y: s * 0.62, width: s * 0.02, height: s * 0.02)
            context.fill(Path(ellipseIn: dotL), with: .color(Color.black.opacity(0.12)))
            context.fill(Path(ellipseIn: dotR), with: .color(Color.black.opacity(0.12)))
            context.fill(Path(ellipseIn: dotL2), with: .color(Color.black.opacity(0.10)))
            context.fill(Path(ellipseIn: dotR2), with: .color(Color.black.opacity(0.10)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .sloth:
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.40, height: s * 0.18)), with: .color(highlight))
            let patchL = CGRect(x: s * 0.20, y: s * 0.32, width: s * 0.24, height: s * 0.26)
            let patchR = CGRect(x: s * 0.56, y: s * 0.32, width: s * 0.24, height: s * 0.26)
            context.fill(Path(ellipseIn: patchL), with: .color(Color(hex: "5D4037").opacity(0.35)))
            context.fill(Path(ellipseIn: patchR), with: .color(Color(hex: "5D4037").opacity(0.35)))
            let muzzle = CGRect(x: s * 0.30, y: s * 0.52, width: s * 0.40, height: s * 0.26)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            let nose = CGRect(x: s * 0.43, y: s * 0.54, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .turtle:
            var shell = Path()
            shell.addEllipse(in: CGRect(x: s * 0.13, y: s * 0.36, width: s * 0.74, height: s * 0.54))
            context.fill(shell, with: .color(Color(hex: "689F38")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.40, width: s * 0.40, height: s * 0.14)), with: .color(Color(hex: "7CB342").opacity(0.4)))
            var hexPattern = Path()
            let hCenter = CGPoint(x: s * 0.50, y: s * 0.62)
            let hSize: CGFloat = s * 0.11
            for i in 0..<6 {
                let angle = Double(i) * (Double.pi / 3.0) - Double.pi / 6.0
                let px = hCenter.x + hSize * CGFloat(cos(angle))
                let py = hCenter.y + hSize * CGFloat(sin(angle))
                if i == 0 { hexPattern.move(to: CGPoint(x: px, y: py)) }
                else { hexPattern.addLine(to: CGPoint(x: px, y: py)) }
            }
            hexPattern.closeSubpath()
            context.stroke(hexPattern, with: .color(Color(hex: "558B2F").opacity(0.4)), lineWidth: 1.5)
            let smallHexOffsets: [(CGFloat, CGFloat)] = [(-0.14, -0.06), (0.14, -0.06), (-0.08, 0.10), (0.08, 0.10)]
            for offset in smallHexOffsets {
                var smallHex = Path()
                let sc = CGPoint(x: hCenter.x + s * offset.0, y: hCenter.y + s * offset.1)
                let shs: CGFloat = s * 0.05
                for j in 0..<6 {
                    let a = Double(j) * (Double.pi / 3.0) - Double.pi / 6.0
                    let px2 = sc.x + shs * CGFloat(cos(a))
                    let py2 = sc.y + shs * CGFloat(sin(a))
                    if j == 0 { smallHex.move(to: CGPoint(x: px2, y: py2)) }
                    else { smallHex.addLine(to: CGPoint(x: px2, y: py2)) }
                }
                smallHex.closeSubpath()
                context.stroke(smallHex, with: .color(Color(hex: "558B2F").opacity(0.25)), lineWidth: 1)
            }
            let head = CGRect(x: s * 0.20, y: s * 0.16, width: s * 0.60, height: s * 0.52)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.24, y: s * 0.18, width: s * 0.32, height: s * 0.16)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.30, y: s * 0.40, width: s * 0.40, height: s * 0.22)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.44, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.68, y: s * 0.44, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))

        case .unicorn:
            var horn = Path()
            horn.move(to: CGPoint(x: s * 0.46, y: s * 0.04))
            horn.addLine(to: CGPoint(x: s * 0.40, y: s * 0.28))
            horn.addLine(to: CGPoint(x: s * 0.60, y: s * 0.28))
            horn.closeSubpath()
            context.fill(horn, with: .color(Color(hex: "FFD54F")))
            var hornStripe1 = Path()
            hornStripe1.move(to: CGPoint(x: s * 0.445, y: s * 0.10))
            hornStripe1.addLine(to: CGPoint(x: s * 0.555, y: s * 0.20))
            context.stroke(hornStripe1, with: .color(Color(hex: "FFA726").opacity(0.4)), lineWidth: 1.5)
            var hornStripe2 = Path()
            hornStripe2.move(to: CGPoint(x: s * 0.435, y: s * 0.16))
            hornStripe2.addLine(to: CGPoint(x: s * 0.565, y: s * 0.24))
            context.stroke(hornStripe2, with: .color(Color(hex: "FFA726").opacity(0.4)), lineWidth: 1.5)
            var mane = Path()
            mane.move(to: CGPoint(x: s * 0.62, y: s * 0.16))
            mane.addCurve(to: CGPoint(x: s * 0.80, y: s * 0.58), control1: CGPoint(x: s * 0.90, y: s * 0.20), control2: CGPoint(x: s * 0.92, y: s * 0.48))
            mane.addLine(to: CGPoint(x: s * 0.70, y: s * 0.52))
            mane.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.20), control1: CGPoint(x: s * 0.80, y: s * 0.40), control2: CGPoint(x: s * 0.78, y: s * 0.24))
            mane.closeSubpath()
            context.fill(mane, with: .color(Color(hex: "CE93D8")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.26, width: s * 0.10, height: s * 0.08)), with: .color(Color(hex: "F48FB1").opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.74, y: s * 0.38, width: s * 0.08, height: s * 0.06)), with: .color(Color(hex: "81D4FA").opacity(0.6)))
            let earL = CGRect(x: s * 0.20, y: s * 0.16, width: s * 0.14, height: s * 0.20)
            let earR = CGRect(x: s * 0.58, y: s * 0.14, width: s * 0.14, height: s * 0.20)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.23, y: s * 0.19, width: s * 0.08, height: s * 0.14)
            let innerEarR = CGRect(x: s * 0.61, y: s * 0.17, width: s * 0.08, height: s * 0.14)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "F48FB1").opacity(0.4)))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "F48FB1").opacity(0.4)))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.66, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.26, width: s * 0.36, height: s * 0.18)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.24, y: s * 0.52, width: s * 0.46, height: s * 0.26)
            context.fill(Path(ellipseIn: muzzle), with: .color(bellyColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.66, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheekPink))
        }
    }

    private func drawEyes(context: inout GraphicsContext, style: EyeStyle, size: CGFloat) {
        let s = size
        let eyeY: CGFloat = s * 0.42
        let leftX: CGFloat = s * 0.32
        let rightX: CGFloat = s * 0.58
        let eyeSize: CGFloat = s * 0.09

        switch style {
        case .normal:
            let whiteL = CGRect(x: leftX - eyeSize * 0.2, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.4, height: eyeSize * 1.5)
            let whiteR = CGRect(x: rightX - eyeSize * 0.2, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.4, height: eyeSize * 1.5)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            let shineSize = eyeSize * 0.38
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.45, y: eyeY + eyeSize * 0.12, width: shineSize, height: shineSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.45, y: eyeY + eyeSize * 0.12, width: shineSize, height: shineSize)), with: .color(.white))
            let shine2 = eyeSize * 0.18
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.15, y: eyeY + eyeSize * 0.6, width: shine2, height: shine2)), with: .color(.white.opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.15, y: eyeY + eyeSize * 0.6, width: shine2, height: shine2)), with: .color(.white.opacity(0.6)))

        case .happy:
            var arcL = Path()
            arcL.move(to: CGPoint(x: leftX - eyeSize * 0.1, y: eyeY + eyeSize * 0.5))
            arcL.addQuadCurve(to: CGPoint(x: leftX + eyeSize * 1.1, y: eyeY + eyeSize * 0.5), control: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY - eyeSize * 0.4))
            context.stroke(arcL, with: .color(.black.opacity(0.85)), lineWidth: s * 0.028)
            var arcR = Path()
            arcR.move(to: CGPoint(x: rightX - eyeSize * 0.1, y: eyeY + eyeSize * 0.5))
            arcR.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.1, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY - eyeSize * 0.4))
            context.stroke(arcR, with: .color(.black.opacity(0.85)), lineWidth: s * 0.028)

        case .big:
            let bigSize = eyeSize * 1.8
            let bigY = eyeY - eyeSize * 0.4
            let bigLX = leftX - eyeSize * 0.4
            let bigRX = rightX - eyeSize * 0.4
            context.fill(Path(ellipseIn: CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.stroke(Path(ellipseIn: CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.2)), lineWidth: 1)
            context.stroke(Path(ellipseIn: CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.2)), lineWidth: 1)
            let pupilSize = bigSize * 0.55
            let pupilOff = bigSize * 0.28
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff, y: bigY + pupilOff * 0.8, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff, y: bigY + pupilOff * 0.8, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))
            let shSize = pupilSize * 0.35
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff + pupilSize * 0.35, y: bigY + pupilOff * 0.8 + pupilSize * 0.12, width: shSize, height: shSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff + pupilSize * 0.35, y: bigY + pupilOff * 0.8 + pupilSize * 0.12, width: shSize, height: shSize)), with: .color(.white))
            let sh2 = pupilSize * 0.18
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff + pupilSize * 0.1, y: bigY + pupilOff * 0.8 + pupilSize * 0.6, width: sh2, height: sh2)), with: .color(.white.opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff + pupilSize * 0.1, y: bigY + pupilOff * 0.8 + pupilSize * 0.6, width: sh2, height: sh2)), with: .color(.white.opacity(0.5)))

        case .sleepy:
            var lidL = Path()
            lidL.move(to: CGPoint(x: leftX - eyeSize * 0.1, y: eyeY + eyeSize * 0.5))
            lidL.addQuadCurve(to: CGPoint(x: leftX + eyeSize * 1.1, y: eyeY + eyeSize * 0.5), control: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.85))
            context.stroke(lidL, with: .color(.black.opacity(0.85)), lineWidth: s * 0.022)
            var lidR = Path()
            lidR.move(to: CGPoint(x: rightX - eyeSize * 0.1, y: eyeY + eyeSize * 0.5))
            lidR.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.1, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.85))
            context.stroke(lidR, with: .color(.black.opacity(0.85)), lineWidth: s * 0.022)
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.01, y: eyeY + eyeSize * 0.15))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.32))
            context.stroke(browL, with: .color(.black.opacity(0.45)), lineWidth: s * 0.016)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.15))
            browR.addLine(to: CGPoint(x: rightX - s * 0.01, y: eyeY + eyeSize * 0.32))
            context.stroke(browR, with: .color(.black.opacity(0.45)), lineWidth: s * 0.016)

        case .wink:
            let whiteL = CGRect(x: leftX - eyeSize * 0.2, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.4, height: eyeSize * 1.5)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            let shineSize = eyeSize * 0.38
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.45, y: eyeY + eyeSize * 0.12, width: shineSize, height: shineSize)), with: .color(.white))
            var winkArc = Path()
            winkArc.move(to: CGPoint(x: rightX - eyeSize * 0.1, y: eyeY + eyeSize * 0.5))
            winkArc.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.1, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY - eyeSize * 0.3))
            context.stroke(winkArc, with: .color(.black.opacity(0.85)), lineWidth: s * 0.028)

        case .stars:
            drawStar(context: &context, center: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.5), radius: eyeSize * 0.9, color: Color(hex: "FFD54F"))
            drawStar(context: &context, center: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.5), radius: eyeSize * 0.9, color: Color(hex: "FFD54F"))
            let starShine = eyeSize * 0.2
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.3, y: eyeY + eyeSize * 0.2, width: starShine, height: starShine)), with: .color(.white.opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.3, y: eyeY + eyeSize * 0.2, width: starShine, height: starShine)), with: .color(.white.opacity(0.6)))

        case .heart:
            drawHeart(context: &context, center: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4), size: eyeSize * 1.3, color: Color(hex: "E91E63"))
            drawHeart(context: &context, center: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4), size: eyeSize * 1.3, color: Color(hex: "E91E63"))
            let heartShine = eyeSize * 0.18
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.15, y: eyeY + eyeSize * 0.1, width: heartShine, height: heartShine)), with: .color(.white.opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.15, y: eyeY + eyeSize * 0.1, width: heartShine, height: heartShine)), with: .color(.white.opacity(0.5)))

        case .determined:
            let whiteL = CGRect(x: leftX - eyeSize * 0.2, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.4, height: eyeSize * 1.5)
            let whiteR = CGRect(x: rightX - eyeSize * 0.2, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.4, height: eyeSize * 1.5)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            let shineSize = eyeSize * 0.3
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.15, width: shineSize, height: shineSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.15, width: shineSize, height: shineSize)), with: .color(.white))
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.02, y: eyeY - eyeSize * 0.35))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.65))
            context.stroke(browL, with: .color(.black.opacity(0.7)), lineWidth: s * 0.028)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.35))
            browR.addLine(to: CGPoint(x: rightX - s * 0.02, y: eyeY - eyeSize * 0.65))
            context.stroke(browR, with: .color(.black.opacity(0.7)), lineWidth: s * 0.028)

        case .surprised:
            let bigSize = eyeSize * 1.7
            let bigY = eyeY - eyeSize * 0.3
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.3, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.3, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.stroke(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.3, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.2)), lineWidth: 1)
            context.stroke(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.3, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.2)), lineWidth: 1)
            let pupilSize = bigSize * 0.5
            let pupilOff = (bigSize - pupilSize) / 2
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.3 + pupilOff, y: bigY + pupilOff, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.3 + pupilOff, y: bigY + pupilOff, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))
            let shSize = pupilSize * 0.35
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.3 + pupilOff + pupilSize * 0.3, y: bigY + pupilOff + pupilSize * 0.1, width: shSize, height: shSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.3 + pupilOff + pupilSize * 0.3, y: bigY + pupilOff + pupilSize * 0.1, width: shSize, height: shSize)), with: .color(.white))

        case .cool:
            let glassW = eyeSize * 2.0
            let glassH = eyeSize * 1.3
            let glassY = eyeY - eyeSize * 0.15
            let glassLX = leftX - eyeSize * 0.5
            let glassRX = rightX - eyeSize * 0.5
            let glassLRect = CGRect(x: glassLX, y: glassY, width: glassW, height: glassH)
            let glassRRect = CGRect(x: glassRX, y: glassY, width: glassW, height: glassH)
            context.fill(Path(roundedRect: glassLRect, cornerRadius: 4), with: .color(.black.opacity(0.82)))
            context.fill(Path(roundedRect: glassRRect, cornerRadius: 4), with: .color(.black.opacity(0.82)))
            var bridge = Path()
            bridge.move(to: CGPoint(x: glassLX + glassW, y: glassY + glassH * 0.4))
            bridge.addLine(to: CGPoint(x: glassRX, y: glassY + glassH * 0.4))
            context.stroke(bridge, with: .color(.black.opacity(0.82)), lineWidth: s * 0.022)
            let shineW = glassW * 0.25
            let shineH = glassH * 0.22
            context.fill(Path(roundedRect: CGRect(x: glassLX + glassW * 0.12, y: glassY + glassH * 0.18, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.35)))
            context.fill(Path(roundedRect: CGRect(x: glassRX + glassW * 0.12, y: glassY + glassH * 0.18, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.35)))
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
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.09))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.022)

        case .bigSmile:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.4, y: mouthY - s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.4, y: mouthY - s * 0.01), control: CGPoint(x: centerX, y: mouthY + s * 0.14))
            path.closeSubpath()
            context.fill(path, with: .color(.black.opacity(0.7)))
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: centerX - s * 0.05, y: mouthY + s * 0.02, width: s * 0.10, height: s * 0.07))
            context.fill(tongue, with: .color(Color(hex: "E91E63").opacity(0.65)))

        case .tongue:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.07))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.022)
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: centerX - s * 0.035, y: mouthY + s * 0.02, width: s * 0.07, height: s * 0.09))
            context.fill(tongue, with: .color(Color(hex: "E91E63")))

        case .oh:
            let ohW = s * 0.07
            let ohH = s * 0.09
            let ohRect = CGRect(x: centerX - ohW * 0.5, y: mouthY - ohH * 0.3, width: ohW, height: ohH)
            context.fill(Path(ellipseIn: ohRect), with: .color(.black.opacity(0.7)))
            context.fill(Path(ellipseIn: CGRect(x: centerX - ohW * 0.2, y: mouthY - ohH * 0.15, width: ohW * 0.25, height: ohH * 0.2)), with: .color(.white.opacity(0.2)))

        case .catMouth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY + s * 0.02))
            path.addQuadCurve(to: CGPoint(x: centerX, y: mouthY - s * 0.01), control: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.07))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY + s * 0.02), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.07))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.020)

        case .smirk:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY - s * 0.03), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.08))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.022)

        case .teeth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.12))
            path.closeSubpath()
            context.fill(path, with: .color(.black.opacity(0.7)))
            var teethPath = Path()
            teethPath.move(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY + s * 0.028))
            teethPath.addLine(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY + s * 0.028))
            teethPath.closeSubpath()
            context.fill(teethPath, with: .color(.white))

        case .tiny:
            let dotSize = s * 0.035
            context.fill(Path(ellipseIn: CGRect(x: centerX - dotSize * 0.5, y: mouthY, width: dotSize, height: dotSize)), with: .color(.black.opacity(0.6)))

        case .flat:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.8, y: mouthY + s * 0.01))
            path.addLine(to: CGPoint(x: centerX + mouthW * 0.8, y: mouthY + s * 0.01))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.022)

        case .wavy:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addCurve(
                to: CGPoint(x: centerX + mouthW, y: mouthY),
                control1: CGPoint(x: centerX - mouthW * 0.4, y: mouthY + s * 0.07),
                control2: CGPoint(x: centerX + mouthW * 0.4, y: mouthY - s * 0.05)
            )
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.022)
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
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.82, width: s * 0.04, height: s * 0.04)), with: .color(Color.white.opacity(0.3)))

        case .topHat:
            let brimRect = CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.64, height: s * 0.06)
            context.fill(Path(roundedRect: brimRect, cornerRadius: 3), with: .color(.black.opacity(0.85)))
            let hatBody = CGRect(x: s * 0.28, y: s * 0.00, width: s * 0.44, height: s * 0.24)
            context.fill(Path(roundedRect: hatBody, cornerRadius: 4), with: .color(.black.opacity(0.85)))
            let band = CGRect(x: s * 0.28, y: s * 0.16, width: s * 0.44, height: s * 0.04)
            var bandPath = Path()
            bandPath.addRect(band)
            context.fill(bandPath, with: .color(Color(hex: "E91E63")))
            context.fill(Path(roundedRect: CGRect(x: s * 0.30, y: s * 0.02, width: s * 0.10, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.15)))

        case .bow:
            var bowL = Path()
            bowL.addEllipse(in: CGRect(x: s * 0.28, y: s * 0.14, width: s * 0.18, height: s * 0.14))
            var bowR = Path()
            bowR.addEllipse(in: CGRect(x: s * 0.54, y: s * 0.14, width: s * 0.18, height: s * 0.14))
            context.fill(bowL, with: .color(Color(hex: "E91E63")))
            context.fill(bowR, with: .color(Color(hex: "E91E63")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.32, y: s * 0.16, width: s * 0.08, height: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.58, y: s * 0.16, width: s * 0.08, height: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.5)))
            let knot = CGRect(x: s * 0.46, y: s * 0.17, width: s * 0.08, height: s * 0.08)
            context.fill(Path(ellipseIn: knot), with: .color(Color(hex: "C2185B")))

        case .glasses:
            let glassSize = s * 0.15
            let lensL = CGRect(x: s * 0.20, y: s * 0.37, width: glassSize, height: glassSize)
            let lensR = CGRect(x: s * 0.56, y: s * 0.37, width: glassSize, height: glassSize)
            context.fill(Path(ellipseIn: lensL), with: .color(Color.white.opacity(0.15)))
            context.fill(Path(ellipseIn: lensR), with: .color(Color.white.opacity(0.15)))
            context.stroke(Path(ellipseIn: lensL), with: .color(.black.opacity(0.8)), lineWidth: 2.5)
            context.stroke(Path(ellipseIn: lensR), with: .color(.black.opacity(0.8)), lineWidth: 2.5)
            var bridge = Path()
            bridge.move(to: CGPoint(x: s * 0.35, y: s * 0.44))
            bridge.addQuadCurve(to: CGPoint(x: s * 0.56, y: s * 0.44), control: CGPoint(x: s * 0.455, y: s * 0.40))
            context.stroke(bridge, with: .color(.black.opacity(0.8)), lineWidth: 2.5)

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
            var dot1 = Path()
            dot1.addEllipse(in: CGRect(x: s * 0.36, y: s * 0.28, width: s * 0.03, height: s * 0.03))
            dot1.addEllipse(in: CGRect(x: s * 0.50, y: s * 0.27, width: s * 0.03, height: s * 0.03))
            dot1.addEllipse(in: CGRect(x: s * 0.64, y: s * 0.28, width: s * 0.03, height: s * 0.03))
            context.fill(dot1, with: .color(Color.white.opacity(0.3)))

        case .halo:
            let haloRect = CGRect(x: s * 0.20, y: s * 0.06, width: s * 0.60, height: s * 0.16)
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFF9C4").opacity(0.45)), lineWidth: 7)
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFD54F")), lineWidth: 3)

        case .headphones:
            var band = Path()
            band.addArc(center: CGPoint(x: s * 0.50, y: s * 0.34), radius: s * 0.32, startAngle: .degrees(198), endAngle: .degrees(342), clockwise: false)
            context.stroke(band, with: .color(Color(hex: "424242")), lineWidth: s * 0.035)
            let padL = CGRect(x: s * 0.10, y: s * 0.36, width: s * 0.14, height: s * 0.18)
            let padR = CGRect(x: s * 0.76, y: s * 0.36, width: s * 0.14, height: s * 0.18)
            context.fill(Path(roundedRect: padL, cornerRadius: 5), with: .color(Color(hex: "424242")))
            context.fill(Path(roundedRect: padR, cornerRadius: 5), with: .color(Color(hex: "424242")))
            context.fill(Path(roundedRect: CGRect(x: s * 0.12, y: s * 0.38, width: s * 0.04, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.15)))
            context.fill(Path(roundedRect: CGRect(x: s * 0.78, y: s * 0.38, width: s * 0.04, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.15)))
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
