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
    
    func setupVCs() {
       
        viewControllers = [createNavController(for: SearchingVC(), title: NSLocalizedString("Searching", comment: "")), createNavController(for: FavoritesVC(), title: NSLocalizedString("Favorites", comment: ""))]
        self.setViewControllers(viewControllers, animated: false)
        
        setupTabBar()
    }
    

    func setupTabBar() {
        //set the font title
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "chalkduster", size: 25) as Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "chalkduster", size: 25) as Any], for: .selected)
        
        //set the title color
        tabBar.tintColor = .white
        tabBar.barTintColor = .lightGray
        
        //set the transition style
        self.modalPresentationStyle = .fullScreen
        self.modalTransitionStyle = .partialCurl
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().isTranslucent = false
            tabBar.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1 )
        }
    
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        rootViewController.navigationItem.title = "Reciplease"
        navController.navigationBar.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "chalkduster", size: 25) as Any, NSAttributedString.Key.foregroundColor: UIColor(.white)]
       
        return navController
    }
    
}
