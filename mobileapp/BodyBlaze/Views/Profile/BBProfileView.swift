//
//  BBProfileView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-20.
//

import UIKit

final class BBProfileView: UIView {
    private let viewModel = BBProfileViewViewModel()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Based on the information you provided, we have calculated a health assessment"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let heightContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let heightTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height (cm)"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let heightValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "175"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let weightContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let weightTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight (kg)"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let weightValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "61"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let bmiContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let bmiTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BMI"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let bmiValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21.5"
        label.font = .systemFont(ofSize: 56, weight: .medium)
        label.textColor = UIColor(named: "Primary")
        return label
    }()
    
    private let bmiLevelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Normal"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemGreen
        return label
    }()
    
    private let bmiDescrition: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BMI level indicating that an individual falls within the healthy weight range for their height. Being at a normal weight typically signifies a balanced body composition and overall good health. Maintaining a normal weight is associated with a reduced risk of various health conditions and diseases. Regular exercise, along with a nutritious diet, can help individuals maintain their normal weight and support overall well-being."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 100
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "GrayScale-100")
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubViews(
            subTitleLabel,
            heightContainer,
            weightContainer,
            bmiContainer,
            heightTitleLabel,
            weightTitleLabel,
            bmiTitleLabel,
            heightValueLabel,
            weightValueLabel,
            bmiValueLabel,
            bmiLevelLabel,
            bmiDescrition
        )
        addConstraints()
        viewModel.delegate = self
        viewModel.readProfileData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            subTitleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            
            heightContainer.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            heightContainer.leftAnchor.constraint(equalTo: leftAnchor),
            heightContainer.heightAnchor.constraint(equalToConstant: 80),
            heightContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3),
            
            heightTitleLabel.topAnchor.constraint(equalTo: heightContainer.topAnchor),
            heightTitleLabel.leftAnchor.constraint(equalTo: heightContainer.leftAnchor, constant: 8),
            heightTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            heightValueLabel.topAnchor.constraint(equalTo: heightTitleLabel.bottomAnchor, constant: 8),
            heightValueLabel.centerXAnchor.constraint(equalTo: heightContainer.centerXAnchor),
            heightValueLabel.heightAnchor.constraint(equalToConstant: 30),
            
            weightContainer.topAnchor.constraint(equalTo: heightContainer.bottomAnchor, constant: 8),
            weightContainer.leftAnchor.constraint(equalTo: leftAnchor),
            weightContainer.heightAnchor.constraint(equalToConstant: 80),
            weightContainer.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3),
            
            weightTitleLabel.topAnchor.constraint(equalTo: weightContainer.topAnchor),
            weightTitleLabel.leftAnchor.constraint(equalTo: weightContainer.leftAnchor, constant: 8),
            weightTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            weightValueLabel.topAnchor.constraint(equalTo: weightTitleLabel.bottomAnchor, constant: 8),
            weightValueLabel.centerXAnchor.constraint(equalTo: weightContainer.centerXAnchor),
            weightValueLabel.heightAnchor.constraint(equalToConstant: 30),
            
            bmiContainer.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            bmiContainer.leftAnchor.constraint(equalTo: heightContainer.rightAnchor, constant: 8),
            bmiContainer.rightAnchor.constraint(equalTo: rightAnchor),
            bmiContainer.heightAnchor.constraint(equalToConstant: 168),
            
            bmiTitleLabel.topAnchor.constraint(equalTo: bmiContainer.topAnchor),
            bmiTitleLabel.leftAnchor.constraint(equalTo: bmiContainer.leftAnchor, constant: 8),
            bmiTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            bmiValueLabel.centerYAnchor.constraint(equalTo: bmiContainer.centerYAnchor),
            bmiValueLabel.centerXAnchor.constraint(equalTo: bmiContainer.centerXAnchor),
            bmiValueLabel.heightAnchor.constraint(equalToConstant: 60),
            
            bmiLevelLabel.topAnchor.constraint(equalTo: weightContainer.bottomAnchor, constant: 5),
            bmiLevelLabel.leftAnchor.constraint(equalTo: leftAnchor),
            bmiLevelLabel.heightAnchor.constraint(equalToConstant: 60),
            
            bmiDescrition.topAnchor.constraint(equalTo: bmiLevelLabel.bottomAnchor),
            bmiDescrition.leftAnchor.constraint(equalTo: leftAnchor),
            bmiDescrition.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
}

extension BBProfileView: BBProfileViewViewModelDelegate {
    func updateBmiData(profile: BBProfile, bmiValue: Double, bmiLevel: BBBMI, description: String) {
        heightValueLabel.text = "\(profile.height)"
        weightValueLabel.text = "\(profile.weight)"
        bmiValueLabel.text = "\(bmiValue)"
        bmiLevelLabel.text = bmiLevel.rawValue
        bmiDescrition.text = description
        
        if bmiLevel == .Normal {
            bmiLevelLabel.textColor = .systemGreen
        }
        if bmiLevel == .Overweight {
            bmiLevelLabel.textColor = .systemYellow
        }
        if bmiLevel == .Underweight || bmiLevel == .Obesity {
            bmiLevelLabel.textColor = .systemRed
        }
    }
}
