//
//  SettingView.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI

// Setting View for the app
struct SettingView: View {
    var body: some View {
        TabView {
            
            Tab("Keyboard", systemImage: "keyboard") {
                KeyboardShortcutSettingView()
            }
            
            Tab("Menubar Extra",systemImage: "rectangle.topthird.inset.filled") {
                MenubarSettingsView()
            }
            
        }
        .frame(minWidth: 400, minHeight: 300)
    }
}

#Preview {
    SettingView()
}
