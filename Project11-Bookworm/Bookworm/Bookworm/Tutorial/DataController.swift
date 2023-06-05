//
//  DataController.swift
//  Bookworm
//
//  Created by Mostafa Hosseini on 6/5/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
            
            
        }
    }
}
