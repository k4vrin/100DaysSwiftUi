//
//  Astronaut.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/17/23.
//

import Foundation

// Identifiable: so we can use arrays of astronauts inside ForEach and more
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
