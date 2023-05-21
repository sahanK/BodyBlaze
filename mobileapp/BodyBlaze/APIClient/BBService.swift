//
//  BBService.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-21.
//

import Foundation

final class BBService {
    static let shared = BBService()
    
    enum BBServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    func execute<T: Codable>(
        _ request: BBRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(BBServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? BBServiceError.failedToGetData))
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(type.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from bbRequest: BBRequest) -> URLRequest? {
        guard let url = bbRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = bbRequest.httpMethod
        return request
    }
}
