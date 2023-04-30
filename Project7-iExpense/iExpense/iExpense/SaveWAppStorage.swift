//
//  SaveWAppStorage.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

struct SaveWAppStorage: View {
    
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct SaveWAppStorage_Previews: PreviewProvider {
    static var previews: some View {
        SaveWAppStorage()
    }
}
