//
//  WelcomeVCLayout.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/12/2021.
//

import Foundation
import UIKit

class WelcomeVCLayout {
    
    static var sharedWVC = WelcomeVCLayout()
    private init() {}
    
    func stackLayoutConstraints(myStack: UIStackView, vc: UIView) {
        myStack.centerXAnchor.constraint(equalTo: vc.centerXAnchor).isActive = true
        myStack.centerYAnchor.constraint(equalTo: vc.centerYAnchor).isActive = true
        myStack.widthAnchor.constraint(equalTo: vc.widthAnchor, multiplier: 0.8).isActive = true
    }
    

    
}
