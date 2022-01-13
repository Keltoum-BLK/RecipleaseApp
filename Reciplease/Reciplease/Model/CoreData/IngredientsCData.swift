//
//  IngredientsData.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 13/01/2022.
//

import Foundation
import CoreData

class IngredientsCData: NSObject {
    let food: String
    
    init(food: String) {
        self.food = food
    }
}
