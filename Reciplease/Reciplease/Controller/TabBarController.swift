//
//  TabBar.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if CoreOnboarding.shared.isNewUser() {
            let welcomeVC = WelcomeViewController()
            welcomeVC.modalPresentationStyle = .formSheet
            welcomeVC.modalTransitionStyle = .coverVertical
            present(welcomeVC, animated: true)
        }
    }
    func setupVCs() {
       
        viewControllers = [createNavController(for: SearchingVC(), title: NSLocalizedString("Searching", comment: "")), createNavController(for: RecipesVC(), title: NSLocalizedString("Favorites", comment: ""))]
        self.setViewControllers(viewControllers, animated: false)
        
        setupTabBar()
    }
    

    func setupTabBar() {
        //set the font title
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any], for: .selected)
        
        //set the title color
        tabBar.tintColor = .white
        tabBar.barTintColor = .lightGray
        //position of elements in tab bar
    
        tabBar.itemPositioning = .fill
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        //set the transition style
        self.modalPresentationStyle = .fullScreen
        
        if #available(iOS 15.0, *) {
            tabBar.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        }
    
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        rootViewController.navigationItem.title = "Reciplease"
        navController.navigationBar.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any, NSAttributedString.Key.foregroundColor: UIColor(.white)]
        return navController
    }
    
}
