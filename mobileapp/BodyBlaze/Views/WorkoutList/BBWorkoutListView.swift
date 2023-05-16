//
//  BBWorkoutListView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import UIKit

final class BBWorkoutListView: UIView {
    private let viewModel = BBWorkoutListViewViewModel()
    
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
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(workoutTableView)
        addConstraints()
        setupTableView()
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
        ])
    }
}
