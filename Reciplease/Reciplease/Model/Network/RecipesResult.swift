//
//  RecipesResult.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 06/01/2022.
//

import Foundation
//MARK: Properties to Parse and Get Data
struct RecipeResults: Decodable {
    var hits: [Recipe]?

    enum CodingKeys: String, CodingKey {
        case hits = "hits"
    }
}

struct Recipe: Decodable {
    var recipe: RecipeDetails?
    
    enum CodingKeys: String, CodingKey {
        case recipe
    }
}

struct RecipeDetails: Decodable {
    var label: String?
    var image: String?
    var url: String?
    var yield: Double?
    var ingredientLines: [String]?
    var totalTime: Double?
    var ingredients: [IngredientsData]?
    
    enum CodingKeys: String, CodingKey {
        case label
        case image
        case url
        case yield
        case ingredientLines
        case totalTime
        case ingredients
    }
    //MARK: Method to convert array of object values to string array
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

