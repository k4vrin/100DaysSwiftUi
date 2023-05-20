//
//  Scro;lViewWithScrollingData.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/15/23.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText \(text)")
        self.text = text
    }
}

struct ScrollViewWithScrollingData: View {
    var body: some View {
        ScrollView {
            // Lazy become full size by default
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewWithScrollingData_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewWithScrollingData()
    }
}
