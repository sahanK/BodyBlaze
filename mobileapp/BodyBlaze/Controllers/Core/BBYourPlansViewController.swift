//
//  BBCustomWorkoutPlansViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-28.
//

import UIKit

class BBYourPlansViewController: UIViewController, BBCustomWorkoutPlanListViewDelegate {
    private let customWorkoutPlansView = BBCustomWorkoutPlanListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Your Plans"
        view.backgroundColor = UIColor(named: "GrayScale-100")
        view.addSubview(customWorkoutPlansView)
        customWorkoutPlansView.delegate = self
        addConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(createButtonAction))
    }
    
    @objc
    private func createButtonAction() {
        goToCreateScreen()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            customWorkoutPlansView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customWorkoutPlansView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            customWorkoutPlansView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            customWorkoutPlansView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension BBYourPlansViewController {
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
