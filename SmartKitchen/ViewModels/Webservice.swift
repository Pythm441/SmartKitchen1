//
//  Webservice.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 15/09/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

class Webservice {
    func getFood(searchTerm: String) async throws -> [API2] {
        
        // Create a URLComponents instance
        var components = URLComponents()
        // Set the scheme, host, and path for the URL
        //components.scheme = "https"
        //components.host = "https://api.spoonacular.com/recipes/complexSearch?apiKey=3dcc7436a1dd43e1a71b267740fafacc"
        let urls = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=126b8c8d1d264eb1a4e79d3316e4add1&query=\(searchTerm)")
        
        //components.path = "/recipes/complexSearch"

        // Create a query item for the API key
        //let apiKeyItem = URLQueryItem(name: "?apiKey", value: "3dcc7436a1dd43e1a71b267740fafacc")

        // Set the query items for the URL
        //components.queryItems = [apiKeyItem]
        
        guard let url = urls else {
            throw NetworkError.badURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        print(String(data: data, encoding: .utf8)!)
        let foodResponse1 = try JSONDecoder().decode(API1.self, from: data)
        let foodResponse = try JSONDecoder().decode(API2.self, from: data)
        return [foodResponse.self]
        
    }
}
