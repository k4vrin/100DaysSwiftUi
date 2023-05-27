//
//  ColorCyclingRectangle.swift
//  Drawing
//
//  Created by Mostafa Hosseini on 5/27/23.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    
    var amount = 0.0
    var steps = 100
    var gradientStartX = 0.5
    var gradientStartY = 0.0
    var gradientEndX = 0.5
    var gradientEndY = 1.0
    
    
    var body: some View {
        ZStack {
            ForEach(0 ..< steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    color(for: value, brightness: 1),
                                    color(for: value, brightness: 0.5)
                                ]
                            ),
                            startPoint: UnitPoint(x: gradientStartX, y: gradientStartY),
                            endPoint: UnitPoint(x: gradientEndX, y: gradientEndY)
                        ),
                        
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingRectangleChallenge: View {
    @State private var colorCycle = 0.0
    @State var gradientStartX = 0.5
    @State var gradientStartY = 0.0
    @State var gradientEndX = 0.5
    @State var gradientEndY = 1.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(
                amount: colorCycle,
                gradientStartX: gradientStartX,
                gradientStartY: gradientStartY,
                gradientEndX: gradientEndX,
                gradientEndY: gradientEndY
            )
                .frame(width: 150, height: 150)
            
            VStack {
                Text("Color Cycle")
                Slider(value: $colorCycle)
            }
            .padding()
            .padding(.top)
            
            VStack {
                Text("Gradient start x")
                Slider(value: $gradientStartX)
            }
            .padding()
            .padding(.top)
            
            VStack {
                Text("Gradient start y")
                Slider(value: $gradientStartY)
            }
            .padding()
            .padding(.top)
            
            VStack {
                Text("Gradient end x")
                Slider(value: $gradientEndX)
            }
            .padding()
            .padding(.top)
            
            VStack {
                Text("Gradient end y")
                Slider(value: $gradientEndY)
            }
            .padding()
            .padding(.top)
        }
    }
}

struct ColorCyclingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingRectangleChallenge()
    }
}
