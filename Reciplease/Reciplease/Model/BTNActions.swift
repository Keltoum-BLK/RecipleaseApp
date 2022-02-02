//
//  SearchActions.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 17/12/2021.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

class BTNActions {
    //MARK: Class properties
    static let shared = BTNActions()
    
    //MARK: CoreDataContext Properties
    let coreDataManager = CoreDataManager(managedObjectContext: CoreDataStack.shared.mainContext)
   
    //MARK: Methods to Search buttons
    func addIngredient(ingredient: String, vc: UIViewController) -> [String] {
        if ingredient != "" {
        return  ingredient.split(separator: ",").map { String($0.capitalized.trimmingCharacters(in: .whitespacesAndNewlines)) }
        } else {
            vc.alertEventAppear(title: "Error detected ⛔️", message: "You can't add nothing. \n Please enter ingredients before")
            return []
        }
    }
    
    func clearIngredientList(list: [String], vc : UIViewController) -> [String] {
        if !list.isEmpty {
        var array = list
        array.removeAll()
        return array
        } else {
            vc.alertEventAppear(title: "Error detected ⛔️", message: "You have already clear your list.")
            return list
        }
    }
    
    func searchRecipes(ingredientArray: [String], navigationController: UINavigationController, vc: UIViewController) {
        //Get Recipes  here
        if ingredientArray.count > 0 {
        EdamamApiService.shared.getTheHits(ingredients: ingredientArray) { result in
            switch result {
                
            case .success(let recipes):
                DispatchQueue.main.async {
                guard let hits = recipes.hits else { return }
                    if !hits.isEmpty {
                let recipesSearchVC = RecipesListViewController(recipesArray: hits)
                        navigationController.pushViewController(recipesSearchVC, animated: true)
                    } else {
                        vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients./n")
                    }
                }
            case .failure(let error):
                vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.")
            }
        }
        } else {
            vc.alertEventAppear(title: "Error detected ⛔️", message: "You need to add ingredient to launch the research.")
        }
    }
    
    func addFavorite(recipe: RecipeDetails?, star: UIBarButtonItem, vc: UIViewController){
        guard let recipeAdded = recipe else { return }
      vc.alertEventAppear(title: "Good New ⭐️" , message: "You add a new recipe to your favorites!")
        if !coreDataManager.checkIfRecipeIsAlreadySaved(recipeUrl: recipeAdded.url ?? "no url") {
            star.image = UIImage(systemName: "star.fill")
            coreDataManager.addRecipe(recipe: recipeAdded)
        } else {
            //implement Alert here
            vc.alertEventAppear(title: "Error detected ⛔️", message: "You have already added the recipe.")
        }
    }
}


