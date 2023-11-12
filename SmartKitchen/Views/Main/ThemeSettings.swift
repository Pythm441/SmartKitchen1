// ThemeSettings.swift
import SwiftUI

class ThemeSettings: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}
