//
//  CustomPath.swift
//  Drawing
//
//  Created by Mostafa Hosseini on 5/22/23.
//

import SwiftUI

struct CustomPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            // Connect them nicely
            path.closeSubpath()
        }
//        .fill(.blue)
//        .stroke(.blue, lineWidth: 10)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct CustomPath_Previews: PreviewProvider {
    static var previews: some View {
        CustomPath()
    }
}
