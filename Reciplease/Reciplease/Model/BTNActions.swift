//
//  SearchActions.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation
import CoreData
import UIKit

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
    
    func addFavorite(recipe: RecipeDetails?, ingredients: String, star: UIBarButtonItem, vc: UIViewController){
        guard let recipeAdded = recipe else { return }
        print(recipeAdded.ingredients as Any)
        print(ingredients)
        if !CoreDataManager.sharedContext.checkIfRecipeIsAlreadySaved(recipeUrl: recipeAdded.url ?? "no url") {
            star.image = UIImage(systemName: "star.fill")
            CoreDataManager.sharedContext.addRecipe(title: recipeAdded.label ?? "no label",
                                                    totalTime: recipeAdded.totalTime ?? 1.0,
                                                    ingredients:  Tool.listOfIngredients(recipe: recipeAdded, ingredients: ingredients),
                                                    yield: recipeAdded.yield ?? 1.0,
                                                    image: recipeAdded.image ?? "no image",
                                                    url: recipeAdded.url ?? "no url",
                                                    ingredientsLines: recipeAdded.ingredientLines ?? ["no ingredientLines"])
            
        } else {
            //implement Alert here
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "You have already added the recipe", vc: vc)
            print("=> OUpps" )
        }
    }
}


