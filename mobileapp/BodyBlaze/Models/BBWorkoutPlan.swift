//
//  BBWorkoutPlan.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-08.
//

import Foundation

struct BBWorkoutPlan: Codable {
    var _id: String
    var name: String
    var description: String?
    var image: String?
    var duration: Int
    var workouts: [BBWorkout]
}
