//
//  ContentView.swift
//  SmartKitchen
//
//  Created by Abdelrahman Hesham on 09/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var themeSettings = ThemeSettings()
    var body: some View {
        TabBar()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct YourApp: App {
    @StateObject private var themeSettings = ThemeSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeSettings)
                .preferredColorScheme(themeSettings.isDarkMode ? .dark : .light)
                .id(themeSettings.isDarkMode)
        }
    }
}
