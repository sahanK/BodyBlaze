//
//  BBCreateWorkoutPlanView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-15.
//

import UIKit

protocol BBCreateWorkoutPlanViewDelegate {
    func displayWorkoutsList()
}

final class BBCreateWorkoutPlanView: UIView {
    private let viewModel = BBCreateWorkoutPlanViewViewModel.shared
    
    public var delegate: BBCreateWorkoutPlanViewDelegate?
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Let's create a personalized workout schedule that fits your fitness goals, preferences, and fitness level"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let durationContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let durationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Duration (weeks)"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let durationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            BBPlanDurationCollectionViewCell.self,
            forCellWithReuseIdentifier: BBPlanDurationCollectionViewCell.identifier
        )
        collectionView.backgroundColor = UIColor(named: "GrayScale-80")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let nameContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let nameTextInput: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 20, weight: .bold)
        textField.text = "My workout plan 1"
        textField.backgroundColor = UIColor(named: "GrayScale-80")
        return textField
    }()
    
    private let workoutsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-100")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let workoutsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Workouts"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    
    private let addWorkoutsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.contentHorizontalAlignment = .center
        button.tintColor = UIColor(named: "Primary")
        return button
    }()
    
    private let selectedWorkoutTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            BBWorkoutCell.self,
            forCellReuseIdentifier: BBWorkoutCell.identifier
        )
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "GrayScale-100")
        return tableView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SAVE", for: .normal)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubViews(
            subTitleLabel,
            durationContainerView,
            durationTitleLabel,
            durationCollectionView,
            nameContainerView,
            nameTitleLabel,
            nameTextInput,
            workoutsContainerView,
            workoutsTitleLabel,
            addWorkoutsButton,
            selectedWorkoutTableView,
            saveButton
        )
        addConstraints()
        setupCollectionView()
        setupTableView()
        
        addWorkoutsButton.addTarget(self, action: #selector(addWorkoutsButtonAction), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    @objc
    private func addWorkoutsButtonAction() {
        delegate?.displayWorkoutsList()
    }
    
    @objc
    private func saveButtonAction() {
        guard let name = nameTextInput.text else { return }
        viewModel.createPlan(name: name)
    }
    
    private func setupCollectionView() {
        durationCollectionView.delegate = viewModel
        durationCollectionView.dataSource = viewModel
    }
    
    private func setupTableView() {
        selectedWorkoutTableView.dataSource = viewModel
        selectedWorkoutTableView.delegate = viewModel
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            subTitleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9),
            
            durationContainerView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
            durationContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            durationContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            durationContainerView.heightAnchor.constraint(equalToConstant: 180),
            
            durationTitleLabel.topAnchor.constraint(equalTo: durationContainerView.topAnchor, constant: 10),
            durationTitleLabel.leftAnchor.constraint(equalTo: durationContainerView.leftAnchor, constant: 10),
            durationTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            durationCollectionView.topAnchor.constraint(equalTo: durationTitleLabel.bottomAnchor, constant: 10),
            durationCollectionView.leftAnchor.constraint(equalTo: durationContainerView.leftAnchor, constant: 20),
            durationCollectionView.rightAnchor.constraint(equalTo: durationContainerView.rightAnchor, constant: -20),
            durationCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.25),
            
            nameContainerView.topAnchor.constraint(equalTo: durationContainerView.bottomAnchor, constant: 20),
            nameContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            nameContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            nameContainerView.heightAnchor.constraint(equalToConstant: 100),
            
            nameTitleLabel.topAnchor.constraint(equalTo: nameContainerView.topAnchor, constant: 10),
            nameTitleLabel.leftAnchor.constraint(equalTo: nameContainerView.leftAnchor, constant: 10),
            nameTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameTextInput.topAnchor.constraint(equalTo: nameTitleLabel.bottomAnchor, constant: 10),
            nameTextInput.leftAnchor.constraint(equalTo: nameContainerView.leftAnchor, constant: 10),
            nameTextInput.rightAnchor.constraint(equalTo: nameContainerView.rightAnchor, constant: -10),
            nameTextInput.heightAnchor.constraint(equalToConstant: 40),
            
            workoutsContainerView.topAnchor.constraint(equalTo: nameContainerView.bottomAnchor, constant: 20),
            workoutsContainerView.leftAnchor.constraint(equalTo: leftAnchor),
            workoutsContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            workoutsContainerView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            
            workoutsTitleLabel.topAnchor.constraint(equalTo: workoutsContainerView.topAnchor, constant: 10),
            workoutsTitleLabel.leftAnchor.constraint(equalTo: workoutsContainerView.leftAnchor, constant: 10),
            workoutsTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            addWorkoutsButton.topAnchor.constraint(equalTo: workoutsContainerView.topAnchor, constant: 10),
            addWorkoutsButton.rightAnchor.constraint(equalTo: workoutsContainerView.rightAnchor, constant: -10),
            addWorkoutsButton.heightAnchor.constraint(equalToConstant: 30),
            addWorkoutsButton.widthAnchor.constraint(equalToConstant: 30),
            
            selectedWorkoutTableView.topAnchor.constraint(equalTo: workoutsTitleLabel.bottomAnchor, constant: 5),
            selectedWorkoutTableView.leftAnchor.constraint(equalTo: workoutsContainerView.leftAnchor, constant: 10),
            selectedWorkoutTableView.rightAnchor.constraint(equalTo: workoutsContainerView.rightAnchor, constant: -10),
            selectedWorkoutTableView.bottomAnchor.constraint(equalTo: workoutsContainerView.bottomAnchor, constant: -10),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5),
            saveButton.leftAnchor.constraint(equalTo: leftAnchor),
            saveButton.rightAnchor.constraint(equalTo: rightAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension BBCreateWorkoutPlanView: BBCreateWorkoutPlanViewViewModelDelegate {
    func didAddedWorkout() {
        selectedWorkoutTableView.reloadData()
    }
}
