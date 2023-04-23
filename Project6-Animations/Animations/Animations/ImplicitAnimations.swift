//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by Mostafa Hosseini on 4/23/23.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount1 = 1.0
    @State private var animationAmount2 = 1.0

    var body: some View {
        VStack {
            Button {
                animationAmount1 += 1
            } label: {
                Text("Tap me")
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .scaleEffect(animationAmount1)
            .blur(radius: (animationAmount1 - 1) * 3)
            //        .animation(.default, value: animationAmount)
            //        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
            //        .animation(.easeInOut(duration: 2), value: animationAmount)
            .animation(
                .easeInOut(duration: 1)
                    //                .delay(1)
                    //                .repeatCount(2, autoreverses: true)
                    .repeatForever(autoreverses: true),
                value: animationAmount1
            )

            Spacer()

            Button {} label: {
                Text("Tap me")
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount2)
                            .opacity(2 - animationAmount2)
                            .animation(
                                .easeInOut(duration: 1)
                                    .repeatForever(autoreverses: false),

                                value: animationAmount2
                            )
                    }
                    .onAppear {
                        animationAmount2 = 2
                    }
            }
        }
    }
}

struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimations()
    }
}
