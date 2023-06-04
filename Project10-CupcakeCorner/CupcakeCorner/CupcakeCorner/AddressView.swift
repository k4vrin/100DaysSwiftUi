//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Mostafa Hosseini on 6/1/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var viewModel: ViewModel
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $viewModel.state.order.name)
                TextField("Street address", text: $viewModel.state.order.streetAddress)
                TextField("City", text: $viewModel.state.order.city)
                TextField("Zip", text: $viewModel.state.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(viewModel: viewModel)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(!viewModel.state.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        
            AddressView(viewModel: ViewModel())
        }
    }
}
