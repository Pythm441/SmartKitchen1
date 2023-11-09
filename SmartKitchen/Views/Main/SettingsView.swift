//
//  SettingsView.swift
//  SmartKitchen
//
//  Created by Awadh AlMansoori on 20/08/2023.
//

import SwiftUI

struct SettingsView: View {
   
    @EnvironmentObject var themeSettings: ThemeSettings

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings")) {

                    NavigationLink("Time schedule", destination: HomeView())
                    NavigationLink("Accessibility", destination: HomeView())
                }
                
                Section(header: Text("Appearance")) {
                    Toggle("Dark Mode", isOn: $themeSettings.isDarkMode)
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
