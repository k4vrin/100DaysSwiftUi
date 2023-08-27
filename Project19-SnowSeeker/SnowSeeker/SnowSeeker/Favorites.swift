//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Mostafa Hosseini on 8/27/23.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    static let saveKey = "Favorites"
    let savePath = FileManager.documentsDirectory.appendingPathComponent(saveKey)

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let res = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = res
                return
            }
        }
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
}
