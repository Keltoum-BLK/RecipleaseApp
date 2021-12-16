//
//  CoreOnboarding.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 16/12/2021.
//

import Foundation

class CoreOnboarding {
    
    static let shared = CoreOnboarding()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
