//
//  BBWorkoutListViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import UIKit

final class BBWorkoutListViewController: UIViewController, BBWorkoutListViewDelegate {
    
    private let workoutListView = BBWorkoutListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        
        view.addSubview(workoutListView)
        addConstraints()
        workoutListView.delegate = self
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            workoutListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            workoutListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            workoutListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
    }
    
    func didSelectWorkout(_ workout: BBWorkout) {
        let alertController = UIAlertController(title: "Enter number of reps", message: nil, preferredStyle: .alert)
        alertController.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) {[unowned alertController] _ in
            let reps = alertController.textFields![0]
            guard let repsCount = reps.text else { return }
            var newWorkout = workout
            newWorkout.reps = Int(repsCount) ?? 0
            BBCreateWorkoutPlanViewViewModel.shared.selectedWorkouts.append(newWorkout)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
}
