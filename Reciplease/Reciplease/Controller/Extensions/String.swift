//
//  string.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/01/2022.
//

import Foundation

extension String {
    
    func removeWhiteSpace(text: String) -> String {
        let replaced = text.trimmingCharacters(in: NSCharacterSet.whitespaces)
        return replaced
    }
}
