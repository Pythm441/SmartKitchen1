//
//  MealsView.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 12/09/2023.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
 
            VStack{
                VStack {
                    Text("Meals")
                        
                    NavigationLink(destination:         BreakfastView()) {
                        Image("Break.i")
                    }
                    Text("Breakfast")
                        .font(.system(.title3))
                }
                
                
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
            }
            .offset(y: -30)
            .font(.system(.largeTitle))
            .foregroundColor(.black)
        }
    }
    
    struct MealsView_Previews: PreviewProvider {
        static var previews: some View {
            MealsView()
        }
    }

