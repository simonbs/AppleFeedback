import SwiftUI

struct DetailView: View {
    let enableTroublesomeViewModifiers: Bool

    var body: some View {
        List {
            TimelineChart(enableTroublesomeViewModifiers: enableTroublesomeViewModifiers)
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(enableTroublesomeViewModifiers: false)
}
