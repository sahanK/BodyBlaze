//
//  BBWorkoutPlanDetailViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-09.
//

import Foundation
import UIKit

final class BBWorkoutPlanDetailViewViewModel: NSObject {
    private let workoutPlan: BBWorkoutPlan
    
    init(workoutPlan: BBWorkoutPlan) {
        self.workoutPlan = workoutPlan
    }
}

extension BBWorkoutPlanDetailViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: BBWorkoutCell.identifier,
            for: indexPath
        ) as! BBWorkoutCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
