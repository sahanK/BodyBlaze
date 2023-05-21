//
//  BBGetAllWorkoutsResponse.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-21.
//

import Foundation

struct BBGetAllWorkoutsResponse: Codable {
    let success: Bool
    let data: [BBWorkout]
}
