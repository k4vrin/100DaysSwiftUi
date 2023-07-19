//
//  ContentView.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/12/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        if viewModel.state.isUnlocked {
            ZStack {
                Map(
                    coordinateRegion: Binding(
                        get: { viewModel.state.mapRegion },
                        set: { mapR, _ in viewModel.updateMapRegion(mapR) }
                    ),
                    annotationItems: viewModel.state.locations
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
                            viewModel.updateSelectedPlace(location)
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
                            self.viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .background(.black.opacity(0.75))
                                .foregroundColor(.white)
                                .font(.title)
                                .clipShape(Circle())
                                .padding(.trailing)
                        }
                    }
                }
            }
            .sheet(
                item: Binding(
                    get: { viewModel.state.selectedPlace },
                    set: { loc, _ in viewModel.updateSelectedPlace(loc) }
                )
            ) { place in
                EditView(location: place) { newLocation in
                    self.viewModel.updateLocation(newLocation: newLocation, oldLocation: place)
                }
            }
        } else {
            Button("Unlock Places") {
                viewModel.authenticate()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .alert(
                "Authentication Error",
                isPresented: Binding(
                    get: {viewModel.state.showAlert},
                    set: {value, _ in}
                ),
                actions: {
                    Button("Ok") {}
                },
                message: {
                    if let err = viewModel.state.authError {
                        Text(err)
                    }
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
