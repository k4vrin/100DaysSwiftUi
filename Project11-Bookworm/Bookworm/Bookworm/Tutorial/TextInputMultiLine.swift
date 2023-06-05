//
//  TextInputMultiLine.swift
//  Bookworm
//
//  Created by Mostafa Hosseini on 6/5/23.
//

import SwiftUI

struct TextInputMultiLine: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TextInputMultiLine_Previews: PreviewProvider {
    static var previews: some View {
        TextInputMultiLine()
    }
}
