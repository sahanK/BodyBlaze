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
                    imageUrl: "https://post.healthline.com/wp-content/uploads/2020/02/man-exercising-plank-push-up-1200x628-facebook.jpg"
                )
                
                if !workoutPlanCellViewModels.contains(viewModel) {
                    workoutPlanCellViewModels.append(viewModel)
                }
            }
        }
    }
    
    private var workoutPlanCellViewModels: [BBWorkoutPlanListViewCellViewModel] = []
    
    public func fetchWorkoutPlans() {
        guard let customPlans = BBFileManager.shared.readData(expecting: [BBWorkoutPlan].self) else {
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

extension BBCustomWorkoutPlanListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutPlanCellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BBCustomWorkoutPlanListViewCell.identifier,
            for: indexPath
        ) as? BBCustomWorkoutPlanListViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = workoutPlanCellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.width * 0.8
        return CGSize(width: width, height: width * 0.9)
    }
}
