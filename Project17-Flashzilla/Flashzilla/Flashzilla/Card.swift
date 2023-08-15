//
//  Card.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/13/23.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
