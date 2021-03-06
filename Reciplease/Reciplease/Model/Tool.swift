//
//  Tool.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 24/01/2022.
//

import Foundation
struct Tool {
    //MARK: Singleton
    static let shared = Tool()
    //Convert Double to String Value
    func getDoubleToString(number : Double?)-> (String) {
        //convert a Int? to String
        // unwrapped the optional with a guard let syntax
        guard let fullNumber = number  else { return "N/A"}
        let numberValue = Int(fullNumber)
        //convert a Int? to String
        let ID = String(numberValue)
        
        return ID
    }
    //method to delete the duplicate Data
   func notDuplicateIngredients(ingredients: [String]) -> [String] {
        let notDuplicate = Array(Set(ingredients))
        return notDuplicate
    }
    
    func listOfIngredients(recipe: RecipeDetails, ingredients: String) -> String {
        var list = ingredients
        recipe.ingredients?.forEach({ ingredient in
            if ingredient.food != recipe.ingredients?.last?.food {
                list.append(ingredient.food ?? "no data")
                list.append(",")
            } else {
                list.append(ingredient.food ?? "no data")
            }
        })
        return list
    }
}
