//
//  AddHabitView.swift
//  Tabit
//
//  Created by Mostafa Hosseini on 5/28/23.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var viewModel: MainViewModel
    @State private var title = ""
    @State private var desc = ""
    @State private var showNameError = false
    @State private var showDescError = false
    @State private var nameError = ""
    @State private var descError = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $title)
                } header: {
                    Text("Habit Name")
                        .font(.headline)
                } footer: {
                    if showNameError {
                        Text(nameError)
                            .foregroundColor(.red)
                    }
                }
                
                Section {
                    TextField("Description", text: $desc)
                } header: {
                    Text("Habit Description")
                        .font(.headline)
                } footer: {
                    if showDescError {
                        Text(descError)
                            .foregroundColor(.red)
                    }
                }
                
            }
            .toolbar {
                Button {
                    if title.isEmpty {
                        nameError = "Name can't be empty"
                        showNameError = true
                        return
                    }
                    
                    if desc.isEmpty {
                        descError = "Description can't be empty"
                        showDescError = true
                        return
                    }
                    
                    showDescError = false
                    showNameError = false
                    
                    viewModel.addActivity(activity: Activity( title: title, description: desc, trackedDays: 0))
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
            .animation(.default, value: showNameError)
            .animation(.default, value: showDescError)
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(viewModel: MainViewModel())
    }
}
