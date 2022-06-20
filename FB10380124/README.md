# AppIntents do not support returning an optional IntentFile

Passing an optional IntentFile as value to an IntentResult from an App Intent will cause the app to be terminated when the App Shortcut is run. The app is terminated with the error “Fatal error: Unsupported type: Optional<IntentFile>”. It appears that passing an optional IntentFile is not supported.

I’m assuming that the intention is that apps should return an error if they’re unable to pass a value to be returned, i.e. when the optional value would otherwise be nil. However, this is a problem in my app where an action can run successfully even if there is no output to be provided. Whether there’s an output or not depends on how the user have configured the Shortcuts action.

The following code snippet can be used to reproduce the runtime error. The snippet is taken from the attached example project. The attached screenshot shows the fatal error being thrown.

```swift
struct ExampleAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Example"
    static var description = IntentDescription("Runs an example shortcut.")

    static var parameterSummary: some ParameterSummary {
        Summary("Run Example")
    }

    @MainActor
    func perform() async throws -> some PerformResult {
        let outputIntenFile: IntentFile? = nil
        return .finished(value: outputIntenFile)
    }
}
```
    
![](./screenshot.png)
