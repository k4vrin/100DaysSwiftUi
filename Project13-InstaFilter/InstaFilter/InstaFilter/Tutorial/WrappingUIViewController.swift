//
//  WrappingUIViewController.swift
//  InstaFilter
//
//  Created by Mostafa Hosseini on 7/5/23.
//

import SwiftUI

struct WrappingUIViewController: View {
    
    @State private var image: Image?
    @State private var showImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showImagePicker = true
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker()
        }
    }
}

struct WrappingUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrappingUIViewController()
    }
}
