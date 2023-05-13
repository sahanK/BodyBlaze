//
//  BBWorkoutPlanDetailViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-09.
//

import Foundation
import UIKit

final class BBWorkoutPlanDetailViewViewModel: NSObject {
    public let workoutPlan: BBWorkoutPlan
    
    init(workoutPlan: BBWorkoutPlan) {
        self.workoutPlan = workoutPlan
    }
}

extension BBWorkoutPlanDetailViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutPlan.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BBWorkoutCell.identifier,
            for: indexPath
        ) as? BBWorkoutCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = BBWorkoutCellViewModel(
            title: workoutPlan.workouts[indexPath.row].name,
            numberOfReps: workoutPlan.workouts[indexPath.row].reps
        )
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
