//
//  ConfirmationDialogAlert.swift
//  InstaFilter
//
//  Created by Mostafa Hosseini on 7/4/23.
//

import SwiftUI

struct ConfirmationDialogAlert: View {
    
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog(
                "Change background",
                isPresented: $showingConfirmation
            ) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Cancel", role: .cancel) {  }
            } message: {
                Text("Select a new color")
            }
            
    }
}

struct ConfirmationDialogAlert_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogAlert()
    }
}
