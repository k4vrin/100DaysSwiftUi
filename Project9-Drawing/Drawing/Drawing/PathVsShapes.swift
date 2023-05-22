//
//  PathVsShapes.swift
//  Drawing
//
//  Created by Mostafa Hosseini on 5/22/23.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    // Shapes measure their coordinate from bottom left corner
    // rather than top left corner
    func path(in rect: CGRect) -> Path {
        
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStartAngle = startAngle - rotationAdjustment
        let modifiedEndAngle = endAngle - rotationAdjustment
        
        var path = Path()

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: min(rect.width, rect.height) / 2 - insetAmount, startAngle: modifiedStartAngle, endAngle: modifiedEndAngle, clockwise: !clockwise)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}



struct PathVsShapes: View {
    var body: some View {
        VStack {
            Triangle()
                //            .fill(.red)
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)

            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
        }
    }
}

struct PathVsShapes_Previews: PreviewProvider {
    static var previews: some View {
        PathVsShapes()
    }
}
