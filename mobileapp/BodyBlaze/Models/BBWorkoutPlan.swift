//
//  BBWorkoutPlan.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-08.
//

import Foundation

struct BBWorkoutPlan: Codable {
    let id: Int
    let name: String
    let description: String?
    let image: String?
    let duration: Int
    let workouts: [BBWorkout]
}
