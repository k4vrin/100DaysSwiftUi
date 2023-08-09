//
//  DisablingUserInteractivity.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/9/23.
//

import SwiftUI

struct DisablingUserInteractivity: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
////                .allowsHitTesting(false)
//        }
    }
}

struct DisablingUserInteractivity_Previews: PreviewProvider {
    static var previews: some View {
        DisablingUserInteractivity()
    }
}
