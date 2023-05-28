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
        
        addSubViews(tableView, spinner)
        addConstraints()
        viewModel.delegate = self
        spinner.startAnimating()
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
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            spinner.topAnchor.constraint(equalTo: tableView.topAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
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
