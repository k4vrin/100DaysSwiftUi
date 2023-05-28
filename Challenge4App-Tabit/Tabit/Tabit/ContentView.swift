//
//  ContentView.swift
//  Tabit
//
//  Created by Mostafa Hosseini on 5/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MainViewModel()
    @State var showingAddHabit = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.activities) { act in
                    NavigationLink(destination: {
                        HabitView(act: act, viewModel: viewModel)
                    }, label: {
                        VStack(alignment: .leading) {
                            Text(act.title)
                                .font(.headline)
                            Text(act.description)
                        }
                    })
                }
                .onDelete(perform: { indexSet in
                    let ids = indexSet.map {
                        viewModel.activities[$0].id
                    }
                    ids.forEach { id in
                        viewModel.removeActivity(id: id)
                    }
                })
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Tabit")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(viewModel: viewModel)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
