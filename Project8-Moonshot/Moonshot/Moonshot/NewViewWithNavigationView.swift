//
//  NewViewWithNavigationView.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/15/23.
//

import SwiftUI

struct NewViewWithNavigationView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct NewViewWithNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NewViewWithNavigationView()
    }
}
