//
//  AppMoveToBackground.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/10/23.
//

import SwiftUI

struct AppMoveToBackground: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { newPhase in
//                if newPhase == .active {
//                    print("Active")
//                } else if newPhase == .inactive {
//                    print("Inactive")
//                } else if newPhase == .background {
//                    print("Background")
//                }
                if case .active = newPhase {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct AppMoveToBackground_Previews: PreviewProvider {
    static var previews: some View {
        AppMoveToBackground()
    }
}
