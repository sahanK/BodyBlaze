//
//  BBOnBoardingViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-15.
//

import Foundation

protocol BBOnBoardingViewViewModelDelegate: AnyObject {
    func displayAlert(message: String)
}

final class BBOnBoardingViewViewModel {    
    static let shared = BBOnBoardingViewViewModel()
    
    public weak var delegate: BBOnBoardingViewViewModelDelegate?
    
    public var selectedGoal: BBGoal?
    public var selectedGender: BBGender?
    public var age: Int?
    public var height: Double?
    public var weight: Double?
    
    public func selectGoal(_ goal: BBGoal) {
        selectedGoal = goal
    }
    
    public func selectGender(gender: BBGender) {
        selectedGender = gender
    }
    
    public func setPhysiqueDetails(
        inputAge: String,
        inputHeight: String,
        inputWeight: String
    ) -> Bool {
        guard let ageNumber = Int(inputAge) else { return false }
        guard let heightNumber = Double(inputHeight) else { return false }
        guard let weightNumber = Double(inputWeight) else { return false }
        
        if ageNumber > 60 {
            delegate?.displayAlert(message: "Stay active, but prioritize safety. Consult a professional for suitable exercises")
            return false
        }
        if ageNumber < 10 {
            delegate?.displayAlert(message: "Great to see your interest! Please involve a guardian for age-appropriate activities. Have fun!")
            return false
        }
        if heightNumber > 213 || heightNumber < 30 {
            delegate?.displayAlert(message: "Please enter a realistic height to proceed. Thank you!")
            return false
        }
        if weightNumber < 9 || weightNumber > 453 {
            delegate?.displayAlert(message: "Please enter a realistic weight to proceed. Thank you!")
            return false
        }
        age = Int(inputAge)
        height = Double(inputHeight)
        weight = Double(inputWeight)
        return true
    }
}
