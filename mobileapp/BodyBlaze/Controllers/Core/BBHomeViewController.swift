//
//  BBHomeViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-17.
//

import UIKit

final class BBHomeViewController: UIViewController, BBWorkoutPlanListViewDelegate {
    
    private let homeView = BBHomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "GrayScale-100")
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
    
    func bbWorkoutPlanListView(_ workoutPlansListView: BBWorkoutPlanListView, selectedPlan workoutPlane: BBWorkoutPlan) {
        let detailVC = BBWorkoutPlanDetailViewController()
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
