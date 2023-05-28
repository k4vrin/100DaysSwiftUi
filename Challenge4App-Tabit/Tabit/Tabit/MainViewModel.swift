//
//  MainViewModel.swift
//  Tabit
//
//  Created by Mostafa Hosseini on 5/28/23.
//

import Foundation

@MainActor
class MainViewModel : ObservableObject {
    @Published private(set) var activities = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        let decoder = JSONDecoder()
        
        if let data = UserDefaults.standard.data(forKey: "activities") {
            if let decoded = try? decoder.decode([Activity].self, from: data) {
                self.activities = decoded
                return
            }
        }
        self.activities = []
    }
    
    func addActivity(activity: Activity) {
        activities.append(activity)
    }
    
    func removeActivity(id: UUID) {
        guard let index = activities.firstIndex(where: { act in act.id == id }) else { return }
        activities.remove(at: index)
    }
    
    func addOneDay(id: UUID) {
        guard let index = activities.firstIndex(where: { act in act.id == id }) else { return }
        let oldAct = activities[index]
        activities[index] = Activity(id: oldAct.id, title: oldAct.title, description: oldAct.description, trackedDays: oldAct.trackedDays + 1)
    }
}

struct Activity: Codable, Identifiable, Equatable {
    var id: UUID = UUID()
    let title: String
    let description: String
    let trackedDays: Int
}
