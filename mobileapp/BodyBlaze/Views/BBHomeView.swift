//
//  BBHomeView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

final class BBHomeView: UIView {
    private let workoutsList = BBWorkoutPlanListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(workoutsList)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutsList.topAnchor.constraint(equalTo: topAnchor),
            workoutsList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutsList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            workoutsList.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
