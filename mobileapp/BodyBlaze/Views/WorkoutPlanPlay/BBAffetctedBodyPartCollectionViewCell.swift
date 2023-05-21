//
//  BBAffetctedBodyPartCollectionViewCell.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-21.
//

import UIKit

class BBAffetctedBodyPartCollectionViewCell: UICollectionViewCell {
    static let identifier = "BBAffetctedBodyPartCollectionViewCell"
    
    private let bodyPartLabel: UILabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Arms"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = UIColor(named: "GrayScale-80")
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.paddingLeft = 8
        label.paddingRight = 8
        label.paddingTop = 6
        label.paddingBottom = 6
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bodyPartLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            bodyPartLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            bodyPartLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bodyPartLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bodyPartLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    public func configure(viewModel: BBAffetctedBodyPartCollectionViewCellViewModel) {
        self.bodyPartLabel.text = viewModel.bodyPart
    }
}
