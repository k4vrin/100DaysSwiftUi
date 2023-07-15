//
//  TouchIDOrFaceID.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/15/23.
//

import LocalAuthentication
import SwiftUI

struct TouchIDOrFaceID: View {
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                success, authError in
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            // No Biometrics
        }
    }
}

struct TouchIDOrFaceID_Previews: PreviewProvider {
    static var previews: some View {
        TouchIDOrFaceID()
    }
}
