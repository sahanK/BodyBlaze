//
//  BBPlanDurationCollectionViewCell.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-16.
//

import UIKit

final class BBPlanDurationCollectionViewCell: UICollectionViewCell {
    static let identifier = "BBPlanDurationCollectionViewCell"
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(labelView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    public func configure(with viewModel: BBPlanDurationCollectionViewCellViewModel) {
        labelView.text = "\(viewModel.duration)"
    }
}
