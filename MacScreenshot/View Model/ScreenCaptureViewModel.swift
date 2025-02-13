//
//  ScreenCaptureViewModel.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI
import Foundation
import KeyboardShortcuts

@Observable
class ScreenCaptureViewModel {
    
    var images:[NSImage] = []
    
    init() {
        // Add listener to key presses
        addKeyPressedListener()
    }
    
    func takeScreenshot(for type: ScreenshotTypes){
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = type.processArguments
        do {
            try task.run()
            task.waitUntilExit()
            guard let image = getImageFromPasteboard() else { return }
            images.append(image)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func getImageFromPasteboard() -> NSImage? {
        // Check if the copied item on the pasteBoard is an Image
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes)
        else {return nil }
        
        // Take out the image from the paste board
        return NSImage(pasteboard: NSPasteboard.general)
    }
    
    private func addKeyPressedListener() {
        // Each closure will get called when that specific key pressed
        KeyboardShortcuts.onKeyUp(for: .screenshotCaptureArea) { [weak self] in
            self?.takeScreenshot(for: .area)
        }
        
        KeyboardShortcuts.onKeyUp(for: .screenshotCaptureFull) { [weak self] in
            self?.takeScreenshot(for: .full)
        }
        
        KeyboardShortcuts.onKeyUp(for: .screenshotCaptureWindow) { [weak self] in
            self?.takeScreenshot(for: .window)
        }
    }
}

enum ScreenshotTypes {
    case full
    case window
    case area
    
    var description: String {
        switch self {
        case .full:
            return "Make a full screenshot"
        case .window:
            return "Make a window screenshot"
        case .area:
            return "Make an area screenshot"
        }
    }
    
    var processArguments: [String] {
        switch self {
        case .full:
            ["-c"]
        case .window:
            ["-cw"]
        case .area:
            ["-cs"]
        }
    }
}

