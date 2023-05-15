//
//  HierarchicalCodable.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/15/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct HierarchicalCodable: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name":"Taylor Swift",
                "address": {
                    "street":"555, Taylor Swift Avenue",
                    "city":"Nashville"
                }

            }

            """
            
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct HierarchicalCodable_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalCodable()
    }
}
