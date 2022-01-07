//
//  CoreOnboarding.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 16/12/2021.
//

import Foundation

class CoreOnboarding {
    
    static func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: Constants.newUser)
    }
    
    static func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: Constants.newUser)
    }
}
