//
//  BBCustomWorkoutPlanListView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-20.
//

import UIKit

protocol BBCustomWorkoutPlanListViewDelegate: AnyObject {
    func goToCreateScreen()
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan)
}

final class BBCustomWorkoutPlanListView: UIView {
    public weak var delegate: BBCustomWorkoutPlanListViewDelegate?
    
    private let viewModel = BBCustomWorkoutPlanListViewViewModel.shared
    
    private let containerVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let yourPlansLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your plans"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            BBCustomWorkoutPlanListViewCell.self,
            forCellWithReuseIdentifier: BBCustomWorkoutPlanListViewCell.identifier
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "GrayScale-100")
        return collectionView
    }()
    
    private let addNewWorkoutsContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let emptyListLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You do not have ant custom workout plans yet."
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let addNewWorkoutsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CREATE", for: .normal)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let addNewWorkoutsButtonSecondary: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CREATE", for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.setTitleColor(UIColor(named: "Primary"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor =  UIColor(named: "GrayScale-100")
        
        setupSubViews()
        addSubViews(containerVStack)
        addConstraints()
        viewModel.delegate = self
        viewModel.fetchWorkoutPlans()
        setupCollectionView()
        
        addNewWorkoutsButton.addTarget(self, action: #selector(createButtonAction), for: .touchUpInside)
        addNewWorkoutsButtonSecondary.addTarget(self, action: #selector(createButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    @objc
    private func createButtonAction() {
        delegate?.goToCreateScreen()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
    
    private func setupSubViews() {
        containerVStack.addArrangedSubview(yourPlansLabel)
        containerVStack.addArrangedSubview(addNewWorkoutsButtonSecondary)
        containerVStack.addArrangedSubview(collectionView)
        containerVStack.addArrangedSubview(addNewWorkoutsContainer)
        addNewWorkoutsContainer.addSubview(addNewWorkoutsButton)
        addNewWorkoutsContainer.addSubview(emptyListLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerVStack.topAnchor.constraint(equalTo: topAnchor),
            containerVStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerVStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerVStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            yourPlansLabel.topAnchor.constraint(equalTo: containerVStack.topAnchor),
            yourPlansLabel.leadingAnchor.constraint(equalTo: containerVStack.leadingAnchor),
            yourPlansLabel.heightAnchor.constraint(equalToConstant: 20),
            
            addNewWorkoutsButtonSecondary.topAnchor.constraint(equalTo: containerVStack.topAnchor),
            addNewWorkoutsButtonSecondary.rightAnchor.constraint(equalTo: rightAnchor),
            addNewWorkoutsButtonSecondary.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.leadingAnchor.constraint(equalTo: containerVStack.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerVStack.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerVStack.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 350),
            
            addNewWorkoutsContainer.topAnchor.constraint(equalTo: yourPlansLabel.bottomAnchor, constant: 10),
            addNewWorkoutsContainer.bottomAnchor.constraint(equalTo: containerVStack.bottomAnchor),
            addNewWorkoutsContainer.leftAnchor.constraint(equalTo: containerVStack.leftAnchor),
            addNewWorkoutsContainer.rightAnchor.constraint(equalTo: containerVStack.rightAnchor),
            
            emptyListLabel.centerXAnchor.constraint(equalTo: addNewWorkoutsContainer.centerXAnchor),
            emptyListLabel.centerYAnchor.constraint(equalTo: addNewWorkoutsContainer.centerYAnchor, constant: -25),
            emptyListLabel.heightAnchor.constraint(equalToConstant: 20),
            
            addNewWorkoutsButton.centerXAnchor.constraint(equalTo: addNewWorkoutsContainer.centerXAnchor),
            addNewWorkoutsButton.topAnchor.constraint(equalTo: emptyListLabel.bottomAnchor, constant: 10),
            addNewWorkoutsButton.widthAnchor.constraint(equalToConstant: 200),
            addNewWorkoutsButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension BBCustomWorkoutPlanListView: BBCustomWorkoutPlanListViewViewModelDelegate {
    func newWorkoutCreated() {
        collectionView.reloadData()
        addNewWorkoutsContainer.isHidden = true
        addNewWorkoutsButtonSecondary.isHidden = false
    }
    
    func displayInitialView(isEmptyList: Bool) {
        if isEmptyList {
            addNewWorkoutsContainer.isHidden = false
            addNewWorkoutsButtonSecondary.isHidden = true
            return
        }
        addNewWorkoutsContainer.isHidden = true
        addNewWorkoutsButtonSecondary.isHidden = false
    }
    
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan) {
        delegate?.didSelectWorkoutPlan(workoutPlan)
    }
}
