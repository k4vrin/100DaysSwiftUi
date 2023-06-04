//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Mostafa Hosseini on 6/1/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var showAlertMessage = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                    scale: 3
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()

                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total is \(viewModel.state.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {
                    Task {
                        await placeOrder()
                    }
                })
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertTitle, isPresented: $showAlertMessage) {
            Button("Ok") {}
        } message: {
            Text(alertMessage)
        }
    }
    
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(viewModel.state.order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            alertTitle = "Thank you"
            alertMessage = "Your order for \(decodedOrder.quantity)x\(ViewModel.types[decodedOrder.type].lowercased()) cupcake is on it's way!"
            
            showAlertMessage = true
        } catch {
            print("Checkout failed. error: \(error)")
            alertTitle = "Error!"
            alertMessage = error.localizedDescription
            showAlertMessage = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: ViewModel())
    }
}
