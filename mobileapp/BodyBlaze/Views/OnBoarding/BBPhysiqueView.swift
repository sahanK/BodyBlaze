//
//  BBPhysiqueView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-15.
//

import UIKit

protocol BBPhysiqueViewDelegate: AnyObject {
    func gotoHomeScreen()
    func displayAlert(_ message: String)
}

class BBPhysiqueView: UIView {
    public weak var delegate: BBPhysiqueViewDelegate?
    
    private let viewModel = BBOnBoardingViewViewModel.shared
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter following information for Personalized Workouts"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To create personalized workout plans for you, we need to know your age, height and weight."
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let ageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let ageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Age"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let ageTextInput: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 34, weight: .bold)
        textField.text = "23"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let heightContainerView: UIView = {
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
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let heightTextInput: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 34, weight: .bold)
        textField.text = "175"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let weightContainerView: UIView = {
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
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let weightTextInput: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 34, weight: .bold)
        textField.text = "56"
        textField.keyboardType = .numberPad
        return textField
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
            ageContainerView,
            ageTitleLabel,
            ageTextInput,
            heightContainerView,
            heightTitleLabel,
            heightTextInput,
            weightContainerView,
            weightTitleLabel,
            weightTextInput,
            nextButton
        )
        addConstraints()
        setupGestures()
        
        viewModel.delegate = self
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    @objc
    private func nextButtonAction() {
        let gotoHome = viewModel.setPhysiqueDetails(
            inputAge: ageTextInput.text ?? "",
            inputHeight: heightTextInput.text ?? "",
            inputWeight: weightTextInput.text ?? ""
        )
        if gotoHome {
            delegate?.gotoHomeScreen()
        }
    }
    
    private func setupGestures() {
        let containerGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        addGestureRecognizer(containerGesture)
    }
    
    @objc
    private func dismissKeyboard() {
        endEditing(true)
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
            subTitleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.75),
            
            ageContainerView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            ageContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            ageContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            ageContainerView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height - 330) / 3),
            
            ageTitleLabel.topAnchor.constraint(equalTo: ageContainerView.topAnchor, constant: 10),
            ageTitleLabel.leftAnchor.constraint(equalTo: ageContainerView.leftAnchor, constant: 10),
            ageTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            ageTextInput.centerXAnchor.constraint(equalTo: ageContainerView.centerXAnchor),
            ageTextInput.centerYAnchor.constraint(equalTo: ageContainerView.centerYAnchor),
            ageTextInput.heightAnchor.constraint(equalToConstant: 60),
            
            heightContainerView.topAnchor.constraint(equalTo: ageContainerView.bottomAnchor, constant: 10),
            heightContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            heightContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            heightContainerView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height - 330) / 3),
            
            heightTitleLabel.topAnchor.constraint(equalTo: heightContainerView.topAnchor, constant: 10),
            heightTitleLabel.leftAnchor.constraint(equalTo: heightContainerView.leftAnchor, constant: 10),
            heightTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            heightTextInput.centerXAnchor.constraint(equalTo: heightContainerView.centerXAnchor),
            heightTextInput.centerYAnchor.constraint(equalTo: heightContainerView.centerYAnchor),
            heightTextInput.heightAnchor.constraint(equalToConstant: 60),
            
            weightContainerView.topAnchor.constraint(equalTo: heightContainerView.bottomAnchor, constant: 10),
            weightContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            weightContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            weightContainerView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height - 330) / 3),
            
            weightTitleLabel.topAnchor.constraint(equalTo: weightContainerView.topAnchor, constant: 10),
            weightTitleLabel.leftAnchor.constraint(equalTo: weightContainerView.leftAnchor, constant: 10),
            weightTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            weightTextInput.centerXAnchor.constraint(equalTo: weightContainerView.centerXAnchor),
            weightTextInput.centerYAnchor.constraint(equalTo: weightContainerView.centerYAnchor),
            weightTextInput.heightAnchor.constraint(equalToConstant: 60),
            
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            nextButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension BBPhysiqueView: BBOnBoardingViewViewModelDelegate {
    func displayAlert(message: String) {
        delegate?.displayAlert(message)
    }
}
