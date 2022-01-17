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
    
    static let sharedContext = CoreDataManager()
    let managedObjectContext = CoreDataStack.shared.viewContext
    
    var favoriteRecipe: [RecipeFavorites] {
        let request: NSFetchRequest = RecipeFavorites.fetchRequest()
        do {
           return try managedObjectContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    // MARK: - Methods
    
    // method to add recipe in Favorites
    func addRecipe(title: String, totalTime: Double, ingredients: String, yield: Double, image: String, url: String, ingredientsLines: [String]) {
        
        let entity = RecipeFavorites(context: managedObjectContext)
        entity.label = title
        entity.totalTime = totalTime
        entity.image = image
        entity.ingredientLines = ingredientsLines
        entity.yield = yield
        entity.url = url
    
        CoreDataStack.shared.saveContext()
    }
    
    //Utilisation : addRecipe(title: recipeTitle.text!, totalTime: recipeTime.text!, ingredients: [], yield: recipeYield.text!, image: "\(recipe!.image)", uri: "\(recipe!.uri)", url: "\(recipe!.url)")
    
    // method to remove recipe in Favorites
    func removeRecipe(recipeUrl: String) {
        let request: NSFetchRequest<RecipeFavorites> = RecipeFavorites.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", recipeUrl)
        if let result = try? managedObjectContext.fetch(request) {
            for object in result {
                managedObjectContext.delete(object)
            }
        }
        CoreDataStack.shared.saveContext()
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