//
//  ContentView.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var vm = ScreenCaptureViewModel()
    let gridItem: [GridItem] = [
        GridItem(.adaptive(minimum: 200, maximum: 300))
    ]
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItem) {
                    ForEach(vm.images, id: \.self) { image in
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .onDrag {
                                NSItemProvider(object: image)
                            }
                    }
                }
            }
            
            Button {
                vm.takeScreenshot()
            } label: {
                Text("Make a screenshot")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
