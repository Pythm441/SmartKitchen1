//
//  MealsView.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 12/09/2023.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    NavigationLink(destination: BreakFastView()) {
                        Image("Break.i")
                    }
                    Text("Breakfast")
                        .font(.system(.title3))
                }
                .padding()
                
                VStack {
                    NavigationLink(destination: LunchView()) {
                        Image("Lunch.i")
                    }
                    Text("Lunch")
                        .font(.system(.title3))
                }
                .padding()
                
                VStack {
                    NavigationLink(destination: DinnerView()) {
                        Image("Dinner.i")
                    }
                    Text("Dinner")
                        .font(.system(.title3))
                    
                }
                .padding()
            }
            .navigationTitle("Meals")
            
            .font(.system(.largeTitle))
            .foregroundColor(.black)
        }
    }
    
    struct MealsView_Previews: PreviewProvider {
        static var previews: some View {
            MealsView()
        }
    }
}
