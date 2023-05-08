//
//  WrokoutPlans.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-08.
//

import Foundation

let workoutPlansData: [BBWorkoutPlan] = [
    BBWorkoutPlan(
        id: 0,
        name: "Workout plan 1",
        description: "This is workout plan 1",
        image: "",
        duration: 2,
        workouts: [
            BBWorkout(
                id: 0,
                name: "Workout 1",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                id: 1,
                name: "Workout 2",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                id: 2,
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
        id: 1,
        name: "Workout plan 2",
        description: "This is workout plan 2",
        image: "",
        duration: 3,
        workouts: [
            BBWorkout(
                id: 0,
                name: "Workout 1",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                id: 1,
                name: "Workout 2",
                reps: 12,
                bodyParts: ["Chest", "Arms", "Legs"],
                time: 300,
                image: "",
                video: ""
            ),
            BBWorkout(
                id: 2,
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
