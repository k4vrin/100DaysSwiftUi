//
//  PblishObservable.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/2/23.
//

import SwiftUI

@MainActor class Delayedpdater: ObservableObject {
    var vale = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1 ... 10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.vale += 1
            }
        }
    }
}

struct PblishObservable: View {
    @StateObject private var updater = Delayedpdater()

    var body: some View {
        Text("Value is \(updater.vale)")
    }
}

struct PblishObservable_Previews: PreviewProvider {
    static var previews: some View {
        PblishObservable()
    }
}
