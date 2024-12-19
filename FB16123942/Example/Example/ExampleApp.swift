import Observation
import SwiftUI

// ⚠️ Referencing ObservableSettings.isEnabled causes memory to pile up.
@Observable
final class ObservableSettings {
    var isEnabled = true
}

// Referencing NonObservableSettings.isEnabled causes memory usage to be stable.
final class NonObservableSettings {
    var isEnabled = true
}

@main
struct ExampleApp: App {
    private let settings = NonObservableSettings() // 👈 Use ObservableSettings or NonObservableSettings.

    var body: some Scene {
        WindowGroup {
            ContentView(settings: settings)
        }
    }
}

struct ContentView: View {
    let settings: NonObservableSettings // 👈 Use ObservableSettings or NonObservableSettings.

    @State private var date = Date()

    var body: some View {
        VStack {
            Text("Is Enabled: " + (settings.isEnabled ? "✅" : "⬛"))
            Text(date, format: .dateTime.hour().minute().second())
        }
        .task {
            while true {
                try? await Task.sleep(for: .seconds(0.01))
                date = Date()
            }
        }
    }
}
