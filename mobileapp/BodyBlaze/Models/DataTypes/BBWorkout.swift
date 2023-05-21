//
//  BBWorkout.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-08.
//

import Foundation

struct BBWorkout: Codable {
    var _id: String
    var name: String
    var reps: Int
    var bodyParts: [String]
//    var time: Int
    var image: String
    var video: String
}
