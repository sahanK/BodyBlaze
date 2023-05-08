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
    
    private var workoutPlans: [BBWorkoutPlan] = workoutPlansData
}

extension BBWorkoutPlanListViewViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BBWorkoutPanListCell.identifier) as! BBWorkoutPanListCell
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
