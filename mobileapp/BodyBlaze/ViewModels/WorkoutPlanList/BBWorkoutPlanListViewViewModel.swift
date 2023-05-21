//
//  BBRecommendedWorkoutListViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

protocol BBWorkoutPlanListViewModelDelegate: AnyObject {
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan)
    func didLoadWorkoutPlans()
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
                    imageUrl: workoutPlan.image ?? "",
                    description: workoutPlan.description ?? ""
                )
                
                workoutPlanCellViewModels.append(viewModel)
            }
        }
    }
    
    private var workoutPlanCellViewModels: [BBWorkoutPlanListViewCellViewModel] = []
    
    public func fetchWorkoutPlans() {
        BBService.shared.execute(
            .workoutPlans,
            expecting: BBGetAllWorkoutPlansResponse.self) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.workoutPlans = response.data
                    DispatchQueue.main.async {
                        self?.delegate?.didLoadWorkoutPlans()
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
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
