//
//  StateObject.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

class User : ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}


struct StateObjectTut: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
    }
}

struct StateObject_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectTut()
    }
}
