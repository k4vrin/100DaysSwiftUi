//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mostafa Hosseini on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $viewModel.state.order.type) {
                        ForEach(ViewModel.types.indices) {
                            Text(ViewModel.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(viewModel.state.order.quantity)", value: $viewModel.state.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $viewModel.state.specialRequestEnable.animation())
                    
                    if viewModel.state.specialRequestEnable {
                        Toggle("Add extra frosting", isOn: $viewModel.state.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $viewModel.state.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(viewModel: viewModel)
                    } label : {
                        Text("Delivery detail")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
