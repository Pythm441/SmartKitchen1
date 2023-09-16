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
    
    
    init(selectedItemID: Int) {
        self.selectedItemID = selectedItemID
        print(apiURL)
    }
    
    var body: some View {
        Text("Selected Item ID: \(selectedItemID)")
    }
    var apiURL: URL {
        var urlString = "https://api.spoonacular.com/recipes/\(selectedItemID)/card?apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        return url
            }
    
}



//}

//struct RecipeDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeDetails()
//    }
//}
