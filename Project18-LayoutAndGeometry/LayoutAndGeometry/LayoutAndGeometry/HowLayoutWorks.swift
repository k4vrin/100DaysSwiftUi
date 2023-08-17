//
//  HowLayoutWorks.swift
//  LayoutAndGeometry
//
//  Created by Mostafa Hosseini on 8/17/23.
//

import SwiftUI

struct HowLayoutWorks: View {
    
    // The size of the view is equal to size of it's body
    var body: some View {
        // The TextView is a child of padding
        // padding is a child of background
        Text("Hello, World!")
            .padding(20)
            .background(.red)
        
        // If the whole view is layout neutral it will occupy the whole available space.
        // eg: Color.red
        Color.blue
    }
}

struct HowLayoutWorks_Previews: PreviewProvider {
    static var previews: some View {
        HowLayoutWorks()
    }
}
