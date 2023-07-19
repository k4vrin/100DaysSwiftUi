//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/19/23.
//

import Foundation


extension EditView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var state = EditState()
        
        func updateName(_ name: String) {
            state = state.changing { mState in
                mState.name = name
            }
        }
        
        func updateDesc(_ desc: String) {
            state = state.changing { mState in
                mState.desc = desc
            }
        }
        
        func updateLocation(_ loc: Location) {
            state = state.changing { mState in
                mState.location = loc
            }
        }
        
        func fetchNearbyPlaces() {
            guard let location = state.location else {return}
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL \(urlString)")
                return
            }
            
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let items = try JSONDecoder().decode(Result.self, from: data)
                    self.state = self.state.changing { mState in
                        mState.pages = items.query.pages.values.sorted()
                        mState.loadingState = .success
                    }
                } catch {
                    print("Failed network call: \(error.localizedDescription)")
                    self.state = self.state.changing { mState in
                        mState.loadingState = .failed
                    }
                    
                }
            }

        }
    }
}

struct EditState: Changeable {
    var location: Location? = nil
    var name: String = ""
    var desc: String = ""
    var loadingState = LoadingState.loading
    var pages = [Page]()
}
