//
//  ApiErrorManager.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 07/01/2022.
//

import Foundation
import FileProvider

//MARK: Error Manager
enum APIError: Error {
    case decoding
    case server
    case network
    
    var description : String {
        switch self {
        case APIError.decoding:
            return "Error decoding"
            
        case APIError.network:
            return "Error network"
            
        case APIError.server:
            return "Error server"
        }
    }
}

