//
//  SearchActions.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation


class BTNActions {
    
    static let shared = BTNActions()
    
    func addIngredient(ingredient: String) -> [String] {
        return  ingredient.split(separator: ",").map { String($0.capitalized.trimmingCharacters(in: .whitespacesAndNewlines)) }
    }
    
    
    func clearIngredientList(list: [String]) -> [String] {
        var array = list
        array.removeAll()
        return array
        
    }
    
    func searchRecipes(ingredient: [String]) -> [Recipe] {
        let hits = [Recipe]()
        //Get Recipes  here
        return hits
    }
    
}

