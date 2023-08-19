//
//  AbsolutePositioning.swift
//  LayoutAndGeometry
//
//  Created by Mostafa Hosseini on 8/19/23.
//

import SwiftUI

struct AbsolutePositioning: View {
    var body: some View {
//        Text("Hello, World!")
//        // The parent does positioning, it returns a view that takes whole
//        // space to position it's child (Text) correctly
//            .position(x: 100, y: 100)
//            .background(.red)
        
        Text("Hello, World!")
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

struct AbsolutePositioning_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePositioning()
    }
}
