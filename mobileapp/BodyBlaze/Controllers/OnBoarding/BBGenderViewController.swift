//
//  BBGenderViewController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-05-19.
//

import UIKit

final class BBGenderViewController: UIViewController, BBGenderViewDelegate {
    private let genderView = BBGenderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        
        genderView.delegate = self
        view.addSubview(genderView)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            genderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            genderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            genderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            genderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
    }
    
    func gotoPhysiqueView() {
        let physiqueVC = BBPhysiqueViewController()
        physiqueVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(physiqueVC, animated: true)
    }
    
    func displayAlert(_ message: String) {
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
}
