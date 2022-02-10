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
    //MARK: Properties
    private  var  ingredient1 = IngredientsData(food: "chocolate")
    private var ingredient2 = IngredientsData(food: "banana")
    private var recipe1 = RecipeDetails(label: "pop corn chicken", image: "", url: "", yield: 1.0, ingredientLines: [""], totalTime: 1.0, ingredients: [])
    private var ingredientsList: String = ""
    private var starButton = UIBarButtonItem()
    private var recipeResults = RecipeDetails()
    
    
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

    func testGivenStringArray_WhenYouAddIngredientDataArray_ThenReturnStringArray() {
        //Given
        let recipe = RecipeDetails(label: "pop corn chicken", image: "", url: "", yield: 1.0, ingredientLines: [""], totalTime: 1.0, ingredients: [ingredient1, ingredient2])
        //When
        let ingredients = tool.listOfIngredients(recipe: recipe, ingredients: ingredientsList)
        //Then
        XCTAssertNotNil(ingredients)
        XCTAssertTrue(ingredients == "chocolate,banana")
    }
    
    func testGivenStringArray_WhenYouAddDuplicateData_ThenReturnStringArray() {
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
    
    func testGivenStringArray_WhenYouRemoveAll_ThenReturnStringArray() {
        //given
        let array = ["banana", "pineapple", "cherry"]
        let vc = UIViewController()
        //when
        let ingredientsArray = btnAction.clearIngredientList(list: array, vc: vc)
        //then
        XCTAssertTrue(ingredientsArray.count == 0)
    }
    
    func testGivenStringValue_WhenYouAddToArray_ThenReturnStringArray() {
        //given
        let array = "banana, pineapple, cherry"
        let vc = UIViewController()
        //when
        let ingredientsArray = btnAction.addIngredient(ingredient: array, vc: vc)
        //then
        XCTAssertTrue(ingredientsArray.count == 3)
    }
    
    func testGivenAlert_WhenYouHAvelAlreadyClearArray_ThenResultAnAlert() {
        //given
        let array = [String]()
        let vc = SearchingVC()
        //when
        let _ = btnAction.clearIngredientList(list: array, vc: vc)
        //then
        XCTAssertTrue(vc.alertEventAppear(title: "Error detected ⛔️", message: "You have already clear your list.") == vc.alertEventAppear(title: "Error detected ⛔️", message: "You have already clear your list."))
    }
    
    func testGivenAlert_WhenYouAddNothing_ThenReturnAlert() {
        //given
        let array = ""
        let vc = SearchingVC()
        //when
        let _ = btnAction.addIngredient(ingredient: array, vc: vc)
        //then
        XCTAssertTrue(vc.alertEventAppear(title: "Error detected ⛔️", message: "You can't add nothing. \n Please enter ingredients before") == vc.alertEventAppear(title: "Error detected ⛔️", message: "You can't add nothing. \n Please enter ingredients before"))
    }
    
    func testGivenAnStringArray_WhenConvert_ThenResultAnArray() {
        //given
        let ingredients = [IngredientsData(food: "banana"), IngredientsData(food: "ice cream")]
        //when
        let array = recipeResults.createIngredientList(ingredients: ingredients)
        //then
        XCTAssertTrue(array == ["banana", "ice cream"])
    }
    
    func testGivenUserIsNotNewUser_WhenAccessToTheSearchVC_ThenResultBool() {
        //When
        CoreOnboarding.setIsNotNewUser()
        //Then
        XCTAssertTrue(CoreOnboarding.setIsNotNewUser() == UserDefaults.standard.set(true, forKey: Constants.newUser))
    }
    
    func testGivenAnError_WhenButtonIsTappedTwice_ThenResultAnAlert() {
        //Given
        let vc = SearchingVC()
        var count = 1
        //When
        count = BTNActions.shared.searchBTNIsAlreadyTap(alreadyTap: count, vc: vc)
        //Then
        XCTAssertTrue( vc.alertEventAppear(title: "Error detected", message: "You have already tap to lunch the search") ==  vc.alertEventAppear(title: "Error detected", message: "You have already tap to lunch the search"))
    }
    
    func testPass_WhenButtonIsTappedOne_ThenSearchPass() {
        //Given
        let vc = SearchingVC()
        var count = 0
        //When
        count = BTNActions.shared.searchBTNIsAlreadyTap(alreadyTap: count, vc: vc)
        //Then
        XCTAssertTrue(count == 1)
    }
    
    func testApiErrorDescription_WhenErrorIsServer() {
        //When
        let apiError = APIError.server
        //Then
        XCTAssertTrue(apiError.description == "Error server")
    }

    func testApiErrorDescription_WhenErrorIsNetwork() {
        //When
        let apiError = APIError.network
        //Then
        XCTAssertTrue(apiError.description == "Error network")
    }

    func testApiErrorDescription_WhenErrorIsDecoding() {
        //When
        let apiError = APIError.decoding
        //Then
        XCTAssertTrue(apiError.description == "Error decoding")
    }
}
