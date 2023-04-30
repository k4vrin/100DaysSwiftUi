//
//  SaveSwiftObjects.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

struct User3: Codable {
    let firstName: String
    let lastName: String
}

struct SaveSwiftObjects: View {
    
    @State private var user = User3(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct SaveSwiftObjects_Previews: PreviewProvider {
    static var previews: some View {
        SaveSwiftObjects()
    }
}
