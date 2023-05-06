//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 5/4/23.
//

import Foundation

// Identifiable: This type can be identified uniquely
// we longer need to tell ForEach how to identify this struct
struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}



enum ExpenseType: Codable {
    case Personal, Business
    
    var description: String {
        switch self {
        case .Business: return "Business"
        case .Personal: return "Personal"
        }
    }
}
