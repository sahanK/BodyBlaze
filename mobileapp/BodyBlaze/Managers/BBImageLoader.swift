//
//  BBImageLoader.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-15.
//

import Foundation

final class BBImageLoader {
    static let shared = BBImageLoader()
    
    private let imageDataCache = NSCache<NSString, NSData>()
    
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let cacheKey = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: cacheKey) {
            completion(.success(data as Data))
            return
        }
        
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            let cacheValue = data as NSData
            self?.imageDataCache.setObject(cacheValue, forKey: cacheKey)
            completion(.success(data))
        }
        dataTask.resume()
    }
}
