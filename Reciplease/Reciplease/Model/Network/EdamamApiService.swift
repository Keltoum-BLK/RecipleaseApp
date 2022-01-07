//
//  EdamamApiService.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 03/01/2022.
//

import Foundation
import Alamofire

class EdamamApiService {
    
    static let shared = EdamamApiService()
    
    
    func getTheHits(ingredients : [String], completion: @escaping (Result<RecipeResults, APIError>)-> Void) {
        let ingredientsList = ingredients.joined(separator: ",")
        
        AF.request("https://api.edamam.com/api/recipes/v2?type=public&app_id=\(SecretApiKey.shared.edamamID)&app_key=\(SecretApiKey.shared.edamamKey)&time=10-60&imageSize=REGULAR&q=\(ingredientsList)")
            .validate(statusCode: 200..<300)
            .responseData { response in
                switch response.result {
                    case .success(let hits):
                    
                    guard let recipes = try? JSONDecoder().decode(RecipeResults.self, from: hits) else {
                        completion(.failure(.decoding))
                        return
                    }
                    completion(.success(recipes))
                    
                    case .failure(let error):
                    completion(.failure(.server))
                    print("We didn't access to your recipes whit error: \(error.localizedDescription)")
            }
        }
    }
    
    
    
}
