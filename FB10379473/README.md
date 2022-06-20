# Shortcuts doesn't present a view when an AppIntent uses a @ViewBuilder to create the view

Shortcuts will not present a view when the view is created using a @ViewBuilder in an App Intent. Shortcuts will not show the “Show When Run” action either. It appears that Shortcuts doesn’t recognise that the App Intent supports showing a view when the view is created using a @ViewBuilder.

The following app intent will not show a view when running through Shortcuts. This code is also included in the attached sample project.

```swift
struct ExampleAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Example"
    static var description = IntentDescription("Runs an example shortcut.")

    static var parameterSummary: some ParameterSummary {
        Summary("Run Example")
    }

    @MainActor
    func perform() async throws -> some PerformResult {
        return .finished {
            makeView(name: "Simon")
        }
    }
}

private extension ExampleAppIntent {
    @ViewBuilder private func makeView(name: String?) -> some View {
        if let name = name {
            Text("Hi \(name)!")
        } else {
            Text("Hi!")
        }
    }
}
```
