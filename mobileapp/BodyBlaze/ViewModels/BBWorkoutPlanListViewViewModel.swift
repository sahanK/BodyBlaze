//
//  BBRecommendedWorkoutListViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

final class BBWorkoutPlanListViewViewModel: NSObject {
    
}

extension BBWorkoutPlanListViewViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BBWorkoutPanListCell.identifier) as! BBWorkoutPanListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
