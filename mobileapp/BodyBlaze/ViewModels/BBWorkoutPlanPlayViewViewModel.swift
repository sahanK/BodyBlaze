//
//  BBWorkoutPlanPlayViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-11.
//

import Foundation

final class BBWorkoutPlanPlayViewViewModel {
    public let workoutPlan: BBWorkoutPlan
    
    public var currentWorkout: Int
    
    init(workoutPlan: BBWorkoutPlan) {
        self.workoutPlan = workoutPlan
        self.currentWorkout = 0
    }
    
    public func setNextWorkout() {
        if currentWorkout < workoutPlan.workouts.count - 1 {
            currentWorkout += 1
        }
    }
    
    public func setPreviousWorkout() {
        if currentWorkout > 0 {
            currentWorkout -= 1
        }
    }
}

