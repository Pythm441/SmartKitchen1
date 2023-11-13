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
                    Spacer() // Add Spacer to push the TextField and Button to the center
                    TextField("e.g 2000", text: $cals)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    // Add a style to the TextField
                    Button("Search") {
                        print(cals)
                        performAPISearch(cal: cals)
                    }
                    Spacer() // Add Spacer to push the TextField and Button to the center
                }

                // Display the search results
                List {
                    ForEach(resultsx.indices, id: \.self) { index in
                        if index < resultsx1.count {
                            let selectedItemId = Int(resultsx1[index]) ?? 0

                            NavigationLink(destination: RecipeDetails(selectedItemID: selectedItemId)) {
                                Text(resultsx[index])
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .padding() // Add padding to the VStack
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Failed to fetch recipes. Please try again."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationTitle("Favorites")
        }
    }

    private func performAPISearch(cal: String) {
        guard let calss = cal.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let apiURL = URL(string: "https://api.spoonacular.com/mealplanner/generate?apiKey=\(apiKey ?? "")&timeFrame=day&targetCalories=\(calss)"
              ) else {
            showAlert = true // Display the alert
            return // Exit the function
        }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                self.api = try JSONDecoder().decode(API1_Cal.self, from: data)

                if let results1 = api?.meals {
                    print(resultsx)
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
    var nutrients: API3_Cal
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
