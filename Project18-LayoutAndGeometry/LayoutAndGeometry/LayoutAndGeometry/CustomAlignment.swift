//
//  CustomAlignment.swift
//  LayoutAndGeometry
//
//  Created by Mostafa Hosseini on 8/17/23.
//

import SwiftUI


extension VerticalAlignment {
    enum MidAccountName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountName.self)
}


struct CustomAlignment: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                Image("kavrin")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

struct CustomAlignment_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignment()
    }
}
