//
//  BBPhysiqueViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-19.
//

import UIKit

final class BBPhysiqueViewController: UIViewController, BBPhysiqueViewDelegate {
    private let physiqueView = BBPhysiqueView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        
        physiqueView.delegate = self
        view.addSubview(physiqueView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            physiqueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            physiqueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            physiqueView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            physiqueView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
    }
    
    func gotoHomeScreen() {
        let homeVC = BBTabBarController()
        homeVC.navigationItem.largeTitleDisplayMode = .never
        UserDefaults.standard.set(true, forKey: "onBoardongDone")
        self.navigationController?.setViewControllers([homeVC], animated: true)
    }
    
    func displayAlert(_ message: String) {
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
}
