//
//  BBWorkoutPlanPlay.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-11.
//

import UIKit

final class BBWorkoutPlanPlayView: UIView {
    private var viewModel: BBWorkoutPlanPlayViewViewModel
    
    private let workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "recommended-bg-1")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Burpees"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "x12"
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FINISH", for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        button.layer.borderColor = UIColor(named: "GrayScale-80")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "previous"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 120)
        button.contentHorizontalAlignment = .center
        button.tintColor = UIColor.white
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.layer.borderColor = UIColor(named: "GrayScale-80")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "next"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 90, bottom: 10, right: 40)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentHorizontalAlignment = .center
        button.tintColor = UIColor.white
        return button
    }()
    
    init(frame: CGRect, viewModel: BBWorkoutPlanPlayViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "GrayScale-100")
        
        addSubViews(
            workoutImageView,
            nameLabel,
            repsLabel,
            finishButton,
            previousButton,
            nextButton
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutImageView.topAnchor.constraint(equalTo: topAnchor),
            workoutImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            workoutImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            workoutImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
            
            nameLabel.topAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            repsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            repsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            repsLabel.heightAnchor.constraint(equalToConstant: 50),
            
            finishButton.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 50),
            finishButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            finishButton.heightAnchor.constraint(equalToConstant: 40),
            finishButton.widthAnchor.constraint(equalToConstant: 200),
            
            previousButton.topAnchor.constraint(equalTo: finishButton.bottomAnchor, constant: 50),
            previousButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            previousButton.heightAnchor.constraint(equalToConstant: 40),
            previousButton.widthAnchor.constraint(equalToConstant: 150),
            
            nextButton.topAnchor.constraint(equalTo: finishButton.bottomAnchor, constant: 50),
            nextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
