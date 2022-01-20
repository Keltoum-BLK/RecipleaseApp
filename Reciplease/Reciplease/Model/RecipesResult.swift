//
//  RecipesResult.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 06/01/2022.
//

import Foundation

struct RecipeResults: Decodable {
    var hits: [Recipe]?

    enum CodingKeys: String, CodingKey {
        case hits = "hits"
    }
}

struct Recipe: Decodable {
    var recipe: RecipeData?
    
    enum CodingKeys: String, CodingKey {
        case recipe
    }
}

struct RecipeData: Decodable {
    var uri: String?
    var label: String?
    var image: String?
    var url: String?
    var yield: Double?
    var ingredientLines: [String]?
    var totalTime: Double?
    var ingredients: [IngredientsData]?
    
    enum CodingKeys: String, CodingKey {
        case uri
        case label
        case image
        case url
        case yield
        case ingredientLines
        case totalTime
        case ingredients
    }
    
    func createIngredientList(ingredients : [IngredientsData]?) -> [String] {
        var list = [String]()
        ingredients?.forEach { ingredient in
            list.append(ingredient.food ?? "NA")
            
        }
        return list
    }
}

struct IngredientsData: Decodable {
    var food: String?
    
    enum CodingKeys: String, CodingKey {
        case food
    }
}

