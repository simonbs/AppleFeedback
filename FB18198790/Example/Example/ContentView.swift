import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Text("Why is this interactive?")
                    .padding(.horizontal)
                    .fixedSize()
            }
        }
    }
}

#Preview {
    ContentView()
}
