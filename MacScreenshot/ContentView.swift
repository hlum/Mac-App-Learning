//
//  ContentView.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI

struct ContentView: View {
    @State var image: NSImage?
    var body: some View {
        VStack {
            if let image = image {
                Image(nsImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
            Button {
                let task = Process()
                task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
                task.arguments = ["-cw"] //copy , window
                do {
                    try task.run()
                    task.waitUntilExit()
                    self.image = getImageFromPasteboard()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("Make a screenshot")
            }

        }
        .padding()
    }
    
    func getImageFromPasteboard() -> NSImage? {
        // Check if the copied item on the pasteBoard is an Image
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes)
        else {return nil }
        
        // Take out the image from the paste board
        return NSImage(pasteboard: NSPasteboard.general)
    }
}

#Preview {
    ContentView()
}
