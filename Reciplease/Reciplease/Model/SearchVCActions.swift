//
//  SearchActions.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation


class SearchVCActions {
    
    static let shared  = SearchVCActions()
    
    func addIngredient(ingredient: String, array: [String]) {
        let element = ingredient
        var tab = array
        tab.append(element)
    }
    
    func clearArray(tab: [String]) {
        var array = tab
        array.removeAll()
    }
    
}
