//
//  GeoScrollview.swift
//  LayoutAndGeometry
//
//  Created by Mostafa Hosseini on 8/19/23.
//

import SwiftUI

struct GeoScrollview: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
//        GeometryReader { fullView in
//            ScrollView {
//                ForEach(0 ..< 50) { index in
//                    GeometryReader { geo in
//                        Text("Row #\(index)")
//                            .font(.title)
//                            .frame(maxWidth: .infinity)
//                        // We have 7 colors in the array
//                            .background(colors[index % 7])
//                            .rotation3DEffect(
//                                .degrees(
//                                    // geo.frame(in: .global).minY means top of the view distance from
//                                    // top of the screen
//                                    // geo.frame(in: .global).minY - (fullView.size.height / 2) means our views in
//                                    // the middle have 0 degree rottaion.
//                                    geo.frame(in: .global).minY - (fullView.size.height / 2)
//                                ) / 5,
//                                // spin around y direction
//                                axis: (x: 0, y: 1, z: 0)
//                            )
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1 ..< 20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(
                                // left edge. - for rotate clockwise
                                .degrees(-geo.frame(in: .global).minX) / 8,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct GeoScrollview_Previews: PreviewProvider {
    static var previews: some View {
        GeoScrollview()
    }
}
