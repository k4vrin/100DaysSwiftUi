//
//  EditView.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/16/23.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    @ObservedObject private var viewModel: ViewModel
    
    
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        viewModel = ViewModel()
        self.onSave = onSave
        viewModel.updateLocation(location)
        viewModel.updateName(location.name)
        viewModel.updateDesc(location.description)
        viewModel.fetchNearbyPlaces()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Place name",
                        text: Binding(
                            get: {viewModel.state.name},
                            set: { value, _ in
                                viewModel.updateName(value)
                            }
                        )
                    )
                    TextField(
                        "Description",
                        text: Binding(
                            get: {viewModel.state.desc},
                            set: { value, _ in
                                viewModel.updateDesc(value)
                            }
                        )
                    )
                }
                
                Section("Nearby…") {
                    switch viewModel.state.loadingState {
                    case .loading:
                        Text("Loading")
                    case .success:
                        ForEach(viewModel.state.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later")
                    }
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    if var newLocation = viewModel.state.location {
                        newLocation.id = UUID()
                        newLocation.name = viewModel.state.name
                        newLocation.description = viewModel.state.desc
                        onSave(newLocation)
                        
                        dismiss()
                    }
                    
                }
            }
            
        }
    }
    
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { _ in }
    }
}
