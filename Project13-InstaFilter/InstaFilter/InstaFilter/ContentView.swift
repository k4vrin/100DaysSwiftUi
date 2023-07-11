//
//  ContentView.swift
//  InstaFilter
//
//  Created by Mostafa Hosseini on 7/4/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showFilterIntesity = true
    
    @State private var filterRadius = 0.5
    @State private var showFilterRadius = false
    
    @State private var filterScale = 0.5
    @State private var showFilterScale = false
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = .sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                if showFilterIntesity {
                    HStack {
                        Text("Intesity")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity) { _ in
                                applyProcessing()
                            }
                    }
                    .padding(.vertical)
                }
                
                if showFilterRadius {
                    HStack {
                        Text("Radius")
                        Slider(value: $filterRadius)
                            .onChange(of: filterRadius) { _ in
                                applyProcessing()
                            }
                    }
                    .padding(.vertical)
                }
                
                if showFilterScale {
                    HStack {
                        Text("Scale")
                        Slider(value: $filterScale)
                            .onChange(of: filterScale) { _ in
                                applyProcessing()
                            }
                    }
                    .padding(.vertical)
                }
                
                HStack {
                    Button("Change Filter") { showingFilterSheet = true }
                    Spacer()
                    Button("Save", action: save)
                        .disabled(inputImage == nil)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog(
                "Select a filter",
                isPresented: $showingFilterSheet
            ) {
                Group {
                    Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Gaussan Blur") { setFilter(CIFilter.gaussianBlur()) }
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Bokeh Blur") { setFilter(CIFilter.bokehBlur()) }
                Button("Bloom") { setFilter(CIFilter.bloom()) }
                Button("Comic Effect") { setFilter(CIFilter.comicEffect()) }
                Button("Cancel", role: .cancel) {}
            }
            .alert("Saving Image", isPresented: $showAlert, actions: {}, message: {
                Text(alertMessage)
            })
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    func save() {
        guard let img = processedImage else { return }
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            showAlert = true
            alertMessage = "Image has been saved successfully"
        }
        
        imageSaver.errorHandler = {
            showAlert = true
            alertMessage = $0.localizedDescription
        }
        
        imageSaver.writeToPhotoAlbum(image: img)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            showFilterIntesity = true
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        } else {
            showFilterIntesity = false
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            showFilterRadius = true
            currentFilter.setValue(filterRadius*200, forKey: kCIInputRadiusKey)
        } else {
            showFilterRadius = false
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            showFilterScale = true
            currentFilter.setValue(filterScale*10, forKey: kCIInputScaleKey)
        } else {
            showFilterScale = false
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            processedImage = uiImage
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
