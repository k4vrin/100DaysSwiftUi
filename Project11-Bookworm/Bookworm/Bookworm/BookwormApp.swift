//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Mostafa Hosseini on 6/5/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // managedObjectContext: your live version of data
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
