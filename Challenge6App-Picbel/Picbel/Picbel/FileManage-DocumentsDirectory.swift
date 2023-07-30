//
//  FileManage-DocumentsDirectory.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/29/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
