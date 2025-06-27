# SwiftUI's .inspector(...) view modifier is utterly broken up through iPadOS 26 beta 2

The inspector produced by the .inspector(…) view modifier is completely broken on iPadOS 18.5, iPadOS 26 beta 2, and likely other versions too but those are the only two I’ve tested on.

After shrinking a window and then expending it again on iPadOS 18.5, the inspector disappears but iPadOS shows empty trailing panels and sheets. It's just as bad or even worse on iPadOS 26. The inspector isn't shown until the window shrinks and it disappears again when the window grows.

Please see the attached videos.

You can reproduce the issue using the attached example project that merely consists of the following few lines of code:

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
