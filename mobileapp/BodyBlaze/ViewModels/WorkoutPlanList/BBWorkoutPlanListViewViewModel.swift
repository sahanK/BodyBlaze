//
//  BBRecommendedWorkoutListViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

protocol BBWorkoutPlanListViewModelDelegate: AnyObject {
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan)
}

final class BBWorkoutPlanListViewViewModel: NSObject {
    public weak var delegate: BBWorkoutPlanListViewModelDelegate?
    
    private var workoutPlans: [BBWorkoutPlan] = [] {
        didSet {
            for workoutPlan in workoutPlans {
                let viewModel = BBWorkoutPlanListViewCellViewModel(
                    title: workoutPlan.name,
                    numberOfWorkouts: workoutPlan.workouts.count,
                    duration: workoutPlan.duration,
                    imageUrl: "https://post.healthline.com/wp-content/uploads/2020/02/man-exercising-plank-push-up-1200x628-facebook.jpg"
                )
                
                workoutPlanCellViewModels.append(viewModel)
            }
        }
    }
    
    private var workoutPlanCellViewModels: [BBWorkoutPlanListViewCellViewModel] = []
    
    public func fetchWorkoutPlans() {
        workoutPlans = workoutPlansData
    }
}

extension BBWorkoutPlanListViewViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BBWorkoutPanListCell.identifier
        ) as? BBWorkoutPanListCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = workoutPlanCellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let workoutPlan = workoutPlans[indexPath.row]
        delegate?.didSelectWorkoutPlan(workoutPlan)
    }
}
