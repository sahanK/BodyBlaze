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
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            BBCustomWorkoutPlanListViewCell.self,
            forCellReuseIdentifier: BBCustomWorkoutPlanListViewCell.identifier
        )
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "GrayScale-100")
        return tableView
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor =  UIColor(named: "GrayScale-100")
        
        setupSubViews()
        addSubViews(tableView, addNewWorkoutsContainer)
        addConstraints()
        viewModel.delegate = self
        viewModel.fetchWorkoutPlans()
        setupCollectionView()
        
        addNewWorkoutsButton.addTarget(self, action: #selector(createButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    @objc
    private func createButtonAction() {
        delegate?.goToCreateScreen()
    }
    
    private func setupCollectionView() {
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    private func setupSubViews() {
        addNewWorkoutsContainer.addSubview(addNewWorkoutsButton)
        addNewWorkoutsContainer.addSubview(emptyListLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addNewWorkoutsContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            addNewWorkoutsContainer.leftAnchor.constraint(equalTo: leftAnchor),
            addNewWorkoutsContainer.rightAnchor.constraint(equalTo: rightAnchor),
            addNewWorkoutsContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
            
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
        tableView.reloadData()
        addNewWorkoutsContainer.isHidden = true
    }
    
    func displayInitialView(isEmptyList: Bool) {
        if isEmptyList {
            addNewWorkoutsContainer.isHidden = false
            return
        }
        addNewWorkoutsContainer.isHidden = true
    }
    
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan) {
        delegate?.didSelectWorkoutPlan(workoutPlan)
    }
}
