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
        override func setUp() {
            super.setUp()
            
            let manager: Session = {
                let configuration: URLSessionConfiguration = {
                    let configuration = URLSessionConfiguration.default
                    configuration.protocolClasses = [MockURLProtocol.self]
                    return configuration
                }()
                
                return Session(configuration: configuration)
            }()
            sut = EdamamApiService(manager: manager)
        }
        
        override func tearDown() {
            super.tearDown()
            sut = nil
        }
    
    func testGetRecipes_WhenYouAddIngredients_ThenResultsAnArrayOfRecipes() {
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
}
