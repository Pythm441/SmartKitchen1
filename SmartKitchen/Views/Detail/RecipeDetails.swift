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
    
    
    init(selectedItemID: Int) {
        self.selectedItemID = selectedItemID
    }
    
    var body: some View {
        VStack {
            Text("\(selectedItemID)")
        }
    }
    
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(selectedItemID: 123)
    }
}

