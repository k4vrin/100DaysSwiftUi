//
//  MissionCrewList.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/21/23.
//

import SwiftUI

struct MissionCrewList: View {
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        // Stroke border draws the stroke inside the layout, stroke draw half in and half out
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)

                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                        .accessibilityElement()
                        .accessibilityLabel(crewMember.astronaut.name)
                        .accessibilityHint(crewMember.role)
                    }
                }
            }
        }
    }
}

struct MissionCrewList_Previews: PreviewProvider {
    static var previews: some View {
        MissionCrewList(
            crew: [CrewMember(role: "Engineer", astronaut: Astronaut(id: "swigert", name: "John L. Swigert, Jr.", description: ""))]
        )
    }
}
