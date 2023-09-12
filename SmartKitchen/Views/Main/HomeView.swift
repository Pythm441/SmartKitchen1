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
            
            NavigationLink("Meals") {
                MealsView()
            }
            .navigationTitle("Home")
            .buttonStyle(.bordered)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
