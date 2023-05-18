//
//  BBCreateWorkoutPlanViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import Foundation
import UIKit

protocol BBCreateWorkoutPlanViewViewModelDelegate: AnyObject {
    func didAddedWorkout()
}

final class BBCreateWorkoutPlanViewViewModel: NSObject {
    public weak var delegate: BBCreateWorkoutPlanViewViewModelDelegate?
    
    static let shared = BBCreateWorkoutPlanViewViewModel()
    
    public var selectedWorkouts: [BBWorkout] = [] {
        didSet {
            delegate?.didAddedWorkout()
        }
    }
    public var selectedDuration: Int = 3
    
    public func createPlan(name: String) {
        let newPlan = BBWorkoutPlan(
            _id: UUID().uuidString,
            name: name,
            duration: selectedDuration,
            workouts: selectedWorkouts
        )
        guard var currentPlans = BBFileManager.shared.readData(expecting: [BBWorkoutPlan].self) else {
            let newPlans = [newPlan]
            BBFileManager.shared.writeData(data: newPlans)
            selectedWorkouts = []
            selectedDuration = 3
            print("DEBUG:: data write successfull")
            BBCustomWorkoutPlanListViewViewModel.shared.addNewWorkoutPlan(newPlan)
            return
        }
        currentPlans.append(newPlan)
        BBFileManager.shared.writeData(data: currentPlans)
        selectedWorkouts = []
        selectedDuration = 3
        BBCustomWorkoutPlanListViewViewModel.shared.addNewWorkoutPlan(newPlan)
        print("DEBUG:: data write successfull")
    }
}

extension BBCreateWorkoutPlanViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BBPlanDurationCollectionViewCell.identifier,
            for: indexPath
        ) as? BBPlanDurationCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.backgroundColor = UIColor(named: "GrayScale-60")
        cell.layer.cornerRadius = 10
        let viewModel = BBPlanDurationCollectionViewCellViewModel(duration: indexPath.row + 1)
        cell.configure(with: viewModel)
        if indexPath.row + 1 == selectedDuration {
            cell.backgroundColor = UIColor(named: "Primary")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        return CGSize(
            width: bounds.width * 0.2,
            height: bounds.width * 0.2
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(
            at: IndexPath(
                item: selectedDuration-1,
                section: 0
            ))?.backgroundColor = UIColor(named: "GrayScale-60")
        collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(named: "Primary")
        selectedDuration = indexPath.row + 1
    }
}

extension BBCreateWorkoutPlanViewViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedWorkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BBWorkoutCell.identifier,
            for: indexPath
        ) as? BBWorkoutCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = BBWorkoutCellViewModel(
            title: selectedWorkouts[indexPath.row].name,
            numberOfReps: selectedWorkouts[indexPath.row].reps
        )
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
