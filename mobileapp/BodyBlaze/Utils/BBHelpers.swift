//
//  BBHelpers.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-20.
//

import Foundation

func calculateBMI(height: Double, weight: Double) -> Double {
    let heightMeters = height / 100
    let bmi = weight / (heightMeters * heightMeters)
    return round(bmi * 10) / 10.0
}

func getBmiLevel(bmiValue: Double) -> BBBMI {
    if bmiValue <= 18.4 {
        return .Underweight
    }
    if bmiValue >= 18.5 && bmiValue <= 24.9 {
        return .Normal
    }
    if bmiValue >= 25.0 && bmiValue <= 29.9 {
        return .Overweight
    }
    if bmiValue >= 30.0 {
        return .Obesity
    }
    return .Normal
}
