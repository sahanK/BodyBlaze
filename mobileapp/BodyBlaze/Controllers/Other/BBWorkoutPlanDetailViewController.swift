//
//  BBWorkoutDetailViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-08.
//

import UIKit

final class BBWorkoutPlanDetailViewController: UIViewController, BBWorkoutPlanDetailViewDelegate {
    private var workoutPlanDetailView: BBWorkoutPlanDetailView
    
    init() {
        let viewModel = BBWorkoutPlanDetailViewViewModel(workoutPlan: workoutPlansData[0])
        self.workoutPlanDetailView = BBWorkoutPlanDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Workout Plan"
        workoutPlanDetailView.delegate = self
        view.addSubview(workoutPlanDetailView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutPlanDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            workoutPlanDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            workoutPlanDetailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            workoutPlanDetailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    func bbWorkoutPlanDetailView(_ workoutPlanDetailView: BBWorkoutPlanDetailView, selectedPlan workoutPlan: BBWorkoutPlan) {
        let playVC = BBWorkoutPlanPlayViewController()
        playVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(playVC, animated: true)
    }
}
