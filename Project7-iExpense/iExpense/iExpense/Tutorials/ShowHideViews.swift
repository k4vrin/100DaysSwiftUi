//
//  ShowHideViews.swift
//  iExpense
//
//  Created by Mostafa Hosseini on 4/30/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ShowHideViews: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            Text("Show Sheet")
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Abbas")
        }
    }
}

struct ShowHideViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideViews()
    }
}
