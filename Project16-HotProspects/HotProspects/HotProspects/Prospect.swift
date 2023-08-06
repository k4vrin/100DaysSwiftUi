//
//  Prospect.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/5/23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isConected = false
}

@MainActor
class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
    
    func toggle(_ prospect: Prospect) {
        // It's important to call this before the actual change
        objectWillChange.send()
        prospect.isConected.toggle()
    }
}
