//
//  BBWorkoutPlanDetailView.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-09.
//

import UIKit

protocol BBWorkoutPlanDetailViewDelegate: AnyObject {
    func bbWorkoutPlanDetailView(
        _ workoutPlanDetailView: BBWorkoutPlanDetailView,
        selectedPlan workoutPlan: BBWorkoutPlan
    )
}

final class BBWorkoutPlanDetailView: UIView {
    public weak var delegate: BBWorkoutPlanDetailViewDelegate?
    
    private var viewModel: BBWorkoutPlanDetailViewViewModel
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "recommended-bg-1")
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 5
        return label
    }()
    
    private let numberOfWorkoutsLabel: UILabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12 workouts"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = UIColor(named: "GrayScale-80")
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.paddingLeft = 16
        label.paddingRight = 16
        label.paddingTop = 12
        label.paddingBottom = 12
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2 weeks"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = UIColor(named: "GrayScale-80")
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.paddingLeft = 16
        label.paddingRight = 16
        label.paddingTop = 12
        label.paddingBottom = 12
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("START", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            BBWorkoutCell.self,
            forCellReuseIdentifier: BBWorkoutCell.identifier
        )
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "GrayScale-100")
        return tableView
    }()
    
    init(frame: CGRect, viewModel: BBWorkoutPlanDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "GrayScale-100")
        
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        
        addSubViews(
            imageView,
            descriptionLabel,
            numberOfWorkoutsLabel,
            durationLabel,
            startButton,
            tableView
        )
        addConstraints()
        
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    @objc func startAction() {
        delegate?.bbWorkoutPlanDetailView(self, selectedPlan: viewModel.workoutPlan)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.25),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            numberOfWorkoutsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            numberOfWorkoutsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            numberOfWorkoutsLabel.rightAnchor.constraint(equalTo: durationLabel.leftAnchor, constant: -10),
            
            durationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            durationLabel.leftAnchor.constraint(equalTo: numberOfWorkoutsLabel.rightAnchor, constant: 10),
            
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.topAnchor.constraint(equalTo: numberOfWorkoutsLabel.bottomAnchor, constant: 16),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            
            tableView.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
        ])
    }
}
