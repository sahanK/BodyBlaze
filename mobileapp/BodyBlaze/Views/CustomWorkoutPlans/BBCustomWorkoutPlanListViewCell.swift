//
//  BBCustomWorkoutPlanListViewCell.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-20.
//

import UIKit

final class BBCustomWorkoutPlanListViewCell: UITableViewCell {
    static let identifier = "BBCustomWorkoutPlanListViewCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(named: "GrayScale-80")
        return view
    }()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "GrayScale-100")
        layer.cornerRadius = 15
        setupSubViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder)")
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
    }
    
    private func setupSubViews() {
        containerView.addSubViews(workoutImageView, nameLabel, exercisesLabel)
        contentView.addSubview(containerView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            workoutImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 7),
            workoutImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            workoutImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7),
            workoutImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -80),
            
            nameLabel.topAnchor.constraint(equalTo: workoutImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            exercisesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            exercisesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 7),
            exercisesLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -7),
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
