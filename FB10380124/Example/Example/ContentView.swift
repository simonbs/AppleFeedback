//
//  ContentView.swift
//  Example
//
//  Created by Simon Støvring on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Group {
                Text("Hi 👋")
                Text("")
                Text("Thanks for checking out this sample project Follow the steps below to reproduce the issue.")
                Text("")
            }
            Group {
                Text("1. Run this example project and keep the debugger attached.")
                Text("2. Open the Shortcuts app.")
                Text("3. Create a shortcut and add the example action from this app.")
                Text("4. Run the shortcut.")
                Text("")
            }
            Group {
                Text("Notice that the example project has been terminated with the error ")
                + Text("\"Fatal error: Unsupported type: Optional<IntentFile>\"")
                    .foregroundColor(.red)
                    .fontWeight(.semibold)
                    .font(.caption.monospaced())
                + Text(". It appears that an App Intent cannot return an optional IntentFile.")
                Text("")
                Text("I would expect that an App Intent can return an optional IntentFile.")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
