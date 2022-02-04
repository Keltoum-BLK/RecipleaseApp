//
//  TestDataBase .swift
//  RecipleaseTests
//
//  Created by Kel_Jellysh on 28/01/2022.
//

import Foundation
import CoreData
@testable import Reciplease

class FavoriteService {
    
    private let coreDataStack: TestCoreDataStack
    private let managedObjectContext: NSManagedObjectContext
    
    
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack as! TestCoreDataStack
        self.managedObjectContext = coreDataStack.mainContext    }
    
    
    func addRecipe(recipe: RecipeDetails) {
        
        let entity = RecipeFavorites(context: managedObjectContext)
        entity.label = recipe.label
        entity.totalTime = recipe.totalTime ?? 1.0
        entity.image = recipe.image
        entity.ingredientLines = recipe.ingredientLines
        entity.ingredients = recipe.createIngredientList(ingredients: recipe.ingredients).joined(separator: ",")
        entity.yield = recipe.yield ?? 1.0
        entity.url = recipe.url
        
        coreDataStack.saveContext()
    }
    
    func fetchFavorites(favoriteRecipe: [RecipeFavorites]) -> [RecipeFavorites] {
            let request: NSFetchRequest = RecipeFavorites.fetchRequest()
            do {
                var listOfFavorite = favoriteRecipe
              listOfFavorite = try managedObjectContext.fetch(request)
                return listOfFavorite
            } catch {
                return []
            }
    }
    
    func removeRecipe(row : Int, array : [RecipeFavorites]) -> [RecipeFavorites]{
        coreDataStack.mainContext.delete(array[row])
        var list = array
        list.remove(at: row)
        do {
            try coreDataStack.mainContext.save()
            print("We remove the recipe.")
        } catch {
            debugPrint("Could not remove \(error.localizedDescription)")
        }
        return list
    }
    //Remove all recipe in the array
    func removeAllRecipes(array : [RecipeFavorites]) -> [RecipeFavorites] {
        var list = array
        for recipe in array {
            coreDataStack.mainContext.delete(recipe)
            list.removeAll()
            do {
                try   coreDataStack.mainContext.save()
                print("We remove the recipe.")
            } catch {
                debugPrint("Could not remove \(error.localizedDescription)")
            }
        }
        return list
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

