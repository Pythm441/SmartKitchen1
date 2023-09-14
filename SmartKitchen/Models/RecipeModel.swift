//
//  RecipeModel.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import Foundation
import SwiftUI
@MainActor
class ApiModel: ObservableObject {
    let apiURL = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=126b8c8d1d264eb1a4e79d3316e4add1")!
    @Published var api : API1?
    @Published var api2: [API2] = []
    func getapi() {
        api = nil
        Task {
          let (data, _) = try await URLSession.shared.data(from: apiURL)
            print("got data !")
            print(String(data: data, encoding: .utf8)!)
           try await MainActor.run {
                self.api = try JSONDecoder().decode(API1.self, from: data)
            
               print("----------")
               print(api?.results ?? 1)
               print("===========")
               print(api?.results[0].id ?? 2)

            }
            
            try await MainActor.run {
                self.api2 = try JSONDecoder().decode([API2].self, from: data)
    
            }

        }
        
    }
    func search(name: String) async {
        do {
        let foods = try await Webservice().getFood(searchTerm: name)
            //self.foods = foods.map(FoodViewModel.init)
        } catch {
            print(error)
        }
    }
}
    


struct API1 : Codable {
    var results : [API2]
    var offset : Int
    var number : Int
    var totalResults : Int
}

struct API2 : Hashable, Codable {
    var id : Int
    var title : String
    var image : URL
    var imageType : String
}



