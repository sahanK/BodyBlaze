//
//  BBCreatePlanViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-15.
//

import UIKit

final class BBCreatePlanViewController: UIViewController, BBCreateWorkoutPlanViewDelegate {
    
    private let createWorkoutPlanView = BBCreateWorkoutPlanView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        title = "Create workout plan"
        
        view.addSubViews(createWorkoutPlanView)
        createWorkoutPlanView.delegate = self
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            createWorkoutPlanView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            createWorkoutPlanView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            createWorkoutPlanView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            createWorkoutPlanView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
    }
    
    func displayWorkoutsList() {
        let workoutsVC = BBWorkoutListViewController()
        workoutsVC.modalPresentationStyle = .pageSheet
        present(workoutsVC, animated: true, completion: nil)
    }
}
