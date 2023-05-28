//
//  BBHomeViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-17.
//

import UIKit

final class BBHomeViewController: UIViewController {
    private let recommendedWorkoutPlanListView = BBWorkoutPlanListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Workout Plans"
        view.backgroundColor = UIColor(named: "GrayScale-100")
        view.addSubview(recommendedWorkoutPlanListView)
        recommendedWorkoutPlanListView.delegate = self
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            recommendedWorkoutPlanListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recommendedWorkoutPlanListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            recommendedWorkoutPlanListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recommendedWorkoutPlanListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
}

extension BBHomeViewController: BBWorkoutPlanListViewDelegate {
    func bbWorkoutPlanListView(_ workoutPlansListView: BBWorkoutPlanListView, selectedPlan workoutPlane: BBWorkoutPlan) {
        let viewModel = BBWorkoutPlanDetailViewViewModel(workoutPlan: workoutPlane)
        let detailVC = BBWorkoutPlanDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
