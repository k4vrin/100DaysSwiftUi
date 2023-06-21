//
//  ConditionalSaving.swift
//  CoreDataProject
//
//  Created by Mostafa Hosseini on 6/19/23.
//

import SwiftUI

struct ConditionalSaving: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

struct ConditionalSaving_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSaving()
    }
}
