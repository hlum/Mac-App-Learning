//
//  Keyboardshortcuts+extension.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import Foundation
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let screenshotCaptureArea = Self("screenshotCaptureArea",
                                        default: .init(.three, modifiers: [.option, .command]))
    static let screenshotCaptureWindow = Self("screenshotCaptureWindow",
                                              default: .init(.four, modifiers: [.option, .command]))
    static let screenshotCaptureFull = Self("screenshotCaptureFull",
                                            default: .init(.five, modifiers: [.option, .command]))
}
