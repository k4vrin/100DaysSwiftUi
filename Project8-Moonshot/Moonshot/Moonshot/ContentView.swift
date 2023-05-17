//
//  ContentView.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/14/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // adaptive: squeeze as many as possible columns to
    // fit the the screen with respect to minimum size
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    // shift + command + a -> light/dark toggle
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail View")
                        } label: {
                            MissionItem(
                                image: mission.image,
                                missionName: mission.displayName,
                                missionDate: mission.formattedLaunchDate
                            )
                            
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
