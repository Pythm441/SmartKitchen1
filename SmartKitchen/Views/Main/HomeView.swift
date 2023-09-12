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
                VStack {
                    NavigationLink(destination: MealsView()) {
                        Image("Meal.i")
                    }
                    Text("Meals")
                        .font(.system(.title3))
                }
                .padding()
                
                VStack {
                    NavigationLink(destination: DrinksView()) {
                        Image("Drink.i")
                    }
                  Text("Drinks")
                        .font(.system(.title3))
                }
                .padding()
                
                VStack {
                    NavigationLink(destination: DessertView()) {
                        Image("Dessert.i")
                    }
                    Text("Dessert")
                    .font(.system(.title3))
                        
                }
                .padding()
            }
            .navigationTitle("Home")
               
                .font(.system(.largeTitle))
                .foregroundColor(.black)
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}

