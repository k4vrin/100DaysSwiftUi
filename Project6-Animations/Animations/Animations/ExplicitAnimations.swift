//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Mostafa Hosseini on 4/23/23.
//

import SwiftUI

struct ExplicitAnimations: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        VStack {
            Button {
                withAnimation(
                    .interpolatingSpring(stiffness: 5, damping: 1)
                ) {
                    animationAmount += 360
                }
            } label: {
                Text("Tap me")
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 0))
        }
        
    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}
