//
//  ArrowShapeChallenge.swift
//  Drawing
//
//  Created by Mostafa Hosseini on 5/27/23.
//

import SwiftUI

struct ArrowShapeChallenge: View {
    @State private var lineThickness = 10.0
    
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(style: StrokeStyle(lineWidth: lineThickness, lineCap: .round, lineJoin: .round))
                .padding()
                .onTapGesture {
                    withAnimation {
                        lineThickness = Double.random(in: 1...50)                    
                    }
                }
        }
    }
}

struct ArrowShapeChallenge_Previews: PreviewProvider {
    static var previews: some View {
        ArrowShapeChallenge()
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let spaceBetweenArrowTails = rect.height/2 - rect.height/2.5

        path.move(to: CGPoint(x: 0, y: rect.height/2))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height/2))
        path.move(to: CGPoint(x: rect.width, y: rect.height/2))
        path.addLine(to: CGPoint(x: rect.width/1.5, y: rect.height/2.5))
        path.move(to: CGPoint(x: rect.width, y: rect.height/2))
        path.addLine(to: CGPoint(x: rect.width/1.5, y: rect.height/2 + spaceBetweenArrowTails))

        return path
    }
}
