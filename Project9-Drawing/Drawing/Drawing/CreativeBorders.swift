//
//  CreativeBorders.swift
//  Drawing
//
//  Created by Mostafa Hosseini on 5/23/23.
//

import SwiftUI

struct CreativeBorders: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Capsule()
            .strokeBorder(ImagePaint(image: Image("example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), lineWidth: 20)
            .frame(width: 300, height: 200)
//            .border(ImagePaint(image: Image("example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), width: 50)
        
    }
}

struct CreativeBorders_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorders()
    }
}
