//
//  BBFileManager.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-17.
//

import Foundation

final class BBFileManager {
    static let shared = BBFileManager()
    
    func writeData(data: Encodable) {
        guard let fileUrl = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent("data.json") else {
            fatalError("DEBUG:: fileUrl error")
        }
        try? JSONEncoder().encode(data).write(to: fileUrl)
    }
    
    func readData<T: Codable>(expecting type: T.Type) -> T {
        guard let fileUrl = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ).appendingPathComponent("data.json") else {
            fatalError("DEBUG:: fileUrl error")
        }
        guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError("DEBUG:: file reading error")
        }
        guard let decodedData = try? JSONDecoder().decode(type.self, from: data) else {
            fatalError("DEBUG:: data decoding error")
        }
        return decodedData
    }
}
