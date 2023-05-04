//
//  UsingOnDelete.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

struct UsingOnDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }

                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }

    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct UsingOnDelete_Previews: PreviewProvider {
    static var previews: some View {
        UsingOnDelete()
    }
}
