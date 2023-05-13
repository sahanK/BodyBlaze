//
//  BBWorkoutPlanListViewCellViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-13.
//

import Foundation

final class BBWorkoutPlanListViewCellViewModel {
    public let title: String
    public let numberOfWorkouts: Int
    public let duration: Int
    
    init(title: String, numberOfWorkouts: Int, duration: Int) {
        self.title = title
        self.numberOfWorkouts = numberOfWorkouts
        self.duration = duration
    }
}
