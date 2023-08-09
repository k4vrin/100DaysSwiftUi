//
//  UseGestures.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/9/23.
//

import SwiftUI

struct UseGestures: View {
    
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .scaleEffect(finalAmount + currentAmount)
            .rotationEffect(finalAmount + currentAmount)
            .gesture(
//                MagnificationGesture()
//                    .onChanged { amount in
//                        currentAmount = amount - 1
//                    }
//                    .onEnded { amount in
//                        finalAmount += currentAmount
//                        currentAmount = 0
//                    }
                RotationGesture()
                    .onChanged { amount in
                        currentAmount = amount
                    }
                    .onEnded { amount in
                        finalAmount += currentAmount
                        currentAmount = Angle.zero
                    }
            )
//            .onTapGesture(count: 2) {}
        // 2 seconds ⬇️
//            .onLongPressGesture(minimumDuration: 2) {
//                print("Long pressed")
//            } onPressingChanged: { inProgress in
//                print("In progress: \(inProgress)")
//            }
    }
}

struct UseGestures_Previews: PreviewProvider {
    static var previews: some View {
        UseGestures()
    }
}
