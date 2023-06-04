//
//  Order.swift
//  CupcakeCorner
//
//  Created by Mostafa Hosseini on 6/1/23.
//

import SwiftUI

struct Order: Codable {
    var type = 0
    var quantity = 3
    var extraFrosting = false
    var addSprinkles = false
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}

struct CupcakeState {
    var order = Order()
    var hasValidAddress: Bool {
        if order.name.isBlank() || order.streetAddress.isBlank() || order.city.isBlank() || order.zip.isBlank() {
            return false
        }
        return true
    }
    var cost: Double {
        // $2 per cake
        var cost = Double(order.quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(order.type) / 2)
        
        // $1/cake for extra frosting
        if order.extraFrosting {
            cost += Double(order.quantity)
        }
        
        // $1/cake for extra frosting
        if order.addSprinkles {
            cost += Double(order.quantity) / 2
        }
        
        return cost
    }
    
    var specialRequestEnable = false {
        didSet {
            if !specialRequestEnable {
                order.extraFrosting = false
                order.addSprinkles = false
            }
        }
    }
}

class ViewModel: ObservableObject {
    
    init() {}
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var state = CupcakeState()

}

extension String {
    func isBlank() -> Bool {
        self.isEmpty || self.allSatisfy { ch in
            ch.isWhitespace
        }
    }
}
