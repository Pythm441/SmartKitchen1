//
//  FavoritesView.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
          
            VStack{
                Text("Favorites")
                Text("Hello, world")
                   
            }
            .navigationTitle("Favorites")
            
            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
