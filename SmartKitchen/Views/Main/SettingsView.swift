// SettingsView.swift
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
