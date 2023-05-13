//
//  BBRecommendedWorkoutListCell.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-19.
//

import UIKit

final class BBWorkoutPanListCell: UITableViewCell {
    static let identifier = "BBWorkoutPanListCell"
    
    private let bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "recommended-bg-1")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Full body workout for beginners"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let numberOfWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12 workouts"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4 weeks"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let gradientLayer = CAGradientLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "GrayScale-100")
        
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 1]
        bgImage.layer.addSublayer(gradientLayer)
        contentView.addSubViews(
            bgImage,
            titleLabel,
            durationLabel,
            numberOfWorkoutsLabel
        )
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        gradientLayer.frame = bounds
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            durationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            durationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            numberOfWorkoutsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            numberOfWorkoutsLabel.leftAnchor.constraint(equalTo: durationLabel.rightAnchor, constant: 10),
            numberOfWorkoutsLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

}
