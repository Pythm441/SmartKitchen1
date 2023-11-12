//
//  FavoritesView.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import SwiftUI

struct FavoritesView: View {
    @State private var cals = ""
    @State private var api: API1_Cal?
    @State private var resultsx: [String] = []
    @State private var resultsx1: [String] = []
    @State private var searchText: String = ""
    @State private var showAlert = false // State variable to control the alert
    var body: some View {
            NavigationView {
                VStack {
                    HStack {
                        padding() // Make sure padding() is defined
                        TextField("e.g 2000", text: $cals)
                        padding()
                        Button("Search") { // Change the button label
                            print(cals)
                            performAPISearch(cal: cals)
                        }
                        padding()
                    }
                    HStack {
                        
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Failed to fetch recipes. Please try again."), dismissButton: .default(Text("OK")))
                
                }
            }
        }
    
    
    
    private func performAPISearch(cal: String) {
        // Replace with your actual API key, and consider a more secure storage option

        guard let calss = cal.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let apiURL = URL(string:
              "https://api.spoonacular.com/mealplanner/generate?apiKey=\(apiKey ?? "")&timeFrame=day&targetCalories=\(calss)"
              ) else {
            showAlert = true // Display the alert
            return // Exit the function
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                self.api = try JSONDecoder().decode(API1_Cal.self, from: data)
                
                if let results1 = api?.meals {
                    resultsx = results1.map { $0.title }
                    resultsx1 = results1.map { String($0.id) }
                    
                } else {
                    print("The array is empty or nil.")
                }
                
            } catch {
                print("Error: \(error)")
                showAlert = true // Display the alert for API request errors
            }
        }
    }
    
    
    
    
}




struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

struct API1_Cal: Codable {
    var meals: [API2_Cal]
    var nutrients: [API3_Cal]
}

struct API2_Cal: Hashable, Codable {
    var id: Int
    var imageType: String
    var title: String
    var readyInMinutes: Double
    var servings: Double
    var sourceUrl: URL
}

struct API3_Cal: Hashable, Codable {
    var calories: Double
    var protein: Double
    var fat: Double
    var carbohydrates: Double
}
