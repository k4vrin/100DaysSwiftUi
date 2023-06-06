//
//  DataManager.swift
//  Bookworm
//
//  Created by Mostafa Hosseini on 6/6/23.
//

import Foundation
import CoreData

class DataManager: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm2")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
            
            
        }
    }
}
