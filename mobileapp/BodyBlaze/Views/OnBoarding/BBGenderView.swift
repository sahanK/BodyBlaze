//
//  BBGenderView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-14.
//

import UIKit

final class BBGenderView: UIView {
    private let viewModel: BBOnBoardingViewViewModel
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Customize Your Workout Experience"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To tailor your workout experience, we need to know your gender."
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let genderMaleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "GenderMale")
        imageView.layer.backgroundColor = UIColor(named: "GrayScale-80")?.cgColor
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let genderFemaleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "GenderFemale")
        imageView.layer.backgroundColor = UIColor(named: "GrayScale-80")?.cgColor
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        self.viewModel = BBOnBoardingViewViewModel.shared
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubViews(
            titleLabel,
            subTitleLabel,
            genderMaleImage,
            genderFemaleImage,
            nextButton
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            genderMaleImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            genderMaleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            genderMaleImage.heightAnchor.constraint(equalToConstant: 300),
            genderMaleImage.widthAnchor.constraint(equalToConstant: 150),
            
            genderFemaleImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            genderFemaleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            genderFemaleImage.heightAnchor.constraint(equalToConstant: 300),
            genderFemaleImage.widthAnchor.constraint(equalToConstant: 150),
            
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            nextButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
