//
//  ImageGeometryReader.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/14/23.
//

import SwiftUI

struct ImageGeometryReader: View {
    var body: some View {
        // Geo reader align it's content to top left
        GeometryReader { geo in
            Image("example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
            //            .clipped()
        }
    }
}

struct ImageGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ImageGeometryReader()
    }
}
