//
//  ContentView.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/25/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        VStack {
            FilteredList(
                sortDesc: [NSSortDescriptor(key: "created_at", ascending: true)]
            ) { (picbel: PicbelEntity) in
                HStack {
                    if let img = loadImg(picbel.img_id ?? "") {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                    }
                    Text(picbel.name ?? "err")
                        .foregroundColor(Color.black)
                }
                .frame(height: 56)
            }
        }
        .sheet(isPresented: $showSheet) {
            AddNewPictureView()
        }
        .toolbar {
            ToolbarItem {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus.app")
                }
            }

            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
        .navigationTitle("Picbel")
    }

    func loadImg(_ imgId: String) -> UIImage? {
        do {
            let data = try Data(contentsOf: FileManager.documentsDirectory.appendingPathComponent(imgId))
            return UIImage(data: data)
        } catch {
            print("Error loading img")
            return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
