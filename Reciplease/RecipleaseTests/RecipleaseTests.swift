//
//  RecipleaseTests.swift
//  RecipleaseTests
//
//  Created by Kel_Jellysh on 03/12/2021.
//

import XCTest
@testable import Reciplease

class RecipleaseTests: XCTestCase {
    //MARK: Test Properties
    private var btnAction: BTNActions!
    private var tool: Tool!
    private var alertManager = AlertManager()
    //MARK: Properties
    private  var  ingredient1 = IngredientsData(food: "chocolate")
    private var ingredient2 = IngredientsData(food: "banana")
    private var recipe1 = RecipeDetails(uri: "", label: "pop corn chicken", image: "", url: "", yield: 1.0, ingredientLines: [""], totalTime: 1.0, ingredients: [IngredientsData(food: "Banana"), IngredientsData(food: "chocolate")])
    private var ingredientsList: String = ""
    private var starButton = UIBarButtonItem()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        btnAction = BTNActions()
        tool = Tool()
        ingredientsList = ""
    }

    override func tearDown() {
        super.tearDown()
        btnAction = nil
        tool = nil
        ingredientsList = ""
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_given_StringArray_when_you_add_ingredientDataArray_thenReturnStringArray() {
        //Given
        let recipe = RecipeDetails(uri: "", label: "pop corn chicken", image: "", url: "", yield: 1.0, ingredientLines: [""], totalTime: 1.0, ingredients: [IngredientsData(food: "Banana"), IngredientsData(food: "chocolate")])
        //When
        let ingredients = tool.listOfIngredients(recipe: recipe, ingredients: ingredientsList)
        //Then
        XCTAssertNotNil(ingredients)
        XCTAssertTrue(ingredients == "Banana,chocolate")
    }
    
    func test_given_StringArray_when_you_add_DuplicateData_thenReturnStringArray() {
        //given
        let array = ["banana", "banana", "pineapple", "cherry", "cherry"]
        //when
        let ingredientsArray = tool.notDuplicateIngredients(ingredients: array)
        //then
        XCTAssertTrue(ingredientsArray.count == 3)
    }
    
    func test_given_DoubleValue_thenReturnStringArray() {
        //given
        let time = 10.0
        //when
        let preparationTime = tool.getDoubleToString(number: time)
        //then
        XCTAssertTrue(preparationTime == "10")
    }
    
    func test_given_StringArray_when_you_removeAll_thenReturnStringArray() {
        //given
        let array = ["banana", "pineapple", "cherry"]
        let vc = UIViewController()
        //when
        let ingredientsArray = btnAction.clearIngredientList(list: array, vc: vc)
        //then
        XCTAssertTrue(ingredientsArray.count == 0)
    }
    
    func test_given_StringValue_when_you_add_toArray_thenReturnStringArray() {
        //given
        let array = "banana, pineapple, cherry"
        let vc = UIViewController()
        //when
        let ingredientsArray = btnAction.addIngredient(ingredient: array, vc: vc)
        //then
        XCTAssertTrue(ingredientsArray.count == 3)
    }
}
