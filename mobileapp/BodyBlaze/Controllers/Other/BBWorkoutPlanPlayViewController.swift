//
//  BBWorkoutPlanPlayViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-10.
//

import UIKit

final class BBWorkoutPlanPlayViewController: UIViewController {
    private let workoutPlanPlayView: BBWorkoutPlanPlayView
    
    init() {
        let viewModel = BBWorkoutPlanPlayViewViewModel()
        self.workoutPlanPlayView = BBWorkoutPlanPlayView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }

    override func viewDidLoad() {
        title = "Workout Plan"
        super.viewDidLoad()
        
        view.addSubViews(workoutPlanPlayView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutPlanPlayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            workoutPlanPlayView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            workoutPlanPlayView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            workoutPlanPlayView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
}
