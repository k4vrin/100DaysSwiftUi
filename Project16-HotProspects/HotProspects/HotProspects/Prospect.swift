//
//  Prospect.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/5/23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isConected = false
}

@MainActor
class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedProspects")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        people = []
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }

    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }

    func toggle(_ prospect: Prospect) {
        // It's important to call this before the actual change
        objectWillChange.send()
        prospect.isConected.toggle()
        save()
    }
}

// @MainActor
// class Prospects: ObservableObject {
//    @Published private(set) var people: [Prospect]
//    let saveKey = "SavedData"
//
//    init() {
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
//        people = []
//    }
//
//    private func save() {
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
//        }
//    }
//
//    func add(_ prospect: Prospect) {
//        people.append(prospect)
//        save()
//    }
//
//    func toggle(_ prospect: Prospect) {
//        // It's important to call this before the actual change
//        objectWillChange.send()
//        prospect.isConected.toggle()
//        save()
//    }
// }
