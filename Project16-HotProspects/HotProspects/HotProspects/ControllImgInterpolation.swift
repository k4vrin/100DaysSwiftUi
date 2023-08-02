//
//  ControllImgInterpolation.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/2/23.
//

import SwiftUI

struct ControllImgInterpolation: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ControllImgInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ControllImgInterpolation()
    }
}
