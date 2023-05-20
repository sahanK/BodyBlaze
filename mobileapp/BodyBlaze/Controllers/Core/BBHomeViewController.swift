//
//  BBHomeViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-17.
//

import UIKit

final class BBHomeViewController: UIViewController {
    private let homeView = BBHomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Welcome"
        view.backgroundColor = UIColor(named: "GrayScale-100")
        homeView.customWorkoutList.delegate = self
        homeView.workoutsList.delegate = self
        view.addSubViews(homeView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension BBHomeViewController: BBWorkoutPlanListViewDelegate, BBCustomWorkoutPlanListViewDelegate {
    func bbWorkoutPlanListView(_ workoutPlansListView: BBWorkoutPlanListView, selectedPlan workoutPlane: BBWorkoutPlan) {
        let viewModel = BBWorkoutPlanDetailViewViewModel(workoutPlan: workoutPlane)
        let detailVC = BBWorkoutPlanDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func goToCreateScreen() {
        let createPlanVC = BBCreatePlanViewController()
        createPlanVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(createPlanVC, animated: true)
    }
    
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan) {
        let viewModel = BBWorkoutPlanDetailViewViewModel(workoutPlan: workoutPlan)
        let detailVC = BBWorkoutPlanDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
