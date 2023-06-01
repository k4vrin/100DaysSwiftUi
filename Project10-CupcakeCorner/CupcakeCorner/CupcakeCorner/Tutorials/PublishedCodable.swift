//
//  PublishedCodable.swift
//  CupcakeCorner
//
//  Created by Mostafa Hosseini on 5/30/23.
//

import SwiftUI

struct PublishedCodable: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PublishedCodable_Previews: PreviewProvider {
    static var previews: some View {
        PublishedCodable()
    }
}


class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
        case age
    }
    
    @Published var name = "Paul Hudson"
    @Published var age = 30
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
    }
}
