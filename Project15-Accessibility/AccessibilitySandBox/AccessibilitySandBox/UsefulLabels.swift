//
//  UsefulLabels.swift
//  AccessibilitySandBox
//
//  Created by Mostafa Hosseini on 7/22/23.
//

import SwiftUI

struct UsefulLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]

    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]

    @State private var selectedPictures = Int.random(in: 0...3)

    var body: some View {
        Image(pictures[selectedPictures])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPictures = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPictures])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
            .accessibilityHint("Change the picture")
    }
}

struct UsefulLabels_Previews: PreviewProvider {
    static var previews: some View {
        UsefulLabels()
    }
}
