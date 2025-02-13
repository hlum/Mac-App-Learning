//
//  KeyboardShortcutsSettingView.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI
import KeyboardShortcuts

// Window that allow the user to customize the keyboard shortcuts
struct KeyboardShortcutSettingView: View {
    var body: some View {
        Form {
            KeyboardShortcuts.Recorder("Screenshot Area: ", name: .screenshotCaptureArea)
            KeyboardShortcuts.Recorder("Screenshot Window: ", name: .screenshotCaptureWindow)
            KeyboardShortcuts.Recorder("Screenshot Full Screen: ", name: .screenshotCaptureFull)
        }
        .padding()
    }
}

#Preview {
    KeyboardShortcutSettingView()
}
