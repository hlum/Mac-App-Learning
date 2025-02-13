//
//  MacScreenshotApp.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI

@main
struct MacScreenshotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // Set the setting View to the macOs setting btn in the bar
        Settings {
            SettingView()
        }
    }
}
