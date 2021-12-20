//
//  HomeViewController.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 13/12/2021.
//

import UIKit
import SwiftUI

class WelcomeViewController: UIViewController {
    
    //MARK: Properties
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height-150, width: view.frame.size.width-40, height: 50))
        button.titleLabel?.font = UIFont.chalkduster(fontSize: 35)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor.recipleasePantone(color: .greenReciplease)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private lazy var welcomeContainer: UIView = {
        let container = UIView(frame: CGRect(x: 10, y: 50, width: view.frame.size.width-20, height: 100))
        container.backgroundColor = UIColor.recipleasePantone(color: .greenReciplease)
        container.layer.cornerRadius = 20
        container.addSubview(welcomeText)
        return container
    }()
    
    private lazy var welcomeText: UILabel = {
        let welcome = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width-20, height: 100))
        welcome.text = "Welcome to Reciplease App!"
        welcome.textAlignment = .center
        welcome.numberOfLines = 0
        welcome.font = UIFont.chalkduster(fontSize: 30)
        welcome.textColor = UIColor.white
       
        return welcome
    }()
    
    private lazy var descApp: UILabel = {
        let desc = UILabel()
        desc.text = "Here, You can search for recipes using ingredients at your disposal but also register your favorite recipes."
        desc.textAlignment = .center
        desc.numberOfLines = 0
        desc.font = UIFont.chalkduster(fontSize: 20)
        desc.textColor = UIColor.white
        desc.translatesAutoresizingMaskIntoConstraints = false 
        return desc
    }()
    
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.recipleasePantone(color: .chalkBoardBackground)
        goTheTabBar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(welcomeContainer)
        view.addSubview(descApp)
        view.addSubview(button)
        WelcomeMainView.shared.labelLayoutConstraints(label: descApp, vc: view)
    }
    
    func goTheTabBar() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        CoreOnboarding.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
    }
    
}
