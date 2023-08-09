//
//  UseGesturesNested.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/9/23.
//

import SwiftUI

struct UseGesturesNested: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    // Child gesture is preferred between two tap gestures
                    print("Text tapped!")
                }
        }
//        .onTapGesture {
//            print("VStack tapped!")
//        }
        // Make this higher priority to child gesture
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded {
//                    print("VStack tapped!")
//                }
//        )
        // Parent and child gesture together
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("VStack tapped!")
                }
        )
    }
}

struct UseGesturesNested_Previews: PreviewProvider {
    static var previews: some View {
        UseGesturesNested()
    }
}
