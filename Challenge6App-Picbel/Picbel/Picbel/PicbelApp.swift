//
//  PicbelApp.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/25/23.
//

import SwiftUI

@main
struct PicbelApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
        }
    }
}
