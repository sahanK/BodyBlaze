//
//  BBOnBoardingViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-15.
//

import Foundation

final class BBOnBoardingViewViewModel {
    enum Gender {
        case Male
        case Female
    }
    
    static let shared = BBOnBoardingViewViewModel()
    
    public var selectedGender: Gender?
    
    public func selectGender(gender: Gender) {
        selectedGender = gender
    }
}
