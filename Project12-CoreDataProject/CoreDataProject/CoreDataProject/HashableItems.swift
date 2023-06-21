//
//  HashableItem.swift
//  CoreDataProject
//
//  Created by Mostafa Hosseini on 6/19/23.
//

import SwiftUI

struct HashableItems : View {
    
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger"), Student(name: "Ronald Weasly")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}


struct HashableItems_Previews: PreviewProvider {
    static var previews: some View {
        HashableItems()
    }
}


struct Student: Hashable {
    let name: String
}
