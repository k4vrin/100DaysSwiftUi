//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Mostafa Hosseini on 5/25/23.
//

import SwiftUI

struct SpecialEffects: View {
    
    @State private var amount = 0.0
    
    var body: some View {
//        ZStack {
//            Image("paul")
//                .colorMultiply(.red)
//
//            Rectangle()
//                .fill(.red)
//                .blendMode(.multiply)
//        }
        
        
        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//
//            }
//            .frame(width: 300, height: 300)
            
            Image("paul")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
    
    
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}
