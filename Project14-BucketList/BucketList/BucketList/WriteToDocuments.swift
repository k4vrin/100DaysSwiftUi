//
//  WriteToDocuments.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/12/23.
//

import SwiftUI

struct WriteToDocuments: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct WriteToDocuments_Previews: PreviewProvider {
    static var previews: some View {
        WriteToDocuments()
    }
}
