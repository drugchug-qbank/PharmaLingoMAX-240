import SwiftUI

struct AnimalAvatarView: View {
    let animalType: AnimalType
    let bodyColor: Color
    let backgroundColor: Color
    let eyeStyle: EyeStyle
    let mouthStyle: MouthStyle
    let accessory: AccessoryType
    let size: CGFloat

    static func tileCornerRadius(for size: CGFloat) -> CGFloat {
        min(max(size * 0.22, 10), 44)
    }

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
        .clipShape(.rect(cornerRadius: Self.tileCornerRadius(for: size)))
    }

    private func drawBackground(context: inout GraphicsContext, size: CGFloat, color: Color) {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        let cr = Self.tileCornerRadius(for: size)
        let bgPath = Path(roundedRect: rect, cornerRadius: cr)
        let lt = color.mix(with: .white, by: 0.10)
        let dk = color.mix(with: .black, by: 0.08)
        context.fill(bgPath, with: .linearGradient(
            Gradient(colors: [lt, dk]),
            startPoint: CGPoint(x: 0, y: 0),
            endPoint: CGPoint(x: size, y: size)
        ))
    }

    private func darker(_ color: Color, by amount: CGFloat = 0.15) -> Color {
        color.opacity(1.0).mix(with: .black, by: amount)
    }

    private func lighter(_ color: Color, by amount: CGFloat = 0.25) -> Color {
        color.opacity(1.0).mix(with: .white, by: amount)
    }

    private func fns(context: inout GraphicsContext, path: Path, fill: Color, outline: Color, lineWidth: CGFloat) {
        context.fill(path, with: .color(fill))
        context.stroke(path, with: .color(outline), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
    }

    private func drawAnimal(context: inout GraphicsContext, type: AnimalType, color: Color, size: CGFloat) {
        let s = size
        let fc = color
        let belly = Color.white.opacity(0.55)
        let highlight = Color.white.opacity(0.30)
        let cheek = Color(hex: "FF8A80").opacity(0.30)
        let darkAccent = Color.black.opacity(0.12)
        let noseColor = Color.black.opacity(0.65)
        let oc = Color.black.opacity(0.92)
        let ow: CGFloat = s * 0.020
        let iw: CGFloat = s * 0.009

        switch type {
        case .bear:
            let earL = CGRect(x: s * 0.10, y: s * 0.18, width: s * 0.22, height: s * 0.22)
            let earR = CGRect(x: s * 0.68, y: s * 0.18, width: s * 0.22, height: s * 0.22)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.04, dy: s * 0.04)), with: .color(Color(hex: "FFAB91").opacity(0.4)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.04, dy: s * 0.04)), with: .color(Color(hex: "FFAB91").opacity(0.4)))
            let bearHead = CGRect(x: s * 0.12, y: s * 0.24, width: s * 0.76, height: s * 0.64)
            fns(context: &context, path: Path(ellipseIn: bearHead), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let bearMuzzle = CGRect(x: s * 0.28, y: s * 0.52, width: s * 0.44, height: s * 0.30)
            fns(context: &context, path: Path(ellipseIn: bearMuzzle), fill: belly, outline: oc, lineWidth: iw)
            let bearNose = CGRect(x: s * 0.42, y: s * 0.54, width: s * 0.16, height: s * 0.11)
            context.fill(Path(ellipseIn: bearNose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .beaver:
            let earL = CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.18, height: s * 0.16)
            let earR = CGRect(x: s * 0.66, y: s * 0.22, width: s * 0.18, height: s * 0.16)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "D7CCC8")))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "D7CCC8")))
            let head = CGRect(x: s * 0.13, y: s * 0.26, width: s * 0.74, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.28, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.40, y: s * 0.58, width: s * 0.40, height: s * 0.26)), with: .color(darker(fc, by: 0.06)))
            let muzzle = CGRect(x: s * 0.26, y: s * 0.52, width: s * 0.48, height: s * 0.30)
            fns(context: &context, path: Path(ellipseIn: muzzle), fill: belly, outline: oc, lineWidth: iw)
            let nose = CGRect(x: s * 0.42, y: s * 0.52, width: s * 0.16, height: s * 0.11)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.53, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.45)))
            var teeth = Path()
            teeth.addRoundedRect(in: CGRect(x: s * 0.42, y: s * 0.72, width: s * 0.07, height: s * 0.10), cornerSize: CGSize(width: 2, height: 2))
            teeth.addRoundedRect(in: CGRect(x: s * 0.51, y: s * 0.72, width: s * 0.07, height: s * 0.10), cornerSize: CGSize(width: 2, height: 2))
            context.fill(teeth, with: .color(.white))
            context.stroke(teeth, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            var divider = Path()
            divider.move(to: CGPoint(x: s * 0.50, y: s * 0.72))
            divider.addLine(to: CGPoint(x: s * 0.50, y: s * 0.82))
            context.stroke(divider, with: .color(oc.opacity(0.5)), lineWidth: max(1, s * 0.006))
            for furY in [s * 0.32, s * 0.36, s * 0.40] {
                var fur = Path()
                fur.move(to: CGPoint(x: s * 0.30, y: furY))
                fur.addQuadCurve(to: CGPoint(x: s * 0.42, y: furY), control: CGPoint(x: s * 0.36, y: furY - s * 0.012))
                context.stroke(fur, with: .color(darker(fc, by: 0.10)), lineWidth: max(1.0, s * 0.008))
            }
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
            context.stroke(crest, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            let head = CGRect(x: s * 0.15, y: s * 0.24, width: s * 0.70, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.26, width: s * 0.32, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.24, y: s * 0.50, width: s * 0.52, height: s * 0.32)), with: .color(belly))
            var wingL = Path()
            wingL.move(to: CGPoint(x: s * 0.14, y: s * 0.50))
            wingL.addQuadCurve(to: CGPoint(x: s * 0.14, y: s * 0.72), control: CGPoint(x: s * 0.04, y: s * 0.60))
            wingL.addQuadCurve(to: CGPoint(x: s * 0.24, y: s * 0.58), control: CGPoint(x: s * 0.18, y: s * 0.68))
            wingL.closeSubpath()
            context.fill(wingL, with: .color(darker(fc, by: 0.10)))
            var wingR = Path()
            wingR.move(to: CGPoint(x: s * 0.86, y: s * 0.50))
            wingR.addQuadCurve(to: CGPoint(x: s * 0.86, y: s * 0.72), control: CGPoint(x: s * 0.96, y: s * 0.60))
            wingR.addQuadCurve(to: CGPoint(x: s * 0.76, y: s * 0.58), control: CGPoint(x: s * 0.82, y: s * 0.68))
            wingR.closeSubpath()
            context.fill(wingR, with: .color(darker(fc, by: 0.10)))
            var beak = Path()
            beak.move(to: CGPoint(x: s * 0.40, y: s * 0.56))
            beak.addQuadCurve(to: CGPoint(x: s * 0.60, y: s * 0.56), control: CGPoint(x: s * 0.50, y: s * 0.50))
            beak.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.68), control: CGPoint(x: s * 0.57, y: s * 0.63))
            beak.addQuadCurve(to: CGPoint(x: s * 0.40, y: s * 0.56), control: CGPoint(x: s * 0.43, y: s * 0.63))
            beak.closeSubpath()
            context.fill(beak, with: .color(Color(hex: "FFA726")))
            context.stroke(beak, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.70, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .bunny:
            let earL = CGRect(x: s * 0.20, y: s * 0.00, width: s * 0.20, height: s * 0.42)
            let earR = CGRect(x: s * 0.60, y: s * 0.00, width: s * 0.20, height: s * 0.42)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.24, y: s * 0.06, width: s * 0.12, height: s * 0.30)), with: .color(Color(hex: "F48FB1").opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.64, y: s * 0.06, width: s * 0.12, height: s * 0.30)), with: .color(Color(hex: "F48FB1").opacity(0.5)))
            let head = CGRect(x: s * 0.13, y: s * 0.28, width: s * 0.74, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.30, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.34, y: s * 0.56, width: s * 0.32, height: s * 0.20)), with: .color(belly))
            let nose = CGRect(x: s * 0.44, y: s * 0.56, width: s * 0.12, height: s * 0.08)
            context.fill(Path(ellipseIn: nose), with: .color(Color(hex: "F48FB1")))
            context.stroke(Path(ellipseIn: nose), with: .color(oc), style: StrokeStyle(lineWidth: iw * 0.6, lineCap: .round, lineJoin: .round))
            for whisker in [(s * 0.34, s * 0.61, s * 0.12, s * 0.58), (s * 0.34, s * 0.65, s * 0.12, s * 0.68),
                            (s * 0.66, s * 0.61, s * 0.88, s * 0.58), (s * 0.66, s * 0.65, s * 0.88, s * 0.68)] {
                var w = Path()
                w.move(to: CGPoint(x: whisker.0, y: whisker.1))
                w.addLine(to: CGPoint(x: whisker.2, y: whisker.3))
                context.stroke(w, with: .color(Color.black.opacity(0.18)), lineWidth: max(1.2, s * 0.010))
            }
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.16, height: s * 0.10)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.69, y: s * 0.54, width: s * 0.16, height: s * 0.10)), with: .color(cheek))

        case .chipmunk:
            let earL = CGRect(x: s * 0.10, y: s * 0.22, width: s * 0.20, height: s * 0.18)
            let earR = CGRect(x: s * 0.70, y: s * 0.22, width: s * 0.20, height: s * 0.18)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.45)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.45)))
            let chipHead = CGRect(x: s * 0.14, y: s * 0.26, width: s * 0.72, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: chipHead), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.28, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            var chipStripeC = Path()
            chipStripeC.move(to: CGPoint(x: s * 0.48, y: s * 0.28))
            chipStripeC.addLine(to: CGPoint(x: s * 0.48, y: s * 0.50))
            chipStripeC.move(to: CGPoint(x: s * 0.52, y: s * 0.28))
            chipStripeC.addLine(to: CGPoint(x: s * 0.52, y: s * 0.50))
            context.stroke(chipStripeC, with: .color(darker(fc, by: 0.18)), lineWidth: max(1.0, s * 0.008))
            var chipStripeL = Path()
            chipStripeL.move(to: CGPoint(x: s * 0.32, y: s * 0.30))
            chipStripeL.addLine(to: CGPoint(x: s * 0.32, y: s * 0.48))
            context.stroke(chipStripeL, with: .color(darker(fc, by: 0.12)), lineWidth: max(1.0, s * 0.006))
            var chipStripeR = Path()
            chipStripeR.move(to: CGPoint(x: s * 0.68, y: s * 0.30))
            chipStripeR.addLine(to: CGPoint(x: s * 0.68, y: s * 0.48))
            context.stroke(chipStripeR, with: .color(darker(fc, by: 0.12)), lineWidth: max(1.0, s * 0.006))
            let chipMuzzle = CGRect(x: s * 0.28, y: s * 0.52, width: s * 0.44, height: s * 0.28)
            fns(context: &context, path: Path(ellipseIn: chipMuzzle), fill: belly, outline: oc, lineWidth: iw)
            let chipNose = CGRect(x: s * 0.43, y: s * 0.54, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: chipNose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.56, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

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
            context.stroke(earL, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(earR, with: .color(fc))
            context.stroke(earR, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
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
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.30, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            var mStripe = Path()
            mStripe.move(to: CGPoint(x: s * 0.40, y: s * 0.32))
            mStripe.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.38), control: CGPoint(x: s * 0.46, y: s * 0.34))
            mStripe.addQuadCurve(to: CGPoint(x: s * 0.60, y: s * 0.32), control: CGPoint(x: s * 0.54, y: s * 0.34))
            context.stroke(mStripe, with: .color(darker(fc, by: 0.15)), lineWidth: max(1.0, s * 0.008))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.32, y: s * 0.56, width: s * 0.36, height: s * 0.22)), with: .color(belly))
            var nosePath = Path()
            nosePath.move(to: CGPoint(x: s * 0.50, y: s * 0.57))
            nosePath.addCurve(to: CGPoint(x: s * 0.44, y: s * 0.63), control1: CGPoint(x: s * 0.46, y: s * 0.57), control2: CGPoint(x: s * 0.44, y: s * 0.60))
            nosePath.addCurve(to: CGPoint(x: s * 0.56, y: s * 0.63), control1: CGPoint(x: s * 0.48, y: s * 0.66), control2: CGPoint(x: s * 0.52, y: s * 0.66))
            nosePath.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.57), control1: CGPoint(x: s * 0.56, y: s * 0.60), control2: CGPoint(x: s * 0.54, y: s * 0.57))
            nosePath.closeSubpath()
            context.fill(nosePath, with: .color(Color(hex: "F48FB1")))
            context.stroke(nosePath, with: .color(oc), style: StrokeStyle(lineWidth: iw * 0.7, lineCap: .round, lineJoin: .round))
            for whisker in [(s * 0.34, s * 0.61, s * 0.08, s * 0.57), (s * 0.34, s * 0.65, s * 0.08, s * 0.67),
                            (s * 0.66, s * 0.61, s * 0.92, s * 0.57), (s * 0.66, s * 0.65, s * 0.92, s * 0.67)] {
                var w = Path()
                w.move(to: CGPoint(x: whisker.0, y: whisker.1))
                w.addLine(to: CGPoint(x: whisker.2, y: whisker.3))
                context.stroke(w, with: .color(Color.black.opacity(0.22)), lineWidth: max(1.2, s * 0.010))
            }
            context.fill(Path(ellipseIn: CGRect(x: s * 0.13, y: s * 0.56, width: s * 0.15, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.56, width: s * 0.15, height: s * 0.09)), with: .color(cheek))

        case .deer:
            let earL = CGRect(x: s * 0.08, y: s * 0.18, width: s * 0.18, height: s * 0.22)
            let earR = CGRect(x: s * 0.74, y: s * 0.18, width: s * 0.18, height: s * 0.22)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.4)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.4)))
            var antlerL = Path()
            antlerL.move(to: CGPoint(x: s * 0.28, y: s * 0.26))
            antlerL.addQuadCurve(to: CGPoint(x: s * 0.18, y: s * 0.02), control: CGPoint(x: s * 0.16, y: s * 0.14))
            antlerL.move(to: CGPoint(x: s * 0.22, y: s * 0.12))
            antlerL.addQuadCurve(to: CGPoint(x: s * 0.10, y: s * 0.08), control: CGPoint(x: s * 0.14, y: s * 0.06))
            context.stroke(antlerL, with: .color(Color(hex: "8D6E63")), lineWidth: max(2.0, s * 0.022))
            var antlerR = Path()
            antlerR.move(to: CGPoint(x: s * 0.72, y: s * 0.26))
            antlerR.addQuadCurve(to: CGPoint(x: s * 0.82, y: s * 0.02), control: CGPoint(x: s * 0.84, y: s * 0.14))
            antlerR.move(to: CGPoint(x: s * 0.78, y: s * 0.12))
            antlerR.addQuadCurve(to: CGPoint(x: s * 0.90, y: s * 0.08), control: CGPoint(x: s * 0.86, y: s * 0.06))
            context.stroke(antlerR, with: .color(Color(hex: "8D6E63")), lineWidth: max(2.0, s * 0.022))
            let deerHead = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: deerHead), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let deerMuzzle = CGRect(x: s * 0.28, y: s * 0.54, width: s * 0.44, height: s * 0.28)
            fns(context: &context, path: Path(ellipseIn: deerMuzzle), fill: belly, outline: oc, lineWidth: iw)
            let deerNose = CGRect(x: s * 0.42, y: s * 0.56, width: s * 0.16, height: s * 0.11)
            context.fill(Path(ellipseIn: deerNose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.57, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .dog:
            let earL = CGRect(x: s * 0.05, y: s * 0.28, width: s * 0.24, height: s * 0.40)
            let earR = CGRect(x: s * 0.71, y: s * 0.28, width: s * 0.24, height: s * 0.40)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.04, dy: s * 0.05)), with: .color(Color(hex: "D7CCC8").opacity(0.5)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.04, dy: s * 0.05)), with: .color(Color(hex: "D7CCC8").opacity(0.5)))
            let head = CGRect(x: s * 0.14, y: s * 0.22, width: s * 0.72, height: s * 0.64)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.24, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.28, y: s * 0.36, width: s * 0.12, height: s * 0.08)), with: .color(lighter(fc, by: 0.18)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.58, y: s * 0.36, width: s * 0.12, height: s * 0.08)), with: .color(lighter(fc, by: 0.18)))
            let muzzle = CGRect(x: s * 0.26, y: s * 0.52, width: s * 0.48, height: s * 0.30)
            fns(context: &context, path: Path(ellipseIn: muzzle), fill: belly, outline: oc, lineWidth: iw)
            let nose = CGRect(x: s * 0.40, y: s * 0.52, width: s * 0.20, height: s * 0.13)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.44, y: s * 0.53, width: s * 0.06, height: s * 0.04)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.45, y: s * 0.70, width: s * 0.10, height: s * 0.11)), with: .color(Color(hex: "E91E63").opacity(0.6)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.42, y: s * 0.60, width: s * 0.16, height: s * 0.22)), with: .color(darker(fc, by: 0.05)))
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
            context.stroke(hornL, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(hornR, with: .color(Color(hex: "FFA726")))
            context.stroke(hornR, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.08, width: s * 0.06, height: s * 0.04)), with: .color(Color(hex: "FFD54F").opacity(0.5)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.78, y: s * 0.08, width: s * 0.06, height: s * 0.04)), with: .color(Color(hex: "FFD54F").opacity(0.5)))
            var spikes = Path()
            for i in 0..<5 {
                let cx = s * (0.35 + CGFloat(i) * 0.075)
                spikes.move(to: CGPoint(x: cx - s * 0.025, y: s * 0.26))
                spikes.addQuadCurve(to: CGPoint(x: cx + s * 0.025, y: s * 0.26), control: CGPoint(x: cx, y: s * 0.15))
                spikes.closeSubpath()
            }
            context.fill(spikes, with: .color(Color(hex: "FFA726").opacity(0.65)))
            context.stroke(spikes, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.72, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let scalePositions: [(CGFloat, CGFloat, CGFloat)] = [(0.38, 0.34, 0.08), (0.54, 0.34, 0.08), (0.46, 0.30, 0.07)]
            for sp in scalePositions {
                context.fill(Path(ellipseIn: CGRect(x: s * sp.0, y: s * sp.1, width: s * sp.2, height: s * sp.2)), with: .color(darker(fc, by: 0.10)))
            }
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
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.05, dy: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.2)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.05, dy: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.2)))
            let head = CGRect(x: s * 0.15, y: s * 0.20, width: s * 0.70, height: s * 0.64)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.22, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            var tuskL = Path()
            tuskL.move(to: CGPoint(x: s * 0.30, y: s * 0.62))
            tuskL.addQuadCurve(to: CGPoint(x: s * 0.26, y: s * 0.78), control: CGPoint(x: s * 0.24, y: s * 0.70))
            tuskL.addQuadCurve(to: CGPoint(x: s * 0.34, y: s * 0.64), control: CGPoint(x: s * 0.32, y: s * 0.74))
            tuskL.closeSubpath()
            var tuskR = Path()
            tuskR.move(to: CGPoint(x: s * 0.70, y: s * 0.62))
            tuskR.addQuadCurve(to: CGPoint(x: s * 0.74, y: s * 0.78), control: CGPoint(x: s * 0.76, y: s * 0.70))
            tuskR.addQuadCurve(to: CGPoint(x: s * 0.66, y: s * 0.64), control: CGPoint(x: s * 0.68, y: s * 0.74))
            tuskR.closeSubpath()
            context.fill(tuskL, with: .color(Color(hex: "FFFDE7")))
            context.stroke(tuskL, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            context.fill(tuskR, with: .color(Color(hex: "FFFDE7")))
            context.stroke(tuskR, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            var trunk = Path()
            trunk.move(to: CGPoint(x: s * 0.42, y: s * 0.58))
            trunk.addCurve(to: CGPoint(x: s * 0.44, y: s * 0.88), control1: CGPoint(x: s * 0.38, y: s * 0.70), control2: CGPoint(x: s * 0.34, y: s * 0.84))
            trunk.addQuadCurve(to: CGPoint(x: s * 0.56, y: s * 0.86), control: CGPoint(x: s * 0.50, y: s * 0.92))
            trunk.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.58), control1: CGPoint(x: s * 0.66, y: s * 0.84), control2: CGPoint(x: s * 0.62, y: s * 0.70))
            trunk.closeSubpath()
            context.fill(trunk, with: .color(fc))
            context.stroke(trunk, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            for ringY in [s * 0.70, s * 0.76, s * 0.82] {
                var ring = Path()
                ring.move(to: CGPoint(x: s * 0.43, y: ringY))
                ring.addQuadCurve(to: CGPoint(x: s * 0.57, y: ringY), control: CGPoint(x: s * 0.50, y: ringY + s * 0.02))
                context.stroke(ring, with: .color(darker(fc, by: 0.12)), lineWidth: max(0.8, s * 0.006))
            }
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
            context.stroke(earL, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(earR, with: .color(fc))
            context.stroke(earR, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
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
            context.fill(tipL, with: .color(darker(fc, by: 0.22)))
            context.fill(tipR, with: .color(darker(fc, by: 0.22)))
            let head = CGRect(x: s * 0.12, y: s * 0.26, width: s * 0.76, height: s * 0.60)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.28, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            var chin = Path()
            chin.move(to: CGPoint(x: s * 0.22, y: s * 0.52))
            chin.addQuadCurve(to: CGPoint(x: s * 0.78, y: s * 0.52), control: CGPoint(x: s * 0.50, y: s * 0.92))
            chin.closeSubpath()
            context.fill(chin, with: .color(.white.opacity(0.80)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.50, width: s * 0.14, height: s * 0.12)), with: .color(.white.opacity(0.30)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.66, y: s * 0.50, width: s * 0.14, height: s * 0.12)), with: .color(.white.opacity(0.30)))
            let nose = CGRect(x: s * 0.42, y: s * 0.54, width: s * 0.16, height: s * 0.11)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.54, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.54, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .frog:
            let head = CGRect(x: s * 0.10, y: s * 0.28, width: s * 0.80, height: s * 0.58)
            let eyeBumpL = CGRect(x: s * 0.14, y: s * 0.16, width: s * 0.30, height: s * 0.30)
            let eyeBumpR = CGRect(x: s * 0.56, y: s * 0.16, width: s * 0.30, height: s * 0.30)
            fns(context: &context, path: Path(ellipseIn: eyeBumpL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: eyeBumpR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.18, width: s * 0.16, height: s * 0.10)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.58, y: s * 0.18, width: s * 0.16, height: s * 0.10)), with: .color(highlight))
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            let spots: [(CGFloat, CGFloat, CGFloat)] = [(0.20, 0.40, 0.06), (0.74, 0.42, 0.05), (0.32, 0.72, 0.05), (0.62, 0.74, 0.04)]
            for sp in spots {
                context.fill(Path(ellipseIn: CGRect(x: s * sp.0, y: s * sp.1, width: s * sp.2, height: s * sp.2)), with: .color(darker(fc, by: 0.12)))
            }
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
            context.stroke(ossiconeL, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(ossiconeR, with: .color(fc))
            context.stroke(ossiconeR, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            fns(context: &context, path: Path(ellipseIn: CGRect(x: s * 0.27, y: s * 0.02, width: s * 0.12, height: s * 0.12)), fill: Color(hex: "8D6E63"), outline: oc, lineWidth: iw)
            fns(context: &context, path: Path(ellipseIn: CGRect(x: s * 0.63, y: s * 0.02, width: s * 0.12, height: s * 0.12)), fill: Color(hex: "8D6E63"), outline: oc, lineWidth: iw)
            let earL = CGRect(x: s * 0.10, y: s * 0.28, width: s * 0.20, height: s * 0.12)
            let earR = CGRect(x: s * 0.70, y: s * 0.28, width: s * 0.20, height: s * 0.12)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            let head = CGRect(x: s * 0.15, y: s * 0.22, width: s * 0.70, height: s * 0.64)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.24, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let spots: [(CGFloat, CGFloat, CGFloat)] = [
                (0.24, 0.36, 0.10), (0.68, 0.38, 0.09), (0.32, 0.70, 0.08),
                (0.60, 0.68, 0.09), (0.46, 0.34, 0.08), (0.44, 0.54, 0.07),
            ]
            for spot in spots {
                context.fill(Path(ellipseIn: CGRect(x: s * spot.0, y: s * spot.1, width: s * spot.2, height: s * spot.2)), with: .color(Color(hex: "8D6E63").opacity(0.30)))
            }
            let muzzle = CGRect(x: s * 0.26, y: s * 0.56, width: s * 0.48, height: s * 0.28)
            fns(context: &context, path: Path(ellipseIn: muzzle), fill: belly, outline: oc, lineWidth: iw)
            let noseRect = CGRect(x: s * 0.40, y: s * 0.58, width: s * 0.20, height: s * 0.12)
            context.fill(Path(ellipseIn: noseRect), with: .color(Color(hex: "8D6E63").opacity(0.45)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.43, y: s * 0.62, width: s * 0.04, height: s * 0.03)), with: .color(darkAccent))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.53, y: s * 0.62, width: s * 0.04, height: s * 0.03)), with: .color(darkAccent))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.44, y: s * 0.59, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.25)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

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
            context.stroke(Path(ellipseIn: maneRect), with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            let earL = CGRect(x: s * 0.12, y: s * 0.20, width: s * 0.18, height: s * 0.16)
            let earR = CGRect(x: s * 0.70, y: s * 0.20, width: s * 0.18, height: s * 0.16)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.5)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.5)))
            let head = CGRect(x: s * 0.15, y: s * 0.24, width: s * 0.70, height: s * 0.60)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.20, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let muzzle = CGRect(x: s * 0.28, y: s * 0.52, width: s * 0.44, height: s * 0.28)
            fns(context: &context, path: Path(ellipseIn: muzzle), fill: belly, outline: oc, lineWidth: iw)
            var nosePath = Path()
            nosePath.move(to: CGPoint(x: s * 0.50, y: s * 0.53))
            nosePath.addCurve(to: CGPoint(x: s * 0.42, y: s * 0.60), control1: CGPoint(x: s * 0.44, y: s * 0.53), control2: CGPoint(x: s * 0.42, y: s * 0.56))
            nosePath.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.64), control: CGPoint(x: s * 0.42, y: s * 0.64))
            nosePath.addQuadCurve(to: CGPoint(x: s * 0.58, y: s * 0.60), control: CGPoint(x: s * 0.58, y: s * 0.64))
            nosePath.addCurve(to: CGPoint(x: s * 0.50, y: s * 0.53), control1: CGPoint(x: s * 0.58, y: s * 0.56), control2: CGPoint(x: s * 0.56, y: s * 0.53))
            nosePath.closeSubpath()
            context.fill(nosePath, with: .color(Color(hex: "5D4037")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.47, y: s * 0.54, width: s * 0.04, height: s * 0.03)), with: .color(Color.white.opacity(0.3)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.36, y: s * 0.68, width: s * 0.28, height: s * 0.08)), with: .color(darker(fc, by: 0.06)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.17, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .monkey:
            let earL = CGRect(x: s * 0.03, y: s * 0.32, width: s * 0.24, height: s * 0.24)
            let earR = CGRect(x: s * 0.73, y: s * 0.32, width: s * 0.24, height: s * 0.24)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.04, dy: s * 0.04)), with: .color(Color(hex: "FFAB91")))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.04, dy: s * 0.04)), with: .color(Color(hex: "FFAB91")))
            let head = CGRect(x: s * 0.13, y: s * 0.20, width: s * 0.74, height: s * 0.64)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            var tuft = Path()
            tuft.move(to: CGPoint(x: s * 0.42, y: s * 0.20))
            tuft.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.12), control: CGPoint(x: s * 0.44, y: s * 0.14))
            tuft.addQuadCurve(to: CGPoint(x: s * 0.58, y: s * 0.20), control: CGPoint(x: s * 0.56, y: s * 0.14))
            context.stroke(tuft, with: .color(darker(fc, by: 0.20)), lineWidth: max(1.5, s * 0.014))
            let face = CGRect(x: s * 0.22, y: s * 0.40, width: s * 0.56, height: s * 0.40)
            fns(context: &context, path: Path(ellipseIn: face), fill: Color(hex: "FFAB91"), outline: oc, lineWidth: iw)
            let noseM = CGRect(x: s * 0.42, y: s * 0.56, width: s * 0.16, height: s * 0.10)
            context.fill(Path(ellipseIn: noseM), with: .color(Color(hex: "8D6E63").opacity(0.45)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.54, width: s * 0.10, height: s * 0.06)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.54, width: s * 0.10, height: s * 0.06)), with: .color(cheek))

        case .panda:
            let earL = CGRect(x: s * 0.10, y: s * 0.14, width: s * 0.24, height: s * 0.24)
            let earR = CGRect(x: s * 0.66, y: s * 0.14, width: s * 0.24, height: s * 0.24)
            fns(context: &context, path: Path(ellipseIn: earL), fill: .black.opacity(0.80), outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: .black.opacity(0.80), outline: oc, lineWidth: ow)
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.38, height: s * 0.16)), with: .color(highlight))
            let patchL = CGRect(x: s * 0.19, y: s * 0.34, width: s * 0.24, height: s * 0.22)
            let patchR = CGRect(x: s * 0.57, y: s * 0.34, width: s * 0.24, height: s * 0.22)
            fns(context: &context, path: Path(ellipseIn: patchL), fill: .black.opacity(0.70), outline: oc, lineWidth: iw)
            fns(context: &context, path: Path(ellipseIn: patchR), fill: .black.opacity(0.70), outline: oc, lineWidth: iw)
            let muzzle = CGRect(x: s * 0.32, y: s * 0.56, width: s * 0.36, height: s * 0.22)
            context.fill(Path(ellipseIn: muzzle), with: .color(belly))
            let nose = CGRect(x: s * 0.43, y: s * 0.58, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: nose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.59, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.58, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.73, y: s * 0.58, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .raccoon:
            let earL = CGRect(x: s * 0.12, y: s * 0.14, width: s * 0.20, height: s * 0.20)
            let earR = CGRect(x: s * 0.68, y: s * 0.14, width: s * 0.20, height: s * 0.20)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "F48FB1").opacity(0.25)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "F48FB1").opacity(0.25)))
            let tipL = CGRect(x: s * 0.12, y: s * 0.14, width: s * 0.20, height: s * 0.08)
            let tipR = CGRect(x: s * 0.68, y: s * 0.14, width: s * 0.20, height: s * 0.08)
            context.fill(Path(ellipseIn: tipL), with: .color(darker(fc, by: 0.18)))
            context.fill(Path(ellipseIn: tipR), with: .color(darker(fc, by: 0.18)))
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            let mask = CGRect(x: s * 0.16, y: s * 0.34, width: s * 0.68, height: s * 0.20)
            context.fill(Path(roundedRect: mask, cornerRadius: s * 0.08), with: .color(.black.opacity(0.52)))
            context.stroke(Path(roundedRect: mask, cornerRadius: s * 0.08), with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            var stripe = Path()
            stripe.move(to: CGPoint(x: s * 0.50, y: s * 0.24))
            stripe.addLine(to: CGPoint(x: s * 0.50, y: s * 0.34))
            context.stroke(stripe, with: .color(Color.white.opacity(0.45)), lineWidth: s * 0.04)
            let muzzle = CGRect(x: s * 0.32, y: s * 0.52, width: s * 0.36, height: s * 0.24)
            fns(context: &context, path: Path(ellipseIn: muzzle), fill: belly, outline: oc, lineWidth: iw)
            let noseR = CGRect(x: s * 0.43, y: s * 0.54, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: noseR), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.55, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))

        case .seal:
            let head = CGRect(x: s * 0.12, y: s * 0.20, width: s * 0.76, height: s * 0.64)
            var flipperL = Path()
            flipperL.addEllipse(in: CGRect(x: s * 0.04, y: s * 0.52, width: s * 0.20, height: s * 0.24))
            var flipperR = Path()
            flipperR.addEllipse(in: CGRect(x: s * 0.76, y: s * 0.52, width: s * 0.20, height: s * 0.24))
            fns(context: &context, path: flipperL, fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: flipperR, fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.22, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.22, y: s * 0.44, width: s * 0.56, height: s * 0.36)), with: .color(belly))
            let noseS = CGRect(x: s * 0.42, y: s * 0.52, width: s * 0.16, height: s * 0.10)
            context.fill(Path(ellipseIn: noseS), with: .color(noseColor.opacity(0.8)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.45, y: s * 0.53, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))
            for whisker in [(s * 0.34, s * 0.58, s * 0.14, s * 0.55), (s * 0.34, s * 0.62, s * 0.14, s * 0.64),
                            (s * 0.66, s * 0.58, s * 0.86, s * 0.55), (s * 0.66, s * 0.62, s * 0.86, s * 0.64)] {
                var w = Path()
                w.move(to: CGPoint(x: whisker.0, y: whisker.1))
                w.addLine(to: CGPoint(x: whisker.2, y: whisker.3))
                context.stroke(w, with: .color(Color.black.opacity(0.15)), lineWidth: max(1.0, s * 0.008))
            }
            for dot in [(s * 0.32, s * 0.60), (s * 0.28, s * 0.64), (s * 0.66, s * 0.60), (s * 0.70, s * 0.64)] {
                context.fill(Path(ellipseIn: CGRect(x: dot.0, y: dot.1, width: s * 0.025, height: s * 0.025)), with: .color(darkAccent))
            }
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.56, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .sloth:
            let head = CGRect(x: s * 0.12, y: s * 0.22, width: s * 0.76, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.16, y: s * 0.24, width: s * 0.36, height: s * 0.16)), with: .color(highlight))
            let patchL = CGRect(x: s * 0.19, y: s * 0.34, width: s * 0.24, height: s * 0.24)
            let patchR = CGRect(x: s * 0.57, y: s * 0.34, width: s * 0.24, height: s * 0.24)
            context.fill(Path(ellipseIn: patchL), with: .color(Color(hex: "5D4037").opacity(0.30)))
            context.fill(Path(ellipseIn: patchR), with: .color(Color(hex: "5D4037").opacity(0.30)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.36, y: s * 0.26, width: s * 0.28, height: s * 0.10)), with: .color(darker(fc, by: 0.08)))
            let muzzle = CGRect(x: s * 0.30, y: s * 0.54, width: s * 0.40, height: s * 0.24)
            fns(context: &context, path: Path(ellipseIn: muzzle), fill: belly, outline: oc, lineWidth: iw)
            let noseSloth = CGRect(x: s * 0.43, y: s * 0.56, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: noseSloth), with: .color(noseColor.opacity(0.8)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.57, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.35)))
            var smileLine = Path()
            smileLine.move(to: CGPoint(x: s * 0.38, y: s * 0.68))
            smileLine.addQuadCurve(to: CGPoint(x: s * 0.62, y: s * 0.68), control: CGPoint(x: s * 0.50, y: s * 0.74))
            context.stroke(smileLine, with: .color(darker(fc, by: 0.15)), lineWidth: max(0.8, s * 0.006))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.73, y: s * 0.56, width: s * 0.12, height: s * 0.08)), with: .color(cheek))

        case .turtle:
            var shell = Path()
            shell.addEllipse(in: CGRect(x: s * 0.12, y: s * 0.34, width: s * 0.76, height: s * 0.56))
            fns(context: &context, path: shell, fill: Color(hex: "689F38"), outline: oc, lineWidth: ow)
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
                context.stroke(hex, with: .color(oc.opacity(0.35)), lineWidth: max(1.2, s * 0.008))
            }
            let head = CGRect(x: s * 0.18, y: s * 0.14, width: s * 0.64, height: s * 0.54)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.22, y: s * 0.16, width: s * 0.30, height: s * 0.14)), with: .color(highlight))
            let turtleMuzzle = CGRect(x: s * 0.30, y: s * 0.40, width: s * 0.40, height: s * 0.22)
            context.fill(Path(ellipseIn: turtleMuzzle), with: .color(belly))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.44, width: s * 0.13, height: s * 0.08)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.68, y: s * 0.44, width: s * 0.13, height: s * 0.08)), with: .color(cheek))

        case .hedgehog:
            let earL = CGRect(x: s * 0.12, y: s * 0.26, width: s * 0.18, height: s * 0.16)
            let earR = CGRect(x: s * 0.70, y: s * 0.26, width: s * 0.18, height: s * 0.16)
            fns(context: &context, path: Path(ellipseIn: earL), fill: fc, outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(ellipseIn: earR), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: earL.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.4)))
            context.fill(Path(ellipseIn: earR.insetBy(dx: s * 0.03, dy: s * 0.03)), with: .color(Color(hex: "FFAB91").opacity(0.4)))
            var spinesH = Path()
            for i in 0..<7 {
                let cx = s * (0.26 + CGFloat(i) * 0.08)
                spinesH.move(to: CGPoint(x: cx - s * 0.03, y: s * 0.28))
                spinesH.addQuadCurve(to: CGPoint(x: cx + s * 0.03, y: s * 0.28), control: CGPoint(x: cx, y: s * 0.12))
                spinesH.closeSubpath()
            }
            context.fill(spinesH, with: .color(darker(fc, by: 0.20)))
            context.stroke(spinesH, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            let hedgeHead = CGRect(x: s * 0.14, y: s * 0.26, width: s * 0.72, height: s * 0.62)
            fns(context: &context, path: Path(ellipseIn: hedgeHead), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.19, y: s * 0.28, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let hedgeMuzzle = CGRect(x: s * 0.30, y: s * 0.54, width: s * 0.40, height: s * 0.26)
            fns(context: &context, path: Path(ellipseIn: hedgeMuzzle), fill: belly, outline: oc, lineWidth: iw)
            let hedgeNose = CGRect(x: s * 0.43, y: s * 0.56, width: s * 0.14, height: s * 0.10)
            context.fill(Path(ellipseIn: hedgeNose), with: .color(noseColor))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.57, width: s * 0.05, height: s * 0.03)), with: .color(Color.white.opacity(0.4)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.15, y: s * 0.56, width: s * 0.14, height: s * 0.09)), with: .color(cheek))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.71, y: s * 0.56, width: s * 0.14, height: s * 0.09)), with: .color(cheek))

        case .unicorn:
            var horn = Path()
            horn.move(to: CGPoint(x: s * 0.50, y: s * 0.00))
            horn.addQuadCurve(to: CGPoint(x: s * 0.42, y: s * 0.28), control: CGPoint(x: s * 0.38, y: s * 0.14))
            horn.addQuadCurve(to: CGPoint(x: s * 0.58, y: s * 0.28), control: CGPoint(x: s * 0.50, y: s * 0.32))
            horn.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.00), control: CGPoint(x: s * 0.62, y: s * 0.14))
            horn.closeSubpath()
            let hornGrad = Gradient(colors: [Color(hex: "FFD54F"), Color(hex: "FFA726"), Color(hex: "FFD54F")])
            context.fill(horn, with: .linearGradient(hornGrad, startPoint: CGPoint(x: s * 0.44, y: 0), endPoint: CGPoint(x: s * 0.56, y: s * 0.28)))
            context.stroke(horn, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            for stripe in [0.08, 0.14, 0.20] as [CGFloat] {
                var line = Path()
                let y = s * stripe
                let left = s * 0.44 + (y / (s * 0.28)) * s * 0.06
                let right = s * 0.56 - (y / (s * 0.28)) * s * 0.06
                line.move(to: CGPoint(x: left - s * 0.02, y: y))
                line.addLine(to: CGPoint(x: right + s * 0.02, y: y + s * 0.02))
                context.stroke(line, with: .color(Color(hex: "E65100").opacity(0.25)), lineWidth: max(1.5, s * 0.010))
            }
            var maneU = Path()
            maneU.move(to: CGPoint(x: s * 0.60, y: s * 0.14))
            maneU.addCurve(to: CGPoint(x: s * 0.82, y: s * 0.56), control1: CGPoint(x: s * 0.88, y: s * 0.18), control2: CGPoint(x: s * 0.90, y: s * 0.44))
            maneU.addCurve(to: CGPoint(x: s * 0.70, y: s * 0.50), control1: CGPoint(x: s * 0.78, y: s * 0.54), control2: CGPoint(x: s * 0.74, y: s * 0.52))
            maneU.addCurve(to: CGPoint(x: s * 0.58, y: s * 0.20), control1: CGPoint(x: s * 0.78, y: s * 0.38), control2: CGPoint(x: s * 0.76, y: s * 0.22))
            maneU.closeSubpath()
            let maneGrad = Gradient(colors: [Color(hex: "CE93D8"), Color(hex: "F48FB1"), Color(hex: "81D4FA")])
            context.fill(maneU, with: .linearGradient(maneGrad, startPoint: CGPoint(x: s * 0.60, y: s * 0.14), endPoint: CGPoint(x: s * 0.82, y: s * 0.56)))
            context.stroke(maneU, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
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
            context.stroke(earUL, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(earUR, with: .color(fc))
            context.stroke(earUR, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            let head = CGRect(x: s * 0.14, y: s * 0.24, width: s * 0.66, height: s * 0.60)
            fns(context: &context, path: Path(ellipseIn: head), fill: fc, outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.18, y: s * 0.26, width: s * 0.34, height: s * 0.16)), with: .color(highlight))
            let sparklePositions: [(CGFloat, CGFloat)] = [(0.22, 0.34), (0.70, 0.30), (0.18, 0.60)]
            for sp in sparklePositions {
                var sparkle = Path()
                let cx = s * sp.0
                let cy = s * sp.1
                let sr: CGFloat = s * 0.018
                sparkle.move(to: CGPoint(x: cx, y: cy - sr))
                sparkle.addLine(to: CGPoint(x: cx, y: cy + sr))
                sparkle.move(to: CGPoint(x: cx - sr, y: cy))
                sparkle.addLine(to: CGPoint(x: cx + sr, y: cy))
                context.stroke(sparkle, with: .color(Color.white.opacity(0.50)), lineWidth: max(1.0, s * 0.008))
            }
            let muzzleU = CGRect(x: s * 0.24, y: s * 0.54, width: s * 0.46, height: s * 0.26)
            fns(context: &context, path: Path(ellipseIn: muzzleU), fill: belly, outline: oc, lineWidth: iw)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.36, y: s * 0.66, width: s * 0.05, height: s * 0.04)), with: .color(darkAccent))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.55, y: s * 0.66, width: s * 0.05, height: s * 0.04)), with: .color(darkAccent))
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
        let oc = Color.black.opacity(0.55)
        let ow: CGFloat = max(1.2, s * 0.007)

        switch style {
        case .normal:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            let whiteR = CGRect(x: rightX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: whiteR), with: .color(oc), lineWidth: ow)
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
            context.stroke(arcL, with: .color(Color(hex: "2C2C2C")), lineWidth: s * 0.036)
            var arcR = Path()
            arcR.move(to: CGPoint(x: rightX - eyeSize * 0.2, y: eyeY + eyeSize * 0.5))
            arcR.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.2, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY - eyeSize * 0.5))
            context.stroke(arcR, with: .color(Color(hex: "2C2C2C")), lineWidth: s * 0.036)

        case .big:
            let bigSize = eyeSize * 2.0
            let bigY = eyeY - eyeSize * 0.50
            let bigLX = leftX - eyeSize * 0.50
            let bigRX = rightX - eyeSize * 0.50
            let bigL = CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)
            let bigR = CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)
            context.fill(Path(ellipseIn: bigL), with: .color(.white))
            context.fill(Path(ellipseIn: bigR), with: .color(.white))
            context.stroke(Path(ellipseIn: bigL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: bigR), with: .color(oc), lineWidth: ow)
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
            context.stroke(lidL, with: .color(.black.opacity(0.85)), lineWidth: s * 0.028)
            var lidR = Path()
            lidR.move(to: CGPoint(x: rightX - eyeSize * 0.15, y: eyeY + eyeSize * 0.5))
            lidR.addQuadCurve(to: CGPoint(x: rightX + eyeSize * 1.15, y: eyeY + eyeSize * 0.5), control: CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.85))
            context.stroke(lidR, with: .color(.black.opacity(0.85)), lineWidth: s * 0.028)
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.01, y: eyeY + eyeSize * 0.15))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.32))
            context.stroke(browL, with: .color(.black.opacity(0.40)), lineWidth: s * 0.018)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.01, y: eyeY + eyeSize * 0.15))
            browR.addLine(to: CGPoint(x: rightX - s * 0.01, y: eyeY + eyeSize * 0.32))
            context.stroke(browR, with: .color(.black.opacity(0.40)), lineWidth: s * 0.018)

        case .wink:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(oc), lineWidth: ow)
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
            context.stroke(winkArc, with: .color(Color(hex: "2C2C2C")), lineWidth: s * 0.036)

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
            context.stroke(Path(ellipseIn: whiteL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: whiteR), with: .color(oc), lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: leftX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            context.fill(Path(ellipseIn: CGRect(x: rightX, y: eyeY, width: eyeSize, height: eyeSize * 1.1)), with: .color(.black.opacity(0.85)))
            let shineD = eyeSize * 0.32
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.48, y: eyeY + eyeSize * 0.12, width: shineD, height: shineD)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.48, y: eyeY + eyeSize * 0.12, width: shineD, height: shineD)), with: .color(.white))
            var browL = Path()
            browL.move(to: CGPoint(x: leftX - s * 0.02, y: eyeY - eyeSize * 0.35))
            browL.addLine(to: CGPoint(x: leftX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.65))
            context.stroke(browL, with: .color(.black.opacity(0.65)), lineWidth: s * 0.034)
            var browR = Path()
            browR.move(to: CGPoint(x: rightX + eyeSize + s * 0.02, y: eyeY - eyeSize * 0.35))
            browR.addLine(to: CGPoint(x: rightX - s * 0.02, y: eyeY - eyeSize * 0.65))
            context.stroke(browR, with: .color(.black.opacity(0.65)), lineWidth: s * 0.034)

        case .surprised:
            let bigSize = eyeSize * 1.9
            let bigY = eyeY - eyeSize * 0.40
            let sL = CGRect(x: leftX - eyeSize * 0.40, y: bigY, width: bigSize, height: bigSize)
            let sR = CGRect(x: rightX - eyeSize * 0.40, y: bigY, width: bigSize, height: bigSize)
            context.fill(Path(ellipseIn: sL), with: .color(.white))
            context.fill(Path(ellipseIn: sR), with: .color(.white))
            context.stroke(Path(ellipseIn: sL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: sR), with: .color(oc), lineWidth: ow)
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
            context.stroke(Path(roundedRect: glassLRect, cornerRadius: 5), with: .color(Color.black.opacity(0.92)), lineWidth: max(1.5, s * 0.012))
            context.stroke(Path(roundedRect: glassRRect, cornerRadius: 5), with: .color(Color.black.opacity(0.92)), lineWidth: max(1.5, s * 0.012))
            var bridge = Path()
            bridge.move(to: CGPoint(x: glassLX + glassW, y: glassY + glassH * 0.4))
            bridge.addLine(to: CGPoint(x: glassRX, y: glassY + glassH * 0.4))
            context.stroke(bridge, with: .color(.black.opacity(0.82)), lineWidth: s * 0.028)
            let shineW = glassW * 0.22
            let shineH = glassH * 0.20
            context.fill(Path(roundedRect: CGRect(x: glassLX + glassW * 0.10, y: glassY + glassH * 0.16, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.30)))
            context.fill(Path(roundedRect: CGRect(x: glassRX + glassW * 0.10, y: glassY + glassH * 0.16, width: shineW, height: shineH), cornerRadius: 2), with: .color(.white.opacity(0.30)))

        case .angry:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.6, height: eyeSize * 1.5)
            let whiteR = CGRect(x: rightX - eyeSize * 0.3, y: eyeY - eyeSize * 0.2, width: eyeSize * 1.6, height: eyeSize * 1.5)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: whiteR), with: .color(oc), lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.10, y: eyeY + eyeSize * 0.10, width: eyeSize * 0.8, height: eyeSize * 0.9)), with: .color(.black.opacity(0.88)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.10, y: eyeY + eyeSize * 0.10, width: eyeSize * 0.8, height: eyeSize * 0.9)), with: .color(.black.opacity(0.88)))
            let shA = eyeSize * 0.28
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.42, y: eyeY + eyeSize * 0.15, width: shA, height: shA)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.42, y: eyeY + eyeSize * 0.15, width: shA, height: shA)), with: .color(.white))
            var browAL = Path()
            browAL.move(to: CGPoint(x: leftX - s * 0.03, y: eyeY - eyeSize * 0.10))
            browAL.addLine(to: CGPoint(x: leftX + eyeSize * 1.2, y: eyeY - eyeSize * 0.55))
            context.stroke(browAL, with: .color(.black.opacity(0.75)), lineWidth: s * 0.038)
            var browAR = Path()
            browAR.move(to: CGPoint(x: rightX + eyeSize * 1.3, y: eyeY - eyeSize * 0.10))
            browAR.addLine(to: CGPoint(x: rightX - eyeSize * 0.2, y: eyeY - eyeSize * 0.55))
            context.stroke(browAR, with: .color(.black.opacity(0.75)), lineWidth: s * 0.038)

        case .rainbow:
            let rainbowColors: [Color] = [
                Color(hex: "EF5350"), Color(hex: "FFA726"), Color(hex: "FFEE58"),
                Color(hex: "66BB6A"), Color(hex: "42A5F5"), Color(hex: "AB47BC")
            ]
            let bigSize = eyeSize * 1.8
            let bigY = eyeY - eyeSize * 0.35
            let bigLX = leftX - eyeSize * 0.40
            let bigRX = rightX - eyeSize * 0.40
            context.fill(Path(ellipseIn: CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)), with: .color(.white))
            context.stroke(Path(ellipseIn: CGRect(x: bigLX, y: bigY, width: bigSize, height: bigSize)), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: CGRect(x: bigRX, y: bigY, width: bigSize, height: bigSize)), with: .color(oc), lineWidth: ow)
            for (i, color) in rainbowColors.enumerated() {
                let r = bigSize * 0.48 - CGFloat(i) * bigSize * 0.06
                let lCenter = CGPoint(x: bigLX + bigSize * 0.5, y: bigY + bigSize * 0.5)
                let rCenter = CGPoint(x: bigRX + bigSize * 0.5, y: bigY + bigSize * 0.5)
                context.fill(Path(ellipseIn: CGRect(x: lCenter.x - r, y: lCenter.y - r, width: r * 2, height: r * 2)), with: .color(color.opacity(0.65)))
                context.fill(Path(ellipseIn: CGRect(x: rCenter.x - r, y: rCenter.y - r, width: r * 2, height: r * 2)), with: .color(color.opacity(0.65)))
            }
            let pupilRB = bigSize * 0.18
            let cLX = bigLX + bigSize * 0.5 - pupilRB
            let cRX = bigRX + bigSize * 0.5 - pupilRB
            let cY = bigY + bigSize * 0.5 - pupilRB
            context.fill(Path(ellipseIn: CGRect(x: cLX, y: cY, width: pupilRB * 2, height: pupilRB * 2)), with: .color(.black.opacity(0.92)))
            context.fill(Path(ellipseIn: CGRect(x: cRX, y: cY, width: pupilRB * 2, height: pupilRB * 2)), with: .color(.black.opacity(0.92)))
            let shRB = pupilRB * 0.6
            context.fill(Path(ellipseIn: CGRect(x: cLX + pupilRB * 0.6, y: cY + pupilRB * 0.2, width: shRB, height: shRB)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: cRX + pupilRB * 0.6, y: cY + pupilRB * 0.2, width: shRB, height: shRB)), with: .color(.white))

        case .eyeRoll:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            let whiteR = CGRect(x: rightX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: whiteR), with: .color(oc), lineWidth: ow)
            let rollY = eyeY - eyeSize * 0.20
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.10, y: rollY, width: eyeSize * 0.85, height: eyeSize * 0.85)), with: .color(Color(hex: "2C2C2C")))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.10, y: rollY, width: eyeSize * 0.85, height: eyeSize * 0.85)), with: .color(Color(hex: "2C2C2C")))
            let shER = eyeSize * 0.30
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.38, y: rollY + eyeSize * 0.06, width: shER, height: shER)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.38, y: rollY + eyeSize * 0.06, width: shER, height: shER)), with: .color(.white))

        case .dizzy:
            let dSize = eyeSize * 1.3
            let lC = CGPoint(x: leftX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4)
            let rC = CGPoint(x: rightX + eyeSize * 0.5, y: eyeY + eyeSize * 0.4)
            for center in [lC, rC] {
                var spiral = Path()
                for i in 0..<24 {
                    let angle = Double(i) * 0.55
                    let r = dSize * 0.1 + dSize * 0.03 * CGFloat(i)
                    let px = center.x + r * CGFloat(cos(angle))
                    let py = center.y + r * CGFloat(sin(angle))
                    if i == 0 { spiral.move(to: CGPoint(x: px, y: py)) }
                    else { spiral.addLine(to: CGPoint(x: px, y: py)) }
                }
                context.stroke(spiral, with: .color(Color(hex: "2C2C2C")), lineWidth: max(2.0, s * 0.022))
            }

        case .crying:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            let whiteR = CGRect(x: rightX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: whiteR), with: .color(oc), lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.05, y: eyeY + eyeSize * 0.05, width: eyeSize * 0.9, height: eyeSize * 1.0)), with: .color(Color(hex: "2C2C2C")))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.05, y: eyeY + eyeSize * 0.05, width: eyeSize * 0.9, height: eyeSize * 1.0)), with: .color(Color(hex: "2C2C2C")))
            let shCR = eyeSize * 0.35
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.35, y: eyeY + eyeSize * 0.10, width: shCR, height: shCR)), with: .color(.white))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.35, y: eyeY + eyeSize * 0.10, width: shCR, height: shCR)), with: .color(.white))
            let tearW = eyeSize * 0.30
            let tearH = eyeSize * 1.2
            context.fill(Path(ellipseIn: CGRect(x: leftX + eyeSize * 0.15, y: eyeY + eyeSize * 1.3, width: tearW, height: tearH)), with: .color(Color(hex: "4FC3F7").opacity(0.55)))
            context.fill(Path(ellipseIn: CGRect(x: rightX + eyeSize * 0.55, y: eyeY + eyeSize * 1.3, width: tearW, height: tearH)), with: .color(Color(hex: "4FC3F7").opacity(0.55)))

        default:
            let whiteL = CGRect(x: leftX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            let whiteR = CGRect(x: rightX - eyeSize * 0.3, y: eyeY - eyeSize * 0.3, width: eyeSize * 1.6, height: eyeSize * 1.7)
            context.fill(Path(ellipseIn: whiteL), with: .color(.white))
            context.fill(Path(ellipseIn: whiteR), with: .color(.white))
            context.stroke(Path(ellipseIn: whiteL), with: .color(oc), lineWidth: ow)
            context.stroke(Path(ellipseIn: whiteR), with: .color(oc), lineWidth: ow)
            let irisLD = CGRect(x: leftX - eyeSize * 0.05, y: eyeY - eyeSize * 0.05, width: eyeSize * 1.1, height: eyeSize * 1.2)
            let irisRD = CGRect(x: rightX - eyeSize * 0.05, y: eyeY - eyeSize * 0.05, width: eyeSize * 1.1, height: eyeSize * 1.2)
            context.fill(Path(ellipseIn: irisLD), with: .color(Color(hex: "2C2C2C")))
            context.fill(Path(ellipseIn: irisRD), with: .color(Color(hex: "2C2C2C")))
        }
    }

    private func drawMouth(context: inout GraphicsContext, style: MouthStyle, size: CGFloat) {
        let s = size
        let mouthY: CGFloat = s * 0.66
        let centerX: CGFloat = s * 0.50
        let mouthW: CGFloat = s * 0.13
        let mc = Color(hex: "2C2C2C").opacity(0.90)
        let mw: CGFloat = s * 0.030

        switch style {
        case .smile:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.1, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.1, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.10))
            context.stroke(path, with: .color(mc), lineWidth: mw)

        case .bigSmile:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.4, y: mouthY - s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.4, y: mouthY - s * 0.01), control: CGPoint(x: centerX, y: mouthY + s * 0.15))
            path.closeSubpath()
            context.fill(path, with: .color(mc))
            context.stroke(path, with: .color(Color.black.opacity(0.92)), style: StrokeStyle(lineWidth: s * 0.012, lineCap: .round, lineJoin: .round))
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
            context.stroke(path, with: .color(mc), lineWidth: mw)
            var tongue = Path()
            tongue.addEllipse(in: CGRect(x: centerX - s * 0.035, y: mouthY + s * 0.02, width: s * 0.07, height: s * 0.09))
            context.fill(tongue, with: .color(Color(hex: "E91E63")))
            context.stroke(tongue, with: .color(Color.black.opacity(0.30)), lineWidth: max(0.8, s * 0.006))

        case .oh:
            let ohW = s * 0.07
            let ohH = s * 0.09
            let ohRect = CGRect(x: centerX - ohW * 0.5, y: mouthY - ohH * 0.3, width: ohW, height: ohH)
            context.fill(Path(ellipseIn: ohRect), with: .color(mc))
            context.stroke(Path(ellipseIn: ohRect), with: .color(Color.black.opacity(0.92)), lineWidth: max(1.0, s * 0.008))
            context.fill(Path(ellipseIn: CGRect(x: centerX - ohW * 0.2, y: mouthY - ohH * 0.15, width: ohW * 0.25, height: ohH * 0.2)), with: .color(.white.opacity(0.2)))

        case .catMouth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY + s * 0.02))
            path.addQuadCurve(to: CGPoint(x: centerX, y: mouthY - s * 0.01), control: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.07))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW, y: mouthY + s * 0.02), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.07))
            context.stroke(path, with: .color(mc), lineWidth: mw)

        case .smirk:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.5, y: mouthY + s * 0.01))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY - s * 0.03), control: CGPoint(x: centerX + mouthW * 0.5, y: mouthY + s * 0.08))
            context.stroke(path, with: .color(mc), lineWidth: mw)

        case .teeth:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.12))
            path.closeSubpath()
            context.fill(path, with: .color(mc))
            context.stroke(path, with: .color(Color.black.opacity(0.92)), style: StrokeStyle(lineWidth: s * 0.012, lineCap: .round, lineJoin: .round))
            var teethPath = Path()
            teethPath.move(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY))
            teethPath.addLine(to: CGPoint(x: centerX + mouthW * 1.3, y: mouthY + s * 0.028))
            teethPath.addLine(to: CGPoint(x: centerX - mouthW * 1.3, y: mouthY + s * 0.028))
            teethPath.closeSubpath()
            context.fill(teethPath, with: .color(.white))
            context.stroke(teethPath, with: .color(Color.black.opacity(0.30)), lineWidth: max(0.6, s * 0.004))

        case .tiny:
            let dotSize = s * 0.038
            context.fill(Path(ellipseIn: CGRect(x: centerX - dotSize * 0.5, y: mouthY, width: dotSize, height: dotSize)), with: .color(mc))

        case .flat:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 0.8, y: mouthY + s * 0.01))
            path.addLine(to: CGPoint(x: centerX + mouthW * 0.8, y: mouthY + s * 0.01))
            context.stroke(path, with: .color(mc), lineWidth: mw)

        case .wavy:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW, y: mouthY))
            path.addCurve(
                to: CGPoint(x: centerX + mouthW, y: mouthY),
                control1: CGPoint(x: centerX - mouthW * 0.4, y: mouthY + s * 0.07),
                control2: CGPoint(x: centerX + mouthW * 0.4, y: mouthY - s * 0.05)
            )
            context.stroke(path, with: .color(mc), lineWidth: mw)

        default:
            var path = Path()
            path.move(to: CGPoint(x: centerX - mouthW * 1.1, y: mouthY))
            path.addQuadCurve(to: CGPoint(x: centerX + mouthW * 1.1, y: mouthY), control: CGPoint(x: centerX, y: mouthY + s * 0.10))
            context.stroke(path, with: .color(mc), lineWidth: mw)
        }
    }

    private func drawAccessory(context: inout GraphicsContext, type: AccessoryType, size: CGFloat) {
        let s = size
        let oc = Color.black.opacity(0.92)
        let ow: CGFloat = s * 0.015
        let iw: CGFloat = s * 0.008
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
            context.stroke(crown, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            let gemSize = s * 0.04
            for gem in [(s * 0.39, s * 0.20, "E91E63"), (s * 0.48, s * 0.18, "42A5F5"), (s * 0.57, s * 0.20, "66BB6A")] {
                context.fill(Path(ellipseIn: CGRect(x: gem.0, y: gem.1, width: gemSize, height: gemSize)), with: .color(Color(hex: gem.2)))
                context.fill(Path(ellipseIn: CGRect(x: gem.0 + gemSize * 0.15, y: gem.1 + gemSize * 0.12, width: gemSize * 0.3, height: gemSize * 0.25)), with: .color(.white.opacity(0.40)))
            }

        case .gradCap:
            var cap = Path()
            cap.move(to: CGPoint(x: s * 0.50, y: s * 0.08))
            cap.addLine(to: CGPoint(x: s * 0.20, y: s * 0.24))
            cap.addLine(to: CGPoint(x: s * 0.50, y: s * 0.32))
            cap.addLine(to: CGPoint(x: s * 0.80, y: s * 0.24))
            cap.closeSubpath()
            context.fill(cap, with: .color(.black.opacity(0.85)))
            context.stroke(cap, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            let boardRect = CGRect(x: s * 0.28, y: s * 0.22, width: s * 0.44, height: s * 0.06)
            context.fill(Path(roundedRect: boardRect, cornerRadius: 2), with: .color(.black.opacity(0.85)))
            var tassel = Path()
            tassel.move(to: CGPoint(x: s * 0.50, y: s * 0.24))
            tassel.addCurve(to: CGPoint(x: s * 0.74, y: s * 0.40), control1: CGPoint(x: s * 0.55, y: s * 0.28), control2: CGPoint(x: s * 0.70, y: s * 0.36))
            context.stroke(tassel, with: .color(Color(hex: "FFD54F")), lineWidth: max(2, s * 0.014))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.72, y: s * 0.38, width: s * 0.06, height: s * 0.06)), with: .color(Color(hex: "FFD54F")))

        case .topHat:
            let brimRect = CGRect(x: s * 0.18, y: s * 0.22, width: s * 0.64, height: s * 0.06)
            let hatBody = CGRect(x: s * 0.28, y: s * 0.00, width: s * 0.44, height: s * 0.24)
            context.fill(Path(roundedRect: hatBody, cornerRadius: 4), with: .color(.black.opacity(0.85)))
            context.fill(Path(roundedRect: brimRect, cornerRadius: 3), with: .color(.black.opacity(0.85)))
            var hatOutline = Path()
            hatOutline.addRoundedRect(in: hatBody, cornerSize: CGSize(width: 4, height: 4))
            hatOutline.addRoundedRect(in: brimRect, cornerSize: CGSize(width: 3, height: 3))
            context.stroke(hatOutline, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            var bandRect = Path()
            bandRect.addRect(CGRect(x: s * 0.28, y: s * 0.16, width: s * 0.44, height: s * 0.04))
            context.fill(bandRect, with: .color(Color(hex: "E91E63")))
            context.fill(Path(roundedRect: CGRect(x: s * 0.30, y: s * 0.02, width: s * 0.10, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.12)))

        case .bow:
            var bowL = Path()
            bowL.addEllipse(in: CGRect(x: s * 0.28, y: s * 0.14, width: s * 0.18, height: s * 0.14))
            var bowR = Path()
            bowR.addEllipse(in: CGRect(x: s * 0.54, y: s * 0.14, width: s * 0.18, height: s * 0.14))
            context.fill(bowL, with: .color(Color(hex: "E91E63")))
            context.stroke(bowL, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(bowR, with: .color(Color(hex: "E91E63")))
            context.stroke(bowR, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.32, y: s * 0.16, width: s * 0.08, height: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.45)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.58, y: s * 0.16, width: s * 0.08, height: s * 0.06)), with: .color(Color(hex: "F48FB1").opacity(0.45)))
            let knot = CGRect(x: s * 0.46, y: s * 0.17, width: s * 0.08, height: s * 0.08)
            fns(context: &context, path: Path(ellipseIn: knot), fill: Color(hex: "C2185B"), outline: oc, lineWidth: iw)

        case .bandana:
            var bandana = Path()
            bandana.move(to: CGPoint(x: s * 0.12, y: s * 0.30))
            bandana.addQuadCurve(to: CGPoint(x: s * 0.88, y: s * 0.30), control: CGPoint(x: s * 0.50, y: s * 0.24))
            bandana.addLine(to: CGPoint(x: s * 0.88, y: s * 0.35))
            bandana.addQuadCurve(to: CGPoint(x: s * 0.12, y: s * 0.35), control: CGPoint(x: s * 0.50, y: s * 0.29))
            bandana.closeSubpath()
            context.fill(bandana, with: .color(Color(hex: "E53935")))
            context.stroke(bandana, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            var knot = Path()
            knot.move(to: CGPoint(x: s * 0.84, y: s * 0.32))
            knot.addLine(to: CGPoint(x: s * 0.94, y: s * 0.40))
            knot.addLine(to: CGPoint(x: s * 0.90, y: s * 0.42))
            knot.addLine(to: CGPoint(x: s * 0.82, y: s * 0.36))
            knot.closeSubpath()
            context.fill(knot, with: .color(Color(hex: "E53935")))
            context.stroke(knot, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            var dots = Path()
            dots.addEllipse(in: CGRect(x: s * 0.36, y: s * 0.28, width: s * 0.03, height: s * 0.03))
            dots.addEllipse(in: CGRect(x: s * 0.50, y: s * 0.27, width: s * 0.03, height: s * 0.03))
            dots.addEllipse(in: CGRect(x: s * 0.64, y: s * 0.28, width: s * 0.03, height: s * 0.03))
            context.fill(dots, with: .color(Color.white.opacity(0.25)))

        case .halo:
            let haloRect = CGRect(x: s * 0.20, y: s * 0.06, width: s * 0.60, height: s * 0.16)
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFF9C4").opacity(0.40)), lineWidth: max(7, s * 0.050))
            context.stroke(Path(ellipseIn: haloRect), with: .color(Color(hex: "FFD54F")), lineWidth: max(3, s * 0.022))

        case .headphones:
            var band = Path()
            band.addArc(center: CGPoint(x: s * 0.50, y: s * 0.34), radius: s * 0.32, startAngle: .degrees(198), endAngle: .degrees(342), clockwise: false)
            context.stroke(band, with: .color(Color(hex: "424242")), lineWidth: s * 0.040)
            context.stroke(band, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            let padL = CGRect(x: s * 0.10, y: s * 0.36, width: s * 0.14, height: s * 0.18)
            let padR = CGRect(x: s * 0.76, y: s * 0.36, width: s * 0.14, height: s * 0.18)
            fns(context: &context, path: Path(roundedRect: padL, cornerRadius: 5), fill: Color(hex: "424242"), outline: oc, lineWidth: ow)
            fns(context: &context, path: Path(roundedRect: padR, cornerRadius: 5), fill: Color(hex: "424242"), outline: oc, lineWidth: ow)
            context.fill(Path(roundedRect: CGRect(x: s * 0.12, y: s * 0.38, width: s * 0.04, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.15)))
            context.fill(Path(roundedRect: CGRect(x: s * 0.78, y: s * 0.38, width: s * 0.04, height: s * 0.06), cornerRadius: 2), with: .color(Color.white.opacity(0.15)))

        case .eyePatch:
            var strap = Path()
            strap.move(to: CGPoint(x: s * 0.10, y: s * 0.36))
            strap.addLine(to: CGPoint(x: s * 0.90, y: s * 0.36))
            context.stroke(strap, with: .color(.black.opacity(0.85)), lineWidth: max(2, s * 0.016))
            var strapDiag = Path()
            strapDiag.move(to: CGPoint(x: s * 0.10, y: s * 0.50))
            strapDiag.addLine(to: CGPoint(x: s * 0.90, y: s * 0.30))
            context.stroke(strapDiag, with: .color(.black.opacity(0.85)), lineWidth: max(2, s * 0.016))
            let patchRect = CGRect(x: s * 0.52, y: s * 0.33, width: s * 0.20, height: s * 0.18)
            fns(context: &context, path: Path(ellipseIn: patchRect), fill: .black.opacity(0.88), outline: oc, lineWidth: ow)
            context.fill(Path(ellipseIn: CGRect(x: s * 0.56, y: s * 0.36, width: s * 0.05, height: s * 0.04)), with: .color(.white.opacity(0.12)))

        case .partyHat:
            var hat = Path()
            hat.move(to: CGPoint(x: s * 0.50, y: s * 0.00))
            hat.addLine(to: CGPoint(x: s * 0.30, y: s * 0.28))
            hat.addLine(to: CGPoint(x: s * 0.70, y: s * 0.28))
            hat.closeSubpath()
            let hatGrad = Gradient(colors: [Color(hex: "E91E63"), Color(hex: "FF5722"), Color(hex: "FFC107")])
            context.fill(hat, with: .linearGradient(hatGrad, startPoint: CGPoint(x: s * 0.50, y: 0), endPoint: CGPoint(x: s * 0.50, y: s * 0.28)))
            context.stroke(hat, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            for stripe in [(0.06, "42A5F5"), (0.12, "66BB6A"), (0.18, "FFC107")] as [(CGFloat, String)] {
                let y = s * stripe.0
                let pct = stripe.0 / 0.28
                let halfW = s * 0.20 * (1.0 - pct * 0.6)
                var line = Path()
                line.move(to: CGPoint(x: s * 0.50 - halfW, y: y))
                line.addLine(to: CGPoint(x: s * 0.50 + halfW, y: y))
                context.stroke(line, with: .color(Color(hex: stripe.1).opacity(0.55)), lineWidth: max(1.5, s * 0.010))
            }
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * -0.02, width: s * 0.08, height: s * 0.08)), with: .color(Color(hex: "FFD54F")))
            context.stroke(Path(ellipseIn: CGRect(x: s * 0.46, y: s * -0.02, width: s * 0.08, height: s * 0.08)), with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))

        case .flower:
            let flowerCenter = CGPoint(x: s * 0.78, y: s * 0.28)
            let petalSize = s * 0.07
            let petalColor = Color(hex: "F48FB1")
            for i in 0..<6 {
                let angle = Double(i) * (Double.pi / 3.0)
                let px = flowerCenter.x + petalSize * 0.7 * CGFloat(cos(angle))
                let py = flowerCenter.y + petalSize * 0.7 * CGFloat(sin(angle))
                let petal = CGRect(x: px - petalSize * 0.5, y: py - petalSize * 0.5, width: petalSize, height: petalSize)
                context.fill(Path(ellipseIn: petal), with: .color(petalColor))
                context.stroke(Path(ellipseIn: petal), with: .color(oc.opacity(0.4)), style: StrokeStyle(lineWidth: iw * 0.5, lineCap: .round, lineJoin: .round))
            }
            context.fill(Path(ellipseIn: CGRect(x: flowerCenter.x - s * 0.03, y: flowerCenter.y - s * 0.03, width: s * 0.06, height: s * 0.06)), with: .color(Color(hex: "FFD54F")))
            context.stroke(Path(ellipseIn: CGRect(x: flowerCenter.x - s * 0.03, y: flowerCenter.y - s * 0.03, width: s * 0.06, height: s * 0.06)), with: .color(oc.opacity(0.4)), style: StrokeStyle(lineWidth: iw * 0.5, lineCap: .round, lineJoin: .round))
            var stem = Path()
            stem.move(to: CGPoint(x: flowerCenter.x, y: flowerCenter.y + s * 0.04))
            stem.addQuadCurve(to: CGPoint(x: flowerCenter.x - s * 0.03, y: flowerCenter.y + s * 0.14), control: CGPoint(x: flowerCenter.x + s * 0.04, y: flowerCenter.y + s * 0.10))
            context.stroke(stem, with: .color(Color(hex: "66BB6A")), lineWidth: max(1.5, s * 0.010))

        case .horns:
            var hornL = Path()
            hornL.move(to: CGPoint(x: s * 0.22, y: s * 0.30))
            hornL.addQuadCurve(to: CGPoint(x: s * 0.10, y: s * 0.06), control: CGPoint(x: s * 0.08, y: s * 0.18))
            hornL.addQuadCurve(to: CGPoint(x: s * 0.30, y: s * 0.28), control: CGPoint(x: s * 0.22, y: s * 0.10))
            hornL.closeSubpath()
            var hornR = Path()
            hornR.move(to: CGPoint(x: s * 0.78, y: s * 0.30))
            hornR.addQuadCurve(to: CGPoint(x: s * 0.90, y: s * 0.06), control: CGPoint(x: s * 0.92, y: s * 0.18))
            hornR.addQuadCurve(to: CGPoint(x: s * 0.70, y: s * 0.28), control: CGPoint(x: s * 0.78, y: s * 0.10))
            hornR.closeSubpath()
            context.fill(hornL, with: .color(Color(hex: "E53935")))
            context.stroke(hornL, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(hornR, with: .color(Color(hex: "E53935")))
            context.stroke(hornR, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.14, y: s * 0.08, width: s * 0.04, height: s * 0.03)), with: .color(Color.white.opacity(0.25)))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.86, y: s * 0.08, width: s * 0.04, height: s * 0.03)), with: .color(Color.white.opacity(0.25)))

        case .tiara:
            var tiara = Path()
            tiara.move(to: CGPoint(x: s * 0.18, y: s * 0.28))
            tiara.addQuadCurve(to: CGPoint(x: s * 0.30, y: s * 0.14), control: CGPoint(x: s * 0.22, y: s * 0.18))
            tiara.addQuadCurve(to: CGPoint(x: s * 0.40, y: s * 0.22), control: CGPoint(x: s * 0.35, y: s * 0.22))
            tiara.addQuadCurve(to: CGPoint(x: s * 0.50, y: s * 0.10), control: CGPoint(x: s * 0.44, y: s * 0.14))
            tiara.addQuadCurve(to: CGPoint(x: s * 0.60, y: s * 0.22), control: CGPoint(x: s * 0.56, y: s * 0.14))
            tiara.addQuadCurve(to: CGPoint(x: s * 0.70, y: s * 0.14), control: CGPoint(x: s * 0.65, y: s * 0.22))
            tiara.addQuadCurve(to: CGPoint(x: s * 0.82, y: s * 0.28), control: CGPoint(x: s * 0.78, y: s * 0.18))
            tiara.closeSubpath()
            let tiaraGrad = Gradient(colors: [Color(hex: "CE93D8"), Color(hex: "F48FB1")])
            context.fill(tiara, with: .linearGradient(tiaraGrad, startPoint: CGPoint(x: s * 0.50, y: s * 0.10), endPoint: CGPoint(x: s * 0.50, y: s * 0.28)))
            context.stroke(tiara, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            let gemT = s * 0.035
            context.fill(Path(ellipseIn: CGRect(x: s * 0.48, y: s * 0.14, width: gemT, height: gemT)), with: .color(Color(hex: "42A5F5")))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.49, y: s * 0.145, width: gemT * 0.35, height: gemT * 0.3)), with: .color(.white.opacity(0.40)))

        case .beanie:
            var beanie = Path()
            beanie.move(to: CGPoint(x: s * 0.14, y: s * 0.32))
            beanie.addQuadCurve(to: CGPoint(x: s * 0.86, y: s * 0.32), control: CGPoint(x: s * 0.50, y: s * 0.04))
            beanie.addLine(to: CGPoint(x: s * 0.86, y: s * 0.36))
            beanie.addQuadCurve(to: CGPoint(x: s * 0.14, y: s * 0.36), control: CGPoint(x: s * 0.50, y: s * 0.34))
            beanie.closeSubpath()
            context.fill(beanie, with: .color(Color(hex: "5C6BC0")))
            context.stroke(beanie, with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            var brim = Path()
            brim.move(to: CGPoint(x: s * 0.10, y: s * 0.32))
            brim.addQuadCurve(to: CGPoint(x: s * 0.90, y: s * 0.32), control: CGPoint(x: s * 0.50, y: s * 0.28))
            brim.addQuadCurve(to: CGPoint(x: s * 0.10, y: s * 0.32), control: CGPoint(x: s * 0.50, y: s * 0.38))
            brim.closeSubpath()
            context.fill(brim, with: .color(Color(hex: "3F51B5")))
            context.stroke(brim, with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))
            context.fill(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.02, width: s * 0.08, height: s * 0.08)), with: .color(Color(hex: "5C6BC0")))
            context.stroke(Path(ellipseIn: CGRect(x: s * 0.46, y: s * 0.02, width: s * 0.08, height: s * 0.08)), with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))

        default: break
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
        context.stroke(path, with: .color(Color.black.opacity(0.30)), style: StrokeStyle(lineWidth: max(1.0, radius * 0.08), lineCap: .round, lineJoin: .round))
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
        context.stroke(path, with: .color(Color.black.opacity(0.30)), style: StrokeStyle(lineWidth: max(1.0, size * 0.06), lineCap: .round, lineJoin: .round))
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
