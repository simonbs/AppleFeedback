import SwiftUI

struct ContentView: View {
    @State private var isPresented = true

    var body: some View {
        NavigationStack {
            Text("Detail")
        }
        .inspector(isPresented: $isPresented) {
            List {
                Text("Inspector")
            }
        }
    }
}

#Preview {
    ContentView()
}
