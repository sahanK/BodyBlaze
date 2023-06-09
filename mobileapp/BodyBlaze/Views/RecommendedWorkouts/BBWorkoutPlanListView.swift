//
//  BBRecommendedWorkoutListView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

protocol BBWorkoutPlanListViewDelegate: AnyObject {
    func bbWorkoutPlanListView(
        _ workoutPlansListView: BBWorkoutPlanListView,
        selectedPlan workoutPlan: BBWorkoutPlan
    )
}

final class BBWorkoutPlanListView: UIView {
    public weak var delegate: BBWorkoutPlanListViewDelegate?
    
    private let viewModel = BBWorkoutPlanListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
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
        stackView.distribution = .equalSpacing
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
        tableView.backgroundColor = UIColor(named: "GrayScale-100")
        tableView.isHidden = true
        tableView.alpha = 0
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupSubViews()
        addSubViews(containerVStack)
        addConstraints()
        viewModel.delegate = self
        viewModel.fetchWorkoutPlans()
        setupTableView()
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
        containerVStack.addArrangedSubview(spinner)
        spinner.startAnimating()
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
            
            spinner.topAnchor.constraint(equalTo: containerVStack.topAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: containerVStack.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: containerVStack.centerYAnchor)
        ])
    }
}

extension BBWorkoutPlanListView: BBWorkoutPlanListViewModelDelegate {
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan) {
        delegate?.bbWorkoutPlanListView(self, selectedPlan: workoutPlan)
    }
    
    func didLoadWorkoutPlans() {
        self.spinner.stopAnimating()
        self.spinner.isHidden = true
        self.tableView.isHidden = false
        tableView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.tableView.alpha = 1
        }
    }
}
