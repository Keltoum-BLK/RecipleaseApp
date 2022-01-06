//
//  SearchActions.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation


class SearchBTNTargets {
    
    static let shared = SearchBTNTargets()
    
    func addIngredient(ingredient: String, list: [String]) -> [String]{
        var array = list
        array =  ingredient.split(separator: ",").map { "\($0)" }
        return array
        }
   
    
    func clearIngredientList(list: [String]) -> [String] {
        var array = list
        array.removeAll()
        return array
    }
    
}

