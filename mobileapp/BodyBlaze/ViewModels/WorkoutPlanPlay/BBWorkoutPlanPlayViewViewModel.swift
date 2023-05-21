//
//  BBWorkoutPlanPlayViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-11.
//

import Foundation
import UIKit

final class BBWorkoutPlanPlayViewViewModel: NSObject {
    public let workoutPlan: BBWorkoutPlan
    
    public var currentWorkout: Int
    
    init(workoutPlan: BBWorkoutPlan) {
        self.workoutPlan = workoutPlan
        self.currentWorkout = 0
    }
    
    public func setNextWorkout() {
        if currentWorkout < workoutPlan.workouts.count - 1 {
            currentWorkout += 1
        }
    }
    
    public func setPreviousWorkout() {
        if currentWorkout > 0 {
            currentWorkout -= 1
        }
    }
    
    public func fetchImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        BBImageLoader.shared.downloadImage(url, completion: completion)
    }
}

extension BBWorkoutPlanPlayViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutPlan.workouts[currentWorkout].bodyParts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BBAffetctedBodyPartCollectionViewCell.identifier,
            for: indexPath
        ) as? BBAffetctedBodyPartCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = BBAffetctedBodyPartCollectionViewCellViewModel(
            bodyPart: workoutPlan.workouts[currentWorkout].bodyParts[indexPath.row]
        )
        cell.configure(viewModel: viewModel)
        return cell
    }
}

