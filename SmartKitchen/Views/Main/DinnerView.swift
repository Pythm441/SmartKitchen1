//
//  DinnerView.swift
//  SmartKitchen
//
//  Created by Hesham Fakoush on 13/09/2023.
//

import SwiftUI

struct DinnerView: View {
    @State private var api: API1_Dinner?
    @State private var resultsx: [String] = []
    @State private var resultsx1: [String] = []
    @State private var searchText: String = ""
    @State private var showAlert = false // State variable to control the alert

    var body: some View {
        NavigationView {
            ZStack{
                Image("MyLogo") // Assuming "MyLogo.png" is in your asset catalog
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3) // Adjust the opacity as needed
                    .background(
                        Color.clear // Set the background color to clear to allow the content to be visible
                    )
                    .alignmentGuide(HorizontalAlignment.center) { d in
                        d[HorizontalAlignment.center]
                    }
                    .alignmentGuide(VerticalAlignment.center) { d in
                        d[VerticalAlignment.center]
                    }
                List {
                    ForEach(resultsx.indices, id: \.self) { index in
                        if index < resultsx1.count {
                            let selectedItemId = Int(resultsx1[index]) ?? 0
                            
                            // Use resultsx3 directly for imageUrl
                            NavigationLink(destination: RecipeDetails(selectedItemID: selectedItemId)) {
                                Text(resultsx[index])
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    if !value.isEmpty && value.count > 3 {
                        performAPISearch(query: value)
                    } else {
                        resultsx.removeAll()
                    }
                }
                .onAppear() {
                    // Additional setup code if needed
                }
                .navigationTitle("Dinner")
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid URL"),
                        message: Text("The URL for the API request is invalid. Please try again."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
    
    private func performAPISearch(query: String) {
        // Replace with your actual API key, and consider a more secure storage option
        
        guard let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let apiURL = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey ?? "")&query=\(searchQuery)&type=main_course") else {
            showAlert = true // Display the alert
            return // Exit the function
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                self.api = try JSONDecoder().decode(API1_Dinner.self, from: data)
                
                if let results1 = api?.results {
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


struct API1_Dinner: Codable {
    var results: [API2_Dinner]
    var offset: Int
    var number: Int
    var totalResults: Int
}

struct API2_Dinner: Hashable, Codable {
    var id: Int
    var title: String
    var image: URL
    var imageType: String
}


