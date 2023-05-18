//
//  WrokoutPlans.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-08.
//

import Foundation

let workoutPlansData: [BBWorkoutPlan] = [
    BBWorkoutPlan(
        _id: "WP_1",
        name: "Workout plan 1",
        description: "This is workout plan 1",
        image: "",
        duration: 2,
        workouts: [
            BBWorkout(
                _id: "WK_1",
                name: "Workout 1",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                _id: "WK_2",
                name: "Workout 2",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                _id: "WK_3",
                name: "Workout 3",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
        ]
    ),
    BBWorkoutPlan(
        _id: "WP_2",
        name: "Workout plan 2",
        description: "This is workout plan 2",
        image: "",
        duration: 3,
        workouts: [
            BBWorkout(
                _id: "WK_1",
                name: "Workout 1",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                _id: "WK_2",
                name: "Workout 2",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                _id: "WK_3",
                name: "Workout 3",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
        ]
    ),
]
