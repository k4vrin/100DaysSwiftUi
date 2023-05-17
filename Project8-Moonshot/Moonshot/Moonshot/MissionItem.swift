//
//  MissionItem.swift
//  Moonshot
//
//  Created by Mostafa Hosseini on 5/17/23.
//

import SwiftUI

struct MissionItem: View {
    let image: String
    let missionName: String
    let missionDate: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(missionName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(missionDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

struct MissionItem_Previews: PreviewProvider {
    static var previews: some View {
        MissionItem(
            image: "apollo1", missionName: "Apollo", missionDate: "N/A"
        )
    }
}
