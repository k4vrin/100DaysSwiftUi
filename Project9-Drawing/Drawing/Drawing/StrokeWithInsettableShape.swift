//
//  StrokeWithInsettableShape.swift
//  Drawing
//
//  Created by Mostafa Hosseini on 5/22/23.
//

import SwiftUI

struct StrokeWithInsettableShape: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(.blue, lineWidth: 40)
            Circle()
                .strokeBorder(.blue, lineWidth: 40)
            
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(.blue, lineWidth: 10)
        }
    }
}

struct StrokeWithInsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        StrokeWithInsettableShape()
    }
}
