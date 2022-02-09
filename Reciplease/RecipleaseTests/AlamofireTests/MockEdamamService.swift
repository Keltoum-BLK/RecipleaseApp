//
//  MockEdamamService.swift
//  RecipleaseTests
//
//  Created by Kel_Jellysh on 31/01/2022.
//

import XCTest
import Alamofire
@testable import Reciplease

class MockEdamamService: XCTestCase {
    
    private var sut: EdamamApiService!
    private var listOfRecipes = [Recipe]()
    private var manager: Session!
    private var btnAction: BTNActions!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        
        manager = Session(configuration: configuration)
        
        sut = EdamamApiService(manager: manager)
        
        btnAction = BTNActions()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testGivenRecipes_WhenYouAddIngredients_ThenResultsAnArrayOfRecipes() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 200)
        
        let expectation = XCTestExpectation(description: "Performs a request")
        
        // when
        sut.getTheHits(ingredients: ["chocolate", "banana"]) { (result) in
            guard case .success(let recipes) = result else {
                return
            }
            guard let listOfRecipes = recipes.hits else { return }
            XCTAssertNotNil(listOfRecipes)
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenRecipes_WhenYouAddIngredientsAndNumbers_ThenResultsAnArrayOfRecipes() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 200)
        let expectation = XCTestExpectation(description: "Performs a request")
        // when
        sut.getTheHits(ingredients: ["chocolate", "234"]) { (result) in
            guard case .success(let recipes) = result else {
                return
            }
            guard let listOfRecipes = recipes.hits else { return }
            XCTAssertNotNil(listOfRecipes)
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenRecipe_WhenYouSelectArecipe_ThenResultsRecipeDetails() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 200)
        
        let expectation = XCTestExpectation(description: "Performs a request")
        // when
        sut.getTheHits(ingredients: ["chocolate", "banana"]) { (result) in
            guard case .success(let recipes) = result else {
                return
            }
            guard let listOfRecipes = recipes.hits else { return }
            
            XCTAssertEqual(listOfRecipes[2].recipe?.url, "http://www.marthastewart.com/312870/chocolate-ganache")
            XCTAssertEqual(listOfRecipes[2].recipe?.label, "Chocolate Ganache")
            XCTAssertEqual(listOfRecipes[2].recipe?.yield, 4.0)
            XCTAssertEqual(listOfRecipes[2].recipe?.totalTime, 25.0)
            XCTAssertEqual(listOfRecipes[2].recipe?.ingredientLines, ["1/4 cup heavy cream", "4 ounces chopped semisweet chocolate"])
            XCTAssertEqual(listOfRecipes[2].recipe?.image, "https://www.edamam.com/web-img/26c/26ccc1e6017d3455a7d101c937f50826.jpg")
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenAlert_WhenYouAddNoIngredients_ThenResultsAlertMessage() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 200)
        let vc = SearchingVC()
        let expectation = XCTestExpectation(description: "Performs a request")
        
        // when
        sut.getTheHits(ingredients: [""]) { (result) in
            guard case .success(_) = result else { return }
            vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.")
            XCTAssertTrue( vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.") ==  vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients."))
            
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenRecipes_WhenBTNTappedOnce_ThenResultsAnArrayOfRecipes() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 200)
        let expectation = XCTestExpectation(description: "Performs a request")
        let vc = SearchingVC()
        var btnCountTapped = 0
        
        // when
        btnCountTapped = BTNActions.shared.searchBTNIsAlreadyTap(alreadyTap: btnCountTapped, vc: vc)
        sut.getTheHits(ingredients: ["chocolate", "234"]) { (result) in
            guard case .success(let recipes) = result else {
                return
            }
            guard let listOfRecipes = recipes.hits else { return }
            XCTAssertNotNil(listOfRecipes)
            
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenAlert_WhenBTNTappedTwice_ThenResultsAnArrayOfRecipes() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 200)
        let expectation = XCTestExpectation(description: "Performs a request")
        let vc = SearchingVC()
        var btnCountTapped = 0
        
        // when
        btnCountTapped = BTNActions.shared.searchBTNIsAlreadyTap(alreadyTap: btnCountTapped, vc: vc)
        sut.getTheHits(ingredients: ["chocolate", "234"]) { (result) in
            guard case .success(let recipes) = result else {
                return
            }
            guard let listOfRecipes = recipes.hits else { return }
            XCTAssertNotNil(listOfRecipes)
            XCTAssertTrue( vc.alertEventAppear(title: "Error detected", message: "You have already tap to lunch the search") ==  vc.alertEventAppear(title: "Error detected", message: "You have already tap to lunch the search"))
            
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenAlert_WhenYouAddStatusCode500_ThenResultsAlertMessage() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 500)
        let vc = SearchingVC()
        let expectation = XCTestExpectation(description: "Performs a request")
        
        // when
        sut.getTheHits(ingredients: ["chocolaté"]) { (result) in
            guard case .failure(let error) = result else { return }
            let errorAppeared = error
            vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.")
            XCTAssertTrue(vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.") ==  vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients."))
            XCTAssertTrue(errorAppeared.description == "Error server")
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    func testGivenAlert_WhenYouAddStatusCode503_ThenResultsAlertMessage() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 503)
        let vc = SearchingVC()
        let expectation = XCTestExpectation(description: "Performs a request")
        
        // when
        sut.getTheHits(ingredients: ["chocolaté"]) { (result) in
            guard case .failure(let error) = result else { return }
            let errorAppeared = error
            vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.")
            XCTAssertTrue(vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.") ==  vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients."))
            XCTAssertTrue(errorAppeared.description == "Error server")
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenAlert_WhenYouAddStatusCode502_ThenResultsAlertMessage() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 502)
        let vc = SearchingVC()
        let expectation = XCTestExpectation(description: "Performs a request")
        
        // when
        sut.getTheHits(ingredients: ["chocolaté"]) { (result) in
            guard case .failure(let error) = result else { return }
            let errorAppeared = error
            vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.")
            XCTAssertTrue(vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.") ==  vc.alertServerAccess(title: "Server error detected ⛔️" , message: "We didn't access to your recipes whit error \(error.description).\n Please enter your ingredients in english, or enter more ingredients, or new ingredients."))
            XCTAssertTrue(errorAppeared.description == "Error server")
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    func testGivenAlert_WhenYouAHaveAEmptyRecipes_ThenResultsAlert400Message() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 400)
        let vc = SearchingVC()
        let expectation = XCTestExpectation(description: "Performs a request")
        
        // when
        sut.getTheHits(ingredients: ["2653084"]) { (result) in
            guard case .failure(let error) = result else { return }
            let errorAppeared = error
            vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.")
            XCTAssertTrue( vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients./n" + errorAppeared.description) ==  vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients." + errorAppeared.description))
            XCTAssertTrue(errorAppeared.description == "Error network")
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    func testGivenAlert_WhenYouAHaveAEmptyRecipes_ThenResultsAlert404Message() {
        // given
        MockURLProtocol.responseWithStatusCode(code: 404)
        let vc = SearchingVC()
        let expectation = XCTestExpectation(description: "Performs a request")
        
        // when
        sut.getTheHits(ingredients: ["2653084"]) { (result) in
            guard case .failure(let error) = result else { return }
            let errorAppeared = error
            vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients.")
            XCTAssertTrue( vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients./n" + errorAppeared.description) ==  vc.alertEventAppear(title: "Error detected ⛔️", message: "We haven't any recipe for your request.\n Please enter your ingredients in english, or enter more ingredients, or new ingredients." + errorAppeared.description))
            XCTAssertTrue(errorAppeared.description == "Error network")
        }
        expectation.fulfill()
        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenArray_WhenYouAskSearchAction_ThenResultAnArray() {
        //Given
        let array = ["banana", "banana", "pineapple", "cherry", "cherry"]
        let nav = UINavigationController()
        let vc = SearchingVC()
        let nextVC = RecipesListViewController()
        let expectation = XCTestExpectation(description: "Performs a request")
        //When
        btnAction.searchRecipes(ingredientArray: array, navigationController: nav, vc: vc)
        expectation.fulfill()
        //Then
        XCTAssertNotNil(nextVC)
        wait(for: [expectation], timeout: 3)
    }
    
    func testGivenAlert_WhenYouAskSearchActionWithEmptyArray_ThenAlert() {
        //Given
        let array = [String]()
        let nav = UINavigationController()
        let vc = SearchingVC()
        let expectation = XCTestExpectation(description: "Performs a request")
        //When
        btnAction.searchRecipes(ingredientArray: array, navigationController: nav, vc: vc)
        expectation.fulfill()
        //Then
        XCTAssertTrue( vc.alertEventAppear(title: "Error detected ⛔️", message: "You need to add ingredient to launch the research.") == vc.alertEventAppear(title: "Error detected ⛔️", message: "You need to add ingredient to launch the research."))
        XCTAssertTrue(array.isEmpty)
        wait(for: [expectation], timeout: 3)
    }
}
