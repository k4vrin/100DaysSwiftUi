//
//  PropertyWrapperStruct.swift
//  InstaFilter
//
//  Created by Mostafa Hosseini on 7/4/23.
//

import SwiftUI

struct PropertyWrapperStruct: View {
    
    @State private var blurAmount = 0.0 {
        didSet {
            /// When the **State** struct change print blur amount. it will not work when the binding changes
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount, perform: { newValue in
                    print("New value is \(newValue)")
                })
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

struct PropertyWrapperStruct_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperStruct()
    }
}
