//
//  WelcomeVCLayout.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import Foundation
import UIKit

class WelcomeMainView {
    //MARK: Properties
    static var shared = WelcomeMainView()
    //MARK: Init
    private init() {}
    //MARK: Constraints 
   func labelLayoutConstraints(label: UILabel, vc: UIView) {
        label.centerXAnchor.constraint(equalTo: vc.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: vc.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: vc.widthAnchor, multiplier: 0.8).isActive = true
    }
    

    
}
