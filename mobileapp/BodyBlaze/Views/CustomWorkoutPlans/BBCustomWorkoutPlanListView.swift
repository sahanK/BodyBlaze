//
//  BBCustomWorkoutPlanListView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-20.
//

import UIKit

final class BBCustomWorkoutPlanListView: UIView {
    private let viewModel = BBCustomWorkoutPlanListViewViewModel()
    
    private let containerVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let yourPlansLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your plans"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            BBCustomWorkoutPlanListViewCell.self,
            forCellWithReuseIdentifier: BBCustomWorkoutPlanListViewCell.identifier
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "GrayScale-100")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor =  UIColor(named: "GrayScale-100")
        
        setupSubViews()
        addSubViews(containerVStack)
        addConstraints()
        viewModel.fetchWorkoutPlans()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
    
    private func setupSubViews() {
        containerVStack.addArrangedSubview(yourPlansLabel)
        containerVStack.addArrangedSubview(collectionView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerVStack.topAnchor.constraint(equalTo: topAnchor),
            containerVStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerVStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerVStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            yourPlansLabel.topAnchor.constraint(equalTo: containerVStack.topAnchor),
            yourPlansLabel.leadingAnchor.constraint(equalTo: containerVStack.leadingAnchor),
            yourPlansLabel.trailingAnchor.constraint(equalTo: containerVStack.trailingAnchor),
            yourPlansLabel.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.leadingAnchor.constraint(equalTo: containerVStack.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: containerVStack.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerVStack.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}
