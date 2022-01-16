//
//  IngredientCdata.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 16/01/2022.
//

import Foundation
import CoreData

class IngredientCData: NSSecureUnarchiveFromDataTransformer {
    
    var food: String
    
    init(food: String) {
        self.food = food 
    }
    
}
