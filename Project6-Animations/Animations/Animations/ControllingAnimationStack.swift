//
//  ControllingAnimationStack.swift
//  Animations
//
//  Created by Mostafa Hosseini on 4/23/23.
//

import SwiftUI

struct ControllingAnimationStack: View {
    
    @State private var enabled = false
    
    var body: some View {
        
        Button("Tap me") {
            enabled.toggle()
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.default, value: enabled)
        
        
    }
}

struct ControllingAnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        ControllingAnimationStack()
    }
}
