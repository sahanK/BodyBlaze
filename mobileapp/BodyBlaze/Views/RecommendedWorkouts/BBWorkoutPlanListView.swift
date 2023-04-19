//
//  BBRecommendedWorkoutListView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

final class BBWorkoutPlanListView: UIView {
    private let viewModel = BBWorkoutPlanListViewViewModel()
    
    private let containerVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let titleHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let recommendedWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Workout plans"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            BBWorkoutPanListCell.self,
            forCellReuseIdentifier: BBWorkoutPanListCell.identifier
        )
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupTableView()
        setupSubViews()
        addSubViews(containerVStack)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func setupTableView() {
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    
    private func setupSubViews() {
        titleHStack.addArrangedSubview(recommendedWorkoutsLabel)
        containerVStack.addArrangedSubview(titleHStack)
        containerVStack.addArrangedSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerVStack.topAnchor.constraint(equalTo: topAnchor),
            containerVStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerVStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerVStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleHStack.topAnchor.constraint(equalTo: containerVStack.topAnchor),
            titleHStack.leadingAnchor.constraint(equalTo: containerVStack.leadingAnchor),
            titleHStack.trailingAnchor.constraint(equalTo: containerVStack.trailingAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: containerVStack.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerVStack.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerVStack.bottomAnchor),
        ])
    }
}