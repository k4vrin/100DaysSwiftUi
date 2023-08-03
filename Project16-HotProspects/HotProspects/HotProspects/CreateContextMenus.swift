//
//  CreateContextMenus.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/3/23.
//

import SwiftUI

struct CreateContextMenus: View {
    
    @State private var bgColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello World!")
                .padding()
                .background(bgColor)
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(role: .destructive) {
                        bgColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
                    }
                    Button("Green") {
                        bgColor = .green
                    }
                    Button("Blue") {
                        bgColor = .blue
                    }
                }
        }
    }
}

struct CreateContextMenus_Previews: PreviewProvider {
    static var previews: some View {
        CreateContextMenus()
    }
}
