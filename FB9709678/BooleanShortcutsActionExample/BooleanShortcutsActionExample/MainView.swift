//
//  MainView.swift
//  BooleanShortcutsActionExample
//
//  Created by Simon Støvring on 17/10/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hey 👋 Thanks for checking out the example project. Please follow these steps to reproduce the issue:")
            VStack(alignment: .leading, spacing: 10) {
                Text("1. Open the Shortcuts app.")
                Text("2. Create a new and shortcut with no actions.")
                Text("3. Add the \"Get Boolean Value\" action offered by this app.")
                Text("4. Run the shortcut with the editor open.")
                Text("5. Notice that the Shortcuts app crashed 💥")
            }
        }.padding()
    }
}
