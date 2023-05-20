//
//  BBProfileViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-20.
//

import Foundation

protocol BBProfileViewViewModelDelegate: AnyObject {
    func updateBmiData(
        profile: BBProfile,
        bmiValue: Double,
        bmiLevel: BBBMI,
        description: String
    )
}

final class BBProfileViewViewModel {
    public weak var delegate: BBProfileViewViewModelDelegate?
    
    func readProfileData() {
        guard let profile = BBFileManager.shared.readData(
            expecting: BBProfile.self,
            fileName: PROFILE_DATA_FILE
        ) else {
            return
        }
        let bmiValue = calculateBMI(height: profile.height, weight: profile.weight)
        let bmiLevel = getBmiLevel(bmiValue: bmiValue)
        
        var description = ""
        switch bmiLevel {
        case .Underweight:
            description = BMI_UNDERWEIGHT_DESCRIPTION
        case .Normal:
            description = BMI_NORMAL_DESCRIPTION
        case .Overweight:
            description = BMI_OVERWEIGHT_DESCRIPTION
        case .Obesity:
            description = BMI_OBESITY_DESCRIPTION
        }
        
        delegate?.updateBmiData(
            profile: profile,
            bmiValue: bmiValue,
            bmiLevel: bmiLevel,
            description: description
        )
    }
}
