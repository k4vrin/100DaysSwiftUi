//
//  EnvironmentObjectReading.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/1/23.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}


struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentObjectReading: View {
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct EnvironmentObjectReading_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectReading()
    }
}
