//
//  BBProfile.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-20.
//

import Foundation

struct BBProfile: Codable {
    let gender: BBGender
    let age: Int
    let height: Double
    let weight: Double
    let goal: BBGoal
}
