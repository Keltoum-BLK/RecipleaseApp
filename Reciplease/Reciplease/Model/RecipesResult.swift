//
//  RecipesResult.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 06/01/2022.
//

import Foundation

struct RecipeResults: Decodable {
    var hits: [Recipe]?
    
    enum CodingKeys: String,CodingKey {
        case hits = "hits"
    }
  
}
struct Recipe: Decodable {
    var label: String?
    var image: String?
    var url: String?
    var yield: Double?
    var ingredientLines : [String]?
    var time: Int?
   
}
