//
//  ContentView.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let currency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    let businessItems = expenses.items.filter { item in
                        item.type == .Business
                    }
                    ForEach(businessItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type.description)
                            }
                            Spacer()
                            
                            Text(item.amount, format: currency)
                                .foregroundColor(getAmountColor(of: item.amount))
                        }
                        .accessibilityElement()
                        .accessibilityLabel("Item \(item.name), amount \(item.amount.formatted(.currency(code: "USD")))")
                        .accessibilityHint("Type: Business")
                    }
                    .onDelete(perform: { indexSet in
                        var ids = indexSet.map {
                            businessItems[$0].id
                        }
                        removeItems(at: ids)
                    })
                } header: {
                    Text("Business")
                        .font(.headline)
                }
                
                Section {
                    let personalItems = expenses.items.filter { item in
                        item.type == .Personal
                    }
                    ForEach(personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type.description)
                            }
                            Spacer()
                            
                            Text(item.amount, format: currency)
                                .foregroundColor(getAmountColor(of: item.amount))
                        }
                        .accessibilityElement()
                        .accessibilityLabel("Item \(item.name), amount \(item.amount.formatted(.currency(code: "USD")))")
                        .accessibilityHint("Type: Personal")
                    }
                    .onDelete(perform: { indexSet in
                        var ids = indexSet.map {
                            personalItems[$0].id
                        }
                        removeItems(at: ids)
                    })
                } header: {
                    Text("Personal")
                        .font(.headline)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(
                    expenses: expenses
                )
            }
        }
    }
    
    func getAmountColor(of amount: Double) -> Color {
        if amount > 100 {
            return Color.red
        } else if amount > 10 {
            return Color.orange
        } else {
            return Color.green
        }
    }
    
    func removeItems(at ids: [UUID]) {
        ids.forEach { id in
            expenses.items.removeAll(where: { item in
                item.id == id
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
