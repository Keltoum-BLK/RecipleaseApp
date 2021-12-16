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
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 35)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(red: 43/255, green: 95/255, blue: 59/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private lazy var welcomeText: UILabel = {
        let welcome = UILabel(frame: CGRect(x: 10, y: 70, width: view.frame.size.width-20, height: 120))
        welcome.text = "Welcome to Reciplease App!"
        welcome.textAlignment = .center
        welcome.backgroundColor = UIColor(red: 43/255, green: 95/255, blue: 59/255, alpha: 1)
        welcome.layer.cornerRadius = 20
        welcome.numberOfLines = 0
        welcome.font = UIFont(name: "chalkduster", size: 30)
        welcome.textColor = UIColor.white
       
        return welcome
    }()
    
    private lazy var descApp: UILabel = {
        let desc = UILabel()
        desc.text = "Here, You can search for recipes using ingredients at your disposal but also register your favorite recipes."
        desc.textAlignment = .center
        desc.numberOfLines = 0
        desc.font = UIFont(name: "chalkduster", size: 20)
        desc.textColor = UIColor.white
       
        return desc
    }()
    
    private lazy var stack:UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fillProportionally
        s.alignment = .fill
        s.spacing = 50
        s.addArrangedSubview(self.descApp)
        s.addArrangedSubview(self.button)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        goTheTabBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(welcomeText)
        view.addSubview(stack)
        WelcomeVCLayout.sharedWVC.stackLayoutConstraints(myStack: stack, vc: view)
    }
    
    func goTheTabBar() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        CoreOnboarding.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
    }
    
}
