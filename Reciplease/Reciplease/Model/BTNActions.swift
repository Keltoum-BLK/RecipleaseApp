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
    func addIngredient(ingredient: String, vc: UIViewController) -> [String] {
        if ingredient != "" {
        return  ingredient.split(separator: ",").map { String($0.capitalized.trimmingCharacters(in: .whitespacesAndNewlines)) }
        } else {
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "You can't add nothing. \n Please enter ingredients before", vc: vc)
            return []
        }
    }
    
    //MARK: CoreDataContext Properties
    let coreDataManager = CoreDataManager(managedObjectContext: CoreDataStack.shared.mainContext)
    
    func clearIngredientList(list: [String], vc : UIViewController) -> [String] {
        if !list.isEmpty {
        var array = list
        array.removeAll()
        return array
        } else {
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Attention", message: "You have already clear your list.", vc: vc)
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
                        AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients", vc: vc)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                AlertManager.sharedAlert.alertServerAccess(title: "Server error appeared" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients", vc: vc)
            }
        }
        } else {
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Error appeared", message: "You need to add ingredient to launch the research.", vc: vc)
        }
    }
    
    func addFavorite(recipe: RecipeDetails?, ingredients: String, star: UIBarButtonItem, vc: UIViewController){
        guard let recipeAdded = recipe else { return }
        print(recipeAdded.ingredients as Any)
        print(ingredients)
        if !coreDataManager.checkIfRecipeIsAlreadySaved(recipeUrl: recipeAdded.url ?? "no url") {
            star.image = UIImage(systemName: "star.fill")
            coreDataManager.addRecipe(recipe: recipeAdded)
        } else {
            //implement Alert here
            AlertManager.sharedAlert.alertWhenErrorAppear(title: "Oups", message: "You have already added the recipe", vc: vc)
            print("=> OUpps" )
        }
    }
}


