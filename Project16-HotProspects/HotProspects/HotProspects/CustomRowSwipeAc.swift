//
//  CustomRowSwipeAc.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/3/23.
//

import SwiftUI

struct CustomRowSwipeAc: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Delete")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button(role: .destructive) {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct CustomRowSwipeAc_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowSwipeAc()
    }
}
