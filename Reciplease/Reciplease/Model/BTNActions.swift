//
//  SearchActions.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation


class BTNActions {
    //MARK: Class properties
    static let shared = BTNActions()
   
    //MARK: Methods to Search buttons
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

struct Tools {
    //Convert Double to String Value
    static func getDoubleToString(number : Double?)-> (String) {
        //convert a Int? to String
        // unwrapped the optional with a guard let syntax
        guard let fullNumber = number  else { return "N/A"}
        let numberValue = Int(fullNumber)
        //convert a Int? to String
        let ID = String(numberValue)
        
        return ID
    }
}

