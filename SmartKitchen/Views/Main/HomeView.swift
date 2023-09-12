//
//  HomeView.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink("Meals") {
                    MealsView()
                }.padding()
                
                NavigationLink("Drinks") {
                    DrinksView()
                }.padding()
                
                NavigationLink("Dessert") {
                    DessertView()
                }.font(.system(.title))
                    .padding()
            }.navigationTitle("Home")
                .buttonStyle(.bordered)
                .font(.system(.largeTitle))
                .foregroundColor(.black)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
