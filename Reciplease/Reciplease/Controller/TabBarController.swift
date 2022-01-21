//
//  TabBar.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import UIKit

class TabBarController: UITabBarController {
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if CoreOnboarding.isNewUser() {
            let welcomeVC = WelcomeViewController()
            welcomeVC.modalPresentationStyle = .formSheet
            welcomeVC.modalTransitionStyle = .coverVertical
            present(welcomeVC, animated: true)
        }
    }
    //MARK: Methods
    func setupVCs() {
        viewControllers = [createNavController(for: SearchingVC(), title: NSLocalizedString("Searching", comment: "")), createNavController(for: FavoritesViewController(), title: NSLocalizedString("Favorites", comment: ""))]
        self.setViewControllers(viewControllers, animated: false)
        setUpTabBar()
    }
    
    func setUpTabBar() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            let tabBarItemAppearance = UITabBarItemAppearance()
            tabBarItemAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
            tabBarItemAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any]
            tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any]
            appearance.stackedLayoutAppearance = tabBarItemAppearance
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
        //set the font title
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any], for: .selected)
        
        //set the title color
        tabBar.tintColor = .white
        tabBar.barTintColor = .lightGray
        tabBar.itemWidth = 30
        tabBar.itemPositioning = .centered
        //position of elements in tab bar
        tabBar.itemPositioning = .fill
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        //set the transition style
        self.modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String) -> UIViewController {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any, NSAttributedString.Key.foregroundColor: UIColor.recipleasePantone(color: .whiteReciplease)]
            navigationBarAppearance.backgroundColor = .recipleasePantone(color: .chalkBoardBackground)
        }
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.navigationItem.backButtonTitle = "Back"
        rootViewController.navigationItem.title = "Reciplease"
        navController.navigationBar.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.chalkduster(fontSize: 25) as Any, NSAttributedString.Key.foregroundColor: UIColor(.white)]
        return navController
    }
}
