//
//  BBFileManager.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-17.
//

import Foundation

/// SIngleton class for read and write files
final class BBFileManager {
    static let shared = BBFileManager()
    
    /// Write data to a file with specific name
    func writeData(data: Encodable, fileName: String) {
        guard let fileUrl = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent(fileName) else {
            fatalError("DEBUG:: fileUrl error")
        }
        try? JSONEncoder().encode(data).write(to: fileUrl)
    }
    
    /// Read data from a file with specific name
    func readData<T: Codable>(expecting type: T.Type, fileName: String) -> T? {
        guard let fileUrl = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent(fileName) else {
            print("DEBUG:: fileUrl error")
            return nil
        }
        guard let data = try? Data(contentsOf: fileUrl) else {
            print("DEBUG:: file reading error")
            return nil
        }
        guard let decodedData = try? JSONDecoder().decode(type.self, from: data) else {
            print("DEBUG:: data decoding error")
            return nil
        }
        return decodedData
    }
}
