//
//  BBWorkoutListViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import Foundation
import UIKit

protocol BBWorkoutListViewViewModelDelegate: AnyObject {
    func didSelectWorkout(_ workout: BBWorkout)
}

final class BBWorkoutListViewViewModel: NSObject {
    public weak var delegate: BBWorkoutListViewViewModelDelegate?
    
    public let workouts = workoutsData
}

extension BBWorkoutListViewViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BBWorkoutCell.identifier,
            for: indexPath
        ) as? BBWorkoutCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = BBWorkoutCellViewModel(
            title: workouts[indexPath.row].name,
            numberOfReps: workouts[indexPath.row].reps,
            imageUrl: ""
        )
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectWorkout(workouts[indexPath.row])
    }
}
