//
//  RecipeModel.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

//import Foundation
//import SwiftUI
//@MainActor
//class ApiModel: ObservableObject {
////    @Published var apiURL = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=126b8c8d1d264eb1a4e79d3316e4add1&query=")!
//    var apiKey: String = "126b8c8d1d264eb1a4e79d3316e4add1" // Replace with your actual API key
//    
//    struct SearchQuery {
//        var searchQuery: String
//    }
//
//        var apiURL: URL {
//            var urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&query=\(SearchQuery.self)"
//            guard let url = URL(string: urlString) else {
//                fatalError("Invalid URL")
//            }
//            return url
//        }
//
//        init() {
//            // Any additional setup can be done here if needed
//           // func getapi() {
//                   api = nil
//                   Task {
//                     let (data, _) = try await URLSession.shared.data(from: apiURL)
//                       print("got data !")
//                       print(String(data: data, encoding: .utf8)!)
//                      try await MainActor.run {
//                           self.api = try JSONDecoder().decode(API1.self, from: data)
//                       
////                          print("----------")
////                          print(api?.results ?? 1)
////                          print("===========")
////                          print(api?.results[0].id ?? 2)
//
//                       }
//                       
//                       try await MainActor.run {
//                           self.api2 = try JSONDecoder().decode([API2].self, from: data)
//                           
//               
//                       }
//
//                //   }
//                   
//               }
//        }
//    @Published var api : API1?
//    @Published var api2: [API2] = []
//   
//    func search(name: String) async {
//        do {
//       // let foods = try await getFood(searchTerm: name)
//            //self.foods = foods.map(FoodViewModel.init)
//        } catch {
//            print(error)
//        }
//    }
////    func getFood(searchTerm: String) async throws {
////
////        // Create a URLComponents instance
////        var components = URLComponents()
////        // Set the scheme, host, and path for the URL
////        //components.scheme = "https"
////        //components.host = "https://api.spoonacular.com/recipes/complexSearch?apiKey=3dcc7436a1dd43e1a71b267740fafacc"
////        let urls = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=126b8c8d1d264eb1a4e79d3316e4add1&query=\(searchTerm)")
////
////        //components.path = "/recipes/complexSearch"
////
////        // Create a query item for the API key
////        //let apiKeyItem = URLQueryItem(name: "?apiKey", value: "3dcc7436a1dd43e1a71b267740fafacc")
////
////        // Set the query items for the URL
////        //components.queryItems = [apiKeyItem]
////
////        guard let url = urls else {
////            throw NetworkError.badURL
////        }
////        let (data, _) = try await URLSession.shared.data(from: url)
////        print(String(data: data, encoding: .utf8)!)
////        let foodResponse1 = try JSONDecoder().decode(API1.self, from: data)
////        let foodResponse = try JSONDecoder().decode(API2.self, from: data)
////
////
////    }
//}
//    
//
//
//struct API1 : Codable {
//    var results : [API2]
//    var offset : Int
//    var number : Int
//    var totalResults : Int
//}
//
//struct API2 : Hashable, Codable {
//    var id : Int
//    var title : String
//    var image : URL
//    var imageType : String
//}
//
//enum NetworkError: Error {
//    case badURL
//    case badID
//}
//
//
