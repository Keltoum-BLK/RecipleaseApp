//
//  CoreDataTests.swift
//  RecipleaseTests
//
//  Created by Kel_Jellysh on 26/01/2022.
//

import XCTest
import CoreData
@testable import Reciplease

class MockRecipeFavorites: XCTestCase {
    
    var favoriteService : FavoriteService!
    var coreDataStack: CoreDataStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
        favoriteService = FavoriteService(coreDataStack: coreDataStack)
    }
    private var recipe1 = RecipeDetails(label: "Chocolate Pie",
                                       image: "",
                                       url: "www.marmitton.org",
                                       yield: 1.0,
                                       ingredientLines: [],
                                       totalTime: 2.0,
                                       ingredients: [])
    private var recipe2 = RecipeDetails(label: "Chicken Pie",
                                       image: "",
                                       url: "",
                                       yield: 1.0,
                                       ingredientLines: [],
                                       totalTime: 2.0,
                                       ingredients: [])
    private var listOfFavorite = [RecipeFavorites]()


    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        coreDataStack = nil
        favoriteService = nil
    }

    func test_add_a_recipe() {
        //When
        favoriteService.addRecipe(recipe: recipe1)
        //Then
        XCTAssertNotNil(recipe1)
        XCTAssertTrue(recipe1.label == "Chocolate Pie")
    }
    
    func test_fetch_recipes() {
        //Given
        favoriteService.addRecipe(recipe: recipe1)
        favoriteService.addRecipe(recipe: recipe2)
        //When
        listOfFavorite =  favoriteService.fetchFavorites(favoriteRecipe: self.listOfFavorite)
        for  i in listOfFavorite {
            print(i.label ?? "no label")
        }
        //Then
        XCTAssertTrue(listOfFavorite.count == 2)
        XCTAssertTrue(listOfFavorite[1].label == recipe1.label)
    }
    
    func test_remove_recipe() {
        favoriteService.addRecipe(recipe: recipe1)
        favoriteService.addRecipe(recipe: recipe2)
        listOfFavorite =  favoriteService.fetchFavorites(favoriteRecipe: self.listOfFavorite)
        //When
        listOfFavorite = favoriteService.removeRecipe(row: 1, array: listOfFavorite)
        for  i in listOfFavorite {
            print(i.label ?? "no label")
        }
        //Then
        XCTAssertTrue(listOfFavorite.count == 1)
        XCTAssertTrue(listOfFavorite[0].label == recipe2.label)
    }
    
    func test_remove_all_recipes() {
        favoriteService.addRecipe(recipe: recipe1)
        favoriteService.addRecipe(recipe: recipe2)
        listOfFavorite =  favoriteService.fetchFavorites(favoriteRecipe: self.listOfFavorite)
        //When
        listOfFavorite = favoriteService.removeAllRecipes(array: listOfFavorite)
        //Then
        XCTAssertTrue(listOfFavorite.isEmpty)
    }
    
    func test_check_recipe_already_added() {
        favoriteService.addRecipe(recipe: recipe1)
        favoriteService.addRecipe(recipe: recipe2)
        listOfFavorite =  favoriteService.fetchFavorites(favoriteRecipe: self.listOfFavorite)
        //When
        let alreadySaved = favoriteService.checkIfRecipeIsAlreadySaved(recipeUrl: recipe1.url ?? "no url")
        //Then
        XCTAssertTrue(alreadySaved == true)
    }
}
