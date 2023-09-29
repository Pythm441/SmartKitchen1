//
//  RecipeDetails.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 17/09/2023.
//

import SwiftUI

struct RecipeDetails: View {
    let selectedItemID: Int
    var imageUrl: String?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl ?? "https://www.computerhope.com/jargon/e/error.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
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
