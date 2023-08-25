//
//  TabBar.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage : "gear")
                }
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage : "house")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage : "heart")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
