//
//  AccessibilityNeeds.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/10/23.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct AccessibilityNeeds: View {
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var adwoColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            HStack {
                if adwoColor {
                    Image(systemName: "checkmark.circle")
                }
                Text("Success")
            }
            .padding()
            .background(adwoColor ? .black : .green)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Text("Hello, Reduce Motion")
                .scaleEffect(scale)
                .padding()
                .onTapGesture {
                    withOptionalAnimation {
                        scale *= 1.5
                    }
                }
            
            Text("Hello, Reduce Transparency")
                .padding()
                .background(reduceTransparency ? .black : .black.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(Capsule())
            
        }
    }
}

struct AccessibilityNeeds_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityNeeds()
    }
}
