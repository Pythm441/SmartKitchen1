//
//  SmartKitchenApp.swift
//  SmartKitchen
//
//  Created by Abdelrahman Hesham on 09/08/2023.
//
//New stuff!!!
import SwiftUI

@main
struct SmartKitchenApp: App {
    @StateObject private var themeSettings = ThemeSettings()
    @StateObject private var viewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            Splash()
            .environmentObject(themeSettings)
            
        }
       
    }
}

