//
//  DataController.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/30/23.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "PicbelDataModel")
    
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
