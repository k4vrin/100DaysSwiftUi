//
//  Expenses.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 5/4/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "Items") {
            if let savedItems = try? decoder.decode([ExpenseItem].self, from: data) {
                self.items = savedItems
                return
            }
        }
        self.items = []
    }
}
