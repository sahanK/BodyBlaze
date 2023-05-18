//
//  BBWorkoutPlanListViewCellViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-13.
//

import Foundation

final class BBWorkoutPlanListViewCellViewModel: Hashable {
    
    public let title: String
    public let numberOfWorkouts: Int
    public let duration: Int
    public let imageUrl: String
    
    init(
        title: String,
        numberOfWorkouts: Int,
        duration: Int,
        imageUrl: String
    ) {
        self.title = title
        self.numberOfWorkouts = numberOfWorkouts
        self.duration = duration
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

extension BBWorkoutPlanListViewCellViewModel: Equatable {
    static func == (lhs: BBWorkoutPlanListViewCellViewModel, rhs: BBWorkoutPlanListViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(duration)
        hasher.combine(numberOfWorkouts)
    }
}
