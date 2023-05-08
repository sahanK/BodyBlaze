//
//  BBWorkout.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-08.
//

import Foundation

struct BBWorkout: Codable {
    let id: Int
    let name: String
    let reps: Int
    let bodyParts: [String]
    let time: Int
    let image: String
    let video: String
}
