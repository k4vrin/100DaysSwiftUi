//
//  IntegratingCoreImage.swift
//  InstaFilter
//
//  Created by Mostafa Hosseini on 7/5/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct IntegratingCoreImage: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount*200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount*10, forKey: kCIInputScaleKey)
        }
        
//        currentFilter.radius = 1000
//        currentFilter.center = CGPoint(x: inputImage.size.width/2, y: inputImage.size.height/2)
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct IntegratingCoreImage_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingCoreImage()
    }
}
