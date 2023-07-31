//
//  LocationDelegate.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/31/23.
//

import Foundation
import MapKit

class locationDelegate: NSObject,ObservableObject,CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    var hasSetRegion = false
    
    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
    
    override init() {
        super.init()
        manager.delegate = self
    }

    // Checking authorization status...

    func locationManagerDidChangeAuthorization() {

        if manager.authorizationStatus == .authorizedWhenInUse{
            print("Authorized")
            manager.startUpdatingLocation()
        } else {
            print("not authorized")
            manager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.last {

            self.location = location

            if hasSetRegion == false{
                region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
                hasSetRegion = true
            }
        }
    }
}
