//
//  CoreDataWithSwiftUi.swift
//  Bookworm
//
//  Created by Mostafa Hosseini on 6/5/23.
//

import SwiftUI

struct CoreDataWithSwiftUi: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasly"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
            
        }
    }
}

struct CoreDataWithSwiftUi_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataWithSwiftUi()
    }
}
