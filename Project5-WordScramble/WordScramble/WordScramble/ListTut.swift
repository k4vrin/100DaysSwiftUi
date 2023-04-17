//
//  ListTut.swift
//  WordScramble
//
//  Created by Mostafa Hosseini on 4/17/23.
//

import SwiftUI

struct ListTut: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List(people, id: \.self) {
            Text("Dynamic row \($0)")
//            Section("Section 1") {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section("Section 2") {
//                ForEach(0..<5) { ind in
//                    Text("Dynamic row \(ind)")
//                }
//            }
//
//            Section("Section 3") {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
            
        }
        .listStyle(.grouped)
    }
}

struct ListTut_Previews: PreviewProvider {
    static var previews: some View {
        ListTut()
    }
}
