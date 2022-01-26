//
//  CoreDataTests.swift
//  RecipleaseTests
//
//  Created by Kel_Jellysh on 26/01/2022.
//

import XCTest
import CoreData
@testable import Reciplease

class RecipesDataTests: XCTestCase {
    
    var coreDataManager: CoreDataManager!
    var testCoreDataStack: TestCoreDataStack!
    private var recipe = RecipeDetails(label: "Chocolate Pie",
                                       image: "",
                                       url: "",
                                       yield: 1.0,
                                       ingredientLines: [],
                                       totalTime: 2.0,
                                       ingredients: [])
    
    override func setUp() {
        super.setUp()
        testCoreDataStack = TestCoreDataStack()
        coreDataManager = CoreDataManager(managedObjectContext: testCoreDataStack.mainContext)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testCoreDataStack = nil
        coreDataManager = nil
    }

    func test_add_a_recipe() {
        //When
        coreDataManager.addRecipe(recipe: recipe)
        //Then
        XCTAssertNotNil(recipe)
        XCTAssertTrue(recipe.label == "Chocolate Pie")
    }

}
