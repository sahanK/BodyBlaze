//
//  BBHomeView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

final class BBHomeView: UIView {
    private let workoutsList = BBWorkoutPlanListView()
    private let customWorkoutList = BBCustomWorkoutPlanListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor =  UIColor(named: "GrayScale-100")
        addSubViews(workoutsList, customWorkoutList)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            customWorkoutList.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            customWorkoutList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            customWorkoutList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            customWorkoutList.heightAnchor.constraint(equalToConstant: 320),
            
            workoutsList.topAnchor.constraint(equalTo: customWorkoutList.bottomAnchor, constant: 10),
            workoutsList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutsList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            workoutsList.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
