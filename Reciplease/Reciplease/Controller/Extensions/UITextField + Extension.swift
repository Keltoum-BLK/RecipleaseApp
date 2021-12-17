//
//  UITextField + Extension.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation
import UIKit
//MARK: Method to put placeholder text color in black
extension UITextField {
    
    func changeThePLaceholderFont(text: String, textField: UITextField) {
        let fontPlaceholderText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont(name: "chalkboard SE", size: 20) as Any, NSAttributedString.Key.foregroundColor: UIColor.gray])
            textField.attributedPlaceholder = fontPlaceholderText
    }
    
}
