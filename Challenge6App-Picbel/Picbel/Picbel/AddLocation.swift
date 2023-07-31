//
//  AddLocation.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/31/23.
//

import SwiftUI
import MapKit
import CoreData

struct AddLocation: View {
    @Environment(\.dismiss) var dismiss
    @State var tracking: MapUserTrackingMode = .follow
    @ObservedObject var managerDelegate: locationDelegate
    var moc: NSManagedObjectContext
    var picbel : PicbelEntity
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Map(
                    coordinateRegion: $managerDelegate.region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $tracking
                )
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
                            let location = PicLocation(context: moc)
                            location.latitude = (managerDelegate.location?.coordinate.latitude)!
                            location.longitude = (managerDelegate.location?.coordinate.longitude)!
                            picbel.location = location
                            print(location)
                            try! moc.save()
                            dismiss()
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
        }
    }
}
