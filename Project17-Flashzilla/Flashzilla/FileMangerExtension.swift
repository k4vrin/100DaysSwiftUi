//
//  FileMangerExtension.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/17/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
}
