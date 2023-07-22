//
//  HideAndGroupAcceData.swift
//  AccessibilitySandBox
//
//  Created by Mostafa Hosseini on 7/22/23.
//

import SwiftUI

struct HideAndGroupAcceData: View {
    var body: some View {
//        Image(decorative: "character")
//            .accessibilityHidden(true)
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 10000")
    }
}

struct HideAndGroupAcceData_Previews: PreviewProvider {
    static var previews: some View {
        HideAndGroupAcceData()
    }
}
