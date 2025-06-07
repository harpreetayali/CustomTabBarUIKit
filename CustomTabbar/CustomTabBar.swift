//
//  CustomTabBar 2.swift
//  CustomTabbar
//
//  Created by Harpreet on 13/05/25.
//

import UIKit

class CustomTabBar: UITabBar {

    private var shapeLayer: CAShapeLayer?

    override func draw(_ rect: CGRect) {
        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPathCircle()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -2)
        shapeLayer.shadowOpacity = 0.1
        shapeLayer.shadowRadius = 8

        if let oldShape = self.shapeLayer {
            layer.replaceSublayer(oldShape, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }
    
    private func createPathCircle() -> CGPath {
        let radius: CGFloat = 38.0
        let curveDepth: CGFloat = 8.0
        let centerWidth = self.frame.width / 2

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))

        // Left flat part of the tab bar
        path.addLine(to: CGPoint(x: centerWidth - radius * 1.1, y: 0))

        // Left curve into the arc
        path.addQuadCurve(
            to: CGPoint(x: centerWidth - radius, y: curveDepth + 6),
            controlPoint: CGPoint(x: centerWidth - radius, y: 0)
        )

        // Main center arc (semi-circle)
        path.addArc(
            withCenter: CGPoint(x: centerWidth, y: curveDepth),
            radius: radius,
            startAngle: CGFloat(160).degreesToRadians,
            endAngle: CGFloat(12).degreesToRadians,
            clockwise: false
        )

        // Right curve out of the arc
        path.addQuadCurve(
            to: CGPoint(x: centerWidth + radius * 2 - 2, y: 0),
            controlPoint: CGPoint(x: centerWidth + radius, y: -4)
        )

        // Right flat part of the tab bar
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath()
        let center = self.frame.width / 2
        let radius: CGFloat = 36
        let curveDepth: CGFloat = 8

        let arcInset: CGFloat = 16

        path.move(to: CGPoint(x: 0, y: 0))

        // Left flat part of tab bar
        path.addLine(to: CGPoint(x: center - radius - arcInset, y: 0))

        // Gentle left curve into arc
        path.addQuadCurve(
            to: CGPoint(x: center - radius, y: curveDepth + 6),
            controlPoint: CGPoint(x: center - radius - 4, y: 0) // only slight roundness
        )

        // Main center arc (semi-circle)
        path.addArc(
            withCenter: CGPoint(x: center, y: curveDepth - 2),
            radius: radius,
            startAngle: CGFloat.pi * 155 / 180,
            endAngle: CGFloat.pi * 20 / 180,
            clockwise: false
        )

        // Gentle right curve out of arc
        path.addQuadCurve(
            to: CGPoint(x: center + radius + arcInset, y: 0),
            controlPoint: CGPoint(x: center + radius + 2, y: 0) // only slight roundness
        )

        // Right flat part of tab bar
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }


}
extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
