import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(spacing: 44) {
            Button {

            } label: {
                Text("I'm a Button with a help text and I will show it 👍")
            }
            .help("This is my help text!")
            Text("I'm a Text with a help text and I will show it 👍")
                .help("This is my help text!")
        }
    }
}
