//
//  ContentView.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/12/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 50,
            longitude: 0
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 25,
            longitudeDelta: 25
        )
    )
    
    @State private var locations: [Location] = []
    
    @State private var selectedPlace: Location?
    
    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $mapRegion,
                annotationItems: locations
            ) { location in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: location.latitude,
                        longitude: location.longitude
                    )
                ) {
                    VStack {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            // 44*44 -> Apple suggestion for a interactive component minimum size
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())
                        
                        Text(location.name)
                            .font(.footnote)
                            .fixedSize()
                    }
                    .onTapGesture {
                        selectedPlace = location
                    }
                }
                
            }
            .ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        let newLocation = Location(
                            id: UUID(),
                            name: "New Location",
                            description: "",
                            latitude: mapRegion.center.latitude,
                            longitude: mapRegion.center.longitude
                        )
                        locations.append(newLocation)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .sheet(item: $selectedPlace) { place in
            EditView(location: place) { newLocation in
                if let index = locations.firstIndex(of: place) {
                    locations[index] = newLocation
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
