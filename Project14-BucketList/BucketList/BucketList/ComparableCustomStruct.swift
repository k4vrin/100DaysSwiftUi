//
//  ComparableCustomStruct.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/12/23.
//

import SwiftUI

struct ComparableCustomStruct: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ComparableCustomStruct_Previews: PreviewProvider {
    static var previews: some View {
        ComparableCustomStruct()
    }
}
struct User: Identifiable, Comparable {
    
    // less than operator. lsh: left hand side
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}
