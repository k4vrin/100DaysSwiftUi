//
//  ReadBundle.swift
//  WordScramble
//
//  Created by Mostafa Hosseini on 4/17/23.
//

import SwiftUI

struct ReadBundle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

    func loadFile() {
        if let fileURL = Bundle.main.url(
            forResource: "some-file",
            withExtension: "txt"
        ) {
            if let fileContent = try? String(contentsOf: fileURL) {
                fileContent
            }
        }
    }
}

struct ReadBundle_Previews: PreviewProvider {
    static var previews: some View {
        ReadBundle()
    }
}
