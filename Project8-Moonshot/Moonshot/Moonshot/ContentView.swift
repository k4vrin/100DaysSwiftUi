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
//    let columns = [
//        GridItem(.adaptive(minimum: 150))
//    ]
    @State private var showGrid = true
    var columns: [GridItem] {
        [
            GridItem(.adaptive(minimum: showGrid ? 150 : .infinity))
        ]
    }

    // shift + command + a -> light/dark toggle
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
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
            .toolbar {
                ToolbarItem {
                    Button {
                        showGrid.toggle()
                    } label: {
                        Image(showGrid ? "ic_list" : "ic_grid")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .animation(.default, value: showGrid)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
