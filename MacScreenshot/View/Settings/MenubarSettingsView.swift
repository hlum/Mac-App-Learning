//
//  MenubarSettingsView.swift
//  MacScreenshot
//
//  Created by Hlwan Aung Phyo on 2025/02/15.
//

import SwiftUI

struct MenubarSettingsView: View {
    @AppStorage("menuBarExtraIsInserted") var menuBarExtraIsInserted = true

    var body: some View {
        Form {
            Toggle("show menubar extra", isOn: $menuBarExtraIsInserted)
        }
    }
}

#Preview {
    MenubarSettingsView()
}
