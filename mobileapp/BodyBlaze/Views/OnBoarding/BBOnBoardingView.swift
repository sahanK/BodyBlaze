//
//  BBOnBoardingView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-14.
//

import UIKit

final class BBOnBoardingView: UIView {
    private let goalView = BBGoalView()
    private let genderView = BBGenderView()
    private let physiqueView = BBPhysiqueView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubViews(goalView, genderView, physiqueView)
        addConstraints()
        goalView.isHidden = false
        genderView.isHidden = true
        physiqueView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            goalView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            goalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            goalView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            goalView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            genderView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            genderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            genderView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            genderView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            physiqueView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            physiqueView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            physiqueView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            physiqueView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ])
    }
}