//
//  BBWorkoutListViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import UIKit

final class BBWorkoutListViewController: UIViewController {
    private let workoutListView = BBWorkoutListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        
        view.addSubview(workoutListView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            workoutListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            workoutListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            workoutListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
    }
}
