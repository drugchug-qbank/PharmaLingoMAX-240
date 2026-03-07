import SwiftUI

enum AvatarOverlayHelpers {

    static func drawMouth(context: inout GraphicsContext, style: MouthStyle, size: CGFloat) {
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
        }
    }

    static func drawAccessory(context: inout GraphicsContext, type: AccessoryType, size: CGFloat) {
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
            context.fill(Path(ellipseIn: knot), with: .color(Color(hex: "C2185B")))
            context.stroke(Path(ellipseIn: knot), with: .color(oc), style: StrokeStyle(lineWidth: iw, lineCap: .round, lineJoin: .round))

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
            context.fill(Path(roundedRect: padL, cornerRadius: 5), with: .color(Color(hex: "424242")))
            context.stroke(Path(roundedRect: padL, cornerRadius: 5), with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
            context.fill(Path(roundedRect: padR, cornerRadius: 5), with: .color(Color(hex: "424242")))
            context.stroke(Path(roundedRect: padR, cornerRadius: 5), with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
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
            context.fill(Path(ellipseIn: patchRect), with: .color(.black.opacity(0.88)))
            context.stroke(Path(ellipseIn: patchRect), with: .color(oc), style: StrokeStyle(lineWidth: ow, lineCap: .round, lineJoin: .round))
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
        }
    }
}
