//
//  BindingVsState.swift
//  Bookworm
//
//  Created by Mostafa Hosseini on 6/5/23.
//

import SwiftUI

struct BindingVsState: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(
                title: "Remember Me",
                isOn: $rememberMe
            )
            Text(rememberMe ? "On" : "Off")
        }
        .animation(.default, value: rememberMe)
    }
}

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(
                colors: isOn ? onColors : offColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct BindingVsState_Previews: PreviewProvider {
    static var previews: some View {
        BindingVsState()
    }
}
