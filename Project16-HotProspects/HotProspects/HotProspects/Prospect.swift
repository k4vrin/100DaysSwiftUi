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
    var isConected = false
}

@MainActor
class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
}
