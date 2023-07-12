//
//  FileManager_Decodable.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/12/23.
//

import Foundation

extension FileManager {
    func decode<T: Codable>(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask, file: String, datePattern: String = "y-MM-dd") -> T {
        let paths = FileManager.default.urls(for: directory, in: domainMask)
        let url = paths[0].appendingPathComponent(file)

        guard let data = try? Data(contentsOf: url) else { fatalError("Failed to load \(file) from bundle.") }

        print(data)
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = datePattern
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else { fatalError("Failed to decode \(file) from bundle.") }
        return loaded
    }
}
