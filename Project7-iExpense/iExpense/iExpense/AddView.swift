//
//  AddView.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 5/4/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = ExpenseType.Business
    @State private var amount: Double? = nil
    @Environment(\.dismiss) var dismiss
    
    let types = [ExpenseType.Business, ExpenseType.Personal]
    
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0.description)
                    }
                }
                
                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(code: "USD")
                )
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount ?? 0.0)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
