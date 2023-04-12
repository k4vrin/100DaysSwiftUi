//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Mostafa Hosseini on 4/12/23.
//

import SwiftUI

struct FlagImage: View {
    let image: String
    init(_ image: String) {
        self.image = image
    }
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage("US")
    }
}
