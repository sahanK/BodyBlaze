//
//  BBCustomWorkoutPlanListViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-20.
//

import UIKit

protocol BBCustomWorkoutPlanListViewViewModelDelegate: AnyObject {
    func newWorkoutCreated()
    func displayInitialView(isEmptyList: Bool)
    func didSelectWorkoutPlan(_ workoutPlan: BBWorkoutPlan)
}

final class BBCustomWorkoutPlanListViewViewModel: NSObject {
    public weak var delegate: BBCustomWorkoutPlanListViewViewModelDelegate?
    
    static let shared = BBCustomWorkoutPlanListViewViewModel()
    
    private var workoutPlans: [BBWorkoutPlan] = [] {
        didSet {
            for workoutPlan in workoutPlans {
                let viewModel = BBWorkoutPlanListViewCellViewModel(
                    title: workoutPlan.name,
                    numberOfWorkouts: workoutPlan.workouts.count,
                    duration: workoutPlan.duration,
                    imageUrl: "https://post.healthline.com/wp-content/uploads/2020/02/man-exercising-plank-push-up-1200x628-facebook.jpg",
                    description: workoutPlan.description ?? ""
                )
                
                if !workoutPlanCellViewModels.contains(viewModel) {
                    workoutPlanCellViewModels.append(viewModel)
                }
            }
        }
    }
    
    private var workoutPlanCellViewModels: [BBWorkoutPlanListViewCellViewModel] = []
    
    public func fetchWorkoutPlans() {
        guard let customPlans = BBFileManager.shared.readData(
            expecting: [BBWorkoutPlan].self,
            fileName: CUSTOM_PLANS_DATA_FILE
        ) else {
            delegate?.displayInitialView(isEmptyList: true)
            return
        }
        workoutPlans = customPlans
        delegate?.displayInitialView(isEmptyList: false)
    }
    
    public func addNewWorkoutPlan(_ newPlan: BBWorkoutPlan) {
        workoutPlans.append(newPlan)
        delegate?.newWorkoutCreated()
    }
}

extension BBCustomWorkoutPlanListViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutPlanCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BBCustomWorkoutPlanListViewCell.identifier,
            for: indexPath
        ) as? BBCustomWorkoutPlanListViewCell else {
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
