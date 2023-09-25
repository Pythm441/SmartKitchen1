//
//  RecipeDetails.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 17/09/2023.
//

import SwiftUI

struct RecipeDetails: View {
    var apiKey: String = "3dcc7436a1dd43e1a71b267740fafacc"
    let selectedItemID: Int
    
    @State private var recipeData: RecipeData? = nil
    
    init(selectedItemID: Int) {
        self.selectedItemID = selectedItemID
        self.loadData()
    }
    
    var body: some View {
        VStack {
            if let recipeData = recipeData {
                AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/5277/5277377.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                
                        } placeholder: {
                            Color.gray
                        }
                
            } else {
                ProgressView("Loading...")
            }
        }
    }
    
    private func loadData() {
        let urlString = "https://api.spoonacular.com/recipes/\(selectedItemID)/card?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(RecipeData.self, from: data)
                    DispatchQueue.main.async {
                        self.recipeData = decodedData
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(selectedItemID: 123)
    }
}

struct RecipeData: Codable {
    // Define your model properties here based on the API response
    var url: String
    var status: String
    var time: String
    
    
}



//}

//struct RecipeDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetails()
//    }
//}
