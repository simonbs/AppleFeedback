import SwiftUI

struct ContentView: View {
    @State private var isModalPresented = false

    var body: some View {
        VStack(spacing: 100) {
            Text("Present the modal and notice the layout issue in the detail view.")
                .font(.title2.weight(.medium))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 375)
            Button {
                isModalPresented = true
            } label: {
                Text("Present Modal")
            }
        }
        .fullScreenCover(isPresented: $isModalPresented) {
            ModalView()
        }
    }
}

struct ModalView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
        } detail: {
            VStack {
                Text("Notice that the layout of this detail view isn't correct until the  inspector is resized.")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 375)
            }
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
            .containerBackground(.background.secondary, for: .navigation)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Close", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
            }
        }
        .inspector(isPresented: .constant(true)) {
            VStack {
                Text("Inspector")
            }
            .inspectorColumnWidth(min: 350, ideal: 400, max: 500)
        }
    }
}

#Preview {
    ContentView()
}
