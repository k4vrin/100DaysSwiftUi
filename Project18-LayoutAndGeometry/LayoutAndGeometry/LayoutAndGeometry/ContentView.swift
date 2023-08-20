//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Mostafa Hosseini on 8/17/23.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0 ..< 50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color(
                                    hue: min(geo.frame(in: .global).minY / fullView.size.height, 1),
                                    saturation: 1,
                                    brightness: 1
                                )
                            )
                            .rotation3DEffect(
                                .degrees(
                                    geo.frame(in: .global).minY - fullView.size.height / 2
                                ) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .opacity(
                                geo.frame(in: .global).minY / 300
                            )
                            .scaleEffect(
                                x: scaleSize(geo, fullView),
                                y: scaleSize(geo, fullView)
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    func scaleSize(_ geo: GeometryProxy, _ fullView: GeometryProxy) -> CGFloat {
        if geo.frame(in: .global).minY <= (fullView.size.height / 2) {
            return max((1 + (geo.frame(in: .global).minY / (fullView.size.height/2))) * 0.5, 0.5)
        } else {
            return max((1 + (fullView.size.height/2) / (geo.frame(in: .global).minY)) * 0.5, 0.5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
