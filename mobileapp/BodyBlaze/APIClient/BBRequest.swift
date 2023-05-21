//
//  BBRequest.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-21.
//

import Foundation

final class BBRequest {
    private struct Constants {
        static let baseUrl = "https://bodyblaze.onrender.com/api/v1"
    }
    
    let endpoint: BBEndpoint
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: BBEndpoint) {
        self.endpoint = endpoint
    }
}

extension BBRequest {
    static let workoutPlans = BBRequest(endpoint: .workoutPlans)
}
