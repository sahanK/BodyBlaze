//
//  BBCustomWorkoutPlanListViewCell.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-20.
//

import UIKit

final class BBCustomWorkoutPlanListViewCell: UICollectionViewCell {
    static let identifier = "BBCustomWorkoutPlanListViewCell"
    
    private let workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "WorkoutPlanDefault")
        imageView.backgroundColor = UIColor(named: "GrayScale-60")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My schedule 1"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let exercisesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12 Exercises"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(named: "GrayScale-20")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "GrayScale-80")
        layer.cornerRadius = 15
        contentView.addSubViews(workoutImageView, nameLabel, exercisesLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder)")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            workoutImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            workoutImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            workoutImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -80),
            
            nameLabel.topAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            exercisesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            exercisesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            exercisesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            exercisesLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: BBWorkoutPlanListViewCellViewModel) {
        nameLabel.text = viewModel.title
        exercisesLabel.text = "\(viewModel.numberOfWorkouts) exercises"
    }
}
