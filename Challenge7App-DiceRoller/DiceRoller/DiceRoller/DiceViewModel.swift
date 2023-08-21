//
//  DiceViewModel.swift
//  DiceRoller
//
//  Created by Mostafa Hosseini on 8/21/23.
//

import Foundation


@MainActor
class DiceViewModel: ObservableObject {
    @Published private(set) var state = DiceState()
    
    func roll() {
        state = state.changing { mState in
            mState.dices = mState.dices.map { dice in
                dice.changing { mDice in
                    mDice.number = (1...mDice.sides).randomElement()!
                }
            }
        }
    }
    
    func saveHistory() {
        state = state.changing { mState in
            mState.history.append("\(mState.dices.map{ dice in "Sides: \(dice.sides), Number: \(dice.number)"}.joined(separator: ", "))")
        }
    }
}


struct DiceState: Changeable {
    var dices: [Dice] = [Dice(sides: 6)]
    var history: [String] = []
}

struct Dice: Codable, Hashable, Changeable {
    let sides: Int
    var number: Int = 1
}

