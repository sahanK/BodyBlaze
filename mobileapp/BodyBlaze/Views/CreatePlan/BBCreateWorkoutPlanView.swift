//
//  BBCreateWorkoutPlanView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-15.
//

import UIKit

class BBCreateWorkoutPlanView: UIView {
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Let's create a personalized workout schedule that fits your fitness goals, preferences, and fitness level"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubViews(subTitleLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            subTitleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9),
        ])
    }
}
