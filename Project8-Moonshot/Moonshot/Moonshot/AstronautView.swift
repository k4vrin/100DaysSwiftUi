//
//  AstronautView.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/20/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                    
                    Text(astronaut.description)
                        .padding()

                }
                .padding(.bottom)
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}
