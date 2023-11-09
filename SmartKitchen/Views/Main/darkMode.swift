//
//  darkMode.swift
//  SmartKitchen
//
//  Created by Abdelrahman Hesham on 11/11/2023.
//

import Foundation
import SwiftUI

class ThemeSettings: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}
