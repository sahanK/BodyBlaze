//
//  BBWorkoutCellViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-13.
//

import Foundation

final class BBWorkoutCellViewModel: Hashable {
    public let title: String
    public let numberOfReps: Int
    public let imageUrl: String
    
    init(title: String, numberOfReps: Int, imageUrl: String) {
        self.title = title
        self.numberOfReps = numberOfReps
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: imageUrl) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        BBImageLoader.shared.downloadImage(url, completion: completion)
    }
}

extension BBWorkoutCellViewModel: Equatable {
    static func == (lhs: BBWorkoutCellViewModel, rhs: BBWorkoutCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(numberOfReps)
        hasher.combine(imageUrl)
    }
}
