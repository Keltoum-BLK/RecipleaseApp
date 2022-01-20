//
//  AlertManager.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 20/01/2022.
//

import Foundation
import UIKit
import SwiftUI

class AlertManager {
    static let sharedAlert = AlertManager()

    
    func alertWhenErrorAppear(title: String, message: String, vc: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
    }
    func alertServerAccess(title: String, message: String, vc: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
    }


}

