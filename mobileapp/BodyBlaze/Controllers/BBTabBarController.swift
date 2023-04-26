//
//  BBTabBarController.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-18.
//

import UIKit

final class BBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "GrayScale-100")
        self.tabBar.backgroundColor = UIColor(named: "GrayScale-100")
        
        setupTabs()
    }
    
    private func setupTabs() {
        let homeVC = BBHomeViewController()
        let profileVC = BBProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: profileVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        nav1.navigationBar.isHidden = true
        
        setViewControllers([nav1, nav2], animated: true)
    }
}
