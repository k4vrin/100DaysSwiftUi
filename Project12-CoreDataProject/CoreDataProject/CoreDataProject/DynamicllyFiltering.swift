//
//  DynamicllyFiltering.swift
//  CoreDataProject
//
//  Created by Mostafa Hosseini on 6/21/23.
//

import SwiftUI

struct DynamicllyFiltering: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(sortDesc: [], filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Example") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct DynamicllyFiltering_Previews: PreviewProvider {
    static var previews: some View {
        DynamicllyFiltering()
    }
}
