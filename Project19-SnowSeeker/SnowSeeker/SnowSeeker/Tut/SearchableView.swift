//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by Mostafa Hosseini on 8/23/23.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]

    var body: some View {
        NavigationView {
            List(filtereNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something?")
            .navigationTitle("Searching")
        }
    }

    var filtereNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.localizedStandardContains(searchText) }
        }
    }
}

struct SearchableView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableView()
    }
}
