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
            Text("Hi 👋")
            Text("")
            Text("Thanks for checking out this example project. Follow the steps below to reproduce the issue.")
            Text("")
            Text("1. Open the Shortcuts app.")
            Text("2. Create a new shortcut with the Example action provided by this app.")
            Text("3. Run the shortcut")
            Text("4. Notice that no view was presented when running the shortcut even though ExampleAppIntent returns a view.")
            Text("")
            Text("I would expect Shortcuts to present a view even when it's created by a @ViewBuilder in the App Intent.")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
