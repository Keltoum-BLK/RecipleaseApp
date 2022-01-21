//
//  EdamamApiService.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 03/01/2022.
//

import Foundation
import Alamofire

class EdamamApiService {
    //MARK: Class property
    static let shared = EdamamApiService()
   
    //MARK: Methods
    func getTheHits(ingredients : [String], completion: @escaping (Result<RecipeResults, APIError>)-> Void) {
       
        let ingredientsList = ingredients.map({$0.replacingOccurrences(of: " ", with: "%20")}).joined(separator: ",")
        
        AF.request("https://api.edamam.com/api/recipes/v2?type=public&app_id=\(SecretApiKey.shared.edamamID)&app_key=\(SecretApiKey.shared.edamamKey)&time=10-60&imageSize=REGULAR&q=\(ingredientsList)")
            .validate(statusCode: 200..<299)
            .responseData { response in
//                print(response.response?.statusCode)
                switch response.result {
                    case .success(let hits):
                        switch response.response?.statusCode {
                            case 200:
                                guard let recipes = try? JSONDecoder().decode(RecipeResults.self, from: hits) else {
                                return
                                }
                                completion(.success(recipes))
                            
                            case 400,404:
                                completion(.failure(.network))
                        
                            case 500,502,503:
                                completion(.failure(.server))
        
                            default:
                                completion(.failure(.decoding))
                    }
                    case .failure(let error):
                        completion(.failure(.server))
                        print("We ran into error : \(error.localizedDescription)")
            }
        }
    }
    
    
    
}
