//
//  MenubarView.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/14.
//

import SwiftUI

struct MenubarView: View {
    @State var vm: ScreenCaptureViewModel
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50, maximum: 100))]) {
                    ForEach(vm.images, id:\.self) { image in
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .onDrag {
                                NSItemProvider(object: image)
                            }
                    }
                }
            }
            .contentMargins(20)
            
            HStack {
                screenshotBtn(for: .area)
                screenshotBtn(for: .full)
                screenshotBtn(for: .window)
            }
            .labelStyle(.iconOnly)
            .padding()
            
        }
        .frame(maxHeight: 200)
    }
    
    @ViewBuilder
    private func screenshotBtn(for type: ScreenshotTypes) -> some View {
        Button {
            vm.takeScreenshot(for: type)
        } label: {
            Label(type.description, systemImage: type.systemImage)
        }
    }
}

#Preview {
    MenubarView(vm: ScreenCaptureViewModel())
}
