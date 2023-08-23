//
//  AlertAndSheet.swift
//  SnowSeeker
//
//  Created by Mostafa Hosseini on 8/23/23.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertAndSheet: View {
    @State private var selectedUser: User?
    @State private var isShowingUser = false

    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
//            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//                Button(user.id) {}
//            }
            .alert("Welcome", isPresented: $isShowingUser) {}
    }
}

struct AlertAndSheet_Previews: PreviewProvider {
    static var previews: some View {
        AlertAndSheet()
    }
}
