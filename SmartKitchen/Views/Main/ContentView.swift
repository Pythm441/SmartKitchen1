// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var themeSettings = ThemeSettings()
    
    var body: some View {
        
        TabBar()
            .environmentObject(themeSettings)
            .preferredColorScheme(themeSettings.isDarkMode ? .dark : .light)
            .id(themeSettings.isDarkMode)
        }
    }
