//
//  BreakFastView.swift
//  SmartKitchen
//
//  Created by Awadh on 13/09/2023.
//

import SwiftUI
import Foundation

struct BreakFastView: View {
   // @StateObject var apiModel = ApiModel()
         @State var api : API1?
         @State var api2: [API2] = []

    @State private var searchText: String = ""
    var SQ = ""
    var body: some View {
        NavigationView{

            List(api2, id: \.id) { food in
                Text(food.title)
                
                
            }
            
                .listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    Task.init {
                        if !value .isEmpty && value.count > 3 {
                            var apiKey: String = "126b8c8d1d264eb1a4e79d3316e4add1" // Replace with your actual API key
                            
                            var searchQuery: String = value
                            
                            var apiURL: URL {
                                var urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&query=\(searchQuery))"
                                guard let url = URL(string: urlString) else {
                                    fatalError("Invalid URL")
                                }
                                return url
                            }
                           // init() {
                                api = nil
                                Task.init {
                                    //ApiModel.init()
                                    // try await print(Webservice().getFood(searchTerm: "Water"))
                                    print(apiURL)
                                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=126b8c8d1d264eb1a4e79d3316e4add1&query=Oats")!)
                                    print("got data !")
                                    //print(String(data: data, encoding: .utf8)!)
                                    print(data)
                                    try await MainActor.run {
                                        self.api = try JSONDecoder().decode(API1.self, from: data)
                                        
                                        //                          print("----------")
                                        //                          print(api?.results ?? 1)
                                        //                          print("===========")
                                        //                          print(api?.results[0].id ?? 2)
                                        
                                    }
                                    
                                    try await MainActor.run {
                                        self.api2 = try JSONDecoder().decode([API2].self, from: data)
                                        
                                        
                                    }
                                    
                               // }
                            }
                            
                        }else {
                            //api2..results.removeAll()
                        }
                    }
                }
                .navigationTitle("BreakFast")
        }
    }

    
    struct BreakFastView_Previews: PreviewProvider {
        static var previews: some View {
            BreakFastView()
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

enum NetworkError: Error {
    case badURL
    case badID
}
