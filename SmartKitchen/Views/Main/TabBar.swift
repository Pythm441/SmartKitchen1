//
//  TabBar.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//
import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(0)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(1)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }

        }
    }
}

struct TabBar_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
