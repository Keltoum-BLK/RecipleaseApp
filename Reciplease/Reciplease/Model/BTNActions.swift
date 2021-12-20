//
//  SearchActions.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation


class BTNActions {
    
    static let shared  = BTNActions()
    
    func addIngredient(ingredient: String, array: [String]) -> String {
        let element = ingredient
        var tab = array
        tab.append(element)
        return element
    }
    
    func clearArray(tab: [String]) {
        var array = tab
        array.removeAll()
    }
    
}
