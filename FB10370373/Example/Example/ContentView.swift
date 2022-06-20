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
                Text("Thanks for checking out this sample project.")
                Text("")
            }
            Group {
                Text("Follow the steps below to reproduce the error.")
                Text("")
                Text("1. Close this app and navigate to the Lock Screen.")
                Text("2. Add the example widget in the inline accessory slot.")
                Text("3. Notice that the image is stretched horizontally.")
                Text("")
                Text("I expect that the image isn't stretched horizontally. This works fine for SF Symbols created with Image(systemName:) but doesn't work for custom images created with Image(_:)")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
