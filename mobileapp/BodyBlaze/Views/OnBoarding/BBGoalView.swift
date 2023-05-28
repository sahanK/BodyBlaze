//
//  BBGoalView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-14.
//

import UIKit

protocol BBGoalViewDelegate: AnyObject {
    func goToGenderView()
    func displayAlert(_ message: String)
}

final class BBGoalView: UIView {
    public weak var delegate: BBGoalViewDelegate?
    
    private let viewModel = BBOnBoardingViewViewModel.shared
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose your fitness goal"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "We're excited to help you achieve your fitness goals!"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let weightLossButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Weight Loss", for: .normal)
        button.backgroundColor = UIColor(named: "GrayScale-80")
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let muscleGainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Muscle Gain", for: .normal)
        button.backgroundColor = UIColor(named: "GrayScale-80")
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubViews(
            titleLabel,
            subTitleLabel,
            weightLossButton,
            muscleGainButton,
            nextButton
        )
        addConstraints()
        
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        weightLossButton.addTarget(self, action: #selector(weightLossButtonAction), for: .touchUpInside)
        muscleGainButton.addTarget(self, action: #selector(muscleGainButtonAction), for: .touchUpInside)
    }
    
    @objc
    private func nextButtonAction() {
        guard viewModel.selectedGoal != nil else {
            delegate?.displayAlert("Please select your goal")
            return
        }
        delegate?.goToGenderView()
    }
    
    @objc
    private func weightLossButtonAction() {
        viewModel.selectGoal(.WeightLoss)
        muscleGainButton.backgroundColor = UIColor(named: "GrayScale-80")
        weightLossButton.backgroundColor = UIColor(named: "GrayScale-60")
    }
    
    @objc
    private func muscleGainButtonAction() {
        viewModel.selectGoal(.MuscleGain)
        muscleGainButton.backgroundColor = UIColor(named: "GrayScale-60")
        weightLossButton.backgroundColor = UIColor(named: "GrayScale-80")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weightLossButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 100),
            weightLossButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            weightLossButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            weightLossButton.heightAnchor.constraint(equalToConstant: 50),
            
            muscleGainButton.topAnchor.constraint(equalTo: weightLossButton.bottomAnchor, constant: 50),
            muscleGainButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            muscleGainButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            muscleGainButton.heightAnchor.constraint(equalToConstant: 50),
            
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            nextButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
