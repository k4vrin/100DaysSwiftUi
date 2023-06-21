//
//  DataController.swift
//  CoreDataProject
//
//  Created by Mostafa Hosseini on 6/19/23.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let err = error {
                print("CoreData failed to load: \(err.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
