//
//  StateInStruct.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

struct StateInStruct: View {
    
    @State private var user = User2()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
    }
}

struct StateInStruct_Previews: PreviewProvider {
    static var previews: some View {
        StateInStruct()
    }
}

class User2 {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}
