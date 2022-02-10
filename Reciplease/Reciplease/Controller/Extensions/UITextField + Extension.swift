//
//  UITextField + Extension.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation
import UIKit

extension UITextField {
    //MARK: Method to put placeholder text color in black
    func changeThePLaceholderFont(text: String, textField: UITextField) {
        let fontPlaceholderText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.chalkboard(fontSize: 20) as Any, NSAttributedString.Key.foregroundColor: UIColor.gray])
            textField.attributedPlaceholder = fontPlaceholderText
    }
    
}
