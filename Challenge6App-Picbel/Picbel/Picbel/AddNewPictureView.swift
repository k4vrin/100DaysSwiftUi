//
//  AddNewPictureView.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/25/23.
//

import SwiftUI

struct AddNewPictureView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var desc: String = ""
    @State var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var isSaveEnable: Bool {
        !name.isEmpty && inputImage != nil
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    Button {
                        showingImagePicker = true
                    } label: {
                        if let inputImage = inputImage {
                            Image(uiImage: inputImage)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image(systemName: "plus.app")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                
                Section {
                    TextField("What is this picture's name?", text: $name)
                } header: {
                    Text("Label")
                }
                
                Section {
                    ZStack {
                        TextField(desc.isEmpty ? "Describe the picture (Optional)" : "", text: .constant(""))
                            .padding([.bottom])
                            .disabled(true)
                        
                        TextEditor(text: $desc)
                    }
                } header: {
                    Text("Description")
                }
            }
            Button {
                saveItem()
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
            }
            .disabled(!isSaveEnable)
            .padding()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func saveItem() {
        let imgUUID = UUID().uuidString
        if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
            let url = FileManager.documentsDirectory.appendingPathComponent("\(imgUUID)")
            try? jpegData.write(to: url, options: [.atomic, .completeFileProtection])
        } else {
            print("save unsuccessfull")
            return
        }
        
        let picbel = PicbelEntity(context: moc)
        picbel.created_at = Date.now
        picbel.img_id = imgUUID
        picbel.desc = desc
        picbel.name = name
        
        do {
            try moc.save()
        } catch {
            print("core save unsuccessfull: \(error.localizedDescription)")
        }
        
        dismiss()
        
    }
}

struct AddNewPictureView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPictureView()
    }
}
