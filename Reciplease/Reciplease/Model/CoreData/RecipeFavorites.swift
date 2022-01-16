//
//  RecipeFavorites.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 13/01/2022.
//

import Foundation
import CoreData

class RecipeFavorites: NSManagedObject {
 
    
    func createIngredientList(ingredients : [IngredientCData]?) -> [String] {
        var list = [String]()
        ingredients?.forEach { ingredient in
            list.append(ingredient.food )
        }
        return list
    }
}
