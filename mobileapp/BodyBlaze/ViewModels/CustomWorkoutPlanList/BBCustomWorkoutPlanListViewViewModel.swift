//
//  BBCustomWorkoutPlanListViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-20.
//

import UIKit

final class BBCustomWorkoutPlanListViewViewModel: NSObject {
    
}

extension BBCustomWorkoutPlanListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BBCustomWorkoutPlanListViewCell.identifier,
            for: indexPath
        ) as! BBCustomWorkoutPlanListViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.width * 0.8
        return CGSize(width: width, height: width * 0.9)
    }
}
