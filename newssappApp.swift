//
//  newssappApp.swift
//  newssapp
//
//  Created by enes on 2.08.2024.
//

import SwiftUI

@main
struct newssappApp: App {
    @StateObject private var themeManager = ThemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                            .environmentObject(themeManager)
                            .preferredColorScheme(themeManager.colorScheme)
                    }
    }
}
class ThemeManager: ObservableObject {
    @Published var colorScheme: ColorScheme? = .light
}
