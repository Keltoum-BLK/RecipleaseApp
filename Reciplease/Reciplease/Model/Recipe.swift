//
//  Recipe.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 21/12/2021.
//

import Foundation

struct Recipe: Decodable {
    var label: String
    var image: String
    var url: Url
    var ingredientLines : IngredientLines
    var time: Time
    
    
    struct Url: Decodable {
        var url: String
    }
    
    struct IngredientLines: Decodable {
        var ingredientLines: [String]
    }
    
    struct Time: Decodable {
        var time: Double
    }
    
}
