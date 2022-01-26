//
//  CoreDataManager.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 16/01/2022.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    // MARK: - Properties
    
//    static let sharedContext = CoreDataManager()
//    let managedObjectContext = CoreDataStack.shared.mainContext
    let managedObjectContext: NSManagedObjectContext
    
    var favoriteRecipe: [RecipeFavorites] {
        let request: NSFetchRequest = RecipeFavorites.fetchRequest()
        do {
            return try managedObjectContext.fetch(request)
        } catch {
            return []
        }
    }
    // MARK: - Initialization
    
    
    init(managedObjectContext: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    // MARK: - Methods
    func addRecipe(recipe: RecipeDetails) {
        
        let entity = RecipeFavorites(context: managedObjectContext)
        entity.label = recipe.label
        entity.totalTime = recipe.totalTime ?? 1.0
        entity.image = recipe.image
        entity.ingredientLines = recipe.ingredientLines
        entity.ingredients = recipe.createIngredientList(ingredients: recipe.ingredients).joined(separator: ",")
        entity.yield = recipe.yield ?? 1.0
        entity.url = recipe.url
        
        CoreDataStack.shared.saveContext()
    }
    // method to remove recipe in Favorites
    func removeRecipe(indexPath : IndexPath, array : [RecipeFavorites]) {
        managedObjectContext.delete(array[indexPath.row])
        do {
            try managedObjectContext.save()
            print("We remove the recipe.")
        } catch {
            debugPrint("Could not remove \(error.localizedDescription)")
        }
        //        let request: NSFetchRequest<RecipeFavorites> = RecipeFavorites.fetchRequest()
        //        request.predicate = NSPredicate(format: "url == %@", recipeUrl)
        //        if let result = try? managedObjectContext.fetch(request) {
        //            for object in result {
        //                managedObjectContext.delete(object)
        //            }
        //        }
    }
    //Remove all recipe in the array 
    func removeAllRecipes(array : [RecipeFavorites]) {
        for recipe in array {
            managedObjectContext.delete(recipe)
            do {
                try managedObjectContext.save()
                print("We remove the recipe.")
            } catch {
                debugPrint("Could not remove \(error.localizedDescription)")
            }
            //        let request: NSFetchRequest<RecipeFavorites> = RecipeFavorites.fetchRequest()
            //        request.predicate = NSPredicate(format: "url == %@", recipeUrl)
            //        if let result = try? managedObjectContext.fetch(request) {
            //            for object in result {
            //                managedObjectContext.delete(object)
            //            }
            //        }
        }
    }
    // method to check if recipe is already in Favorites
    func checkIfRecipeIsAlreadySaved(recipeUrl: String) -> Bool {
        let request: NSFetchRequest<RecipeFavorites> = RecipeFavorites.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", recipeUrl)
        guard let recipes = try? managedObjectContext.fetch(request) else { return false}
        if recipes.isEmpty { return false }
        return true
    }
}
