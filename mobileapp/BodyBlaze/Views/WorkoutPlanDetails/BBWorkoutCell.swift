//
//  WorkoutCellView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-09.
//

import UIKit

class BBWorkoutCell: UITableViewCell {
    static let identifier = "BBWorkoutCellView"
    
    private let workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "recommended-bg-1")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Burpees"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "32 reps"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "GrayScale-100")
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = UIColor(named: "GrayScale-80")
        contentView.layer.masksToBounds = true
        contentView.addSubViews(workoutImageView, nameLabel, repsLabel)
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
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            workoutImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            workoutImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            workoutImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            workoutImageView.widthAnchor.constraint(equalToConstant: 76),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            nameLabel.leftAnchor.constraint(equalTo: workoutImageView.rightAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            repsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            repsLabel.leftAnchor.constraint(equalTo: workoutImageView.rightAnchor, constant: 10),
            repsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    public func configure(with viewModel: BBWorkoutCellViewModel) {
        nameLabel.text = viewModel.title
        repsLabel.text = "\(viewModel.numberOfReps) reps"
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.workoutImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }

}
