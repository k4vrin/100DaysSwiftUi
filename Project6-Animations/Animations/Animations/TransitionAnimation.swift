//
//  TransitionAnimation.swift
//  Animations
//
//  Created by Mostafa Hosseini on 4/26/23.
//

import SwiftUI

struct TransitionAnimation: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
            
        }
    }
}

struct TransitionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TransitionAnimation()
    }
}
