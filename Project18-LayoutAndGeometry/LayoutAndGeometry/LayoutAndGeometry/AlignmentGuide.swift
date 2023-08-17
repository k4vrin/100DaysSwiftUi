//
//  AlignmentGuide.swift
//  LayoutAndGeometry
//
//  Created by Mostafa Hosseini on 8/17/23.
//

import SwiftUI

struct AlignmentGuide: View {
    var body: some View {
//        Text("Live long and prosper!")
//            .frame(width: 300, height: 300, alignment: .topLeading)
//
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
        
//        VStack(alignment: .leading) {
//            Text("Hello, World!")
        // When you have been asked to provide leading alignment guide, provide trailing instead
//                .alignmentGuide(.leading) { d in
//                    d[.trailing]
//                }
//            Text("This is a longer line of text")
//
//        }
//        .background(.red)
//        .frame(width: 400, height: 400)
//        .background(.blue)
            
        
        VStack(alignment: .leading) {
            ForEach(0..<10) { pos in
                Text("Number \(pos)")
                    .alignmentGuide(.leading) { d in
                        // Customizing what the idea of leading edge actually is
                        Double(pos) * -10
                    }
            }
                
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

struct AlignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuide()
    }
}
