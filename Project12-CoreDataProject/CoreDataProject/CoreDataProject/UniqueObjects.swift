//
//  UniqueObjects.swift
//  CoreDataProject
//
//  Created by Mostafa Hosseini on 6/19/23.
//

import SwiftUI

struct UniqueObjects: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct UniqueObjects_Previews: PreviewProvider {
    static var previews: some View {
        UniqueObjects()
    }
}
