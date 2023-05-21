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
    func didLoadWorkouts()
}

final class BBWorkoutListViewViewModel: NSObject {
    public weak var delegate: BBWorkoutListViewViewModelDelegate?
    
    private var workouts: [BBWorkout] = [] {
        didSet {
            for workout in workouts {
                let viewModel = BBWorkoutCellViewModel(
                    title: workout.name,
                    numberOfReps: workout.reps,
                    imageUrl: workout.image
                )
                
                if !workoutCellViewModels.contains(viewModel) {
                    workoutCellViewModels.append(viewModel)
                }
            }
        }
    }
    
    private var workoutCellViewModels: [BBWorkoutCellViewModel] = []
    
    func fetchWorkouts() {
        BBService.shared.execute(
            .workouts,
            expecting: BBGetAllWorkoutsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let response):
                self?.workouts = response.data
                DispatchQueue.main.async {
                    self?.delegate?.didLoadWorkouts()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
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
        let viewModel = workoutCellViewModels[indexPath.row]
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
