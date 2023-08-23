//
//  SideBySide.swift
//  SnowSeeker
//
//  Created by Mostafa Hosseini on 8/23/23.
//

import SwiftUI

struct SideBySide: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New Secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
            
            Text("Tertiary")
        }
    }
}

struct SideBySide_Previews: PreviewProvider {
    static var previews: some View {
        SideBySide()
    }
}
