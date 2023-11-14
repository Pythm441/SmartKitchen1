//
//  RecipeDetails.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 17/09/2023.
//

import SwiftUI

struct RecipeDetails2: View {
    let selectedItemID: Int
    @State private var recipeDetails: API42?
    @State var imageUrl = "imagez"
    @State private var scale: CGFloat = 1.0
    
    
    var body: some View {
       // ScrollView{
        
            VStack {
                ZStack {
                    Image("Blur2")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .clipped()
                    if let imageUrl = recipeDetails?.url {
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image
                                .resizable() // Make the image resizable.
                                .aspectRatio(contentMode: .fit) // Fill the screen while preserving aspect ratio.
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .clipped() // Clip the overflowing parts.
                                .gesture(MagnificationGesture()
                                    .onChanged { value in
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


        
   // }
        

    func fetchRecipeDetails(selectedItemID: Int) {
        
        guard let apiURL = URL(string: "https://api.spoonacular.com/recipes/\(selectedItemID)/card?apiKey=\(apiKey ?? "")") else {
            return
        }
        
        Task{
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                let decodedRecipeDetails = try JSONDecoder().decode(API42.self, from: data)
                recipeDetails = decodedRecipeDetails
            } catch {
                print("Error fetching recipe details: \(error)")
            }
        }
    }
}

struct RecipeDetails2_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(selectedItemID: 123, imageUrl: "")
    }
}

struct API42: Hashable, Codable {
    var url: String
}
