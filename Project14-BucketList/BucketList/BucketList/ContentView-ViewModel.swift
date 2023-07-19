//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/18/23.
//

import Foundation
import LocalAuthentication
import MapKit

extension ContentView {
    /** **MainActor** is responsible for run all user interface updates
     and adding it here means we want to all of the code here
     run on main actor unless specified otherwise. */
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var state = ContentState()
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                let locations = try JSONDecoder().decode([Location].self, from: data)
                state = state.changing {
                    $0.locations = locations
                }
            } catch {
                state = state.changing {
                    $0.locations = []
                }
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(state.locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func updateMapRegion(_ mapRegion: MKCoordinateRegion) {
            Task { @MainActor in
                state = state.changing {
                    $0.mapRegion = mapRegion
                }
            }
        }
        
        func updateSelectedPlace(_ location: Location?) {
            state = state.changing {
                $0.selectedPlace = location
            }
        }
        
        func updateLocation(newLocation: Location, oldLocation: Location) {
            state = state.changing {
                if let index = state.locations.firstIndex(of: oldLocation) {
                    $0.locations[index] = newLocation
                }
            }
            save()
        }
        
        func addLocation() {
            let newLocation = Location(
                id: UUID(),
                name: "New Location",
                description: "",
                latitude: state.mapRegion.center.latitude,
                longitude: state.mapRegion.center.longitude
            )
            state = state.changing {
                $0.locations.append(newLocation)
            }
            save()
        }
        
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, err in
                    if success {
                        Task { @MainActor in
                            self.state = self.state.changing {
                                $0.isUnlocked = true
                                $0.showAlert = false
                            }
                        }
                    } else {
                        Task { @MainActor in
                            self.state = self.state.changing {
                                $0.authError = err?.localizedDescription
                                $0.showAlert = true
                            }
                        }
                    }
                }
            } else {
                self.state = self.state.changing {
                    $0.authError = "Biometrics authentication is not enrolled"
                    $0.showAlert = true
                }
                
            }
        }
    }
}

struct ContentState: Changeable {
    
    var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 50,
            longitude: 0
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 25,
            longitudeDelta: 25
        )
    )
    var locations: [Location] = []
    var selectedPlace: Location? = nil
    var isUnlocked: Bool = false
    var authError: String? = nil
    var showAlert: Bool = false
}

protocol Changeable {}
extension Changeable {
    func changing(change: (inout Self) -> Void) -> Self {
        var a = self
        change(&a)
        return a
    }
}
