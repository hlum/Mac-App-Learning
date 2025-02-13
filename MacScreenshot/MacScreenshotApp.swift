//
//  MacScreenshotApp.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI

@main
struct MacScreenshotApp: App {
    /*
     If the user opens another window, the data won't be sync because separated vm is created for each window
     That's why we want to create the vm when the app start and pass it to all window.
     You can also use singleton or make a dataClass and put it into the environment
     */
    @State var vm = ScreenCaptureViewModel()
    var body: some Scene {
        /*
         - WindowGroup will allow user to open multiple window
         - Use Window to allow single window
         */
        WindowGroup {
            ContentView(vm: vm)
        }
        
        // Set the setting View to the macOs setting btn in the bar
        Settings {
            SettingView()
        }
    }
}
