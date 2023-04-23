//
//  BindingAnimations.swift
//  Animations
//
//  Created by Mostafa Hosseini on 4/23/23.
//

import SwiftUI

struct BindingAnimations: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3)
            ), in: 1...10)
            
            Spacer()
            
            Button {
                animationAmount += 1
            } label: {
                Text("Tap me")
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount)
            }
            
        }
    }
}

struct BindingAnimations_Previews: PreviewProvider {
    static var previews: some View {
        BindingAnimations()
    }
}
