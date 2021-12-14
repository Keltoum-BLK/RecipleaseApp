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
        let welcome = UILabel()
        welcome.text = "Welcome to the Reciplease app! \n\nHere, You can search for recipes using ingredients at your disposal but also register your favorite recipes."
        welcome.textAlignment = .center
        welcome.numberOfLines = 0
        welcome.font = UIFont(name: "Chalkduster", size: 20)
        welcome.textColor = UIColor.white
       
        return welcome
    }()
    
    private lazy var stack:UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fillProportionally
        s.alignment = .fill
        s.spacing = 40
        s.addArrangedSubview(self.welcomeText)
        s.addArrangedSubview(self.button)
        s.translatesAutoresizingMaskIntoConstraints = false
        
        return s
    }()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(stack)
        WelcomeVCLayout.sharedWVC.stackLayoutConstraints(myStack: stack, vc: view)
    }
    
    @objc func didTapButton() {
        present(TabBarController(), animated: true)
    }
    
}
