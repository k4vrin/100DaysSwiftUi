//
//  DetailScreen.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/31/23.
//

import MapKit
import SwiftUI
import CoreData

struct DetailScreen: View {
    var picbel: PicbelEntity

    @State private var isPresented: Bool = false
    @StateObject var managerDelegate = locationDelegate()
        
    var moc: NSManagedObjectContext

    var body: some View {
        VStack {
            List {
                if let img = loadImg(picbel.img_id ?? "") {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFit()
                }

                Section {
                    Text(picbel.desc ?? "eerr")
                        .font(.body)
                }

                Section {
                    if let loc = picbel.location {
                        Map(
                            coordinateRegion: Binding(
                                get: {
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: loc.latitude, longitude: loc.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                                    )
                                },
                                set: { _ in
                                }
                            ),
                            annotationItems: [loc]
                        ) { a in
                            MapMarker(
                                coordinate: CLLocationCoordinate2D(latitude: a.latitude, longitude: a.longitude)
                            )
                        }
                    } else {
                        Text("Click to add location")
                            .foregroundColor(.blue)
                    }
                    

                }
                .frame(height: 100)
                .onTapGesture {
                    managerDelegate.locationManagerDidChangeAuthorization()
                    isPresented = true
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddLocation(
                managerDelegate: managerDelegate,
                moc: moc,
                picbel: picbel
            )
        }
        .navigationTitle(picbel.name ?? "")
    }
    
    func loadImg(_ imgId: String) -> UIImage? {
        do {
            let data = try Data(contentsOf: FileManager.documentsDirectory.appendingPathComponent(imgId))
            return UIImage(data: data)
        } catch {
            print("Error loading img")
            return nil
        }
    }
}
