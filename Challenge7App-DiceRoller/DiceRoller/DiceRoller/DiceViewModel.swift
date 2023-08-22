//
//  DiceViewModel.swift
//  DiceRoller
//
//  Created by Mostafa Hosseini on 8/21/23.
//

import Foundation

@MainActor
class DiceViewModel: ObservableObject {
    public static let DiceTag = "DiceRoller"

    @Published private(set) var state = DiceState()
    let savePath = FileManager.documentsDirectory.appendingPathComponent(DiceViewModel.DiceTag)

    init() {
        loadData()
    }

    func roll() {
        state = state.changing { mState in
            mState.dices = mState.dices.map { dice in
                dice.changing { mDice in
                    mDice.number = (1 ... mDice.sides).randomElement()!
                }
            }
        }
    }

    func saveHistory() {
        state = state.changing { mState in
            mState.history.append(
                """
                Attempt at \(Date.now.formatted(date: .abbreviated, time: .shortened)):\n\(mState.dices.enumerated().map { idx, dice in "Dice NO\(idx+1), Sides: \(dice.sides), Number: \(dice.number)." }.joined(separator: "\n"))
                """)
        }
        saveData()
    }

    func clearHistory() {
        state = state.changing { mState in
            mState.history.removeAll()
        }
    }

    func addDice(_ dice: Dice) {
        state = state.changing { mState in
            mState.dices.append(dice)
        }
        saveData()
    }

    func removeDice(at idxSet: IndexSet) {
        state = state.changing { mState in
            mState.dices.remove(atOffsets: idxSet)
        }
        saveData()
    }

    private func saveData() {
        do {
            let data = try JSONEncoder().encode(state)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }

    private func loadData() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(DiceState.self, from: data) {
                state = decoded
                return
            }
        }
    }
}

struct DiceState: Changeable, Codable {
    var dices: [Dice] = [Dice(sides: 6)]
    var history: [String] = []
}

struct Dice: Codable, Hashable, Changeable {
    let sides: Int
    var number: Int = 1
}
