//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Mostafa Hosseini on 8/23/23.
//

import SwiftUI

enum ResortSortOrder {
    case none, alphabetical, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    @StateObject var favorites = Favorites()

    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    @State private var searchText = ""
    @State private var sortOrder = ResortSortOrder.none

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(sortedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }

                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorites resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Menu {
                    Button {
                        sortOrder = .none
                    } label: {
                        Text("none")
                        if sortOrder == .none {
                            Image(systemName: "checkmark.circle")
                        }
                    }
                    Button {
                        sortOrder = .alphabetical
                    } label: {
                        Text("alphabetical")
                        if sortOrder == .alphabetical {
                            Image(systemName: "checkmark.circle")
                        }
                    }
                    Button {
                        sortOrder = .country
                    } label: {
                        Text("country")
                        if sortOrder == .country {
                            Image(systemName: "checkmark.circle")
                        }
                    }
                } label: {
                    Label("Sort List", systemImage: "lineweight")
                }
            }

        } detail: {
            WelcomeView()
        }
        .navigationSplitViewStyle(.automatic)
        .environmentObject(favorites)
    }

    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts
                .filter { $0.name.localizedStandardContains(searchText)}
        }
    }
    var sortedResorts: [Resort] {
        filteredResorts.sorted { resort1, resort2 in
            switch sortOrder {
            case .none:
                return false
            case .alphabetical:
                return resort1.name < resort2.name
            case .country:
                return resort1.country < resort2.country
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@ViewBuilder func phoneOnlyNavView<Sidebar: View, Detail: View>(columnVisibility: Binding<NavigationSplitViewVisibility>, @ViewBuilder sidebar: () -> Sidebar, @ViewBuilder detail: () -> Detail) -> some View {
    if UIDevice.current.userInterfaceIdiom == .phone {
        NavigationStack(root: sidebar)
    } else {
        NavigationSplitView(columnVisibility: columnVisibility, sidebar: sidebar, detail: detail)
    }
}
