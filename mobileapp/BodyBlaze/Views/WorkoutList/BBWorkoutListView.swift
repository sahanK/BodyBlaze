//
//  BBWorkoutListView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import UIKit

protocol BBWorkoutListViewDelegate: AnyObject {
    func didSelectWorkout(_ workout: BBWorkout)
}

final class BBWorkoutListView: UIView {
    public weak var delegate: BBWorkoutListViewDelegate?
    
    private let viewModel = BBWorkoutListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let workoutTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            BBWorkoutCell.self,
            forCellReuseIdentifier: BBWorkoutCell.identifier
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
        
        addSubViews(spinner, workoutTableView)
        addConstraints()
        setupTableView()
        viewModel.delegate = self
        spinner.startAnimating()
        viewModel.fetchWorkouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func setupTableView() {
        workoutTableView.delegate = viewModel
        workoutTableView.dataSource = viewModel
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutTableView.topAnchor.constraint(equalTo: topAnchor),
            workoutTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            workoutTableView.leftAnchor.constraint(equalTo: leftAnchor),
            workoutTableView.rightAnchor.constraint(equalTo: rightAnchor),
            
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension BBWorkoutListView: BBWorkoutListViewViewModelDelegate {
    func didSelectWorkout(_ workout: BBWorkout) {
        delegate?.didSelectWorkout(workout)
    }
    
    func didLoadWorkouts() {
        spinner.stopAnimating()
        workoutTableView.isHidden = false
        workoutTableView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.workoutTableView.alpha = 1
        }
    }
}
