//
//  ContentView.swift
//  Animations
//
//  Created by Mostafa Hosseini on 4/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ControllingAnimationStack()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
