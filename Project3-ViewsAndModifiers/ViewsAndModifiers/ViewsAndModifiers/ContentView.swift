//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mostafa Hosseini on 4/11/23.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { col in
                        content(row, col)
                    }
                }
            }
        }
    }
}

struct ContentView: View {

    var body: some View {
        GridStack(rows: 4, columns: 9) { row, col in
            Text("R\(row), C\(col)")
                .border(.black)
                .largeBlueStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
