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

    private func lighter(_ color: Color, by amount: CGFloat = 0.3) -> Color {
        color.opacity(1.0 - Double(amount))
    }

    private func darker(_ color: Color, by amount: CGFloat = 0.25) -> Color {
        let r = CGRect(x: 0, y: 0, width: 1, height: 1)
        var path = Path()
        path.addRect(r)
        return color
    }

    private func drawAnimal(context: inout GraphicsContext, type: AnimalType, color: Color, size: CGFloat) {
        let s = size
        let faceColor = color
        let innerColor = Color.white.opacity(0.45)
        let darkAccent = Color.black.opacity(0.12)

        switch type {
        case .beaver:
            let earL = CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.16, height: s * 0.14)
            let earR = CGRect(x: s * 0.66, y: s * 0.22, width: s * 0.16, height: s * 0.14)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let head = CGRect(x: s * 0.15, y: s * 0.25, width: s * 0.7, height: s * 0.6)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.28, y: s * 0.52, width: s * 0.44, height: s * 0.3)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))
            var teeth = Path()
            teeth.addRoundedRect(in: CGRect(x: s * 0.42, y: s * 0.72, width: s * 0.07, height: s * 0.1), cornerSize: CGSize(width: 2, height: 2))
            teeth.addRoundedRect(in: CGRect(x: s * 0.51, y: s * 0.72, width: s * 0.07, height: s * 0.1), cornerSize: CGSize(width: 2, height: 2))
            context.fill(teeth, with: .color(.white))
            context.stroke(teeth, with: .color(darkAccent), lineWidth: 1)

        case .bird:
            var crest = Path()
            crest.move(to: CGPoint(x: s * 0.45, y: s * 0.15))
            crest.addLine(to: CGPoint(x: s * 0.42, y: s * 0.28))
            crest.addLine(to: CGPoint(x: s * 0.50, y: s * 0.20))
            crest.addLine(to: CGPoint(x: s * 0.55, y: s * 0.28))
            crest.addLine(to: CGPoint(x: s * 0.58, y: s * 0.15))
            crest.closeSubpath()
            context.fill(crest, with: .color(faceColor))
            let head = CGRect(x: s * 0.18, y: s * 0.25, width: s * 0.64, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let belly = CGRect(x: s * 0.26, y: s * 0.48, width: s * 0.48, height: s * 0.32)
            context.fill(Path(ellipseIn: belly), with: .color(innerColor))
            var beak = Path()
            beak.move(to: CGPoint(x: s * 0.44, y: s * 0.56))
            beak.addLine(to: CGPoint(x: s * 0.50, y: s * 0.66))
            beak.addLine(to: CGPoint(x: s * 0.56, y: s * 0.56))
            beak.closeSubpath()
            context.fill(beak, with: .color(Color(hex: "FFA726")))

        case .bunny:
            let earL = CGRect(x: s * 0.22, y: s * 0.02, width: s * 0.18, height: s * 0.40)
            let earR = CGRect(x: s * 0.60, y: s * 0.02, width: s * 0.18, height: s * 0.40)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.26, y: s * 0.08, width: s * 0.10, height: s * 0.28)
            let innerEarR = CGRect(x: s * 0.64, y: s * 0.08, width: s * 0.10, height: s * 0.28)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "F48FB1")))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "F48FB1")))
            let head = CGRect(x: s * 0.16, y: s * 0.30, width: s * 0.68, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let cheekL = CGRect(x: s * 0.18, y: s * 0.52, width: s * 0.18, height: s * 0.14)
            let cheekR = CGRect(x: s * 0.64, y: s * 0.52, width: s * 0.18, height: s * 0.14)
            context.fill(Path(ellipseIn: cheekL), with: .color(Color(hex: "F48FB1").opacity(0.3)))
            context.fill(Path(ellipseIn: cheekR), with: .color(Color(hex: "F48FB1").opacity(0.3)))

        case .cat:
            var earL = Path()
            earL.move(to: CGPoint(x: s * 0.15, y: s * 0.38))
            earL.addLine(to: CGPoint(x: s * 0.18, y: s * 0.12))
            earL.addLine(to: CGPoint(x: s * 0.38, y: s * 0.32))
            earL.closeSubpath()
            var earR = Path()
            earR.move(to: CGPoint(x: s * 0.85, y: s * 0.38))
            earR.addLine(to: CGPoint(x: s * 0.82, y: s * 0.12))
            earR.addLine(to: CGPoint(x: s * 0.62, y: s * 0.32))
            earR.closeSubpath()
            context.fill(earL, with: .color(faceColor))
            context.fill(earR, with: .color(faceColor))
            var innerEarL = Path()
            innerEarL.move(to: CGPoint(x: s * 0.18, y: s * 0.36))
            innerEarL.addLine(to: CGPoint(x: s * 0.20, y: s * 0.18))
            innerEarL.addLine(to: CGPoint(x: s * 0.34, y: s * 0.33))
            innerEarL.closeSubpath()
            var innerEarR = Path()
            innerEarR.move(to: CGPoint(x: s * 0.82, y: s * 0.36))
            innerEarR.addLine(to: CGPoint(x: s * 0.80, y: s * 0.18))
            innerEarR.addLine(to: CGPoint(x: s * 0.66, y: s * 0.33))
            innerEarR.closeSubpath()
            context.fill(innerEarL, with: .color(Color(hex: "F48FB1")))
            context.fill(innerEarR, with: .color(Color(hex: "F48FB1")))
            let head = CGRect(x: s * 0.14, y: s * 0.28, width: s * 0.72, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.34, y: s * 0.55, width: s * 0.32, height: s * 0.2)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))

        case .dog:
            let earL = CGRect(x: s * 0.08, y: s * 0.28, width: s * 0.22, height: s * 0.36)
            let earR = CGRect(x: s * 0.70, y: s * 0.28, width: s * 0.22, height: s * 0.36)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let head = CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.68, height: s * 0.6)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.30, y: s * 0.52, width: s * 0.40, height: s * 0.26)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))
            let nose = CGRect(x: s * 0.44, y: s * 0.54, width: s * 0.12, height: s * 0.09)
            context.fill(Path(ellipseIn: nose), with: .color(Color.black.opacity(0.7)))

        case .dragon:
            var hornL = Path()
            hornL.move(to: CGPoint(x: s * 0.25, y: s * 0.32))
            hornL.addLine(to: CGPoint(x: s * 0.18, y: s * 0.08))
            hornL.addLine(to: CGPoint(x: s * 0.35, y: s * 0.28))
            hornL.closeSubpath()
            var hornR = Path()
            hornR.move(to: CGPoint(x: s * 0.75, y: s * 0.32))
            hornR.addLine(to: CGPoint(x: s * 0.82, y: s * 0.08))
            hornR.addLine(to: CGPoint(x: s * 0.65, y: s * 0.28))
            hornR.closeSubpath()
            context.fill(hornL, with: .color(Color(hex: "FFA726")))
            context.fill(hornR, with: .color(Color(hex: "FFA726")))
            var spikes = Path()
            for i in 0..<5 {
                let cx = s * (0.35 + CGFloat(i) * 0.075)
                spikes.move(to: CGPoint(x: cx - s * 0.025, y: s * 0.28))
                spikes.addLine(to: CGPoint(x: cx, y: s * 0.18))
                spikes.addLine(to: CGPoint(x: cx + s * 0.025, y: s * 0.28))
                spikes.closeSubpath()
            }
            context.fill(spikes, with: .color(faceColor))
            let head = CGRect(x: s * 0.16, y: s * 0.26, width: s * 0.68, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let belly = CGRect(x: s * 0.28, y: s * 0.48, width: s * 0.44, height: s * 0.3)
            context.fill(Path(ellipseIn: belly), with: .color(innerColor))
            let nostrilL = CGRect(x: s * 0.38, y: s * 0.58, width: s * 0.06, height: s * 0.04)
            let nostrilR = CGRect(x: s * 0.56, y: s * 0.58, width: s * 0.06, height: s * 0.04)
            context.fill(Path(ellipseIn: nostrilL), with: .color(darkAccent))
            context.fill(Path(ellipseIn: nostrilR), with: .color(darkAccent))

        case .elephant:
            let earL = CGRect(x: s * 0.02, y: s * 0.22, width: s * 0.32, height: s * 0.46)
            let earR = CGRect(x: s * 0.66, y: s * 0.22, width: s * 0.32, height: s * 0.46)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.06, y: s * 0.28, width: s * 0.22, height: s * 0.34)
            let innerEarR = CGRect(x: s * 0.72, y: s * 0.28, width: s * 0.22, height: s * 0.34)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "F48FB1").opacity(0.3)))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "F48FB1").opacity(0.3)))
            let head = CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.64, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            var trunk = Path()
            trunk.move(to: CGPoint(x: s * 0.44, y: s * 0.60))
            trunk.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.88), control1: CGPoint(x: s * 0.42, y: s * 0.72), control2: CGPoint(x: s * 0.38, y: s * 0.85))
            trunk.addCurve(to: CGPoint(x: s * 0.56, y: s * 0.60), control1: CGPoint(x: s * 0.62, y: s * 0.85), control2: CGPoint(x: s * 0.58, y: s * 0.72))
            trunk.closeSubpath()
            context.fill(trunk, with: .color(faceColor))
            context.stroke(trunk, with: .color(darkAccent), lineWidth: 1.5)

        case .fox:
            var earL = Path()
            earL.move(to: CGPoint(x: s * 0.14, y: s * 0.38))
            earL.addLine(to: CGPoint(x: s * 0.20, y: s * 0.08))
            earL.addLine(to: CGPoint(x: s * 0.40, y: s * 0.30))
            earL.closeSubpath()
            var earR = Path()
            earR.move(to: CGPoint(x: s * 0.86, y: s * 0.38))
            earR.addLine(to: CGPoint(x: s * 0.80, y: s * 0.08))
            earR.addLine(to: CGPoint(x: s * 0.60, y: s * 0.30))
            earR.closeSubpath()
            context.fill(earL, with: .color(faceColor))
            context.fill(earR, with: .color(faceColor))
            let head = CGRect(x: s * 0.14, y: s * 0.26, width: s * 0.72, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            var chin = Path()
            chin.move(to: CGPoint(x: s * 0.26, y: s * 0.52))
            chin.addQuadCurve(to: CGPoint(x: s * 0.74, y: s * 0.52), control: CGPoint(x: s * 0.50, y: s * 0.88))
            chin.closeSubpath()
            context.fill(chin, with: .color(.white.opacity(0.8)))
            let nose = CGRect(x: s * 0.44, y: s * 0.55, width: s * 0.12, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))

        case .frog:
            let head = CGRect(x: s * 0.12, y: s * 0.30, width: s * 0.76, height: s * 0.52)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let eyeBumpL = CGRect(x: s * 0.18, y: s * 0.20, width: s * 0.26, height: s * 0.26)
            let eyeBumpR = CGRect(x: s * 0.56, y: s * 0.20, width: s * 0.26, height: s * 0.26)
            context.fill(Path(ellipseIn: eyeBumpL), with: .color(faceColor))
            context.fill(Path(ellipseIn: eyeBumpR), with: .color(faceColor))
            let belly = CGRect(x: s * 0.24, y: s * 0.48, width: s * 0.52, height: s * 0.30)
            context.fill(Path(ellipseIn: belly), with: .color(innerColor))

        case .giraffe:
            let hornBaseL = CGRect(x: s * 0.30, y: s * 0.10, width: s * 0.06, height: s * 0.22)
            let hornBaseR = CGRect(x: s * 0.64, y: s * 0.10, width: s * 0.06, height: s * 0.22)
            context.fill(Path(roundedRect: hornBaseL, cornerRadius: 3), with: .color(faceColor))
            context.fill(Path(roundedRect: hornBaseR, cornerRadius: 3), with: .color(faceColor))
            let hornTipL = CGRect(x: s * 0.28, y: s * 0.08, width: s * 0.10, height: s * 0.10)
            let hornTipR = CGRect(x: s * 0.62, y: s * 0.08, width: s * 0.10, height: s * 0.10)
            context.fill(Path(ellipseIn: hornTipL), with: .color(Color(hex: "8D6E63")))
            context.fill(Path(ellipseIn: hornTipR), with: .color(Color(hex: "8D6E63")))
            let head = CGRect(x: s * 0.18, y: s * 0.24, width: s * 0.64, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let spots: [(CGFloat, CGFloat, CGFloat)] = [
                (0.28, 0.36, 0.08), (0.65, 0.38, 0.07), (0.35, 0.68, 0.06),
                (0.58, 0.65, 0.07), (0.48, 0.35, 0.06),
            ]
            for spot in spots {
                let spotRect = CGRect(x: s * spot.0, y: s * spot.1, width: s * spot.2, height: s * spot.2)
                context.fill(Path(ellipseIn: spotRect), with: .color(Color(hex: "8D6E63").opacity(0.4)))
            }
            let muzzle = CGRect(x: s * 0.30, y: s * 0.58, width: s * 0.40, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))

        case .hedgehog:
            var spikes = Path()
            let center = CGPoint(x: s * 0.50, y: s * 0.48)
            for i in 0..<12 {
                let angle = Double(i) * (Double.pi / 6.0) - Double.pi * 0.1
                if angle > Double.pi * 0.6 { continue }
                let inner: CGFloat = s * 0.32
                let outer: CGFloat = s * 0.46
                let x1 = center.x + inner * CGFloat(cos(angle - 0.12))
                let y1 = center.y + inner * CGFloat(sin(angle - 0.12))
                let xTip = center.x + outer * CGFloat(cos(angle))
                let yTip = center.y + outer * CGFloat(sin(angle))
                let x2 = center.x + inner * CGFloat(cos(angle + 0.12))
                let y2 = center.y + inner * CGFloat(sin(angle + 0.12))
                spikes.move(to: CGPoint(x: x1, y: y1))
                spikes.addLine(to: CGPoint(x: xTip, y: yTip))
                spikes.addLine(to: CGPoint(x: x2, y: y2))
                spikes.closeSubpath()
            }
            context.fill(spikes, with: .color(Color(hex: "5D4037")))
            let head = CGRect(x: s * 0.18, y: s * 0.30, width: s * 0.64, height: s * 0.54)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.32, y: s * 0.52, width: s * 0.36, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))
            let nose = CGRect(x: s * 0.45, y: s * 0.54, width: s * 0.10, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))

        case .horse:
            var mane = Path()
            mane.move(to: CGPoint(x: s * 0.60, y: s * 0.12))
            mane.addCurve(to: CGPoint(x: s * 0.72, y: s * 0.60), control1: CGPoint(x: s * 0.82, y: s * 0.20), control2: CGPoint(x: s * 0.84, y: s * 0.50))
            mane.addLine(to: CGPoint(x: s * 0.62, y: s * 0.55))
            mane.addCurve(to: CGPoint(x: s * 0.55, y: s * 0.18), control1: CGPoint(x: s * 0.72, y: s * 0.40), control2: CGPoint(x: s * 0.70, y: s * 0.22))
            mane.closeSubpath()
            context.fill(mane, with: .color(Color(hex: "5D4037")))
            let earL = CGRect(x: s * 0.24, y: s * 0.14, width: s * 0.12, height: s * 0.18)
            let earR = CGRect(x: s * 0.58, y: s * 0.12, width: s * 0.12, height: s * 0.18)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let head = CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.62, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.26, y: s * 0.58, width: s * 0.42, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))

        case .lion:
            let maneRect = CGRect(x: s * 0.08, y: s * 0.12, width: s * 0.84, height: s * 0.78)
            context.fill(Path(ellipseIn: maneRect), with: .color(Color(hex: "E65100").opacity(0.6)))
            var maneSpikes = Path()
            let maneCenter = CGPoint(x: s * 0.50, y: s * 0.50)
            for i in 0..<16 {
                let angle = Double(i) * (Double.pi * 2.0 / 16.0)
                let inner: CGFloat = s * 0.34
                let outer: CGFloat = s * 0.46
                let x1 = maneCenter.x + inner * CGFloat(cos(angle - 0.15))
                let y1 = maneCenter.y + inner * CGFloat(sin(angle - 0.15))
                let xTip = maneCenter.x + outer * CGFloat(cos(angle))
                let yTip = maneCenter.y + outer * CGFloat(sin(angle))
                let x2 = maneCenter.x + inner * CGFloat(cos(angle + 0.15))
                let y2 = maneCenter.y + inner * CGFloat(sin(angle + 0.15))
                maneSpikes.move(to: CGPoint(x: x1, y: y1))
                maneSpikes.addLine(to: CGPoint(x: xTip, y: yTip))
                maneSpikes.addLine(to: CGPoint(x: x2, y: y2))
                maneSpikes.closeSubpath()
            }
            context.fill(maneSpikes, with: .color(Color(hex: "E65100").opacity(0.5)))
            let head = CGRect(x: s * 0.18, y: s * 0.24, width: s * 0.64, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.32, y: s * 0.52, width: s * 0.36, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))
            let nose = CGRect(x: s * 0.43, y: s * 0.54, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(Color(hex: "5D4037")))

        case .monkey:
            let earL = CGRect(x: s * 0.06, y: s * 0.34, width: s * 0.22, height: s * 0.22)
            let earR = CGRect(x: s * 0.72, y: s * 0.34, width: s * 0.22, height: s * 0.22)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let innerEarL = CGRect(x: s * 0.10, y: s * 0.38, width: s * 0.14, height: s * 0.14)
            let innerEarR = CGRect(x: s * 0.76, y: s * 0.38, width: s * 0.14, height: s * 0.14)
            context.fill(Path(ellipseIn: innerEarL), with: .color(Color(hex: "FFAB91")))
            context.fill(Path(ellipseIn: innerEarR), with: .color(Color(hex: "FFAB91")))
            let head = CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.68, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let face = CGRect(x: s * 0.24, y: s * 0.38, width: s * 0.52, height: s * 0.42)
            context.fill(Path(ellipseIn: face), with: .color(Color(hex: "FFAB91")))

        case .octopus:
            let head = CGRect(x: s * 0.16, y: s * 0.14, width: s * 0.68, height: s * 0.56)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            for i in 0..<5 {
                let cx = s * (0.18 + CGFloat(i) * 0.16)
                var tentacle = Path()
                tentacle.move(to: CGPoint(x: cx, y: s * 0.62))
                tentacle.addCurve(
                    to: CGPoint(x: cx + s * 0.04, y: s * 0.92),
                    control1: CGPoint(x: cx - s * 0.06, y: s * 0.76),
                    control2: CGPoint(x: cx + s * 0.10, y: s * 0.82)
                )
                tentacle.addLine(to: CGPoint(x: cx + s * 0.10, y: s * 0.90))
                tentacle.addCurve(
                    to: CGPoint(x: cx + s * 0.06, y: s * 0.62),
                    control1: CGPoint(x: cx + s * 0.14, y: s * 0.78),
                    control2: CGPoint(x: cx, y: s * 0.72)
                )
                tentacle.closeSubpath()
                context.fill(tentacle, with: .color(faceColor))
            }
            let face = CGRect(x: s * 0.28, y: s * 0.30, width: s * 0.44, height: s * 0.30)
            context.fill(Path(ellipseIn: face), with: .color(innerColor))

        case .owl:
            var tuftL = Path()
            tuftL.move(to: CGPoint(x: s * 0.22, y: s * 0.32))
            tuftL.addLine(to: CGPoint(x: s * 0.20, y: s * 0.12))
            tuftL.addLine(to: CGPoint(x: s * 0.34, y: s * 0.28))
            tuftL.closeSubpath()
            var tuftR = Path()
            tuftR.move(to: CGPoint(x: s * 0.78, y: s * 0.32))
            tuftR.addLine(to: CGPoint(x: s * 0.80, y: s * 0.12))
            tuftR.addLine(to: CGPoint(x: s * 0.66, y: s * 0.28))
            tuftR.closeSubpath()
            context.fill(tuftL, with: .color(faceColor))
            context.fill(tuftR, with: .color(faceColor))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let eyeRingL = CGRect(x: s * 0.20, y: s * 0.34, width: s * 0.28, height: s * 0.28)
            let eyeRingR = CGRect(x: s * 0.52, y: s * 0.34, width: s * 0.28, height: s * 0.28)
            context.fill(Path(ellipseIn: eyeRingL), with: .color(innerColor))
            context.fill(Path(ellipseIn: eyeRingR), with: .color(innerColor))
            var beak = Path()
            beak.move(to: CGPoint(x: s * 0.44, y: s * 0.58))
            beak.addLine(to: CGPoint(x: s * 0.50, y: s * 0.68))
            beak.addLine(to: CGPoint(x: s * 0.56, y: s * 0.58))
            beak.closeSubpath()
            context.fill(beak, with: .color(Color(hex: "FFA726")))

        case .panda:
            let earL = CGRect(x: s * 0.12, y: s * 0.16, width: s * 0.22, height: s * 0.22)
            let earR = CGRect(x: s * 0.66, y: s * 0.16, width: s * 0.22, height: s * 0.22)
            context.fill(Path(ellipseIn: earL), with: .color(.black.opacity(0.8)))
            context.fill(Path(ellipseIn: earR), with: .color(.black.opacity(0.8)))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let patchL = CGRect(x: s * 0.22, y: s * 0.36, width: s * 0.20, height: s * 0.20)
            let patchR = CGRect(x: s * 0.58, y: s * 0.36, width: s * 0.20, height: s * 0.20)
            context.fill(Path(ellipseIn: patchL), with: .color(.black.opacity(0.75)))
            context.fill(Path(ellipseIn: patchR), with: .color(.black.opacity(0.75)))
            let nose = CGRect(x: s * 0.44, y: s * 0.58, width: s * 0.12, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))

        case .raccoon:
            let earL = CGRect(x: s * 0.14, y: s * 0.16, width: s * 0.18, height: s * 0.18)
            let earR = CGRect(x: s * 0.68, y: s * 0.16, width: s * 0.18, height: s * 0.18)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let mask = CGRect(x: s * 0.18, y: s * 0.36, width: s * 0.64, height: s * 0.18)
            context.fill(Path(roundedRect: mask, cornerRadius: s * 0.06), with: .color(.black.opacity(0.6)))
            let muzzle = CGRect(x: s * 0.34, y: s * 0.54, width: s * 0.32, height: s * 0.20)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))
            let nose = CGRect(x: s * 0.44, y: s * 0.56, width: s * 0.12, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.7)))

        case .seal:
            let head = CGRect(x: s * 0.14, y: s * 0.22, width: s * 0.72, height: s * 0.62)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let belly = CGRect(x: s * 0.24, y: s * 0.44, width: s * 0.52, height: s * 0.36)
            context.fill(Path(ellipseIn: belly), with: .color(innerColor))
            var flipperL = Path()
            flipperL.addEllipse(in: CGRect(x: s * 0.06, y: s * 0.52, width: s * 0.18, height: s * 0.24))
            var flipperR = Path()
            flipperR.addEllipse(in: CGRect(x: s * 0.76, y: s * 0.52, width: s * 0.18, height: s * 0.24))
            context.fill(flipperL, with: .color(faceColor))
            context.fill(flipperR, with: .color(faceColor))
            let nose = CGRect(x: s * 0.44, y: s * 0.52, width: s * 0.12, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.6)))
            let dotL = CGRect(x: s * 0.34, y: s * 0.58, width: s * 0.03, height: s * 0.03)
            let dotR = CGRect(x: s * 0.63, y: s * 0.58, width: s * 0.03, height: s * 0.03)
            context.fill(Path(ellipseIn: dotL), with: .color(darkAccent))
            context.fill(Path(ellipseIn: dotR), with: .color(darkAccent))

        case .sloth:
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.60)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let patchL = CGRect(x: s * 0.22, y: s * 0.34, width: s * 0.22, height: s * 0.24)
            let patchR = CGRect(x: s * 0.56, y: s * 0.34, width: s * 0.22, height: s * 0.24)
            context.fill(Path(ellipseIn: patchL), with: .color(Color(hex: "5D4037").opacity(0.4)))
            context.fill(Path(ellipseIn: patchR), with: .color(Color(hex: "5D4037").opacity(0.4)))
            let muzzle = CGRect(x: s * 0.32, y: s * 0.54, width: s * 0.36, height: s * 0.22)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))
            let nose = CGRect(x: s * 0.44, y: s * 0.56, width: s * 0.12, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(.black.opacity(0.6)))

        case .turtle:
            var shell = Path()
            shell.addEllipse(in: CGRect(x: s * 0.15, y: s * 0.38, width: s * 0.70, height: s * 0.52))
            context.fill(shell, with: .color(Color(hex: "689F38")))
            var hexPattern = Path()
            let hCenter = CGPoint(x: s * 0.50, y: s * 0.62)
            let hSize: CGFloat = s * 0.10
            for i in 0..<6 {
                let angle = Double(i) * (Double.pi / 3.0) - Double.pi / 6.0
                let px = hCenter.x + hSize * CGFloat(cos(angle))
                let py = hCenter.y + hSize * CGFloat(sin(angle))
                if i == 0 { hexPattern.move(to: CGPoint(x: px, y: py)) }
                else { hexPattern.addLine(to: CGPoint(x: px, y: py)) }
            }
            hexPattern.closeSubpath()
            context.stroke(hexPattern, with: .color(Color(hex: "558B2F").opacity(0.5)), lineWidth: 1.5)
            let head = CGRect(x: s * 0.22, y: s * 0.18, width: s * 0.56, height: s * 0.50)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.32, y: s * 0.42, width: s * 0.36, height: s * 0.22)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))

        case .unicorn:
            var horn = Path()
            horn.move(to: CGPoint(x: s * 0.46, y: s * 0.06))
            horn.addLine(to: CGPoint(x: s * 0.42, y: s * 0.28))
            horn.addLine(to: CGPoint(x: s * 0.58, y: s * 0.28))
            horn.closeSubpath()
            context.fill(horn, with: .color(Color(hex: "FFD54F")))
            context.stroke(horn, with: .color(Color(hex: "FFA726").opacity(0.5)), lineWidth: 1)
            var mane = Path()
            mane.move(to: CGPoint(x: s * 0.62, y: s * 0.18))
            mane.addCurve(to: CGPoint(x: s * 0.78, y: s * 0.60), control1: CGPoint(x: s * 0.88, y: s * 0.22), control2: CGPoint(x: s * 0.90, y: s * 0.50))
            mane.addLine(to: CGPoint(x: s * 0.68, y: s * 0.55))
            mane.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.22), control1: CGPoint(x: s * 0.78, y: s * 0.42), control2: CGPoint(x: s * 0.76, y: s * 0.26))
            mane.closeSubpath()
            context.fill(mane, with: .color(Color(hex: "CE93D8")))
            let earL = CGRect(x: s * 0.22, y: s * 0.18, width: s * 0.12, height: s * 0.18)
            let earR = CGRect(x: s * 0.58, y: s * 0.16, width: s * 0.12, height: s * 0.18)
            context.fill(Path(ellipseIn: earL), with: .color(faceColor))
            context.fill(Path(ellipseIn: earR), with: .color(faceColor))
            let head = CGRect(x: s * 0.16, y: s * 0.26, width: s * 0.62, height: s * 0.58)
            context.fill(Path(ellipseIn: head), with: .color(faceColor))
            let muzzle = CGRect(x: s * 0.26, y: s * 0.54, width: s * 0.42, height: s * 0.24)
            context.fill(Path(ellipseIn: muzzle), with: .color(innerColor))
        }
    }

    private func drawEyes(context: inout GraphicsContext, style: EyeStyle, size: CGFloat) {
        let s = size
        let eyeY: CGFloat = s * 0.42
        let leftX: CGFloat = s * 0.34
        let rightX: CGFloat = s * 0.58
        let eyeSize: CGFloat = s * 0.08

        switch style {
        case .normal:
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            let shineSize = eyeSize * 0.35
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.15, width: shineSize, height: shineSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.15, width: shineSize, height: shineSize)), with: .color(.white))

        case .happy:
            var arcL = Path()
            arcL.move(to: CGPoint(x: leftX, y: eyeY + eyeSize * 0.5))
            arcL.addQuadCurve(to: CGPoint(x: leftX + eyeSize, y: eyeY + eyeSize * 0.5), control: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY - eyeSize * 0.3))
            context.stroke(arcL, with: .color(.black.opacity(0.85)), lineWidth: s * 0.025)
            var arcR = Path()
            arcR.move(to: CGPoint(x: rightX, y: eyeY + eyeSize * 0.5))
            arcR.addQuadCurve(to: CGPoint(x: rightX + eyeSize, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY - eyeSize * 0.3))
            context.stroke(arcR, with: .color(.black.opacity(0.85)), lineWidth: s * 0.025)

        case .big:
            let bigSize = eyeSize * 1.6
            let bigY = eyeY - eyeSize * 0.3
            let bigLX = leftX - eyeSize * 0.3
            let bigRX = rightX - eyeSize * 0.3
            context.fill(Path(ellipseIn: CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.stroke(Path(ellipseIn: CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.3)), lineWidth: 1)
            context.stroke(Path(ellipseIn: CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.3)), lineWidth: 1)
            let pupilSize = bigSize * 0.5
            let pupilOff = bigSize * 0.3
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff, y: bigY + pupilOff * 0.8, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff, y: bigY + pupilOff * 0.8, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))
            let shSize = pupilSize * 0.35
            context.fill(Path(ellipseIn: CGRect(x: bigLX + pupilOff + pupilSize * 0.45, y: bigY + pupilOff * 0.8 + pupilSize * 0.15, width: shSize, height: shSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: bigRX + pupilOff + pupilSize * 0.45, y: bigY + pupilOff * 0.8 + pupilSize * 0.15, width: shSize, height: shSize)), with: .color(.white))

        case .sleepy:
            var lidL = Path()
            lidL.move(to: CGPoint(x: leftX, y: eyeY + eyeSize * 0.5))
            lidL.addQuadCurve(to: CGPoint(x: leftX + eyeSize, y: eyeY + eyeSize * 0.5), control: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.8))
            context.stroke(lidL, with: .color(.black.opacity(0.85)), lineWidth: s * 0.02)
            var lidR = Path()
            lidR.move(to: CGPoint(x: rightX, y: eyeY + eyeSize * 0.5))
            lidR.addQuadCurve(to: CGPoint(x: rightX + eyeSize, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.8))
            context.stroke(lidR, with: .color(.black.opacity(0.85)), lineWidth: s * 0.02)
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.01, y: eyeY + eyeSize * 0.2))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.35))
            context.stroke(browL, with: .color(.black.opacity(0.5)), lineWidth: s * 0.015)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.2))
            browR.addLine(to: CGPoint(x: rightX - s * 0.01, y: eyeY + eyeSize * 0.35))
            context.stroke(browR, with: .color(.black.opacity(0.5)), lineWidth: s * 0.015)

        case .wink:
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            let shineSize = eyeSize * 0.35
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.15, width: shineSize, height: shineSize)), with: .color(.white))
            var winkArc = Path()
            winkArc.move(to: CGPoint(x: rightX, y: eyeY + eyeSize * 0.5))
            winkArc.addQuadCurve(to: CGPoint(x: rightX + eyeSize, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY - eyeSize * 0.2))
            context.stroke(winkArc, with: .color(.black.opacity(0.85)), lineWidth: s * 0.025)

        case .stars:
            drawStar(context: &context, center: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.5), radius: eyeSize * 0.8, color: Color(hex: "FFD54F"))
            drawStar(context: &context, center: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.5), radius: eyeSize * 0.8, color: Color(hex: "FFD54F"))

        case .heart:
            drawHeart(context: &context, center: CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4), size: eyeSize * 1.2, color: Color(hex: "E91E63"))
            drawHeart(context: &context, center: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4), size: eyeSize * 1.2, color: Color(hex: "E91E63"))

        case .determined:
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.02, y: eyeY - eyeSize * 0.3))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.6))
            context.stroke(browL, with: .color(.black.opacity(0.7)), lineWidth: s * 0.025)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.3))
            browR.addLine(to: CGPoint(x: rightX - s * 0.02, y: eyeY - eyeSize * 0.6))
            context.stroke(browR, with: .color(.black.opacity(0.7)), lineWidth: s * 0.025)

        case .surprised:
            let bigSize = eyeSize * 1.5
            let bigY = eyeY - eyeSize * 0.2
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.2, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.2, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.stroke(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.2, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.3)), lineWidth: 1)
            context.stroke(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.2, y: bigY, width: bigSize, height: bigSize)), with: .color(.black.opacity(0.3)), lineWidth: 1)
            let pupilSize = bigSize * 0.45
            let pupilOff = (bigSize - pupilSize) / 2
            context.fill(Path(ellipseIn: CGRect(x: leftX - eyeSize * 0.2 + pupilOff, y: bigY + pupilOff, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX - eyeSize * 0.2 + pupilOff, y: bigY + pupilOff, width: pupilSize, height: pupilSize)), with: .color(.black.opacity(0.85)))

        case .cool:
            let glassW = eyeSize * 1.8
            let glassH = eyeSize * 1.2
            let glassY = eyeY - eyeSize * 0.1
            let glassLX = leftX - eyeSize * 0.4
            let glassRX = rightX - eyeSize * 0.4
            let glassLRect = CGRect(x: glassLX, y: glassY, width: glassW, height: glassH)
            let glassRRect = CGRect(x: glassRX, y: glassY, width: glassW, height: glassH)
            context.fill(Path(roundedRect: glassLRect, cornerRadius: 3), with: .color(.black.opacity(0.8)))
            context.fill(Path(roundedRect: glassRRect, cornerRadius: 3), with: .color(.black.opacity(0.8)))
            var bridge = Path()
            bridge.move(to: CGPoint(x: glassLX + glassW, y: glassY + glassH * 0.4))
            bridge.addLine(to: CGPoint(x: glassRX, y: glassY + glassH * 0.4))
            context.stroke(bridge, with: .color(.black.opacity(0.8)), lineWidth: s * 0.02)
            let shineW = glassW * 0.3
            let shineH = glassH * 0.25
            context.fill(Path(roundedRect: CGRect(x: glassLX + glassW * 0.15, y: glassY + glassH * 0.2, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.3)))
            context.fill(Path(roundedRect: CGRect(x: glassRX + glassW * 0.15, y: glassY + glassH * 0.2, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.3)))
        }
    }

    private func drawMouth(context: inout GraphicsContext, style: MouthStyle, size: CGFloat) {
        let s = size
        let mouthY: CGFloat = s * 0.62
        let centerX: CGFloat = s * 0.50
        let mouthW: CGFloat = s * 0.12

        switch style {
        case .smile:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.08))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.02)

        case .bigSmile:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY - s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY - s * 0.01), control: CGPoint(x: centerX, y: mouthY + s * 0.12))
            path.closeSubpath()
            context.fill(path, with: .color(.black.opacity(0.7)))
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: centerX - s * 0.04, y: mouthY + s * 0.02, width: s * 0.08, height: s * 0.06))
            context.fill(tongue, with: .color(Color(hex: "E91E63").opacity(0.6)))

        case .tongue:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.06))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.02)
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: centerX - s * 0.03, y: mouthY + s * 0.02, width: s * 0.06, height: s * 0.08))
            context.fill(tongue, with: .color(Color(hex: "E91E63")))

        case .oh:
            let ohSize = s * 0.06
            context.fill(Path(ellipseIn: CGRect(x: centerX - ohSize * 0.5, y: mouthY - ohSize * 0.3, width: ohSize, height: ohSize * 1.2)), with: .color(.black.opacity(0.7)))

        case .catMouth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY + s * 0.02))
            path.addQuadCurve(to: CGPoint(x: centerX, y: mouthY - s * 0.01), control: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.06))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY + s * 0.02), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.06))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.018)

        case .smirk:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.2, y: mouthY - s * 0.02), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.07))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.02)

        case .teeth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.2, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.2, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.1))
            path.closeSubpath()
            context.fill(path, with: .color(.black.opacity(0.7)))
            var teethPath = Path()
            teethPath.move(to: CGPoint(x: centerX - mouthW * 1.2, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.2, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.2, y: mouthY + s * 0.025))
            teethPath.addLine(to: CGPoint(x: centerX - mouthW * 1.2, y: mouthY + s * 0.025))
            teethPath.closeSubpath()
            context.fill(teethPath, with: .color(.white))

        case .tiny:
            let dotSize = s * 0.03
            context.fill(Path(ellipseIn: CGRect(x: centerX - dotSize * 0.5, y: mouthY, width: dotSize, height: dotSize)), with: .color(.black.opacity(0.6)))

        case .flat:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.8, y: mouthY + s * 0.01))
            path.addLine(to: CGPoint(x: centerX + mouthW * 0.8, y: mouthY + s * 0.01))
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.02)

        case .wavy:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addCurve(
                to: CGPoint(x: centerX + mouthW, y: mouthY),
                control1: CGPoint(x: centerX - mouthW * 0.4, y: mouthY + s * 0.06),
                control2: CGPoint(x: centerX + mouthW * 0.4, y: mouthY - s * 0.04)
            )
            context.stroke(path, with: .color(.black.opacity(0.7)), lineWidth: s * 0.02)
        }
    }

    private func drawAccessory(context: inout GraphicsContext, type: AccessoryType, size: CGFloat) {
        let s = size
        guard type != .none else { return }

        switch type {
        case .none: break

        case .crown:
            var crown = Path()
            crown.move(to: CGPoint(x: s * 0.25, y: s * 0.28))
            crown.addLine(to: CGPoint(x: s * 0.28, y: s * 0.14))
            crown.addLine(to: CGPoint(x: s * 0.36, y: s * 0.22))
            crown.addLine(to: CGPoint(x: s * 0.44, y: s * 0.10))
            crown.addLine(to: CGPoint(x: s * 0.50, y: s * 0.20))
            crown.addLine(to: CGPoint(x: s * 0.56, y: s * 0.10))
            crown.addLine(to: CGPoint(x: s * 0.64, y: s * 0.22))
            crown.addLine(to: CGPoint(x: s * 0.72, y: s * 0.14))
            crown.addLine(to: CGPoint(x: s * 0.75, y: s * 0.28))
            crown.closeSubpath()
            context.fill(crown, with: .color(Color(hex: "FFD54F")))
            context.stroke(crown, with: .color(Color(hex: "FFA726")), lineWidth: 1.5)

        case .gradCap:
            var cap = Path()
            cap.move(to: CGPoint(x: s * 0.50, y: s * 0.10))
            cap.addLine(to: CGPoint(x: s * 0.22, y: s * 0.24))
            cap.addLine(to: CGPoint(x: s * 0.50, y: s * 0.32))
            cap.addLine(to: CGPoint(x: s * 0.78, y: s * 0.24))
            cap.closeSubpath()
            context.fill(cap, with: .color(.black.opacity(0.85)))
            let boardRect = CGRect(x: s * 0.30, y: s * 0.22, width: s * 0.40, height: s * 0.06)
            context.fill(Path(roundedRect: boardRect, cornerRadius: 2), with: .color(.black.opacity(0.85)))
            var tassel = Path()
            tassel.move(to: CGPoint(x: s * 0.50, y: s * 0.24))
            tassel.addCurve(to: CGPoint(x: s * 0.72, y: s * 0.38), control1: CGPoint(x: s * 0.55, y: s * 0.28), control2: CGPoint(x: s * 0.68, y: s * 0.34))
            context.stroke(tassel, with: .color(Color(hex: "FFD54F")), lineWidth: 2)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.36, width: s * 0.05, height: s * 0.05)), with: .color(Color(hex: "FFD54F")))

        case .stethoscope:
            var stetho = Path()
            stetho.move(to: CGPoint(x: s * 0.35, y: s * 0.30))
            stetho.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.85), control1: CGPoint(x: s * 0.20, y: s * 0.50), control2: CGPoint(x: s * 0.25, y: s * 0.80))
            stetho.addCurve(to: CGPoint(x: s * 0.65, y: s * 0.30), control1: CGPoint(x: s * 0.75, y: s * 0.80), control2: CGPoint(x: s * 0.80, y: s * 0.50))
            context.stroke(stetho, with: .color(Color(hex: "78909C")), lineWidth: 2.5)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.44, y: s * 0.80, width: s * 0.12, height: s * 0.12)), with: .color(Color(hex: "546E7A")))

        case .topHat:
            let brimRect = CGRect(x: s * 0.20, y: s * 0.22, width: s * 0.60, height: s * 0.06)
            context.fill(Path(roundedRect: brimRect, cornerRadius: 3), with: .color(.black.opacity(0.85)))
            let hatBody = CGRect(x: s * 0.30, y: s * 0.02, width: s * 0.40, height: s * 0.22)
            context.fill(Path(roundedRect: hatBody, cornerRadius: 4), with: .color(.black.opacity(0.85)))
            let band = CGRect(x: s * 0.30, y: s * 0.16, width: s * 0.40, height: s * 0.04)
            var bandPath = Path()
            bandPath.addRect(band)
            context.fill(bandPath, with: .color(Color(hex: "E91E63")))

        case .bow:
            var bowL = Path()
            bowL.addEllipse(in: CGRect(x: s * 0.30, y: s * 0.16, width: s * 0.16, height: s * 0.12))
            var bowR = Path()
            bowR.addEllipse(in: CGRect(x: s * 0.54, y: s * 0.16, width: s * 0.16, height: s * 0.12))
            context.fill(bowL, with: .color(Color(hex: "E91E63")))
            context.fill(bowR, with: .color(Color(hex: "E91E63")))
            let knot = CGRect(x: s * 0.46, y: s * 0.18, width: s * 0.08, height: s * 0.08)
            context.fill(Path(ellipseIn: knot), with: .color(Color(hex: "C2185B")))

        case .glasses:
            let glassSize = s * 0.14
            let lensL = CGRect(x: s * 0.22, y: s * 0.38, width: glassSize, height: glassSize)
            let lensR = CGRect(x: s * 0.56, y: s * 0.38, width: glassSize, height: glassSize)
            context.stroke(Path(ellipseIn: lensL), with: .color(.black.opacity(0.8)), lineWidth: 2)
            context.stroke(Path(ellipseIn: lensR), with: .color(.black.opacity(0.8)), lineWidth: 2)
            var bridge = Path()
            bridge.move(to: CGPoint(x: s * 0.36, y: s * 0.44))
            bridge.addLine(to: CGPoint(x: s * 0.56, y: s * 0.44))
            context.stroke(bridge, with: .color(.black.opacity(0.8)), lineWidth: 2)

        case .bandana:
            var bandana = Path()
            bandana.move(to: CGPoint(x: s * 0.14, y: s * 0.32))
            bandana.addQuadCurve(to: CGPoint(x: s * 0.86, y: s * 0.32), control: CGPoint(x: s * 0.50, y: s * 0.26))
            bandana.addLine(to: CGPoint(x: s * 0.86, y: s * 0.36))
            bandana.addQuadCurve(to: CGPoint(x: s * 0.14, y: s * 0.36), control: CGPoint(x: s * 0.50, y: s * 0.30))
            bandana.closeSubpath()
            context.fill(bandana, with: .color(Color(hex: "E53935")))
            var knot = Path()
            knot.move(to: CGPoint(x: s * 0.82, y: s * 0.34))
            knot.addLine(to: CGPoint(x: s * 0.92, y: s * 0.42))
            knot.addLine(to: CGPoint(x: s * 0.88, y: s * 0.44))
            knot.addLine(to: CGPoint(x: s * 0.80, y: s * 0.38))
            knot.closeSubpath()
            context.fill(knot, with: .color(Color(hex: "E53935")))

        case .halo:
            let haloRect = CGRect(x: s * 0.22, y: s * 0.08, width: s * 0.56, height: s * 0.14)
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFD54F")), lineWidth: 3)
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFF9C4").opacity(0.5)), lineWidth: 6)

        case .headphones:
            var band = Path()
            band.addArc(center: CGPoint(x: s * 0.50, y: s * 0.36), radius: s * 0.30, startAngle: .degrees(200), endAngle: .degrees(340), clockwise: false)
            context.stroke(band, with: .color(Color(hex: "424242")), lineWidth: s * 0.03)
            let padL = CGRect(x: s * 0.12, y: s * 0.38, width: s * 0.12, height: s * 0.16)
            let padR = CGRect(x: s * 0.76, y: s * 0.38, width: s * 0.12, height: s * 0.16)
            context.fill(Path(roundedRect: padL, cornerRadius: 4), with: .color(Color(hex: "424242")))
            context.fill(Path(roundedRect: padR, cornerRadius: 4), with: .color(Color(hex: "424242")))
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
