//
//  UIViewController+Extension.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 02/02/2022.
//

import Foundation
import UIKit
extension UIViewController {
//MARK: Method to manage pop-up alerts
    func alertEventAppear(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    func alertServerAccess(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}
