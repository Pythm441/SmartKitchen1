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
    @State var api3 : API3?
    @State var api4: [API4] = []
    @State private var results1: [API2] = []
    @State var resultsx: [String] = []
    @State var resultsx1: [String] = []

    
    @State private var searchText: String = ""
    //var SQ = ""
    var body: some View {
        //        NavigationView {
            //  if !api2.isEmpty {
            //     List(api4, id: \.self) { item in
        List {
            ForEach(resultsx, id: \.self) { item in
                NavigationLink(destination: RecipeDetails(selectedItemID: Int(resultsx1[resultsx.firstIndex(of: item)!]) ?? 0)) {
                    Text(item)
                }
                
            }
        }
            
                
                
                    .listStyle(.plain)
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { value in
                        if !value.isEmpty && value.count > 3 {
                            // Your API request logic goes here (similar to your existing code)
                            var apiKey: String = "3dcc7436a1dd43e1a71b267740fafacc" // Replace with your actual API key
                            
                            var searchQuery: String = value
                            
                            var apiURL: URL {
                                var urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&query=\(searchQuery)"
                                guard let url = URL(string: urlString) else {
                                    fatalError("Invalid URL")
                                }
                                return url
                            }
                            // init() {
                            api = nil
                            api3 = nil
                            Task.init {
                                //ApiModel.init()
                                // try await print(Webservice().getFood(searchTerm: "Water"))
                                print(apiURL)
                                let (data, _) = try await URLSession.shared.data(from: apiURL)
                                print("got data !")
                                //print(String(data: data, encoding: .utf8)!)
                                print(String(data: data, encoding: .utf8)!)
                                
                                
                                
                                self.api = try JSONDecoder().decode(API1.self, from: data)
                                print("1")
                                //                                                      print("----------")
                                //                                                      print(api?.results ?? 1)
                                //                                                      print("===========")
                                //                                                      print(api?.results[0] ?? 2)
                                //
                                if let results1 = api?.results {
                                    for item in results1 {
                                        print(item.title)
                                        resultsx += [item.title]
                                        resultsx1 += [String(item.id)]
                                    }
                                } else {
                                    print("The array is empty or nil.")
                                }
                                
                                
                                
                                
                                self.api2 = try JSONDecoder().decode([API2].self, from: data)
                                print("2")
                                
                                
                                
                                self.api3 = try JSONDecoder().decode(API3.self, from: data)
                                print("3")
                                
                                
                                self.api4 = try JSONDecoder().decode([API4].self, from: data)
                                print("4")
                                print("---------------------")
                                print(api4)
                                
                                
                                
                                
                            }
                            print("----------/-----------")
                            print(api4)
                        }
                        
                        else {
                            resultsx.removeAll()
                        }
                    }
                    .navigationTitle("Breakfast")
                
            }
        }
    
//        .onAppear {
//            // Assuming api?.results is of type [YourItemType]
//            if let results1 = api?.results {
//                self.results1 = results1
//            }
//        }

    
    
    struct BreakFastView_Previews: PreviewProvider {
        static var previews: some View {
            BreakFastView()
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
    
    struct API3 : Codable {
        var results : [API4]
        var offset : Int
        var number : Int
        var totalResults : Int
    }
    
    
    struct API4 : Hashable, Codable {
        var id : Int
        var title : String
    }
    
    enum NetworkError: Error {
        case badURL
        case badID
    }

