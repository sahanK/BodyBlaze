//
//  BBHomeViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-17.
//

import UIKit

final class BBHomeViewController: UIViewController {
    private let homeView = BBHomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubViews(homeView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
