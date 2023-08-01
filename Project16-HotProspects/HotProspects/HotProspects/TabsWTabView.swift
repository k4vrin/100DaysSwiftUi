//
//  TabsWTabView.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/1/23.
//

import SwiftUI

struct TabsWTabView: View {
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct TabsWTabView_Previews: PreviewProvider {
    static var previews: some View {
        TabsWTabView()
    }
}
