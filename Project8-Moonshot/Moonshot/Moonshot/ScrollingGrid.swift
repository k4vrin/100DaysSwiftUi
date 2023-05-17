//
//  ScrollingGrid.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/15/23.
//

import SwiftUI

struct ScrollingGrid: View {
    
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
    
    let layout = [
        // make each one of our columns at least 80 but if you can squeeze more col in
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ScrollingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGrid()
    }
}
