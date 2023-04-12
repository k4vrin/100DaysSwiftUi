//
//  ContentView.swift
//  WeSplit
//
//  Created by Mostafa Hosseini on 4/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double? = nil
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentages = 0 ... 100
    let currency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    var totalPayment: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount ?? 0) * (tipSelection / 100)
        let grandTotal = (checkAmount ?? 0) + tipValue
        return grandTotal
    }

    var paymentPerPerson: Double {
        totalPayment / Double(numberOfPeople)
    }

    var body: some View {
        NavigationView {
            Form {
                // Amount and people
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: currency
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)

                    Picker(
                        "Number of people",
                        selection: $numberOfPeople
                    ) {
                        ForEach(2 ..< 100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                }

                // Tip
                Section {
                    Picker(
                        "Tip percentage",
                        selection: $tipPercentage
                    ) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }

                // Total payment
                Section {
                    Text(
                        totalPayment,
                        format: currency
                    )
                    .foregroundColor(tipPercentage == 0 ? .red : .black)
                } header: {
                    Text("Total Amount")
                }

                // Final payment
                Section {
                    Text(
                        paymentPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD")
                    )
                } header: {
                    Text("Amount Per Person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
