//
//  BBWorkoutPlanPlay.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-11.
//

import youtube_ios_player_helper
import UIKit

protocol BBWorkoutPlanPlayViewDelegate: AnyObject {
    func goBack()
}

final class BBWorkoutPlanPlayView: UIView {
    private var viewModel: BBWorkoutPlanPlayViewViewModel
    
    public weak var delegate: BBWorkoutPlanPlayViewDelegate?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let workoutVideoView: YTPlayerView = {
        let playerView = YTPlayerView()
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.layer.cornerRadius = 10
        playerView.backgroundColor = UIColor(named: "GrayScale-80")
        return playerView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Burpees"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let bodyPartsCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            BBAffetctedBodyPartCollectionViewCell.self,
            forCellWithReuseIdentifier: BBAffetctedBodyPartCollectionViewCell.identifier
        )
        collectionView.backgroundColor = UIColor(named: "GrayScale-100")
        return collectionView
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "x12"
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FINISH", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "Primary")?.cgColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        button.layer.borderColor = UIColor(named: "GrayScale-80")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "previous"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 120)
        button.contentHorizontalAlignment = .center
        button.tintColor = UIColor.white
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.layer.borderColor = UIColor(named: "GrayScale-80")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "next"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 90, bottom: 10, right: 40)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentHorizontalAlignment = .center
        button.tintColor = UIColor.white
        return button
    }()
    
    private let nextWorkoutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Next workout"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let nextWorkoutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "GrayScale-80")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let nextWorkoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "recommended-bg-1")
        return imageView
    }()
    
    private let nextWorkoutNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Burpees"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let nextWorkoutRepsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "32 reps"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    init(frame: CGRect, viewModel: BBWorkoutPlanPlayViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "GrayScale-100")
        
        setupViews()
        addConstraints()
        configure(viewModel: viewModel)
        setupCollectionView()
        
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }
    
    private func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        nextWorkoutView.addSubViews(
            nextWorkoutImageView,
            nextWorkoutNameLabel,
            nextWorkoutRepsLabel
        )
        contentView.addSubViews(
            workoutVideoView,
            nameLabel,
            bodyPartsCollectionView,
            repsLabel,
            finishButton,
            previousButton,
            nextButton,
            nextWorkoutLabel,
            nextWorkoutView
        )
    }
    
    @objc
    private func nextButtonAction() {
        viewModel.setNextWorkout()
        configure(viewModel: viewModel)
    }
    
    @objc
    private func previousButtonAction() {
        viewModel.setPreviousWorkout()
        configure(viewModel: viewModel)
    }
    
    @objc
    private func finishButtonAction() {
        delegate?.goBack()
    }
    
    private func setupCollectionView() {
        bodyPartsCollectionView.delegate = viewModel
        bodyPartsCollectionView.dataSource = viewModel
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 800),
            
            workoutVideoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            workoutVideoView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            workoutVideoView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            workoutVideoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4),
            
            nameLabel.topAnchor.constraint(equalTo: workoutVideoView.bottomAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bodyPartsCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            bodyPartsCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            bodyPartsCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            bodyPartsCollectionView.heightAnchor.constraint(equalToConstant: 40),
            
            repsLabel.topAnchor.constraint(equalTo: bodyPartsCollectionView.bottomAnchor, constant: 20),
            repsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            repsLabel.heightAnchor.constraint(equalToConstant: 50),
            
            finishButton.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 20),
            finishButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            finishButton.heightAnchor.constraint(equalToConstant: 40),
            finishButton.widthAnchor.constraint(equalToConstant: 200),
            
            previousButton.topAnchor.constraint(equalTo: finishButton.bottomAnchor, constant: 20),
            previousButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50),
            previousButton.heightAnchor.constraint(equalToConstant: 40),
            previousButton.widthAnchor.constraint(equalToConstant: 150),
            
            nextButton.topAnchor.constraint(equalTo: finishButton.bottomAnchor, constant: 20),
            nextButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            
            nextWorkoutLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            nextWorkoutLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nextWorkoutLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nextWorkoutView.topAnchor.constraint(equalTo: nextWorkoutLabel.bottomAnchor, constant: 20),
            nextWorkoutView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nextWorkoutView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            nextWorkoutView.heightAnchor.constraint(equalToConstant: 100.0),
            
            nextWorkoutImageView.topAnchor.constraint(equalTo: nextWorkoutView.topAnchor, constant: 7),
            nextWorkoutImageView.bottomAnchor.constraint(equalTo: nextWorkoutView.bottomAnchor, constant: -7),
            nextWorkoutImageView.leftAnchor.constraint(equalTo: nextWorkoutView.leftAnchor, constant: 7),
            nextWorkoutImageView.widthAnchor.constraint(equalToConstant: 86),
            
            nextWorkoutNameLabel.topAnchor.constraint(equalTo: nextWorkoutView.topAnchor, constant: 7),
            nextWorkoutNameLabel.leftAnchor.constraint(equalTo: nextWorkoutImageView.rightAnchor, constant: 10),
            nextWorkoutNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nextWorkoutRepsLabel.topAnchor.constraint(equalTo: nextWorkoutNameLabel.bottomAnchor, constant: 8),
            nextWorkoutRepsLabel.leftAnchor.constraint(equalTo: nextWorkoutImageView.rightAnchor, constant: 10),
            nextWorkoutRepsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configure(viewModel: BBWorkoutPlanPlayViewViewModel) {
        let currentWorkout = viewModel.workoutPlan.workouts[viewModel.currentWorkout]
        if viewModel.currentWorkout < viewModel.workoutPlan.workouts.count {
            nameLabel.text = currentWorkout.name
            repsLabel.text = "x\(currentWorkout.reps)"
            print(currentWorkout.video)
            print(getYouTubeIdFromUrl(url: currentWorkout.video))
            UIView.animate(withDuration: 0.4) {
                self.workoutVideoView.alpha = 0
                self.workoutVideoView.isHidden = true
            }
            
            workoutVideoView.load(withVideoId: getYouTubeIdFromUrl(url: currentWorkout.video))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.4) {
                        self.workoutVideoView.isHidden = false
                        self.workoutVideoView.alpha = 1
                    }
                }
            }
        }
        
        if viewModel.currentWorkout < viewModel.workoutPlan.workouts.count - 1 {
            nextWorkoutLabel.isHidden = false
            nextWorkoutView.isHidden = false
            nextWorkoutNameLabel.text = viewModel.workoutPlan.workouts[viewModel.currentWorkout + 1].name
            nextWorkoutRepsLabel.text = "\(viewModel.workoutPlan.workouts[viewModel.currentWorkout + 1].reps) reps"
            
            viewModel.fetchImage(
                url: viewModel.workoutPlan.workouts[viewModel.currentWorkout + 1].image
            ) { [weak self] result in
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self?.nextWorkoutImageView.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        } else {
            nextWorkoutLabel.isHidden = true
            nextWorkoutView.isHidden = true
        }
        
        bodyPartsCollectionView.reloadData()
    }
}
