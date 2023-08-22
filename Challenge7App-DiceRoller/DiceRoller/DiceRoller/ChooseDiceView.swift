//
//  ChooseDiceView.swift
//  DiceRoller
//
//  Created by Mostafa Hosseini on 8/21/23.
//

import SwiftUI

struct ChooseDiceView: View {
    @ObservedObject var viewModel: DiceViewModel

    @State private var sides = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    @FocusState private var focusedField: Bool 

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Sides", text: $sides)
                        .keyboardType(.numberPad)
                        .submitLabel(.done)
                        .focused($focusedField)
                    Button("Add Dice") {
                        if let sids = Int(self.sides) {
                            guard sids >= 4 else {
                                showingAlert = true
                                alertMessage = "Dice sides should be at least 4"
                                return
                            }
                            guard sids.isMultiple(of: 2) else {
                                showingAlert = true
                                alertMessage = "Dice sides should be even"
                                return
                            }
                            viewModel.addDice(Dice(sides: sids))
                            sides = ""
                        }
                    }
                    .alert("Can't Add Dice", isPresented: $showingAlert) {
                        Button("OK", role: .none) {}
                    } message: {
                        Text(alertMessage)
                    }
                }

                Section {
                    ForEach(0 ..< viewModel.state.dices.count, id: \.self) { idx in
                        HStack {
                            Image(systemName: "\(idx + 1).circle")
                            Text("\(viewModel.state.dices[idx].sides) sided")
                        }
                        .accessibilityElement()
                        .accessibilityLabel("Dice NO\(idx + 1), \(viewModel.state.dices[idx].sides) sided")
                    }
                    .onDelete { idxSet in
                        viewModel.removeDice(at: idxSet)
                    }
                } header: {
                    Text("Dices")
                }
            }
            .navigationTitle("Edit Dice")
            .toolbar {
                ToolbarItem {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }

                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        focusedField = false
                    }
                }
            }
        }
    }
}

struct ChooseDiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseDiceView(viewModel: DiceViewModel())
    }
}
