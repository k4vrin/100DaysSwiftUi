//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Mostafa Hosseini on 6/19/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
