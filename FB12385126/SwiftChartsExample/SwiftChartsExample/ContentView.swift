import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("This is a sample app demonstrating that a Swift Chart can cause the app to crash with an uncaught exception when using both the .chartXVisibleDomain(...) and .chartScrollPosition(...) view modifiers.")
                    Text("The issue does not occur for all charts but it occurs consistently for some charts, like the empty chart included in this sample.")
                    Text("Also note that the issue is not limited to empty charts. It can also occur for charts with content.")
                    Spacer().frame(height: 20)
                    NavigationLink(destination: DetailView(enableTroublesomeViewModifiers: false)) {
                        VStack {
                            Text("✅ Show Chart")
                                .font(.callout.bold())
                            Text("Selecting this does NOT cause the app to crash.")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer().frame(height: 20)
                    NavigationLink(destination: DetailView(enableTroublesomeViewModifiers: true)) {
                        VStack {
                            Text("💥 Show Chart with Troublesome View Modifiers Enabled")
                                .font(.callout.bold())
                            Text("Selecting this causes the app to crash.")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Swift Charts Example")
        }
    }
}

#Preview {
    ContentView()
}
