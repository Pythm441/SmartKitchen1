//
//  RecipeDetails.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 17/09/2023.
//

import SwiftUI

struct RecipeDetails: View {
    let selectedItemID: Int
    @State private var recipeDetails: API4?
    @State var imageUrl = "imagez"
    @State private var scale: CGFloat = 1.0
    
    
    var body: some View {
        ScrollView{
            VStack {
                if let imageUrl = recipeDetails?.url {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scale)
                            .gesture(MagnificationGesture()
                                .onChanged{value in
                                    scale = value.magnitude
                                    
                                }
                            )
                            
                        
                        
                        
                        
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    ProgressView()
                        .onAppear {
                            fetchRecipeDetails(selectedItemID: selectedItemID)
                        }
                }
            }
        }
    }
        

    func fetchRecipeDetails(selectedItemID: Int) {
        
        guard let apiURL = URL(string: "https://api.spoonacular.com/recipes/\(selectedItemID)/card?apiKey=\(apiKey ?? "")") else {
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                let decodedRecipeDetails = try JSONDecoder().decode(API4.self, from: data)
                recipeDetails = decodedRecipeDetails
            } catch {
                print("Error fetching recipe details: \(error)")
            }
        }
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(selectedItemID: 123, imageUrl: "")
    }
}

struct API4: Hashable, Codable {
    var url: String
}
