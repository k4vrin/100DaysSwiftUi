//
//  GroupsAsLayout.swift
//  SnowSeeker
//
//  Created by Mostafa Hosseini on 8/23/23.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupsAsLayout: View {
    @State private var layoutVert = false
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
//        Group {
//            if layoutVert {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        .onTapGesture {
//            layoutVert.toggle()
//        }
        
        if sizeClass == .compact {
            VStack {
                UserView()
            }
        } else {
            HStack {
                UserView()
            }
        }
    }
}

struct GroupsAsLayout_Previews: PreviewProvider {
    static var previews: some View {
        GroupsAsLayout()
    }
}
