//
//  BBWorkoutCellViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-13.
//

import Foundation

final class BBWorkoutCellViewModel {
    public let title: String
    public let numberOfReps: Int
//    public imageUrl: String
    
    init(title: String, numberOfReps: Int) {
        self.title = title
        self.numberOfReps = numberOfReps
    }
}
