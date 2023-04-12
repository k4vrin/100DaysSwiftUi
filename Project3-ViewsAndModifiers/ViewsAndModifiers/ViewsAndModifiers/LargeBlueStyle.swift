//
//  LargeBlueStyle.swift
//  ViewsAndModifiers
//
//  Created by Mostafa Hosseini on 4/12/23.
//

import SwiftUI

struct LargeBlueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueStyle() -> some View {
        modifier(LargeBlueStyle())
    }
}
