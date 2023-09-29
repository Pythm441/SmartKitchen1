//
//  RecipeDetails.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 17/09/2023.
//

import SwiftUI

struct RecipeDetails: View {
    var apiKey: String = "ad6054d5e93147fca5c0a1f473f3efa6"
    let selectedItemID: Int
    var imageUrl: String?
    
    
    init(selectedItemID: Int, imageUrl: String) {
        self.selectedItemID = selectedItemID
        self.imageUrl = imageUrl
    }
    
    
    var body: some View {
        VStack {
            AsyncImage (url: URL(string: imageUrl ?? "data:image/png;base64,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")) { image in
            image
                    .resizable ()
                    .scaledToFit ()
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
    


struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(selectedItemID: 123, imageUrl: "")
    }
}

