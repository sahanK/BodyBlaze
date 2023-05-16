//
//  BBCreateWorkoutPlanViewViewModel.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import Foundation
import UIKit

final class BBCreateWorkoutPlanViewViewModel: NSObject {
    static let shared = BBCreateWorkoutPlanViewViewModel()
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        return CGSize(
            width: bounds.width * 0.2,
            height: bounds.width * 0.2
        )
    }
}
