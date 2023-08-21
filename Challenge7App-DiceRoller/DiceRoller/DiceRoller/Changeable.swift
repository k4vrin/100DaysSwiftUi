//
//  Changeable.swift
//  DiceRoller
//
//  Created by Mostafa Hosseini on 8/21/23.
//

import Foundation

protocol Changeable {}
extension Changeable {
    func changing(change: (inout Self) -> Void) -> Self {
        var a = self
        change(&a)
        return a
    }
}
