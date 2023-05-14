//
//  BBOnboardingViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-14.
//

import UIKit

final class BBOnboardingViewController: UIViewController {
    private let onBoardingView = BBOnBoardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        
        view.addSubview(onBoardingView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            onBoardingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onBoardingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            onBoardingView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            onBoardingView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
}
