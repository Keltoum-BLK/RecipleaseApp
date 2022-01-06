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
