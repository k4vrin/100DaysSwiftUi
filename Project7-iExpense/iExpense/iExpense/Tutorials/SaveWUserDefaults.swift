//
//  SaveWUserDefaults.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

struct SaveWUserDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

struct SaveWUserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        SaveWUserDefaults()
    }
}
