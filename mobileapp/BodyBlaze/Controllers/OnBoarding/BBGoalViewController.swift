//
//  BBGoalViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-19.
//

import UIKit

final class BBGoalViewController: UIViewController, BBGoalViewDelegate {
    private let goalView = BBGoalView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        
        goalView.delegate = self
        view.addSubview(goalView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            goalView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            goalView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            goalView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            goalView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
    }
    
    func goToGenderView() {
        let genderVC = BBGenderViewController()
        genderVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(genderVC, animated: true)
    }
}
